Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.7885.1615811492965659966
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 05:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aquE9nLN;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id e9so5600046wrw.10
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 05:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=I9R5/sPqLf9RyCGxUEqiQqWCJjKcNP7ffsiHgs0OQRE=;
        b=aquE9nLNemU2ZtsRi0Vi2D0wifO3qCZBQMK5X8m7a0RCWkOZbqiN0+w4dvmGVk7vzH
         2k2qZIeQYw/9R5r07dq9K5XwFQTR1VykCrv0ibPU8m3h9byUPIxMlFrVyQRyiJjDrQyY
         98XcrJ5IQMs2K9sdUf0nX11xSB8hHPySneKZUecWTqaebZj5sgcg73Jpgi/7TrL0wno7
         YDvnFY6U++V+IxWbeUTem7x7q/XZ9aTXw0mKmAVEWqRNwF4K4iJ4RbaojX8vrGZxNdz9
         iqe9s/wXO4Zn3/jwEBYB4GH81rWmnnEq3hRJZZ+1t2wIjjfA1kLIjqEg2guJhJuEU9Dn
         IZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I9R5/sPqLf9RyCGxUEqiQqWCJjKcNP7ffsiHgs0OQRE=;
        b=m0Aarg6IVNzhsMH9CvhOwS+UHitJq9Kv+l1DMhJuy3VrLV4oJH1ux9uGN5+tbU4Fzg
         apIbUrRghiAw5Lc8ubHNf8/rXT41nK0VXkSvAVA6lrHmn/1Boo+PEaQSFXpxi9faeYw8
         d6cP1c7YNPWb+fHVBKfH9ek8jYZaSofLXHeuHtKNbs/7BMipeFXd8icFEOEC0jbDM/64
         79DFye0nBpVrMwWhunP3nBqtg/CMazpFA3IHHjRByEPUoqcuUo/43lmEtzDpuOvKsKtg
         HQNqUN2oHlACjwnoGN+CMMdeYDyIH1E3am0gn9wFCYrr0S5o6NUgclkZ3RO8gPKYamOA
         eXWA==
X-Gm-Message-State: AOAM531xAByP5pmqivPl244QaSMOgg9/NtEnS1pHFM7Jrp+kaXNLn3Ta
	XqKh6NN+3WjMUBNqPdy8hM4u8gNzUxQ=
X-Google-Smtp-Source: ABdhPJyzOSdvE1CMcLHEjruARf79EzZjTCfbeK9GXrOLHM3DREGHZVIXkstwjup1n7w/3tqfZI8PdA==
X-Received: by 2002:adf:f743:: with SMTP id z3mr27140039wrp.304.1615811491303;
        Mon, 15 Mar 2021 05:31:31 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j30sm20676457wrj.62.2021.03.15.05.31.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 05:31:30 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 15 Mar 2021 13:31:30 +0100
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RFC][PATCH] sstatesig.py: show an error instead of warning when sstate manifest isn't found
Message-ID: <20210315123130.6x7eeyfosk5dyhw7@jama>
References: <166663E8BC670D0D.6890@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <166663E8BC670D0D.6890@lists.openembedded.org>
X-Groupsio-MsgNum: 149455
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z5zctkbkpoakkxov"
Content-Disposition: inline

--z5zctkbkpoakkxov
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

FYI:

With bb.fatal() I'm using for my builds I got few more failures now
(which might have been silently ignored like nodejs-native in example
before), this time it was
image.do_prepare_recipe_sysroot:
  ERROR: Manifest TOPDIR/BUILD/sstate-control/manifest-x86_64_ubuntu-18.04=
-bmap-tools-native.populate_sysroot not found in x86_64 x86_64_ubuntu-18.04=
 (variant '')?

linux-yocto.do_validate_branches
  ERROR: Manifest TOPDIR/BUILD/sstate-control/manifest-x86_64_ubuntu-18.04=
-kern-tools-native.populate_sysroot not found in x86_64 x86_64_ubuntu-18.04=
 (variant '')?
u-boot.do_prepare_recipe_sysroot
  ERROR: Manifest TOPDIR/BUILD/sstate-control/manifest-x86_64_ubuntu-18.04=
-kern-tools-native.populate_sysroot not found in x86_64 x86_64_ubuntu-18.04=
 (variant '')?
busybox.do_prepare_recipe_sysroot
  NOTE: Direct dependencies are ['TOPDIR/oe-core/meta/recipes-devtools/gcc=
/gcc-cross_10.2.bb:do_populate_sysroot', 'TOPDIR/oe-core/meta/recipes-devto=
ols/gcc/gcc-runtime_10.2.bb:do_populate_sysroot', 'TOPDIR/oe-core/meta/reci=
pes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot', 'TOPDIR/o=
e-core/meta/recipes-core/systemd/systemd-systemctl-native.bb:do_populate_sy=
sroot', 'TOPDIR/oe-core/meta/recipes-kernel/kern-tools/kern-tools-native_gi=
t.bb:do_populate_sysroot', 'TOPDIR/oe-core/meta/recipes-core/glibc/glibc_2.=
33.bb:do_populate_sysroot', 'virtual:native:TOPDIR/oe-core/meta/recipes-dev=
tools/icecc-create-env/icecc-create-env_0.1.bb:do_populate_sysroot', 'virtu=
al:native:TOPDIR/oe-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_popu=
late_sysroot', 'TOPDIR/oe-core/meta/recipes-core/libxcrypt/libxcrypt_4.4.18=
.bb:do_populate_sysroot']
  ERROR: Manifest TOPDIR/BUILD/sstate-control/manifest-x86_64_ubuntu-18.04=
-kern-tools-native.populate_sysroot not found in x86_64 x86_64_ubuntu-18.04=
 (variant '')?

gstreamer1.0-plugins-base.do_prepare_recipe_sysroot
  ERROR: gstreamer1.0-plugins-base-1.18.3-r0 do_prepare_recipe_sysroot: Ma=
nifest TOPDIR/BUILD/sstate-control/manifest-x86_64_x86_64-nativesdk-iso-cod=
es.populate_sysroot

And the issue with kern-tools-native was reproduced in 3 different workspa=
ces on different builders
which don't share the same SSTATE_MIRROR.

I'll try to debug what happened in these cases, but it was again on jenkin=
s where the workspace
was already overwritten by some other builds and the evidence might be los=
t already and last time
I've tried to reproduce this locally it never failed.

I'm pretty sure that previous successful build which left the TMPDIR as we=
ll as SSTATE_DIR populated was
based on oe-core b27bff26a9 (+ some local modifications) and the current f=
ailing once is
69f8f3e213 (+ similar local modifications), and the git log shows that bma=
p-tools, kern-tools
and iso-codes were updated in this:

$ git log --oneline b27bff26a9..69f8f3e213 | tee
69f8f3e213 bmap-tools: upgrade 3.5 -> 3.6
09cfa5ce1e spirv-tools: Replace strncpy with memcpy
f939624981 local.conf.sample.extended: sample value for SDK_PS1
81ed52f245 toolchain-scripts.bbclass: customize prompt string for SDKs
1d19b16846 sanity.bbclass: Add az fetcher to accepted URI protocols for mi=
rrors sanity
7639ffed1a iso-codes: upgrade 4.5.0 -> 4.6.0
ad4e023bb3 help2man: upgrade 1.48.1 -> 1.48.2
a7d7c1412b sysklogd: upgrade 2.2.1 -> 2.2.2
d34cc88cb7 python3-zipp: upgrade 3.4.0 -> 3.4.1
27da7a57b0 python3-pygments: upgrade 2.8.0 -> 2.8.1
9f8d049dbb runqemu: modify novga to conform to documentation
9dea4cd2f9 runqemu: correct forcing of ttyS0
695c98b652 runqemu: add QB_GRAPHICS
7290b77348 meta/recipes-devtools: Add HOMEPAGE / DESCRIPTION
5ab087950c meta/recipes-graphics: Add HOMEPAGE / DESCRIPTION
ab7a945f6e meta/recipes-multimedia: Add HOMEPAGE / DESCRIPTION
693988ec42 meta/recipes-kernel: Add HOMEPAGE / DESCRIPTION
325db7fea1 meta/recipes-support: Add HOMEPAGE / DESCRIPTION
ffdce193f3 ffmpeg: upgrade 4.3.1 -> 4.3.2
07c09631d8 linux-yocto/qemuarmv5: fix configuration warning
7a48aad3d3 linux-yocto/5.10: update to v5.10.21
eea536b436 kern-tools: symbol-why fix and README update
820b552341 linux-yocto/5.4: update to v5.4.103
f9a5dc7eeb parselogs: Allow expected kernel messages for qemuppc64
be3a6b9791 inittab: Add getty launch on hvc0 for qemuppc64
13bc8fa9d7 formfactor: Add machine config for qemuppc64
3a741b0f39 linux-yocto: Enable powerpc64le QEMU
68275b25f0 qemuppc64: Add a QEMU machine definition for ppc64
20d9e13372 qemu: fix CVE-2021-20203
5610a5b4ef machine: Initial commit of qemuriscv32
8a40989f03 linux-yocto: Add qemuriscv32 as a compatible machine
22691df60a openssl: Enable building for RISC-V 32-bit
74e5c43802 buildstats.bbclass: improve timeout handling

At least I'm seeing this only with master, I'm using the same bb.fatal in =
dunfell and gatesgarth
based builds and so far those triggered only the issue with initramfs disc=
ussed in the other thread.

It might be just being more lucky as there are fewer changes in dunfell/ga=
tesgarth compared with
master.

Cheers,

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


--z5zctkbkpoakkxov
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYE9ToAAKCRA3VSO3ZXaA
HDqbAJ9nHLLsEAlwZx4D5ngyDhhHMjm/tACdHdwOygR/BswJD+zKx4kbyn03nBQ=
=flMC
-----END PGP SIGNATURE-----

--z5zctkbkpoakkxov--
