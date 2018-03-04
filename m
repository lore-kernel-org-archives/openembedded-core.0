Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 768D260291
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 16:22:13 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x7so11142163wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 08:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=DnK+VnYmJo9GFYzOn2zVyaBSnqJpbFIB/wboxhK8QRs=;
	b=cCstBe+pFlwmMgpLZYOqnIuOf+IlszxMMcN9H2eXJpOxh94hM1fPB1LIFi6/5Bcjni
	Uk917g+zyjOY7vB6m1nzXUXnG6LkJDLJ6eG/P+Am77JQgRHy/97AQjMI0ggAhznscDda
	X63LXJUvPVf87Y3ylsyZgpE6z9Hrf9DkciGrz9EGj5Ta5ilFrFjvDJ30gucxIvh0EQQu
	Btae/PHZJkqjYC+kxexRkfm5mrTksC0WD2kfDmfUfcs5x0nRRpxqsSCkFrtfcoSbxIB2
	i836d2uPrr6uP7+rTNf1SfpM1X6lVbO7vMYIElxCGN2F6iWnASFi0EOhQ6SpY8z8nhpX
	QgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=DnK+VnYmJo9GFYzOn2zVyaBSnqJpbFIB/wboxhK8QRs=;
	b=AiOUoZVyQTIFHtMrRjTI9xWkj7DSecc5If7VLcTUSSYErlRWPYjyL3g+zi2ePaffUj
	yVngUBC7GXYSsA1dELL/OtvdVMFV/RQmVNobbFrF9RoNvC1RlwTukyP19Oang7aYCwt2
	iC5A2Qq5JLS2ZeDpzsBAzlSxK/Mdb7Lev8l685/dxAdbOnu43AHL6x3uGXrGAZQD2y44
	1oaSn/FLjkcJdT7J+wYBJpxuLKQPd2hd8xkRHjjzbIH7OMZEuT+Ha/cdm3ndcnBEmul2
	c+mBahQLI4lgmxzU1WSYrtM3LEMZ74w5RZeekNA19RlvZfYZBnYBj1qpsRsyaWxd9lYK
	rNMA==
X-Gm-Message-State: AElRT7E9K7GFFonvR6hAWNpdEUHOF18Gx8KZrI+VcMXLd9DyeQ/JiO9d
	ii3mnFfOvA2f22RZd/Ty77Q=
X-Google-Smtp-Source: AG47ELumpmZzrOpDLZCFAGeFjmKAlmzHXZPSc/025wrlLztXwevCE2TIBWGwsexfZh9c+KC3YfHWIQ==
X-Received: by 10.28.160.26 with SMTP id j26mr5718856wme.76.1520180534160;
	Sun, 04 Mar 2018 08:22:14 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 198sm9784569wmg.8.2018.03.04.08.22.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 04 Mar 2018 08:22:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 4 Mar 2018 17:22:16 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20180304162216.GC1370@jama>
References: <1520162492-29839-1-git-send-email-richard.purdie@linuxfoundation.org>
	<20180304141538.GB1370@jama>
MIME-Version: 1.0
In-Reply-To: <20180304141538.GB1370@jama>
User-Agent: Mutt/1.9.3 (2018-01-21)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][morty] gcc6: Upgrade to 6.4.0 (latest stable series release)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Mar 2018 16:22:13 -0000
X-Groupsio-MsgNum: 108822
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OBd5C1Lgu00Gd/Tn"
Content-Disposition: inline

--OBd5C1Lgu00Gd/Tn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 04, 2018 at 03:15:38PM +0100, Martin Jansa wrote:
> On Sun, Mar 04, 2018 at 11:21:32AM +0000, Richard Purdie wrote:
> > From: Juro Bystricky <juro.bystricky@intel.com>
> >=20
> > Changed BINV and PV from 6.2.0 to 6.4.0
> > Modified BASEURI to load xz tarball instead of bz2
> >=20
> > Backported series of patches from https://github.com/hjl-tools/gcc.git
> > branch /hjl/indirect/gcc-6-branch/master which contains
> > an IA patch series for security related issues
> >=20
> > ubsan-fix-check-empty-string.patch : removed, already applied
>=20
> Very limited testing with this change in morty shows that raspberrypi3
> (cortexa7hf-neon-vfpv4) build of glibc-initial fails with:
>=20
> configure:5344: checking for broken __attribute__((alias()))
> configure:5359: arm-oe-linux-gnueabi-gcc  -march=3Darmv7ve -marm
> -mfpu=3Dneon-vfpv4  -mfloat-abi=3Dhard -mcpu=3Dcortex-a7
> --sysroot=3Dsysroots/raspberrypi3-tcbootstrap
> -Werror -S conftest.c -o conftest.s 1>&5
> conftest.c:1:0: error: switch -mcpu=3Dcortex-a7 conflicts with
> -march=3Darmv7ve switch [-Werror]
>          extern int foo (int x) __asm ("xyzzy");
>=20
> cc1: all warnings being treated as errors
> configure:5362: $? =3D 1
> configure:5372: result: yes
> configure:5375: error: working alias attribute support required
>=20
> Which is a bit strange as armv7ve was added to resolve this error with
> -mcpu=3Dcortexa7 and -march=3Darmv7a in:
>=20
> commit 35392025f3236f5e5393f9cf0857732da9a2e503
> Author: Martin Jansa <Martin.Jansa@gmail.com>
> Date:   Tue Oct 6 17:08:59 2015 +0200
>=20
>     arch-armv7ve: add tune include for armv7ve and use it from cortexa7
> and cortexa15
>    =20
>     * be aware that this -march value is available only in gcc-4.9 and
>       newer:
>       https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D57907
>     * -mcpu=3Dcortex15 and -mcpu=3Dcortexa7 conflict with -march=3Darmv7a
>       We either have to stop putting -march in default CCARGS or at
>       least set it compatible one like this patch does.
>=20
> Regards,

It seems to be known regression in 6.4, with fix available here:
https://patchwork.ozlabs.org/patch/835592/

There are some smaller differences between 6.4 in morty-next and
pyro-next:

docker-shr @ ~/openembedded-core $ diff -uNr meta/recipes-devtools/gcc-mort=
y/gcc-6.4.inc meta/recipes-devtools/gcc-pyro/gcc-6.4.inc
--- meta/recipes-devtools/gcc-morty/gcc-6.4.inc 2018-03-04 16:13:05.8230879=
89 +0000
+++ meta/recipes-devtools/gcc-pyro/gcc-6.4.inc  2018-03-04 16:12:48.7710888=
58 +0000
@@ -71,16 +71,20 @@
            file://0038-Search-target-sysroot-gcc-version-specific-dirs-wit=
h.patch \
            file://0039-Fix-various-_FOR_BUILD-and-related-variables.patch \
            file://0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
-           file://0041-ssp_nonshared.patch \
+           file://0041-Add-ssp_nonshared-to-link-commandline-for-musl-targ=
e.patch \
            file://0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch \
            file://0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map=
=2Epatch \
            file://0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sour=
c.patch \
            file://0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch \
            file://0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.pa=
tch \
            file://0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead=
-.patch \
+           file://0048-sync-gcc-stddef.h-with-musl.patch \
+           file://0054_all_nopie-all-flags.patch \
+           file://0055-unwind_h-glibc26.patch \
            ${BACKPORTS} \
 "
 BACKPORTS =3D "\
+           file://CVE-2016-6131.patch \
            file://0001-i386-Move-struct-ix86_frame-to-machine_function.pat=
ch \
            file://0002-i386-Use-reference-of-struct-ix86_frame-to-avoid-co=
p.patch \
            file://0003-i386-Use-const-reference-of-struct-ix86_frame-to-av=
o.patch \
@@ -94,6 +98,7 @@
            file://0011-i386-Update-mfunction-return-for-return-with-pop.pa=
tch \
            file://0012-i386-Add-TARGET_INDIRECT_BRANCH_REGISTER.patch \
 "
+
 SRC_URI[md5sum] =3D "11ba51a0cfb8471927f387c8895fe232"
 SRC_URI[sha256sum] =3D "850bf21eafdfe5cd5f6827148184c08c4a0852a37ccf36ce69=
855334d2c914d4"
=20
Bigger difference between pyro-next and master 84d6be8ceb14b418b059212108c5=
a71a5950e6c3 (just before 6.4 was removed):

--- meta/recipes-devtools/gcc-morty/gcc-6.4.inc 2018-03-04 16:13:05.8230879=
89 +0000
+++ meta/recipes-devtools/gcc-master-84d6be8ceb14b418b059212108c5a71a5950e6=
c3/gcc-6.4.inc       2018-03-04 16:14:45.771082894 +0000
@@ -32,12 +32,6 @@
 SRC_URI =3D "\
            ${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
-           file://0002-uclibc-conf.patch \
-           file://0003-gcc-uclibc-locale-ctype_touplow_t.patch \
-           file://0004-uclibc-locale.patch \
-           file://0005-uclibc-locale-no__x.patch \
-           file://0006-uclibc-locale-wchar_fix.patch \
-           file://0007-uclibc-locale-update.patch \
            file://0008-missing-execinfo_h.patch \
            file://0009-c99-snprintf.patch \
            file://0010-gcc-poison-system-directories.patch \
@@ -78,21 +72,15 @@
            file://0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch \
            file://0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.pa=
tch \
            file://0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead=
-.patch \
+           file://0048-sync-gcc-stddef.h-with-musl.patch \
+           file://0054_all_nopie-all-flags.patch \
+           file://0055-unwind_h-glibc26.patch \
+           file://0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-=
f.patch \
            ${BACKPORTS} \
 "
 BACKPORTS =3D "\
-           file://0001-i386-Move-struct-ix86_frame-to-machine_function.pat=
ch \
-           file://0002-i386-Use-reference-of-struct-ix86_frame-to-avoid-co=
p.patch \
-           file://0003-i386-Use-const-reference-of-struct-ix86_frame-to-av=
o.patch \
-           file://0004-x86-Add-mindirect-branch.patch \
-           file://0005-x86-Add-mfunction-return.patch \
-           file://0006-x86-Add-mindirect-branch-register.patch \
-           file://0007-x86-Add-V-register-operand-modifier.patch \
-           file://0008-x86-Disallow-mindirect-branch-mfunction-return-with=
-.patch \
-           file://0009-Use-INVALID_REGNUM-in-indirect-thunk-processing.pat=
ch \
-           file://0010-i386-Pass-INVALID_REGNUM-as-invalid-register-number=
=2Epatch \
-           file://0011-i386-Update-mfunction-return-for-return-with-pop.pa=
tch \
-           file://0012-i386-Add-TARGET_INDIRECT_BRANCH_REGISTER.patch \
+           file://CVE-2016-6131.patch \
+           file://0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peep=
h.patch \
 "
 SRC_URI[md5sum] =3D "11ba51a0cfb8471927f387c8895fe232"
 SRC_URI[sha256sum] =3D "850bf21eafdfe5cd5f6827148184c08c4a0852a37ccf36ce69=
855334d2c914d4"
@@ -136,8 +124,6 @@
     gcc_cv_libc_provides_ssp=3Dyes \
 "

-EXTRA_OECONF_append_libc-uclibc =3D " --disable-decimal-float "
-
 EXTRA_OECONF_PATHS =3D "\
     --with-gxx-include-dir=3D/not/exist{target_includedir}/c++/${BINV} \
     --with-sysroot=3D/not/exist \  =20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OBd5C1Lgu00Gd/Tn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWpwdNwAKCRA3VSO3ZXaA
HPioAJ9gfVyOHZveyGMXubhDEgIWcxjI5wCfYPeMEJNfAwMbmLav+8ww0qbluQY=
=q7yM
-----END PGP SIGNATURE-----

--OBd5C1Lgu00Gd/Tn--
