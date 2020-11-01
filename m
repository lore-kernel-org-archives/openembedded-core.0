Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web08.11060.1604209305936548728
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 22:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NSZ8k+Vz;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id w11so5136541pll.8
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 22:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=eP2ltq+Gj85c6n5yKfqEORdT6Mp8OFlo6ed8JEmT8Lc=;
        b=NSZ8k+VznJrgMQv8THWDm7RIGYfzcXbSSnbQWphL9tUFcq4+VjjJGTYaMFTUveofli
         1dCeAp8EwwWsZdh5+d83AUEJQrq+WthxYQvtTk8noLTq4Mhw/os0Jl+A7gYzLpVawX86
         i/bSXhxXw4E7kx60ma3LX3lBYaWqtxOjTBswBSv9QW+nPBVDGESII0AZi70JY6JG4Jm3
         Z5QUnVY0SWRdxqCh4z/hmYDJsjOTSCgC+7tIJpDBfu0/2NlcuOWqqOwLPGlA/MeaBAYp
         H2zuWELggQ8TxKRSt+0gKNCCe/SEj8WMyApTY2/bh3eJoMnl3AIB9c02fNv7LvDskkmr
         Yhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=eP2ltq+Gj85c6n5yKfqEORdT6Mp8OFlo6ed8JEmT8Lc=;
        b=jkLNnvpOEqGYaozIAnM2ECU/UDb7Vf4A+sO2+Nab7lUQamEbju0fEjG9ZN+I5JD1y6
         d9TX9nehm4Wl9O2f9gge6x+0DqF3ybfzwGtbOUWCv+HMO3JgmHupVx5MqortDTnllZXJ
         jvqi5ke76177WNAkTERrprjqduCJe/L8Nkt472fwY4LCrVJKriU9RPo7K/AsTSuZYXdC
         VLLEhJHvGlbDsqPFPFOGieiTS/sKh1y3e5ONMMwvfE7JKp3GAtPilcGtCunYevZDDJoi
         Ugg3m5gzM7s7oJlp1dPbExJ/PJYh4If4ynxZlB6oGF3li/HGZfLEVVUJ2VwQeEB+bJ1m
         WK0A==
X-Gm-Message-State: AOAM530MDnSak+TOab5JZzBbhhs02z3Z1V/c371nacQeiEMqQCZ1HOjt
	2GbKvM9F/k4a8QPcPbA+Sqdb+ftkHbjUYw==
X-Google-Smtp-Source: ABdhPJzYPITqY6j23fSHKcoizFzOgll7M4MStWigq4mEfoy0AXgcPLYrCcPSXY4kQdj+gUxUXD64Xg==
X-Received: by 2002:a17:902:a40e:b029:d3:c6fa:2650 with SMTP id p14-20020a170902a40eb02900d3c6fa2650mr15487836plq.29.1604209305023;
        Sat, 31 Oct 2020 22:41:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::221d? ([2601:646:9200:4e0::221d])
        by smtp.gmail.com with ESMTPSA id m2sm9982480pfh.44.2020.10.31.22.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2020 22:41:44 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] resolvconf: do not install dhclient hooks
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-core@lists.openembedded.org
References: <20201030085852.18227-1-yi.zhao@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
X-Pep-Version: 2.0
Organization: HIMVIS LLC
Message-ID: <ca22dfdd-33da-f448-f21b-854c255561b4@gmail.com>
Date: Sat, 31 Oct 2020 22:41:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201030085852.18227-1-yi.zhao@windriver.com>
X-Groupsio-MsgNum: 144061
Content-Type: multipart/mixed;
 boundary="------------91EBA2BEC268C0578B885716"
Content-Language: en-US

--------------91EBA2BEC268C0578B885716
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 10/30/20 1:58 AM, Yi Zhao wrote:
> Do not install the dhclient hooks
> /etc/dhcp/dhclient-enter-hooks.d/resolvconf because the dhclient has
> been removed from oe-core.
>=20
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb b/m=
eta/recipes-connectivity/resolvconf/resolvconf_1.83.bb
> index f0ffc82241..33ee553d19 100644
> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb
> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.83.bb
> @@ -43,7 +43,7 @@ do_install () {
>  	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
>  	install -d ${D}${sysconfdir} ${D}${base_sbindir}
>  	install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
> -	cp -pPR etc/* ${D}${sysconfdir}/
> +	cp -pPR etc/resolvconf ${D}${sysconfdir}/

is this the only dir left to copy if we ignore dhcp/dhclient-enter-hooks.d=
 ?

>  	chown -R root:root ${D}${sysconfdir}/
>  	install -m 0755 bin/resolvconf ${D}${base_sbindir}/
>  	install -m 0755 bin/list-records ${D}${base_libdir}/${BPN}
>=20
>=20
>=20
>=20
>=20

--------------91EBA2BEC268C0578B885716
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------91EBA2BEC268C0578B885716--
