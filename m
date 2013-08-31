Return-Path: <baker@usgs.gov>
Received: from smtp6.doi.gov (SMTP6.doi.gov [137.227.28.12])
	by mail.openembedded.org (Postfix) with ESMTP id E225F6BDDA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2013 06:57:56 +0000 (UTC)
Received: from smtp8.smgr.doi.gov (10.10.28.14) by smtp6.doi.gov (10.10.28.22)
	with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Sat, 31 Aug 2013 02:57:50 -0400
X-AuditID: 0a0a1c0e-b7f4c6d000003bcf-14-522193f35410
Received: from gsmtp5.doi.gov (Unknown_Domain [10.10.28.15])	(using TLS with
	cipher AES128-SHA (128/128 bits))	(Client did not present a
	certificate)	by
	smtp8.smgr.doi.gov (Hello) with SMTP id 01.29.15311.3F391225;
	Sat, 31 Aug 2013 02:57:55 -0400 (EDT)
Received: from mail-pa0-f46.google.com (209.85.220.46) by gsmtp5.doi.gov
	(137.227.28.15) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Sat, 31 Aug 2013 02:57:54 -0400
Received: by mail-pa0-f46.google.com with SMTP id fa1so3188986pad.33
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Aug 2013
	23:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=thqtqfV0G3tRsrOg/hOnzOvVKlZ50LmSlpj6o1rnGzo=;
	b=ls6TBN9JgTjFgQwCCZt0ZOcFrAWh7wKEEyxN5TZzjk3JDV8WiSfDlKpfXdiEDAhz+R
	cdqDIlXrNx+H58TGWr247tnSudCG+m4ed6/77gUbUn+ucu/aSiCVRLFur0pq4UKdFsKd
	GZrEJtWrwi6aZ7BJbvUrRNTFESqg+sSZuHxhHQcMh9vujl1ggQ1w3PGYeZXWmqdIW3k/
	4uRkGBrvyDBsYyK+isesyuAdjbdElTNLGXBIm4YJVJ08ltqVbznhCBXs0s8wklpBt0G4
	J74we/MBekdDleyOXZhYuB+4KPqj6BHCvjo3HzQkVtb6EF02f6KrF1B79GbvX6nSr+Zf
	kNaQ==
X-Gm-Message-State: ALoCoQnVx7AkZ9XBs/OKzbf1uoGHKEukJ2XCRvEVqkd8SWbUYXAJKBEH+iF4ckAi8ZuyBcsSOfxdFBxAzAKee+WpKPedK4Z54w7aO0010NoqjAY91gezUsn/q816xFnVtA1t2i9peMZAmI38gsK6EJ7k/MZJg18UnDQcfOi8N/pzct5EhoqxgSa2nxE4s/TCc/wKyJrpjmjfexmxtAYNhxoGjXAYCxAZk1gEmszgAS4iV/pRdojnG52btBe1fEcFdPETHt3wUPuk
X-Received: by 10.66.150.69 with SMTP id ug5mr15026024pab.55.1377932273856;
	Fri, 30 Aug 2013 23:57:53 -0700 (PDT)
X-Received: by 10.66.150.69 with SMTP id ug5mr15026000pab.55.1377932273397;
	Fri, 30 Aug 2013 23:57:53 -0700 (PDT)
Received: from [192.168.1.112] (adsl-71-135-44-131.dsl.pltn13.pacbell.net.
	[71.135.44.131])        by mx.google.com with ESMTPSA id
	vz4sm2672392pab.11.1969.12.31.16.00.00        (version=TLSv1
	cipher=ECDHE-RSA-RC4-SHA bits=128/128); Fri, 30 Aug 2013 23:57:52
	-0700 (PDT)
MIME-Version: 1.0 (Apple Message framework v1085)
From: Larry Baker <baker@usgs.gov>
In-Reply-To: <12F39B37-5963-490E-BE3F-4053AFDD76A2@usgs.gov>
Date: Fri, 30 Aug 2013 23:57:50 -0700
Message-ID: <B4688002-BE89-4F32-9BD5-3D0B4DF9321F@usgs.gov>
References: <12F39B37-5963-490E-BE3F-4053AFDD76A2@usgs.gov>
To: <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1085)
X-Gm-Spam: 0
Received-SPF: Pass (gSMTP5.doi.gov: domain of baker@usgs.gov designates
	209.85.220.46 as permitted sender) receiver=gSMTP5.doi.gov;
	client-ip=209.85.220.46; helo=mail-pa0-f46.google.com;
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsXCxfTjne7nyYpBBodeSljc+fmO3YHR49zG
	FYwBjFFcNimpOZllqUX6dglcGdenzWApeGFW0d92irGB8ZpeFyMnh4SAiUT31m+sELaYxIV7
	69m6GLk4hASamCQOnWpkhnDWMErcWNDDDFIlJLCUUWLTXCGQhITADVaJe3/bGSGcBUwSs5es
	ZoOYVSWxaOJGJhj79pWbUN2yEgufn2OBGDuXSWLdraNgCWEBf4mm1nVgh/AKGEpM+HMYrJlZ
	QEdiwe5PYEPZBJQknk9ZDBbnFLCR2LT7FJjNIqAq0b6kBegKDqB6CYm1E0MhWrUlli18zQwx
	0lpi/s71rCAlQkD2muvuIKaIgJ7E1X+iEFfKSuy8c5oFwuaRmDL3IjvElfsYJZq6XkAlJCUO
	rrjBMoFRahaSQ2chOXQWks0LGJlXMQoV55YUWOgV56YX6aXkZ+ql55dtYgRFHJcM3w7GjocW
	hxgFOBiVeHh3LFcIEmJNLCuuzD3EKMHBrCTCm2SiGCTEm5JYWZValB9fVJqTWnyIUZqDRUmc
	VzxgdqCQQHpiSWp2ampBahFMlomDU6qB0W5vsRjjuU825ycwtaRuz61a9My1PzfW9XxG2c+b
	pTO9Np5UCFor8dD4SemHXR8mn+Vh/LAva9f01b42y7/IcG3bYiB/ydOy4In/r33vpp3/FjDF
	b6pprLvdqxrBy6e2/d8i7vbaldWrj6GxIv7w6+qnwmoyyUdnLnNpFduyb8kCa+vs3Y/v31Bi
	Kc5INNRiLipOBAAFLAlJtAIAAA==
Cc: eldk@lists.denx.de
Subject: Re: Fix for libtool-cross do_qa_configure error when building gfortran
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
X-List-Received-Date: Sat, 31 Aug 2013 06:57:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Here are the complete patches required to obtain a functional gfortran =
cross compiler.  I have also submitted a bug report to Yocto bugzilla =
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5091) and uploaded =
my patch file there.

There are still four warning messages from the build:

WARNING: QA Issue: gcc-runtime: Files/directories were installed but not =
shipped
  /usr/lib/gcc/arm-linux-gnueabi/4.7.2/libgfortranbegin.la
  /usr/lib/gcc/arm-linux-gnueabi/4.7.2/libcaf_single.la
  /usr/lib/gcc/arm-linux-gnueabi/4.7.2/libcaf_single.a
  /usr/lib/gcc/arm-linux-gnueabi/4.7.2/libgfortranbegin.a

I do not understand enough about bitbake or the gcc-cross and =
gcc-runtime recipes to know exactly where to find the source of these =
errors.  And, I was unsuccessful in properly specifying the DEPENDS and =
PROVIDES relationships in my bbappend files (see my Yocto bugzilla =
post), so I left those out.

I have yet to actually run the code -- I have not yet prepared the =
proper rootfs image for my target.

Larry Baker
US Geological Survey
650-329-5608
baker@usgs.gov

>>>>> snip <<<<<
--- original/openembedded-core/meta/classes/native.bbclass
+++ patched/openembedded-core/meta/classes/native.bbclass
@@ -61,2 +61,3 @@
 export CXX =3D "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}"
+export FC =3D "${CCACHE}${HOST_PREFIX}gfortran ${HOST_CC_ARCH}"
 export F77 =3D "${CCACHE}${HOST_PREFIX}g77 ${HOST_CC_ARCH}"
--- original/openembedded-core/meta/conf/bitbake.conf
+++ patched/openembedded-core/meta/conf/bitbake.conf
@@ -447,2 +447,3 @@
 export CXX =3D "${CCACHE}${HOST_PREFIX}g++ =
${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+export FC =3D "${CCACHE}${HOST_PREFIX}gfortran =
${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 export F77 =3D "${CCACHE}${HOST_PREFIX}g77 =
${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
@@ -463,2 +464,3 @@
 export BUILD_CXX =3D "${CCACHE}${BUILD_PREFIX}g++ ${BUILD_CC_ARCH}"
+export BUILD_FC =3D "${CCACHE}${BUILD_PREFIX}gfortran ${BUILD_CC_ARCH}"
 export BUILD_F77 =3D "${CCACHE}${BUILD_PREFIX}g77 ${BUILD_CC_ARCH}"
--- =
original/openembedded-core/meta/recipes-devtools/gcc/gcc-configure-common.=
inc
+++ =
patched/openembedded-core/meta/recipes-devtools/gcc/gcc-configure-common.i=
nc
@@ -13,3 +13,3 @@
 # gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and 4.2 expect =
'fortran'
-FORTRAN ?=3D ",f77"
+FORTRAN ?=3D ",fortran"
 LANGUAGES ?=3D "c,c++${FORTRAN}${JAVA}"
--- original/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ patched/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -78,2 +78,3 @@
   libgfortran-dev \
+  libgfortran-staticdev \
   libmudflap \
@@ -121,5 +122,11 @@
 FILES_libgfortran-dev =3D " \
-  ${libdir}/libgfortran.a \
+  ${libdir}/libgfortran.spec \
   ${libdir}/libgfortran.so \
-  ${libdir}/libgfortranbegin.a"
+  ${libdir}/libgfortran.la \
+  ${libdir}/libgfortranbegin.la \
+  ${libdir}/libcaf_single.la"
+FILES_libgfortran-staticdev =3D " \
+  ${libdir}/libgfortran.a \
+  ${libdir}/libgfortranbegin.a \
+  ${libdir}/libcaf_single.a"
=20
>>>>> snip <<<<<


On Aug 27, 2013, at 9:45 PM, Larry Baker wrote:

> I enabled the build of gfortran in the gcc-cross recipe using a =
gcc-cross_4.7.bbappend:
>=20
>> # Build a gfortran cross-compiler
>> FORTRAN =3D ",fortran"
>=20
> The bitbake build fails in the libtool-cross do_qa_configure step.  =
See, for example, the report at =
http://www.mail-archive.com/yocto@yoctoproject.org/msg13845.html:
>=20
>> configure: WARNING: unrecognized options: --disable-silent-rules, =
--with-
>> sysroot=20
>> DEBUG: Shell function do_configure finished=20
>> DEBUG: Executing python function do_qa_configure=20
>> NOTE: Checking autotools environment for common misconfiguration=20
>> ERROR: This autoconf log indicates errors, it looked at host include =
and/or=20
>> library paths while determining system capabilities.=20
>> Rerun configure task after fixing this. The path was=20
>> '/home/appusr/poky/build/tmp/work/armv7a-vfp-neon-poky-linux-
>> gnueabi/libtool-cross-2.4.2-r5.1/libtool-2.4.2'=20
>> DEBUG: Python function do_qa_configure finished=20
>> ERROR: Function failed: do_qa_configure
>=20
> This is due to the incomplete support for gfortran in the bitbake =
recipes.  It looks like they were written for F77=3Dg77 and have not =
been updated to support FC=3Dgfortran.  The FC variable is not defined =
properly for cross-compiling: it is missing the --with-sysroot=3D =
option.  The result is a misconfiguration reported by =
--enable-poison-system-directories and discovered by insane.bbclass in =
do_qa_configure.
>=20
> The patches below define the FC variables and update the default =
FORTRAN from f77 to fortran.  I use the DENX Yocto/ELDK-5.4 git =
(http://www.denx.de/wiki/ELDK-5/EldkBuilding), so the meta layer name =
and the line numbers may not be an exact match to the files in the OE =
git repository.  Also, I am sorry I cannot use diff --git on my CentOS =
development system.
>=20
> Unfortunately, while these patches enable the creation of a gfortran =
cross compiler, gfortran cross compiles fail due to a missing =
libgfortran.spec file.  In fact, there are no libgfortran files at all.  =
I don't know why.  When I built my own gfortran cross compiler =
previously from the latest GCC 4.7 Code Sourcery sources, it made all =
the necessary pieces. I did not have to build any other tools, such as =
libtool or libgfortran.  Maybe there are more bitbake files that have to =
be updated to build a functioning gfortran cross compiler.  I'll keep =
working on that.
>=20
> Larry Baker
> US Geological Survey
> 650-329-5608
> baker@usgs.gov
>=20
>=20
> --- original/eldk/meta/classes/native.bbclass
> +++ patched/eldk/meta/classes/native.bbclass
> @@ -61,2 +61,3 @@
> export CXX =3D "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}"
> +export FC =3D "${CCACHE}${HOST_PREFIX}gfortran ${HOST_CC_ARCH}"
> export F77 =3D "${CCACHE}${HOST_PREFIX}g77 ${HOST_CC_ARCH}"
> --- original/eldk/meta/conf/bitbake.conf
> +++ patched/eldk/meta/conf/bitbake.conf
> @@ -448,2 +448,3 @@
> export CXX =3D "${CCACHE}${HOST_PREFIX}g++ =
${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> +export FC =3D "${CCACHE}${HOST_PREFIX}gfortran =
${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> export F77 =3D "${CCACHE}${HOST_PREFIX}g77 =
${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> @@ -463,2 +464,3 @@
> export BUILD_CXX =3D "${CCACHE}${BUILD_PREFIX}g++ ${BUILD_CC_ARCH}"
> +export BUILD_FC =3D "${CCACHE}${BUILD_PREFIX}gfortran =
${BUILD_CC_ARCH}"
> export BUILD_F77 =3D "${CCACHE}${BUILD_PREFIX}g77 ${BUILD_CC_ARCH}"
> --- original/eldk/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ patched/eldk/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -13,3 +13,3 @@
> # gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and 4.2 expect =
'fortran'
> -FORTRAN ?=3D ",f77"
> +FORTRAN ?=3D ",fortran"
> LANGUAGES ?=3D "c,c++${FORTRAN}${JAVA}"
>=20


