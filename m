Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.6745.1615547831146371179
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 03:17:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mRvD4dRF;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id e19so52709926ejt.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 03:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lrt53LvW7+mX/dcBCHurosXL17MRT0EoyONL4cAEiSI=;
        b=mRvD4dRF/3wa9+OhQ9t7l8bmO0gamFpWRMccpgKcY5rgCllcChDQrVhNEkek9b4MTT
         7PX7VOWItf23lIMxh3z3QO1b2uC12L7K2YvX0t0jciRXT+HX+XVCi/tUbCLzYMS0texY
         VVw11HMydfd41NyOForqiJjOTx0WThVWqXdVdVk3/8IhZFPZVWNgaXSdL9gJV3QGSgz/
         MwiXSsiTetjO6soBSJGcNjhHiQTv/IXqjsJgVw15MrQ9j8hE8wOb/VqVuUAY1BmsjaEP
         NhJNxmwoHlM9hKKPWjB++7AEVVnFMO6mYxX2yGt8cRCX0qQM5bAHvYjkLs5y1YDscE4Y
         t1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lrt53LvW7+mX/dcBCHurosXL17MRT0EoyONL4cAEiSI=;
        b=jSiho4jofevtjz1/4yv5A5TAv7nFpftMTmeRaD2sv857R3hcLeAqy/Xrj31iz9K7MC
         A+PyN3aAM46HxGWKdH0xFYLTcPh+8ZX2+kCu7wSOTnfmBcmyCkmAPGBPfuOH88ZqqP+P
         gE7fhrZYHe85n2Q4EYglzOVAd++9REndv+jMdOheoe3UeJRtLRAkOD8LS0LLd5wd8+4j
         NOwoRv/fj66QM16vpnRCtdlsDJ568BIwgB/YqpkyO4dsfJQ5sQgVXEL9VOchnFKG/R0u
         liEOZ/XzH7KwExtRp3RoC5OHMzQmA0zxlxLDiiSF6WSEpR2TRBhh6ozR72SxcsAvM6cu
         cR6Q==
X-Gm-Message-State: AOAM5331cEjNis/QZ/K+qH10VcooUKGK+s1LUlh/x5IAtKz72p/2lKAr
	lE22Z+YwfS+mu5Vc8v371TU=
X-Google-Smtp-Source: ABdhPJwD3gtfgFYfStNsmbaAbC9lKVx5gX00kWwYWEEEwd8EjMOpWHZ8YDGlshQK0zbye6BWyC3BGw==
X-Received: by 2002:a17:906:9501:: with SMTP id u1mr8087463ejx.324.1615547829617;
        Fri, 12 Mar 2021 03:17:09 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y24sm2786519eds.23.2021.03.12.03.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 03:17:08 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 12 Mar 2021 12:17:08 +0100
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org, steve@sakoman.com,
	anibal.limon@linaro.org
Subject: Re: [OE-core] [PATCH 1/1] image.bbclass: deltask do_packagedata
Message-ID: <20210312111708.zgj3qjikjcekj4y6@jama>
References: <cover.1615452338.git.liezhi.yang@windriver.com>
 <25142da05a29d5782b7d9030858c54a3c55730f2.1615452338.git.liezhi.yang@windriver.com>
 <20210311090200.33p3mptsfwusspwa@jama>
 <64d5a49eeb455d812d7d5e30dfc2c63394d97ff7.camel@linuxfoundation.org>
 <fba65a47-7d0c-e0b4-3ea8-aad55b66bd62@windriver.com>
MIME-Version: 1.0
In-Reply-To: <fba65a47-7d0c-e0b4-3ea8-aad55b66bd62@windriver.com>
X-Groupsio-MsgNum: 149342
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3vys534z6vlwzcai"
Content-Disposition: inline

--3vys534z6vlwzcai
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 03:59:20PM +0800, Robert Yang wrote:
> Hi RP,
>=20
> On 3/11/21 10:38 PM, Richard Purdie wrote:
> > On Thu, 2021-03-11 at 10:02 +0100, Martin Jansa wrote:
> > > On Thu, Mar 11, 2021 at 12:46:22AM -0800, Robert Yang wrote:
> > > > This can fix a do_package error when compile with meta-secure-core =
layer:
> > > > http://layers.openembedded.org/layerindex/branch/master/layer/meta-=
secure-core/
> > > >=20
> > > > $ bitbake kernel-initramfs
> > > > [snip]
> > > > WARNING:kernel-initramfs-1.0-r0 do_package: Manifest
> > > > build/tmp-glibc/sstate-control/manifest-x86_64_x86_64-nativesdk-sec=
ure-core-image-initramfs.packagedata
> > > > not found in intel_x86_64 corei7-64 core2-64 x86_64 allarch x86_64_=
x86_64-nativesdk (variant '')?
> > > > [snip]
> > > >=20
> > > > This is because kernel-initramfs wants to pack an initramfs image i=
nto
> > > > kernel-initramfs.rpm which adds a dependency in kernel-initramfs.bb=
 to do this:
> > > >=20
> > > > d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_im=
age_complete')
> > > >=20
> > > > This causes kernel-initramfs' do_package depends on
> > > > ${INITRAMFS_IMAGE}:do_image_complete's do_packagedata, then we will=
 get the
> > > > error. Delete do_packagedata as other do_package relelated tasks fo=
r the image
> > > > recipe will fix the error.
> > > >=20
> > > > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > >=20
> > > Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
> > >=20
> > > I went a bit further and inheritted nopackages, but RP mentioned that=
 it
> > > might be removing too much. Nothing failed with nopackages over night,
> > > but still this smaller version will be safer as this needs to got to
> > > gatesgarth and dunfell as well now.
> >=20
> > This has side effects and there was a reason this wasn't done originall=
y.=A0The
> > trouble is that nobody is testing for that, just wanting to fix the pro=
blem
> > they see. To prove this isn't straightforward, I tested this locally, c=
omparing
> > task-depends.dot from "bitbake core-image-sato -g" before and after thi=
s patch.
>=20
>=20
> If we want to avoid disconnecting them, it seems that a better way is fix=
ing
> this in the recipes which has this problem? For example, I got this error=
 in
> secure-core-image-initramfs.bb, then we can add "deltask do_packagedata" =
in the
> recipe to fix the problem.

That's what I did in initramfs-android-image (which was triggering this
for me as reported on ML)
https://github.com/shr-distribution/meta-smartphone/commit/732dd29325d882a9=
b3414764ad4c7a254dae3f03

> @Martin maybe we shouldn't backport this patch to gatesgarth or dunfell s=
ince
> it may suprise the users.

Unfortunately
https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfell&id=3De0c=
1db170fdd6c1d78fdfce017feae26c96fac29
was already backported to both gatesgarth and dunfell.

--3vys534z6vlwzcai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYEtNsgAKCRA3VSO3ZXaA
HA4BAJ0cACjZpexGkUeYcdIeRmkx6ny8+wCgj4+3ooyvMPDByji2BM0yu2PAWfc=
=EL6E
-----END PGP SIGNATURE-----

--3vys534z6vlwzcai--
