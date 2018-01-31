Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9E2FB7875F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 11:42:57 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id c17so14876804iod.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 03:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vmYdwtOTYvp54MoVyL8OtcEB3yp49Dmhwwp7q2SNLVU=;
	b=pWMFrmFqMFScLmV3RVUb1RnFKZ+4xMe8eMDusNGLCobkx3HMiC/WIzCwYQdbjr7+sb
	UH/4O82K+cwkDUkdfpDVQzRG+CFcxEEe0E9d/ilkasvwkDEa25cOWfjip5C+MTJrDkxj
	BWhPD0NhVK3lGS/npT1byjA+prEuv2i5nyqCOQWhkD7vtjbsdmHKQrYLQKXvxEG7MyYF
	APTWUzixkfNR1LDxsKR4Xx+3EPbZMH6b8aSQdOAtnnXcaqKRw6t2yGvnZaj9sa+/BvOY
	WCzEs/hSHaeHNk2nTlrSSi0YSwwo9d/5OXtkFTDYv3fb+cABVAz1t2x9F+P5asOT+lb7
	gVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vmYdwtOTYvp54MoVyL8OtcEB3yp49Dmhwwp7q2SNLVU=;
	b=hTtKTuu9FEatDcN3Gikxd/M8mkmNFIe4d+zYTZN2iT2kqI7gKJzAM8gn9bX7rADCRK
	P7u3JwtfZeNJ3LDXvkOijBQGUtaOv28G78cFQcYqc33QhJvv3+P0A4gb7Nwf1xQdgZtO
	U4Gavc6BQXB5UCjBpQcQvr0/WGpWzcwVdktQ7Xspah85f5DoeG+NG7dQjINiJHnnGtJf
	ZRH4I23vWTTU4Ah3JqnHiCe4f5XDDNh2RnX/OQrQOCaG0AFupdFLatgcMF004B8f/U/G
	o9pv7Mgj1VXXsOYxAY8TF++mXuBY6+eScoHhH9VBB/pWUmeyCawrNmA6ElVGnVA++ohA
	r4kQ==
X-Gm-Message-State: AKwxytcggmJasgcTQNs/gjrSnkK9U43AnS7OH1H9xNJQj853Qm+GcftM
	gxt7o7IQMjIOev9Y1cDVMAiYrRii1yg//pLODaMCog==
X-Google-Smtp-Source: AH8x227kDMmucj7LGZ6faLVMTG1IPfpeBza87asv0n+YtNrfy+FJFe3hzai1u0NMA6cIJQf6W3A+y8vBvJVb7pAleVo=
X-Received: by 10.107.32.19 with SMTP id g19mr33308884iog.217.1517398979184;
	Wed, 31 Jan 2018 03:42:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Wed, 31 Jan 2018 03:42:38 -0800 (PST)
In-Reply-To: <7b730a025337cfe854c1fe3089a93eaca138b643.1517383469.git.hongxu.jia@windriver.com>
References: <cover.1517383469.git.hongxu.jia@windriver.com>
	<7b730a025337cfe854c1fe3089a93eaca138b643.1517383469.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 31 Jan 2018 11:42:38 +0000
Message-ID: <CAJTo0LYUo2_mHf1yvBDpD_Ecm1chfgM+nwNFkgkpjq6C7dK-PQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] apr: 1.6.2 -> 1.6.3
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
X-List-Received-Date: Wed, 31 Jan 2018 11:42:58 -0000
Content-Type: multipart/alternative; boundary="001a1141a2a4232147056410fb2b"

--001a1141a2a4232147056410fb2b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We're carrying a lot of patches here, and I'm not convinced that they are
all inappropriate.  Would you be willing to see what of those are
upstreamable?

Ross

On 31 January 2018 at 07:48, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> - Rebase patches 0001 ~ 0008
>
> - Fix build path issue to improve reproducibility
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...gure_fixes.patch =3D> 0001-configure-fixes.patch} | 28 +++++++---
>  meta/recipes-support/apr/apr/0002-cleanup.patch    | 59
> ++++++++++++++++++++++
>  .../apr/{configfix.patch =3D> 0003-configfix.patch}  | 27 +++++++---
>  ...4-Makefile.in-fix-cross-compiling-failed.patch} | 13 +++--
>  ...> 0005-Fix-packet-discards-HTTP-redirect.patch} | 15 ++++--
>  ...-fix-LTFLAGS-to-make-it-work-with-ccache.patch} | 10 ++--
>  ...t-size-doesn-t-match-in-glibc-when-cross.patch} | 16 +++---
>  ...ink-libapr-against-phtread-to-make-gold-.patch} | 12 ++---
>  meta/recipes-support/apr/apr/cleanup.patch         | 43 ----------------
>  .../apr/{apr_1.6.2.bb =3D> apr_1.6.3.bb}             | 23 +++++----
>  10 files changed, 153 insertions(+), 93 deletions(-)
>  rename meta/recipes-support/apr/apr/{configure_fixes.patch =3D>
> 0001-configure-fixes.patch} (69%)
>  create mode 100644 meta/recipes-support/apr/apr/0002-cleanup.patch
>  rename meta/recipes-support/apr/apr/{configfix.patch =3D>
> 0003-configfix.patch} (75%)
>  rename meta/recipes-support/apr/apr/{upgrade-and-fix-1.5.1.patch =3D>
> 0004-Makefile.in-fix-cross-compiling-failed.patch} (81%)
>  rename meta/recipes-support/apr/apr/{Fix-packet-discards-HTTP-redirect.p=
atch
> =3D> 0005-Fix-packet-discards-HTTP-redirect.patch} (71%)
>  rename meta/recipes-support/apr/apr/{configure.in-fix-LTFLAGS-to-make-it=
-work-with-ccache.patch
> =3D> 0006-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch} (81=
%)
>  rename meta/recipes-support/apr/apr/{0001-apr-fix-off_t-size-doesn-
> t-match-in-glibc-when-cross.patch =3D> 0007-apr-fix-off_t-size-doesn-
> t-match-in-glibc-when-cross.patch} (85%)
>  rename meta/recipes-support/apr/apr/{0002-explicitly-link-libapr-
> against-phtread-to-make-gold-.patch =3D> 0008-explicitly-link-libapr-
> against-phtread-to-make-gold-.patch} (90%)
>  delete mode 100644 meta/recipes-support/apr/apr/cleanup.patch
>  rename meta/recipes-support/apr/{apr_1.6.2.bb =3D> apr_1.6.3.bb} (81%)
>
> diff --git a/meta/recipes-support/apr/apr/configure_fixes.patch
> b/meta/recipes-support/apr/apr/0001-configure-fixes.patch
> similarity index 69%
> rename from meta/recipes-support/apr/apr/configure_fixes.patch
> rename to meta/recipes-support/apr/apr/0001-configure-fixes.patch
> index 0514000..374bb65 100644
> --- a/meta/recipes-support/apr/apr/configure_fixes.patch
> +++ b/meta/recipes-support/apr/apr/0001-configure-fixes.patch
> @@ -1,11 +1,22 @@
> +From ed491771f5a8976f9f05253f5f68b4cb5ac9b05f Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Tue, 30 Jan 2018 09:33:51 +0800
> +Subject: [PATCH 1/8] configure fixes
> +
>  Upstream-Status: Inappropriate [configuration]
>
> -Index: apr-1.3.3/configure.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- apr-1.3.3.orig/configure.in
> -+++ apr-1.3.3/configure.in
> -@@ -794,39 +794,6 @@ AC_CHECK_FUNCS([mmap munmap shm_open shm
> -                 create_area])
> +Rebase to 1.6.3
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + configure.in | 48 ++++++++----------------------------------------
> + 1 file changed, 8 insertions(+), 40 deletions(-)
> +
> +diff --git a/configure.in b/configure.in
> +index 719f331..470c99a 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -1167,39 +1167,6 @@ AC_CHECK_FUNCS([mmap munmap shm_open shm_unlink
> shmget shmat shmdt shmctl \
> +                 create_area mprotect])
>
>   APR_CHECK_DEFINE(MAP_ANON, sys/mman.h)
>  -AC_CHECK_FILE(/dev/zero)
> @@ -44,7 +55,7 @@ Index: apr-1.3.3/configure.in
>
>   # Now we determine which one is our anonymous shmem preference.
>   haveshmgetanon=3D"0"
> -@@ -1518,13 +1485,14 @@ else
> +@@ -1976,13 +1943,14 @@ else
>       bigendian=3D0
>   fi
>
> @@ -66,3 +77,6 @@ Index: apr-1.3.3/configure.in
>
>   AC_SUBST(voidp_size)
>   AC_SUBST(short_value)
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-support/apr/apr/0002-cleanup.patch
> b/meta/recipes-support/apr/apr/0002-cleanup.patch
> new file mode 100644
> index 0000000..1dc97e3
> --- /dev/null
> +++ b/meta/recipes-support/apr/apr/0002-cleanup.patch
> @@ -0,0 +1,59 @@
> +From 286ff5f96c7d3ff2210d0f1b43c670b9deea07ec Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Tue, 30 Jan 2018 09:36:32 +0800
> +Subject: [PATCH 2/8] cleanup
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Rebase to 1.6.3
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + build/buildcheck.sh | 35 +----------------------------------
> + 1 file changed, 1 insertion(+), 34 deletions(-)
> +
> +diff --git a/build/buildcheck.sh b/build/buildcheck.sh
> +index ab5df44..b7e719a 100755
> +--- a/build/buildcheck.sh
> ++++ b/build/buildcheck.sh
> +@@ -34,37 +34,4 @@ else
> +   fi
> + fi
> +
> +-# Sample libtool --version outputs:
> +-# ltmain.sh (GNU libtool) 1.3.3 (1.385.2.181 1999/07/02 15:49:11)
> +-# ltmain.sh (GNU libtool 1.1361 2004/01/02 23:10:52) 1.5a
> +-# output is multiline from 1.5 onwards
> +-
> +-# Require libtool 1.4 or newer
> +-libtool=3D`build/PrintPath glibtool1 glibtool libtool libtool15 libtool=
14`
> +-lt_pversion=3D`$libtool --version 2>/dev/null|sed -e
> 's/([^)]*)//g;s/^[^0-9]*//;s/[- ].*//g;q'`
> +-if test -z "$lt_pversion"; then
> +-  echo "buildconf: libtool not found."
> +-  echo "           You need libtool version 1.4 or newer installed"
> +-  echo "           to build APR from SVN."
> +-  res=3D1
> +-else
> +-  lt_version=3D`echo $lt_pversion|sed -e 's/\([a-z]*\)$/.\1/'`
> +-  IFS=3D.; set $lt_version; IFS=3D' '
> +-  lt_status=3D"good"
> +-  if test "$1" =3D "1"; then
> +-    if test "$2" -lt "4"; then
> +-      lt_status=3D"bad"
> +-    fi
> +-  fi
> +-  if test $lt_status =3D "good"; then
> +-    echo "buildconf: libtool version $lt_pversion (ok)"
> +-  else
> +-    echo "buildconf: libtool version $lt_pversion found."
> +-    echo "           You need libtool version 1.4 or newer installed"
> +-    echo "           to build APR from SVN."
> +-    res=3D1
> +-  fi
> +-fi
> +-
> +-exit $res
> +-
> ++exit 0
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-support/apr/apr/configfix.patch
> b/meta/recipes-support/apr/apr/0003-configfix.patch
> similarity index 75%
> rename from meta/recipes-support/apr/apr/configfix.patch
> rename to meta/recipes-support/apr/apr/0003-configfix.patch
> index 605c4f6..30194a7 100644
> --- a/meta/recipes-support/apr/apr/configfix.patch
> +++ b/meta/recipes-support/apr/apr/0003-configfix.patch
> @@ -1,10 +1,22 @@
> +From 70a98680045ce31b34dae191b980470e4988bf7f Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Tue, 30 Jan 2018 09:39:06 +0800
> +Subject: [PATCH 3/8] configfix
> +
>  Upstream-Status: Inappropriate [configuration]
>
> -Index: apr-1.3.3/apr-config.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- apr-1.3.3.orig/apr-config.in       2009-01-12 15:16:31.000000000
> +0000
> -+++ apr-1.3.3/apr-config.in    2009-01-12 15:19:25.000000000 +0000
> -@@ -152,14 +152,7 @@
> +Rebase to 1.6.3
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + apr-config.in | 26 ++------------------------
> + 1 file changed, 2 insertions(+), 24 deletions(-)
> +
> +diff --git a/apr-config.in b/apr-config.in
> +index 84b4073..bbbf651 100644
> +--- a/apr-config.in
> ++++ b/apr-config.in
> +@@ -152,14 +152,7 @@ while test $# -gt 0; do
>       flags=3D"$flags $LDFLAGS"
>       ;;
>       --includes)
> @@ -19,7 +31,7 @@ Index: apr-1.3.3/apr-config.in
>       ;;
>       --srcdir)
>       echo $APR_SOURCE_DIR
> -@@ -181,29 +167,14 @@
> +@@ -181,29 +174,14 @@ while test $# -gt 0; do
>       exit 0
>       ;;
>       --link-ld)
> @@ -51,3 +63,6 @@ Index: apr-1.3.3/apr-config.in
>       ;;
>       --shlib-path-var)
>       echo "$SHLIBPATH_VAR"
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-support/apr/apr/upgrade-and-fix-1.5.1.patch
> b/meta/recipes-support/apr/apr/0004-Makefile.in-fix-
> cross-compiling-failed.patch
> similarity index 81%
> rename from meta/recipes-support/apr/apr/upgrade-and-fix-1.5.1.patch
> rename to meta/recipes-support/apr/apr/0004-Makefile.in-fix-cross-
> compiling-failed.patch
> index 16499f5..b4517dd 100644
> --- a/meta/recipes-support/apr/apr/upgrade-and-fix-1.5.1.patch
> +++ b/meta/recipes-support/apr/apr/0004-Makefile.in-fix-
> cross-compiling-failed.patch
> @@ -1,4 +1,7 @@
> -Makefile.in: fix cross compiling failed
> +From 5b10d55396904982097e1da4c395fdeccb9d0d6a Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Tue, 30 Jan 2018 09:41:13 +0800
> +Subject: [PATCH 4/8] Makefile.in: fix cross compiling failed
>
>  The tools/gen_test_char was invoked at build time,
>  and it didn't work for the cross compiling, so we
> @@ -10,13 +13,14 @@ do_install time.
>
>  Upstream-Status: Inappropriate [oe specific]
>
> +Rebase to 1.6.3
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>  ---
>   Makefile.in | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
>
>  diff --git a/Makefile.in b/Makefile.in
> -index a2a5194..5fe028f 100644
> +index 5fb760e..f9e4445 100644
>  --- a/Makefile.in
>  +++ b/Makefile.in
>  @@ -46,7 +46,6 @@ LT_VERSION =3D @LT_VERSION@
> @@ -27,7 +31,7 @@ index a2a5194..5fe028f 100644
>         include/private/apr_escape_test_char.h
>   DISTCLEAN_TARGETS =3D config.cache config.log config.status \
>         include/apr.h include/arch/unix/apr_private.h \
> -@@ -129,13 +128,8 @@ check: $(TARGET_LIB)
> +@@ -131,13 +130,8 @@ check: $(TARGET_LIB)
>   etags:
>         etags `find . -name '*.[ch]'`
>
> @@ -43,3 +47,6 @@ index a2a5194..5fe028f 100644
>
>   include/private/apr_escape_test_char.h: tools/gen_test_char@EXEEXT@
>         $(APR_MKDIR) include/private
> +--
> +1.8.3.1
> +
> diff --git a/meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redire=
ct.patch
> b/meta/recipes-support/apr/apr/0005-Fix-packet-discards-
> HTTP-redirect.patch
> similarity index 71%
> rename from meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-
> redirect.patch
> rename to meta/recipes-support/apr/apr/0005-Fix-packet-discards-HTTP-
> redirect.patch
> index 6805b8b..2167da5 100644
> --- a/meta/recipes-support/apr/apr/Fix-packet-discards-HTTP-redirect.patc=
h
> +++ b/meta/recipes-support/apr/apr/0005-Fix-packet-discards-
> HTTP-redirect.patch
> @@ -1,4 +1,7 @@
> -Fix packet discards HTTP redirect.
> +From 78a148715444bdeb1363f0d1182901512146a439 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Tue, 30 Jan 2018 09:43:34 +0800
> +Subject: [PATCH 5/8] Fix packet discards HTTP redirect.
>
>  Disconnect the connection by poll() timeout.
>  If timeout=3D0 and apr_wait_for_io_or_timeout()=3DAPR_TIMEUP then
> @@ -8,12 +11,16 @@ Upstream-Status: Pending
>
>  Signed-off-by: Noriaki Yoshitane <yoshitane.nrs@cnt.ncos.nec.co.jp>
>  Signed-off-by: Li Wang <li.wang@windriver.com>
> +
> +Rebase to 1.6.3
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>  ---
> - network_io/unix/sendrecv.c |    4 ++++
> + network_io/unix/sendrecv.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
>  diff --git a/network_io/unix/sendrecv.c b/network_io/unix/sendrecv.c
> -index c133a26..e8faf15 100644
> +index 4c0e0a6..1bdafba 100644
>  --- a/network_io/unix/sendrecv.c
>  +++ b/network_io/unix/sendrecv.c
>  @@ -85,6 +85,10 @@ apr_status_t apr_socket_recv(apr_socket_t *sock, char
> *buf, apr_size_t *len)
> @@ -28,5 +35,5 @@ index c133a26..e8faf15 100644
>               *len =3D 0;
>               return arv;
>  --
> -1.7.9.5
> +1.8.3.1
>
> diff --git a/meta/recipes-support/apr/apr/configure.in-fix-LTFLAGS-
> to-make-it-work-with-ccache.patch b/meta/recipes-support/apr/
> apr/0006-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
> similarity index 81%
> rename from meta/recipes-support/apr/apr/configure.in-fix-LTFLAGS-to-
> make-it-work-with-ccache.patch
> rename to meta/recipes-support/apr/apr/0006-configure.in-fix-LTFLAGS-
> to-make-it-work-with-ccache.patch
> index 7521eeb..b8714b1 100644
> --- a/meta/recipes-support/apr/apr/configure.in-fix-LTFLAGS-
> to-make-it-work-with-ccache.patch
> +++ b/meta/recipes-support/apr/apr/0006-configure.in-fix-
> LTFLAGS-to-make-it-work-with-ccache.patch
> @@ -1,7 +1,7 @@
> -From d439093aa07a486f559206ac9e5808a6a18218cd Mon Sep 17 00:00:00 2001
> +From 9620df513b237c4839e3e6d6459d6363e21d48be Mon Sep 17 00:00:00 2001
>  From: Robert Yang <liezhi.yang@windriver.com>
>  Date: Thu, 19 Nov 2015 18:25:38 -0800
> -Subject: [PATCH] configure.in: fix LTFLAGS to make it work with ccache
> +Subject: [PATCH 6/8] configure.in: fix LTFLAGS to make it work with
> ccache
>
>  When ccache is enabled, libtool requires --tag=3DCC when use ccache,
>  otherwise when building apr-util with ccache enabled:
> @@ -15,11 +15,11 @@ Upstream-Status: Pending
>
>  Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>  ---
> - configure.in |    2 +-
> + configure.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/configure.in b/configure.in
> -index 5a4a988..9d57ae6 100644
> +index 470c99a..d215d98 100644
>  --- a/configure.in
>  +++ b/configure.in
>  @@ -246,7 +246,7 @@ case $host in
> @@ -32,5 +32,5 @@ index 5a4a988..9d57ae6 100644
>       if test "$experimental_libtool" =3D "yes"; then
>           # Use a custom-made libtool replacement
>  --
> -1.7.9.5
> +1.8.3.1
>
> diff --git a/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-
> doesn-t-match-in-glibc-when-cross.patch b/meta/recipes-support/apr/
> apr/0007-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
> similarity index 85%
> rename from meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-
> t-match-in-glibc-when-cross.patch
> rename to meta/recipes-support/apr/apr/0007-apr-fix-off_t-size-doesn-
> t-match-in-glibc-when-cross.patch
> index c5e92ac..f93da0d 100644
> --- a/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-
> doesn-t-match-in-glibc-when-cross.patch
> +++ b/meta/recipes-support/apr/apr/0007-apr-fix-off_t-size-
> doesn-t-match-in-glibc-when-cross.patch
> @@ -1,7 +1,7 @@
> -From f26e8b88d2c90ed7eb9d4e276412b0923c23d10f Mon Sep 17 00:00:00 2001
> +From 5252a5b8b47eaba3c05e69c43c8cea6b1b8acbc9 Mon Sep 17 00:00:00 2001
>  From: Dengke Du <dengke.du@windriver.com>
>  Date: Wed, 14 Dec 2016 18:13:08 +0800
> -Subject: [PATCH] apr: fix off_t size doesn't match in glibc when cross
> +Subject: [PATCH 7/8] apr: fix off_t size doesn't match in glibc when cro=
ss
>   compiling
>
>  In configure.in, it contains the following:
> @@ -34,10 +34,10 @@ Upstream-Status: Pending
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
>  diff --git a/configure.in b/configure.in
> -index 9d57ae6..5b19940 100644
> +index d215d98..3c579f5 100644
>  --- a/configure.in
>  +++ b/configure.in
> -@@ -1681,7 +1681,7 @@ else
> +@@ -1733,7 +1733,7 @@ else
>       socklen_t_value=3D"int"
>   fi
>
> @@ -46,7 +46,7 @@ index 9d57ae6..5b19940 100644
>
>   if test "$ac_cv_sizeof_pid_t" =3D "$ac_cv_sizeof_short"; then
>       pid_t_fmt=3D'#define APR_PID_T_FMT "hd"'
> -@@ -1750,7 +1750,7 @@ APR_CHECK_TYPES_COMPATIBLE(ssize_t, long,
> [ssize_t_fmt=3D"ld"])
> +@@ -1802,7 +1802,7 @@ APR_CHECK_TYPES_COMPATIBLE(ssize_t, long,
> [ssize_t_fmt=3D"ld"])
>   APR_CHECK_TYPES_COMPATIBLE(size_t, unsigned int, [size_t_fmt=3D"u"])
>   APR_CHECK_TYPES_COMPATIBLE(size_t, unsigned long, [size_t_fmt=3D"lu"])
>
> @@ -55,7 +55,7 @@ index 9d57ae6..5b19940 100644
>
>   AC_MSG_CHECKING([which format to use for apr_ssize_t])
>   if test -n "$ssize_t_fmt"; then
> -@@ -1767,7 +1767,7 @@ fi
> +@@ -1819,7 +1819,7 @@ fi
>
>   ssize_t_fmt=3D"#define APR_SSIZE_T_FMT \"$ssize_t_fmt\""
>
> @@ -64,7 +64,7 @@ index 9d57ae6..5b19940 100644
>
>   AC_MSG_CHECKING([which format to use for apr_size_t])
>   if test -n "$size_t_fmt"; then
> -@@ -1784,7 +1784,7 @@ fi
> +@@ -1836,7 +1836,7 @@ fi
>
>   size_t_fmt=3D"#define APR_SIZE_T_FMT \"$size_t_fmt\""
>
> @@ -74,5 +74,5 @@ index 9d57ae6..5b19940 100644
>   if test "${ac_cv_sizeof_off_t}${apr_cv_use_lfs64}" =3D "4yes"; then
>       # Enable LFS
>  --
> -2.7.4
> +1.8.3.1
>
> diff --git a/meta/recipes-support/apr/apr/0002-explicitly-link-
> libapr-against-phtread-to-make-gold-.patch b/meta/recipes-support/apr/
> apr/0008-explicitly-link-libapr-against-phtread-to-make-gold-.patch
> similarity index 90%
> rename from meta/recipes-support/apr/apr/0002-explicitly-link-libapr-
> against-phtread-to-make-gold-.patch
> rename to meta/recipes-support/apr/apr/0008-explicitly-link-libapr-
> against-phtread-to-make-gold-.patch
> index 7d0dddc..e7c0c8e 100644
> --- a/meta/recipes-support/apr/apr/0002-explicitly-link-
> libapr-against-phtread-to-make-gold-.patch
> +++ b/meta/recipes-support/apr/apr/0008-explicitly-link-
> libapr-against-phtread-to-make-gold-.patch
> @@ -1,8 +1,8 @@
> -From 94d1ca0266a0f9c0446f1299b54f752e87b8a695 Mon Sep 17 00:00:00 2001
> +From 922795e34289877ed2610f7bb44e044bcfb73cd5 Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
>  Date: Fri, 3 Mar 2017 22:24:17 +0100
> -Subject: [PATCH] explicitly link libapr against phtread to make gold
> happy on
> - test
> +Subject: [PATCH 8/8] explicitly link libapr against phtread to make gold
> happy
> + on test
>  MIME-Version: 1.0
>  Content-Type: text/plain; charset=3DUTF-8
>  Content-Transfer-Encoding: 8bit
> @@ -34,10 +34,10 @@ Signed-off-by: Andreas M=C3=BCller <
> schnitzeltony@googlemail.com>
>   1 file changed, 1 insertion(+)
>
>  diff --git a/configure.in b/configure.in
> -index 5b19940..cdf4d58 100644
> +index 3c579f5..06afb62 100644
>  --- a/configure.in
>  +++ b/configure.in
> -@@ -766,6 +766,7 @@ else
> +@@ -781,6 +781,7 @@ else
>             APR_PTHREADS_CHECK_RESTORE ] )
>       fi
>       if test "$pthreadh" =3D "1"; then
> @@ -46,5 +46,5 @@ index 5b19940..cdf4d58 100644
>           APR_CHECK_PTHREAD_ATTR_GETDETACHSTATE_ONE_ARG
>           APR_CHECK_PTHREAD_RECURSIVE_MUTEX
>  --
> -2.9.3
> +1.8.3.1
>
> diff --git a/meta/recipes-support/apr/apr/cleanup.patch
> b/meta/recipes-support/apr/apr/cleanup.patch
> deleted file mode 100644
> index b6784e0..0000000
> --- a/meta/recipes-support/apr/apr/cleanup.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> -Index: apr-1.4.2/build/buildcheck.sh
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- apr-1.4.2.orig/build/buildcheck.sh 2009-11-13 08:27:16.000000000
> +0800
> -+++ apr-1.4.2/build/buildcheck.sh      2010-11-26 15:44:00.000000000 +08=
00
> -@@ -32,35 +32,4 @@
> - echo "buildconf: autoconf version $ac_version (ok)"
> - fi
> -
> --# Sample libtool --version outputs:
> --# ltmain.sh (GNU libtool) 1.3.3 (1.385.2.181 1999/07/02 15:49:11)
> --# ltmain.sh (GNU libtool 1.1361 2004/01/02 23:10:52) 1.5a
> --# output is multiline from 1.5 onwards
> --
> --# Require libtool 1.4 or newer
> --libtool=3D`build/PrintPath glibtool1 glibtool libtool libtool15 libtool=
14`
> --lt_pversion=3D`$libtool --version 2>/dev/null|sed -e
> 's/([^)]*)//g;s/^[^0-9]*//;s/[- ].*//g;q'`
> --if test -z "$lt_pversion"; then
> --echo "buildconf: libtool not found."
> --echo "           You need libtool version 1.4 or newer installed"
> --echo "           to build APR from SVN."
> --exit 1
> --fi
> --lt_version=3D`echo $lt_pversion|sed -e 's/\([a-z]*\)$/.\1/'`
> --IFS=3D.; set $lt_version; IFS=3D' '
> --lt_status=3D"good"
> --if test "$1" =3D "1"; then
> --   if test "$2" -lt "4"; then
> --      lt_status=3D"bad"
> --   fi
> --fi
> --if test $lt_status =3D "good"; then
> --   echo "buildconf: libtool version $lt_pversion (ok)"
> --   exit 0
> --fi
> --
> --echo "buildconf: libtool version $lt_pversion found."
> --echo "           You need libtool version 1.4 or newer installed"
> --echo "           to build APR from SVN."
> --
> --exit 1
> -+exit 0
> diff --git a/meta/recipes-support/apr/apr_1.6.2.bb
> b/meta/recipes-support/apr/apr_1.6.3.bb
> similarity index 81%
> rename from meta/recipes-support/apr/apr_1.6.2.bb
> rename to meta/recipes-support/apr/apr_1.6.3.bb
> index e2eed53..1bc4759 100644
> --- a/meta/recipes-support/apr/apr_1.6.2.bb
> +++ b/meta/recipes-support/apr/apr_1.6.3.bb
> @@ -10,19 +10,19 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D
> 4dfd4cd216828c8cae5de5a12f3844c8 \
>  BBCLASSEXTEND =3D "native nativesdk"
>
>  SRC_URI =3D "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
> -           file://configure_fixes.patch \
> -           file://cleanup.patch \
> -           file://configfix.patch \
>             file://run-ptest \
> -           file://upgrade-and-fix-1.5.1.patch \
> -           file://Fix-packet-discards-HTTP-redirect.patch \
> -           file://configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.p=
atch
> \
> -           file://0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cr=
oss.patch
> \
> -           file://0002-explicitly-link-libapr-against-phtread-to-make-go=
ld-.patch
> \
> +           file://0001-configure-fixes.patch \
> +           file://0002-cleanup.patch \
> +           file://0003-configfix.patch \
> +           file://0004-Makefile.in-fix-cross-compiling-failed.patch \
> +           file://0005-Fix-packet-discards-HTTP-redirect.patch \
> +           file://0006-configure.in-fix-LTFLAGS-to-make-it-work-with-cca=
che.patch
> \
> +           file://0007-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cr=
oss.patch
> \
> +           file://0008-explicitly-link-libapr-against-phtread-to-make-go=
ld-.patch
> \
>  "
>
> -SRC_URI[md5sum] =3D "e81a851967c79b5ce9bfbc909e4bf735"
> -SRC_URI[sha256sum] =3D "09109cea377bab0028bba19a92b5b0
> e89603df9eab05c0f7dbd4dd83d48dcebd"
> +SRC_URI[md5sum] =3D "12f2a349483ad6f12db49ba01fbfdbfa"
> +SRC_URI[sha256sum] =3D "131f06d16d7aabd097fa992a33eec2
> b6af3962f93e6d570a9bd4d85e95993172"
>
>  inherit autotools-brokensep lib_package binconfig multilib_header ptest
>
> @@ -69,7 +69,8 @@ do_install_append() {
>  }
>
>  do_install_append_class-target() {
> -       sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${datadir}/build-1/apr_
> rules.mk
> +       sed -i -e 's,${DEBUG_PREFIX_MAP},,g' \
> +              -e 's,${STAGING_DIR_HOST},,g' ${D}${datadir}/build-1/apr_
> rules.mk
>         sed -i -e 's,${STAGING_DIR_HOST},,g' \
>                -e 's,APR_SOURCE_DIR=3D.*,APR_SOURCE_DIR=3D,g' \
>                -e 's,APR_BUILD_DIR=3D.*,APR_BUILD_DIR=3D,g'
> ${D}${bindir}/apr-1-config
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141a2a4232147056410fb2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We&#39;re carrying a lot of patches here, and I&#39;m not =
convinced that they are all inappropriate.=C2=A0 Would you be willing to se=
e what of those are upstreamable?<div><br></div><div>Ross</div></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On 31 January 2018 at 0=
7:48, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"mailto:hongxu.jia@windriv=
er.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">- Rebase patches 0001 ~ 0008<br>
<br>
- Fix build path issue to improve reproducibility<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">h=
ongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0...gure_fixes.patch =3D&gt; 0001-configure-fixes.patch} | 28 +++++++-=
--<br>
=C2=A0meta/recipes-support/apr/apr/<wbr>0002-cleanup.patch=C2=A0 =C2=A0 | 5=
9 ++++++++++++++++++++++<br>
=C2=A0.../apr/{configfix.patch =3D&gt; 0003-configfix.patch}=C2=A0 | 27 +++=
++++---<br>
=C2=A0...4-Makefile.in-fix-cross-<wbr>compiling-failed.patch} | 13 +++--<br=
>
=C2=A0...&gt; 0005-Fix-packet-discards-HTTP-<wbr>redirect.patch} | 15 ++++-=
-<br>
=C2=A0...-fix-LTFLAGS-to-make-it-<wbr>work-with-ccache.patch} | 10 ++--<br>
=C2=A0...t-size-doesn-t-match-in-<wbr>glibc-when-cross.patch} | 16 +++---<b=
r>
=C2=A0...ink-libapr-against-phtread-<wbr>to-make-gold-.patch} | 12 ++---<br=
>
=C2=A0meta/recipes-support/apr/apr/<wbr>cleanup.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 43 ----------------<br>
=C2=A0.../apr/{<a href=3D"http://apr_1.6.2.bb" rel=3D"noreferrer" target=3D=
"_blank">apr_1.6.2.bb</a> =3D&gt; <a href=3D"http://apr_1.6.3.bb" rel=3D"no=
referrer" target=3D"_blank">apr_1.6.3.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 23 +++++----<br>
=C2=A010 files changed, 153 insertions(+), 93 deletions(-)<br>
=C2=A0rename meta/recipes-support/apr/apr/{<wbr>configure_fixes.patch =3D&g=
t; 0001-configure-fixes.patch} (69%)<br>
=C2=A0create mode 100644 meta/recipes-support/apr/apr/<wbr>0002-cleanup.pat=
ch<br>
=C2=A0rename meta/recipes-support/apr/apr/{<wbr>configfix.patch =3D&gt; 000=
3-configfix.patch} (75%)<br>
=C2=A0rename meta/recipes-support/apr/apr/{<wbr>upgrade-and-fix-1.5.1.patch=
 =3D&gt; 0004-Makefile.in-fix-cross-<wbr>compiling-failed.patch} (81%)<br>
=C2=A0rename meta/recipes-support/apr/apr/{<wbr>Fix-packet-discards-HTTP-<w=
br>redirect.patch =3D&gt; 0005-Fix-packet-discards-HTTP-<wbr>redirect.patch=
} (71%)<br>
=C2=A0rename meta/recipes-support/apr/apr/{<wbr>configure.in-fix-LTFLAGS-to=
-<wbr>make-it-work-with-ccache.patch =3D&gt; 0006-configure.in-fix-LTFLAGS-=
<wbr>to-make-it-work-with-ccache.<wbr>patch} (81%)<br>
=C2=A0rename meta/recipes-support/apr/apr/{<wbr>0001-apr-fix-off_t-size-doe=
sn-<wbr>t-match-in-glibc-when-cross.<wbr>patch =3D&gt; 0007-apr-fix-off_t-s=
ize-doesn-<wbr>t-match-in-glibc-when-cross.<wbr>patch} (85%)<br>
=C2=A0rename meta/recipes-support/apr/apr/{<wbr>0002-explicitly-link-libapr=
-<wbr>against-phtread-to-make-gold-.<wbr>patch =3D&gt; 0008-explicitly-link=
-libapr-<wbr>against-phtread-to-make-gold-.<wbr>patch} (90%)<br>
=C2=A0delete mode 100644 meta/recipes-support/apr/apr/<wbr>cleanup.patch<br=
>
=C2=A0rename meta/recipes-support/apr/{<a href=3D"http://apr_1.6.2.bb" rel=
=3D"noreferrer" target=3D"_blank">apr_<wbr>1.6.2.bb</a> =3D&gt; <a href=3D"=
http://apr_1.6.3.bb" rel=3D"noreferrer" target=3D"_blank">apr_1.6.3.bb</a>}=
 (81%)<br>
<br>
diff --git a/meta/recipes-support/apr/<wbr>apr/configure_fixes.patch b/meta=
/recipes-support/apr/<wbr>apr/0001-configure-fixes.patch<br>
similarity index 69%<br>
rename from meta/recipes-support/apr/apr/<wbr>configure_fixes.patch<br>
rename to meta/recipes-support/apr/apr/<wbr>0001-configure-fixes.patch<br>
index 0514000..374bb65 100644<br>
--- a/meta/recipes-support/apr/<wbr>apr/configure_fixes.patch<br>
+++ b/meta/recipes-support/apr/<wbr>apr/0001-configure-fixes.patch<br>
@@ -1,11 +1,22 @@<br>
+From ed491771f5a8976f9f05253f5f68b4<wbr>cb5ac9b05f Mon Sep 17 00:00:00 200=
1<br>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.ji=
a@windriver.com</a>&gt;<br>
+Date: Tue, 30 Jan 2018 09:33:51 +0800<br>
+Subject: [PATCH 1/8] configure fixes<br>
+<br>
=C2=A0Upstream-Status: Inappropriate [configuration]<br>
<br>
-Index: apr-1.3.3/<a href=3D"http://configure.in" rel=3D"noreferrer" target=
=3D"_blank">configure.in</a><br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- apr-1.3.3.orig/<a href=3D"http://configure.in" rel=3D"noreferrer" targ=
et=3D"_blank">configure.in</a><br>
-+++ apr-1.3.3/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D=
"_blank">configure.in</a><br>
-@@ -794,39 +794,6 @@ AC_CHECK_FUNCS([mmap munmap shm_open shm<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_area]=
)<br>
+Rebase to 1.6.3<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">=
hongxu.jia@windriver.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank">conf=
igure.in</a> | 48 ++++++++----------------------<wbr>------------------<br>
+ 1 file changed, 8 insertions(+), 40 deletions(-)<br>
+<br>
+diff --git a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"=
_blank">configure.in</a> b/<a href=3D"http://configure.in" rel=3D"noreferre=
r" target=3D"_blank">configure.in</a><br>
+index 719f331..470c99a 100644<br>
+--- a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a><br>
++++ b/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank"=
>configure.in</a><br>
+@@ -1167,39 +1167,6 @@ AC_CHECK_FUNCS([mmap munmap shm_open shm_unlink shm=
get shmat shmdt shmctl \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_area =
mprotect])<br>
<br>
=C2=A0 APR_CHECK_DEFINE(MAP_ANON, sys/mman.h)<br>
=C2=A0-AC_CHECK_FILE(/dev/zero)<br>
@@ -44,7 +55,7 @@ Index: apr-1.3.3/<a href=3D"http://configure.in" rel=3D"n=
oreferrer" target=3D"_blank">configure.in</a><br>
<br>
=C2=A0 # Now we determine which one is our anonymous shmem preference.<br>
=C2=A0 haveshmgetanon=3D&quot;0&quot;<br>
-@@ -1518,13 +1485,14 @@ else<br>
+@@ -1976,13 +1943,14 @@ else<br>
=C2=A0 =C2=A0 =C2=A0 bigendian=3D0<br>
=C2=A0 fi<br>
<br>
@@ -66,3 +77,6 @@ Index: apr-1.3.3/<a href=3D"http://configure.in" rel=3D"n=
oreferrer" target=3D"_blank">configure.in</a><br>
<br>
=C2=A0 AC_SUBST(voidp_size)<br>
=C2=A0 AC_SUBST(short_value)<br>
+--<br>
+1.8.3.1<br>
+<br>
diff --git a/meta/recipes-support/apr/<wbr>apr/0002-cleanup.patch b/meta/re=
cipes-support/apr/<wbr>apr/0002-cleanup.patch<br>
new file mode 100644<br>
index 0000000..1dc97e3<br>
--- /dev/null<br>
+++ b/meta/recipes-support/apr/<wbr>apr/0002-cleanup.patch<br>
@@ -0,0 +1,59 @@<br>
+From 286ff5f96c7d3ff2210d0f1b43c670<wbr>b9deea07ec Mon Sep 17 00:00:00 200=
1<br>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.ji=
a@windriver.com</a>&gt;<br>
+Date: Tue, 30 Jan 2018 09:36:32 +0800<br>
+Subject: [PATCH 2/8] cleanup<br>
+<br>
+Upstream-Status: Inappropriate [configuration]<br>
+<br>
+Rebase to 1.6.3<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">=
hongxu.jia@windriver.com</a>&gt;<br>
+---<br>
+ build/buildcheck.sh | 35 +-----------------------------<wbr>-----<br>
+ 1 file changed, 1 insertion(+), 34 deletions(-)<br>
+<br>
+diff --git a/build/buildcheck.sh b/build/buildcheck.sh<br>
+index ab5df44..b7e719a 100755<br>
+--- a/build/buildcheck.sh<br>
++++ b/build/buildcheck.sh<br>
+@@ -34,37 +34,4 @@ else<br>
+=C2=A0 =C2=A0fi<br>
+ fi<br>
+<br>
+-# Sample libtool --version outputs:<br>
+-# ltmain.sh (GNU libtool) 1.3.3 (1.385.2.181 1999/07/02 15:49:11)<br>
+-# ltmain.sh (GNU libtool 1.1361 2004/01/02 23:10:52) 1.5a<br>
+-# output is multiline from 1.5 onwards<br>
+-<br>
+-# Require libtool 1.4 or newer<br>
+-libtool=3D`build/PrintPath glibtool1 glibtool libtool libtool15 libtool14=
`<br>
+-lt_pversion=3D`$libtool --version 2&gt;/dev/null|sed -e &#39;s/([^)]*)//g=
;s/^[^0-9]*//;s/[<wbr>- ].*//g;q&#39;`<br>
+-if test -z &quot;$lt_pversion&quot;; then<br>
+-=C2=A0 echo &quot;buildconf: libtool not found.&quot;<br>
+-=C2=A0 echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0You need libto=
ol version 1.4 or newer installed&quot;<br>
+-=C2=A0 echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to build APR f=
rom SVN.&quot;<br>
+-=C2=A0 res=3D1<br>
+-else<br>
+-=C2=A0 lt_version=3D`echo $lt_pversion|sed -e &#39;s/\([a-z]*\)$/.\1/&#39=
;`<br>
+-=C2=A0 IFS=3D.; set $lt_version; IFS=3D&#39; &#39;<br>
+-=C2=A0 lt_status=3D&quot;good&quot;<br>
+-=C2=A0 if test &quot;$1&quot; =3D &quot;1&quot;; then<br>
+-=C2=A0 =C2=A0 if test &quot;$2&quot; -lt &quot;4&quot;; then<br>
+-=C2=A0 =C2=A0 =C2=A0 lt_status=3D&quot;bad&quot;<br>
+-=C2=A0 =C2=A0 fi<br>
+-=C2=A0 fi<br>
+-=C2=A0 if test $lt_status =3D &quot;good&quot;; then<br>
+-=C2=A0 =C2=A0 echo &quot;buildconf: libtool version $lt_pversion (ok)&quo=
t;<br>
+-=C2=A0 else<br>
+-=C2=A0 =C2=A0 echo &quot;buildconf: libtool version $lt_pversion found.&q=
uot;<br>
+-=C2=A0 =C2=A0 echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0You nee=
d libtool version 1.4 or newer installed&quot;<br>
+-=C2=A0 =C2=A0 echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to buil=
d APR from SVN.&quot;<br>
+-=C2=A0 =C2=A0 res=3D1<br>
+-=C2=A0 fi<br>
+-fi<br>
+-<br>
+-exit $res<br>
+-<br>
++exit 0<br>
+--<br>
+1.8.3.1<br>
+<br>
diff --git a/meta/recipes-support/apr/<wbr>apr/configfix.patch b/meta/recip=
es-support/apr/<wbr>apr/0003-configfix.patch<br>
similarity index 75%<br>
rename from meta/recipes-support/apr/apr/<wbr>configfix.patch<br>
rename to meta/recipes-support/apr/apr/<wbr>0003-configfix.patch<br>
index 605c4f6..30194a7 100644<br>
--- a/meta/recipes-support/apr/<wbr>apr/configfix.patch<br>
+++ b/meta/recipes-support/apr/<wbr>apr/0003-configfix.patch<br>
@@ -1,10 +1,22 @@<br>
+From 70a98680045ce31b34dae191b98047<wbr>0e4988bf7f Mon Sep 17 00:00:00 200=
1<br>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.ji=
a@windriver.com</a>&gt;<br>
+Date: Tue, 30 Jan 2018 09:39:06 +0800<br>
+Subject: [PATCH 3/8] configfix<br>
+<br>
=C2=A0Upstream-Status: Inappropriate [configuration]<br>
<br>
-Index: apr-1.3.3/<a href=3D"http://apr-config.in" rel=3D"noreferrer" targe=
t=3D"_blank">apr-config.in</a><br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- apr-1.3.3.orig/<a href=3D"http://apr-config.in" rel=3D"noreferrer" tar=
get=3D"_blank">apr-config.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A02009-01-12 15:16=
:31.000000000 +0000<br>
-+++ apr-1.3.3/<a href=3D"http://apr-config.in" rel=3D"noreferrer" target=
=3D"_blank">apr-config.in</a>=C2=A0 =C2=A0 2009-01-12 15:19:25.000000000 +0=
000<br>
-@@ -152,14 +152,7 @@<br>
+Rebase to 1.6.3<br>
+<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">=
hongxu.jia@windriver.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://apr-config.in" rel=3D"noreferrer" target=3D"_blank">apr=
-config.in</a> | 26 ++------------------------<br>
+ 1 file changed, 2 insertions(+), 24 deletions(-)<br>
+<br>
+diff --git a/<a href=3D"http://apr-config.in" rel=3D"noreferrer" target=3D=
"_blank">apr-config.in</a> b/<a href=3D"http://apr-config.in" rel=3D"norefe=
rrer" target=3D"_blank">apr-config.in</a><br>
+index 84b4073..bbbf651 100644<br>
+--- a/<a href=3D"http://apr-config.in" rel=3D"noreferrer" target=3D"_blank=
">apr-config.in</a><br>
++++ b/<a href=3D"http://apr-config.in" rel=3D"noreferrer" target=3D"_blank=
">apr-config.in</a><br>
+@@ -152,14 +152,7 @@ while test $# -gt 0; do<br>
=C2=A0 =C2=A0 =C2=A0 flags=3D&quot;$flags $LDFLAGS&quot;<br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 --includes)<br>
@@ -19,7 +31,7 @@ Index: apr-1.3.3/<a href=3D"http://apr-config.in" rel=3D"=
noreferrer" target=3D"_blank">apr-config.in</a><br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 --srcdir)<br>
=C2=A0 =C2=A0 =C2=A0 echo $APR_SOURCE_DIR<br>
-@@ -181,29 +167,14 @@<br>
+@@ -181,29 +174,14 @@ while test $# -gt 0; do<br>
=C2=A0 =C2=A0 =C2=A0 exit 0<br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 --link-ld)<br>
@@ -51,3 +63,6 @@ Index: apr-1.3.3/<a href=3D"http://apr-config.in" rel=3D"=
noreferrer" target=3D"_blank">apr-config.in</a><br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 --shlib-path-var)<br>
=C2=A0 =C2=A0 =C2=A0 echo &quot;$SHLIBPATH_VAR&quot;<br>
+--<br>
+1.8.3.1<br>
+<br>
diff --git a/meta/recipes-support/apr/<wbr>apr/upgrade-and-fix-1.5.1.<wbr>p=
atch b/meta/recipes-support/apr/<wbr>apr/0004-Makefile.in-fix-<wbr>cross-co=
mpiling-failed.patch<br>
similarity index 81%<br>
rename from meta/recipes-support/apr/apr/<wbr>upgrade-and-fix-1.5.1.patch<b=
r>
rename to meta/recipes-support/apr/apr/<wbr>0004-Makefile.in-fix-cross-<wbr=
>compiling-failed.patch<br>
index 16499f5..b4517dd 100644<br>
--- a/meta/recipes-support/apr/<wbr>apr/upgrade-and-fix-1.5.1.<wbr>patch<br=
>
+++ b/meta/recipes-support/apr/<wbr>apr/0004-Makefile.in-fix-<wbr>cross-com=
piling-failed.patch<br>
@@ -1,4 +1,7 @@<br>
-Makefile.in: fix cross compiling failed<br>
+From 5b10d55396904982097e1da4c395fd<wbr>eccb9d0d6a Mon Sep 17 00:00:00 200=
1<br>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.ji=
a@windriver.com</a>&gt;<br>
+Date: Tue, 30 Jan 2018 09:41:13 +0800<br>
+Subject: [PATCH 4/8] Makefile.in: fix cross compiling failed<br>
<br>
=C2=A0The tools/gen_test_char was invoked at build time,<br>
=C2=A0and it didn&#39;t work for the cross compiling, so we<br>
@@ -10,13 +13,14 @@ do_install time.<br>
<br>
=C2=A0Upstream-Status: Inappropriate [oe specific]<br>
<br>
+Rebase to 1.6.3<br>
=C2=A0Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.=
com">hongxu.jia@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 Makefile.in | 10 ++--------<br>
=C2=A0 1 file changed, 2 insertions(+), 8 deletions(-)<br>
<br>
=C2=A0diff --git a/Makefile.in b/Makefile.in<br>
-index a2a5194..5fe028f 100644<br>
+index 5fb760e..f9e4445 100644<br>
=C2=A0--- a/Makefile.in<br>
=C2=A0+++ b/Makefile.in<br>
=C2=A0@@ -46,7 +46,6 @@ LT_VERSION =3D @LT_VERSION@<br>
@@ -27,7 +31,7 @@ index a2a5194..5fe028f 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 include/private/apr_escape_<wbr>test_char.h<br>
=C2=A0 DISTCLEAN_TARGETS =3D config.cache config.log config.status \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 include/apr.h include/arch/unix/apr_private.<wb=
r>h \<br>
-@@ -129,13 +128,8 @@ check: $(TARGET_LIB)<br>
+@@ -131,13 +130,8 @@ check: $(TARGET_LIB)<br>
=C2=A0 etags:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 etags `find . -name &#39;*.[ch]&#39;`<br>
<br>
@@ -43,3 +47,6 @@ index a2a5194..5fe028f 100644<br>
<br>
=C2=A0 include/private/apr_escape_<wbr>test_char.h: tools/gen_test_char@EXE=
EXT@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(APR_MKDIR) include/private<br>
+--<br>
+1.8.3.1<br>
+<br>
diff --git a/meta/recipes-support/apr/<wbr>apr/Fix-packet-discards-HTTP-<wb=
r>redirect.patch b/meta/recipes-support/apr/<wbr>apr/0005-Fix-packet-discar=
ds-<wbr>HTTP-redirect.patch<br>
similarity index 71%<br>
rename from meta/recipes-support/apr/apr/<wbr>Fix-packet-discards-HTTP-<wbr=
>redirect.patch<br>
rename to meta/recipes-support/apr/apr/<wbr>0005-Fix-packet-discards-HTTP-<=
wbr>redirect.patch<br>
index 6805b8b..2167da5 100644<br>
--- a/meta/recipes-support/apr/<wbr>apr/Fix-packet-discards-HTTP-<wbr>redir=
ect.patch<br>
+++ b/meta/recipes-support/apr/<wbr>apr/0005-Fix-packet-discards-<wbr>HTTP-=
redirect.patch<br>
@@ -1,4 +1,7 @@<br>
-Fix packet discards HTTP redirect.<br>
+From 78a148715444bdeb1363f0d1182901<wbr>512146a439 Mon Sep 17 00:00:00 200=
1<br>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.ji=
a@windriver.com</a>&gt;<br>
+Date: Tue, 30 Jan 2018 09:43:34 +0800<br>
+Subject: [PATCH 5/8] Fix packet discards HTTP redirect.<br>
<br>
=C2=A0Disconnect the connection by poll() timeout.<br>
=C2=A0If timeout=3D0 and apr_wait_for_io_or_timeout()=3D<wbr>APR_TIMEUP the=
n<br>
@@ -8,12 +11,16 @@ Upstream-Status: Pending<br>
<br>
=C2=A0Signed-off-by: Noriaki Yoshitane &lt;<a href=3D"mailto:yoshitane.nrs@=
cnt.ncos.nec.co.jp">yoshitane.nrs@cnt.ncos.nec.<wbr>co.jp</a>&gt;<br>
=C2=A0Signed-off-by: Li Wang &lt;<a href=3D"mailto:li.wang@windriver.com">l=
i.wang@windriver.com</a>&gt;<br>
+<br>
+Rebase to 1.6.3<br>
+<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">=
hongxu.jia@windriver.com</a>&gt;<br>
=C2=A0---<br>
- network_io/unix/sendrecv.c |=C2=A0 =C2=A0 4 ++++<br>
+ network_io/unix/sendrecv.c | 4 ++++<br>
=C2=A0 1 file changed, 4 insertions(+)<br>
<br>
=C2=A0diff --git a/network_io/unix/sendrecv.c b/network_io/unix/sendrecv.c<=
br>
-index c133a26..e8faf15 100644<br>
+index 4c0e0a6..1bdafba 100644<br>
=C2=A0--- a/network_io/unix/sendrecv.c<br>
=C2=A0+++ b/network_io/unix/sendrecv.c<br>
=C2=A0@@ -85,6 +85,10 @@ apr_status_t apr_socket_recv(apr_socket_t *sock, c=
har *buf, apr_size_t *len)<br>
@@ -28,5 +35,5 @@ index c133a26..e8faf15 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *len =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return arv;<br>
=C2=A0--<br>
-1.7.9.5<br>
+1.8.3.1<br>
<br>
diff --git a/meta/recipes-support/apr/<wbr>apr/configure.in-fix-LTFLAGS-<wb=
r>to-make-it-work-with-ccache.<wbr>patch b/meta/recipes-support/apr/<wbr>ap=
r/0006-configure.in-fix-<wbr>LTFLAGS-to-make-it-work-with-<wbr>ccache.patch=
<br>
similarity index 81%<br>
rename from meta/recipes-support/apr/apr/<wbr>configure.in-fix-LTFLAGS-to-<=
wbr>make-it-work-with-ccache.patch<br>
rename to meta/recipes-support/apr/apr/<wbr>0006-configure.in-fix-LTFLAGS-<=
wbr>to-make-it-work-with-ccache.<wbr>patch<br>
index 7521eeb..b8714b1 100644<br>
--- a/meta/recipes-support/apr/<wbr>apr/configure.in-fix-LTFLAGS-<wbr>to-ma=
ke-it-work-with-ccache.<wbr>patch<br>
+++ b/meta/recipes-support/apr/<wbr>apr/0006-configure.in-fix-<wbr>LTFLAGS-=
to-make-it-work-with-<wbr>ccache.patch<br>
@@ -1,7 +1,7 @@<br>
-From d439093aa07a486f559206ac9e5808<wbr>a6a18218cd Mon Sep 17 00:00:00 200=
1<br>
+From 9620df513b237c4839e3e6d6459d63<wbr>63e21d48be Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com">li=
ezhi.yang@windriver.com</a>&gt;<br>
=C2=A0Date: Thu, 19 Nov 2015 18:25:38 -0800<br>
-Subject: [PATCH] <a href=3D"http://configure.in" rel=3D"noreferrer" target=
=3D"_blank">configure.in</a>: fix LTFLAGS to make it work with ccache<br>
+Subject: [PATCH 6/8] <a href=3D"http://configure.in" rel=3D"noreferrer" ta=
rget=3D"_blank">configure.in</a>: fix LTFLAGS to make it work with ccache<b=
r>
<br>
=C2=A0When ccache is enabled, libtool requires --tag=3DCC when use ccache,<=
br>
=C2=A0otherwise when building apr-util with ccache enabled:<br>
@@ -15,11 +15,11 @@ Upstream-Status: Pending<br>
<br>
=C2=A0Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windrive=
r.com">liezhi.yang@windriver.com</a>&gt;<br>
=C2=A0---<br>
- <a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank">conf=
igure.in</a> |=C2=A0 =C2=A0 2 +-<br>
+ <a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blank">conf=
igure.in</a> | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.in" rel=3D"noreferrer" targe=
t=3D"_blank">configure.in</a> b/<a href=3D"http://configure.in" rel=3D"nore=
ferrer" target=3D"_blank">configure.in</a><br>
-index 5a4a988..9d57ae6 100644<br>
+index 470c99a..d215d98 100644<br>
=C2=A0--- a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_b=
lank">configure.in</a><br>
=C2=A0+++ b/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_b=
lank">configure.in</a><br>
=C2=A0@@ -246,7 +246,7 @@ case $host in<br>
@@ -32,5 +32,5 @@ index 5a4a988..9d57ae6 100644<br>
=C2=A0 =C2=A0 =C2=A0 if test &quot;$experimental_libtool&quot; =3D &quot;ye=
s&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Use a custom-made libtool replacement<=
br>
=C2=A0--<br>
-1.7.9.5<br>
+1.8.3.1<br>
<br>
diff --git a/meta/recipes-support/apr/<wbr>apr/0001-apr-fix-off_t-size-<wbr=
>doesn-t-match-in-glibc-when-<wbr>cross.patch b/meta/recipes-support/apr/<w=
br>apr/0007-apr-fix-off_t-size-<wbr>doesn-t-match-in-glibc-when-<wbr>cross.=
patch<br>
similarity index 85%<br>
rename from meta/recipes-support/apr/apr/<wbr>0001-apr-fix-off_t-size-doesn=
-<wbr>t-match-in-glibc-when-cross.<wbr>patch<br>
rename to meta/recipes-support/apr/apr/<wbr>0007-apr-fix-off_t-size-doesn-<=
wbr>t-match-in-glibc-when-cross.<wbr>patch<br>
index c5e92ac..f93da0d 100644<br>
--- a/meta/recipes-support/apr/<wbr>apr/0001-apr-fix-off_t-size-<wbr>doesn-=
t-match-in-glibc-when-<wbr>cross.patch<br>
+++ b/meta/recipes-support/apr/<wbr>apr/0007-apr-fix-off_t-size-<wbr>doesn-=
t-match-in-glibc-when-<wbr>cross.patch<br>
@@ -1,7 +1,7 @@<br>
-From f26e8b88d2c90ed7eb9d4e276412b0<wbr>923c23d10f Mon Sep 17 00:00:00 200=
1<br>
+From 5252a5b8b47eaba3c05e69c43c8cea<wbr>6b1b8acbc9 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">dengke=
.du@windriver.com</a>&gt;<br>
=C2=A0Date: Wed, 14 Dec 2016 18:13:08 +0800<br>
-Subject: [PATCH] apr: fix off_t size doesn&#39;t match in glibc when cross=
<br>
+Subject: [PATCH 7/8] apr: fix off_t size doesn&#39;t match in glibc when c=
ross<br>
=C2=A0 compiling<br>
<br>
=C2=A0In <a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_blan=
k">configure.in</a>, it contains the following:<br>
@@ -34,10 +34,10 @@ Upstream-Status: Pending<br>
=C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.in" rel=3D"noreferrer" targe=
t=3D"_blank">configure.in</a> b/<a href=3D"http://configure.in" rel=3D"nore=
ferrer" target=3D"_blank">configure.in</a><br>
-index 9d57ae6..5b19940 100644<br>
+index d215d98..3c579f5 100644<br>
=C2=A0--- a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_b=
lank">configure.in</a><br>
=C2=A0+++ b/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_b=
lank">configure.in</a><br>
-@@ -1681,7 +1681,7 @@ else<br>
+@@ -1733,7 +1733,7 @@ else<br>
=C2=A0 =C2=A0 =C2=A0 socklen_t_value=3D&quot;int&quot;<br>
=C2=A0 fi<br>
<br>
@@ -46,7 +46,7 @@ index 9d57ae6..5b19940 100644<br>
<br>
=C2=A0 if test &quot;$ac_cv_sizeof_pid_t&quot; =3D &quot;$ac_cv_sizeof_shor=
t&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 pid_t_fmt=3D&#39;#define APR_PID_T_FMT &quot;hd&quot;&=
#39;<br>
-@@ -1750,7 +1750,7 @@ APR_CHECK_TYPES_COMPATIBLE(<wbr>ssize_t, long, [ssiz=
e_t_fmt=3D&quot;ld&quot;])<br>
+@@ -1802,7 +1802,7 @@ APR_CHECK_TYPES_COMPATIBLE(<wbr>ssize_t, long, [ssiz=
e_t_fmt=3D&quot;ld&quot;])<br>
=C2=A0 APR_CHECK_TYPES_COMPATIBLE(<wbr>size_t, unsigned int, [size_t_fmt=3D=
&quot;u&quot;])<br>
=C2=A0 APR_CHECK_TYPES_COMPATIBLE(<wbr>size_t, unsigned long, [size_t_fmt=
=3D&quot;lu&quot;])<br>
<br>
@@ -55,7 +55,7 @@ index 9d57ae6..5b19940 100644<br>
<br>
=C2=A0 AC_MSG_CHECKING([which format to use for apr_ssize_t])<br>
=C2=A0 if test -n &quot;$ssize_t_fmt&quot;; then<br>
-@@ -1767,7 +1767,7 @@ fi<br>
+@@ -1819,7 +1819,7 @@ fi<br>
<br>
=C2=A0 ssize_t_fmt=3D&quot;#define APR_SSIZE_T_FMT \&quot;$ssize_t_fmt\&quo=
t;&quot;<br>
<br>
@@ -64,7 +64,7 @@ index 9d57ae6..5b19940 100644<br>
<br>
=C2=A0 AC_MSG_CHECKING([which format to use for apr_size_t])<br>
=C2=A0 if test -n &quot;$size_t_fmt&quot;; then<br>
-@@ -1784,7 +1784,7 @@ fi<br>
+@@ -1836,7 +1836,7 @@ fi<br>
<br>
=C2=A0 size_t_fmt=3D&quot;#define APR_SIZE_T_FMT \&quot;$size_t_fmt\&quot;&=
quot;<br>
<br>
@@ -74,5 +74,5 @@ index 9d57ae6..5b19940 100644<br>
=C2=A0 if test &quot;${ac_cv_sizeof_off_t}${apr_<wbr>cv_use_lfs64}&quot; =
=3D &quot;4yes&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 # Enable LFS<br>
=C2=A0--<br>
-2.7.4<br>
+1.8.3.1<br>
<br>
diff --git a/meta/recipes-support/apr/<wbr>apr/0002-explicitly-link-<wbr>li=
bapr-against-phtread-to-<wbr>make-gold-.patch b/meta/recipes-support/apr/<w=
br>apr/0008-explicitly-link-<wbr>libapr-against-phtread-to-<wbr>make-gold-.=
patch<br>
similarity index 90%<br>
rename from meta/recipes-support/apr/apr/<wbr>0002-explicitly-link-libapr-<=
wbr>against-phtread-to-make-gold-.<wbr>patch<br>
rename to meta/recipes-support/apr/apr/<wbr>0008-explicitly-link-libapr-<wb=
r>against-phtread-to-make-gold-.<wbr>patch<br>
index 7d0dddc..e7c0c8e 100644<br>
--- a/meta/recipes-support/apr/<wbr>apr/0002-explicitly-link-<wbr>libapr-ag=
ainst-phtread-to-<wbr>make-gold-.patch<br>
+++ b/meta/recipes-support/apr/<wbr>apr/0008-explicitly-link-<wbr>libapr-ag=
ainst-phtread-to-<wbr>make-gold-.patch<br>
@@ -1,8 +1,8 @@<br>
-From 94d1ca0266a0f9c0446f1299b54f75<wbr>2e87b8a695 Mon Sep 17 00:00:00 200=
1<br>
+From 922795e34289877ed2610f7bb44e04<wbr>4bcfb73cd5 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3D<wbr>BCller?=3D &lt;<a href=3D=
"mailto:schnitzeltony@googlemail.com">schnitzeltony@googlemail.com</a>&gt;<=
br>
=C2=A0Date: Fri, 3 Mar 2017 22:24:17 +0100<br>
-Subject: [PATCH] explicitly link libapr against phtread to make gold happy=
 on<br>
- test<br>
+Subject: [PATCH 8/8] explicitly link libapr against phtread to make gold h=
appy<br>
+ on test<br>
=C2=A0MIME-Version: 1.0<br>
=C2=A0Content-Type: text/plain; charset=3DUTF-8<br>
=C2=A0Content-Transfer-Encoding: 8bit<br>
@@ -34,10 +34,10 @@ Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailt=
o:schnitzeltony@googlemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
=C2=A0 1 file changed, 1 insertion(+)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.in" rel=3D"noreferrer" targe=
t=3D"_blank">configure.in</a> b/<a href=3D"http://configure.in" rel=3D"nore=
ferrer" target=3D"_blank">configure.in</a><br>
-index 5b19940..cdf4d58 100644<br>
+index 3c579f5..06afb62 100644<br>
=C2=A0--- a/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_b=
lank">configure.in</a><br>
=C2=A0+++ b/<a href=3D"http://configure.in" rel=3D"noreferrer" target=3D"_b=
lank">configure.in</a><br>
-@@ -766,6 +766,7 @@ else<br>
+@@ -781,6 +781,7 @@ else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 APR_PTHREADS_CHECK_RESTORE ] )<br=
>
=C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 if test &quot;$pthreadh&quot; =3D &quot;1&quot;; then<=
br>
@@ -46,5 +46,5 @@ index 5b19940..cdf4d58 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 APR_CHECK_PTHREAD_ATTR_<wbr>GETDETACHSTA=
TE_ONE_ARG<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 APR_CHECK_PTHREAD_RECURSIVE_<wbr>MUTEX<b=
r>
=C2=A0--<br>
-2.9.3<br>
+1.8.3.1<br>
<br>
diff --git a/meta/recipes-support/apr/<wbr>apr/cleanup.patch b/meta/recipes=
-support/apr/<wbr>apr/cleanup.patch<br>
deleted file mode 100644<br>
index b6784e0..0000000<br>
--- a/meta/recipes-support/apr/<wbr>apr/cleanup.patch<br>
+++ /dev/null<br>
@@ -1,43 +0,0 @@<br>
-Upstream-Status: Inappropriate [configuration]<br>
-<br>
-Index: apr-1.4.2/build/buildcheck.sh<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- apr-1.4.2.orig/build/<wbr>buildcheck.sh 2009-11-13 08:27:16.000000000 =
+0800<br>
-+++ apr-1.4.2/build/buildcheck.sh=C2=A0 =C2=A0 =C2=A0 2010-11-26 15:44:00.=
000000000 +0800<br>
-@@ -32,35 +32,4 @@<br>
- echo &quot;buildconf: autoconf version $ac_version (ok)&quot;<br>
- fi<br>
-<br>
--# Sample libtool --version outputs:<br>
--# ltmain.sh (GNU libtool) 1.3.3 (1.385.2.181 1999/07/02 15:49:11)<br>
--# ltmain.sh (GNU libtool 1.1361 2004/01/02 23:10:52) 1.5a<br>
--# output is multiline from 1.5 onwards<br>
--<br>
--# Require libtool 1.4 or newer<br>
--libtool=3D`build/PrintPath glibtool1 glibtool libtool libtool15 libtool14=
`<br>
--lt_pversion=3D`$libtool --version 2&gt;/dev/null|sed -e &#39;s/([^)]*)//g=
;s/^[^0-9]*//;s/[<wbr>- ].*//g;q&#39;`<br>
--if test -z &quot;$lt_pversion&quot;; then<br>
--echo &quot;buildconf: libtool not found.&quot;<br>
--echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0You need libtool vers=
ion 1.4 or newer installed&quot;<br>
--echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to build APR from SVN=
.&quot;<br>
--exit 1<br>
--fi<br>
--lt_version=3D`echo $lt_pversion|sed -e &#39;s/\([a-z]*\)$/.\1/&#39;`<br>
--IFS=3D.; set $lt_version; IFS=3D&#39; &#39;<br>
--lt_status=3D&quot;good&quot;<br>
--if test &quot;$1&quot; =3D &quot;1&quot;; then<br>
--=C2=A0 =C2=A0if test &quot;$2&quot; -lt &quot;4&quot;; then<br>
--=C2=A0 =C2=A0 =C2=A0 lt_status=3D&quot;bad&quot;<br>
--=C2=A0 =C2=A0fi<br>
--fi<br>
--if test $lt_status =3D &quot;good&quot;; then<br>
--=C2=A0 =C2=A0echo &quot;buildconf: libtool version $lt_pversion (ok)&quot=
;<br>
--=C2=A0 =C2=A0exit 0<br>
--fi<br>
--<br>
--echo &quot;buildconf: libtool version $lt_pversion found.&quot;<br>
--echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0You need libtool vers=
ion 1.4 or newer installed&quot;<br>
--echo &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to build APR from SVN=
.&quot;<br>
--<br>
--exit 1<br>
-+exit 0<br>
diff --git a/meta/recipes-support/apr/<a href=3D"http://apr_1.6.2.bb" rel=
=3D"noreferrer" target=3D"_blank">apr<wbr>_1.6.2.bb</a> b/meta/recipes-supp=
ort/apr/<a href=3D"http://apr_1.6.3.bb" rel=3D"noreferrer" target=3D"_blank=
">apr<wbr>_1.6.3.bb</a><br>
similarity index 81%<br>
rename from meta/recipes-support/apr/<a href=3D"http://apr_1.6.2.bb" rel=3D=
"noreferrer" target=3D"_blank">apr_<wbr>1.6.2.bb</a><br>
rename to meta/recipes-support/apr/<a href=3D"http://apr_1.6.3.bb" rel=3D"n=
oreferrer" target=3D"_blank">apr_<wbr>1.6.3.bb</a><br>
index e2eed53..1bc4759 100644<br>
--- a/meta/recipes-support/apr/<a href=3D"http://apr_1.6.2.bb" rel=3D"noref=
errer" target=3D"_blank">apr<wbr>_1.6.2.bb</a><br>
+++ b/meta/recipes-support/apr/<a href=3D"http://apr_1.6.3.bb" rel=3D"noref=
errer" target=3D"_blank">apr<wbr>_1.6.3.bb</a><br>
@@ -10,19 +10,19 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>4d=
fd4cd216828c8cae5de5a12f3844<wbr>c8 \<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;${APACHE_MIRROR}/apr/${BPN}-$<wbr>{PV}.tar.bz2 \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://configure_fixes.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cleanup.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://configfix.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://upgrade-and-fix-1.5.1.<wbr=
>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Fix-packet-discards-<wbr>H=
TTP-redirect.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://configure.in-fix-<wbr>LTFL=
AGS-to-make-it-work-with-<wbr>ccache.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-apr-fix-off_t-<wbr>si=
ze-doesn-t-match-in-glibc-<wbr>when-cross.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-explicitly-link-<wbr>=
libapr-against-phtread-to-<wbr>make-gold-.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure-fixes.<wbr>=
patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-cleanup.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-configfix.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-Makefile.in-fix-<wbr>=
cross-compiling-failed.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-Fix-packet-<wbr>disca=
rds-HTTP-redirect.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-configure.in-fix-<wbr=
>LTFLAGS-to-make-it-work-with-<wbr>ccache.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-apr-fix-off_t-<wbr>si=
ze-doesn-t-match-in-glibc-<wbr>when-cross.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-explicitly-link-<wbr>=
libapr-against-phtread-to-<wbr>make-gold-.patch \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>e81a851967c79b5ce9bfbc909e4bf7<wbr>35&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>09109cea377bab0028bba19a92b5b0<wbr>e8960=
3df9eab05c0f7dbd4dd83d48d<wbr>cebd&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>12f2a349483ad6f12db49ba01fbfdb<wbr>fa&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>131f06d16d7aabd097fa992a33eec2<wbr>b6af3=
962f93e6d570a9bd4d85e9599<wbr>3172&quot;<br>
<br>
=C2=A0inherit autotools-brokensep lib_package binconfig multilib_header pte=
st<br>
<br>
@@ -69,7 +69,8 @@ do_install_append() {<br>
=C2=A0}<br>
<br>
=C2=A0do_install_append_class-<wbr>target() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,${STAGING_DIR_HOST},,g&#39; ${=
D}${datadir}/build-1/<a href=3D"http://apr_rules.mk" rel=3D"noreferrer" tar=
get=3D"_blank">apr_<wbr>rules.mk</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,${DEBUG_PREFIX_MAP},,g&#39; \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s,${STAGING_DIR_H=
OST},,g&#39; ${D}${datadir}/build-1/<a href=3D"http://apr_rules.mk" rel=3D"=
noreferrer" target=3D"_blank">apr_<wbr>rules.mk</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s,${STAGING_DIR_HOST},,g&#39; \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,APR_SOURCE=
_DIR=3D.*,APR_<wbr>SOURCE_DIR=3D,g&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,APR_BUILD_=
DIR=3D.*,APR_BUILD_<wbr>DIR=3D,g&#39; ${D}${bindir}/apr-1-config<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1141a2a4232147056410fb2b--
