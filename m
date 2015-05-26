Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6AD676AC12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 18:24:20 +0000 (UTC)
Received: by paza2 with SMTP id a2so89505474paz.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 11:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=PvcNZjPLqPBhYVqEc9LgJlzX63dD6+VcKZBb8cBG8Zs=;
	b=tZNr4PNJtczUB+C9cEa4w3VT6pFGFqwC2Cksindwrw6Bvggj8Jg9wpp4YHIx6T2xAE
	Lvlfd4+D4N7K6W73uwKCIrP0Q1G7KRhVFeqsc8f8oRjaXUXB+OmDy2BPtnyPqeD+ChYe
	Q5UEzAibQd1vU28x1ZYkzsVcNsKsWxK34B1XQdi/wLoM0fYXqLb7FW5jh+RwLAsX3J6w
	kpsmeUwzU/JdAqHGj3uUL7ZfiKXoa2xhZp6RnCznViVOzyNBdFZ3+mT5sIRY9q6MMENd
	f7TEk4MRPzI3ZZmZDh+b1B5OCRL8bVlHukasUFFE4I1LcnthmlO8NvmlPksrUq6sMm/z
	tXZw==
X-Received: by 10.70.136.169 with SMTP id qb9mr51462253pdb.46.1432664662286;
	Tue, 26 May 2015 11:24:22 -0700 (PDT)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id i1sm13778260pdm.19.2015.05.26.11.24.21
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 May 2015 11:24:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1432313557-21793-1-git-send-email-juro.bystricky@intel.com>
Date: Tue, 26 May 2015 11:24:16 -0700
Message-Id: <1BDA4EEE-93C5-4FE5-8184-F6CF6EA40820@gmail.com>
References: <1432313557-21793-1-git-send-email-juro.bystricky@intel.com>
To: Juro Bystricky <juro.bystricky@intel.com>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc-use-option-groups: Conditionally exclude c++ tests
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
X-List-Received-Date: Tue, 26 May 2015 18:24:25 -0000
X-Groupsio-MsgNum: 66027
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2234E640-8681-429A-AE3D-DBF7FA817746";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2234E640-8681-429A-AE3D-DBF7FA817746
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

I see this has been merged so its a pointless feedback for this one now =
but for future, if you patch  on top
of eglibc-options patch, please create a new patch, the reason is for =
easier merge. We need to keep
this patch in shape for upstream submission

> On May 22, 2015, at 9:52 AM, Juro Bystricky <juro.bystricky@intel.com> =
wrote:
>=20
> Some test programs written in c++ are still included in spite of
> "libc-cxx-tests" being omitted from DISTRO_FEATURES_LIBC.
> All .cc programs are compiled with g++.
> g++ automatically specifies linking against the C++ library.
> This patch conditionally excludes the following tests as well:
>=20
>  bug-atexit3-lib.cc
>  tst-cancel24.cc
>  tst-cancel24-static.cc
>  tst-unique3lib.cc
>  tst-unique3lib2.cc
>  tst-unique4lib.cc
>  tst-unique3.cc
>  tst-unique4.cc
>=20
> Tested with DISTRO_FEATURES_LIBC_remove =3D " libc-cxx-tests"
>=20
> [YOCTO #7003]
>=20
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
> .../glibc/glibc/eglibc-use-option-groups.patch     | 82 =
++++++++++++++++++++--
> 1 file changed, 78 insertions(+), 4 deletions(-)
>=20
> diff --git =
a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch =
b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
> index 439b4a9..da92203 100644
> --- a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
> +++ b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
> @@ -491,19 +491,72 @@ Index: git/dlfcn/Makefile
>  subdir		:=3D dlfcn
>=20
>  include ../Makeconfig
> -@@ -36,8 +38,11 @@ endif
> +@@ -36,14 +38,18 @@ endif
>  ifeq (yes,$(build-shared))
>  tests =3D glrefmain failtest tst-dladdr default errmsg1 tstcxaatexit =
\
>  	bug-dlopen1 bug-dlsym1 tst-dlinfo bug-atexit1 bug-atexit2 \
> -	bug-atexit3 tstatexit bug-dl-leaf tst-rec-dlopen
> +	tstatexit bug-dl-leaf tst-rec-dlopen
> - endif
> -+
> +tests-$(OPTION_EGLIBC_CXX_TESTS) +=3D bug-atexit3
> -+
> + endif
>  modules-names =3D glreflib1 glreflib2 glreflib3 failtestmod =
defaultmod1 \
>  		defaultmod2 errmsg1mod modatexit modcxaatexit \
>  		bug-dlsym1-lib1 bug-dlsym1-lib2 bug-atexit1-lib \
> +-		bug-atexit2-lib bug-atexit3-lib bug-dl-leaf-lib \
> ++		bug-atexit2-lib bug-dl-leaf-lib \
> + 		bug-dl-leaf-lib-cb moddummy1 moddummy2
> +
> ++ifeq (y,$(OPTION_EGLIBC_CXX_TESTS))
> ++modules-names +=3D bug-atexit3-lib
> ++endif
> + failtestmod.so-no-z-defs =3D yes
> + glreflib2.so-no-z-defs =3D yes
> + errmsg1mod.so-no-z-defs =3D yes
> +Index: git/elf/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/elf/Makefile
> ++++ git/elf/Makefile
> +@@ -17,6 +17,8 @@
> +
> + # Makefile for elf subdirectory of GNU C Library.
> +
> ++include ../option-groups.mak
> ++
> + subdir		:=3D elf
> +
> + include ../Makeconfig
> +@@ -144,10 +146,11 @@ tests +=3D loadtest restest1 preloadtest =
loadfail multiload origtest resolvfail \
> + 	 unload3 unload4 unload5 unload6 unload7 unload8 tst-global1 =
order2 \
> + 	 tst-audit1 tst-audit2 tst-audit8 tst-audit9 \
> + 	 tst-stackguard1 tst-addr1 tst-thrlock \
> +-	 tst-unique1 tst-unique2 tst-unique3 tst-unique4 \
> ++	 tst-unique1 tst-unique2 \
> + 	 tst-initorder tst-initorder2 tst-relsort1 tst-null-argv \
> + 	 tst-ptrguard1
> + #	 reldep9
> ++tests-$(OPTION_EGLIBC_CXX_TESTS) +=3D tst-unique3 tst-unique4
> + ifeq ($(build-hardcoded-path-in-tests),yes)
> + tests +=3D tst-dlopen-aout
> + endif
> +@@ -205,8 +208,6 @@ modules-names =3D testobj1 testobj2 testobj3 =
testobj4 testobj5 testobj6 \
> + 		tst-unique1mod1 tst-unique1mod2 \
> + 		tst-unique2mod1 tst-unique2mod2 \
> + 		tst-auditmod9a tst-auditmod9b \
> +-		tst-unique3lib tst-unique3lib2 \
> +-		tst-unique4lib \
> + 		tst-initordera1 tst-initorderb1 \
> + 		tst-initordera2 tst-initorderb2 \
> + 		tst-initordera3 tst-initordera4 \
> +@@ -214,6 +215,9 @@ modules-names =3D testobj1 testobj2 testobj3 =
testobj4 testobj5 testobj6 \
> + 		tst-initorder2d \
> + 		tst-relsort1mod1 tst-relsort1mod2 tst-array2dep \
> + 		tst-array5dep tst-null-argv-lib
> ++ifeq (y,$(OPTION_EGLIBC_CXX_TESTS))
> ++modules-names +=3D tst-unique3lib tst-unique3lib2 tst-unique4lib
> ++endif
> + ifeq (yesyes,$(have-fpie)$(build-shared))
> + modules-names +=3D tst-piemod1
> + tests +=3D tst-pie1 tst-pie2
> Index: git/elf/dl-support.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- git.orig/elf/dl-support.c
> @@ -3103,6 +3156,27 @@ Index: git/nptl/Makefile
>  # Files which must not be linked with libpthread.
>  tests-nolibpthread =3D tst-unload
>=20
> +@@ -363,12 +377,18 @@
> + 		    $(common-objpfx)libc.a
> +
> + tests-static +=3D tst-locale1 tst-locale2 tst-stackguard1-static \
> +-		tst-cancel21-static tst-cancel24-static tst-cond8-static =
\
> ++		tst-cancel21-static tst-cond8-static \
> + 		tst-mutex8-static tst-mutexpi8-static tst-sem11-static \
> + 		tst-sem12-static
> +-tests +=3D tst-stackguard1-static tst-cancel21-static =
tst-cancel24-static \
> ++
> ++ifeq (y,$(OPTION_EGLIBC_CXX_TESTS))
> ++tests-static +=3D tst-cancel24-static
> ++endif
> ++
> ++tests +=3D tst-stackguard1-static tst-cancel21-static \
> + 	 tst-cond8-static tst-mutex8-static tst-mutexpi8-static \
> + 	 tst-sem11-static tst-sem12-static
> ++tests-$(OPTION_EGLIBC_CXX_TESTS) +=3D tst-cancel24-static
> + xtests-static +=3D tst-setuid1-static
> +
> + # These tests are linked with libc before libpthread
> Index: git/nptl/pthread_create.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- git.orig/nptl/pthread_create.c
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_2234E640-8681-429A-AE3D-DBF7FA817746
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVkulQACgkQuwUzVZGdMxS3yQCfZiGFFJOp7f81xsu3ZEOJp4YL
IKMAn33nYhJ91qQ/kdZFhLI0+aFUnRzG
=LlWR
-----END PGP SIGNATURE-----

--Apple-Mail=_2234E640-8681-429A-AE3D-DBF7FA817746--
