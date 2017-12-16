Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id C508171BA0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Dec 2017 00:24:24 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id d16so21985778itj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 16:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+bf43Ut3kE9Rb/SxxUKKiLP2BWPTrI2cj9Trv+4rDAo=;
	b=ubTeVgSP7a5uK1DGFLs9Q5OoS/boC4jqJos5hf0bQLEteuiiglDcLynBqI/cvmC6fw
	A6SLBUyFFdSICcRl0b0DIKEJtecjjdoJMG4TWiCPI/yO7g3cJfvS0/yHbRLGOHHrDp/1
	ulLAR7H7a4uiGqBQwwqvq0ux9XOWAuBmM5GevX5l6+aqFqdJP2l2SDJUnbAi10pV4yFm
	bgcdfIIQTb1wFDp/2X6ljgmP3EzHdFszIEc5G4ogrEFGeYasEVPfDcNCJFU0Mw+ndSna
	CS/nBxE6elAJTdIvUb6lUbh2pYxSMr2UN1AAcpkV9psk6HDNt96xHvCQO9yc9PIGz++M
	b4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+bf43Ut3kE9Rb/SxxUKKiLP2BWPTrI2cj9Trv+4rDAo=;
	b=Uz0T20oLCPzj9vByykTf5vIzMzXPPzrkEq+bpQvws20OpLDzCGfrNv9Y5qULI+ek4V
	ODDdo8f2eytKoBgnHURGpKYFSSgCIPx4YLd6q1EJ9wk0akouYxm5o1ulS2veSyggUgnw
	pRMaObt3jFw5utS2adKJnGeRxTT/Owy72KauWvpbcFOkHviXx3p21njmKvVXnY1hT9CX
	YoB6P/uyzQK0YiYBGLsXdJP+Qs410LQt/1GWo5uuQXEDpwfm+76FFuTcyUxqfFwooNQC
	Py321JBImeJjb3joKyBLKiPtq97cM6QMggh7D0cKnfar16WYFGw8lDcAn1E+BDS+AYuX
	Z6BQ==
X-Gm-Message-State: AKGB3mJon5smGuJc8caJLhs0NTKfr/QnCELKAVFa/x2k6cKAEWwmQY/Q
	oYvupA3z0xZ+XD8xlI+zxLR9vXGFxQz7ysTqmW43hs3r
X-Google-Smtp-Source: ACJfBovVexhhc7/lppRhl5gxCDaTGsoE4mEiQzj3CUnFUSDfCjVIyyXoHhb3ZqwRYpY7z3P9bbu1zq8li8sNnzjI+s8=
X-Received: by 10.36.120.11 with SMTP id p11mr10620016itc.10.1513383865222;
	Fri, 15 Dec 2017 16:24:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.59.10 with HTTP; Fri, 15 Dec 2017 16:24:04 -0800 (PST)
In-Reply-To: <20171213153307.26576-2-alexander.kanavin@linux.intel.com>
References: <20171213153307.26576-1-alexander.kanavin@linux.intel.com>
	<20171213153307.26576-2-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 16 Dec 2017 00:24:04 +0000
Message-ID: <CAJTo0Lb22=fxt6RpCcTOv3gA5MRvGks6+X9v36syu1Vq0z-ibA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/15] rpm: update to 4.14.0
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
X-List-Received-Date: Sat, 16 Dec 2017 00:24:25 -0000
Content-Type: multipart/alternative; boundary="001a114a9b5eb2291b05606a23ac"

--001a114a9b5eb2291b05606a23ac
Content-Type: text/plain; charset="UTF-8"

This is causing the signing selftest to fail:

2017-12-15 06:04:10,233 - oe-selftest - INFO -
======================================================================
2017-12-15 06:04:10,233 - oe-selftest - INFO - FAIL: test_signing_packages
(signing.Signing)
2017-12-15 06:04:10,233 - oe-selftest - INFO -
----------------------------------------------------------------------
2017-12-15 06:04:10,233 - oe-selftest - INFO - Traceback (most recent call
last):
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/core/decorator/__init__.py",
line 32, in wrapped_f
    return func(*args, **kwargs)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/signing.py",
line 90, in test_signing_packages
    self.assertIn('rsa sha1 (md5) pgp md5 OK', ret.output, 'Package signed
incorrectly.')
AssertionError: 'rsa sha1 (md5) pgp md5 OK' not found in
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/deploy/rpm/core2_64/ed-1.14.2-r0.0.core2_64.rpm:
digests signatures OK' : Package signed incorrectly.

I spoke to Mark Hatle and he said that this suggests the only keys are the
internal digest signatures, the other keys were not used.

Ross

On 13 December 2017 at 15:32, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Previously oe-core had a development snapshot of rpm, it's better to update
> to something more stable.
>
> Removed patches:
> 0001-Add-PYTHON_ABI-when-searching-for-python-libraries.patch
> (upstream is using pkg-config)
> 0001-When-nice-value-cannot-be-reset-issue-a-notice-inste.patch
> (functionality has been moved to a plugin, we disable plugins
> for rpm-native)
> 0012-Use-conditional-to-access-_docdir-in-macros.in.patch
> (merged upstream)
>
> Changed patches:
> 0001-Fix-build-with-musl-C-library.patch
> (one previous musl issue has been resolved upstream; another has been
> added)
>
> Rest of the patches are trivial rebases.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  ...N_ABI-when-searching-for-python-libraries.patch | 30 ----------
>  ...code-lib-rpm-as-the-installation-path-for.patch | 20 +++----
>  .../files/0001-Fix-build-with-musl-C-library.patch | 66
> +++++++---------------
>  ...alue-cannot-be-reset-issue-a-notice-inste.patch | 31 ----------
>  ...c-remove-static-local-variables-from-buil.patch | 54
> +++++++++---------
>  ...ire-that-ELF-binaries-are-executable-to-b.patch | 11 ++--
>  ...onditional-to-access-_docdir-in-macros.in.patch | 36 ------------
>  .../0013-Add-a-new-option-alldeps-to-rpmdeps.patch | 17 +++---
>  .../rpm/{rpm_git.bb => rpm_4.14.0.bb}              |  8 +--
>  9 files changed, 75 insertions(+), 198 deletions(-)
>  delete mode 100644 meta/recipes-devtools/rpm/files/0001-Add-PYTHON_ABI-
> when-searching-for-python-libraries.patch
>  delete mode 100644 meta/recipes-devtools/rpm/files/0001-When-nice-value-
> cannot-be-reset-issue-a-notice-inste.patch
>  delete mode 100644 meta/recipes-devtools/rpm/
> files/0012-Use-conditional-to-access-_docdir-in-macros.in.patch
>  rename meta/recipes-devtools/rpm/{rpm_git.bb => rpm_4.14.0.bb} (93%)
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-Add-PYTHON_ABI-
> when-searching-for-python-libraries.patch b/meta/recipes-devtools/rpm/
> files/0001-Add-PYTHON_ABI-when-searching-for-python-libraries.patch
> deleted file mode 100644
> index b809332f217..00000000000
> --- a/meta/recipes-devtools/rpm/files/0001-Add-PYTHON_ABI-
> when-searching-for-python-libraries.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 36cf0ff26ece53e529e8b4f2d2f09acd8794b055 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Fri, 24 Mar 2017 15:35:47 +0200
> -Subject: [PATCH] Add PYTHON_ABI when searching for python libraries.
> -
> -It has a value of 'm' when using Python3, and so without it
> -configure will not find the libraries.
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 9c58467c1..a506ec819 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -642,7 +642,7 @@ AS_IF([test "$enable_python" = yes],[
> -       ])
> -     CPPFLAGS="$save_CPPFLAGS"
> -     save_LIBS="$LIBS"
> --    AC_SEARCH_LIBS([Py_Main],[python${PYTHON_VERSION} python],[
> -+    AC_SEARCH_LIBS([Py_Main],[python${PYTHON_VERSION}${PYTHON_ABI}
> python],[
> -       WITH_PYTHON_LIB="$ac_res"
> -     ],[AC_MSG_ERROR([missing python library])
> -     ])
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-
> lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/
> files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
> index 1f61acaf431..d7b1145bc5b 100644
> --- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-
> lib-rpm-as-the-installation-path-for.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-
> lib-rpm-as-the-installation-path-for.patch
> @@ -1,10 +1,10 @@
> -From d82691b8d58201dd03e30585daacd8ffd1556ae2 Mon Sep 17 00:00:00 2001
> +From 2b1a3f900f15034943fc41661eaab41bcc0d4d84 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 27 Feb 2017 09:43:30 +0200
> -Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
> +Subject: [PATCH 06/15] Do not hardcode "lib/rpm" as the installation path
> for
>   default configuration and macros.
>
> -Upstream-Status: Submitted [https://github.com/rpm-
> software-management/rpm/pull/263]
> +Upstream-Status: Denied [https://github.com/rpm-
> software-management/rpm/pull/263]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>
>  ---
> @@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
>   3 files changed, 4 insertions(+), 4 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 4f3be8770..92ffd3d68 100644
> +index 373d69484..c04a2e8d1 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -875,7 +875,7 @@ else
> +@@ -1038,7 +1038,7 @@ else
>       usrprefix=$prefix
>   fi
>
> @@ -27,10 +27,10 @@ index 4f3be8770..92ffd3d68 100644
>
>   AC_SUBST(OBJDUMP)
>  diff --git a/macros.in b/macros.in
> -index c6d5a6b03..84ae25275 100644
> +index 3f8dbba61..da4812540 100644
>  --- a/macros.in
>  +++ b/macros.in
> -@@ -877,7 +877,7 @@ package or when debugging this package.\
> +@@ -954,7 +954,7 @@ package or when debugging this package.\
>   %_sharedstatedir      %{_prefix}/com
>   %_localstatedir               %{_prefix}/var
>   %_lib                 lib
> @@ -40,7 +40,7 @@ index c6d5a6b03..84ae25275 100644
>   %_infodir             %{_datadir}/info
>   %_mandir              %{_datadir}/man
>  diff --git a/rpm.am b/rpm.am
> -index 1f43ad8a0..6854ff6ba 100644
> +index f0df0202f..37205a5eb 100644
>  --- a/rpm.am
>  +++ b/rpm.am
>  @@ -1,10 +1,10 @@
> @@ -55,7 +55,7 @@ index 1f43ad8a0..6854ff6ba 100644
>  +rpmconfigdir = $(libdir)/rpm
>
>   # Libtool version (current-revision-age) for all our libraries
> - rpm_version_info = 7:0:0
> + rpm_version_info = 8:0:0
>  --
> -2.11.0
> +2.14.2
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch
> b/meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch
> index edf9ec08940..0b1d6298a94 100644
> --- a/meta/recipes-devtools/rpm/files/0001-Fix-build-with-
> musl-C-library.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-Fix-build-with-
> musl-C-library.patch
> @@ -1,24 +1,21 @@
> -From 211c2d11200e6657132c52e7ac68f8c118231262 Mon Sep 17 00:00:00 2001
> +From d076de030deb9cafd9b2e82be5d506cebdefad0b Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 27 Feb 2017 14:43:21 +0200
> -Subject: [PATCH] Fix build with musl C library.
> +Subject: [PATCH 1/9] Fix build with musl C library.
>
> -Upstream-Status: Inappropriate [problem already solved in master branch]
> +Upstream-Status: Pending
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>
> -
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>  ---
> - configure.ac        | 3 ++-
> - misc/Makefile.am    | 3 +--
> - misc/rpmxprogname.c | 3 +--
> - 3 files changed, 4 insertions(+), 5 deletions(-)
> + configure.ac       | 3 ++-
> + rpmio/digest_nss.c | 1 +
> + 2 files changed, 3 insertions(+), 1 deletion(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 92ffd3d68..9c58467c1 100644
> +index c04a2e8d1..c9d9ac16d 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -229,6 +229,7 @@ AC_SEARCH_LIBS(dlopen, [dl])
> +@@ -255,6 +255,7 @@ AC_SEARCH_LIBS(dlopen, [dl])
>   # Check for libelf library. Prefer external, otherwise none.
>   WITH_LIBELF_LIB=
>   AC_CHECK_HEADER([libelf.h])
> @@ -26,7 +23,7 @@ index 92ffd3d68..9c58467c1 100644
>   AC_CHECK_HEADERS([gelf.h], [
>         AC_CHECK_LIB(elf, gelf_getvernaux, [
>             AC_DEFINE(HAVE_LIBELF, 1, [Define to 1 if you have the 'elf'
> library (-lelf).])
> -@@ -237,7 +238,7 @@ AC_CHECK_HEADERS([gelf.h], [
> +@@ -263,7 +264,7 @@ AC_CHECK_HEADERS([gelf.h], [
>         ])
>   ])
>   AC_SUBST(WITH_LIBELF_LIB)
> @@ -35,40 +32,17 @@ index 92ffd3d68..9c58467c1 100644
>
>   AC_CHECK_HEADERS([dwarf.h], [
>     WITH_LIBDWARF=yes
> -diff --git a/misc/Makefile.am b/misc/Makefile.am
> -index 8bf0093d9..b9db3d31a 100644
> ---- a/misc/Makefile.am
> -+++ b/misc/Makefile.am
> -@@ -5,10 +5,9 @@ AM_CPPFLAGS += -I$(top_srcdir)/misc
> -
> - EXTRA_DIST = \
> -       fnmatch.c       fnmatch.h \
> --      rpmxprogname.c  rpmxprogname.h \
> -       stpcpy.c        stpncpy.c
> -
> - noinst_LTLIBRARIES = libmisc.la
> -
> --libmisc_la_SOURCES = fts.c fts.h
> -+libmisc_la_SOURCES = fts.c fts.h rpmxprogname.c rpmxprogname.h
> - libmisc_la_LIBADD = @LTLIBOBJS@
> -diff --git a/misc/rpmxprogname.c b/misc/rpmxprogname.c
> -index f89600613..e94625ea8 100644
> ---- a/misc/rpmxprogname.c
> -+++ b/misc/rpmxprogname.c
> -@@ -13,7 +13,7 @@ char *_rpmxgetprogname(void)
> - {
> -   const char *empty = "";
> -
> --  if (_rpmxprognam != NULL) /* never return NULL string */
> -+  if (_rpmxprogname != NULL) /* never return NULL string */
> -     return _rpmxprogname;
> -   else
> -     return empty;
> -@@ -30,4 +30,3 @@ void _rpmxsetprogname(const char *pn)
> -   }
> - }
> +diff --git a/rpmio/digest_nss.c b/rpmio/digest_nss.c
> +index 992d9acf6..e11920e3e 100644
> +--- a/rpmio/digest_nss.c
> ++++ b/rpmio/digest_nss.c
> +@@ -1,5 +1,6 @@
> + #include "system.h"
>
> --#endif /* _RPMXPROGNAME_H */
> ++#include <signal.h>
> + #include <pthread.h>
> + #include <nss.h>
> + #include <sechash.h>
>  --
> -2.11.0
> +2.14.2
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-When-nice-value-
> cannot-be-reset-issue-a-notice-inste.patch b/meta/recipes-devtools/rpm/
> files/0001-When-nice-value-cannot-be-reset-issue-a-notice-inste.patch
> deleted file mode 100644
> index 9648cac7c9b..00000000000
> --- a/meta/recipes-devtools/rpm/files/0001-When-nice-value-
> cannot-be-reset-issue-a-notice-inste.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From d42ece6fa15b98d7f9221b90b85b78631df2c0a0 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Tue, 14 Feb 2017 13:51:19 +0200
> -Subject: [PATCH] When nice value cannot be reset, issue a notice instead
> of a
> - warning
> -
> -Otherwise build logs on the autobuilder get very clutter, as it
> -doesn't allow the nice value to be reset for some reason.
> -
> -Upstream-Status: Inappropriate [oe specific]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - lib/rpmscript.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/lib/rpmscript.c b/lib/rpmscript.c
> -index 5e1e99906..3975aead8 100644
> ---- a/lib/rpmscript.c
> -+++ b/lib/rpmscript.c
> -@@ -347,7 +347,7 @@ static rpmRC runExtScript(rpmPlugins plugins,
> ARGV_const_t prefixes,
> -         int ret;
> -         ret = setpriority(PRIO_PROCESS, 0, 0);
> -         if (ret == -1) {
> --            rpmlog(RPMLOG_WARNING, _("Unable to reset nice value: %s"),
> -+            rpmlog(RPMLOG_NOTICE, _("Unable to reset nice value: %s\n"),
> -                 strerror(errno));
> -         }
> -
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-devtools/rpm/files/0004-build-pack.c-
> remove-static-local-variables-from-buil.patch b/meta/recipes-devtools/rpm/
> files/0004-build-pack.c-remove-static-local-variables-from-buil.patch
> index 64a5651f7e1..8989dcebd1e 100644
> --- a/meta/recipes-devtools/rpm/files/0004-build-pack.c-
> remove-static-local-variables-from-buil.patch
> +++ b/meta/recipes-devtools/rpm/files/0004-build-pack.c-
> remove-static-local-variables-from-buil.patch
> @@ -1,7 +1,7 @@
> -From ec305795a302d226343e69031ff2024dfcde69c0 Mon Sep 17 00:00:00 2001
> +From 8ce9fbab2990609bdace457e146160334e931c89 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Thu, 8 Jun 2017 17:08:09 +0300
> -Subject: [PATCH 3/3] build/pack.c: remove static local variables from
> +Subject: [PATCH 14/15] build/pack.c: remove static local variables from
>   buildHost() and getBuildTime()
>
>  Their use is causing difficult to diagnoze data races when building
> multiple
> @@ -11,8 +11,8 @@ difficult to reason about code.
>  Upstream-Status: Submitted [https://github.com/rpm-
> software-management/rpm/pull/226]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>
> -
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   build/build.c             | 54 ++++++++++++++++++++++++++++--
>   build/pack.c              | 84 +++++++++---------------------
> -----------------
> @@ -20,7 +20,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
> >
>   3 files changed, 74 insertions(+), 72 deletions(-)
>
>  diff --git a/build/build.c b/build/build.c
> -index 5f99c8db7..09a1311c5 100644
> +index 81152e53e..6001f9e52 100644
>  --- a/build/build.c
>  +++ b/build/build.c
>  @@ -6,6 +6,8 @@
> @@ -83,7 +83,7 @@ index 5f99c8db7..09a1311c5 100644
>   /**
>    */
>   static rpmRC doRmSource(rpmSpec spec)
> -@@ -203,6 +249,9 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec,
> int what)
> +@@ -201,6 +247,9 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec,
> int what)
>       rpmRC rc = RPMRC_OK;
>       int test = (what & RPMBUILD_NOBUILD);
>       char *cookie = buildArgs->cookie ? xstrdup(buildArgs->cookie) : NULL;
> @@ -93,7 +93,7 @@ index 5f99c8db7..09a1311c5 100644
>
>       if (rpmExpandNumeric("%{?source_date_epoch_from_changelog}") &&
>         getenv("SOURCE_DATE_EPOCH") == NULL) {
> -@@ -271,11 +320,11 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec
> spec, int what)
> +@@ -269,11 +318,11 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec
> spec, int what)
>                 goto exit;
>
>         if (((what & RPMBUILD_PACKAGESOURCE) && !test) &&
> @@ -107,7 +107,7 @@ index 5f99c8db7..09a1311c5 100644
>                 goto exit;
>
>         if ((what & RPMBUILD_CLEAN) &&
> -@@ -295,6 +344,7 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec,
> int what)
> +@@ -293,6 +342,7 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec,
> int what)
>         (void) unlink(spec->specFile);
>
>   exit:
> @@ -116,7 +116,7 @@ index 5f99c8db7..09a1311c5 100644
>       spec->rootDir = NULL;
>       if (rc != RPMRC_OK && rpmlogGetNrecs() > 0) {
>  diff --git a/build/pack.c b/build/pack.c
> -index ed5b9ab4e..62427065a 100644
> +index df15876ff..17a4b0905 100644
>  --- a/build/pack.c
>  +++ b/build/pack.c
>  @@ -6,8 +6,6 @@
> @@ -128,7 +128,7 @@ index ed5b9ab4e..62427065a 100644
>   #include <sys/wait.h>
>
>   #include <rpm/rpmlib.h>                       /* RPMSIGTAG*,
> rpmReadPackageFile */
> -@@ -151,57 +149,6 @@ exit:
> +@@ -152,57 +150,6 @@ exit:
>       return rc;
>   }
>
> @@ -186,9 +186,9 @@ index ed5b9ab4e..62427065a 100644
>   static rpmRC processScriptFiles(rpmSpec spec, Package pkg)
>   {
>       struct TriggerFileEntry *p;
> -@@ -308,7 +255,8 @@ static int haveRichDep(Package pkg)
> - }
> -
> +@@ -476,7 +423,8 @@ exit:
> +  * order to how the RPM format is laid on disk.
> +  */
>   static rpmRC writeRPM(Package pkg, unsigned char ** pkgidp,
>  -                    const char *fileName, char **cookie)
>  +                    const char *fileName, char **cookie,
> @@ -196,7 +196,7 @@ index ed5b9ab4e..62427065a 100644
>   {
>       FD_t fd = NULL;
>       char * rpmio_flags = NULL;
> -@@ -397,7 +345,7 @@ static rpmRC writeRPM(Package pkg, unsigned char **
> pkgidp,
> +@@ -500,7 +448,7 @@ static rpmRC writeRPM(Package pkg, unsigned char **
> pkgidp,
>
>       /* Create and add the cookie */
>       if (cookie) {
> @@ -204,8 +204,8 @@ index ed5b9ab4e..62427065a 100644
>  +      rasprintf(cookie, "%s %d", buildHost, buildTime);
>         headerPutString(pkg->header, RPMTAG_COOKIE, *cookie);
>       }
> -
> -@@ -546,7 +494,7 @@ static rpmRC checkPackages(char *pkgcheck)
> +
> +@@ -641,7 +589,7 @@ static rpmRC checkPackages(char *pkgcheck)
>       return RPMRC_OK;
>   }
>
> @@ -214,7 +214,7 @@ index ed5b9ab4e..62427065a 100644
>   {
>         const char *errorString;
>         rpmRC rc = RPMRC_OK;
> -@@ -565,8 +513,8 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg,
> const char *cookie, int ch
> +@@ -660,8 +608,8 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg,
> const char *cookie, int ch
>         headerCopyTags(spec->packages->header, pkg->header, copyTags);
>
>         headerPutString(pkg->header, RPMTAG_RPMVERSION, VERSION);
> @@ -225,7 +225,7 @@ index ed5b9ab4e..62427065a 100644
>
>         if (spec->sourcePkgId != NULL) {
>             headerPutBin(pkg->header, RPMTAG_SOURCEPKGID,
> spec->sourcePkgId,16);
> -@@ -604,7 +552,7 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg,
> const char *cookie, int ch
> +@@ -699,7 +647,7 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg,
> const char *cookie, int ch
>             free(binRpm);
>         }
>
> @@ -234,7 +234,7 @@ index ed5b9ab4e..62427065a 100644
>         if (rc == RPMRC_OK) {
>             /* Do check each written package if enabled */
>             char *pkgcheck = rpmExpand("%{?_build_pkgcheck} ", *filename,
> NULL);
> -@@ -624,7 +572,7 @@ struct binaryPackageTaskData
> +@@ -719,7 +667,7 @@ struct binaryPackageTaskData
>       struct binaryPackageTaskData *next;
>   };
>
> @@ -243,7 +243,7 @@ index ed5b9ab4e..62427065a 100644
>   {
>       struct binaryPackageTaskData *tasks = NULL;
>       struct binaryPackageTaskData *task = NULL;
> -@@ -636,7 +584,7 @@ static struct binaryPackageTaskData*
> runBinaryPackageTasks(rpmSpec spec, const c
> +@@ -731,7 +679,7 @@ static struct binaryPackageTaskData*
> runBinaryPackageTasks(rpmSpec spec, const c
>           if (pkg == spec->packages) {
>               // the first package needs to be processed ahead of others,
> as they copy
>               // changelog data from it, and so otherwise data races would
> happen
> @@ -252,7 +252,7 @@ index ed5b9ab4e..62427065a 100644
>               rpmlog(RPMLOG_NOTICE, _("Finished binary package job, result
> %d, filename %s\n"), task->result, task->filename);
>               tasks = task;
>           }
> -@@ -653,7 +601,7 @@ static struct binaryPackageTaskData*
> runBinaryPackageTasks(rpmSpec spec, const c
> +@@ -748,7 +696,7 @@ static struct binaryPackageTaskData*
> runBinaryPackageTasks(rpmSpec spec, const c
>           if (task != tasks)
>           #pragma omp task
>           {
> @@ -261,7 +261,7 @@ index ed5b9ab4e..62427065a 100644
>               rpmlog(RPMLOG_NOTICE, _("Finished binary package job, result
> %d, filename %s\n"), task->result, task->filename);
>           }
>       }
> -@@ -671,11 +619,11 @@ static void freeBinaryPackageTasks(struct
> binaryPackageTaskData* tasks)
> +@@ -766,11 +714,11 @@ static void freeBinaryPackageTasks(struct
> binaryPackageTaskData* tasks)
>       }
>   }
>
> @@ -275,7 +275,7 @@ index ed5b9ab4e..62427065a 100644
>
>       for (struct binaryPackageTaskData *task = tasks; task != NULL; task
> = task->next) {
>           if (task->result == RPMRC_OK) {
> -@@ -702,22 +650,22 @@ rpmRC packageBinaries(rpmSpec spec, const char
> *cookie, int cheating)
> +@@ -797,7 +745,7 @@ rpmRC packageBinaries(rpmSpec spec, const char
> *cookie, int cheating)
>       return RPMRC_OK;
>   }
>
> @@ -284,6 +284,7 @@ index ed5b9ab4e..62427065a 100644
>   {
>       Package sourcePkg = spec->sourcePackage;
>       rpmRC rc;
> +@@ -805,8 +753,8 @@ rpmRC packageSources(rpmSpec spec, char **cookie)
>
>       /* Add some cruft */
>       headerPutString(sourcePkg->header, RPMTAG_RPMVERSION, VERSION);
> @@ -291,9 +292,10 @@ index ed5b9ab4e..62427065a 100644
>  -    headerPutUint32(sourcePkg->header, RPMTAG_BUILDTIME,
> getBuildTime(), 1);
>  +    headerPutString(sourcePkg->header, RPMTAG_BUILDHOST, buildHost);
>  +    headerPutUint32(sourcePkg->header, RPMTAG_BUILDTIME, &buildTime, 1);
> +     headerPutUint32(sourcePkg->header, RPMTAG_SOURCEPACKAGE, &one, 1);
>
>       /* XXX this should be %_srpmdir */
> -     { char *fn = rpmGetPath("%{_srcrpmdir}/", spec->sourceRpmName,NULL);
> +@@ -814,7 +762,7 @@ rpmRC packageSources(rpmSpec spec, char **cookie)
>         char *pkgcheck = rpmExpand("%{?_build_pkgcheck_srpm} ", fn, NULL);
>
>         spec->sourcePkgId = NULL;
> @@ -303,10 +305,10 @@ index ed5b9ab4e..62427065a 100644
>         /* Do check SRPM package if enabled */
>         if (rc == RPMRC_OK && pkgcheck[0] != ' ') {
>  diff --git a/build/rpmbuild_internal.h b/build/rpmbuild_internal.h
> -index 8351a6a34..797337ca7 100644
> +index 439b7d3b5..07e8338ad 100644
>  --- a/build/rpmbuild_internal.h
>  +++ b/build/rpmbuild_internal.h
> -@@ -408,19 +408,23 @@ rpmRC processSourceFiles(rpmSpec spec,
> rpmBuildPkgFlags pkgFlags);
> +@@ -427,19 +427,23 @@ rpmRC processSourceFiles(rpmSpec spec,
> rpmBuildPkgFlags pkgFlags);
>    * @param spec                spec file control structure
>    * @param cookie      build identifier "cookie" or NULL
>    * @param cheating    was build shortcircuited?
> @@ -333,5 +335,5 @@ index 8351a6a34..797337ca7 100644
>   RPM_GNUC_INTERNAL
>   int addLangTag(rpmSpec spec, Header h, rpmTagVal tag,
>  --
> -2.11.0
> +2.14.2
>
> diff --git a/meta/recipes-devtools/rpm/files/0011-Do-not-require-
> that-ELF-binaries-are-executable-to-b.patch b/meta/recipes-devtools/rpm/
> files/0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch
> index c910a478eea..4ac5c38f063 100644
> --- a/meta/recipes-devtools/rpm/files/0011-Do-not-require-
> that-ELF-binaries-are-executable-to-b.patch
> +++ b/meta/recipes-devtools/rpm/files/0011-Do-not-require-
> that-ELF-binaries-are-executable-to-b.patch
> @@ -1,7 +1,7 @@
> -From d65d6e8760afbd7f70b22a1f3297a037bc475fea Mon Sep 17 00:00:00 2001
> +From 5141d50d7b3d3c209a22c53deedb4ceef014401d Mon Sep 17 00:00:00 2001
>  From: Peter Kjellerstedt <pkj@axis.com>
>  Date: Mon, 15 May 2017 10:21:08 +0200
> -Subject: [PATCH 11/13] Do not require that ELF binaries are executable to
> be
> +Subject: [PATCH 09/15] Do not require that ELF binaries are executable to
> be
>   identifiable
>
>  There is nothing that requires, e.g., a DSO to be executable, but it
> @@ -14,19 +14,20 @@ or not.
>
>  Upstream-Status: Inappropriate
>  Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> +
>  ---
>   fileattrs/elf.attr | 1 -
>   1 file changed, 1 deletion(-)
>
>  diff --git a/fileattrs/elf.attr b/fileattrs/elf.attr
> -index 595b33e09..bac52649d 100644
> +index 5805dd0ee..3516f309d 100644
>  --- a/fileattrs/elf.attr
>  +++ b/fileattrs/elf.attr
>  @@ -1,4 +1,3 @@
>   %__elf_provides               %{_rpmconfigdir}/elfdeps --provides
> %{?__filter_GLIBC_PRIVATE:--filter-private}
>   %__elf_requires               %{_rpmconfigdir}/elfdeps --requires
> %{?__filter_GLIBC_PRIVATE:--filter-private}
> - %__elf_magic          ^(setuid )?(setgid )?(sticky )?ELF (32|64)-bit.*$
> + %__elf_magic          ^(setuid,? )?(setgid,? )?(sticky )?ELF
> (32|64)-bit.*$
>  -%__elf_flags          exeonly
>  --
> -2.12.0
> +2.14.2
>
> diff --git a/meta/recipes-devtools/rpm/files/0012-Use-conditional-to-
> access-_docdir-in-macros.in.patch b/meta/recipes-devtools/rpm/
> files/0012-Use-conditional-to-access-_docdir-in-macros.in.patch
> deleted file mode 100644
> index 996da90d43d..00000000000
> --- a/meta/recipes-devtools/rpm/files/0012-Use-conditional-to-
> access-_docdir-in-macros.in.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 77808db4036dc4a012c47aca36255549ed764a6a Mon Sep 17 00:00:00 2001
> -From: Peter Kjellerstedt <pkj@axis.com>
> -Date: Tue, 16 May 2017 10:58:18 +0200
> -Subject: [PATCH 12/13] Use conditional to access %{_docdir} in macros.in
> -
> -This avoids the following warning:
> -
> -warning: Ignoring invalid regex %{_docdir}
> -
> -when runing `rpmdeps -R <file>`, since %{_docdir} is only defined when
> -parsing a spec file (in parseSpec()).
> -
> -Upstream-Status: Accepted [https://github.com/rpm-
> software-management/rpm/pull/216]
> -Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ----
> - macros.in | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/macros.in b/macros.in
> -index 84ae25275..cca67a500 100644
> ---- a/macros.in
> -+++ b/macros.in
> -@@ -200,8 +200,8 @@ package or when debugging this package.\
> - # Their purpouse is to set up global filtering for all packages. If you
> need
> - # to set up specific filtering for your package use
> %__requires_exclude_from
> - # and %__provides_exclude_from instead.
> --%__global_requires_exclude_from               %{_docdir}
> --%__global_provides_exclude_from               %{_docdir}
> -+%__global_requires_exclude_from               %{?_docdir:%{_docdir}}
> -+%__global_provides_exclude_from               %{?_docdir:%{_docdir}}
> -
> - #     The path to the gzip executable (legacy, use %{__gzip} instead).
> - %_gzipbin             %{__gzip}
> ---
> -2.12.0
> -
> diff --git a/meta/recipes-devtools/rpm/files/0013-Add-a-new-option-alldeps-to-rpmdeps.patch
> b/meta/recipes-devtools/rpm/files/0013-Add-a-new-option-
> alldeps-to-rpmdeps.patch
> index faaf62960c1..d84e8b54d8d 100644
> --- a/meta/recipes-devtools/rpm/files/0013-Add-a-new-option-
> alldeps-to-rpmdeps.patch
> +++ b/meta/recipes-devtools/rpm/files/0013-Add-a-new-option-
> alldeps-to-rpmdeps.patch
> @@ -1,7 +1,7 @@
> -From 3bf20a6116ae3e1a5a3a6907bee7e881b17efb2f Mon Sep 17 00:00:00 2001
> +From ef9f8c17c3e5c35d3b55db9ca76b0fa0d6336421 Mon Sep 17 00:00:00 2001
>  From: Peter Kjellerstedt <pkj@axis.com>
>  Date: Mon, 15 May 2017 11:23:26 +0200
> -Subject: [PATCH 13/13] Add a new option --alldeps to rpmdeps
> +Subject: [PATCH 10/15] Add a new option --alldeps to rpmdeps
>
>  This will send the output from rpmfcPrint() to stdout. This is an
>  alternative to using the --rpmfcdebug option, which will send the same
> @@ -12,6 +12,7 @@ output options, e.g., --requires, without affecting
> their output.
>
>  Upstream-Status: Submitted [https://github.com/rpm-
> software-management/rpm/pull/220]
>  Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> +
>  ---
>   build/rpmfc.c   | 27 ++++++++++++++-------------
>   build/rpmfc.h   |  1 -
> @@ -19,10 +20,10 @@ Signed-off-by: Peter Kjellerstedt <
> peter.kjellerstedt@axis.com>
>   3 files changed, 39 insertions(+), 33 deletions(-)
>
>  diff --git a/build/rpmfc.c b/build/rpmfc.c
> -index c8e2f876a..44f1cdc9a 100644
> +index b8aea76d0..d04ffb297 100644
>  --- a/build/rpmfc.c
>  +++ b/build/rpmfc.c
> -@@ -732,7 +732,6 @@ static rpm_color_t rpmfcColor(const char * fmstr)
> +@@ -692,7 +692,6 @@ static rpm_color_t rpmfcColor(const char * fmstr)
>
>   void rpmfcPrint(const char * msg, rpmfc fc, FILE * fp)
>   {
> @@ -30,7 +31,7 @@ index c8e2f876a..44f1cdc9a 100644
>       int ndx;
>       int dx;
>       int fx;
> -@@ -744,21 +743,23 @@ void rpmfcPrint(const char * msg, rpmfc fc, FILE *
> fp)
> +@@ -704,21 +703,23 @@ void rpmfcPrint(const char * msg, rpmfc fc, FILE *
> fp)
>
>       if (fc)
>       for (fx = 0; fx < fc->nfiles; fx++) {
> @@ -79,7 +80,7 @@ index dae8ea5b1..3d87b31cf 100644
>    * @param fc          file classifier
>    * @param fp          output file handle (NULL for stderr)
>  diff --git a/tools/rpmdeps.c b/tools/rpmdeps.c
> -index a414b6343..f260a38c4 100644
> +index 419befce1..f260a38c4 100644
>  --- a/tools/rpmdeps.c
>  +++ b/tools/rpmdeps.c
>  @@ -23,6 +23,8 @@ static int print_conflicts;
> @@ -105,7 +106,7 @@ index a414b6343..f260a38c4 100644
>         goto exit;
>
>  -    if (_rpmfc_debug)
> --      rpmfcPrint(buf, fc, NULL);
> +-      rpmfcPrint(NULL, fc, NULL);
>  -
>  -    if (print_provides)
>  -      rpmdsPrint(NULL, rpmfcProvides(fc), stdout);
> @@ -148,5 +149,5 @@ index a414b6343..f260a38c4 100644
>       ec = 0;
>
>  --
> -2.12.0
> +2.14.2
>
> diff --git a/meta/recipes-devtools/rpm/rpm_git.bb
> b/meta/recipes-devtools/rpm/rpm_4.14.0.bb
> similarity index 93%
> rename from meta/recipes-devtools/rpm/rpm_git.bb
> rename to meta/recipes-devtools/rpm/rpm_4.14.0.bb
> index 57b9c2d6acc..e4e9c3e6341 100644
> --- a/meta/recipes-devtools/rpm/rpm_git.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.14.0.bb
> @@ -24,19 +24,16 @@ HOMEPAGE = "http://www.rpm.org"
>  LICENSE = "GPL-2.0"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=f5259151d26ff18e78023450a5ac8d96"
>
> -SRC_URI = "git://github.com/rpm-software-management/rpm \
> +SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x
> \
>             file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
> \
>             file://0001-Do-not-read-config-files-from-HOME.patch \
>             file://0001-When-cross-installing-execute-package-scriptlets-wit.patch
> \
>             file://0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
> \
>             file://0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
> \
> -           file://0001-When-nice-value-cannot-be-reset-issue-a-notice-inste.patch
> \
>             file://0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
> \
>             file://0001-Fix-build-with-musl-C-library.patch \
>             file://0001-Add-a-color-setting-for-mips64_n32-binaries.patch
> \
> -           file://0001-Add-PYTHON_ABI-when-searching-for-python-libraries.patch
> \
>             file://0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch
> \
> -           file://0012-Use-conditional-to-access-_docdir-in-macros.in.patch
> \
>             file://0013-Add-a-new-option-alldeps-to-rpmdeps.patch \
>             file://0001-Split-binary-package-building-into-a-separate-functi.patch
> \
>             file://0002-Run-binary-package-creation-via-thread-pools.patch
> \
> @@ -45,9 +42,8 @@ SRC_URI = "git://github.com/rpm-software-management/rpm
> \
>             file://0001-perl-disable-auto-reqs.patch \
>             "
>
> -PV = "4.13.90+git${SRCPV}"
>  PE = "1"
> -SRCREV = "a8e51b3bb05c6acb1d9b2e3d34f859ddda1677be"
> +SRCREV = "da3720f62e57648fb1dc2a632744d38866139971"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.15.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114a9b5eb2291b05606a23ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is causing the signing selftest to fail:<br><br>2017-=
12-15 06:04:10,233 - oe-selftest - INFO - =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>2017-12-15 06:04:10,233 - oe-selftest - INFO=
 - FAIL: test_signing_packages (signing.Signing)<br>2017-12-15 06:04:10,233=
 - oe-selftest - INFO - ---------------------------------------------------=
-------------------<br>2017-12-15 06:04:10,233 - oe-selftest - INFO - Trace=
back (most recent call last):<br>=C2=A0 File &quot;/home/pokybuild/yocto-au=
tobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/core/decorat=
or/__init__.py&quot;, line 32, in wrapped_f<br>=C2=A0 =C2=A0 return func(*a=
rgs, **kwargs)<br>=C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yocto=
-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/signing.py&q=
uot;, line 90, in test_signing_packages<br>=C2=A0 =C2=A0 self.assertIn(&#39=
;rsa sha1 (md5) pgp md5 OK&#39;, ret.output, &#39;Package signed incorrectl=
y.&#39;)<br>AssertionError: &#39;rsa sha1 (md5) pgp md5 OK&#39; not found i=
n &#39;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/b=
uild/build/tmp/deploy/rpm/core2_64/ed-1.14.2-r0.0.core2_64.rpm: digests sig=
natures OK&#39; : Package signed incorrectly.<div><span class=3D"gmail-stdo=
ut"><br></span></div><div><span class=3D"gmail-stdout">I spoke to Mark Hatl=
e and he said that this suggests the only keys are the internal digest sign=
atures, the other keys were not used.</span></div><div><span class=3D"gmail=
-stdout"><br></span></div><div><span class=3D"gmail-stdout">Ross</span></di=
v></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 13 Dec=
ember 2017 at 15:32, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kanavin@=
linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Pre=
viously oe-core had a development snapshot of rpm, it&#39;s better to updat=
e<br>
to something more stable.<br>
<br>
Removed patches:<br>
0001-Add-PYTHON_ABI-when-<wbr>searching-for-python-<wbr>libraries.patch<br>
(upstream is using pkg-config)<br>
0001-When-nice-value-cannot-<wbr>be-reset-issue-a-notice-inste.<wbr>patch<b=
r>
(functionality has been moved to a plugin, we disable plugins<br>
for rpm-native)<br>
0012-Use-conditional-to-<wbr><a href=3D"http://access-_docdir-in-macros.in"=
>access-_docdir-in-macros.in</a>.<wbr>patch<br>
(merged upstream)<br>
<br>
Changed patches:<br>
0001-Fix-build-with-musl-C-<wbr>library.patch<br>
(one previous musl issue has been resolved upstream; another has been added=
)<br>
<br>
Rest of the patches are trivial rebases.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;<br>
---<br>
=C2=A0...N_ABI-when-searching-for-<wbr>python-libraries.patch | 30 --------=
--<br>
=C2=A0...code-lib-rpm-as-the-<wbr>installation-path-for.patch | 20 +++----<=
br>
=C2=A0.../files/0001-Fix-build-with-<wbr>musl-C-library.patch | 66 +++++++-=
--------------<br>
=C2=A0...alue-cannot-be-reset-issue-<wbr>a-notice-inste.patch | 31 --------=
--<br>
=C2=A0...c-remove-static-local-<wbr>variables-from-buil.patch | 54 ++++++++=
+---------<br>
=C2=A0...ire-that-ELF-binaries-are-<wbr>executable-to-b.patch | 11 ++--<br>
=C2=A0...onditional-to-access-_<wbr>docdir-in-macros.in.patch | 36 --------=
----<br>
=C2=A0.../0013-Add-a-new-option-<wbr>alldeps-to-rpmdeps.patch | 17 +++---<b=
r>
=C2=A0.../rpm/{<a href=3D"http://rpm_git.bb" rel=3D"noreferrer" target=3D"_=
blank">rpm_git.bb</a> =3D&gt; <a href=3D"http://rpm_4.14.0.bb" rel=3D"noref=
errer" target=3D"_blank">rpm_4.14.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 8 +--<br>
=C2=A09 files changed, 75 insertions(+), 198 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/rpm/<wbr>files/0001-Add-PYTH=
ON_ABI-<wbr>when-searching-for-python-<wbr>libraries.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/rpm/<wbr>files/0001-When-nic=
e-value-<wbr>cannot-be-reset-issue-a-<wbr>notice-inste.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/rpm/<wbr>files/0012-Use-cond=
itional-to-<wbr><a href=3D"http://access-_docdir-in-macros.in">access-_docd=
ir-in-macros.in</a>.<wbr>patch<br>
=C2=A0rename meta/recipes-devtools/rpm/{<a href=3D"http://rpm_git.bb" rel=
=3D"noreferrer" target=3D"_blank">rpm<wbr>_git.bb</a> =3D&gt; <a href=3D"ht=
tp://rpm_4.14.0.bb" rel=3D"noreferrer" target=3D"_blank">rpm_4.14.0.bb</a>}=
 (93%)<br>
<br>
diff --git a/meta/recipes-devtools/rpm/<wbr>files/0001-Add-PYTHON_ABI-<wbr>=
when-searching-for-python-<wbr>libraries.patch b/meta/recipes-devtools/rpm/=
<wbr>files/0001-Add-PYTHON_ABI-<wbr>when-searching-for-python-<wbr>librarie=
s.patch<br>
deleted file mode 100644<br>
index b809332f217..00000000000<br>
--- a/meta/recipes-devtools/rpm/<wbr>files/0001-Add-PYTHON_ABI-<wbr>when-se=
arching-for-python-<wbr>libraries.patch<br>
+++ /dev/null<br>
@@ -1,30 +0,0 @@<br>
-From 36cf0ff26ece53e529e8b4f2d2f09a<wbr>cd8794b055 Mon Sep 17 00:00:00 200=
1<br>
-From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex=
.kanavin@gmail.com</a>&gt;<br>
-Date: Fri, 24 Mar 2017 15:35:47 +0200<br>
-Subject: [PATCH] Add PYTHON_ABI when searching for python libraries.<br>
-<br>
-It has a value of &#39;m&#39; when using Python3, and so without it<br>
-configure will not find the libraries.<br>
-<br>
-Upstream-Status: Inappropriate [oe-core specific]<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com">alex.kanavin@gmail.com</a>&gt;<br>
----<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index 9c58467c1..a506ec819 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -642,7 +642,7 @@ AS_IF([test &quot;$enable_python&quot; =3D yes],[<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0])<br>
-=C2=A0 =C2=A0 =C2=A0CPPFLAGS=3D&quot;$save_CPPFLAGS&quot;<br>
-=C2=A0 =C2=A0 =C2=A0save_LIBS=3D&quot;$LIBS&quot;<br>
--=C2=A0 =C2=A0 AC_SEARCH_LIBS([Py_Main],[<wbr>python${PYTHON_VERSION} pyth=
on],[<br>
-+=C2=A0 =C2=A0 AC_SEARCH_LIBS([Py_Main],[<wbr>python${PYTHON_VERSION}${<wb=
r>PYTHON_ABI} python],[<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0WITH_PYTHON_LIB=3D&quot;$ac_res&quot;<br>
-=C2=A0 =C2=A0 =C2=A0],[AC_MSG_ERROR([missing python library])<br>
-=C2=A0 =C2=A0 =C2=A0])<br>
---<br>
-2.11.0<br>
-<br>
diff --git a/meta/recipes-devtools/rpm/<wbr>files/0001-Do-not-hardcode-<wbr=
>lib-rpm-as-the-installation-<wbr>path-for.patch b/meta/recipes-devtools/rp=
m/<wbr>files/0001-Do-not-hardcode-<wbr>lib-rpm-as-the-installation-<wbr>pat=
h-for.patch<br>
index 1f61acaf431..d7b1145bc5b 100644<br>
--- a/meta/recipes-devtools/rpm/<wbr>files/0001-Do-not-hardcode-<wbr>lib-rp=
m-as-the-installation-<wbr>path-for.patch<br>
+++ b/meta/recipes-devtools/rpm/<wbr>files/0001-Do-not-hardcode-<wbr>lib-rp=
m-as-the-installation-<wbr>path-for.patch<br>
@@ -1,10 +1,10 @@<br>
-From d82691b8d58201dd03e30585daacd8<wbr>ffd1556ae2 Mon Sep 17 00:00:00 200=
1<br>
+From 2b1a3f900f15034943fc41661eaab4<wbr>1bcc0d4d84 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
>alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Mon, 27 Feb 2017 09:43:30 +0200<br>
-Subject: [PATCH] Do not hardcode &quot;lib/rpm&quot; as the installation p=
ath for<br>
+Subject: [PATCH 06/15] Do not hardcode &quot;lib/rpm&quot; as the installa=
tion path for<br>
=C2=A0 default configuration and macros.<br>
<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/rpm-software-man=
agement/rpm/pull/263" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/rpm-<wbr>software-management/rpm/pull/<wbr>263</a>]<br>
+Upstream-Status: Denied [<a href=3D"https://github.com/rpm-software-manage=
ment/rpm/pull/263" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
rpm-<wbr>software-management/rpm/pull/<wbr>263</a>]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com">alex.kanavin@gmail.com</a>&gt;<br>
<br>
=C2=A0---<br>
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0 3 files changed, 4 insertions(+), 4 deletions(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index 4f3be8770..92ffd3d68 100644<br>
+index 373d69484..c04a2e8d1 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -875,7 +875,7 @@ else<br>
+@@ -1038,7 +1038,7 @@ else<br>
=C2=A0 =C2=A0 =C2=A0 usrprefix=3D$prefix<br>
=C2=A0 fi<br>
<br>
@@ -27,10 +27,10 @@ index 4f3be8770..92ffd3d68 100644<br>
<br>
=C2=A0 AC_SUBST(OBJDUMP)<br>
=C2=A0diff --git a/<a href=3D"http://macros.in" rel=3D"noreferrer" target=
=3D"_blank">macros.in</a> b/<a href=3D"http://macros.in" rel=3D"noreferrer"=
 target=3D"_blank">macros.in</a><br>
-index c6d5a6b03..84ae25275 100644<br>
+index 3f8dbba61..da4812540 100644<br>
=C2=A0--- a/<a href=3D"http://macros.in" rel=3D"noreferrer" target=3D"_blan=
k">macros.in</a><br>
=C2=A0+++ b/<a href=3D"http://macros.in" rel=3D"noreferrer" target=3D"_blan=
k">macros.in</a><br>
-@@ -877,7 +877,7 @@ package or when debugging this package.\<br>
+@@ -954,7 +954,7 @@ package or when debugging this package.\<br>
=C2=A0 %_sharedstatedir=C2=A0 =C2=A0 =C2=A0 %{_prefix}/com<br>
=C2=A0 %_localstatedir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0%{_prefix}/var<br>
=C2=A0 %_lib=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0l=
ib<br>
@@ -40,7 +40,7 @@ index c6d5a6b03..84ae25275 100644<br>
=C2=A0 %_infodir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0%{_datadir}=
/info<br>
=C2=A0 %_mandir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %{_datadir}=
/man<br>
=C2=A0diff --git a/<a href=3D"http://rpm.am" rel=3D"noreferrer" target=3D"_=
blank">rpm.am</a> b/<a href=3D"http://rpm.am" rel=3D"noreferrer" target=3D"=
_blank">rpm.am</a><br>
-index 1f43ad8a0..6854ff6ba 100644<br>
+index f0df0202f..37205a5eb 100644<br>
=C2=A0--- a/<a href=3D"http://rpm.am" rel=3D"noreferrer" target=3D"_blank">=
rpm.am</a><br>
=C2=A0+++ b/<a href=3D"http://rpm.am" rel=3D"noreferrer" target=3D"_blank">=
rpm.am</a><br>
=C2=A0@@ -1,10 +1,10 @@<br>
@@ -55,7 +55,7 @@ index 1f43ad8a0..6854ff6ba 100644<br>
=C2=A0+rpmconfigdir =3D $(libdir)/rpm<br>
<br>
=C2=A0 # Libtool version (current-revision-age) for all our libraries<br>
- rpm_version_info =3D 7:0:0<br>
+ rpm_version_info =3D 8:0:0<br>
=C2=A0--<br>
-2.11.0<br>
+2.14.2<br>
<br>
diff --git a/meta/recipes-devtools/rpm/<wbr>files/0001-Fix-build-with-<wbr>=
musl-C-library.patch b/meta/recipes-devtools/rpm/<wbr>files/0001-Fix-build-=
with-<wbr>musl-C-library.patch<br>
index edf9ec08940..0b1d6298a94 100644<br>
--- a/meta/recipes-devtools/rpm/<wbr>files/0001-Fix-build-with-<wbr>musl-C-=
library.patch<br>
+++ b/meta/recipes-devtools/rpm/<wbr>files/0001-Fix-build-with-<wbr>musl-C-=
library.patch<br>
@@ -1,24 +1,21 @@<br>
-From 211c2d11200e6657132c52e7ac68f8<wbr>c118231262 Mon Sep 17 00:00:00 200=
1<br>
+From d076de030deb9cafd9b2e82be5d506<wbr>cebdefad0b Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
>alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Mon, 27 Feb 2017 14:43:21 +0200<br>
-Subject: [PATCH] Fix build with musl C library.<br>
+Subject: [PATCH 1/9] Fix build with musl C library.<br>
<br>
-Upstream-Status: Inappropriate [problem already solved in master branch]<b=
r>
+Upstream-Status: Pending<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com">alex.kanavin@gmail.com</a>&gt;<br>
<br>
-<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0---<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 ++-<br>
- misc/Makefile.am=C2=A0 =C2=A0 | 3 +--<br>
- misc/rpmxprogname.c | 3 +--<br>
- 3 files changed, 4 insertions(+), 5 deletions(-)<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ++-<br>
+ rpmio/digest_nss.c | 1 +<br>
+ 2 files changed, 3 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index 92ffd3d68..9c58467c1 100644<br>
+index c04a2e8d1..c9d9ac16d 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -229,6 +229,7 @@ AC_SEARCH_LIBS(dlopen, [dl])<br>
+@@ -255,6 +255,7 @@ AC_SEARCH_LIBS(dlopen, [dl])<br>
=C2=A0 # Check for libelf library. Prefer external, otherwise none.<br>
=C2=A0 WITH_LIBELF_LIB=3D<br>
=C2=A0 AC_CHECK_HEADER([libelf.h])<br>
@@ -26,7 +23,7 @@ index 92ffd3d68..9c58467c1 100644<br>
=C2=A0 AC_CHECK_HEADERS([gelf.h], [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_CHECK_LIB(elf, gelf_getvernaux, [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_DEFINE(HAVE_LIBELF, 1, [Define=
 to 1 if you have the &#39;elf&#39; library (-lelf).])<br>
-@@ -237,7 +238,7 @@ AC_CHECK_HEADERS([gelf.h], [<br>
+@@ -263,7 +264,7 @@ AC_CHECK_HEADERS([gelf.h], [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br>
=C2=A0 ])<br>
=C2=A0 AC_SUBST(WITH_LIBELF_LIB)<br>
@@ -35,40 +32,17 @@ index 92ffd3d68..9c58467c1 100644<br>
<br>
=C2=A0 AC_CHECK_HEADERS([dwarf.h], [<br>
=C2=A0 =C2=A0 WITH_LIBDWARF=3Dyes<br>
-diff --git a/misc/Makefile.am b/misc/Makefile.am<br>
-index 8bf0093d9..b9db3d31a 100644<br>
---- a/misc/Makefile.am<br>
-+++ b/misc/Makefile.am<br>
-@@ -5,10 +5,9 @@ AM_CPPFLAGS +=3D -I$(top_srcdir)/misc<br>
-<br>
- EXTRA_DIST =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fnmatch.c=C2=A0 =C2=A0 =C2=A0 =C2=A0fnmatch.h \=
<br>
--=C2=A0 =C2=A0 =C2=A0 rpmxprogname.c=C2=A0 rpmxprogname.h \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0stpcpy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 stpncpy.c<b=
r>
-<br>
- noinst_LTLIBRARIES =3D <a href=3D"http://libmisc.la" rel=3D"noreferrer" t=
arget=3D"_blank">libmisc.la</a><br>
-<br>
--libmisc_la_SOURCES =3D fts.c fts.h<br>
-+libmisc_la_SOURCES =3D fts.c fts.h rpmxprogname.c rpmxprogname.h<br>
- libmisc_la_LIBADD =3D @LTLIBOBJS@<br>
-diff --git a/misc/rpmxprogname.c b/misc/rpmxprogname.c<br>
-index f89600613..e94625ea8 100644<br>
---- a/misc/rpmxprogname.c<br>
-+++ b/misc/rpmxprogname.c<br>
-@@ -13,7 +13,7 @@ char *_rpmxgetprogname(void)<br>
- {<br>
-=C2=A0 =C2=A0const char *empty =3D &quot;&quot;;<br>
-<br>
--=C2=A0 if (_rpmxprognam !=3D NULL) /* never return NULL string */<br>
-+=C2=A0 if (_rpmxprogname !=3D NULL) /* never return NULL string */<br>
-=C2=A0 =C2=A0 =C2=A0return _rpmxprogname;<br>
-=C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0return empty;<br>
-@@ -30,4 +30,3 @@ void _rpmxsetprogname(const char *pn)<br>
-=C2=A0 =C2=A0}<br>
- }<br>
+diff --git a/rpmio/digest_nss.c b/rpmio/digest_nss.c<br>
+index 992d9acf6..e11920e3e 100644<br>
+--- a/rpmio/digest_nss.c<br>
++++ b/rpmio/digest_nss.c<br>
+@@ -1,5 +1,6 @@<br>
+ #include &quot;system.h&quot;<br>
<br>
--#endif /* _RPMXPROGNAME_H */<br>
++#include &lt;signal.h&gt;<br>
+ #include &lt;pthread.h&gt;<br>
+ #include &lt;nss.h&gt;<br>
+ #include &lt;sechash.h&gt;<br>
=C2=A0--<br>
-2.11.0<br>
+2.14.2<br>
<br>
diff --git a/meta/recipes-devtools/rpm/<wbr>files/0001-When-nice-value-<wbr=
>cannot-be-reset-issue-a-<wbr>notice-inste.patch b/meta/recipes-devtools/rp=
m/<wbr>files/0001-When-nice-value-<wbr>cannot-be-reset-issue-a-<wbr>notice-=
inste.patch<br>
deleted file mode 100644<br>
index 9648cac7c9b..00000000000<br>
--- a/meta/recipes-devtools/rpm/<wbr>files/0001-When-nice-value-<wbr>cannot=
-be-reset-issue-a-<wbr>notice-inste.patch<br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-From d42ece6fa15b98d7f9221b90b85b78<wbr>631df2c0a0 Mon Sep 17 00:00:00 200=
1<br>
-From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex=
.kanavin@gmail.com</a>&gt;<br>
-Date: Tue, 14 Feb 2017 13:51:19 +0200<br>
-Subject: [PATCH] When nice value cannot be reset, issue a notice instead o=
f a<br>
- warning<br>
-<br>
-Otherwise build logs on the autobuilder get very clutter, as it<br>
-doesn&#39;t allow the nice value to be reset for some reason.<br>
-<br>
-Upstream-Status: Inappropriate [oe specific]<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com">alex.kanavin@gmail.com</a>&gt;<br>
----<br>
- lib/rpmscript.c | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/lib/rpmscript.c b/lib/rpmscript.c<br>
-index 5e1e99906..3975aead8 100644<br>
---- a/lib/rpmscript.c<br>
-+++ b/lib/rpmscript.c<br>
-@@ -347,7 +347,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_con=
st_t prefixes,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D setpriority(PRIO_PROCESS, 0, 0);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -1) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpmlog(RPMLOG_WARNING, _(&quot;=
Unable to reset nice value: %s&quot;),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpmlog(RPMLOG_NOTICE, _(&quot;U=
nable to reset nice value: %s\n&quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strerror(err=
no));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
---<br>
-2.11.0<br>
-<br>
diff --git a/meta/recipes-devtools/rpm/<wbr>files/0004-build-pack.c-<wbr>re=
move-static-local-variables-<wbr>from-buil.patch b/meta/recipes-devtools/rp=
m/<wbr>files/0004-build-pack.c-<wbr>remove-static-local-variables-<wbr>from=
-buil.patch<br>
index 64a5651f7e1..8989dcebd1e 100644<br>
--- a/meta/recipes-devtools/rpm/<wbr>files/0004-build-pack.c-<wbr>remove-st=
atic-local-variables-<wbr>from-buil.patch<br>
+++ b/meta/recipes-devtools/rpm/<wbr>files/0004-build-pack.c-<wbr>remove-st=
atic-local-variables-<wbr>from-buil.patch<br>
@@ -1,7 +1,7 @@<br>
-From ec305795a302d226343e69031ff202<wbr>4dfcde69c0 Mon Sep 17 00:00:00 200=
1<br>
+From 8ce9fbab2990609bdace457e146160<wbr>334e931c89 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
>alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Thu, 8 Jun 2017 17:08:09 +0300<br>
-Subject: [PATCH 3/3] build/pack.c: remove static local variables from<br>
+Subject: [PATCH 14/15] build/pack.c: remove static local variables from<br=
>
=C2=A0 buildHost() and getBuildTime()<br>
<br>
=C2=A0Their use is causing difficult to diagnoze data races when building m=
ultiple<br>
@@ -11,8 +11,8 @@ difficult to reason about code.<br>
=C2=A0Upstream-Status: Submitted [<a href=3D"https://github.com/rpm-softwar=
e-management/rpm/pull/226" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/rpm-<wbr>software-management/rpm/pull/<wbr>226</a>]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com">alex.kanavin@gmail.com</a>&gt;<br>
<br>
-<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com">alex.kanavin@gmail.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 build/build.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 54 ++=
++++++++++++++++++++++++++--<br>
=C2=A0 build/pack.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 84 ++=
+++++++---------------------<wbr>-----------------<br>
@@ -20,7 +20,7 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:al=
ex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0 3 files changed, 74 insertions(+), 72 deletions(-)<br>
<br>
=C2=A0diff --git a/build/build.c b/build/build.c<br>
-index 5f99c8db7..09a1311c5 100644<br>
+index 81152e53e..6001f9e52 100644<br>
=C2=A0--- a/build/build.c<br>
=C2=A0+++ b/build/build.c<br>
=C2=A0@@ -6,6 +6,8 @@<br>
@@ -83,7 +83,7 @@ index 5f99c8db7..09a1311c5 100644<br>
=C2=A0 /**<br>
=C2=A0 =C2=A0*/<br>
=C2=A0 static rpmRC doRmSource(rpmSpec spec)<br>
-@@ -203,6 +249,9 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec, =
int what)<br>
+@@ -201,6 +247,9 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec, =
int what)<br>
=C2=A0 =C2=A0 =C2=A0 rpmRC rc =3D RPMRC_OK;<br>
=C2=A0 =C2=A0 =C2=A0 int test =3D (what &amp; RPMBUILD_NOBUILD);<br>
=C2=A0 =C2=A0 =C2=A0 char *cookie =3D buildArgs-&gt;cookie ? xstrdup(buildA=
rgs-&gt;cookie) : NULL;<br>
@@ -93,7 +93,7 @@ index 5f99c8db7..09a1311c5 100644<br>
<br>
=C2=A0 =C2=A0 =C2=A0 if (rpmExpandNumeric(&quot;%{?source_<wbr>date_epoch_f=
rom_changelog}&quot;) &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 getenv(&quot;SOURCE_DATE_EPOCH&quot;) =3D=3D NU=
LL) {<br>
-@@ -271,11 +320,11 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec=
, int what)<br>
+@@ -269,11 +318,11 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec=
, int what)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto exit;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (((what &amp; RPMBUILD_PACKAGESOURCE) &amp;&=
amp; !test) &amp;&amp;<br>
@@ -107,7 +107,7 @@ index 5f99c8db7..09a1311c5 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto exit;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((what &amp; RPMBUILD_CLEAN) &amp;&amp;<br>
-@@ -295,6 +344,7 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec, =
int what)<br>
+@@ -293,6 +342,7 @@ static rpmRC buildSpec(BTA_t buildArgs, rpmSpec spec, =
int what)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) unlink(spec-&gt;specFile);<br>
<br>
=C2=A0 exit:<br>
@@ -116,7 +116,7 @@ index 5f99c8db7..09a1311c5 100644<br>
=C2=A0 =C2=A0 =C2=A0 spec-&gt;rootDir =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 if (rc !=3D RPMRC_OK &amp;&amp; rpmlogGetNrecs() &gt; =
0) {<br>
=C2=A0diff --git a/build/pack.c b/build/pack.c<br>
-index ed5b9ab4e..62427065a 100644<br>
+index df15876ff..17a4b0905 100644<br>
=C2=A0--- a/build/pack.c<br>
=C2=A0+++ b/build/pack.c<br>
=C2=A0@@ -6,8 +6,6 @@<br>
@@ -128,7 +128,7 @@ index ed5b9ab4e..62427065a 100644<br>
=C2=A0 #include &lt;sys/wait.h&gt;<br>
<br>
=C2=A0 #include &lt;rpm/rpmlib.h&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* RPMSIGTAG*, rpmReadPackageF=
ile */<br>
-@@ -151,57 +149,6 @@ exit:<br>
+@@ -152,57 +150,6 @@ exit:<br>
=C2=A0 =C2=A0 =C2=A0 return rc;<br>
=C2=A0 }<br>
<br>
@@ -186,9 +186,9 @@ index ed5b9ab4e..62427065a 100644<br>
=C2=A0 static rpmRC processScriptFiles(rpmSpec spec, Package pkg)<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 struct TriggerFileEntry *p;<br>
-@@ -308,7 +255,8 @@ static int haveRichDep(Package pkg)<br>
- }<br>
-<br>
+@@ -476,7 +423,8 @@ exit:<br>
+=C2=A0 * order to how the RPM format is laid on disk.<br>
+=C2=A0 */<br>
=C2=A0 static rpmRC writeRPM(Package pkg, unsigned char ** pkgidp,<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *fileName, char **cookie)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *fileName, char **cookie,<br>
@@ -196,7 +196,7 @@ index ed5b9ab4e..62427065a 100644<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 FD_t fd =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 char * rpmio_flags =3D NULL;<br>
-@@ -397,7 +345,7 @@ static rpmRC writeRPM(Package pkg, unsigned char ** pk=
gidp,<br>
+@@ -500,7 +448,7 @@ static rpmRC writeRPM(Package pkg, unsigned char ** pk=
gidp,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 /* Create and add the cookie */<br>
=C2=A0 =C2=A0 =C2=A0 if (cookie) {<br>
@@ -204,8 +204,8 @@ index ed5b9ab4e..62427065a 100644<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 rasprintf(cookie, &quot;%s %d&quot;, buildHost,=
 buildTime);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 headerPutString(pkg-&gt;header, RPMTAG_COOKIE, =
*cookie);<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-@@ -546,7 +494,7 @@ static rpmRC checkPackages(char *pkgcheck)<br>
+<br>
+@@ -641,7 +589,7 @@ static rpmRC checkPackages(char *pkgcheck)<br>
=C2=A0 =C2=A0 =C2=A0 return RPMRC_OK;<br>
=C2=A0 }<br>
<br>
@@ -214,7 +214,7 @@ index ed5b9ab4e..62427065a 100644<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *errorString;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rpmRC rc =3D RPMRC_OK;<br>
-@@ -565,8 +513,8 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, =
const char *cookie, int ch<br>
+@@ -660,8 +608,8 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, =
const char *cookie, int ch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 headerCopyTags(spec-&gt;packages-<wbr>&gt;heade=
r, pkg-&gt;header, copyTags);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 headerPutString(pkg-&gt;header, RPMTAG_RPMVERSI=
ON, VERSION);<br>
@@ -225,7 +225,7 @@ index ed5b9ab4e..62427065a 100644<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (spec-&gt;sourcePkgId !=3D NULL) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 headerPutBin(pkg-&gt;header, RPMT=
AG_SOURCEPKGID, spec-&gt;sourcePkgId,16);<br>
-@@ -604,7 +552,7 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, =
const char *cookie, int ch<br>
+@@ -699,7 +647,7 @@ static rpmRC packageBinary(rpmSpec spec, Package pkg, =
const char *cookie, int ch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(binRpm);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -234,7 +234,7 @@ index ed5b9ab4e..62427065a 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc =3D=3D RPMRC_OK) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Do check each written package =
if enabled */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *pkgcheck =3D rpmExpand(&quo=
t;%{?_build_pkgcheck} &quot;, *filename, NULL);<br>
-@@ -624,7 +572,7 @@ struct binaryPackageTaskData<br>
+@@ -719,7 +667,7 @@ struct binaryPackageTaskData<br>
=C2=A0 =C2=A0 =C2=A0 struct binaryPackageTaskData *next;<br>
=C2=A0 };<br>
<br>
@@ -243,7 +243,7 @@ index ed5b9ab4e..62427065a 100644<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 struct binaryPackageTaskData *tasks =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 struct binaryPackageTaskData *task =3D NULL;<br>
-@@ -636,7 +584,7 @@ static struct binaryPackageTaskData* runBinaryPackageT=
asks(rpmSpec spec, const c<br>
+@@ -731,7 +679,7 @@ static struct binaryPackageTaskData* runBinaryPackageT=
asks(rpmSpec spec, const c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pkg =3D=3D spec-&gt;packages) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // the first package needs=
 to be processed ahead of others, as they copy<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // changelog data from it,=
 and so otherwise data races would happen<br>
@@ -252,7 +252,7 @@ index ed5b9ab4e..62427065a 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpmlog(RPMLOG_NOTICE, _(&q=
uot;Finished binary package job, result %d, filename %s\n&quot;), task-&gt;=
result, task-&gt;filename);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tasks =3D task;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-@@ -653,7 +601,7 @@ static struct binaryPackageTaskData* runBinaryPackageT=
asks(rpmSpec spec, const c<br>
+@@ -748,7 +696,7 @@ static struct binaryPackageTaskData* runBinaryPackageT=
asks(rpmSpec spec, const c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (task !=3D tasks)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #pragma omp task<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
@@ -261,7 +261,7 @@ index ed5b9ab4e..62427065a 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpmlog(RPMLOG_NOTICE, _(&q=
uot;Finished binary package job, result %d, filename %s\n&quot;), task-&gt;=
result, task-&gt;filename);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
-@@ -671,11 +619,11 @@ static void freeBinaryPackageTasks(struct binaryPack=
ageTaskData* tasks)<br>
+@@ -766,11 +714,11 @@ static void freeBinaryPackageTasks(struct binaryPack=
ageTaskData* tasks)<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 }<br>
<br>
@@ -275,7 +275,7 @@ index ed5b9ab4e..62427065a 100644<br>
<br>
=C2=A0 =C2=A0 =C2=A0 for (struct binaryPackageTaskData *task =3D tasks; tas=
k !=3D NULL; task =3D task-&gt;next) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (task-&gt;result =3D=3D RPMRC_OK) {<b=
r>
-@@ -702,22 +650,22 @@ rpmRC packageBinaries(rpmSpec spec, const char *cook=
ie, int cheating)<br>
+@@ -797,7 +745,7 @@ rpmRC packageBinaries(rpmSpec spec, const char *cookie=
, int cheating)<br>
=C2=A0 =C2=A0 =C2=A0 return RPMRC_OK;<br>
=C2=A0 }<br>
<br>
@@ -284,6 +284,7 @@ index ed5b9ab4e..62427065a 100644<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 Package sourcePkg =3D spec-&gt;sourcePackage;<br>
=C2=A0 =C2=A0 =C2=A0 rpmRC rc;<br>
+@@ -805,8 +753,8 @@ rpmRC packageSources(rpmSpec spec, char **cookie)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 /* Add some cruft */<br>
=C2=A0 =C2=A0 =C2=A0 headerPutString(sourcePkg-&gt;<wbr>header, RPMTAG_RPMV=
ERSION, VERSION);<br>
@@ -291,9 +292,10 @@ index ed5b9ab4e..62427065a 100644<br>
=C2=A0-=C2=A0 =C2=A0 headerPutUint32(sourcePkg-&gt;<wbr>header, RPMTAG_BUIL=
DTIME, getBuildTime(), 1);<br>
=C2=A0+=C2=A0 =C2=A0 headerPutString(sourcePkg-&gt;<wbr>header, RPMTAG_BUIL=
DHOST, buildHost);<br>
=C2=A0+=C2=A0 =C2=A0 headerPutUint32(sourcePkg-&gt;<wbr>header, RPMTAG_BUIL=
DTIME, &amp;buildTime, 1);<br>
+=C2=A0 =C2=A0 =C2=A0headerPutUint32(sourcePkg-&gt;<wbr>header, RPMTAG_SOUR=
CEPACKAGE, &amp;one, 1);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 /* XXX this should be %_srpmdir */<br>
-=C2=A0 =C2=A0 =C2=A0{ char *fn =3D rpmGetPath(&quot;%{_srcrpmdir}/&quot;, =
spec-&gt;sourceRpmName,NULL);<br>
+@@ -814,7 +762,7 @@ rpmRC packageSources(rpmSpec spec, char **cookie)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *pkgcheck =3D rpmExpand(&quot;%{?_build_pk=
gcheck_<wbr>srpm} &quot;, fn, NULL);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 spec-&gt;sourcePkgId =3D NULL;<br>
@@ -303,10 +305,10 @@ index ed5b9ab4e..62427065a 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Do check SRPM package if enabled */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc =3D=3D RPMRC_OK &amp;&amp; pkgcheck[0] !=
=3D &#39; &#39;) {<br>
=C2=A0diff --git a/build/rpmbuild_internal.h b/build/rpmbuild_internal.h<br=
>
-index 8351a6a34..797337ca7 100644<br>
+index 439b7d3b5..07e8338ad 100644<br>
=C2=A0--- a/build/rpmbuild_internal.h<br>
=C2=A0+++ b/build/rpmbuild_internal.h<br>
-@@ -408,19 +408,23 @@ rpmRC processSourceFiles(rpmSpec spec, rpmBuildPkgFl=
ags pkgFlags);<br>
+@@ -427,19 +427,23 @@ rpmRC processSourceFiles(rpmSpec spec, rpmBuildPkgFl=
ags pkgFlags);<br>
=C2=A0 =C2=A0* @param spec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 spec file control structure<br>
=C2=A0 =C2=A0* @param cookie=C2=A0 =C2=A0 =C2=A0 build identifier &quot;coo=
kie&quot; or NULL<br>
=C2=A0 =C2=A0* @param cheating=C2=A0 =C2=A0 was build shortcircuited?<br>
@@ -333,5 +335,5 @@ index 8351a6a34..797337ca7 100644<br>
=C2=A0 RPM_GNUC_INTERNAL<br>
=C2=A0 int addLangTag(rpmSpec spec, Header h, rpmTagVal tag,<br>
=C2=A0--<br>
-2.11.0<br>
+2.14.2<br>
<br>
diff --git a/meta/recipes-devtools/rpm/<wbr>files/0011-Do-not-require-<wbr>=
that-ELF-binaries-are-<wbr>executable-to-b.patch b/meta/recipes-devtools/rp=
m/<wbr>files/0011-Do-not-require-<wbr>that-ELF-binaries-are-<wbr>executable=
-to-b.patch<br>
index c910a478eea..4ac5c38f063 100644<br>
--- a/meta/recipes-devtools/rpm/<wbr>files/0011-Do-not-require-<wbr>that-EL=
F-binaries-are-<wbr>executable-to-b.patch<br>
+++ b/meta/recipes-devtools/rpm/<wbr>files/0011-Do-not-require-<wbr>that-EL=
F-binaries-are-<wbr>executable-to-b.patch<br>
@@ -1,7 +1,7 @@<br>
-From d65d6e8760afbd7f70b22a1f3297a0<wbr>37bc475fea Mon Sep 17 00:00:00 200=
1<br>
+From 5141d50d7b3d3c209a22c53deedb4c<wbr>eef014401d Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Peter Kjellerstedt &lt;<a href=3D"mailto:pkj@axis.com">pkj@axis=
.com</a>&gt;<br>
=C2=A0Date: Mon, 15 May 2017 10:21:08 +0200<br>
-Subject: [PATCH 11/13] Do not require that ELF binaries are executable to =
be<br>
+Subject: [PATCH 09/15] Do not require that ELF binaries are executable to =
be<br>
=C2=A0 identifiable<br>
<br>
=C2=A0There is nothing that requires, e.g., a DSO to be executable, but it<=
br>
@@ -14,19 +14,20 @@ or not.<br>
<br>
=C2=A0Upstream-Status: Inappropriate<br>
=C2=A0Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjeller=
stedt@axis.com">peter.kjellerstedt@axis.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 fileattrs/elf.attr | 1 -<br>
=C2=A0 1 file changed, 1 deletion(-)<br>
<br>
=C2=A0diff --git a/fileattrs/elf.attr b/fileattrs/elf.attr<br>
-index 595b33e09..bac52649d 100644<br>
+index 5805dd0ee..3516f309d 100644<br>
=C2=A0--- a/fileattrs/elf.attr<br>
=C2=A0+++ b/fileattrs/elf.attr<br>
=C2=A0@@ -1,4 +1,3 @@<br>
=C2=A0 %__elf_provides=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0%{_rpmconfigdir}/elfdeps --provides %{?__filter_GLIBC_PRIVATE:--<wbr>fil=
ter-private}<br>
=C2=A0 %__elf_requires=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0%{_rpmconfigdir}/elfdeps --requires %{?__filter_GLIBC_PRIVATE:--<wbr>fil=
ter-private}<br>
- %__elf_magic=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^(setuid )?(setgid )?(stic=
ky )?ELF (32|64)-bit.*$<br>
+ %__elf_magic=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^(setuid,? )?(setgid,? )?(=
sticky )?ELF (32|64)-bit.*$<br>
=C2=A0-%__elf_flags=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exeonly<br>
=C2=A0--<br>
-2.12.0<br>
+2.14.2<br>
<br>
diff --git a/meta/recipes-devtools/rpm/<wbr>files/0012-Use-conditional-to-<=
wbr><a href=3D"http://access-_docdir-in-macros.in">access-_docdir-in-macros=
.in</a>.<wbr>patch b/meta/recipes-devtools/rpm/<wbr>files/0012-Use-conditio=
nal-to-<wbr><a href=3D"http://access-_docdir-in-macros.in">access-_docdir-i=
n-macros.in</a>.<wbr>patch<br>
deleted file mode 100644<br>
index 996da90d43d..00000000000<br>
--- a/meta/recipes-devtools/rpm/<wbr>files/0012-Use-conditional-to-<wbr><a =
href=3D"http://access-_docdir-in-macros.in">access-_docdir-in-macros.in</a>=
.<wbr>patch<br>
+++ /dev/null<br>
@@ -1,36 +0,0 @@<br>
-From 77808db4036dc4a012c47aca362555<wbr>49ed764a6a Mon Sep 17 00:00:00 200=
1<br>
-From: Peter Kjellerstedt &lt;<a href=3D"mailto:pkj@axis.com">pkj@axis.com<=
/a>&gt;<br>
-Date: Tue, 16 May 2017 10:58:18 +0200<br>
-Subject: [PATCH 12/13] Use conditional to access %{_docdir} in <a href=3D"=
http://macros.in" rel=3D"noreferrer" target=3D"_blank">macros.in</a><br>
-<br>
-This avoids the following warning:<br>
-<br>
-warning: Ignoring invalid regex %{_docdir}<br>
-<br>
-when runing `rpmdeps -R &lt;file&gt;`, since %{_docdir} is only defined wh=
en<br>
-parsing a spec file (in parseSpec()).<br>
-<br>
-Upstream-Status: Accepted [<a href=3D"https://github.com/rpm-software-mana=
gement/rpm/pull/216" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/rpm-<wbr>software-management/rpm/pull/<wbr>216</a>]<br>
-Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt=
@axis.com">peter.kjellerstedt@axis.com</a>&gt;<br>
----<br>
- <a href=3D"http://macros.in" rel=3D"noreferrer" target=3D"_blank">macros.=
in</a> | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/<a href=3D"http://macros.in" rel=3D"noreferrer" target=3D"_bl=
ank">macros.in</a> b/<a href=3D"http://macros.in" rel=3D"noreferrer" target=
=3D"_blank">macros.in</a><br>
-index 84ae25275..cca67a500 100644<br>
---- a/<a href=3D"http://macros.in" rel=3D"noreferrer" target=3D"_blank">ma=
cros.in</a><br>
-+++ b/<a href=3D"http://macros.in" rel=3D"noreferrer" target=3D"_blank">ma=
cros.in</a><br>
-@@ -200,8 +200,8 @@ package or when debugging this package.\<br>
- # Their purpouse is to set up global filtering for all packages. If you n=
eed<br>
- # to set up specific filtering for your package use %__requires_exclude_f=
rom<br>
- # and %__provides_exclude_from instead.<br>
--%__global_requires_exclude_<wbr>from=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0%{_docdir}<br>
--%__global_provides_exclude_<wbr>from=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0%{_docdir}<br>
-+%__global_requires_exclude_<wbr>from=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0%{?_docdir:%{_docdir}}<br>
-+%__global_provides_exclude_<wbr>from=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0%{?_docdir:%{_docdir}}<br>
-<br>
- #=C2=A0 =C2=A0 =C2=A0The path to the gzip executable (legacy, use %{__gzi=
p} instead).<br>
- %_gzipbin=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0%{__gzip}<br>
---<br>
-2.12.0<br>
-<br>
diff --git a/meta/recipes-devtools/rpm/<wbr>files/0013-Add-a-new-option-<wb=
r>alldeps-to-rpmdeps.patch b/meta/recipes-devtools/rpm/<wbr>files/0013-Add-=
a-new-option-<wbr>alldeps-to-rpmdeps.patch<br>
index faaf62960c1..d84e8b54d8d 100644<br>
--- a/meta/recipes-devtools/rpm/<wbr>files/0013-Add-a-new-option-<wbr>allde=
ps-to-rpmdeps.patch<br>
+++ b/meta/recipes-devtools/rpm/<wbr>files/0013-Add-a-new-option-<wbr>allde=
ps-to-rpmdeps.patch<br>
@@ -1,7 +1,7 @@<br>
-From 3bf20a6116ae3e1a5a3a6907bee7e8<wbr>81b17efb2f Mon Sep 17 00:00:00 200=
1<br>
+From ef9f8c17c3e5c35d3b55db9ca76b0f<wbr>a0d6336421 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Peter Kjellerstedt &lt;<a href=3D"mailto:pkj@axis.com">pkj@axis=
.com</a>&gt;<br>
=C2=A0Date: Mon, 15 May 2017 11:23:26 +0200<br>
-Subject: [PATCH 13/13] Add a new option --alldeps to rpmdeps<br>
+Subject: [PATCH 10/15] Add a new option --alldeps to rpmdeps<br>
<br>
=C2=A0This will send the output from rpmfcPrint() to stdout. This is an<br>
=C2=A0alternative to using the --rpmfcdebug option, which will send the sam=
e<br>
@@ -12,6 +12,7 @@ output options, e.g., --requires, without affecting their=
 output.<br>
<br>
=C2=A0Upstream-Status: Submitted [<a href=3D"https://github.com/rpm-softwar=
e-management/rpm/pull/220" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/rpm-<wbr>software-management/rpm/pull/<wbr>220</a>]<br>
=C2=A0Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjeller=
stedt@axis.com">peter.kjellerstedt@axis.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 build/rpmfc.c=C2=A0 =C2=A0| 27 ++++++++++++++-------------<br>
=C2=A0 build/rpmfc.h=C2=A0 =C2=A0|=C2=A0 1 -<br>
@@ -19,10 +20,10 @@ Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto=
:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt;<br>
=C2=A0 3 files changed, 39 insertions(+), 33 deletions(-)<br>
<br>
=C2=A0diff --git a/build/rpmfc.c b/build/rpmfc.c<br>
-index c8e2f876a..44f1cdc9a 100644<br>
+index b8aea76d0..d04ffb297 100644<br>
=C2=A0--- a/build/rpmfc.c<br>
=C2=A0+++ b/build/rpmfc.c<br>
-@@ -732,7 +732,6 @@ static rpm_color_t rpmfcColor(const char * fmstr)<br>
+@@ -692,7 +692,6 @@ static rpm_color_t rpmfcColor(const char * fmstr)<br>
<br>
=C2=A0 void rpmfcPrint(const char * msg, rpmfc fc, FILE * fp)<br>
=C2=A0 {<br>
@@ -30,7 +31,7 @@ index c8e2f876a..44f1cdc9a 100644<br>
=C2=A0 =C2=A0 =C2=A0 int ndx;<br>
=C2=A0 =C2=A0 =C2=A0 int dx;<br>
=C2=A0 =C2=A0 =C2=A0 int fx;<br>
-@@ -744,21 +743,23 @@ void rpmfcPrint(const char * msg, rpmfc fc, FILE * f=
p)<br>
+@@ -704,21 +703,23 @@ void rpmfcPrint(const char * msg, rpmfc fc, FILE * f=
p)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 if (fc)<br>
=C2=A0 =C2=A0 =C2=A0 for (fx =3D 0; fx &lt; fc-&gt;nfiles; fx++) {<br>
@@ -79,7 +80,7 @@ index dae8ea5b1..3d87b31cf 100644<br>
=C2=A0 =C2=A0* @param fc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file classifier<=
br>
=C2=A0 =C2=A0* @param fp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output file hand=
le (NULL for stderr)<br>
=C2=A0diff --git a/tools/rpmdeps.c b/tools/rpmdeps.c<br>
-index a414b6343..f260a38c4 100644<br>
+index 419befce1..f260a38c4 100644<br>
=C2=A0--- a/tools/rpmdeps.c<br>
=C2=A0+++ b/tools/rpmdeps.c<br>
=C2=A0@@ -23,6 +23,8 @@ static int print_conflicts;<br>
@@ -105,7 +106,7 @@ index a414b6343..f260a38c4 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto exit;<br>
<br>
=C2=A0-=C2=A0 =C2=A0 if (_rpmfc_debug)<br>
--=C2=A0 =C2=A0 =C2=A0 rpmfcPrint(buf, fc, NULL);<br>
+-=C2=A0 =C2=A0 =C2=A0 rpmfcPrint(NULL, fc, NULL);<br>
=C2=A0-<br>
=C2=A0-=C2=A0 =C2=A0 if (print_provides)<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 rpmdsPrint(NULL, rpmfcProvides(fc), stdout);<br=
>
@@ -148,5 +149,5 @@ index a414b6343..f260a38c4 100644<br>
=C2=A0 =C2=A0 =C2=A0 ec =3D 0;<br>
<br>
=C2=A0--<br>
-2.12.0<br>
+2.14.2<br>
<br>
diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_git.bb" rel=3D=
"noreferrer" target=3D"_blank">rp<wbr>m_git.bb</a> b/meta/recipes-devtools/=
rpm/<a href=3D"http://rpm_4.14.0.bb" rel=3D"noreferrer" target=3D"_blank">r=
p<wbr>m_4.14.0.bb</a><br>
similarity index 93%<br>
rename from meta/recipes-devtools/rpm/<a href=3D"http://rpm_git.bb" rel=3D"=
noreferrer" target=3D"_blank">rpm_<wbr>git.bb</a><br>
rename to meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.14.0.bb" rel=3D=
"noreferrer" target=3D"_blank">rpm_<wbr>4.14.0.bb</a><br>
index 57b9c2d6acc..e4e9c3e6341 100644<br>
--- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">rp<wbr>m_git.bb</a><br>
+++ b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.14.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">rp<wbr>m_4.14.0.bb</a><br>
@@ -24,19 +24,16 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.rpm.org" rel=
=3D"noreferrer" target=3D"_blank">http://www.rpm.org</a>&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>f5259151d26ff18e=
78023450a5ac8d<wbr>96&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/rpm-software-manageme=
nt/rpm" rel=3D"noreferrer" target=3D"_blank">github.com/rpm-<wbr>software-m=
anagement/rpm</a> \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/rpm-software-manageme=
nt/rpm;branch=3Drpm-4.14.x" rel=3D"noreferrer" target=3D"_blank">github.com=
/rpm-<wbr>software-management/rpm;<wbr>branch=3Drpm-4.14.x</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Do-not-add-an-<wbr>un=
satisfiable-dependency-when-<wbr>building.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Do-not-read-<wbr>conf=
ig-files-from-HOME.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-When-cross-<wbr>insta=
lling-execute-package-<wbr>scriptlets-wit.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Do-not-reset-the-<wbr=
>PATH-environment-variable-<wbr>before-ru.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Add-support-for-<wbr>=
prefixing-etc-from-RPM_<wbr>ETCCONFIGDIR-.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-When-nice-value-<wbr>=
cannot-be-reset-issue-a-<wbr>notice-inste.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Do-not-hardcode-<wbr>=
lib-rpm-as-the-installation-<wbr>path-for.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-build-with-<wbr>m=
usl-C-library.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Add-a-color-<wbr>sett=
ing-for-mips64_n32-<wbr>binaries.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Add-PYTHON_ABI-<wbr>w=
hen-searching-for-python-<wbr>libraries.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0011-Do-not-require-<wbr>t=
hat-ELF-binaries-are-<wbr>executable-to-b.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0012-Use-conditional-<wbr>=
to-access-_docdir-in-macros.<wbr>in.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0013-Add-a-new-option-<wbr=
>alldeps-to-rpmdeps.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Split-binary-<wbr>pac=
kage-building-into-a-<wbr>separate-functi.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Run-binary-<wbr>packa=
ge-creation-via-thread-<wbr>pools.patch \<br>
@@ -45,9 +42,8 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/rpm-=
software-management/rpm" rel=3D"noreferrer" target=3D"_blank">github.com/rp=
m-<wbr>software-management/rpm</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-perl-disable-auto-<wb=
r>reqs.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-PV =3D &quot;4.13.90+git${SRCPV}&quot;<br>
=C2=A0PE =3D &quot;1&quot;<br>
-SRCREV =3D &quot;<wbr>a8e51b3bb05c6acb1d9b2e3d34f859<wbr>ddda1677be&quot;<=
br>
+SRCREV =3D &quot;<wbr>da3720f62e57648fb1dc2a632744d3<wbr>8866139971&quot;<=
br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.15.0<br>
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

--001a114a9b5eb2291b05606a23ac--
