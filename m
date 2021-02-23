Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.9792.1614088264617579769
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 05:51:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g+WyXDhx;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id n1so25983635edv.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Feb 2021 05:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3vm80ixMeZPr0bOALkKtITdJa/GkBTaQvX5gF/BdgQk=;
        b=g+WyXDhxkE/O6kmvIuCMOqWOxWN89HykwcoCeQe1c7ILe6LfG2R/4b5hlGceMnOADi
         TiNmrqtUXVgPwq8jAP5YAZOSikuGVfLAJYKs0ccUmP1GDcDca0SUgbewpjFgTs7qEbF8
         4GyX7iQqJ7MqcG14aahoQ1ZZ2sbdN2oL+DSi/jYcrhsSxHB62t4vRJgTAxEQBsQdBXty
         oBE2OSH4iyjxzP/pjMFqNkR14OsfHi0oKYzJ8s9eSEUMxQC+I6rgeiaH5QtuwUFE9tG/
         X3yFp0/aQ8WleS1wGZ29ckgvHFSuY+DImhkUkTRAf9RrAzlpNYXlOwvAjaBfFSloxKZk
         62Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3vm80ixMeZPr0bOALkKtITdJa/GkBTaQvX5gF/BdgQk=;
        b=s8wudRrFFKLVut07nzfS93eRqYDVr7LTwMRSzHp0dQZIL0y5EzLyjVz2rQbC5gzVP2
         pzvfoWhXQvnqlLLbk6tZRT92b+dTGzYUdm66xRnCssdpZ7AItoknePkmxTSU5hzslJVc
         ldyFQZFH/dGhk1BhdlA3i+bOMfEnxU1ST6cjUq7juTNWjOtSgZ9O3SaglgW7Qn4JvToV
         A1mC4bvGZlKLgEtG2reDAyoAqT3vZpxv9OUwnGLoIYnMQA5STGTnDjoiTgFg0GPyt7fF
         ytIF+hEZYMgJFLFJwQwwYCpTdPZsHWTxeCCt+P/DyFVNiqoq0N4lG4tK1DGbMnpte+xB
         mDdQ==
X-Gm-Message-State: AOAM531hveNz8as+UMNkSt1z72XwcB+S49ZKNxON9Xk9aCfeguEhzu+X
	8GYwv9LTbWhmC/7vZRa82f0B2VNgGlK/aw==
X-Google-Smtp-Source: ABdhPJyVH3o2qd9RZ9fgQe0iEOrIVRiqFGVR6dp0hd7B9/ZAzm0UT3BSGEEmk79RBS8pttJReybUQw==
X-Received: by 2002:a05:6402:26d0:: with SMTP id x16mr113408edd.52.1614088263032;
        Tue, 23 Feb 2021 05:51:03 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g3sm15080868edk.75.2021.02.23.05.51.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 05:51:02 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 23 Feb 2021 14:51:01 +0100
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RFC][PATCH] sstatesig.py: show an error instead of warning when sstate manifest isn't found
Message-ID: <20210223135101.gcailiou4lhceoa7@jama>
References: <166663E8BC670D0D.6890@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <166663E8BC670D0D.6890@lists.openembedded.org>
X-Groupsio-MsgNum: 148512
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5cgto6vfoxpdxa6y"
Content-Disposition: inline

--5cgto6vfoxpdxa6y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 02:35:53PM +0100, Martin Jansa via lists.openembedd=
ed.org wrote:
> * not sure if there are some valid use-cases for missing manifest, but
>   recently I'm seeing increasing number of build failures where somethin=
g
>   from native recipe is missing (seen it with pseudo, autoconf, nodejs
>   recently) and the only indication that something is wrong (before show=
ing
>   sometimes misleading error like:
>   recipe-sysroot-native/usr/bin/node: No such file or directory
>   is this warning:
>   NOTE: Running task 7844 of 12431 (/meta-oe/meta-oe/recipes-devtools/no=
dejs/nodejs_12.20.2.bb:do_prepare_recipe_sysroot)
>   NOTE: recipe nodejs-12.20.2-r0: task do_prepare_recipe_sysroot: Starte=
d
>   WARNING: nodejs-12.20.2-r0 do_prepare_recipe_sysroot: Manifest /BUILD/=
sstate-control/manifest-x86_64_ubuntu-18.04-nodejs-native.populate_sysroot =
not found in x86_64 x86_64_ubuntu-18.04 (variant '')?
>   NOTE: Running task 7845 of 12431 (/meta-oe/meta-oe/recipes-devtools/no=
dejs/nodejs_12.20.2.bb:do_unpack)
>   NOTE: recipe nodejs-12.20.2-r0: task do_unpack: Started
>   WARNING: nodejs-12.20.2-r0 do_prepare_recipe_sysroot: Manifest /BUILD/=
sstate-control/manifest-x86_64_ubuntu-18.04-nodejs-native.populate_sysroot =
not found in x86_64 x86_64_ubuntu-18.04 (variant '')?
>   NOTE: recipe nodejs-12.20.2-r0: task do_prepare_recipe_sysroot: Succee=
ded
>=20
>   if I rebuild that native dependency, then it gets fixed and I don't
>   see these failures in clean builds (as without sstate and with empty
>   TMPDIR), only in incremental builds
>=20
> * but if there isn't valid reason for missing manifest file, then I thin=
k
>   it would be better to error early (or even bb.fatal())

Looks like this warning was first introduced in 2014:
https://git.openembedded.org/openembedded-core/commit/?id=3D79ea036de331bd=
e65a88fb777647dc099ef05acf
then extended and updated for RSS in:
https://git.openembedded.org/openembedded-core/commit/?id=3D809746f56df4b9=
1af014bf6a3f28997d6698ac78
then added for package management in:
https://git.openembedded.org/openembedded-core/commit/?id=3D85e72e129362db=
896b0d368077033e4a2e373cf9
and then unified last 2 to common function in:
https://git.openembedded.org/openembedded-core/commit/?id=3D68150bac7444f0=
89f19c789e9f6602d59f605d7a

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/lib/oe/sstatesig.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 84999ee94d..6cd6e11acc 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -453,7 +453,7 @@ def find_sstate_manifest(taskdata, taskdata2, taskna=
me, d, multilibcache):
>          manifest =3D d2.expand("${SSTATE_MANIFESTS}/manifest-%s-%s.%s" =
% (pkgarch, taskdata, taskname))
>          if os.path.exists(manifest):
>              return manifest, d2
> -    bb.warn("Manifest %s not found in %s (variant '%s')?" % (manifest, =
d2.expand(" ".join(pkgarchs)), variant))
> +    bb.error("Manifest %s not found in %s (variant '%s')?" % (manifest,=
 d2.expand(" ".join(pkgarchs)), variant))
>      return None, d2
>  
>  def OEOuthashBasic(path, sigfile, task, d):
> --=20
> 2.27.0
>=20

>=20
>=20
>=20


--5cgto6vfoxpdxa6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYDUIQwAKCRA3VSO3ZXaA
HIyNAJ92uF8HaH/TWtfKk5b9eWxz38UjVwCgpadGw+TZ4oTWtwIvdvOS+Q9sWPo=
=BMfA
-----END PGP SIGNATURE-----

--5cgto6vfoxpdxa6y--
