Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web11.9938.1599875283499175761
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2020 18:48:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C02KbE7m;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id b17so2517208pji.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2020 18:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=9itwu29XcbiQHyPqmyDnkriRh4dJFilVHJfGbOiNfmk=;
        b=C02KbE7mqK/FF4tQ8wuTUvWWNA97gmqVLeC+tgc3Ah+6PWSjxz/RG6X7l/zJN2AeMP
         25cGwkErrxb3h1a/acqXHMxhKcwC0fl/o6uBY/+ol07EavFBMOQuHHeXklCf164XFyrP
         ql22GULFDCjzcmScooaeENEj8PjGgzv/2q4sbvJioPISC3Itc9y9x3C7vwI2FRkqKOwK
         0Tve87v3JQfBfGpkPH8kLbQqUesSjoxVUn4tTjouNlWBNCxid/rAe64ZeAsFw7i+xqQx
         u95HM4Lj7yetDISk4Hz/D6NgZw0A15sguQbRwIxYIYsnpMfv4FX8Hjhb1Nxf9b6F9kHn
         47lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=9itwu29XcbiQHyPqmyDnkriRh4dJFilVHJfGbOiNfmk=;
        b=RH+stXVRyzPIAKfQxoKy9I0qUbKK16sr/Q7+jIpAdPxpV4gDCj7vKY2u2SCPzbB+Qp
         DJ+CmbecWsKMFr7oHQTQ8mUeAunKlEmkGkMuOuvPKeG7bG1rn63g6hshj7fJmK3ayJU+
         +eSeTEqyl5HPMcMBSmVDxNPyoMXOOKKd2U93JWjYAIS9eFJGZtJAlPT3HIIMyV3IBDo9
         z4sYd7rH3nE1sOJDuzfhVG8FOPLSmDpQDNM6+XpCcSo33RarChF501JwtcH/BKfqcsIc
         BAA2u9kxvZlpijYAAs6FSYdEAePWimOg+fOlQ9e6C8YEqVj56XEa9dekXrK4gVEU/tC5
         aIjQ==
X-Gm-Message-State: AOAM533vRZpYMPAFgafcOV+CIq/Wrpy4S3Lc9sQXDpybNtU5u+/albni
	d9SYKLWsYN+WwsSiXWA8G9ep9odTfuF3PQ==
X-Google-Smtp-Source: ABdhPJykzYxg/ZUzRLaU9zv/xnVc4d9cWsjjOW1Phk7hyv1pSvpUumG638EhgdzEJp6Uw2ulbh4ALg==
X-Received: by 2002:a17:902:7085:b029:d1:9bd3:676e with SMTP id z5-20020a1709027085b02900d19bd3676emr4786734plk.24.1599875282558;
        Fri, 11 Sep 2020 18:48:02 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::6014? ([2601:646:9200:4e0::6014])
        by smtp.gmail.com with ESMTPSA id p68sm3338208pfb.40.2020.09.11.18.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 18:48:02 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] Revert "systemd-serialgetty: Fix sed expression quoting"
To: Geoff Parker <geoffhp@gmail.com>, openembedded-core@lists.openembedded.org
References: <20200912001721.12801-1-geoffhp@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
X-Pep-Version: 2.0
Organization: HIMVIS LLC
Message-ID: <b8c653ee-12e4-5212-3cb4-446446f3ab92@gmail.com>
Date: Fri, 11 Sep 2020 18:48:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200912001721.12801-1-geoffhp@gmail.com>
X-Groupsio-MsgNum: 142447
Content-Type: multipart/mixed;
 boundary="------------B577C67C7A5D10E487880772"
Content-Language: en-US

--------------B577C67C7A5D10E487880772
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

instead of revert can you try double quotes?

e.g.
sed  -e "s/\@BAUDRATE\@/$default_baudrate/g" ....

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

--------------B577C67C7A5D10E487880772
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------B577C67C7A5D10E487880772--
