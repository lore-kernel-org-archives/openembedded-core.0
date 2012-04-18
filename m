Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SKZ8I-0006oD-Bg
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 19:57:35 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Apr 2012 10:48:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="155230028"
Received: from unknown (HELO [10.255.12.104]) ([10.255.12.104])
	by fmsmga002.fm.intel.com with ESMTP; 18 Apr 2012 10:48:05 -0700
Message-ID: <4F8EFE55.9060406@linux.intel.com>
Date: Wed, 18 Apr 2012 10:48:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1334229041-22552-1-git-send-email-florin.sarbu@windriver.com>
In-Reply-To: <1334229041-22552-1-git-send-email-florin.sarbu@windriver.com>
Subject: Re: [PATCH] Update intltool to version 0.50.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2012 17:57:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2012 04:10 AM, Florin Sarbu wrote:
> Uprev to version 0.50.0 and move SRC_URI from .inc into the .bb specifying the version
>
> Signed-off-by: Florin Sarbu<florin.sarbu@windriver.com>
> ---
>   .../intltool-0.40.6/intltool-nowarn-0.40.0.patch   |   52 --------------------
>   .../intltool/intltool-0.40.6/noperlcheck.patch     |   40 ---------------
>   .../intltool-0.40.6/remove-xml-check.patch         |   32 ------------
>   .../intltool/intltool-0.40.6/use-nativeperl.patch  |   20 --------
>   .../intltool-0.50.0/intltool-nowarn-0.50.0.patch   |   40 +++++++++++++++
>   .../intltool/intltool-0.50.0/noperlcheck.patch     |   40 +++++++++++++++
>   .../intltool-0.50.0/remove-xml-check.patch         |   29 +++++++++++
>   .../intltool/intltool-0.50.0/use-nativeperl.patch  |   20 ++++++++
>   meta/recipes-devtools/intltool/intltool.inc        |    1 -
>   meta/recipes-devtools/intltool/intltool_0.40.6.bb  |   19 -------
>   meta/recipes-devtools/intltool/intltool_0.50.0.bb  |   20 ++++++++
>   11 files changed, 149 insertions(+), 164 deletions(-)
>   delete mode 100644 meta/recipes-devtools/intltool/intltool-0.40.6/intltool-nowarn-0.40.0.patch
>   delete mode 100644 meta/recipes-devtools/intltool/intltool-0.40.6/noperlcheck.patch
>   delete mode 100644 meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch
>   delete mode 100644 meta/recipes-devtools/intltool/intltool-0.40.6/use-nativeperl.patch
>   create mode 100644 meta/recipes-devtools/intltool/intltool-0.50.0/intltool-nowarn-0.50.0.patch
>   create mode 100644 meta/recipes-devtools/intltool/intltool-0.50.0/noperlcheck.patch
>   create mode 100644 meta/recipes-devtools/intltool/intltool-0.50.0/remove-xml-check.patch
>   create mode 100644 meta/recipes-devtools/intltool/intltool-0.50.0/use-nativeperl.patch
>   delete mode 100644 meta/recipes-devtools/intltool/intltool_0.40.6.bb
>   create mode 100644 meta/recipes-devtools/intltool/intltool_0.50.0.bb
>
Could you have done this with git mv, rather than copy so that we can 
preserve git history?


> diff --git a/meta/recipes-devtools/intltool/intltool-0.40.6/intltool-nowarn-0.40.0.patch b/meta/recipes-devtools/intltool/intltool-0.40.6/intltool-nowarn-0.40.0.patch
> deleted file mode 100644
> index ff9f52e..0000000
> --- a/meta/recipes-devtools/intltool/intltool-0.40.6/intltool-nowarn-0.40.0.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Index: intltool-0.40.0/intltool-extract.in
> -===================================================================
> ---- intltool-0.40.0.orig/intltool-extract.in	2008-12-17 11:50:19.000000000 +0000
> -+++ intltool-0.40.0/intltool-extract.in	2008-12-17 11:50:31.000000000 +0000
> -@@ -1,4 +1,4 @@
> --#!@INTLTOOL_PERL@ -w
> -+#!@INTLTOOL_PERL@
> - # -*- Mode: perl; indent-tabs-mode: nil; c-basic-offset: 4  -*-
> -
> - #
> -Index: intltool-0.40.0/intltool-merge.in
> -===================================================================
> ---- intltool-0.40.0.orig/intltool-merge.in	2008-12-17 11:50:19.000000000 +0000
> -+++ intltool-0.40.0/intltool-merge.in	2008-12-17 11:50:38.000000000 +0000
> -@@ -1,4 +1,4 @@
> --#!@INTLTOOL_PERL@ -w
> -+#!@INTLTOOL_PERL@
> - # -*- Mode: perl; indent-tabs-mode: nil; c-basic-offset: 4  -*-
> -
> - #
> -Index: intltool-0.40.0/intltool-prepare.in
> -===================================================================
> ---- intltool-0.40.0.orig/intltool-prepare.in	2008-12-17 11:50:19.000000000 +0000
> -+++ intltool-0.40.0/intltool-prepare.in	2008-12-17 11:50:42.000000000 +0000
> -@@ -1,4 +1,4 @@
> --#!@INTLTOOL_PERL@ -w
> -+#!@INTLTOOL_PERL@
> - # -*- Mode: perl; indent-tabs-mode: nil; c-basic-offset: 4  -*-
> -
> - #  Intltool .desktop, .directory Prepare Tool
> -Index: intltool-0.40.0/intltool-unicodify.in
> -===================================================================
> ---- intltool-0.40.0.orig/intltool-unicodify.in	2008-12-17 11:50:19.000000000 +0000
> -+++ intltool-0.40.0/intltool-unicodify.in	2008-12-17 11:50:46.000000000 +0000
> -@@ -1,4 +1,4 @@
> --#!@INTLTOOL_PERL@ -w
> -+#!@INTLTOOL_PERL@
> -
> - #
> - #  The i18n Unicode Encoding Utility
> -Index: intltool-0.40.0/intltool-update.in
> -===================================================================
> ---- intltool-0.40.0.orig/intltool-update.in	2008-12-17 11:50:19.000000000 +0000
> -+++ intltool-0.40.0/intltool-update.in	2008-12-17 11:50:49.000000000 +0000
> -@@ -1,4 +1,4 @@
> --#!@INTLTOOL_PERL@ -w
> -+#!@INTLTOOL_PERL@
> - # -*- Mode: perl; indent-tabs-mode: nil; c-basic-offset: 4  -*-
> -
> - #
> diff --git a/meta/recipes-devtools/intltool/intltool-0.40.6/noperlcheck.patch b/meta/recipes-devtools/intltool/intltool-0.40.6/noperlcheck.patch
> deleted file mode 100644
> index 3d8b591..0000000
> --- a/meta/recipes-devtools/intltool/intltool-0.40.6/noperlcheck.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -In the target case, we can't check if perl exists or try running it. If we
> -don't patch the code, the native perl location would be used, not the target
> -which is also incorrect. We therefore disable this code and rely on the
> -correct value of PERL being passed in.
> -
> -RP 31/8/2011
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Index: intltool-0.40.6/configure.in
> -===================================================================
> ---- intltool-0.40.6.orig/configure.in	2011-08-31 11:21:13.061160535 +0100
> -+++ intltool-0.40.6/configure.in	2011-08-31 11:22:44.991160885 +0100
> -@@ -9,24 +9,10 @@
> - aclocaldir='${datadir}'/aclocal
> - AC_SUBST(aclocaldir)
> -
> --AC_PATH_PROG(PERL, perl)
> - if test -z "$PERL"; then
> --   AC_MSG_ERROR([perl not found])
> --fi
> --AC_MSG_CHECKING([for perl>= 5.8.1])
> --$PERL -e "use 5.8.1;">  /dev/null 2>&1
> --if test $? -ne 0; then
> --   AC_MSG_ERROR([perl 5.8.1 is required for intltool])
> --else
> --   PERL_VERSION="`$PERL -e \"printf '%vd', $^V\"`"
> --   AC_MSG_RESULT([$PERL_VERSION])
> --fi
> --AC_MSG_CHECKING([for XML::Parser])
> --if `$PERL -e "require XML::Parser" 2>/dev/null`; then
> --   AC_MSG_RESULT([ok])
> --else
> --   AC_MSG_ERROR([XML::Parser perl module is required for intltool])
> -+   AC_MSG_ERROR([PERL variable not set])
> - fi
> -+AC_SUBST(PERL)
> -
> - AC_OUTPUT([
> - Makefile
> diff --git a/meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch b/meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch
> deleted file mode 100644
> index 2eb9abd..0000000
> --- a/meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Index: intltool-0.40.6/intltool.m4
> -===================================================================
> ---- intltool-0.40.6.orig/intltool.m4	2009-02-14 14:12:28.000000000 -0800
> -+++ intltool-0.40.6/intltool.m4	2011-11-23 15:39:34.689561872 -0800
> -@@ -122,14 +122,16 @@
> -    IT_PERL_VERSION="`$INTLTOOL_PERL -e \"printf '%vd', $^V\"`"
> -    AC_MSG_RESULT([$IT_PERL_VERSION])
> - fi
> --if test "x$2" != "xno-xml"; then
> --   AC_MSG_CHECKING([for XML::Parser])
> --   if `$INTLTOOL_PERL -e "require XML::Parser" 2>/dev/null`; then
> --       AC_MSG_RESULT([ok])
> --   else
> --       AC_MSG_ERROR([XML::Parser perl module is required for intltool])
> --   fi
> --fi
> -+
> -+# Disable this check since we know XML::Parser is installed
> -+#if test "x$2" != "xno-xml"; then
> -+#   AC_MSG_CHECKING([for XML::Parser])
> -+#   if `$INTLTOOL_PERL -e "require XML::Parser" 2>/dev/null`; then
> -+#       AC_MSG_RESULT([ok])
> -+#   else
> -+#       AC_MSG_ERROR([XML::Parser perl module is required for intltool])
> -+#   fi
> -+#fi
> -
> - # Substitute ALL_LINGUAS so we can use it in po/Makefile
> - AC_SUBST(ALL_LINGUAS)
> diff --git a/meta/recipes-devtools/intltool/intltool-0.40.6/use-nativeperl.patch b/meta/recipes-devtools/intltool/intltool-0.40.6/use-nativeperl.patch
> deleted file mode 100644
> index 5f5fed3..0000000
> --- a/meta/recipes-devtools/intltool/intltool-0.40.6/use-nativeperl.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -OE has perl binary as 'nativeperl' in native sysroot so we look for it
> -in order to avoid intltool searching and finding perl from /usr/bin
> -on build system which may not have all the modules that it needs.
> -
> -Signed-off-by: Khem Raj<raj.khem@gmail.com>
> -
> -Upstream-Status: Inappropriate [OE specific]
> -Index: intltool-0.40.6/intltool.m4
> -===================================================================
> ---- intltool-0.40.6.orig/intltool.m4	2009-02-14 14:12:28.000000000 -0800
> -+++ intltool-0.40.6/intltool.m4	2011-08-09 08:07:16.427347846 -0700
> -@@ -110,7 +110,7 @@
> -     AC_MSG_ERROR([GNU gettext tools not found; required for intltool])
> - fi
> -
> --AC_PATH_PROG(INTLTOOL_PERL, perl)
> -+AC_PATH_PROG(INTLTOOL_PERL, nativeperl)
> - if test -z "$INTLTOOL_PERL"; then
> -    AC_MSG_ERROR([perl not found])
> - fi
> diff --git a/meta/recipes-devtools/intltool/intltool-0.50.0/intltool-nowarn-0.50.0.patch b/meta/recipes-devtools/intltool/intltool-0.50.0/intltool-nowarn-0.50.0.patch
> new file mode 100644
> index 0000000..590b668
> --- /dev/null
> +++ b/meta/recipes-devtools/intltool/intltool-0.50.0/intltool-nowarn-0.50.0.patch
> @@ -0,0 +1,40 @@
> +Index: intltool-0.50.0/intltool-extract.in
> +===================================================================
> +--- intltool-0.50.0.orig/intltool-extract.in	2011-10-08 22:24:57.000000000 +0300
> ++++ intltool-0.50.0/intltool-extract.in	2011-12-07 16:04:07.000000000 +0200
> +@@ -1,4 +1,4 @@
> +-#!@INTLTOOL_PERL@ -w
> ++#!@INTLTOOL_PERL@
> + # -*- Mode: perl; indent-tabs-mode: nil; c-basic-offset: 4  -*-
> +
> + #
> +Index: intltool-0.50.0/intltool-merge.in
> +===================================================================
> +--- intltool-0.50.0.orig/intltool-merge.in	2011-10-08 17:52:01.000000000 +0300
> ++++ intltool-0.50.0/intltool-merge.in	2011-12-07 16:05:55.000000000 +0200
> +@@ -1,4 +1,4 @@
> +-#!@INTLTOOL_PERL@ -w
> ++#!@INTLTOOL_PERL@
> + # -*- Mode: perl; indent-tabs-mode: nil; c-basic-offset: 4  -*-
> +
> + #
> +Index: intltool-0.50.0/intltool-prepare.in
> +===================================================================
> +--- intltool-0.50.0.orig/intltool-prepare.in	2011-10-08 09:16:58.000000000 +0300
> ++++ intltool-0.50.0/intltool-prepare.in	2011-12-07 16:06:13.000000000 +0200
> +@@ -1,4 +1,4 @@
> +-#!@INTLTOOL_PERL@ -w
> ++#!@INTLTOOL_PERL@
> + # -*- Mode: perl; indent-tabs-mode: nil; c-basic-offset: 4  -*-
> +
> + #  Intltool .desktop, .directory Prepare Tool
> +Index: intltool-0.50.0/intltool-update.in
> +===================================================================
> +--- intltool-0.50.0.orig/intltool-update.in	2011-10-08 22:24:57.000000000 +0300
> ++++ intltool-0.50.0/intltool-update.in	2011-12-07 16:06:39.000000000 +0200
> +@@ -1,4 +1,4 @@
> +-#!@INTLTOOL_PERL@ -w
> ++#!@INTLTOOL_PERL@
> + # -*- Mode: perl; indent-tabs-mode: nil; c-basic-offset: 4  -*-
> +
> + #
> diff --git a/meta/recipes-devtools/intltool/intltool-0.50.0/noperlcheck.patch b/meta/recipes-devtools/intltool/intltool-0.50.0/noperlcheck.patch
> new file mode 100644
> index 0000000..3d8b591
> --- /dev/null
> +++ b/meta/recipes-devtools/intltool/intltool-0.50.0/noperlcheck.patch
> @@ -0,0 +1,40 @@
> +In the target case, we can't check if perl exists or try running it. If we
> +don't patch the code, the native perl location would be used, not the target
> +which is also incorrect. We therefore disable this code and rely on the
> +correct value of PERL being passed in.
> +
> +RP 31/8/2011
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Index: intltool-0.40.6/configure.in
> +===================================================================
> +--- intltool-0.40.6.orig/configure.in	2011-08-31 11:21:13.061160535 +0100
> ++++ intltool-0.40.6/configure.in	2011-08-31 11:22:44.991160885 +0100
> +@@ -9,24 +9,10 @@
> + aclocaldir='${datadir}'/aclocal
> + AC_SUBST(aclocaldir)
> +
> +-AC_PATH_PROG(PERL, perl)
> + if test -z "$PERL"; then
> +-   AC_MSG_ERROR([perl not found])
> +-fi
> +-AC_MSG_CHECKING([for perl>= 5.8.1])
> +-$PERL -e "use 5.8.1;">  /dev/null 2>&1
> +-if test $? -ne 0; then
> +-   AC_MSG_ERROR([perl 5.8.1 is required for intltool])
> +-else
> +-   PERL_VERSION="`$PERL -e \"printf '%vd', $^V\"`"
> +-   AC_MSG_RESULT([$PERL_VERSION])
> +-fi
> +-AC_MSG_CHECKING([for XML::Parser])
> +-if `$PERL -e "require XML::Parser" 2>/dev/null`; then
> +-   AC_MSG_RESULT([ok])
> +-else
> +-   AC_MSG_ERROR([XML::Parser perl module is required for intltool])
> ++   AC_MSG_ERROR([PERL variable not set])
> + fi
> ++AC_SUBST(PERL)
> +
> + AC_OUTPUT([
> + Makefile
> diff --git a/meta/recipes-devtools/intltool/intltool-0.50.0/remove-xml-check.patch b/meta/recipes-devtools/intltool/intltool-0.50.0/remove-xml-check.patch
> new file mode 100644
> index 0000000..476d091
> --- /dev/null
> +++ b/meta/recipes-devtools/intltool/intltool-0.50.0/remove-xml-check.patch
> @@ -0,0 +1,29 @@
> +Index: intltool-0.40.6/intltool.m4
> +===================================================================
> +--- intltool-0.40.6.orig/intltool.m4	2009-02-14 14:12:28.000000000 -0800
> ++++ intltool-0.40.6/intltool.m4	2011-11-23 15:39:34.689561872 -0800
> +@@ -122,14 +122,16 @@
> +    IT_PERL_VERSION="`$INTLTOOL_PERL -e \"printf '%vd', $^V\"`"
> +    AC_MSG_RESULT([$IT_PERL_VERSION])
> + fi
> +-if test "x$2" != "xno-xml"; then
> +-   AC_MSG_CHECKING([for XML::Parser])
> +-   if `$INTLTOOL_PERL -e "require XML::Parser" 2>/dev/null`; then
> +-       AC_MSG_RESULT([ok])
> +-   else
> +-       AC_MSG_ERROR([XML::Parser perl module is required for intltool])
> +-   fi
> +-fi
> ++
> ++# Disable this check since we know XML::Parser is installed
> ++#if test "x$2" != "xno-xml"; then
> ++#   AC_MSG_CHECKING([for XML::Parser])
> ++#   if `$INTLTOOL_PERL -e "require XML::Parser" 2>/dev/null`; then
> ++#       AC_MSG_RESULT([ok])
> ++#   else
> ++#       AC_MSG_ERROR([XML::Parser perl module is required for intltool])
> ++#   fi
> ++#fi
> +
> + # Substitute ALL_LINGUAS so we can use it in po/Makefile
> + AC_SUBST(ALL_LINGUAS)
> diff --git a/meta/recipes-devtools/intltool/intltool-0.50.0/use-nativeperl.patch b/meta/recipes-devtools/intltool/intltool-0.50.0/use-nativeperl.patch
> new file mode 100644
> index 0000000..5f5fed3
> --- /dev/null
> +++ b/meta/recipes-devtools/intltool/intltool-0.50.0/use-nativeperl.patch
> @@ -0,0 +1,20 @@
> +OE has perl binary as 'nativeperl' in native sysroot so we look for it
> +in order to avoid intltool searching and finding perl from /usr/bin
> +on build system which may not have all the modules that it needs.
> +
> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
> +
> +Upstream-Status: Inappropriate [OE specific]
> +Index: intltool-0.40.6/intltool.m4
> +===================================================================
> +--- intltool-0.40.6.orig/intltool.m4	2009-02-14 14:12:28.000000000 -0800
> ++++ intltool-0.40.6/intltool.m4	2011-08-09 08:07:16.427347846 -0700
> +@@ -110,7 +110,7 @@
> +     AC_MSG_ERROR([GNU gettext tools not found; required for intltool])
> + fi
> +
> +-AC_PATH_PROG(INTLTOOL_PERL, perl)
> ++AC_PATH_PROG(INTLTOOL_PERL, nativeperl)
> + if test -z "$INTLTOOL_PERL"; then
> +    AC_MSG_ERROR([perl not found])
> + fi
> diff --git a/meta/recipes-devtools/intltool/intltool.inc b/meta/recipes-devtools/intltool/intltool.inc
> index 8d983df..ee8d07d 100644
> --- a/meta/recipes-devtools/intltool/intltool.inc
> +++ b/meta/recipes-devtools/intltool/intltool.inc
> @@ -3,7 +3,6 @@ SECTION = "devel"
>   LICENSE = "GPLv2"
>
>   URLV="${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
> -SRC_URI = "${GNOME_MIRROR}/intltool/${URLV}/intltool-${PV}.tar.bz2"
>   S = "${WORKDIR}/intltool-${PV}"
>
>   DEPENDS = "libxml-parser-perl-native"
> diff --git a/meta/recipes-devtools/intltool/intltool_0.40.6.bb b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
> deleted file mode 100644
> index c820f11..0000000
> --- a/meta/recipes-devtools/intltool/intltool_0.40.6.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -require intltool.inc
> -LICENSE="GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> -PR = "r6"
> -
> -SRC_URI_append = " file://intltool-nowarn-0.40.0.patch \
> -                   ${NATIVEPATCHES} \
> -                 "
> -
> -#
> -# All of the intltool scripts have the correct paths to perl already
> -# embedded into them and can find perl fine, so we add the remove xml-check
> -# in the intltool.m4 via the remove-xml-check.patch
> -NATIVEPATCHES = "file://noperlcheck.patch \
> -                 file://remove-xml-check.patch"
> -NATIVEPATCHES_virtclass-native = "file://use-nativeperl.patch"
> -
> -SRC_URI[md5sum] = "69bc0353323112f42ad4f9cf351bc3e5"
> -SRC_URI[sha256sum] = "4d1e5f8561f09c958e303d4faa885079a5e173a61d28437d0013ff5efc9e3b64"
> diff --git a/meta/recipes-devtools/intltool/intltool_0.50.0.bb b/meta/recipes-devtools/intltool/intltool_0.50.0.bb
> new file mode 100644
> index 0000000..4d1af2b
> --- /dev/null
> +++ b/meta/recipes-devtools/intltool/intltool_0.50.0.bb
> @@ -0,0 +1,20 @@
> +require intltool.inc
> +LICENSE="GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +PR = "r0"
> +
> +SRC_URI = "http://launchpad.net/intltool/trunk/${PV}/+download/intltool-${PV}.tar.gz \
Why did you need to do this? ${PV} is avaiable in the .inc.

SRC_URI could be set to in the .inc file:
"http://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"

and then SRC_URI += here
> +          file://intltool-nowarn-0.50.0.patch \
> +          ${NATIVEPATCHES} \
> +          "
> +

Sau!

> +#
> +# All of the intltool scripts have the correct paths to perl already
> +# embedded into them and can find perl fine, so we add the remove xml-check
> +# in the intltool.m4 via the remove-xml-check.patch
> +NATIVEPATCHES = "file://noperlcheck.patch \
> +                 file://remove-xml-check.patch"
> +NATIVEPATCHES_virtclass-native = "file://use-nativeperl.patch"
> +
> +SRC_URI[md5sum] = "0da9847a60391ca653df35123b1f7cc0"
> +SRC_URI[sha256sum] = "dccfb0b7dd35a170130e8934bfd30c29da6ae73bcd3ca4ba71317c977b2893d6"


