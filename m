Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C979FCD6E6E
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 20:01:17 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4253.1780603275927936657
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 13:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=u647qi6y;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so904711f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 13:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780603274; x=1781208074; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xNERY4m2OwL3hlSj2IjXK81HbrfRYqjM3qCa9wy/EM=;
        b=u647qi6yBgLUBQ2/JYhnXhQKD27LiWOhKOoKaYHQhCSpZlOjjrk6m/2kL9dP01dtc+
         S7129z8DVqzGPbTXFR40YDViGTDQZqEUVI9+yEO8/XxdIJArAEKVxPuDQsLEwgTn8rkD
         5MVrBbJnfiYDD1ovlF2H315Pj7ChagdFRV/l0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780603274; x=1781208074;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+xNERY4m2OwL3hlSj2IjXK81HbrfRYqjM3qCa9wy/EM=;
        b=XijHQl7vNLRMZthwyXnn0HfOY2gplTeEeXW8uBDoiWQWCuupvKdtfHtvCoR13VQRAS
         sJBva/Il4bUIAixT64V9iGgUrKEKstvxIzpdNeT+XKOxOaf3izwqyNrZ2sntFOhT7bbm
         p63k4a9+D2ld3kMijX3Lml9qbAfeK2s7MKTKWclEkG6MLBJCdZpGaiAOcTxp6GM5Gq5E
         jO4a6R+r+H0ZWoniqQ4kJUJ9q9H7y3QfkETEj+PDPtqQlvbb1hp/+PpSVIyA0osS300V
         YDLQqQFYjRRaZ51gSJHua29f2sDGgMx5/o3R/Nlx+WnzK8LQFG/mYN288P10U4MTaCzy
         ZZYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/m911q8ooUZMp8fkJfeCmyyIZpzBDEpiJaAsNAT+3yugsMgKSWKHjmC2q81vCW4xcV9m5m218+nGpyNKT+zOXDwA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw1hO5AaETGHpiNQyVFh3J3IuIt7UByy4W0fEofVSakPZ+Nu2bI
	gwbV6/t5CSL0f3346kNYTNLZZRuURFPmle0dTpxQFq/sltyXuQHkMYG9eGyc8YRoqUY=
X-Gm-Gg: Acq92OFbIPoyM2caTucs0NezeB1yFCWdqirjT8edDbgbHf4ltcGwFMtcE6IomYHL98s
	iqCdJcycWu/JuUMz8wKoI0RRbRMKK6Sn/1R0rrKGJCkzyWVHibV+MpSuURuqnoXxo9oU7PFEp4K
	Ip2TsaR8EsSYtoM44zD8Ai7N57LBLaC2D/h6fWe1jZaY+H1dUIfwWBn4duF0op/TKWuo85UwZ8F
	5rwLD4H+yiBzyhNjijWU1OBbNGUWU3E//atbONppUeI4o1AvZABsGNJrzHBGzwCh30aBTVsy+5c
	LaSLgtJyRcXivxZktPK/IU1C2P1h7bzqz4xXL1rKeBgMJxOLkjJERD24LDwHgFR8q0iN46U/0FU
	C1nH0uUxtlCtyshq5XBuEVvwlqkCOfjKa53ylugYmyC4sGB3Fy2TtK2bry4wiqu9gDbFrPNGI66
	B11NQhzMklvjNbj6drtrJGktDUZwC7tz9T2XJGnkJ2D/c2265DDqUlnzz+vcO1JGQnEH1t9Ilv3
	MzkN6fowe4TdH3iqRD4VwLSu6A=
X-Received: by 2002:a05:600c:4e13:b0:490:bd1d:4732 with SMTP id 5b1f17b1804b1-490c25eea3bmr1025525e9.23.1780603273938;
        Thu, 04 Jun 2026 13:01:13 -0700 (PDT)
Received: from localhost (2a01cb001331aa00ae426e28cd306e8e.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:ae42:6e28:cd30:6e8e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f5612sm18187335f8f.15.2026.06.04.13.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 13:01:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jun 2026 22:01:12 +0200
Message-Id: <DJ0J6IRYX2R7.23ZTL1KQ7NTHV@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH v3] gnutls: upgrade 3.8.12 -> 3.8.13
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <Haixiao.Yan.CN@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260603074613.2846839-1-haixiao.yan.cn@windriver.com>
In-Reply-To: <20260603074613.2846839-1-haixiao.yan.cn@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 20:01:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238135

On Wed Jun 3, 2026 at 9:46 AM CEST, Haixiao (CN) via lists.openembedded.org=
 Yan wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Release notes: [1]
>
> Rebase patches and drop patch included in this release.
> Add patches to fix linking with musl libc.
> Increase memory needed to successfully run test key-openssl.
> Drop code for previous release tarball problem.
>
> [1] https://github.com/gnutls/gnutls/blob/3.8.13/NEWS
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (master rev: 1193b0778a0f81bd75f7ec6f8f44fa44cf4b8f5e)
> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>

Hello,

Sorry but the changelog you linked lists new features and evolution not
limited to bugfixes:
> ** libgnutls: Allow fetching object type metadata for PKCS#11 keys
>    A new library function, gnutls_pkcs11_obj_get_pk_algorithm,
>    has been added to check the public key algorithms of PKCS#11 key objec=
ts.
>    Object types other than CKO_PRIVATE_KEY are currently not supported.
>    Contributed by Ghadi Elie Rahme (!2074).
>=20
> ** API and ABI modifications:
> gnutls_hpke_kem_t: New enum
> gnutls_hpke_kdf_t: New enum
> gnutls_hpke_aead_t: New enum
> gnutls_hpke_mode_t: New enum
> gnutls_hpke_role_t: New enum
> gnutls_hpke_context_st: New context structure
> gnutls_hpke_init: New function
> gnutls_hpke_deinit: New function
> gnutls_hpke_encap: New function
> gnutls_hpke_seal: New function
> gnutls_hpke_decap: New function
> gnutls_hpke_open: New function
> gnutls_hpke_derive_keypair: New function
> gnutls_hpke_export: New function
> gnutls_pkcs11_obj_get_pk_algorithm: New function

Thus, this upgrade is not acceptable on the stable branch, sorry.

Regards,

> ---
>  meta/recipes-core/images/core-image-ptest.bb  |  1 +
>  ...ts-mini-dtls-framents-link-to-gnulib.patch | 25 +++++++++++
>  ...ust-list-fault-fix-issues-in-linking.patch | 31 ++++++++++++++
>  .../gnutls/gnutls/Add-ptest-support.patch     |  4 +-
>  meta/recipes-support/gnutls/gnutls/c99.patch  | 41 -------------------
>  .../{gnutls_3.8.12.bb =3D> gnutls_3.8.13.bb}    |  9 ++--
>  6 files changed, 62 insertions(+), 49 deletions(-)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-mini-dt=
ls-framents-link-to-gnulib.patch
>  create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-=
trust-list-fault-fix-issues-in-linking.patch
>  delete mode 100644 meta/recipes-support/gnutls/gnutls/c99.patch
>  rename meta/recipes-support/gnutls/{gnutls_3.8.12.bb =3D> gnutls_3.8.13.=
bb} (93%)
>
> diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-=
core/images/core-image-ptest.bb
> index c08561296fe4..008b5770a898 100644
> --- a/meta/recipes-core/images/core-image-ptest.bb
> +++ b/meta/recipes-core/images/core-image-ptest.bb
> @@ -39,6 +39,7 @@ QB_MEM:virtclass-mcextend-python3 =3D "-m 2048"
>  QB_MEM:virtclass-mcextend-python3-cryptography =3D "-m 5100"
>  QB_MEM:virtclass-mcextend-python3-numpy =3D "-m 4096"
>  QB_MEM:virtclass-mcextend-tcl =3D "-m 5100"
> +QB_MEM:virtclass-mcextend-gnutls =3D "-m 1536"
> =20
>  TEST_SUITES =3D "ping ssh parselogs ptest"
> =20
> diff --git a/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-fram=
ents-link-to-gnulib.patch b/meta/recipes-support/gnutls/gnutls/0001-tests-m=
ini-dtls-framents-link-to-gnulib.patch
> new file mode 100644
> index 000000000000..7f999c4b22ec
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-li=
nk-to-gnulib.patch
> @@ -0,0 +1,25 @@
> +From 68b2fb63c8df61d1480121a859f8c955f4910c01 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Thu, 30 Apr 2026 13:08:01 +0200
> +Subject: [PATCH] tests/mini-dtls-framents: link to gnulib
> +
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +
> +Upstream-Status: Backport [https://github.com/gnutls/gnutls/commit/68b2f=
b63c8df61d1480121a859f8c955f4910c01]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + tests/Makefile.am | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index f8797964d..1b27df751 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -524,6 +524,7 @@ pathbuf_CPPFLAGS =3D $(AM_CPPFLAGS) \
> + mini_dtls_fragments_CPPFLAGS =3D $(AM_CPPFLAGS) \
> + 	-I$(top_srcdir)/gl	\
> + 	-I$(top_builddir)/gl
> ++mini_dtls_fragments_LDADD =3D $(LDADD) ../gl/libgnu.la
> +=20
> + if ENABLE_PKCS11
> + if !WINDOWS
> diff --git a/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-l=
ist-fault-fix-issues-in-linking.patch b/meta/recipes-support/gnutls/gnutls/=
0001-tests-pkcs11-trust-list-fault-fix-issues-in-linking.patch
> new file mode 100644
> index 000000000000..b15a05d5b634
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/0001-tests-pkcs11-trust-list-fau=
lt-fix-issues-in-linking.patch
> @@ -0,0 +1,31 @@
> +From 9c573a2a0e7473ab79c43a6d3ecb0ab68ce896dc Mon Sep 17 00:00:00 2001
> +From: Daiki Ueno <ueno@gnu.org>
> +Date: Thu, 7 May 2026 09:42:09 +0900
> +Subject: [PATCH] tests/pkcs11/trust-list-fault: fix issues in linking
> +
> +This fixes the use of automake variables and also adds the linked mock
> +library in .gitignore.
> +
> +Signed-off-by: Daiki Ueno <ueno@gnu.org>
> +
> +Upstream-Status: Backport [https://github.com/gnutls/gnutls/commit/9c573=
a2a0e7473ab79c43a6d3ecb0ab68ce896dc]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + tests/Makefile.am | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index 1b27df751..f6a60a32b 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -540,8 +540,8 @@ pkcs11_os_locking_ok_DEPENDENCIES =3D libpkcs11mock4=
.la libutils.la
> + pkcs11_os_locking_ok_LDADD =3D $(LDADD) $(LIBDL)
> + pkcs11_long_label_DEPENDENCIES =3D libpkcs11mock4.la libutils.la
> + pkcs11_long_label_LDADD =3D $(LDADD) $(LIBDL)
> +-pkcs11_trust_fault_DEPENDENCIES =3D libpkcs11mock5.la libutils.la
> +-pkcs11_trust_fault_LDADD =3D $(LDADD) $(LIBDL)
> ++pkcs11_trust_list_fault_DEPENDENCIES =3D libpkcs11mock5.la libutils.la
> ++pkcs11_trust_list_fault_LDADD =3D $(LDADD) $(LIBDL)
> + endif
> + endif
> +=20
> diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b=
/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> index 398c0464e0f3..8c867a5a4008 100644
> --- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> +++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> @@ -29,7 +29,7 @@ diff --git a/configure.ac b/configure.ac
>  index 1744813..efb9e34 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1448,6 +1448,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
> +@@ -1413,6 +1413,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
>  =20
>   AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" =3D "yes")
>  =20
> @@ -42,7 +42,7 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am
>  index 189d068..8430b05 100644
>  --- a/tests/Makefile.am
>  +++ b/tests/Makefile.am
> -@@ -721,6 +721,12 @@ SH_LOG_COMPILER =3D $(SHELL)
> +@@ -745,6 +745,12 @@ SH_LOG_COMPILER =3D $(SHELL)
>   AM_VALGRINDFLAGS =3D --suppressions=3D$(srcdir)/suppressions.valgrind
>   LOG_COMPILER =3D $(LOG_VALGRIND)
>  =20
> diff --git a/meta/recipes-support/gnutls/gnutls/c99.patch b/meta/recipes-=
support/gnutls/gnutls/c99.patch
> deleted file mode 100644
> index 3f41241deba0..000000000000
> --- a/meta/recipes-support/gnutls/gnutls/c99.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 203d8f2187bb7f483290e0f8b7b48b152b1d027f Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@arm.com>
> -Date: Thu, 5 Mar 2026 11:33:57 +0000
> -Subject: [PATCH] configure: make the C99 detection more resiliant
> -
> -autoconf 2.73 will default to C23 by default, which means that the >C99
> -detection logic in configure.ac will fail because it only handles c11
> -and c99.
> -
> -Instead of adding c23 to the list and then breaking again in the future,
> -flip the logic around (as suggested by Zack Weinberg) and check
> -explicitly for just c89.
> -
> -Closes #1806.
> -
> -Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/merge_requ=
ests/2081]
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> ----
> - configure.ac | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 740fb6339..c708d8f5e 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -54,9 +54,9 @@ AC_USE_SYSTEM_EXTENSIONS
> - # Require C99 support
> - #
> - AS_CASE([$ac_prog_cc_stdc],
> --  [c11 | c99], [AC_DEFINE([C99_MACROS], 1, [C99 macros are supported])]=
,
> --  [AC_MSG_WARN([[Compiler does not support C99. It may not be able to c=
ompile the project.]])]
> --)
> -+  [c89],
> -+  [AC_MSG_WARN([[Compiler does not support C99. It may not be able to c=
ompile the project.]])],
> -+  [AC_DEFINE([C99_MACROS], 1, [C99 macros are supported])])
> -=20
> - AM_CONDITIONAL(CROSS_COMPILING, test "$cross_compiling" =3D yes)
> -=20
> ---=20
> -2.43.0
> -
> diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-=
support/gnutls/gnutls_3.8.13.bb
> similarity index 93%
> rename from meta/recipes-support/gnutls/gnutls_3.8.12.bb
> rename to meta/recipes-support/gnutls/gnutls_3.8.13.bb
> index 721842801229..78b88005305a 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.8.13.bb
> @@ -23,10 +23,11 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/=
v${SHRT_VER}/gnutls-${PV}.tar
>             file://0001-Creating-.hmac-file-should-be-excuted-in-target-e=
nvi.patch \
>             file://run-ptest \
>             file://Add-ptest-support.patch \
> -           file://c99.patch \
> +           file://0001-tests-pkcs11-trust-list-fault-fix-issues-in-linki=
ng.patch \
> +           file://0001-tests-mini-dtls-framents-link-to-gnulib.patch \
>             "
> =20
> -SRC_URI[sha256sum] =3D "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2=
bf470bea012b8e51"
> +SRC_URI[sha256sum] =3D "ffed8ec1bf09c2426d4f14aae377de4753b53e537d685e60=
4e99a8b16ca9c97e"
> =20
>  inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
> =20
> @@ -63,10 +64,6 @@ do_configure:prepend() {
>  	for dir in . lib; do
>  		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
>  	done
> -
> -	# remove on next upgrade when release tarball gets fixed
> -	# https://gitlab.com/gnutls/gnutls/-/issues/1797
> -	cp -p ${S}/doc/stamp_enums ${S}/doc/stamp_error_codes
>  }
> =20
>  do_compile_ptest() {


--=20
Yoann Congal
Smile ECS


