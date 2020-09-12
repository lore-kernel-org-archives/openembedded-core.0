Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web11.9941.1599875293679529712
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2020 18:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oE5eND7A;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id 34so7715109pgo.13
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2020 18:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=vAT1WVdF802s8B84+VaPEtQv9Z8DMOOcWwZVChulFM4=;
        b=oE5eND7AE/CzbJRUtSZCW/0aeR43PRLqS2me5ikZNEisY0s3s3Z49eZlNDnUxig8vp
         4J8NH0yy9AWCFROpavzPJOaTJ9XyTuyYy6dgQQHFOvDaeMX65Lw/VHL+wP1UAuvehKAD
         Fg5R0G1JhsI5qJrkXw99RW/NgdDjKNa5wj9FP8UI1NC2KJdZhACMUJowhmJVg8at/wq6
         +ZyMCcwwRUmaOZbR5uGo6o0gpsyUtlms3ZtPcyK2Z8A5GfYWjRDfRBe8JLKahTFW0IiE
         PHZVTbn5MVTWxkWoUqvZe0fFcMOd/jnIC5JgzzA4yl/iGrpCvmZJrlZHPDJQn2UdRDjH
         f5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=vAT1WVdF802s8B84+VaPEtQv9Z8DMOOcWwZVChulFM4=;
        b=WIw5IPIHoM+eGcqGaNlAojYgOYMHaRtnUyDEaD28US2lvR6+31Y8gqPXh/uyE5vckq
         ngra7ekZDejKgR8rn2mvKqpRsl+gmcD5M3zNPhQ2y7xgAwqY8yFqg6QQe23ikM2nD0Ud
         Tj8SAaVz5wdQHI3cQt05HMMgC0f5KVsR5tDKsm15ed+BN/0t+1mp+bSFtQtRCCbDjhJd
         eNF12gVxPL+gXl6oEezqvtTnJF3dUI//dqy9y82pKoRzOkh5VRCd76eeg2c2oxIpvqfa
         yQTUFBMBKIuHW49xQomRXuRHXOPNTa6FvJTum/hyYYOCCzF95X16nkuzmyrYmaK/ETz+
         6nPQ==
X-Gm-Message-State: AOAM533dSUuk68DpDMg3P+eLfn8ciT4kMCpvtPGE1B7EesfNE4B3AdS3
	hxORYqBs5LqpbJgkPvsmCiPpp4G4NNuQBQ==
X-Google-Smtp-Source: ABdhPJx7ILq0RduliZe85ZKqiBKR8Awd8nkw5fEoO4clIVJKDDoKjiy5lvgsuam+NfBgyMCoQed/Vg==
X-Received: by 2002:a63:510d:: with SMTP id f13mr3644036pgb.21.1599875292925;
        Fri, 11 Sep 2020 18:48:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::6014? ([2601:646:9200:4e0::6014])
        by smtp.gmail.com with ESMTPSA id fu11sm2851092pjb.47.2020.09.11.18.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 18:48:12 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] Revert "systemd-serialgetty: Fix sed expression quoting"
To: Geoff Parker <geoffhp@gmail.com>, openembedded-core@lists.openembedded.org
References: <20200912001721.12801-1-geoffhp@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
X-Pep-Version: 2.0
Organization: HIMVIS LLC
Message-ID: <60325573-f2e2-0776-ceea-49d79043a6e9@gmail.com>
Date: Fri, 11 Sep 2020 18:48:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200912001721.12801-1-geoffhp@gmail.com>
X-Groupsio-MsgNum: 142448
Content-Type: multipart/mixed;
 boundary="------------A04D5EC169D2261922E355B1"
Content-Language: en-US

--------------A04D5EC169D2261922E355B1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

instead of revert can you try double quotes?

e.g.
sed -i -e "s/\@BAUDRATE\@/$default_baudrate/g" ....

On 9/11/20 5:17 PM, Geoff Parker wrote:
> From: Geoff Parker <geoffhp@gmail.com>
>=20
> This reverts commit 12d0fdd9c990bdc67bf6c8fd2d269cb766069ea5.
>=20
> Adding quotes around sed string treats $default_baudrate as a literal
> rather than a variable substitution in the do_install function.
> Breaks the systemd serial-getty@.service file and
> serial console getty.
>=20
> serial-getty@.service was getting a line which looked like this:
>=20
>   ExecStart=3D-/sbin/agetty -8 -L %I $default_baudrate $TERM
>=20
> Rather than:
>=20
>   ExecStart=3D-/sbin/agetty -8 -L %I 115200 $TERM
>=20
> Signed-off-by: Geoff Parker <geoffhp@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd-serialgetty.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/rec=
ipes-core/systemd/systemd-serialgetty.bb
> index 059fccc2b6..044c6c5b67 100644
> --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
> +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
> @@ -21,7 +21,7 @@ do_install() {
>  	=09install -d ${D}${systemd_unitdir}/system/
>  	=09install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
>  	=09install -m 0644 ${WORKDIR}/serial-getty@.service ${D}${systemd_unit=
dir}/system/
> -	=09sed -i -e 's/\@BAUDRATE\@/$default_baudrate/g' ${D}${systemd_unitdi=
r}/system/serial-getty@.service
> +	=09sed -i -e s/\@BAUDRATE\@/$default_baudrate/g ${D}${systemd_unitdir}=
/system/serial-getty@.service
>  
>  	=09tmp=3D"${SERIAL_CONSOLES}"
>  	=09for entry in $tmp ; do
>=20
>=20
>=20
>=20

--------------A04D5EC169D2261922E355B1
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------A04D5EC169D2261922E355B1--
