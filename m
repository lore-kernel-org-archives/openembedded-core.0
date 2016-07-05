Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7564C60116
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2016 13:09:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u65D9Uno002044
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Jul 2016 06:09:30 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 5 Jul 2016 06:09:30 -0700
To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1466595928.git.jussi.kukkonen@intel.com>
	<d54f69d5faec48cd7dda7efbbc1b7fdd0bb0bd65.1466595928.git.jussi.kukkonen@intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <577BB188.6050703@windriver.com>
Date: Tue, 5 Jul 2016 21:09:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <d54f69d5faec48cd7dda7efbbc1b7fdd0bb0bd65.1466595928.git.jussi.kukkonen@intel.com>
Subject: Re: [PATCH 01/10] gtk+3: Upgrade 3.18.8 -> 3.20.6
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
X-List-Received-Date: Tue, 05 Jul 2016 13:09:33 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi,

I can't build it on Ubuntu 14.04:

MACHINE = "qemux86"

$ bitbake gtk+3

Making all in po-properties
make[2]: Entering directory 
'/buildarea/lyang1/test_qemux86/bitbake_build/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/po-properties'
make[2]: Nothing to be done for 'all'.
make[2]: Leaving directory 
'/buildarea/lyang1/test_qemux86/bitbake_build/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/po-properties'
Making all in gdk
make[2]: Entering directory 
'/buildarea/lyang1/test_qemux86/bitbake_build/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/gdk'
( cd ../../gtk+-3.20.6/gdk && glib-mkenums --template gdkenumtypes.h.template \
     gdk.h gdk-autocleanup.h gdkapplaunchcontext.h gdkcairo.h gdkcursor.h 
gdkdevice.h gdkdevicemanager.h gdkdisplay.h gdkdisplaymanager.h gdkdnd.h 
gdkevents.h gdkframetimings.h gdkglcontext.h gdkkeys.h gdkkeysyms.h 
gdkkeysyms-compat.h gdkmain.h gdkpango.h gdkframeclock.h gdkpixbuf.h 
gdkprivate.h gdkproperty.h gdkrectangle.h gdkrgba.h gdkscreen.h gdkseat.h 
gdkselection.h gdktestutils.h gdkthreads.h gdktypes.h gdkvisual.h gdkwindow.h 
deprecated/gdkcolor.h ) >> xgen-geth \
&& (cmp -s xgen-geth gdkenumtypes.h || cp xgen-geth gdkenumtypes.h ) \
&& rm -f xgen-geth \
&& echo timestamp > stamp-gdkenumtypes.h
cd .. && /bin/sh ./config.status gdk/gdkconfig.h \
&& echo timestamp > gdk/stamp-gc-h
config.status: executing gdk/gdkconfig.h commands
config.status: gdk/gdkconfig.h is unchanged
if test -f gdkconfig.h; then :; \
else rm -f stamp-gc-h; make stamp-gc-h; fi
make  all-recursive
make[3]: Entering directory 
'/buildarea/lyang1/test_qemux86/bitbake_build/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/gdk'
Making all in x11
make[4]: Entering directory 
'/buildarea/lyang1/test_qemux86/bitbake_build/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/gdk/x11'
cd ../../../gtk+-3.20.6/gdk/x11 \
&& (cmp -s gdkx-with-gl-context.h gdkx.h || cp gdkx-with-gl-context.h gdkx.h )
cp: cannot stat 'gdkx-with-gl-context.h': No such file or directory
Makefile:1014: recipe for target 'gdkx.h' failed
make[4]: *** [gdkx.h] Error 1
make[4]: Leaving directory 
'/buildarea/lyang1/test_qemux86/bitbake_build/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/gdk/x11'
Makefile:1460: recipe for target 'all-recursive' failed
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory 
'/buildarea/lyang1/test_qemux86/bitbake_build/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/gdk'
Makefile:951: recipe for target 'all' failed
make[2]: *** [all] Error 2
make[2]: Leaving directory 
'/buildarea/lyang1/test_qemux86/bitbake_build/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/gdk'
Makefile:713: recipe for target 'all-recursive' failed
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory 
'/buildarea/lyang1/test_qemux86/bitbake_build/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build'
Makefile:607: recipe for target 'all' failed
make: *** [all] Error 2

// Robert

On 06/22/2016 07:52 PM, Jussi Kukkonen wrote:
> * Remove a patch that's no longer needed (as we don't
>    have a problem with client side decorations anymore)
> * Wayland build now depends on wayland-protocols:
>    Use same WAYLAND_PROTOCOLS_SYSROOT_DIR trick as weston so
>    protocols are found and multilib build does not break
> * Add new binary gtk-query-settings to -dev package
> * Rebase patches
> * Modify 0003-Add-disable-opengl-configure-option.patch so
>    that gdkx.h really is generated whenever it changes
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>   meta/recipes-gnome/gtk+/gtk+3.inc                  |   9 +-
>   ..._libtool.patch => 0001-Hardcoded-libtool.patch} |  26 +-
>   ...o-not-try-to-initialize-GL-without-libGL.patch} |  12 +-
>   ...0003-Add-disable-opengl-configure-option.patch} | 327 ++++++---------------
>   ...4-configure.ac-Fix-wayland-protocols-path.patch |  36 +++
>   meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch | 118 --------
>   .../gtk+/{gtk+3_3.18.8.bb => gtk+3_3.20.6.bb}      |  13 +-
>   ...e_3.18.8.bb => gtk-icon-utils-native_3.20.6.bb} |   4 +-
>   8 files changed, 173 insertions(+), 372 deletions(-)
>   rename meta/recipes-gnome/gtk+/gtk+3/{hardcoded_libtool.patch => 0001-Hardcoded-libtool.patch} (70%)
>   rename meta/recipes-gnome/gtk+/gtk+3/{Do-not-try-to-initialize-GL-without-libGL.patch => 0002-Do-not-try-to-initialize-GL-without-libGL.patch} (86%)
>   rename meta/recipes-gnome/gtk+/gtk+3/{0001-Add-disable-opengl-configure-option.patch => 0003-Add-disable-opengl-configure-option.patch} (71%)
>   create mode 100644 meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch
>   delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch
>   rename meta/recipes-gnome/gtk+/{gtk+3_3.18.8.bb => gtk+3_3.20.6.bb} (57%)
>   rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.18.8.bb => gtk-icon-utils-native_3.20.6.bb} (93%)
>
> diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
> index 959fb44..0de114d 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
> @@ -31,7 +31,9 @@ EXTRA_OECONF += " \
>                    --enable-modules \
>                    --disable-cups \
>                    --disable-colord \
> -"
> +                 WAYLAND_PROTOCOLS_SYSROOT_DIR=${STAGING_DIR}/${MACHINE} \
> +                 "
> +EXTRA_OECONF[vardepsexclude] = "MACHINE"
>
>   do_compile_prepend() {
>           export GIR_EXTRA_LIBS_PATH="${B}/gdk/.libs"
> @@ -46,7 +48,7 @@ PACKAGECONFIG[x11] = "--enable-x11-backend,--disable-x11-backend,at-spi2-atk fon
>   # this is provided by oe-core patch that removes epoxy/gl dependency from a X11 build
>   PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,libepoxy"
>   PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,,libgl"
> -PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland libxkbcommon virtual/mesa wayland-native"
> +PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland wayland-protocols libxkbcommon virtual/mesa wayland-native"
>
>   do_install_append() {
>   	mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-3.0
> @@ -76,6 +78,7 @@ FILES_${PN}_append = " ${bindir}/gtk-update-icon-cache-3.0 \
>   FILES_${PN}-dev += " \
>                       ${datadir}/gtk-3.0/gtkbuilder.rng \
>                       ${datadir}/gtk-3.0/include \
> +                    ${datadir}/gettext/its \
>                       ${libdir}/gtk-3.0/include \
>                       ${libdir}/gtk-3.0/${LIBV}/loaders/*.la \
>                       ${libdir}/gtk-3.0/${LIBV}/immodules/*.la \
> @@ -85,6 +88,7 @@ FILES_${PN}-dev += " \
>                       ${bindir}/gtk-builder-convert \
>                       ${bindir}/gtk-encode-symbolic-svg \
>                       ${bindir}/gtk-builder-tool \
> +                    ${bindir}/gtk-query-settings \
>                       "
>
>   GTKBASE_RRECOMMENDS ?= "liberation-fonts \
> @@ -99,6 +103,7 @@ GTKGLIBC_RRECOMMENDS ?= "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
>
>   RRECOMMENDS_${PN} = "${GTKBASE_RRECOMMENDS}"
>   RRECOMMENDS_${PN}_libc-glibc = "${GTKGLIBC_RRECOMMENDS}"
> +RRECOMMENDS_${PN}-dev += "wayland-protocols"
>
>   PACKAGES_DYNAMIC += "^gtk3-immodule-.* ^gtk3-printbackend-.*"
>
> diff --git a/meta/recipes-gnome/gtk+/gtk+3/hardcoded_libtool.patch b/meta/recipes-gnome/gtk+/gtk+3/0001-Hardcoded-libtool.patch
> similarity index 70%
> rename from meta/recipes-gnome/gtk+/gtk+3/hardcoded_libtool.patch
> rename to meta/recipes-gnome/gtk+/gtk+3/0001-Hardcoded-libtool.patch
> index 3b4beeb..0bda1f1 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3/hardcoded_libtool.patch
> +++ b/meta/recipes-gnome/gtk+/gtk+3/0001-Hardcoded-libtool.patch
> @@ -1,12 +1,21 @@
> +From 5a73a5b92566e314bbc8a1bd40f1ec204837c111 Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Tue, 21 Jun 2016 14:53:56 +0300
> +Subject: [PATCH 1/4] Hardcoded libtool
> +
>   Upstream-Status: Inappropriate [embedded specific]
>
>   Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + configure.ac | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
>
> -Index: gtk+-3.8.2/configure.ac
> -===================================================================
> ---- gtk+-3.8.2.orig/configure.ac
> -+++ gtk+-3.8.2/configure.ac
> -@@ -531,7 +531,7 @@ AC_MSG_CHECKING([Whether to write depend
> +diff --git a/configure.ac b/configure.ac
> +index 23d3077..b6931d6 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -610,7 +610,7 @@ AC_MSG_CHECKING([whether to write dependencies into .pc files])
>    case $enable_explicit_deps in
>      auto)
>        export SED
> @@ -15,7 +24,7 @@ Index: gtk+-3.8.2/configure.ac
>        if test "x$deplibs_check_method" != xpass_all || test "x$enable_static" = xyes ; then
>          enable_explicit_deps=yes
>        else
> -@@ -793,7 +793,7 @@ else
> +@@ -876,7 +876,7 @@ else
>        dnl Now we check to see if our libtool supports shared lib deps
>        dnl (in a rather ugly way even)
>        if $dynworks; then
> @@ -24,7 +33,7 @@ Index: gtk+-3.8.2/configure.ac
>            module_deplibs_check=`$module_libtool_config | \
>                grep '^[[a-z_]]*check[[a-z_]]*_method=[['\''"]]' | \
>                sed 's/.*[['\''"]]\(.*\)[['\''"]]$/\1/'`
> -@@ -1528,7 +1528,7 @@ fi
> +@@ -1630,7 +1630,7 @@ AC_SUBST(GTK_PRINT_BACKENDS)
>    # We are using gmodule-no-export now, but I'm leaving the stripping
>    # code in place for now, since pango and atk still require gmodule.
>    export SED
> @@ -33,3 +42,6 @@ Index: gtk+-3.8.2/configure.ac
>    if test -n "$export_dynamic"; then
>      GDK_DEP_LIBS=`echo $GDK_DEP_LIBS | sed -e "s/$export_dynamic//"`
>      GTK_DEP_LIBS=`echo $GTK_DEP_LIBS | sed -e "s/$export_dynamic//"`
> +--
> +2.1.4
> +
> diff --git a/meta/recipes-gnome/gtk+/gtk+3/Do-not-try-to-initialize-GL-without-libGL.patch b/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-without-libGL.patch
> similarity index 86%
> rename from meta/recipes-gnome/gtk+/gtk+3/Do-not-try-to-initialize-GL-without-libGL.patch
> rename to meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-without-libGL.patch
> index c8c480c..989716e 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3/Do-not-try-to-initialize-GL-without-libGL.patch
> +++ b/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-without-libGL.patch
> @@ -1,7 +1,7 @@
> -From fc22058a10db913534f11348f86681fe9e1838e5 Mon Sep 17 00:00:00 2001
> +From d63b926f8c8d8b5c9f9ec33d078b775f0409d88a Mon Sep 17 00:00:00 2001
>   From: Jussi Kukkonen <jussi.kukkonen@intel.com>
>   Date: Fri, 16 Oct 2015 16:35:16 +0300
> -Subject: [PATCH] Do not try to initialize GL without libGL
> +Subject: [PATCH 2/4] Do not try to initialize GL without libGL
>
>   _gdk_x11_screen_update_visuals_for_gl() will end up calling epoxys
>   GLX api which will exit() if libGL.so.1 is not present. We do not
> @@ -21,10 +21,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>    2 files changed, 12 insertions(+)
>
>   diff --git a/configure.ac b/configure.ac
> -index 729a62e..58cc1ac 100644
> +index b6931d6..e27da49 100644
>   --- a/configure.ac
>   +++ b/configure.ac
> -@@ -328,6 +328,13 @@ AC_ARG_ENABLE(mir-backend,
> +@@ -342,6 +342,13 @@ AC_ARG_ENABLE(mir-backend,
>                                  [enable the Mir gdk backend])],
>    			      [backend_set=yes])
>
> @@ -39,10 +39,10 @@ index 729a62e..58cc1ac 100644
>      if test "$platform_win32" = yes; then
>        enable_win32_backend=yes
>   diff --git a/gdk/x11/gdkvisual-x11.c b/gdk/x11/gdkvisual-x11.c
> -index f3b062d..c8243f4 100644
> +index 81479d8..3c8c5c0 100644
>   --- a/gdk/x11/gdkvisual-x11.c
>   +++ b/gdk/x11/gdkvisual-x11.c
> -@@ -345,7 +345,12 @@ _gdk_x11_screen_init_visuals (GdkScreen *screen)
> +@@ -306,7 +306,12 @@ _gdk_x11_screen_init_visuals (GdkScreen *screen)
>      /* If GL is available we want to pick better default/rgba visuals,
>         as we care about glx details such as alpha/depth/stencil depth,
>         stereo and double buffering */
> diff --git a/meta/recipes-gnome/gtk+/gtk+3/0001-Add-disable-opengl-configure-option.patch b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
> similarity index 71%
> rename from meta/recipes-gnome/gtk+/gtk+3/0001-Add-disable-opengl-configure-option.patch
> rename to meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
> index a963334..8552f53 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3/0001-Add-disable-opengl-configure-option.patch
> +++ b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
> @@ -1,7 +1,7 @@
> -From c77afa19881d955d759879aeae8bbd88613dd4fe Mon Sep 17 00:00:00 2001
> +From a8fa547fdc1416b330aced805f5343ad912932ae Mon Sep 17 00:00:00 2001
>   From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -Date: Thu, 16 Jun 2016 15:11:34 +0300
> -Subject: [PATCH] Add --disable-opengl configure option
> +Date: Tue, 21 Jun 2016 15:11:39 +0300
> +Subject: [PATCH 3/4] Add --disable-opengl configure option
>
>   --disable-opengl will remove the dependency on libepoxy and on the
>   OpenGL APIs. This is useful for those who want to keep using gtk+3
> @@ -20,37 +20,35 @@ Long-term it would be good to find an alternative solution to this
>   Upstream-Status: Inappropriate [Evil eye expected from upstream]
>   Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>   ---
> - configure.ac                      | 13 +++++++--
> - demos/gtk-demo/glarea.c           | 13 +++++++++
> - docs/tools/Makefile.am            |  9 ++++--
> - docs/tools/widgets.c              |  4 ++-
> - gdk/gdkdisplay.c                  |  4 ++-
> - gdk/gdkgl.c                       | 10 +++++++
> - gdk/gdkglcontext.c                |  6 ++++
> - gdk/gdkwindow.c                   | 14 +++++++++-
> - gdk/x11/Makefile.am               | 28 ++++++++++++++++---
> - gdk/x11/gdkdisplay-x11.c          |  6 ++--
> - gdk/x11/gdkscreen-x11.c           |  5 ++++
> - gdk/x11/gdkwindow-x11.c           |  4 +++
> - gdk/x11/gdkx-autocleanups.h       |  2 ++
> - gdk/x11/gdkx-with-gl-context.h    | 59 +++++++++++++++++++++++++++++++++++++++
> - gdk/x11/gdkx-without-gl-context.h | 58 ++++++++++++++++++++++++++++++++++++++
> - gdk/x11/gdkx.h                    | 59 ---------------------------------------
> - gtk/Makefile.am                   |  3 +-
> - gtk/gtkglarea.c                   | 20 ++++++++++++-
> - gtk/inspector/general.c           |  6 ++++
> - tests/Makefile.am                 | 10 +++++--
> - testsuite/gtk/objects-finalize.c  |  2 ++
> - 21 files changed, 257 insertions(+), 78 deletions(-)
> - create mode 100644 gdk/x11/gdkx-with-gl-context.h
> + configure.ac                               | 13 +++++--
> + demos/gtk-demo/glarea.c                    | 13 +++++++
> + docs/tools/Makefile.am                     |  9 +++--
> + docs/tools/widgets.c                       |  4 ++-
> + gdk/gdkdisplay.c                           |  4 ++-
> + gdk/gdkgl.c                                | 10 ++++++
> + gdk/gdkglcontext.c                         |  6 ++++
> + gdk/gdkwindow.c                            | 13 +++++++
> + gdk/x11/Makefile.am                        | 30 +++++++++++++---
> + gdk/x11/gdkdisplay-x11.c                   |  6 +++-
> + gdk/x11/gdkscreen-x11.c                    |  5 +++
> + gdk/x11/gdkwindow-x11.c                    |  4 +++
> + gdk/x11/gdkx-autocleanups.h                |  2 ++
> + gdk/x11/{gdkx.h => gdkx-with-gl-context.h} |  0
> + gdk/x11/gdkx-without-gl-context.h          | 58 ++++++++++++++++++++++++++++++
> + gtk/Makefile.am                            |  3 +-
> + gtk/gtkglarea.c                            | 20 ++++++++++-
> + gtk/inspector/general.c                    |  6 ++++
> + tests/Makefile.am                          | 10 ++++--
> + testsuite/gtk/objects-finalize.c           |  2 ++
> + 20 files changed, 201 insertions(+), 17 deletions(-)
> + rename gdk/x11/{gdkx.h => gdkx-with-gl-context.h} (100%)
>    create mode 100644 gdk/x11/gdkx-without-gl-context.h
> - delete mode 100644 gdk/x11/gdkx.h
>
>   diff --git a/configure.ac b/configure.ac
> -index c280543..32da151 100644
> +index e27da49..a3e9beb 100644
>   --- a/configure.ac
>   +++ b/configure.ac
> -@@ -340,6 +340,15 @@ AC_ARG_ENABLE(mir-backend,
> +@@ -342,6 +342,15 @@ AC_ARG_ENABLE(mir-backend,
>                                  [enable the Mir gdk backend])],
>    			      [backend_set=yes])
>
> @@ -66,7 +64,7 @@ index c280543..32da151 100644
>    AC_ARG_ENABLE(glx,
>                  [AS_HELP_STRING([--enable-glx],
>                                  [When enabled Gdk will try to initialize GLX])])
> -@@ -1330,7 +1339,7 @@ CFLAGS="$saved_cflags"
> +@@ -1333,7 +1342,7 @@ CFLAGS="$saved_cflags"
>    LDFLAGS="$saved_ldflags"
>
>    GDK_PACKAGES="$PANGO_PACKAGES gdk-pixbuf-2.0 >= gdk_pixbuf_required_version cairo >= cairo_required_version cairo-gobject >= cairo_required_version"
> @@ -75,7 +73,7 @@ index c280543..32da151 100644
>
>    PKG_CHECK_MODULES(GDK_DEP, $GDK_PACKAGES $GDK_PRIVATE_PACKAGES)
>    GDK_DEP_LIBS="$GDK_EXTRA_LIBS $GDK_DEP_LIBS $MATH_LIB"
> -@@ -1364,7 +1373,7 @@ fi
> +@@ -1367,7 +1376,7 @@ fi
>    PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)
>
>    GTK_PACKAGES="atk >= atk_required_version cairo >= cairo_required_version cairo-gobject >= cairo_required_version gdk-pixbuf-2.0 >= gdk_pixbuf_required_version gio-2.0 >= glib_required_version"
> @@ -85,7 +83,7 @@ index c280543..32da151 100644
>      GTK_PRIVATE_PACKAGES="$GTK_PRIVATE_PACKAGES pangoft2"
>    fi
>   diff --git a/demos/gtk-demo/glarea.c b/demos/gtk-demo/glarea.c
> -index c267706..b3bac86 100644
> +index 3aba729..c6c79f7 100644
>   --- a/demos/gtk-demo/glarea.c
>   +++ b/demos/gtk-demo/glarea.c
>   @@ -5,7 +5,9 @@
> @@ -207,10 +205,10 @@ index 932daf1..54239d6 100644
>
>      return info;
>   diff --git a/gdk/gdkdisplay.c b/gdk/gdkdisplay.c
> -index 892d6a7..8323768 100644
> +index 6150ef7..2223629 100644
>   --- a/gdk/gdkdisplay.c
>   +++ b/gdk/gdkdisplay.c
> -@@ -2285,7 +2285,9 @@ gboolean
> +@@ -2360,7 +2360,9 @@ gboolean
>    gdk_display_make_gl_context_current (GdkDisplay   *display,
>                                         GdkGLContext *context)
>    {
> @@ -222,7 +220,7 @@ index 892d6a7..8323768 100644
>
>    GdkRenderingMode
>   diff --git a/gdk/gdkgl.c b/gdk/gdkgl.c
> -index 85ce63d..d76e8dc 100644
> +index e8ba770..ba7c84b 100644
>   --- a/gdk/gdkgl.c
>   +++ b/gdk/gdkgl.c
>   @@ -22,7 +22,9 @@
> @@ -243,7 +241,7 @@ index 85ce63d..d76e8dc 100644
>    static const char *
>    get_vertex_type_name (int type)
>    {
> -@@ -205,6 +208,7 @@ use_texture_rect_program (GdkGLContextPaintData *paint_data)
> +@@ -254,6 +257,7 @@ use_texture_rect_program (GdkGLContextPaintData *paint_data)
>          glUseProgram (paint_data->current_program->program);
>        }
>    }
> @@ -251,7 +249,7 @@ index 85ce63d..d76e8dc 100644
>
>    void
>    gdk_gl_texture_quads (GdkGLContext *paint_context,
> -@@ -212,6 +216,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
> +@@ -261,6 +265,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
>                          int n_quads,
>                          GdkTexturedQuad *quads)
>    {
> @@ -259,7 +257,7 @@ index 85ce63d..d76e8dc 100644
>      GdkGLContextPaintData *paint_data  = gdk_gl_context_get_paint_data (paint_context);
>      GdkGLContextProgram *program;
>      GdkWindow *window = gdk_gl_context_get_window (paint_context);
> -@@ -275,6 +280,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
> +@@ -324,6 +329,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
>
>      glDisableVertexAttribArray (program->position_location);
>      glDisableVertexAttribArray (program->uv_location);
> @@ -267,7 +265,7 @@ index 85ce63d..d76e8dc 100644
>    }
>
>    /* x,y,width,height describes a rectangle in the gl render buffer
> -@@ -323,6 +329,7 @@ gdk_cairo_draw_from_gl (cairo_t              *cr,
> +@@ -372,6 +378,7 @@ gdk_cairo_draw_from_gl (cairo_t              *cr,
>                            int                   width,
>                            int                   height)
>    {
> @@ -275,7 +273,7 @@ index 85ce63d..d76e8dc 100644
>      GdkGLContext *paint_context;
>      cairo_surface_t *image;
>      cairo_matrix_t matrix;
> -@@ -643,6 +650,7 @@ gdk_cairo_draw_from_gl (cairo_t              *cr,
> +@@ -692,6 +699,7 @@ gdk_cairo_draw_from_gl (cairo_t              *cr,
>      if (clip_region)
>        cairo_region_destroy (clip_region);
>
> @@ -283,7 +281,7 @@ index 85ce63d..d76e8dc 100644
>    }
>
>    /* This is always called with the paint context current */
> -@@ -650,6 +658,7 @@ void
> +@@ -699,6 +707,7 @@ void
>    gdk_gl_texture_from_surface (cairo_surface_t *surface,
>    			     cairo_region_t  *region)
>    {
> @@ -291,14 +289,14 @@ index 85ce63d..d76e8dc 100644
>      GdkGLContext *paint_context;
>      cairo_surface_t *image;
>      double device_x_offset, device_y_offset;
> -@@ -750,4 +759,5 @@ gdk_gl_texture_from_surface (cairo_surface_t *surface,
> +@@ -799,4 +808,5 @@ gdk_gl_texture_from_surface (cairo_surface_t *surface,
>
>      glDisable (GL_SCISSOR_TEST);
>      glDeleteTextures (1, &texture_id);
>   +#endif
>    }
>   diff --git a/gdk/gdkglcontext.c b/gdk/gdkglcontext.c
> -index 4d71353..9bb55ef 100644
> +index 00a33eb..bd8a793 100644
>   --- a/gdk/gdkglcontext.c
>   +++ b/gdk/gdkglcontext.c
>   @@ -85,7 +85,9 @@
> @@ -311,7 +309,7 @@ index 4d71353..9bb55ef 100644
>
>    typedef struct {
>      GdkDisplay *display;
> -@@ -238,6 +240,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *context,
> +@@ -239,6 +241,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *context,
>                                   int              height,
>                                   guint            texture_target)
>    {
> @@ -319,7 +317,7 @@ index 4d71353..9bb55ef 100644
>      g_return_if_fail (GDK_IS_GL_CONTEXT (context));
>
>      glPixelStorei (GL_UNPACK_ALIGNMENT, 4);
> -@@ -245,6 +248,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *context,
> +@@ -246,6 +249,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *context,
>      glTexImage2D (texture_target, 0, GL_RGBA, width, height, 0, GL_BGRA, GL_UNSIGNED_INT_8_8_8_8_REV,
>                    cairo_image_surface_get_data (image_surface));
>      glPixelStorei (GL_UNPACK_ROW_LENGTH, 0);
> @@ -327,7 +325,7 @@ index 4d71353..9bb55ef 100644
>    }
>
>    static void
> -@@ -586,6 +590,7 @@ gdk_gl_context_realize (GdkGLContext  *context,
> +@@ -635,6 +639,7 @@ gdk_gl_context_realize (GdkGLContext  *context,
>    static void
>    gdk_gl_context_check_extensions (GdkGLContext *context)
>    {
> @@ -335,8 +333,8 @@ index 4d71353..9bb55ef 100644
>      GdkGLContextPrivate *priv = gdk_gl_context_get_instance_private (context);
>      gboolean has_npot, has_texture_rectangle;
>
> -@@ -628,6 +633,7 @@ gdk_gl_context_check_extensions (GdkGLContext *context)
> -                      priv->use_texture_rectangle ? "yes" : "no"));
> +@@ -677,6 +682,7 @@ gdk_gl_context_check_extensions (GdkGLContext *context)
> +                        priv->use_texture_rectangle ? "yes" : "no"));
>
>      priv->extensions_checked = TRUE;
>   +#endif
> @@ -344,7 +342,7 @@ index 4d71353..9bb55ef 100644
>
>    /**
>   diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c
> -index c34c113..3025e96 100644
> +index 66ebb9d..74a0c3a 100644
>   --- a/gdk/gdkwindow.c
>   +++ b/gdk/gdkwindow.c
>   @@ -44,7 +44,9 @@
> @@ -357,15 +355,7 @@ index c34c113..3025e96 100644
>
>    /* for the use of round() */
>    #include "fallback-c89.c"
> -@@ -1455,7 +1457,6 @@ gdk_window_new (GdkWindow     *parent,
> -   g_signal_connect (device_manager, "device-removed",
> -                     G_CALLBACK (device_removed_cb), window);
> -
> --
> -   if ((_gdk_gl_flags & (GDK_GL_ALWAYS | GDK_GL_DISABLE)) == GDK_GL_ALWAYS)
> -     {
> -       GError *error = NULL;
> -@@ -2761,6 +2762,13 @@ gdk_window_get_paint_gl_context (GdkWindow  *window,
> +@@ -2759,6 +2761,13 @@ gdk_window_get_paint_gl_context (GdkWindow  *window,
>    {
>      GError *internal_error = NULL;
>
> @@ -379,7 +369,7 @@ index c34c113..3025e96 100644
>      if (_gdk_gl_flags & GDK_GL_DISABLE)
>        {
>          g_set_error_literal (error, GDK_GL_ERROR,
> -@@ -2957,6 +2965,7 @@ gdk_window_begin_paint_region (GdkWindow       *window,
> +@@ -2955,6 +2964,7 @@ gdk_window_begin_paint_region (GdkWindow       *window,
>            }
>          else
>            {
> @@ -387,7 +377,7 @@ index c34c113..3025e96 100644
>    	  gdk_gl_context_make_current (context);
>              /* With gl we always need a surface to combine the gl
>                 drawing with the native drawing. */
> -@@ -2971,6 +2980,7 @@ gdk_window_begin_paint_region (GdkWindow       *window,
> +@@ -2969,6 +2979,7 @@ gdk_window_begin_paint_region (GdkWindow       *window,
>              glBlendFunc (GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
>
>              glViewport (0, 0, ww, wh);
> @@ -395,7 +385,7 @@ index c34c113..3025e96 100644
>            }
>        }
>
> -@@ -3119,6 +3129,7 @@ gdk_window_end_paint (GdkWindow *window)
> +@@ -3117,6 +3128,7 @@ gdk_window_end_paint (GdkWindow *window)
>
>              gdk_gl_context_make_current (window->gl_paint_context);
>
> @@ -403,7 +393,7 @@ index c34c113..3025e96 100644
>              if (!cairo_region_is_empty (opaque_region))
>                gdk_gl_texture_from_surface (window->current_paint.surface,
>                                             opaque_region);
> -@@ -3129,6 +3140,7 @@ gdk_window_end_paint (GdkWindow *window)
> +@@ -3127,6 +3139,7 @@ gdk_window_end_paint (GdkWindow *window)
>                                               window->current_paint.need_blend_region);
>                  glDisable(GL_BLEND);
>                }
> @@ -412,7 +402,7 @@ index c34c113..3025e96 100644
>              cairo_region_destroy (opaque_region);
>
>   diff --git a/gdk/x11/Makefile.am b/gdk/x11/Makefile.am
> -index c488a31..d0aa7ce 100644
> +index c488a31..4ce3c07 100644
>   --- a/gdk/x11/Makefile.am
>   +++ b/gdk/x11/Makefile.am
>   @@ -39,8 +39,6 @@ libgdk_x11_la_SOURCES = 	\
> @@ -424,7 +414,7 @@ index c488a31..d0aa7ce 100644
>    	gdkkeys-x11.c		\
>    	gdkmain-x11.c		\
>    	gdkproperty-x11.c	\
> -@@ -53,14 +51,30 @@ libgdk_x11_la_SOURCES = 	\
> +@@ -53,14 +51,32 @@ libgdk_x11_la_SOURCES = 	\
>    	gdkwindow-x11.h		\
>    	gdkxftdefaults.c	\
>    	gdkxid.c		\
> @@ -450,13 +440,15 @@ index c488a31..d0aa7ce 100644
>   +
>   +BUILT_SOURCES = gdkx.h
>   +
> ++.PHONY: gdkx.h
>   +gdkx.h:
> -+	$(AM_V_GEN) cd $(srcdir) && cp $(GDKX_HEADER) gdkx.h
> ++	$(AM_V_GEN) cd $(srcdir) \
> ++	&& (cmp -s $(GDKX_HEADER) gdkx.h || cp $(GDKX_HEADER) gdkx.h )
>   +
>    libgdkx11include_HEADERS = 	\
>    	gdkx-autocleanups.h	\
>    	gdkx11applaunchcontext.h \
> -@@ -74,7 +88,6 @@ libgdkx11include_HEADERS = 	\
> +@@ -74,7 +90,6 @@ libgdkx11include_HEADERS = 	\
>    	gdkx11display.h		\
>    	gdkx11displaymanager.h	\
>    	gdkx11dnd.h		\
> @@ -464,7 +456,7 @@ index c488a31..d0aa7ce 100644
>    	gdkx11keys.h		\
>    	gdkx11property.h	\
>    	gdkx11screen.h		\
> -@@ -83,9 +96,16 @@ libgdkx11include_HEADERS = 	\
> +@@ -83,9 +98,16 @@ libgdkx11include_HEADERS = 	\
>    	gdkx11visual.h		\
>    	gdkx11window.h
>
> @@ -482,7 +474,7 @@ index c488a31..d0aa7ce 100644
>   +
>    -include $(top_srcdir)/git.mk
>   diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c
> -index 5816d18..5d2dae6 100644
> +index de91c64..42d50f6 100644
>   --- a/gdk/x11/gdkdisplay-x11.c
>   +++ b/gdk/x11/gdkdisplay-x11.c
>   @@ -37,7 +37,9 @@
> @@ -495,19 +487,19 @@ index 5816d18..5d2dae6 100644
>    #include "gdk-private.h"
>
>    #include <glib.h>
> -@@ -2989,8 +2991,8 @@ gdk_x11_display_class_init (GdkX11DisplayClass * class)
> -   display_class->convert_selection = _gdk_x11_display_convert_selection;
> +@@ -2959,7 +2961,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * class)
>      display_class->text_property_to_utf8_list = _gdk_x11_display_text_property_to_utf8_list;
>      display_class->utf8_to_string_target = _gdk_x11_display_utf8_to_string_target;
> --
> +
> +-  display_class->make_gl_context_current = gdk_x11_display_make_gl_context_current;
>   +#ifdef HAVE_OPENGL
> -   display_class->make_gl_context_current = gdk_x11_display_make_gl_context_current;
> --
> ++   display_class->make_gl_context_current = gdk_x11_display_make_gl_context_current;
>   +#endif
> -   _gdk_x11_windowing_init ();
> - }
> +
> +   display_class->get_default_seat = gdk_x11_display_get_default_seat;
> +
>   diff --git a/gdk/x11/gdkscreen-x11.c b/gdk/x11/gdkscreen-x11.c
> -index 2bd7f28..30032e0 100644
> +index 9d8ed20..bd46b00 100644
>   --- a/gdk/x11/gdkscreen-x11.c
>   +++ b/gdk/x11/gdkscreen-x11.c
>   @@ -1968,3 +1968,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen *screen)
> @@ -520,7 +512,7 @@ index 2bd7f28..30032e0 100644
>   +void _gdk_x11_screen_update_visuals_for_gl (GdkScreen *screen) {}
>   +#endif
>   diff --git a/gdk/x11/gdkwindow-x11.c b/gdk/x11/gdkwindow-x11.c
> -index d08cee0..d354628 100644
> +index 9ed087a..30d6eb7 100644
>   --- a/gdk/x11/gdkwindow-x11.c
>   +++ b/gdk/x11/gdkwindow-x11.c
>   @@ -36,7 +36,9 @@
> @@ -533,7 +525,7 @@ index d08cee0..d354628 100644
>    #include "gdkprivate-x11.h"
>    #include "gdk-private.h"
>
> -@@ -5768,7 +5770,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Class *klass)
> +@@ -5782,7 +5784,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Class *klass)
>      impl_class->set_opaque_region = gdk_x11_window_set_opaque_region;
>      impl_class->set_shadow_width = gdk_x11_window_set_shadow_width;
>      impl_class->show_window_menu = gdk_x11_window_show_window_menu;
> @@ -557,71 +549,10 @@ index edb0ea7..a317d61 100644
>    G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Keymap, g_object_unref)
>    G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Screen, g_object_unref)
>    G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Visual, g_object_unref)
> -diff --git a/gdk/x11/gdkx-with-gl-context.h b/gdk/x11/gdkx-with-gl-context.h
> -new file mode 100644
> -index 0000000..ae05fa6
> ---- /dev/null
> -+++ b/gdk/x11/gdkx-with-gl-context.h
> -@@ -0,0 +1,59 @@
> -+/* GDK - The GIMP Drawing Kit
> -+ * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
> -+ *
> -+ * This library is free software; you can redistribute it and/or
> -+ * modify it under the terms of the GNU Lesser General Public
> -+ * License as published by the Free Software Foundation; either
> -+ * version 2 of the License, or (at your option) any later version.
> -+ *
> -+ * This library is distributed in the hope that it will be useful,
> -+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+ * Lesser General Public License for more details.
> -+ *
> -+ * You should have received a copy of the GNU Lesser General Public
> -+ * License along with this library. If not, see <http://www.gnu.org/licenses/>.
> -+ */
> -+
> -+/*
> -+ * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
> -+ * file for a list of people on the GTK+ Team.  See the ChangeLog
> -+ * files for a list of changes.  These files are distributed with
> -+ * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
> -+ */
> -+
> -+#ifndef __GDK_X_H__
> -+#define __GDK_X_H__
> -+
> -+#include <gdk/gdk.h>
> -+
> -+#include <X11/Xlib.h>
> -+#include <X11/Xutil.h>
> -+
> -+#define __GDKX_H_INSIDE__
> -+
> -+#include <gdk/x11/gdkx11applaunchcontext.h>
> -+#include <gdk/x11/gdkx11cursor.h>
> -+#include <gdk/x11/gdkx11device.h>
> -+#include <gdk/x11/gdkx11device-core.h>
> -+#include <gdk/x11/gdkx11device-xi2.h>
> -+#include <gdk/x11/gdkx11devicemanager.h>
> -+#include <gdk/x11/gdkx11devicemanager-core.h>
> -+#include <gdk/x11/gdkx11devicemanager-xi2.h>
> -+#include <gdk/x11/gdkx11display.h>
> -+#include <gdk/x11/gdkx11displaymanager.h>
> -+#include <gdk/x11/gdkx11dnd.h>
> -+#include <gdk/x11/gdkx11glcontext.h>
> -+#include <gdk/x11/gdkx11keys.h>
> -+#include <gdk/x11/gdkx11property.h>
> -+#include <gdk/x11/gdkx11screen.h>
> -+#include <gdk/x11/gdkx11selection.h>
> -+#include <gdk/x11/gdkx11utils.h>
> -+#include <gdk/x11/gdkx11visual.h>
> -+#include <gdk/x11/gdkx11window.h>
> -+
> -+#include <gdk/x11/gdkx-autocleanups.h>
> -+
> -+#undef __GDKX_H_INSIDE__
> -+
> -+#endif /* __GDK_X_H__ */
> +diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx-with-gl-context.h
> +similarity index 100%
> +rename from gdk/x11/gdkx.h
> +rename to gdk/x11/gdkx-with-gl-context.h
>   diff --git a/gdk/x11/gdkx-without-gl-context.h b/gdk/x11/gdkx-without-gl-context.h
>   new file mode 100644
>   index 0000000..c9e2617
> @@ -686,76 +617,11 @@ index 0000000..c9e2617
>   +#undef __GDKX_H_INSIDE__
>   +
>   +#endif /* __GDK_X_H__ */
> -diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx.h
> -deleted file mode 100644
> -index ae05fa6..0000000
> ---- a/gdk/x11/gdkx.h
> -+++ /dev/null
> -@@ -1,59 +0,0 @@
> --/* GDK - The GIMP Drawing Kit
> -- * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
> -- *
> -- * This library is free software; you can redistribute it and/or
> -- * modify it under the terms of the GNU Lesser General Public
> -- * License as published by the Free Software Foundation; either
> -- * version 2 of the License, or (at your option) any later version.
> -- *
> -- * This library is distributed in the hope that it will be useful,
> -- * but WITHOUT ANY WARRANTY; without even the implied warranty of
> -- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -- * Lesser General Public License for more details.
> -- *
> -- * You should have received a copy of the GNU Lesser General Public
> -- * License along with this library. If not, see <http://www.gnu.org/licenses/>.
> -- */
> --
> --/*
> -- * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
> -- * file for a list of people on the GTK+ Team.  See the ChangeLog
> -- * files for a list of changes.  These files are distributed with
> -- * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
> -- */
> --
> --#ifndef __GDK_X_H__
> --#define __GDK_X_H__
> --
> --#include <gdk/gdk.h>
> --
> --#include <X11/Xlib.h>
> --#include <X11/Xutil.h>
> --
> --#define __GDKX_H_INSIDE__
> --
> --#include <gdk/x11/gdkx11applaunchcontext.h>
> --#include <gdk/x11/gdkx11cursor.h>
> --#include <gdk/x11/gdkx11device.h>
> --#include <gdk/x11/gdkx11device-core.h>
> --#include <gdk/x11/gdkx11device-xi2.h>
> --#include <gdk/x11/gdkx11devicemanager.h>
> --#include <gdk/x11/gdkx11devicemanager-core.h>
> --#include <gdk/x11/gdkx11devicemanager-xi2.h>
> --#include <gdk/x11/gdkx11display.h>
> --#include <gdk/x11/gdkx11displaymanager.h>
> --#include <gdk/x11/gdkx11dnd.h>
> --#include <gdk/x11/gdkx11glcontext.h>
> --#include <gdk/x11/gdkx11keys.h>
> --#include <gdk/x11/gdkx11property.h>
> --#include <gdk/x11/gdkx11screen.h>
> --#include <gdk/x11/gdkx11selection.h>
> --#include <gdk/x11/gdkx11utils.h>
> --#include <gdk/x11/gdkx11visual.h>
> --#include <gdk/x11/gdkx11window.h>
> --
> --#include <gdk/x11/gdkx-autocleanups.h>
> --
> --#undef __GDKX_H_INSIDE__
> --
> --#endif /* __GDK_X_H__ */
>   diff --git a/gtk/Makefile.am b/gtk/Makefile.am
> -index 801c3a5..2d8839d 100644
> +index 6a53a2b..49a35e6 100644
>   --- a/gtk/Makefile.am
>   +++ b/gtk/Makefile.am
> -@@ -1246,14 +1246,13 @@ gtkprivatetypebuiltins.c: $(gtk_private_type_h_sources)  gtkprivatetypebuiltins.
> +@@ -1351,14 +1351,13 @@ gtkprivatetypebuiltins.c: $(gtk_private_type_h_sources)  gtkprivatetypebuiltins.
>    	&& cp xgen-gptbc gtkprivatetypebuiltins.c  \
>    	&& rm -f xgen-gptbc
>
> @@ -772,7 +638,7 @@ index 801c3a5..2d8839d 100644
>    gtktestutils.c: gtktypefuncs.c
>
>   diff --git a/gtk/gtkglarea.c b/gtk/gtkglarea.c
> -index 4098409..45fa1d1 100644
> +index 245fc6b..4214ad1 100644
>   --- a/gtk/gtkglarea.c
>   +++ b/gtk/gtkglarea.c
>   @@ -28,7 +28,9 @@
> @@ -868,7 +734,7 @@ index 4098409..45fa1d1 100644
>
>    static gboolean
>   diff --git a/gtk/inspector/general.c b/gtk/inspector/general.c
> -index 0611373..4499a29 100644
> +index 4eab3a7..c4e900e 100644
>   --- a/gtk/inspector/general.c
>   +++ b/gtk/inspector/general.c
>   @@ -33,8 +33,10 @@
> @@ -882,7 +748,7 @@ index 0611373..4499a29 100644
>
>    #ifdef GDK_WINDOWING_WIN32
>    #include "win32/gdkwin32.h"
> -@@ -146,6 +148,7 @@ append_extension_row (GtkInspectorGeneral *gen,
> +@@ -147,6 +149,7 @@ append_extension_row (GtkInspectorGeneral *gen,
>      gtk_size_group_add_widget (GTK_SIZE_GROUP (gen->priv->labels), label);
>    }
>
> @@ -890,7 +756,7 @@ index 0611373..4499a29 100644
>    #ifdef GDK_WINDOWING_X11
>    static void
>    append_glx_extension_row (GtkInspectorGeneral *gen,
> -@@ -155,6 +158,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,
> +@@ -156,6 +159,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,
>      append_extension_row (gen, ext, epoxy_has_glx_extension (dpy, 0, ext));
>    }
>    #endif
> @@ -898,27 +764,27 @@ index 0611373..4499a29 100644
>
>    #ifdef GDK_WINDOWING_WAYLAND
>    static void
> -@@ -174,6 +178,7 @@ init_gl (GtkInspectorGeneral *gen)
> -
> -   display = gdk_display_get_default ();
> -
> +@@ -171,6 +175,7 @@ append_egl_extension_row (GtkInspectorGeneral *gen,
> + static void
> + init_gl (GtkInspectorGeneral *gen)
> + {
>   +#ifdef HAVE_OPENGL
>    #ifdef GDK_WINDOWING_X11
> -   if (GDK_IS_X11_DISPLAY (display))
> +   if (GDK_IS_X11_DISPLAY (gdk_display_get_default ()))
>        {
> -@@ -199,6 +204,7 @@ init_gl (GtkInspectorGeneral *gen)
> +@@ -197,6 +202,7 @@ init_gl (GtkInspectorGeneral *gen)
>        }
>      else
>    #endif
>   +#endif
>    #ifdef GDK_WINDOWING_WAYLAND
> -   if (GDK_IS_WAYLAND_DISPLAY (display))
> +   if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))
>        {
>   diff --git a/tests/Makefile.am b/tests/Makefile.am
> -index 50f2986..3b39169 100644
> +index 681807d..2941a36 100644
>   --- a/tests/Makefile.am
>   +++ b/tests/Makefile.am
> -@@ -78,8 +78,6 @@ noinst_PROGRAMS =  $(TEST_PROGS)	\
> +@@ -80,8 +80,6 @@ noinst_PROGRAMS =  $(TEST_PROGS)	\
>    	testfullscreen			\
>    	testgeometry			\
>    	testgiconpixbuf			\
> @@ -927,18 +793,19 @@ index 50f2986..3b39169 100644
>    	testgrid			\
>    	testgtk				\
>    	testheaderbar			\
> -@@ -166,10 +164,16 @@ noinst_PROGRAMS =  $(TEST_PROGS)	\
> +@@ -169,11 +167,17 @@ noinst_PROGRAMS =  $(TEST_PROGS)	\
>    	testactionbar			\
>    	testwindowsize			\
>    	testpopover			\
>   -	gdkgears			\
>    	listmodel			\
> + 	testpopup			\
>    	$(NULL)
>
>   +if HAVE_OPENGL
>   +noinst_PROGRAMS +=
> -+	testglarea			\
> -+	testglblending			\
> ++	testglarea                      \
> ++	testglblending                  \
>   +	gdkgears
>   +endif
>   +
> @@ -946,11 +813,11 @@ index 50f2986..3b39169 100644
>    noinst_PROGRAMS += testerrors
>    endif
>   diff --git a/testsuite/gtk/objects-finalize.c b/testsuite/gtk/objects-finalize.c
> -index 3568505..682ea10 100644
> +index e0ebee0..703643c 100644
>   --- a/testsuite/gtk/objects-finalize.c
>   +++ b/testsuite/gtk/objects-finalize.c
> -@@ -114,8 +114,10 @@ main (int argc, char **argv)
> - 	  all_types[i] != GDK_TYPE_X11_DISPLAY &&
> +@@ -115,8 +115,10 @@ main (int argc, char **argv)
> + 	  all_types[i] != GDK_TYPE_X11_DEVICE_MANAGER_CORE &&
>    	  all_types[i] != GDK_TYPE_X11_DEVICE_MANAGER_XI2 &&
>    	  all_types[i] != GDK_TYPE_X11_DISPLAY_MANAGER &&
>   +#ifdef HAVE_OPENGL
> @@ -961,5 +828,5 @@ index 3568505..682ea10 100644
>    	  all_types[i] != GDK_TYPE_PIXBUF_LOADER &&
>    	  all_types[i] != gdk_pixbuf_simple_anim_iter_get_type())
>   --
> -2.8.1
> +2.1.4
>
> diff --git a/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch b/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch
> new file mode 100644
> index 0000000..634b3a4
> --- /dev/null
> +++ b/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch
> @@ -0,0 +1,36 @@
> +From 97b78e566634579bbae51be914aeaaa921137a8b Mon Sep 17 00:00:00 2001
> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Date: Thu, 9 Jun 2016 11:21:36 +0300
> +Subject: [PATCH 4/4] configure.ac: Fix wayland-protocols path
> +
> +The wayland-protocols directory is used during build: Fix the path
> +to point to sysroot specified in recipe.
> +
> +Normally PKG_CONFIG_SYSROOT_DIR could be used in configure.ac but that
> +breaks multilib gtk+ as it would point to multilib sysroot when the
> +(allarch) wayland-protocols is actually in the machine sysroot.
> +
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index a3e9beb..dde9dc5 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -461,7 +461,7 @@ fi
> + if test "$enable_wayland_backend" = "yes"; then
> +   # For the cairo image backend
> +   cairo_backends="$cairo_backends cairo"
> +-  AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, `$PKG_CONFIG --variable=pkgdatadir wayland-protocols`)
> ++  AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, ${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`)
> +   GDK_BACKENDS="$GDK_BACKENDS wayland"
> +   GDK_WINDOWING="$GDK_WINDOWING
> + #define GDK_WINDOWING_WAYLAND"
> +--
> +2.1.4
> +
> diff --git a/meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch b/meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch
> deleted file mode 100644
> index 32d8a84..0000000
> --- a/meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch
> +++ /dev/null
> @@ -1,118 +0,0 @@
> -window: Check if we can use CSD before enabling them
> -
> -Upstream-Status: Backport
> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -
> -
> -From c5e5ee67490e7e7af56052d8f8beb75db002c2f1 Mon Sep 17 00:00:00 2001
> -From: Emmanuele Bassi <ebassi@gnome.org>
> -Date: Wed, 3 Jun 2015 14:07:29 +0100
> -Subject: window: Check if we can use CSD before enabling them
> -
> -The change in 03213b9509fc1df16c66194ea168aed6c15110e9 changed the rules
> -as to when CSD can be enabled, but it also unconditionally enables CSD
> -with the implicit assumption that client-side shadows were the real
> -issue, and that we could work around that by drawing our own borders.
> -This also means that setting a titlebar for a GtkWindow will enable CSD
> -unconditionally.
> -
> -In reality, some window managers (like Matchbox) *only* support
> -server-side decorations, and will ignore all hints to the contrary, to
> -the point of drawing decorations at random locations on top of the
> -window.
> -
> -Since CSD are enabled unconditionally, the GTK_CSD environment variable
> -is also not a suitable escape hatch.
> -
> -In the grand tradition of asking ourselves if we should do something
> -just because we can, we should split the environment checks from the
> -checks on what the user requested; by doing that, we can also check
> -when enabling client-side decorations, and ideally bail out if needed.
> -
> -https://bugzilla.gnome.org/show_bug.cgi?id=750343
> -
> -diff --git a/gtk/gtkwindow.c b/gtk/gtkwindow.c
> -index 423c6bd..9fe882f 100644
> ---- a/gtk/gtkwindow.c
> -+++ b/gtk/gtkwindow.c
> -@@ -4056,6 +4056,32 @@ gtk_window_supports_client_shadow (GtkWindow *window)
> -   return TRUE;
> - }
> -
> -+static gboolean
> -+gtk_window_can_use_csd (GtkWindow *window)
> -+{
> -+  const gchar *csd_env;
> -+
> -+#ifdef GDK_WINDOWING_BROADWAY
> -+  if (GDK_IS_BROADWAY_DISPLAY (gtk_widget_get_display (GTK_WIDGET (window))))
> -+    return TRUE;
> -+#endif
> -+
> -+#ifdef GDK_WINDOWING_WAYLAND
> -+  if (GDK_IS_WAYLAND_DISPLAY (gtk_widget_get_display (GTK_WIDGET (window))))
> -+    return TRUE;
> -+#endif
> -+
> -+#ifdef GDK_WINDOWING_MIR
> -+  if (GDK_IS_MIR_DISPLAY (gtk_widget_get_display (GTK_WIDGET (window))))
> -+    return TRUE;
> -+#endif
> -+
> -+  csd_env = g_getenv ("GTK_CSD");
> -+
> -+  /* If GTK_CSD is unset we default to CSD support */
> -+  return csd_env == NULL || (strcmp (csd_env, "1") == 0);
> -+}
> -+
> - static void
> - gtk_window_enable_csd (GtkWindow *window)
> - {
> -@@ -4063,6 +4089,10 @@ gtk_window_enable_csd (GtkWindow *window)
> -   GtkWidget *widget = GTK_WIDGET (window);
> -   GdkVisual *visual;
> -
> -+  /* If the environment does not support CSD, then there's no point in enabling them */
> -+  if (!gtk_window_can_use_csd (window))
> -+    return;
> -+
> -   /* We need a visual with alpha for client shadows */
> -   if (priv->use_client_shadow)
> -     {
> -@@ -5839,7 +5869,6 @@ static gboolean
> - gtk_window_should_use_csd (GtkWindow *window)
> - {
> -   GtkWindowPrivate *priv = window->priv;
> --  const gchar *csd_env;
> -
> -   if (priv->csd_requested)
> -     return TRUE;
> -@@ -5850,24 +5879,7 @@ gtk_window_should_use_csd (GtkWindow *window)
> -   if (priv->type == GTK_WINDOW_POPUP)
> -     return FALSE;
> -
> --#ifdef GDK_WINDOWING_BROADWAY
> --  if (GDK_IS_BROADWAY_DISPLAY (gtk_widget_get_display (GTK_WIDGET (window))))
> --    return TRUE;
> --#endif
> --
> --#ifdef GDK_WINDOWING_WAYLAND
> --  if (GDK_IS_WAYLAND_DISPLAY (gtk_widget_get_display (GTK_WIDGET (window))))
> --    return TRUE;
> --#endif
> --
> --#ifdef GDK_WINDOWING_MIR
> --  if (GDK_IS_MIR_DISPLAY (gtk_widget_get_display (GTK_WIDGET (window))))
> --    return TRUE;
> --#endif
> --
> --  csd_env = g_getenv ("GTK_CSD");
> --
> --  return (g_strcmp0 (csd_env, "1") == 0);
> -+  return gtk_window_can_use_csd (window);
> - }
> -
> - static void
> ---
> -cgit v0.10.2
> -
> diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.18.8.bb b/meta/recipes-gnome/gtk+/gtk+3_3.20.6.bb
> similarity index 57%
> rename from meta/recipes-gnome/gtk+/gtk+3_3.18.8.bb
> rename to meta/recipes-gnome/gtk+/gtk+3_3.20.6.bb
> index d776b6d..453a4e2 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3_3.18.8.bb
> +++ b/meta/recipes-gnome/gtk+/gtk+3_3.20.6.bb
> @@ -3,14 +3,13 @@ require gtk+3.inc
>   MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>
>   SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
> -           file://hardcoded_libtool.patch \
> -           file://Dont-force-csd.patch \
> -           file://Do-not-try-to-initialize-GL-without-libGL.patch \
> -           file://0001-Add-disable-opengl-configure-option.patch \
> +           file://0001-Hardcoded-libtool.patch \
> +           file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
> +           file://0003-Add-disable-opengl-configure-option.patch \
> +           file://0004-configure.ac-Fix-wayland-protocols-path.patch \
>             "
> -
> -SRC_URI[md5sum] = "9671acb41dc13561d19233f1a75cf184"
> -SRC_URI[sha256sum] = "1c53ef1bb55364698f7183ecd185b547f92f4a3a7abfafd531400232e2e052f8"
> +SRC_URI[md5sum] = "914e55ea053161f4a575c1c8dade7954"
> +SRC_URI[sha256sum] = "3f8016563a96b1cfef4ac9e795647f6316deb2978ff939b19e4e4f8f936fa4b2"
>
>   S = "${WORKDIR}/gtk+-${PV}"
>
> diff --git a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.18.8.bb b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.20.6.bb
> similarity index 93%
> rename from meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.18.8.bb
> rename to meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.20.6.bb
> index 793f14a..e870ba3 100644
> --- a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.18.8.bb
> +++ b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.20.6.bb
> @@ -10,8 +10,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>
>   SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
>             file://Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch"
> -SRC_URI[md5sum] = "9671acb41dc13561d19233f1a75cf184"
> -SRC_URI[sha256sum] = "1c53ef1bb55364698f7183ecd185b547f92f4a3a7abfafd531400232e2e052f8"
> +SRC_URI[md5sum] = "914e55ea053161f4a575c1c8dade7954"
> +SRC_URI[sha256sum] = "3f8016563a96b1cfef4ac9e795647f6316deb2978ff939b19e4e4f8f936fa4b2"
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
>                       file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
>

