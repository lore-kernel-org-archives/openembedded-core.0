Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.3575.1615453339119637686
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 01:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VeD8t+CQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id w18so1577009edc.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 01:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uTUaiBS3epgkp8VRhVn+cyBAdq6lsE3ieVU0MjfO0vU=;
        b=VeD8t+CQDathOnDrWX8WyEbPtf7yJv7mXDbstma5owFqShXhAnTX2CGnvc630AKRgO
         zPN2bo3BcyExmxlEA7epzPGCzrdicmeh9AiluQTnE+q/VAtxPaH8PzkfSWrCwRKG0Fb/
         lsma/XI2YCh5OQnBYy718B0K/mtVrEjXOUHECii1OPWReESPTuqsc60AZeTcZ+0WiL1r
         pDHTNDfrPAnSVbUh7bWqEX+o9UarY8b8hpA+1/HT/8dCoKlAZJvWgZpoMRh+0Agnd44x
         SCno6JysdB9dGPHQSM50IPl/LH2DAwk/5pvwHMARVkNrDvFJ9iDrBGnlozBdx0kPXygL
         mP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uTUaiBS3epgkp8VRhVn+cyBAdq6lsE3ieVU0MjfO0vU=;
        b=YbhaULAq02I4QJ7Ylb79k17FEFJucoMhdwWSY9VYOxrhqLLb9PTe21uZgXLHFPA5YV
         lUBJWnmzqFkK86PIjzut7l1zJbp+hq/vaylqSHZe1bfGtdBVE7nwF30wwl+eJ636rwLM
         AbQHILSrqG386JuKkPRiGoL3tk5yfNO3QFEjS0Z891Ah6gt2e7vWsIlnpXzQsWtsf5z3
         +QpsdSJT9l0UC6Esvf1NB141AmUg0+7McgQwTbpuq9CYesEjYREB5aDFSi5nlhGgpgPU
         fSyIaJZRegUo4EdwRaN3eN9ADGIpNjS315VlEP6/KvdwHrkh4ITTRhUiMn1pnoQK1fvX
         3VRA==
X-Gm-Message-State: AOAM530zasBzOR00z60BEEMyXDgZiXIhRi4k3dAkfuv9oChaItkLLsv3
	GJduw54stBbcrCmtVSJ8244=
X-Google-Smtp-Source: ABdhPJyNMlwwjngl9wZ2y1emNxCYuqUCNjZJj91cTdpjMCY0j9Rx4Hzb9fDZXdTw28IYDLJgbdqSoA==
X-Received: by 2002:a05:6402:110b:: with SMTP id u11mr7726681edv.356.1615453321855;
        Thu, 11 Mar 2021 01:02:01 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id l61sm930735edl.37.2021.03.11.01.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 01:02:01 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 11 Mar 2021 10:02:00 +0100
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com,
	anibal.limon@linaro.org
Subject: Re: [OE-core] [PATCH 1/1] image.bbclass: deltask do_packagedata
Message-ID: <20210311090200.33p3mptsfwusspwa@jama>
References: <cover.1615452338.git.liezhi.yang@windriver.com>
 <25142da05a29d5782b7d9030858c54a3c55730f2.1615452338.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <25142da05a29d5782b7d9030858c54a3c55730f2.1615452338.git.liezhi.yang@windriver.com>
X-Groupsio-MsgNum: 149273
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gbqcr2yq4msczm4l"
Content-Disposition: inline

--gbqcr2yq4msczm4l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 12:46:22AM -0800, Robert Yang wrote:
> This can fix a do_package error when compile with meta-secure-core layer=
:
> http://layers.openembedded.org/layerindex/branch/master/layer/meta-secur=
e-core/
>=20
> $ bitbake kernel-initramfs
> [snip]
> WARNING:kernel-initramfs-1.0-r0 do_package: Manifest
> build/tmp-glibc/sstate-control/manifest-x86_64_x86_64-nativesdk-secure-c=
ore-image-initramfs.packagedata
> not found in intel_x86_64 corei7-64 core2-64 x86_64 allarch x86_64_x86_6=
4-nativesdk (variant '')?
> [snip]
>=20
> This is because kernel-initramfs wants to pack an initramfs image into
> kernel-initramfs.rpm which adds a dependency in kernel-initramfs.bb to d=
o this:
>=20
> d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_c=
omplete')
>=20
> This causes kernel-initramfs' do_package depends on
> ${INITRAMFS_IMAGE}:do_image_complete's do_packagedata, then we will get =
the
> error. Delete do_packagedata as other do_package relelated tasks for the=
 image
> recipe will fix the error.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

I went a bit further and inheritted nopackages, but RP mentioned that it
might be removing too much. Nothing failed with nopackages over night,
but still this smaller version will be safer as this needs to got to
gatesgarth and dunfell as well now.

> ---
>  meta/classes/image.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 41fc3291781..b5586536355 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -612,7 +612,7 @@ deltask do_populate_lic
>  deltask do_populate_sysroot
>  do_package[noexec] =3D "1"
>  deltask do_package_qa
> -do_packagedata[noexec] =3D "1"
> +deltask do_packagedata
>  deltask do_package_write_ipk
>  deltask do_package_write_deb
>  deltask do_package_write_rpm
> --=20
> 2.17.1
>=20

>=20
>=20
>=20


--gbqcr2yq4msczm4l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYEnchgAKCRA3VSO3ZXaA
HAnxAKCm31x5b+hSunLsQCFTqGsIqGRLiACfXfg7btCfQ6IJFFl+e3CX5emQWSQ=
=68fP
-----END PGP SIGNATURE-----

--gbqcr2yq4msczm4l--
