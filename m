Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TYxbx-0000eP-6n
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 12:27:57 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Nov 2012 03:13:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,255,1352102400"; d="scan'208";a="242622947"
Received: from lpalcu-linux (HELO [10.237.105.42]) ([10.237.105.42])
	by orsmga002.jf.intel.com with ESMTP; 15 Nov 2012 03:13:58 -0800
Message-ID: <50A4CE75.8020500@intel.com>
Date: Thu, 15 Nov 2012 13:13:57 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120912 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <a7f0c78da3a41c3d7a57966ba15b3013f3da1744.1352898505.git.laurentiu.palcu@intel.com>
	<1352977630-20450-1-git-send-email-laurentiu.palcu@intel.com>
In-Reply-To: <1352977630-20450-1-git-send-email-laurentiu.palcu@intel.com>
Subject: Re: [PATCH v4 08/12] xserver-xorg: upgrade to 1.13.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Nov 2012 11:27:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

v4:
 * bumped PR xorg-driver-common.inc to get the the input/video drivers
rebuilt.

On 11/15/2012 01:07 PM, Laurentiu Palcu wrote:
> The patch contains several aditional changes:
>  * removed one backported patch (included in the new release);
>  * changed mips64-compiler.patch to apply properly;
>  * licence checksum for COPYING file changed: some copyright years have
>    been changed;
>  * bump PR in xorg-driver-common.inc so that all input/video drivers
>    get rebuilt. That's becaue the ABI changed;
> 
> The following external modules are now built-in:
>  * DBE
>  * DRI2
>  * DRI
>  * RECORD
> 
> The extmod module was completely removed.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/conf/machine/include/ia32-base.inc            |    5 +-
>  .../xorg-driver/xorg-driver-common.inc             |    2 +-
>  .../xserver-xorg-1.11.4/crosscompile.patch         |   22 ------
>  .../fix_open_max_preprocessor_error.patch          |   15 -----
>  .../xserver-xorg-1.11.4/macro_tweak.patch          |   25 -------
>  .../xserver-xorg-1.11.4/mips64-compiler.patch      |   29 --------
>  .../xserver-xorg-1.11.4/pkgconfig-deps.patch       |   70 --------------------
>  .../xserver-xorg-1.13.0/crosscompile.patch         |   22 ++++++
>  .../fix_open_max_preprocessor_error.patch          |   15 +++++
>  .../xserver-xorg-1.13.0/macro_tweak.patch          |   25 +++++++
>  .../xserver-xorg-1.13.0/mips64-compiler.patch      |   29 ++++++++
>  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   32 +++++----
>  .../xorg-xserver/xserver-xorg_1.11.4.bb            |   13 ----
>  .../xorg-xserver/xserver-xorg_1.13.0.bb            |   12 ++++
>  14 files changed, 125 insertions(+), 191 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/crosscompile.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/fix_open_max_preprocessor_error.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/macro_tweak.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mips64-compiler.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/pkgconfig-deps.patch
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/crosscompile.patch
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/fix_open_max_preprocessor_error.patch
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/macro_tweak.patch
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/mips64-compiler.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
> 
> diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/include/ia32-base.inc
> index 4b10183..c2d267a 100644
> --- a/meta/conf/machine/include/ia32-base.inc
> +++ b/meta/conf/machine/include/ia32-base.inc
> @@ -33,11 +33,8 @@ XSERVER_IA32_BASE = "xserver-xorg \
>             xf86-input-synaptics \
>             "
>  
> -XSERVER_IA32_EXT = "xserver-xorg-extension-dri \
> -           xserver-xorg-extension-dri2 \
> +XSERVER_IA32_EXT = "
>             xserver-xorg-extension-glx \
> -           xserver-xorg-extension-extmod \
> -           xserver-xorg-extension-dbe \
>             xserver-xorg-module-libint10 \
>             "
>  
> diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> index f9f25ff..4c9b47d 100644
> --- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> +++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> @@ -5,7 +5,7 @@ SECTION = "x11/drivers"
>  LICENSE = "MIT-X"
>  
>  PE = "2"
> -INC_PR = "r18"
> +INC_PR = "r19"
>  
>  DEPENDS = "virtual/xserver xproto randrproto util-macros"
>  
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/crosscompile.patch
> deleted file mode 100644
> index 2f98bb8..0000000
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/crosscompile.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> -diff --git a/configure.ac b/configure.ac
> -index b3b752c..600500b 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -523,13 +523,9 @@ dnl Uses --default-font-path if set, otherwise checks for /etc/X11/fontpath.d,
> - dnl otherwise uses standard subdirectories of FONTROOTDIR. When cross
> - dnl compiling, assume default font path uses standard FONTROOTDIR directories.
> - DEFAULT_FONT_PATH="${FONTMISCDIR}/,${FONTTTFDIR}/,${FONTOTFDIR}/,${FONTTYPE1DIR}/,${FONT100DPIDIR}/,${FONT75DPIDIR}/"
> --if test "$cross_compiling" != yes; then
> --	AC_CHECK_FILE([${sysconfdir}/X11/fontpath.d],
> --		[DEFAULT_FONT_PATH='catalogue:${sysconfdir}/X11/fontpath.d'],
> --		[case $host_os in
> -+		case $host_os in
> - 			darwin*) DEFAULT_FONT_PATH="${DEFAULT_FONT_PATH},/Library/Fonts,/System/Library/Fonts" ;;
> --		esac])
> --fi
> -+		esac
> - AC_ARG_WITH(default-font-path, AS_HELP_STRING([--with-default-font-path=PATH], [Comma separated list of font dirs]),
> - 				[ FONTPATH="$withval" ],
> - 				[ FONTPATH="${DEFAULT_FONT_PATH}" ])
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/fix_open_max_preprocessor_error.patch
> deleted file mode 100644
> index 2f62972..0000000
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/fix_open_max_preprocessor_error.patch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Upstream-Status: Pending
> -
> -Index: git/os/osdep.h
> -===================================================================
> ---- git.orig/os/osdep.h	2008-10-07 18:38:21.000000000 +0100
> -+++ git/os/osdep.h	2008-10-07 18:39:36.000000000 +0100
> -@@ -92,7 +92,7 @@
> -  * like sysconf(_SC_OPEN_MAX) is not supported.
> -  */
> - 
> --#if OPEN_MAX <= 256
> -+#if 0
> - #define MAXSOCKS (OPEN_MAX - 1)
> - #else
> - #define MAXSOCKS 256
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/macro_tweak.patch
> deleted file mode 100644
> index ec0eea6..0000000
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/macro_tweak.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -This is the revised version of files/macro_tweak.patch for
> -xorg-server 1.8.99.904 and newer.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Yu Ke <ke.yu@intel.com>
> -
> -diff --git a/xorg-server.m4 b/xorg-server.m4
> -index bdecf62..040fdb8 100644
> ---- a/xorg-server.m4
> -+++ b/xorg-server.m4
> -@@ -28,10 +28,12 @@ dnl
> - # Checks for the $1 define in xorg-server.h (from the sdk).  If it
> - # is defined, then add $1 to $REQUIRED_MODULES.
> - 
> -+m4_pattern_allow(PKG_CONFIG_SYSROOT_DIR)
> -+
> - AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
> - 	AC_REQUIRE([PKG_PROG_PKG_CONFIG])
> - 	SAVE_CFLAGS="$CFLAGS"
> --	CFLAGS="$CFLAGS -I`$PKG_CONFIG --variable=sdkdir xorg-server`"
> -+	CFLAGS="$CFLAGS -I$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=sdkdir xorg-server`"
> - 	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
> - #include "xorg-server.h"
> - #if !defined $1
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mips64-compiler.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mips64-compiler.patch
> deleted file mode 100644
> index e6bc95b..0000000
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mips64-compiler.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -on mips64/n64 pointers are 64bit therefore the pointer conversions to int dont work well
> -so we end up with incompatible conversion errors
> -
> -This patch choses the right values for mips64
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> -Index: xorg-server-1.11.2/hw/xfree86/common/compiler.h
> -===================================================================
> ---- xorg-server-1.11.2.orig/hw/xfree86/common/compiler.h	2012-05-10 12:19:59.485599046 -0700
> -+++ xorg-server-1.11.2/hw/xfree86/common/compiler.h	2012-05-10 12:20:53.109602488 -0700
> -@@ -104,6 +104,7 @@
> - 
> - #  if !defined(__arm__)
> - #   if !defined(__sparc__) && !defined(__sparc) && !defined(__arm32__) && !defined(__nds32__) \
> -+      && !defined(__mips64) \
> -       && !(defined(__alpha__) && defined(linux)) \
> -       && !(defined(__ia64__) && defined(linux)) \
> - 
> -@@ -708,7 +709,7 @@
> - }
> - 
> - #   elif defined(__mips__) || (defined(__arm32__) && !defined(__linux__))
> --#    ifdef __arm32__
> -+#    if defined (__arm32__) || defined (__mips64)
> - #     define PORT_SIZE long
> - #    else
> - #     define PORT_SIZE short
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/pkgconfig-deps.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/pkgconfig-deps.patch
> deleted file mode 100644
> index fee8d76..0000000
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/pkgconfig-deps.patch
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -commit 41d903918a5721e53ed694880eab44170f9717cc
> -Author: Jeremy Huddleston <jeremyhu@apple.com>
> -Date:   Wed Sep 14 13:45:18 2011 -0500
> -
> -    xorg-server.pc.in: Remove libpciaccess and pixman-1 from Requires
> -    
> -    Every module building against xorg-server does not *Require* pixman nor
> -    libpciaccess.  If such modules need pixman or pciaccess, they should be
> -    depending on them directly rather than inheriting a dependency from
> -    xorg-server.  To do this, they should use PKG_CHECK_MODULES in configure.ac
> -    to check for pixman-1 or pciaccess and include the apporpriate _LIBS variable
> -    to the appropriate _LDFLAGS variable in Makefile.am
> -    
> -    This also moves pixman-1 to Requires.private, so CPPFLAGS is set right to
> -    to satisfy include dependencies but avoid linking needlessly.
> -    
> -    Signed-off-by: Jeremy Huddleston <jeremyhu@apple.com>
> -    Reviewed-by: Gaetan Nadon <memsize@videotron.ca>
> -
> -diff --git a/configure.ac b/configure.ac
> -index 50beb01..4bfa82c 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -780,11 +780,6 @@ VIDMODEPROTO="xf86vidmodeproto >= 2.2.99.1"
> - WINDOWSWMPROTO="windowswmproto"
> - APPLEWMPROTO="applewmproto >= 1.4"
> - 
> --dnl Core modules for most extensions, et al.
> --SDK_REQUIRED_MODULES="[xproto >= 7.0.22] [randrproto >= 1.2.99.3] [renderproto >= 0.11] [xextproto >= 7.1.99] [inputproto >= 1.9.99.902] [kbproto >= 1.0.3] fontsproto"
> --# Make SDK_REQUIRED_MODULES available for inclusion in xorg-server.pc
> --AC_SUBST(SDK_REQUIRED_MODULES)
> --
> - dnl List of libraries that require a specific version
> - LIBAPPLEWM="applewm >= 1.4"
> - LIBDMX="dmx >= 1.0.99.1"
> -@@ -806,6 +801,11 @@ dnl specific modules against it
> - PKG_CHECK_MODULES(PIXMAN, $LIBPIXMAN)
> - REQUIRED_LIBS="$REQUIRED_LIBS $LIBPIXMAN $LIBXFONT xau"
> - 
> -+dnl Core modules for most extensions, et al.
> -+SDK_REQUIRED_MODULES="[xproto >= 7.0.22] [randrproto >= 1.2.99.3] [renderproto >= 0.11] [xextproto >= 7.1.99] [inputproto >= 1.99.99.902] [kbproto >= 1.0.3] fontsproto $LIBPIXMAN"
> -+# Make SDK_REQUIRED_MODULES available for inclusion in xorg-server.pc
> -+AC_SUBST(SDK_REQUIRED_MODULES)
> -+
> - REQUIRED_MODULES="[fixesproto >= 5.0] [damageproto >= 1.1] [xcmiscproto >= 1.2.0] [xtrans >= 1.2.2] [bigreqsproto >= 1.1.0] $SDK_REQUIRED_MODULES"
> - 
> - if test "x$CONFIG_UDEV" = xyes &&
> -@@ -1583,6 +1583,7 @@ if test "x$XORG" = xyes; then
> - 	if test "x$PCI" = xyes; then
> - 
> - 	PKG_CHECK_MODULES([PCIACCESS], $LIBPCIACCESS)
> -+	SDK_REQUIRED_MODULES="$SDK_REQUIRED_MODULES $LIBPCIACCESS"
> -	SAVE_LIBS=$LIBS
> -	SAVE_CFLAGS=$CFLAGS
> -	CFLAGS=$PCIACCESS_CFLAGS
> -diff --git a/xorg-server.pc.in b/xorg-server.pc.in
> -index fb238b5..a98eca8 100644
> ---- a/xorg-server.pc.in
> -+++ b/xorg-server.pc.in
> -@@ -15,7 +15,6 @@ abi_extension=@abi_extension@
> - Name: xorg-server
> - Description: Modular X.Org X Server
> - Version: @PACKAGE_VERSION@
> --Requires: pixman-1 pciaccess
> - Requires.private: @SDK_REQUIRED_MODULES@
> - Cflags: -I${sdkdir} @symbol_visibility@
> - Libs: -L${libdir}
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/crosscompile.patch
> new file mode 100644
> index 0000000..2f98bb8
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/crosscompile.patch
> @@ -0,0 +1,22 @@
> +Upstream-Status: Inappropriate [configuration]
> +
> +diff --git a/configure.ac b/configure.ac
> +index b3b752c..600500b 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -523,13 +523,9 @@ dnl Uses --default-font-path if set, otherwise checks for /etc/X11/fontpath.d,
> + dnl otherwise uses standard subdirectories of FONTROOTDIR. When cross
> + dnl compiling, assume default font path uses standard FONTROOTDIR directories.
> + DEFAULT_FONT_PATH="${FONTMISCDIR}/,${FONTTTFDIR}/,${FONTOTFDIR}/,${FONTTYPE1DIR}/,${FONT100DPIDIR}/,${FONT75DPIDIR}/"
> +-if test "$cross_compiling" != yes; then
> +-	AC_CHECK_FILE([${sysconfdir}/X11/fontpath.d],
> +-		[DEFAULT_FONT_PATH='catalogue:${sysconfdir}/X11/fontpath.d'],
> +-		[case $host_os in
> ++		case $host_os in
> + 			darwin*) DEFAULT_FONT_PATH="${DEFAULT_FONT_PATH},/Library/Fonts,/System/Library/Fonts" ;;
> +-		esac])
> +-fi
> ++		esac
> + AC_ARG_WITH(default-font-path, AS_HELP_STRING([--with-default-font-path=PATH], [Comma separated list of font dirs]),
> + 				[ FONTPATH="$withval" ],
> + 				[ FONTPATH="${DEFAULT_FONT_PATH}" ])
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/fix_open_max_preprocessor_error.patch
> new file mode 100644
> index 0000000..2f62972
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/fix_open_max_preprocessor_error.patch
> @@ -0,0 +1,15 @@
> +Upstream-Status: Pending
> +
> +Index: git/os/osdep.h
> +===================================================================
> +--- git.orig/os/osdep.h	2008-10-07 18:38:21.000000000 +0100
> ++++ git/os/osdep.h	2008-10-07 18:39:36.000000000 +0100
> +@@ -92,7 +92,7 @@
> +  * like sysconf(_SC_OPEN_MAX) is not supported.
> +  */
> + 
> +-#if OPEN_MAX <= 256
> ++#if 0
> + #define MAXSOCKS (OPEN_MAX - 1)
> + #else
> + #define MAXSOCKS 256
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/macro_tweak.patch
> new file mode 100644
> index 0000000..ec0eea6
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/macro_tweak.patch
> @@ -0,0 +1,25 @@
> +This is the revised version of files/macro_tweak.patch for
> +xorg-server 1.8.99.904 and newer.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Yu Ke <ke.yu@intel.com>
> +
> +diff --git a/xorg-server.m4 b/xorg-server.m4
> +index bdecf62..040fdb8 100644
> +--- a/xorg-server.m4
> ++++ b/xorg-server.m4
> +@@ -28,10 +28,12 @@ dnl
> + # Checks for the $1 define in xorg-server.h (from the sdk).  If it
> + # is defined, then add $1 to $REQUIRED_MODULES.
> + 
> ++m4_pattern_allow(PKG_CONFIG_SYSROOT_DIR)
> ++
> + AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
> + 	AC_REQUIRE([PKG_PROG_PKG_CONFIG])
> + 	SAVE_CFLAGS="$CFLAGS"
> +-	CFLAGS="$CFLAGS -I`$PKG_CONFIG --variable=sdkdir xorg-server`"
> ++	CFLAGS="$CFLAGS -I$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=sdkdir xorg-server`"
> + 	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
> + #include "xorg-server.h"
> + #if !defined $1
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/mips64-compiler.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/mips64-compiler.patch
> new file mode 100644
> index 0000000..168368e
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/mips64-compiler.patch
> @@ -0,0 +1,29 @@
> +on mips64/n64 pointers are 64bit therefore the pointer conversions to int dont work well
> +so we end up with incompatible conversion errors
> +
> +This patch choses the right values for mips64
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +Index: xorg-server-1.13.0/hw/xfree86/common/compiler.h
> +===================================================================
> +--- xorg-server-1.13.0-orig/hw/xfree86/common/compiler.h	2012-06-14 23:04:29.000000000 +0300
> ++++ xorg-server-1.13.0/hw/xfree86/common/compiler.h	2012-11-08 10:06:50.865831783 +0200
> +@@ -101,6 +101,7 @@
> + #if defined(NO_INLINE) || defined(DO_PROTOTYPES)
> + #if !defined(__arm__)
> + #if !defined(__sparc__) && !defined(__sparc) && !defined(__arm32__) && !defined(__nds32__) \
> ++      && !defined(__mips64) \
> +       && !(defined(__alpha__) && defined(linux)) \
> +       && !(defined(__ia64__) && defined(linux)) \
> + 
> +@@ -721,7 +722,7 @@
> + }
> + 
> + #elif defined(__mips__) || (defined(__arm32__) && !defined(__linux__))
> +-#ifdef __arm32__
> ++#if defined (__arm32__) || defined (__mips64)
> + #define PORT_SIZE long
> + #else
> + #define PORT_SIZE short
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> index 33564eb..4135a8b 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -2,7 +2,7 @@ DESCRIPTION = "The X.Org X server"
>  HOMEPAGE = "http://www.x.org"
>  SECTION = "x11/base"
>  LICENSE = "MIT-X"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=bc098b9774ed096943f6c37b5beeef13"
>  
>  # xf86-*-* packages depend on an X server built with the xfree86 DDX
>  # so we have a virtual to represent that:
> @@ -13,7 +13,7 @@ PROVIDES = "virtual/xserver-xf86"
>  PROVIDES += "virtual/xserver"
>  
>  PE = "2"
> -INC_PR = "r3"
> +INC_PR = "r5"
>  
>  XORG_PN = "xorg-server"
>  SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
> @@ -48,12 +48,7 @@ PACKAGES =+ "${PN}-security-policy \
>               ${PN}-utils \
>               ${PN}-xephyr \
>               ${PN}-multimedia-modules \
> -             ${PN}-extension-dri \
> -             ${PN}-extension-dri2 \
>               ${PN}-extension-glx \
> -             ${PN}-extension-record \
> -             ${PN}-extension-extmod \
> -             ${PN}-extension-dbe \
>               ${PN}-module-libint10 \
>               ${PN}-module-libafb \
>               ${PN}-module-libwfb  \
> @@ -67,6 +62,24 @@ PACKAGES =+ "${PN}-security-policy \
>  RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
>  RDEPENDS_${PN}-xvfb += "xkeyboard-config"
>  RDEPENDS_${PN}-module-exa = "${PN} (= ${EXTENDPKGV})"
> +RREPLACES_${PN} =  "${PN}-extension-dri \
> +                    ${PN}-extension-dri2 \
> +                    ${PN}-extension-record \
> +                    ${PN}-extension-extmod \
> +                    ${PN}-extension-dbe \
> +                   "
> +RPROVIDES_${PN} =  "${PN}-extension-dri \
> +                    ${PN}-extension-dri2 \
> +                    ${PN}-extension-record \
> +                    ${PN}-extension-extmod \
> +                    ${PN}-extension-dbe \
> +                   "
> +RCONFLICTS_${PN} = "${PN}-extension-dri \
> +                    ${PN}-extension-dri2 \
> +                    ${PN}-extension-record \
> +                    ${PN}-extension-extmod \
> +                    ${PN}-extension-dbe \
> +                   "
>  
>  FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
>  FILES_${PN}-dev += "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules/*/*.la"
> @@ -82,12 +95,7 @@ FILES_${PN}-xvfb = "${bindir}/Xvfb"
>  FILES_${PN}-utils = "${bindir}/scanpci ${bindir}/pcitweak ${bindir}/ioport ${bindir}/in[bwl] ${bindir}/out[bwl] ${bindir}/mmap[rw] ${bindir}/gtf ${bindir}/getconfig ${bindir}/getconfig.pl"
>  FILES_${PN}-xephyr = "${bindir}/Xephyr"
>  FILES_${PN}-multimedia-modules = "${libdir}/xorg/modules/multimedia/*drv*"
> -FILES_${PN}-extension-dri = "${libdir}/xorg/modules/extensions/libdri.so"
> -FILES_${PN}-extension-dri2 = "${libdir}/xorg/modules/extensions/libdri2.so"
>  FILES_${PN}-extension-glx = "${libdir}/xorg/modules/extensions/libglx.so"
> -FILES_${PN}-extension-record = "${libdir}/xorg/modules/extensions/librecord.so"
> -FILES_${PN}-extension-extmod = "${libdir}/xorg/modules/extensions/libextmod.so"
> -FILES_${PN}-extension-dbe = "${libdir}/xorg/modules/extensions/libdbe.so"
>  FILES_${PN}-module-libint10 = "${libdir}/xorg/modules/libint10.so"
>  FILES_${PN}-module-libafb = "${libdir}/xorg/modules/libafb.so"
>  FILES_${PN}-module-libwfb = "${libdir}/xorg/modules/libwfb.so"
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb
> deleted file mode 100644
> index 4739ee2..0000000
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -require xserver-xorg.inc
> -
> -# Misc build failure for master HEAD
> -SRC_URI += "file://crosscompile.patch \
> -            file://fix_open_max_preprocessor_error.patch \
> -            file://mips64-compiler.patch \
> -            file://pkgconfig-deps.patch \
> -           "
> -
> -SRC_URI[md5sum] = "256325e9b17dff479d92bed97f6b0adb"
> -SRC_URI[sha256sum] = "3e2935bc400612df58d5b5e6840829e2c63af02c2e7d2893092500358a4366fc"
> -
> -PR = "${INC_PR}.0"
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
> new file mode 100644
> index 0000000..8ad87b8
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
> @@ -0,0 +1,12 @@
> +require xserver-xorg.inc
> +
> +# Misc build failure for master HEAD
> +SRC_URI += "file://crosscompile.patch \
> +            file://fix_open_max_preprocessor_error.patch \
> +            file://mips64-compiler.patch \
> +           "
> +
> +SRC_URI[md5sum] = "bde3d178b756597d2ec2a19ef60d2e1f"
> +SRC_URI[sha256sum] = "548b91cb01087ad4f892428e7ac4955251cf12393e86c70420436b33848ef28a"
> +
> +PR = "${INC_PR}.0"
> 


