Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1F74F60116
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2016 14:08:46 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id u201so230248294oie.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2016 07:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a0g5s8ATGvTT1jmeGNlh4hwiJ6SR0vGmTglZnSKtdN4=;
	b=TRAaGCn3jGONRKCSLE1EOu/uNX9qdHncTs/WJ0c4cfYaqnzc2lrzXPp9k64ajDFwf6
	0g85Iei4UxAOA+zH+y4/vIApKpS/U+/O+8c4oFqX2YvAVteHRiOPPr9FPN9JSt/Xx8ei
	Tsqz+v3jWL8um/HR2GcktdzPT7F+VipHdIgMAi5A+E/NZPIHIFy+g2lgtI1MsQx7WWcs
	Lr5838dVHAlLtAs9J2JAzoL0QZz6kAZQhZenaNJSiKQwlpBS/vxCKQ+Xk8gWA5I6QL/g
	Bepcpgkrm8YeABfK/uaKp7U0UA/xYPbySTECdsqkf2lWDNBHxFwVmdhUca0chlt+2CYT
	fJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a0g5s8ATGvTT1jmeGNlh4hwiJ6SR0vGmTglZnSKtdN4=;
	b=UmNnQm8ZZRvb7Z9/1XcJxnh6uFNVgKSxb4cLc7sctjF2MH8O5Sh4UBOdTXAPKM+v9v
	B5pY5fHmD5p5/ur3bbLSCFIsVEcyiF/3vgnDXMn3BGmAoCrjm0fbY3YPrNtOPDorJK3B
	ZTDrhPzotwm0pOhecwpfmkCToQvWMfVZma/WC01dCNSCHeC/A51/INHsFEm5Rcil2k9M
	MliFNQKue9z8wUeBN6XxWSdb84WOuwTebmT4ouA6BHdQYAGBOeCfnA5OhC3ultmpUVPK
	cyzVHyFEDUasmwYIZmq4DoMvJw1HfEiET651LYjImgzF5H8U9LFg3+KaAgD/A8QxU+bb
	h7ZQ==
X-Gm-Message-State: ALyK8tKT9Ek8rQUUe2EKISk+WmCbHNOrUuLokP/NS9AsSo+pUwoJy5/g0PDN5tukcj+FmA3HzbaHF6neaE1KY9BX
X-Received: by 10.202.199.129 with SMTP id x123mr9946401oif.51.1467727726817; 
	Tue, 05 Jul 2016 07:08:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.79.83 with HTTP; Tue, 5 Jul 2016 07:08:17 -0700 (PDT)
In-Reply-To: <577BB188.6050703@windriver.com>
References: <cover.1466595928.git.jussi.kukkonen@intel.com>
	<d54f69d5faec48cd7dda7efbbc1b7fdd0bb0bd65.1466595928.git.jussi.kukkonen@intel.com>
	<577BB188.6050703@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 5 Jul 2016 17:08:17 +0300
Message-ID: <CAHiDW_EDPmiEVqihcQ4qu5BU8S9YJOSRw6VXXEmhKgPS0QDppQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 05 Jul 2016 14:08:47 -0000
Content-Type: multipart/alternative; boundary=001a11c1729ac8cdea0536e3fd14

--001a11c1729ac8cdea0536e3fd14
Content-Type: text/plain; charset=UTF-8

On 5 July 2016 at 16:09, Robert Yang <liezhi.yang@windriver.com> wrote:

>
> Hi,
>
> I can't build it on Ubuntu 14.04:
>

I can't see from the log why the file would be be missing and can't
reproduce that locally... Cleaning sstate should be a valid workaround but
I'd be really interested in reproducing this: if you can reproduce (or
remember if you did any  distro feature or  packageconfig changes) please
let me know the details.

In the meantime I'll take another look at the build system...

Thanks,
  Jussi


MACHINE = "qemux86"
>
> $ bitbake gtk+3
>
> Making all in po-properties
> make[2]: Entering directory
> '/buildarea/lyang1/test_qemux86/bitbake_build/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/po-properties'
> make[2]: Nothing to be done for 'all'.
> make[2]: Leaving directory
> '/buildarea/lyang1/test_qemux86/bitbake_build/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/po-properties'
> Making all in gdk
> make[2]: Entering directory
> '/buildarea/lyang1/test_qemux86/bitbake_build/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/gdk'
> ( cd ../../gtk+-3.20.6/gdk && glib-mkenums --template
> gdkenumtypes.h.template \
>     gdk.h gdk-autocleanup.h gdkapplaunchcontext.h gdkcairo.h gdkcursor.h
> gdkdevice.h gdkdevicemanager.h gdkdisplay.h gdkdisplaymanager.h gdkdnd.h
> gdkevents.h gdkframetimings.h gdkglcontext.h gdkkeys.h gdkkeysyms.h
> gdkkeysyms-compat.h gdkmain.h gdkpango.h gdkframeclock.h gdkpixbuf.h
> gdkprivate.h gdkproperty.h gdkrectangle.h gdkrgba.h gdkscreen.h gdkseat.h
> gdkselection.h gdktestutils.h gdkthreads.h gdktypes.h gdkvisual.h
> gdkwindow.h deprecated/gdkcolor.h ) >> xgen-geth \
> && (cmp -s xgen-geth gdkenumtypes.h || cp xgen-geth gdkenumtypes.h ) \
> && rm -f xgen-geth \
> && echo timestamp > stamp-gdkenumtypes.h
> cd .. && /bin/sh ./config.status gdk/gdkconfig.h \
> && echo timestamp > gdk/stamp-gc-h
> config.status: executing gdk/gdkconfig.h commands
> config.status: gdk/gdkconfig.h is unchanged
> if test -f gdkconfig.h; then :; \
> else rm -f stamp-gc-h; make stamp-gc-h; fi
> make  all-recursive
> make[3]: Entering directory
> '/buildarea/lyang1/test_qemux86/bitbake_build/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/gdk'
> Making all in x11
> make[4]: Entering directory
> '/buildarea/lyang1/test_qemux86/bitbake_build/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/gdk/x11'
> cd ../../../gtk+-3.20.6/gdk/x11 \
> && (cmp -s gdkx-with-gl-context.h gdkx.h || cp gdkx-with-gl-context.h
> gdkx.h )
> cp: cannot stat 'gdkx-with-gl-context.h': No such file or directory
> Makefile:1014: recipe for target 'gdkx.h' failed
> make[4]: *** [gdkx.h] Error 1
> make[4]: Leaving directory
> '/buildarea/lyang1/test_qemux86/bitbake_build/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/gdk/x11'
> Makefile:1460: recipe for target 'all-recursive' failed
> make[3]: *** [all-recursive] Error 1
> make[3]: Leaving directory
> '/buildarea/lyang1/test_qemux86/bitbake_build/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/gdk'
> Makefile:951: recipe for target 'all' failed
> make[2]: *** [all] Error 2
> make[2]: Leaving directory
> '/buildarea/lyang1/test_qemux86/bitbake_build/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/gdk'
> Makefile:713: recipe for target 'all-recursive' failed
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory
> '/buildarea/lyang1/test_qemux86/bitbake_build/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build'
> Makefile:607: recipe for target 'all' failed
> make: *** [all] Error 2
>
> // Robert
>
>
> On 06/22/2016 07:52 PM, Jussi Kukkonen wrote:
>
>> * Remove a patch that's no longer needed (as we don't
>>    have a problem with client side decorations anymore)
>> * Wayland build now depends on wayland-protocols:
>>    Use same WAYLAND_PROTOCOLS_SYSROOT_DIR trick as weston so
>>    protocols are found and multilib build does not break
>> * Add new binary gtk-query-settings to -dev package
>> * Rebase patches
>> * Modify 0003-Add-disable-opengl-configure-option.patch so
>>    that gdkx.h really is generated whenever it changes
>>
>> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> ---
>>   meta/recipes-gnome/gtk+/gtk+3.inc                  |   9 +-
>>   ..._libtool.patch => 0001-Hardcoded-libtool.patch} |  26 +-
>>   ...o-not-try-to-initialize-GL-without-libGL.patch} |  12 +-
>>   ...0003-Add-disable-opengl-configure-option.patch} | 327
>> ++++++---------------
>>   ...4-configure.ac-Fix-wayland-protocols-path.patch |  36 +++
>>   meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch | 118 --------
>>   .../gtk+/{gtk+3_3.18.8.bb => gtk+3_3.20.6.bb}      |  13 +-
>>   ...e_3.18.8.bb => gtk-icon-utils-native_3.20.6.bb} |   4 +-
>>   8 files changed, 173 insertions(+), 372 deletions(-)
>>   rename meta/recipes-gnome/gtk+/gtk+3/{hardcoded_libtool.patch =>
>> 0001-Hardcoded-libtool.patch} (70%)
>>   rename
>> meta/recipes-gnome/gtk+/gtk+3/{Do-not-try-to-initialize-GL-without-libGL.patch
>> => 0002-Do-not-try-to-initialize-GL-without-libGL.patch} (86%)
>>   rename
>> meta/recipes-gnome/gtk+/gtk+3/{0001-Add-disable-opengl-configure-option.patch
>> => 0003-Add-disable-opengl-configure-option.patch} (71%)
>>   create mode 100644
>> meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch
>>   delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch
>>   rename meta/recipes-gnome/gtk+/{gtk+3_3.18.8.bb => gtk+3_3.20.6.bb}
>> (57%)
>>   rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.18.8.bb =>
>> gtk-icon-utils-native_3.20.6.bb} (93%)
>>
>> diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc
>> b/meta/recipes-gnome/gtk+/gtk+3.inc
>> index 959fb44..0de114d 100644
>> --- a/meta/recipes-gnome/gtk+/gtk+3.inc
>> +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
>> @@ -31,7 +31,9 @@ EXTRA_OECONF += " \
>>                    --enable-modules \
>>                    --disable-cups \
>>                    --disable-colord \
>> -"
>> +                 WAYLAND_PROTOCOLS_SYSROOT_DIR=${STAGING_DIR}/${MACHINE}
>> \
>> +                 "
>> +EXTRA_OECONF[vardepsexclude] = "MACHINE"
>>
>>   do_compile_prepend() {
>>           export GIR_EXTRA_LIBS_PATH="${B}/gdk/.libs"
>> @@ -46,7 +48,7 @@ PACKAGECONFIG[x11] =
>> "--enable-x11-backend,--disable-x11-backend,at-spi2-atk fon
>>   # this is provided by oe-core patch that removes epoxy/gl dependency
>> from a X11 build
>>   PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,libepoxy"
>>   PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,,libgl"
>> -PACKAGECONFIG[wayland] =
>> "--enable-wayland-backend,--disable-wayland-backend,wayland libxkbcommon
>> virtual/mesa wayland-native"
>> +PACKAGECONFIG[wayland] =
>> "--enable-wayland-backend,--disable-wayland-backend,wayland
>> wayland-protocols libxkbcommon virtual/mesa wayland-native"
>>
>>   do_install_append() {
>>         mv ${D}${bindir}/gtk-update-icon-cache
>> ${D}${bindir}/gtk-update-icon-cache-3.0
>> @@ -76,6 +78,7 @@ FILES_${PN}_append = "
>> ${bindir}/gtk-update-icon-cache-3.0 \
>>   FILES_${PN}-dev += " \
>>                       ${datadir}/gtk-3.0/gtkbuilder.rng \
>>                       ${datadir}/gtk-3.0/include \
>> +                    ${datadir}/gettext/its \
>>                       ${libdir}/gtk-3.0/include \
>>                       ${libdir}/gtk-3.0/${LIBV}/loaders/*.la \
>>                       ${libdir}/gtk-3.0/${LIBV}/immodules/*.la \
>> @@ -85,6 +88,7 @@ FILES_${PN}-dev += " \
>>                       ${bindir}/gtk-builder-convert \
>>                       ${bindir}/gtk-encode-symbolic-svg \
>>                       ${bindir}/gtk-builder-tool \
>> +                    ${bindir}/gtk-query-settings \
>>                       "
>>
>>   GTKBASE_RRECOMMENDS ?= "liberation-fonts \
>> @@ -99,6 +103,7 @@ GTKGLIBC_RRECOMMENDS ?= "${GTKBASE_RRECOMMENDS}
>> glibc-gconv-iso8859-1"
>>
>>   RRECOMMENDS_${PN} = "${GTKBASE_RRECOMMENDS}"
>>   RRECOMMENDS_${PN}_libc-glibc = "${GTKGLIBC_RRECOMMENDS}"
>> +RRECOMMENDS_${PN}-dev += "wayland-protocols"
>>
>>   PACKAGES_DYNAMIC += "^gtk3-immodule-.* ^gtk3-printbackend-.*"
>>
>> diff --git a/meta/recipes-gnome/gtk+/gtk+3/hardcoded_libtool.patch
>> b/meta/recipes-gnome/gtk+/gtk+3/0001-Hardcoded-libtool.patch
>> similarity index 70%
>> rename from meta/recipes-gnome/gtk+/gtk+3/hardcoded_libtool.patch
>> rename to meta/recipes-gnome/gtk+/gtk+3/0001-Hardcoded-libtool.patch
>> index 3b4beeb..0bda1f1 100644
>> --- a/meta/recipes-gnome/gtk+/gtk+3/hardcoded_libtool.patch
>> +++ b/meta/recipes-gnome/gtk+/gtk+3/0001-Hardcoded-libtool.patch
>> @@ -1,12 +1,21 @@
>> +From 5a73a5b92566e314bbc8a1bd40f1ec204837c111 Mon Sep 17 00:00:00 2001
>> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> +Date: Tue, 21 Jun 2016 14:53:56 +0300
>> +Subject: [PATCH 1/4] Hardcoded libtool
>> +
>>   Upstream-Status: Inappropriate [embedded specific]
>>
>>   Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
>> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> +---
>> + configure.ac | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> -Index: gtk+-3.8.2/configure.ac
>> -===================================================================
>> ---- gtk+-3.8.2.orig/configure.ac
>> -+++ gtk+-3.8.2/configure.ac
>> -@@ -531,7 +531,7 @@ AC_MSG_CHECKING([Whether to write depend
>> +diff --git a/configure.ac b/configure.ac
>> +index 23d3077..b6931d6 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -610,7 +610,7 @@ AC_MSG_CHECKING([whether to write dependencies into
>> .pc files])
>>    case $enable_explicit_deps in
>>      auto)
>>        export SED
>> @@ -15,7 +24,7 @@ Index: gtk+-3.8.2/configure.ac
>>        if test "x$deplibs_check_method" != xpass_all || test
>> "x$enable_static" = xyes ; then
>>          enable_explicit_deps=yes
>>        else
>> -@@ -793,7 +793,7 @@ else
>> +@@ -876,7 +876,7 @@ else
>>        dnl Now we check to see if our libtool supports shared lib deps
>>        dnl (in a rather ugly way even)
>>        if $dynworks; then
>> @@ -24,7 +33,7 @@ Index: gtk+-3.8.2/configure.ac
>>            module_deplibs_check=`$module_libtool_config | \
>>                grep '^[[a-z_]]*check[[a-z_]]*_method=[['\''"]]' | \
>>                sed 's/.*[['\''"]]\(.*\)[['\''"]]$/\1/'`
>> -@@ -1528,7 +1528,7 @@ fi
>> +@@ -1630,7 +1630,7 @@ AC_SUBST(GTK_PRINT_BACKENDS)
>>    # We are using gmodule-no-export now, but I'm leaving the stripping
>>    # code in place for now, since pango and atk still require gmodule.
>>    export SED
>> @@ -33,3 +42,6 @@ Index: gtk+-3.8.2/configure.ac
>>    if test -n "$export_dynamic"; then
>>      GDK_DEP_LIBS=`echo $GDK_DEP_LIBS | sed -e "s/$export_dynamic//"`
>>      GTK_DEP_LIBS=`echo $GTK_DEP_LIBS | sed -e "s/$export_dynamic//"`
>> +--
>> +2.1.4
>> +
>> diff --git
>> a/meta/recipes-gnome/gtk+/gtk+3/Do-not-try-to-initialize-GL-without-libGL.patch
>> b/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-without-libGL.patch
>> similarity index 86%
>> rename from
>> meta/recipes-gnome/gtk+/gtk+3/Do-not-try-to-initialize-GL-without-libGL.patch
>> rename to
>> meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-without-libGL.patch
>> index c8c480c..989716e 100644
>> ---
>> a/meta/recipes-gnome/gtk+/gtk+3/Do-not-try-to-initialize-GL-without-libGL.patch
>> +++
>> b/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-without-libGL.patch
>> @@ -1,7 +1,7 @@
>> -From fc22058a10db913534f11348f86681fe9e1838e5 Mon Sep 17 00:00:00 2001
>> +From d63b926f8c8d8b5c9f9ec33d078b775f0409d88a Mon Sep 17 00:00:00 2001
>>   From: Jussi Kukkonen <jussi.kukkonen@intel.com>
>>   Date: Fri, 16 Oct 2015 16:35:16 +0300
>> -Subject: [PATCH] Do not try to initialize GL without libGL
>> +Subject: [PATCH 2/4] Do not try to initialize GL without libGL
>>
>>   _gdk_x11_screen_update_visuals_for_gl() will end up calling epoxys
>>   GLX api which will exit() if libGL.so.1 is not present. We do not
>> @@ -21,10 +21,10 @@ Signed-off-by: Jussi Kukkonen <
>> jussi.kukkonen@intel.com>
>>    2 files changed, 12 insertions(+)
>>
>>   diff --git a/configure.ac b/configure.ac
>> -index 729a62e..58cc1ac 100644
>> +index b6931d6..e27da49 100644
>>   --- a/configure.ac
>>   +++ b/configure.ac
>> -@@ -328,6 +328,13 @@ AC_ARG_ENABLE(mir-backend,
>> +@@ -342,6 +342,13 @@ AC_ARG_ENABLE(mir-backend,
>>                                  [enable the Mir gdk backend])],
>>                               [backend_set=yes])
>>
>> @@ -39,10 +39,10 @@ index 729a62e..58cc1ac 100644
>>      if test "$platform_win32" = yes; then
>>        enable_win32_backend=yes
>>   diff --git a/gdk/x11/gdkvisual-x11.c b/gdk/x11/gdkvisual-x11.c
>> -index f3b062d..c8243f4 100644
>> +index 81479d8..3c8c5c0 100644
>>   --- a/gdk/x11/gdkvisual-x11.c
>>   +++ b/gdk/x11/gdkvisual-x11.c
>> -@@ -345,7 +345,12 @@ _gdk_x11_screen_init_visuals (GdkScreen *screen)
>> +@@ -306,7 +306,12 @@ _gdk_x11_screen_init_visuals (GdkScreen *screen)
>>      /* If GL is available we want to pick better default/rgba visuals,
>>         as we care about glx details such as alpha/depth/stencil depth,
>>         stereo and double buffering */
>> diff --git
>> a/meta/recipes-gnome/gtk+/gtk+3/0001-Add-disable-opengl-configure-option.patch
>> b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
>> similarity index 71%
>> rename from
>> meta/recipes-gnome/gtk+/gtk+3/0001-Add-disable-opengl-configure-option.patch
>> rename to
>> meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
>> index a963334..8552f53 100644
>> ---
>> a/meta/recipes-gnome/gtk+/gtk+3/0001-Add-disable-opengl-configure-option.patch
>> +++
>> b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
>> @@ -1,7 +1,7 @@
>> -From c77afa19881d955d759879aeae8bbd88613dd4fe Mon Sep 17 00:00:00 2001
>> +From a8fa547fdc1416b330aced805f5343ad912932ae Mon Sep 17 00:00:00 2001
>>   From: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> -Date: Thu, 16 Jun 2016 15:11:34 +0300
>> -Subject: [PATCH] Add --disable-opengl configure option
>> +Date: Tue, 21 Jun 2016 15:11:39 +0300
>> +Subject: [PATCH 3/4] Add --disable-opengl configure option
>>
>>   --disable-opengl will remove the dependency on libepoxy and on the
>>   OpenGL APIs. This is useful for those who want to keep using gtk+3
>> @@ -20,37 +20,35 @@ Long-term it would be good to find an alternative
>> solution to this
>>   Upstream-Status: Inappropriate [Evil eye expected from upstream]
>>   Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>>   ---
>> - configure.ac                      | 13 +++++++--
>> - demos/gtk-demo/glarea.c           | 13 +++++++++
>> - docs/tools/Makefile.am            |  9 ++++--
>> - docs/tools/widgets.c              |  4 ++-
>> - gdk/gdkdisplay.c                  |  4 ++-
>> - gdk/gdkgl.c                       | 10 +++++++
>> - gdk/gdkglcontext.c                |  6 ++++
>> - gdk/gdkwindow.c                   | 14 +++++++++-
>> - gdk/x11/Makefile.am               | 28 ++++++++++++++++---
>> - gdk/x11/gdkdisplay-x11.c          |  6 ++--
>> - gdk/x11/gdkscreen-x11.c           |  5 ++++
>> - gdk/x11/gdkwindow-x11.c           |  4 +++
>> - gdk/x11/gdkx-autocleanups.h       |  2 ++
>> - gdk/x11/gdkx-with-gl-context.h    | 59
>> +++++++++++++++++++++++++++++++++++++++
>> - gdk/x11/gdkx-without-gl-context.h | 58
>> ++++++++++++++++++++++++++++++++++++++
>> - gdk/x11/gdkx.h                    | 59
>> ---------------------------------------
>> - gtk/Makefile.am                   |  3 +-
>> - gtk/gtkglarea.c                   | 20 ++++++++++++-
>> - gtk/inspector/general.c           |  6 ++++
>> - tests/Makefile.am                 | 10 +++++--
>> - testsuite/gtk/objects-finalize.c  |  2 ++
>> - 21 files changed, 257 insertions(+), 78 deletions(-)
>> - create mode 100644 gdk/x11/gdkx-with-gl-context.h
>> + configure.ac                               | 13 +++++--
>> + demos/gtk-demo/glarea.c                    | 13 +++++++
>> + docs/tools/Makefile.am                     |  9 +++--
>> + docs/tools/widgets.c                       |  4 ++-
>> + gdk/gdkdisplay.c                           |  4 ++-
>> + gdk/gdkgl.c                                | 10 ++++++
>> + gdk/gdkglcontext.c                         |  6 ++++
>> + gdk/gdkwindow.c                            | 13 +++++++
>> + gdk/x11/Makefile.am                        | 30 +++++++++++++---
>> + gdk/x11/gdkdisplay-x11.c                   |  6 +++-
>> + gdk/x11/gdkscreen-x11.c                    |  5 +++
>> + gdk/x11/gdkwindow-x11.c                    |  4 +++
>> + gdk/x11/gdkx-autocleanups.h                |  2 ++
>> + gdk/x11/{gdkx.h => gdkx-with-gl-context.h} |  0
>> + gdk/x11/gdkx-without-gl-context.h          | 58
>> ++++++++++++++++++++++++++++++
>> + gtk/Makefile.am                            |  3 +-
>> + gtk/gtkglarea.c                            | 20 ++++++++++-
>> + gtk/inspector/general.c                    |  6 ++++
>> + tests/Makefile.am                          | 10 ++++--
>> + testsuite/gtk/objects-finalize.c           |  2 ++
>> + 20 files changed, 201 insertions(+), 17 deletions(-)
>> + rename gdk/x11/{gdkx.h => gdkx-with-gl-context.h} (100%)
>>    create mode 100644 gdk/x11/gdkx-without-gl-context.h
>> - delete mode 100644 gdk/x11/gdkx.h
>>
>>   diff --git a/configure.ac b/configure.ac
>> -index c280543..32da151 100644
>> +index e27da49..a3e9beb 100644
>>   --- a/configure.ac
>>   +++ b/configure.ac
>> -@@ -340,6 +340,15 @@ AC_ARG_ENABLE(mir-backend,
>> +@@ -342,6 +342,15 @@ AC_ARG_ENABLE(mir-backend,
>>                                  [enable the Mir gdk backend])],
>>                               [backend_set=yes])
>>
>> @@ -66,7 +64,7 @@ index c280543..32da151 100644
>>    AC_ARG_ENABLE(glx,
>>                  [AS_HELP_STRING([--enable-glx],
>>                                  [When enabled Gdk will try to initialize
>> GLX])])
>> -@@ -1330,7 +1339,7 @@ CFLAGS="$saved_cflags"
>> +@@ -1333,7 +1342,7 @@ CFLAGS="$saved_cflags"
>>    LDFLAGS="$saved_ldflags"
>>
>>    GDK_PACKAGES="$PANGO_PACKAGES gdk-pixbuf-2.0 >=
>> gdk_pixbuf_required_version cairo >= cairo_required_version cairo-gobject
>> >= cairo_required_version"
>> @@ -75,7 +73,7 @@ index c280543..32da151 100644
>>
>>    PKG_CHECK_MODULES(GDK_DEP, $GDK_PACKAGES $GDK_PRIVATE_PACKAGES)
>>    GDK_DEP_LIBS="$GDK_EXTRA_LIBS $GDK_DEP_LIBS $MATH_LIB"
>> -@@ -1364,7 +1373,7 @@ fi
>> +@@ -1367,7 +1376,7 @@ fi
>>    PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)
>>
>>    GTK_PACKAGES="atk >= atk_required_version cairo >=
>> cairo_required_version cairo-gobject >= cairo_required_version
>> gdk-pixbuf-2.0 >= gdk_pixbuf_required_version gio-2.0 >=
>> glib_required_version"
>> @@ -85,7 +83,7 @@ index c280543..32da151 100644
>>      GTK_PRIVATE_PACKAGES="$GTK_PRIVATE_PACKAGES pangoft2"
>>    fi
>>   diff --git a/demos/gtk-demo/glarea.c b/demos/gtk-demo/glarea.c
>> -index c267706..b3bac86 100644
>> +index 3aba729..c6c79f7 100644
>>   --- a/demos/gtk-demo/glarea.c
>>   +++ b/demos/gtk-demo/glarea.c
>>   @@ -5,7 +5,9 @@
>> @@ -207,10 +205,10 @@ index 932daf1..54239d6 100644
>>
>>      return info;
>>   diff --git a/gdk/gdkdisplay.c b/gdk/gdkdisplay.c
>> -index 892d6a7..8323768 100644
>> +index 6150ef7..2223629 100644
>>   --- a/gdk/gdkdisplay.c
>>   +++ b/gdk/gdkdisplay.c
>> -@@ -2285,7 +2285,9 @@ gboolean
>> +@@ -2360,7 +2360,9 @@ gboolean
>>    gdk_display_make_gl_context_current (GdkDisplay   *display,
>>                                         GdkGLContext *context)
>>    {
>> @@ -222,7 +220,7 @@ index 892d6a7..8323768 100644
>>
>>    GdkRenderingMode
>>   diff --git a/gdk/gdkgl.c b/gdk/gdkgl.c
>> -index 85ce63d..d76e8dc 100644
>> +index e8ba770..ba7c84b 100644
>>   --- a/gdk/gdkgl.c
>>   +++ b/gdk/gdkgl.c
>>   @@ -22,7 +22,9 @@
>> @@ -243,7 +241,7 @@ index 85ce63d..d76e8dc 100644
>>    static const char *
>>    get_vertex_type_name (int type)
>>    {
>> -@@ -205,6 +208,7 @@ use_texture_rect_program (GdkGLContextPaintData
>> *paint_data)
>> +@@ -254,6 +257,7 @@ use_texture_rect_program (GdkGLContextPaintData
>> *paint_data)
>>          glUseProgram (paint_data->current_program->program);
>>        }
>>    }
>> @@ -251,7 +249,7 @@ index 85ce63d..d76e8dc 100644
>>
>>    void
>>    gdk_gl_texture_quads (GdkGLContext *paint_context,
>> -@@ -212,6 +216,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
>> +@@ -261,6 +265,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
>>                          int n_quads,
>>                          GdkTexturedQuad *quads)
>>    {
>> @@ -259,7 +257,7 @@ index 85ce63d..d76e8dc 100644
>>      GdkGLContextPaintData *paint_data  = gdk_gl_context_get_paint_data
>> (paint_context);
>>      GdkGLContextProgram *program;
>>      GdkWindow *window = gdk_gl_context_get_window (paint_context);
>> -@@ -275,6 +280,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
>> +@@ -324,6 +329,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
>>
>>      glDisableVertexAttribArray (program->position_location);
>>      glDisableVertexAttribArray (program->uv_location);
>> @@ -267,7 +265,7 @@ index 85ce63d..d76e8dc 100644
>>    }
>>
>>    /* x,y,width,height describes a rectangle in the gl render buffer
>> -@@ -323,6 +329,7 @@ gdk_cairo_draw_from_gl (cairo_t              *cr,
>> +@@ -372,6 +378,7 @@ gdk_cairo_draw_from_gl (cairo_t              *cr,
>>                            int                   width,
>>                            int                   height)
>>    {
>> @@ -275,7 +273,7 @@ index 85ce63d..d76e8dc 100644
>>      GdkGLContext *paint_context;
>>      cairo_surface_t *image;
>>      cairo_matrix_t matrix;
>> -@@ -643,6 +650,7 @@ gdk_cairo_draw_from_gl (cairo_t              *cr,
>> +@@ -692,6 +699,7 @@ gdk_cairo_draw_from_gl (cairo_t              *cr,
>>      if (clip_region)
>>        cairo_region_destroy (clip_region);
>>
>> @@ -283,7 +281,7 @@ index 85ce63d..d76e8dc 100644
>>    }
>>
>>    /* This is always called with the paint context current */
>> -@@ -650,6 +658,7 @@ void
>> +@@ -699,6 +707,7 @@ void
>>    gdk_gl_texture_from_surface (cairo_surface_t *surface,
>>                              cairo_region_t  *region)
>>    {
>> @@ -291,14 +289,14 @@ index 85ce63d..d76e8dc 100644
>>      GdkGLContext *paint_context;
>>      cairo_surface_t *image;
>>      double device_x_offset, device_y_offset;
>> -@@ -750,4 +759,5 @@ gdk_gl_texture_from_surface (cairo_surface_t
>> *surface,
>> +@@ -799,4 +808,5 @@ gdk_gl_texture_from_surface (cairo_surface_t
>> *surface,
>>
>>      glDisable (GL_SCISSOR_TEST);
>>      glDeleteTextures (1, &texture_id);
>>   +#endif
>>    }
>>   diff --git a/gdk/gdkglcontext.c b/gdk/gdkglcontext.c
>> -index 4d71353..9bb55ef 100644
>> +index 00a33eb..bd8a793 100644
>>   --- a/gdk/gdkglcontext.c
>>   +++ b/gdk/gdkglcontext.c
>>   @@ -85,7 +85,9 @@
>> @@ -311,7 +309,7 @@ index 4d71353..9bb55ef 100644
>>
>>    typedef struct {
>>      GdkDisplay *display;
>> -@@ -238,6 +240,7 @@ gdk_gl_context_upload_texture (GdkGLContext
>> *context,
>> +@@ -239,6 +241,7 @@ gdk_gl_context_upload_texture (GdkGLContext
>> *context,
>>                                   int              height,
>>                                   guint            texture_target)
>>    {
>> @@ -319,7 +317,7 @@ index 4d71353..9bb55ef 100644
>>      g_return_if_fail (GDK_IS_GL_CONTEXT (context));
>>
>>      glPixelStorei (GL_UNPACK_ALIGNMENT, 4);
>> -@@ -245,6 +248,7 @@ gdk_gl_context_upload_texture (GdkGLContext
>> *context,
>> +@@ -246,6 +249,7 @@ gdk_gl_context_upload_texture (GdkGLContext
>> *context,
>>      glTexImage2D (texture_target, 0, GL_RGBA, width, height, 0, GL_BGRA,
>> GL_UNSIGNED_INT_8_8_8_8_REV,
>>                    cairo_image_surface_get_data (image_surface));
>>      glPixelStorei (GL_UNPACK_ROW_LENGTH, 0);
>> @@ -327,7 +325,7 @@ index 4d71353..9bb55ef 100644
>>    }
>>
>>    static void
>> -@@ -586,6 +590,7 @@ gdk_gl_context_realize (GdkGLContext  *context,
>> +@@ -635,6 +639,7 @@ gdk_gl_context_realize (GdkGLContext  *context,
>>    static void
>>    gdk_gl_context_check_extensions (GdkGLContext *context)
>>    {
>> @@ -335,8 +333,8 @@ index 4d71353..9bb55ef 100644
>>      GdkGLContextPrivate *priv = gdk_gl_context_get_instance_private
>> (context);
>>      gboolean has_npot, has_texture_rectangle;
>>
>> -@@ -628,6 +633,7 @@ gdk_gl_context_check_extensions (GdkGLContext
>> *context)
>> -                      priv->use_texture_rectangle ? "yes" : "no"));
>> +@@ -677,6 +682,7 @@ gdk_gl_context_check_extensions (GdkGLContext
>> *context)
>> +                        priv->use_texture_rectangle ? "yes" : "no"));
>>
>>      priv->extensions_checked = TRUE;
>>   +#endif
>> @@ -344,7 +342,7 @@ index 4d71353..9bb55ef 100644
>>
>>    /**
>>   diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c
>> -index c34c113..3025e96 100644
>> +index 66ebb9d..74a0c3a 100644
>>   --- a/gdk/gdkwindow.c
>>   +++ b/gdk/gdkwindow.c
>>   @@ -44,7 +44,9 @@
>> @@ -357,15 +355,7 @@ index c34c113..3025e96 100644
>>
>>    /* for the use of round() */
>>    #include "fallback-c89.c"
>> -@@ -1455,7 +1457,6 @@ gdk_window_new (GdkWindow     *parent,
>> -   g_signal_connect (device_manager, "device-removed",
>> -                     G_CALLBACK (device_removed_cb), window);
>> -
>> --
>> -   if ((_gdk_gl_flags & (GDK_GL_ALWAYS | GDK_GL_DISABLE)) ==
>> GDK_GL_ALWAYS)
>> -     {
>> -       GError *error = NULL;
>> -@@ -2761,6 +2762,13 @@ gdk_window_get_paint_gl_context (GdkWindow
>> *window,
>> +@@ -2759,6 +2761,13 @@ gdk_window_get_paint_gl_context (GdkWindow
>> *window,
>>    {
>>      GError *internal_error = NULL;
>>
>> @@ -379,7 +369,7 @@ index c34c113..3025e96 100644
>>      if (_gdk_gl_flags & GDK_GL_DISABLE)
>>        {
>>          g_set_error_literal (error, GDK_GL_ERROR,
>> -@@ -2957,6 +2965,7 @@ gdk_window_begin_paint_region (GdkWindow
>>  *window,
>> +@@ -2955,6 +2964,7 @@ gdk_window_begin_paint_region (GdkWindow
>>  *window,
>>            }
>>          else
>>            {
>> @@ -387,7 +377,7 @@ index c34c113..3025e96 100644
>>           gdk_gl_context_make_current (context);
>>              /* With gl we always need a surface to combine the gl
>>                 drawing with the native drawing. */
>> -@@ -2971,6 +2980,7 @@ gdk_window_begin_paint_region (GdkWindow
>>  *window,
>> +@@ -2969,6 +2979,7 @@ gdk_window_begin_paint_region (GdkWindow
>>  *window,
>>              glBlendFunc (GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
>>
>>              glViewport (0, 0, ww, wh);
>> @@ -395,7 +385,7 @@ index c34c113..3025e96 100644
>>            }
>>        }
>>
>> -@@ -3119,6 +3129,7 @@ gdk_window_end_paint (GdkWindow *window)
>> +@@ -3117,6 +3128,7 @@ gdk_window_end_paint (GdkWindow *window)
>>
>>              gdk_gl_context_make_current (window->gl_paint_context);
>>
>> @@ -403,7 +393,7 @@ index c34c113..3025e96 100644
>>              if (!cairo_region_is_empty (opaque_region))
>>                gdk_gl_texture_from_surface (window->current_paint.surface,
>>                                             opaque_region);
>> -@@ -3129,6 +3140,7 @@ gdk_window_end_paint (GdkWindow *window)
>> +@@ -3127,6 +3139,7 @@ gdk_window_end_paint (GdkWindow *window)
>>
>> window->current_paint.need_blend_region);
>>                  glDisable(GL_BLEND);
>>                }
>> @@ -412,7 +402,7 @@ index c34c113..3025e96 100644
>>              cairo_region_destroy (opaque_region);
>>
>>   diff --git a/gdk/x11/Makefile.am b/gdk/x11/Makefile.am
>> -index c488a31..d0aa7ce 100644
>> +index c488a31..4ce3c07 100644
>>   --- a/gdk/x11/Makefile.am
>>   +++ b/gdk/x11/Makefile.am
>>   @@ -39,8 +39,6 @@ libgdk_x11_la_SOURCES =     \
>> @@ -424,7 +414,7 @@ index c488a31..d0aa7ce 100644
>>         gdkkeys-x11.c           \
>>         gdkmain-x11.c           \
>>         gdkproperty-x11.c       \
>> -@@ -53,14 +51,30 @@ libgdk_x11_la_SOURCES =    \
>> +@@ -53,14 +51,32 @@ libgdk_x11_la_SOURCES =    \
>>         gdkwindow-x11.h         \
>>         gdkxftdefaults.c        \
>>         gdkxid.c                \
>> @@ -450,13 +440,15 @@ index c488a31..d0aa7ce 100644
>>   +
>>   +BUILT_SOURCES = gdkx.h
>>   +
>> ++.PHONY: gdkx.h
>>   +gdkx.h:
>> -+      $(AM_V_GEN) cd $(srcdir) && cp $(GDKX_HEADER) gdkx.h
>> ++      $(AM_V_GEN) cd $(srcdir) \
>> ++      && (cmp -s $(GDKX_HEADER) gdkx.h || cp $(GDKX_HEADER) gdkx.h )
>>   +
>>    libgdkx11include_HEADERS =   \
>>         gdkx-autocleanups.h     \
>>         gdkx11applaunchcontext.h \
>> -@@ -74,7 +88,6 @@ libgdkx11include_HEADERS =   \
>> +@@ -74,7 +90,6 @@ libgdkx11include_HEADERS =   \
>>         gdkx11display.h         \
>>         gdkx11displaymanager.h  \
>>         gdkx11dnd.h             \
>> @@ -464,7 +456,7 @@ index c488a31..d0aa7ce 100644
>>         gdkx11keys.h            \
>>         gdkx11property.h        \
>>         gdkx11screen.h          \
>> -@@ -83,9 +96,16 @@ libgdkx11include_HEADERS =  \
>> +@@ -83,9 +98,16 @@ libgdkx11include_HEADERS =  \
>>         gdkx11visual.h          \
>>         gdkx11window.h
>>
>> @@ -482,7 +474,7 @@ index c488a31..d0aa7ce 100644
>>   +
>>    -include $(top_srcdir)/git.mk
>>   diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c
>> -index 5816d18..5d2dae6 100644
>> +index de91c64..42d50f6 100644
>>   --- a/gdk/x11/gdkdisplay-x11.c
>>   +++ b/gdk/x11/gdkdisplay-x11.c
>>   @@ -37,7 +37,9 @@
>> @@ -495,19 +487,19 @@ index 5816d18..5d2dae6 100644
>>    #include "gdk-private.h"
>>
>>    #include <glib.h>
>> -@@ -2989,8 +2991,8 @@ gdk_x11_display_class_init (GdkX11DisplayClass *
>> class)
>> -   display_class->convert_selection = _gdk_x11_display_convert_selection;
>> +@@ -2959,7 +2961,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass *
>> class)
>>      display_class->text_property_to_utf8_list =
>> _gdk_x11_display_text_property_to_utf8_list;
>>      display_class->utf8_to_string_target =
>> _gdk_x11_display_utf8_to_string_target;
>> --
>> +
>> +-  display_class->make_gl_context_current =
>> gdk_x11_display_make_gl_context_current;
>>   +#ifdef HAVE_OPENGL
>> -   display_class->make_gl_context_current =
>> gdk_x11_display_make_gl_context_current;
>> --
>> ++   display_class->make_gl_context_current =
>> gdk_x11_display_make_gl_context_current;
>>   +#endif
>> -   _gdk_x11_windowing_init ();
>> - }
>> +
>> +   display_class->get_default_seat = gdk_x11_display_get_default_seat;
>> +
>>   diff --git a/gdk/x11/gdkscreen-x11.c b/gdk/x11/gdkscreen-x11.c
>> -index 2bd7f28..30032e0 100644
>> +index 9d8ed20..bd46b00 100644
>>   --- a/gdk/x11/gdkscreen-x11.c
>>   +++ b/gdk/x11/gdkscreen-x11.c
>>   @@ -1968,3 +1968,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen
>> *screen)
>> @@ -520,7 +512,7 @@ index 2bd7f28..30032e0 100644
>>   +void _gdk_x11_screen_update_visuals_for_gl (GdkScreen *screen) {}
>>   +#endif
>>   diff --git a/gdk/x11/gdkwindow-x11.c b/gdk/x11/gdkwindow-x11.c
>> -index d08cee0..d354628 100644
>> +index 9ed087a..30d6eb7 100644
>>   --- a/gdk/x11/gdkwindow-x11.c
>>   +++ b/gdk/x11/gdkwindow-x11.c
>>   @@ -36,7 +36,9 @@
>> @@ -533,7 +525,7 @@ index d08cee0..d354628 100644
>>    #include "gdkprivate-x11.h"
>>    #include "gdk-private.h"
>>
>> -@@ -5768,7 +5770,9 @@ gdk_window_impl_x11_class_init
>> (GdkWindowImplX11Class *klass)
>> +@@ -5782,7 +5784,9 @@ gdk_window_impl_x11_class_init
>> (GdkWindowImplX11Class *klass)
>>      impl_class->set_opaque_region = gdk_x11_window_set_opaque_region;
>>      impl_class->set_shadow_width = gdk_x11_window_set_shadow_width;
>>      impl_class->show_window_menu = gdk_x11_window_show_window_menu;
>> @@ -557,71 +549,10 @@ index edb0ea7..a317d61 100644
>>    G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Keymap, g_object_unref)
>>    G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Screen, g_object_unref)
>>    G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Visual, g_object_unref)
>> -diff --git a/gdk/x11/gdkx-with-gl-context.h
>> b/gdk/x11/gdkx-with-gl-context.h
>> -new file mode 100644
>> -index 0000000..ae05fa6
>> ---- /dev/null
>> -+++ b/gdk/x11/gdkx-with-gl-context.h
>> -@@ -0,0 +1,59 @@
>> -+/* GDK - The GIMP Drawing Kit
>> -+ * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh
>> MacDonald
>> -+ *
>> -+ * This library is free software; you can redistribute it and/or
>> -+ * modify it under the terms of the GNU Lesser General Public
>> -+ * License as published by the Free Software Foundation; either
>> -+ * version 2 of the License, or (at your option) any later version.
>> -+ *
>> -+ * This library is distributed in the hope that it will be useful,
>> -+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> -+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> -+ * Lesser General Public License for more details.
>> -+ *
>> -+ * You should have received a copy of the GNU Lesser General Public
>> -+ * License along with this library. If not, see <
>> http://www.gnu.org/licenses/>.
>> -+ */
>> -+
>> -+/*
>> -+ * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
>> -+ * file for a list of people on the GTK+ Team.  See the ChangeLog
>> -+ * files for a list of changes.  These files are distributed with
>> -+ * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
>> -+ */
>> -+
>> -+#ifndef __GDK_X_H__
>> -+#define __GDK_X_H__
>> -+
>> -+#include <gdk/gdk.h>
>> -+
>> -+#include <X11/Xlib.h>
>> -+#include <X11/Xutil.h>
>> -+
>> -+#define __GDKX_H_INSIDE__
>> -+
>> -+#include <gdk/x11/gdkx11applaunchcontext.h>
>> -+#include <gdk/x11/gdkx11cursor.h>
>> -+#include <gdk/x11/gdkx11device.h>
>> -+#include <gdk/x11/gdkx11device-core.h>
>> -+#include <gdk/x11/gdkx11device-xi2.h>
>> -+#include <gdk/x11/gdkx11devicemanager.h>
>> -+#include <gdk/x11/gdkx11devicemanager-core.h>
>> -+#include <gdk/x11/gdkx11devicemanager-xi2.h>
>> -+#include <gdk/x11/gdkx11display.h>
>> -+#include <gdk/x11/gdkx11displaymanager.h>
>> -+#include <gdk/x11/gdkx11dnd.h>
>> -+#include <gdk/x11/gdkx11glcontext.h>
>> -+#include <gdk/x11/gdkx11keys.h>
>> -+#include <gdk/x11/gdkx11property.h>
>> -+#include <gdk/x11/gdkx11screen.h>
>> -+#include <gdk/x11/gdkx11selection.h>
>> -+#include <gdk/x11/gdkx11utils.h>
>> -+#include <gdk/x11/gdkx11visual.h>
>> -+#include <gdk/x11/gdkx11window.h>
>> -+
>> -+#include <gdk/x11/gdkx-autocleanups.h>
>> -+
>> -+#undef __GDKX_H_INSIDE__
>> -+
>> -+#endif /* __GDK_X_H__ */
>> +diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx-with-gl-context.h
>> +similarity index 100%
>> +rename from gdk/x11/gdkx.h
>> +rename to gdk/x11/gdkx-with-gl-context.h
>>   diff --git a/gdk/x11/gdkx-without-gl-context.h
>> b/gdk/x11/gdkx-without-gl-context.h
>>   new file mode 100644
>>   index 0000000..c9e2617
>> @@ -686,76 +617,11 @@ index 0000000..c9e2617
>>   +#undef __GDKX_H_INSIDE__
>>   +
>>   +#endif /* __GDK_X_H__ */
>> -diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx.h
>> -deleted file mode 100644
>> -index ae05fa6..0000000
>> ---- a/gdk/x11/gdkx.h
>> -+++ /dev/null
>> -@@ -1,59 +0,0 @@
>> --/* GDK - The GIMP Drawing Kit
>> -- * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh
>> MacDonald
>> -- *
>> -- * This library is free software; you can redistribute it and/or
>> -- * modify it under the terms of the GNU Lesser General Public
>> -- * License as published by the Free Software Foundation; either
>> -- * version 2 of the License, or (at your option) any later version.
>> -- *
>> -- * This library is distributed in the hope that it will be useful,
>> -- * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> -- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> -- * Lesser General Public License for more details.
>> -- *
>> -- * You should have received a copy of the GNU Lesser General Public
>> -- * License along with this library. If not, see <
>> http://www.gnu.org/licenses/>.
>> -- */
>> --
>> --/*
>> -- * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
>> -- * file for a list of people on the GTK+ Team.  See the ChangeLog
>> -- * files for a list of changes.  These files are distributed with
>> -- * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
>> -- */
>> --
>> --#ifndef __GDK_X_H__
>> --#define __GDK_X_H__
>> --
>> --#include <gdk/gdk.h>
>> --
>> --#include <X11/Xlib.h>
>> --#include <X11/Xutil.h>
>> --
>> --#define __GDKX_H_INSIDE__
>> --
>> --#include <gdk/x11/gdkx11applaunchcontext.h>
>> --#include <gdk/x11/gdkx11cursor.h>
>> --#include <gdk/x11/gdkx11device.h>
>> --#include <gdk/x11/gdkx11device-core.h>
>> --#include <gdk/x11/gdkx11device-xi2.h>
>> --#include <gdk/x11/gdkx11devicemanager.h>
>> --#include <gdk/x11/gdkx11devicemanager-core.h>
>> --#include <gdk/x11/gdkx11devicemanager-xi2.h>
>> --#include <gdk/x11/gdkx11display.h>
>> --#include <gdk/x11/gdkx11displaymanager.h>
>> --#include <gdk/x11/gdkx11dnd.h>
>> --#include <gdk/x11/gdkx11glcontext.h>
>> --#include <gdk/x11/gdkx11keys.h>
>> --#include <gdk/x11/gdkx11property.h>
>> --#include <gdk/x11/gdkx11screen.h>
>> --#include <gdk/x11/gdkx11selection.h>
>> --#include <gdk/x11/gdkx11utils.h>
>> --#include <gdk/x11/gdkx11visual.h>
>> --#include <gdk/x11/gdkx11window.h>
>> --
>> --#include <gdk/x11/gdkx-autocleanups.h>
>> --
>> --#undef __GDKX_H_INSIDE__
>> --
>> --#endif /* __GDK_X_H__ */
>>   diff --git a/gtk/Makefile.am b/gtk/Makefile.am
>> -index 801c3a5..2d8839d 100644
>> +index 6a53a2b..49a35e6 100644
>>   --- a/gtk/Makefile.am
>>   +++ b/gtk/Makefile.am
>> -@@ -1246,14 +1246,13 @@ gtkprivatetypebuiltins.c:
>> $(gtk_private_type_h_sources)  gtkprivatetypebuiltins.
>> +@@ -1351,14 +1351,13 @@ gtkprivatetypebuiltins.c:
>> $(gtk_private_type_h_sources)  gtkprivatetypebuiltins.
>>         && cp xgen-gptbc gtkprivatetypebuiltins.c  \
>>         && rm -f xgen-gptbc
>>
>> @@ -772,7 +638,7 @@ index 801c3a5..2d8839d 100644
>>    gtktestutils.c: gtktypefuncs.c
>>
>>   diff --git a/gtk/gtkglarea.c b/gtk/gtkglarea.c
>> -index 4098409..45fa1d1 100644
>> +index 245fc6b..4214ad1 100644
>>   --- a/gtk/gtkglarea.c
>>   +++ b/gtk/gtkglarea.c
>>   @@ -28,7 +28,9 @@
>> @@ -868,7 +734,7 @@ index 4098409..45fa1d1 100644
>>
>>    static gboolean
>>   diff --git a/gtk/inspector/general.c b/gtk/inspector/general.c
>> -index 0611373..4499a29 100644
>> +index 4eab3a7..c4e900e 100644
>>   --- a/gtk/inspector/general.c
>>   +++ b/gtk/inspector/general.c
>>   @@ -33,8 +33,10 @@
>> @@ -882,7 +748,7 @@ index 0611373..4499a29 100644
>>
>>    #ifdef GDK_WINDOWING_WIN32
>>    #include "win32/gdkwin32.h"
>> -@@ -146,6 +148,7 @@ append_extension_row (GtkInspectorGeneral *gen,
>> +@@ -147,6 +149,7 @@ append_extension_row (GtkInspectorGeneral *gen,
>>      gtk_size_group_add_widget (GTK_SIZE_GROUP (gen->priv->labels),
>> label);
>>    }
>>
>> @@ -890,7 +756,7 @@ index 0611373..4499a29 100644
>>    #ifdef GDK_WINDOWING_X11
>>    static void
>>    append_glx_extension_row (GtkInspectorGeneral *gen,
>> -@@ -155,6 +158,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,
>> +@@ -156,6 +159,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,
>>      append_extension_row (gen, ext, epoxy_has_glx_extension (dpy, 0,
>> ext));
>>    }
>>    #endif
>> @@ -898,27 +764,27 @@ index 0611373..4499a29 100644
>>
>>    #ifdef GDK_WINDOWING_WAYLAND
>>    static void
>> -@@ -174,6 +178,7 @@ init_gl (GtkInspectorGeneral *gen)
>> -
>> -   display = gdk_display_get_default ();
>> -
>> +@@ -171,6 +175,7 @@ append_egl_extension_row (GtkInspectorGeneral *gen,
>> + static void
>> + init_gl (GtkInspectorGeneral *gen)
>> + {
>>   +#ifdef HAVE_OPENGL
>>    #ifdef GDK_WINDOWING_X11
>> -   if (GDK_IS_X11_DISPLAY (display))
>> +   if (GDK_IS_X11_DISPLAY (gdk_display_get_default ()))
>>        {
>> -@@ -199,6 +204,7 @@ init_gl (GtkInspectorGeneral *gen)
>> +@@ -197,6 +202,7 @@ init_gl (GtkInspectorGeneral *gen)
>>        }
>>      else
>>    #endif
>>   +#endif
>>    #ifdef GDK_WINDOWING_WAYLAND
>> -   if (GDK_IS_WAYLAND_DISPLAY (display))
>> +   if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))
>>        {
>>   diff --git a/tests/Makefile.am b/tests/Makefile.am
>> -index 50f2986..3b39169 100644
>> +index 681807d..2941a36 100644
>>   --- a/tests/Makefile.am
>>   +++ b/tests/Makefile.am
>> -@@ -78,8 +78,6 @@ noinst_PROGRAMS =  $(TEST_PROGS)     \
>> +@@ -80,8 +80,6 @@ noinst_PROGRAMS =  $(TEST_PROGS)     \
>>         testfullscreen                  \
>>         testgeometry                    \
>>         testgiconpixbuf                 \
>> @@ -927,18 +793,19 @@ index 50f2986..3b39169 100644
>>         testgrid                        \
>>         testgtk                         \
>>         testheaderbar                   \
>> -@@ -166,10 +164,16 @@ noinst_PROGRAMS =  $(TEST_PROGS) \
>> +@@ -169,11 +167,17 @@ noinst_PROGRAMS =  $(TEST_PROGS) \
>>         testactionbar                   \
>>         testwindowsize                  \
>>         testpopover                     \
>>   -     gdkgears                        \
>>         listmodel                       \
>> +       testpopup                       \
>>         $(NULL)
>>
>>   +if HAVE_OPENGL
>>   +noinst_PROGRAMS +=
>> -+      testglarea                      \
>> -+      testglblending                  \
>> ++      testglarea                      \
>> ++      testglblending                  \
>>   +     gdkgears
>>   +endif
>>   +
>> @@ -946,11 +813,11 @@ index 50f2986..3b39169 100644
>>    noinst_PROGRAMS += testerrors
>>    endif
>>   diff --git a/testsuite/gtk/objects-finalize.c
>> b/testsuite/gtk/objects-finalize.c
>> -index 3568505..682ea10 100644
>> +index e0ebee0..703643c 100644
>>   --- a/testsuite/gtk/objects-finalize.c
>>   +++ b/testsuite/gtk/objects-finalize.c
>> -@@ -114,8 +114,10 @@ main (int argc, char **argv)
>> -         all_types[i] != GDK_TYPE_X11_DISPLAY &&
>> +@@ -115,8 +115,10 @@ main (int argc, char **argv)
>> +         all_types[i] != GDK_TYPE_X11_DEVICE_MANAGER_CORE &&
>>           all_types[i] != GDK_TYPE_X11_DEVICE_MANAGER_XI2 &&
>>           all_types[i] != GDK_TYPE_X11_DISPLAY_MANAGER &&
>>   +#ifdef HAVE_OPENGL
>> @@ -961,5 +828,5 @@ index 3568505..682ea10 100644
>>           all_types[i] != GDK_TYPE_PIXBUF_LOADER &&
>>           all_types[i] != gdk_pixbuf_simple_anim_iter_get_type())
>>   --
>> -2.8.1
>> +2.1.4
>>
>> diff --git
>> a/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch
>> b/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch
>> new file mode 100644
>> index 0000000..634b3a4
>> --- /dev/null
>> +++
>> b/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch
>> @@ -0,0 +1,36 @@
>> +From 97b78e566634579bbae51be914aeaaa921137a8b Mon Sep 17 00:00:00 2001
>> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> +Date: Thu, 9 Jun 2016 11:21:36 +0300
>> +Subject: [PATCH 4/4] configure.ac: Fix wayland-protocols path
>> +
>> +The wayland-protocols directory is used during build: Fix the path
>> +to point to sysroot specified in recipe.
>> +
>> +Normally PKG_CONFIG_SYSROOT_DIR could be used in configure.ac but that
>> +breaks multilib gtk+ as it would point to multilib sysroot when the
>> +(allarch) wayland-protocols is actually in the machine sysroot.
>> +
>> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> +Upstream-Status: Inappropriate [embedded specific]
>> +
>> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> +---
>> + configure.ac | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index a3e9beb..dde9dc5 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -461,7 +461,7 @@ fi
>> + if test "$enable_wayland_backend" = "yes"; then
>> +   # For the cairo image backend
>> +   cairo_backends="$cairo_backends cairo"
>> +-  AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, `$PKG_CONFIG
>> --variable=pkgdatadir wayland-protocols`)
>> ++  AC_SUBST(WAYLAND_PROTOCOLS_DATADIR,
>> ${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir
>> wayland-protocols`)
>> +   GDK_BACKENDS="$GDK_BACKENDS wayland"
>> +   GDK_WINDOWING="$GDK_WINDOWING
>> + #define GDK_WINDOWING_WAYLAND"
>> +--
>> +2.1.4
>> +
>> diff --git a/meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch
>> b/meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch
>> deleted file mode 100644
>> index 32d8a84..0000000
>> --- a/meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch
>> +++ /dev/null
>> @@ -1,118 +0,0 @@
>> -window: Check if we can use CSD before enabling them
>> -
>> -Upstream-Status: Backport
>> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> -
>> -
>> -From c5e5ee67490e7e7af56052d8f8beb75db002c2f1 Mon Sep 17 00:00:00 2001
>> -From: Emmanuele Bassi <ebassi@gnome.org>
>> -Date: Wed, 3 Jun 2015 14:07:29 +0100
>> -Subject: window: Check if we can use CSD before enabling them
>> -
>> -The change in 03213b9509fc1df16c66194ea168aed6c15110e9 changed the rules
>> -as to when CSD can be enabled, but it also unconditionally enables CSD
>> -with the implicit assumption that client-side shadows were the real
>> -issue, and that we could work around that by drawing our own borders.
>> -This also means that setting a titlebar for a GtkWindow will enable CSD
>> -unconditionally.
>> -
>> -In reality, some window managers (like Matchbox) *only* support
>> -server-side decorations, and will ignore all hints to the contrary, to
>> -the point of drawing decorations at random locations on top of the
>> -window.
>> -
>> -Since CSD are enabled unconditionally, the GTK_CSD environment variable
>> -is also not a suitable escape hatch.
>> -
>> -In the grand tradition of asking ourselves if we should do something
>> -just because we can, we should split the environment checks from the
>> -checks on what the user requested; by doing that, we can also check
>> -when enabling client-side decorations, and ideally bail out if needed.
>> -
>> -https://bugzilla.gnome.org/show_bug.cgi?id=750343
>> -
>> -diff --git a/gtk/gtkwindow.c b/gtk/gtkwindow.c
>> -index 423c6bd..9fe882f 100644
>> ---- a/gtk/gtkwindow.c
>> -+++ b/gtk/gtkwindow.c
>> -@@ -4056,6 +4056,32 @@ gtk_window_supports_client_shadow (GtkWindow
>> *window)
>> -   return TRUE;
>> - }
>> -
>> -+static gboolean
>> -+gtk_window_can_use_csd (GtkWindow *window)
>> -+{
>> -+  const gchar *csd_env;
>> -+
>> -+#ifdef GDK_WINDOWING_BROADWAY
>> -+  if (GDK_IS_BROADWAY_DISPLAY (gtk_widget_get_display (GTK_WIDGET
>> (window))))
>> -+    return TRUE;
>> -+#endif
>> -+
>> -+#ifdef GDK_WINDOWING_WAYLAND
>> -+  if (GDK_IS_WAYLAND_DISPLAY (gtk_widget_get_display (GTK_WIDGET
>> (window))))
>> -+    return TRUE;
>> -+#endif
>> -+
>> -+#ifdef GDK_WINDOWING_MIR
>> -+  if (GDK_IS_MIR_DISPLAY (gtk_widget_get_display (GTK_WIDGET (window))))
>> -+    return TRUE;
>> -+#endif
>> -+
>> -+  csd_env = g_getenv ("GTK_CSD");
>> -+
>> -+  /* If GTK_CSD is unset we default to CSD support */
>> -+  return csd_env == NULL || (strcmp (csd_env, "1") == 0);
>> -+}
>> -+
>> - static void
>> - gtk_window_enable_csd (GtkWindow *window)
>> - {
>> -@@ -4063,6 +4089,10 @@ gtk_window_enable_csd (GtkWindow *window)
>> -   GtkWidget *widget = GTK_WIDGET (window);
>> -   GdkVisual *visual;
>> -
>> -+  /* If the environment does not support CSD, then there's no point in
>> enabling them */
>> -+  if (!gtk_window_can_use_csd (window))
>> -+    return;
>> -+
>> -   /* We need a visual with alpha for client shadows */
>> -   if (priv->use_client_shadow)
>> -     {
>> -@@ -5839,7 +5869,6 @@ static gboolean
>> - gtk_window_should_use_csd (GtkWindow *window)
>> - {
>> -   GtkWindowPrivate *priv = window->priv;
>> --  const gchar *csd_env;
>> -
>> -   if (priv->csd_requested)
>> -     return TRUE;
>> -@@ -5850,24 +5879,7 @@ gtk_window_should_use_csd (GtkWindow *window)
>> -   if (priv->type == GTK_WINDOW_POPUP)
>> -     return FALSE;
>> -
>> --#ifdef GDK_WINDOWING_BROADWAY
>> --  if (GDK_IS_BROADWAY_DISPLAY (gtk_widget_get_display (GTK_WIDGET
>> (window))))
>> --    return TRUE;
>> --#endif
>> --
>> --#ifdef GDK_WINDOWING_WAYLAND
>> --  if (GDK_IS_WAYLAND_DISPLAY (gtk_widget_get_display (GTK_WIDGET
>> (window))))
>> --    return TRUE;
>> --#endif
>> --
>> --#ifdef GDK_WINDOWING_MIR
>> --  if (GDK_IS_MIR_DISPLAY (gtk_widget_get_display (GTK_WIDGET (window))))
>> --    return TRUE;
>> --#endif
>> --
>> --  csd_env = g_getenv ("GTK_CSD");
>> --
>> --  return (g_strcmp0 (csd_env, "1") == 0);
>> -+  return gtk_window_can_use_csd (window);
>> - }
>> -
>> - static void
>> ---
>> -cgit v0.10.2
>> -
>> diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.18.8.bb
>> b/meta/recipes-gnome/gtk+/gtk+3_3.20.6.bb
>> similarity index 57%
>> rename from meta/recipes-gnome/gtk+/gtk+3_3.18.8.bb
>> rename to meta/recipes-gnome/gtk+/gtk+3_3.20.6.bb
>> index d776b6d..453a4e2 100644
>> --- a/meta/recipes-gnome/gtk+/gtk+3_3.18.8.bb
>> +++ b/meta/recipes-gnome/gtk+/gtk+3_3.20.6.bb
>> @@ -3,14 +3,13 @@ require gtk+3.inc
>>   MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>>
>>   SRC_URI = "
>> http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz
>> <http://ftp.gnome.org/pub/gnome/sources/gtk+/$%7BMAJ_VER%7D/gtk+-$%7BPV%7D.tar.xz>
>> \
>> -           file://hardcoded_libtool.patch \
>> -           file://Dont-force-csd.patch \
>> -           file://Do-not-try-to-initialize-GL-without-libGL.patch \
>> -           file://0001-Add-disable-opengl-configure-option.patch \
>> +           file://0001-Hardcoded-libtool.patch \
>> +           file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
>> +           file://0003-Add-disable-opengl-configure-option.patch \
>> +           file://0004-configure.ac-Fix-wayland-protocols-path.patch \
>>             "
>> -
>> -SRC_URI[md5sum] = "9671acb41dc13561d19233f1a75cf184"
>> -SRC_URI[sha256sum] =
>> "1c53ef1bb55364698f7183ecd185b547f92f4a3a7abfafd531400232e2e052f8"
>> +SRC_URI[md5sum] = "914e55ea053161f4a575c1c8dade7954"
>> +SRC_URI[sha256sum] =
>> "3f8016563a96b1cfef4ac9e795647f6316deb2978ff939b19e4e4f8f936fa4b2"
>>
>>   S = "${WORKDIR}/gtk+-${PV}"
>>
>> diff --git a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.18.8.bb
>> b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.20.6.bb
>> similarity index 93%
>> rename from meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.18.8.bb
>> rename to meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.20.6.bb
>> index 793f14a..e870ba3 100644
>> --- a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.18.8.bb
>> +++ b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.20.6.bb
>> @@ -10,8 +10,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>>
>>   SRC_URI = "
>> http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz
>> <http://ftp.gnome.org/pub/gnome/sources/gtk+/$%7BMAJ_VER%7D/gtk+-$%7BPV%7D.tar.xz>
>> \
>>
>> file://Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch"
>> -SRC_URI[md5sum] = "9671acb41dc13561d19233f1a75cf184"
>> -SRC_URI[sha256sum] =
>> "1c53ef1bb55364698f7183ecd185b547f92f4a3a7abfafd531400232e2e052f8"
>> +SRC_URI[md5sum] = "914e55ea053161f4a575c1c8dade7954"
>> +SRC_URI[sha256sum] =
>> "3f8016563a96b1cfef4ac9e795647f6316deb2978ff939b19e4e4f8f936fa4b2"
>>
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2
>> \
>>
>> file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
>>
>>

--001a11c1729ac8cdea0536e3fd14
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 5 July 2016 at 16:09, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Hi,<br>
<br>
I can&#39;t build it on Ubuntu 14.04:<br></blockquote><div><br></div><div>I=
 can&#39;t see from the log why the file would be be missing and can&#39;t =
reproduce that locally... Cleaning sstate should be a valid workaround but =
I&#39;d be really interested in reproducing this: if you can reproduce (or =
remember if you did any =C2=A0distro feature or =C2=A0packageconfig changes=
) please let me know the details.</div><div><br></div><div>In the meantime =
I&#39;ll take another look at the build system...</div><div><br></div><div>=
Thanks,=C2=A0</div><div>=C2=A0 Jussi</div><div>=C2=A0</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
MACHINE =3D &quot;qemux86&quot;<br>
<br>
$ bitbake gtk+3<br>
<br>
Making all in po-properties<br>
make[2]: Entering directory &#39;/buildarea/lyang1/test_qemux86/bitbake_bui=
ld/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/po-properties&#39;<br>
make[2]: Nothing to be done for &#39;all&#39;.<br>
make[2]: Leaving directory &#39;/buildarea/lyang1/test_qemux86/bitbake_buil=
d/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/po-properties&#39;<br>
Making all in gdk<br>
make[2]: Entering directory &#39;/buildarea/lyang1/test_qemux86/bitbake_bui=
ld/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/gdk&#39;<br>
( cd ../../gtk+-3.20.6/gdk &amp;&amp; glib-mkenums --template gdkenumtypes.=
h.template \<br>
=C2=A0 =C2=A0 gdk.h gdk-autocleanup.h gdkapplaunchcontext.h gdkcairo.h gdkc=
ursor.h gdkdevice.h gdkdevicemanager.h gdkdisplay.h gdkdisplaymanager.h gdk=
dnd.h gdkevents.h gdkframetimings.h gdkglcontext.h gdkkeys.h gdkkeysyms.h g=
dkkeysyms-compat.h gdkmain.h gdkpango.h gdkframeclock.h gdkpixbuf.h gdkpriv=
ate.h gdkproperty.h gdkrectangle.h gdkrgba.h gdkscreen.h gdkseat.h gdkselec=
tion.h gdktestutils.h gdkthreads.h gdktypes.h gdkvisual.h gdkwindow.h depre=
cated/gdkcolor.h ) &gt;&gt; xgen-geth \<br>
&amp;&amp; (cmp -s xgen-geth gdkenumtypes.h || cp xgen-geth gdkenumtypes.h =
) \<br>
&amp;&amp; rm -f xgen-geth \<br>
&amp;&amp; echo timestamp &gt; stamp-gdkenumtypes.h<br>
cd .. &amp;&amp; /bin/sh ./config.status gdk/gdkconfig.h \<br>
&amp;&amp; echo timestamp &gt; gdk/stamp-gc-h<br>
config.status: executing gdk/gdkconfig.h commands<br>
config.status: gdk/gdkconfig.h is unchanged<br>
if test -f gdkconfig.h; then :; \<br>
else rm -f stamp-gc-h; make stamp-gc-h; fi<br>
make=C2=A0 all-recursive<br>
make[3]: Entering directory &#39;/buildarea/lyang1/test_qemux86/bitbake_bui=
ld/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/gdk&#39;<br>
Making all in x11<br>
make[4]: Entering directory &#39;/buildarea/lyang1/test_qemux86/bitbake_bui=
ld/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/gdk/x11&#39;<br>
cd ../../../gtk+-3.20.6/gdk/x11 \<br>
&amp;&amp; (cmp -s gdkx-with-gl-context.h gdkx.h || cp gdkx-with-gl-context=
.h gdkx.h )<br>
cp: cannot stat &#39;gdkx-with-gl-context.h&#39;: No such file or directory=
<br>
Makefile:1014: recipe for target &#39;gdkx.h&#39; failed<br>
make[4]: *** [gdkx.h] Error 1<br>
make[4]: Leaving directory &#39;/buildarea/lyang1/test_qemux86/bitbake_buil=
d/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/gdk/x11&#39;<br>
Makefile:1460: recipe for target &#39;all-recursive&#39; failed<br>
make[3]: *** [all-recursive] Error 1<br>
make[3]: Leaving directory &#39;/buildarea/lyang1/test_qemux86/bitbake_buil=
d/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/gdk&#39;<br>
Makefile:951: recipe for target &#39;all&#39; failed<br>
make[2]: *** [all] Error 2<br>
make[2]: Leaving directory &#39;/buildarea/lyang1/test_qemux86/bitbake_buil=
d/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build/gdk&#39;<br>
Makefile:713: recipe for target &#39;all-recursive&#39; failed<br>
make[1]: *** [all-recursive] Error 1<br>
make[1]: Leaving directory &#39;/buildarea/lyang1/test_qemux86/bitbake_buil=
d/tmp/work/i586-wrs-linux/gtk+3/3.20.6-r0/build&#39;<br>
Makefile:607: recipe for target &#39;all&#39; failed<br>
make: *** [all] Error 2<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
// Robert</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 06/22/2016 07:52 PM, Jussi Kukkonen wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
* Remove a patch that&#39;s no longer needed (as we don&#39;t<br>
=C2=A0 =C2=A0have a problem with client side decorations anymore)<br>
* Wayland build now depends on wayland-protocols:<br>
=C2=A0 =C2=A0Use same WAYLAND_PROTOCOLS_SYSROOT_DIR trick as weston so<br>
=C2=A0 =C2=A0protocols are found and multilib build does not break<br>
* Add new binary gtk-query-settings to -dev package<br>
* Rebase patches<br>
* Modify 0003-Add-disable-opengl-configure-option.patch so<br>
=C2=A0 =C2=A0that gdkx.h really is generated whenever it changes<br>
<br>
Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.co=
m" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
---<br>
=C2=A0 meta/recipes-gnome/gtk+/gtk+3.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +-<br>
=C2=A0 ..._libtool.patch =3D&gt; 0001-Hardcoded-libtool.patch} |=C2=A0 26 +=
-<br>
=C2=A0 ...o-not-try-to-initialize-GL-without-libGL.patch} |=C2=A0 12 +-<br>
=C2=A0 ...0003-Add-disable-opengl-configure-option.patch} | 327 ++++++-----=
----------<br>
=C2=A0 ...4-configure.ac-Fix-wayland-protocols-path.patch |=C2=A0 36 +++<br=
>
=C2=A0 meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch | 118 --------<br=
>
=C2=A0 .../gtk+/{gtk+<a href=3D"http://3_3.18.8.bb" rel=3D"noreferrer" targ=
et=3D"_blank">3_3.18.8.bb</a> =3D&gt; gtk+<a href=3D"http://3_3.20.6.bb" re=
l=3D"noreferrer" target=3D"_blank">3_3.20.6.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 13 +-<br>
=C2=A0 ...<a href=3D"http://e_3.18.8.bb" rel=3D"noreferrer" target=3D"_blan=
k">e_3.18.8.bb</a> =3D&gt; <a href=3D"http://gtk-icon-utils-native_3.20.6.b=
b" rel=3D"noreferrer" target=3D"_blank">gtk-icon-utils-native_3.20.6.bb</a>=
} |=C2=A0 =C2=A04 +-<br>
=C2=A0 8 files changed, 173 insertions(+), 372 deletions(-)<br>
=C2=A0 rename meta/recipes-gnome/gtk+/gtk+3/{hardcoded_libtool.patch =3D&gt=
; 0001-Hardcoded-libtool.patch} (70%)<br>
=C2=A0 rename meta/recipes-gnome/gtk+/gtk+3/{Do-not-try-to-initialize-GL-wi=
thout-libGL.patch =3D&gt; 0002-Do-not-try-to-initialize-GL-without-libGL.pa=
tch} (86%)<br>
=C2=A0 rename meta/recipes-gnome/gtk+/gtk+3/{0001-Add-disable-opengl-config=
ure-option.patch =3D&gt; 0003-Add-disable-opengl-configure-option.patch} (7=
1%)<br>
=C2=A0 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-F=
ix-wayland-protocols-path.patch<br>
=C2=A0 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patc=
h<br>
=C2=A0 rename meta/recipes-gnome/gtk+/{gtk+<a href=3D"http://3_3.18.8.bb" r=
el=3D"noreferrer" target=3D"_blank">3_3.18.8.bb</a> =3D&gt; gtk+<a href=3D"=
http://3_3.20.6.bb" rel=3D"noreferrer" target=3D"_blank">3_3.20.6.bb</a>} (=
57%)<br>
=C2=A0 rename meta/recipes-gnome/gtk+/{<a href=3D"http://gtk-icon-utils-nat=
ive_3.18.8.bb" rel=3D"noreferrer" target=3D"_blank">gtk-icon-utils-native_3=
.18.8.bb</a> =3D&gt; <a href=3D"http://gtk-icon-utils-native_3.20.6.bb" rel=
=3D"noreferrer" target=3D"_blank">gtk-icon-utils-native_3.20.6.bb</a>} (93%=
)<br>
<br>
diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gt=
k+3.inc<br>
index 959fb44..0de114d 100644<br>
--- a/meta/recipes-gnome/gtk+/gtk+3.inc<br>
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc<br>
@@ -31,7 +31,9 @@ EXTRA_OECONF +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enab=
le-modules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disa=
ble-cups \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disa=
ble-colord \<br>
-&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WAYLAND_PROT=
OCOLS_SYSROOT_DIR=3D${STAGING_DIR}/${MACHINE} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+EXTRA_OECONF[vardepsexclude] =3D &quot;MACHINE&quot;<br>
<br>
=C2=A0 do_compile_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export GIR_EXTRA_LIBS_PATH=3D&quot;${B}/=
gdk/.libs&quot;<br>
@@ -46,7 +48,7 @@ PACKAGECONFIG[x11] =3D &quot;--enable-x11-backend,--disab=
le-x11-backend,at-spi2-atk fon<br>
=C2=A0 # this is provided by oe-core patch that removes epoxy/gl dependency=
 from a X11 build<br>
=C2=A0 PACKAGECONFIG[opengl] =3D &quot;--enable-opengl,--disable-opengl,lib=
epoxy&quot;<br>
=C2=A0 PACKAGECONFIG[glx] =3D &quot;--enable-glx,--disable-glx,,libgl&quot;=
<br>
-PACKAGECONFIG[wayland] =3D &quot;--enable-wayland-backend,--disable-waylan=
d-backend,wayland libxkbcommon virtual/mesa wayland-native&quot;<br>
+PACKAGECONFIG[wayland] =3D &quot;--enable-wayland-backend,--disable-waylan=
d-backend,wayland wayland-protocols libxkbcommon virtual/mesa wayland-nativ=
e&quot;<br>
<br>
=C2=A0 do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}${bindir}/gtk-update-icon-cache ${D}${bi=
ndir}/gtk-update-icon-cache-3.0<br>
@@ -76,6 +78,7 @@ FILES_${PN}_append =3D &quot; ${bindir}/gtk-update-icon-c=
ache-3.0 \<br>
=C2=A0 FILES_${PN}-dev +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${datadir}/gtk-3.0/gtkbuilder.rng \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${datadir}/gtk-3.0/include \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${da=
tadir}/gettext/its \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${libdir}/gtk-3.0/include \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${libdir}/gtk-3.0/${LIBV}/loaders/*.la \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${libdir}/gtk-3.0/${LIBV}/immodules/*.la \<br>
@@ -85,6 +88,7 @@ FILES_${PN}-dev +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${bindir}/gtk-builder-convert \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${bindir}/gtk-encode-symbolic-svg \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${bindir}/gtk-builder-tool \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bi=
ndir}/gtk-query-settings \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;<br>
<br>
=C2=A0 GTKBASE_RRECOMMENDS ?=3D &quot;liberation-fonts \<br>
@@ -99,6 +103,7 @@ GTKGLIBC_RRECOMMENDS ?=3D &quot;${GTKBASE_RRECOMMENDS} g=
libc-gconv-iso8859-1&quot;<br>
<br>
=C2=A0 RRECOMMENDS_${PN} =3D &quot;${GTKBASE_RRECOMMENDS}&quot;<br>
=C2=A0 RRECOMMENDS_${PN}_libc-glibc =3D &quot;${GTKGLIBC_RRECOMMENDS}&quot;=
<br>
+RRECOMMENDS_${PN}-dev +=3D &quot;wayland-protocols&quot;<br>
<br>
=C2=A0 PACKAGES_DYNAMIC +=3D &quot;^gtk3-immodule-.* ^gtk3-printbackend-.*&=
quot;<br>
<br>
diff --git a/meta/recipes-gnome/gtk+/gtk+3/hardcoded_libtool.patch b/meta/r=
ecipes-gnome/gtk+/gtk+3/0001-Hardcoded-libtool.patch<br>
similarity index 70%<br>
rename from meta/recipes-gnome/gtk+/gtk+3/hardcoded_libtool.patch<br>
rename to meta/recipes-gnome/gtk+/gtk+3/0001-Hardcoded-libtool.patch<br>
index 3b4beeb..0bda1f1 100644<br>
--- a/meta/recipes-gnome/gtk+/gtk+3/hardcoded_libtool.patch<br>
+++ b/meta/recipes-gnome/gtk+/gtk+3/0001-Hardcoded-libtool.patch<br>
@@ -1,12 +1,21 @@<br>
+From 5a73a5b92566e314bbc8a1bd40f1ec204837c111 Mon Sep 17 00:00:00 2001<br>
+From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com" targe=
t=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
+Date: Tue, 21 Jun 2016 14:53:56 +0300<br>
+Subject: [PATCH 1/4] Hardcoded libtool<br>
+<br>
=C2=A0 Upstream-Status: Inappropriate [embedded specific]<br>
<br>
=C2=A0 Signed-off-by: Marko Lindqvist &lt;<a href=3D"mailto:cazfi74@gmail.c=
om" target=3D"_blank">cazfi74@gmail.com</a>&gt;<br>
+Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 6 +++---<br>
+ 1 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
-Index: gtk+-3.8.2/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a><br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gtk+-3.8.2.orig/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a><br>
-+++ gtk+-3.8.2/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
-@@ -531,7 +531,7 @@ AC_MSG_CHECKING([Whether to write depend<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index 23d3077..b6931d6 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -610,7 +610,7 @@ AC_MSG_CHECKING([whether to write dependencies into .p=
c files])<br>
=C2=A0 =C2=A0case $enable_explicit_deps in<br>
=C2=A0 =C2=A0 =C2=A0auto)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0export SED<br>
@@ -15,7 +24,7 @@ Index: gtk+-3.8.2/<a href=3D"http://configure.ac" rel=3D"=
noreferrer" target=3D"_blank">configure.ac</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;x$deplibs_check_method&quot; !=3D =
xpass_all || test &quot;x$enable_static&quot; =3D xyes ; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enable_explicit_deps=3Dyes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-@@ -793,7 +793,7 @@ else<br>
+@@ -876,7 +876,7 @@ else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0dnl Now we check to see if our libtool supports =
shared lib deps<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0dnl (in a rather ugly way even)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0if $dynworks; then<br>
@@ -24,7 +33,7 @@ Index: gtk+-3.8.2/<a href=3D"http://configure.ac" rel=3D"=
noreferrer" target=3D"_blank">configure.ac</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0module_deplibs_check=3D`$module_li=
btool_config | \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grep &#39;^[[a-z_]]*=
check[[a-z_]]*_method=3D[[&#39;\&#39;&#39;&quot;]]&#39; | \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed &#39;s/.*[[&#39;=
\&#39;&#39;&quot;]]\(.*\)[[&#39;\&#39;&#39;&quot;]]$/\1/&#39;`<br>
-@@ -1528,7 +1528,7 @@ fi<br>
+@@ -1630,7 +1630,7 @@ AC_SUBST(GTK_PRINT_BACKENDS)<br>
=C2=A0 =C2=A0# We are using gmodule-no-export now, but I&#39;m leaving the =
stripping<br>
=C2=A0 =C2=A0# code in place for now, since pango and atk still require gmo=
dule.<br>
=C2=A0 =C2=A0export SED<br>
@@ -33,3 +42,6 @@ Index: gtk+-3.8.2/<a href=3D"http://configure.ac" rel=3D"=
noreferrer" target=3D"_blank">configure.ac</a><br>
=C2=A0 =C2=A0if test -n &quot;$export_dynamic&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0GDK_DEP_LIBS=3D`echo $GDK_DEP_LIBS | sed -e &quot;s/$ex=
port_dynamic//&quot;`<br>
=C2=A0 =C2=A0 =C2=A0GTK_DEP_LIBS=3D`echo $GTK_DEP_LIBS | sed -e &quot;s/$ex=
port_dynamic//&quot;`<br>
+--<br>
+2.1.4<br>
+<br>
diff --git a/meta/recipes-gnome/gtk+/gtk+3/Do-not-try-to-initialize-GL-with=
out-libGL.patch b/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initiali=
ze-GL-without-libGL.patch<br>
similarity index 86%<br>
rename from meta/recipes-gnome/gtk+/gtk+3/Do-not-try-to-initialize-GL-witho=
ut-libGL.patch<br>
rename to meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-wi=
thout-libGL.patch<br>
index c8c480c..989716e 100644<br>
--- a/meta/recipes-gnome/gtk+/gtk+3/Do-not-try-to-initialize-GL-without-lib=
GL.patch<br>
+++ b/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-withou=
t-libGL.patch<br>
@@ -1,7 +1,7 @@<br>
-From fc22058a10db913534f11348f86681fe9e1838e5 Mon Sep 17 00:00:00 2001<br>
+From d63b926f8c8d8b5c9f9ec33d078b775f0409d88a Mon Sep 17 00:00:00 2001<br>
=C2=A0 From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com"=
 target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
=C2=A0 Date: Fri, 16 Oct 2015 16:35:16 +0300<br>
-Subject: [PATCH] Do not try to initialize GL without libGL<br>
+Subject: [PATCH 2/4] Do not try to initialize GL without libGL<br>
<br>
=C2=A0 _gdk_x11_screen_update_visuals_for_gl() will end up calling epoxys<b=
r>
=C2=A0 GLX api which will exit() if libGL.so.1 is not present. We do not<br=
>
@@ -21,10 +21,10 @@ Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jus=
si.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<b=
r>
=C2=A0 =C2=A02 files changed, 12 insertions(+)<br>
<br>
=C2=A0 diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targ=
et=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nor=
eferrer" target=3D"_blank">configure.ac</a><br>
-index 729a62e..58cc1ac 100644<br>
+index b6931d6..e27da49 100644<br>
=C2=A0 --- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
=C2=A0 +++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
-@@ -328,6 +328,13 @@ AC_ARG_ENABLE(mir-backend,<br>
+@@ -342,6 +342,13 @@ AC_ARG_ENABLE(mir-backend,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[enable the Mir gdk backend])]=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [backend_set=3Dyes])<br>
<br>
@@ -39,10 +39,10 @@ index 729a62e..58cc1ac 100644<br>
=C2=A0 =C2=A0 =C2=A0if test &quot;$platform_win32&quot; =3D yes; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0enable_win32_backend=3Dyes<br>
=C2=A0 diff --git a/gdk/x11/gdkvisual-x11.c b/gdk/x11/gdkvisual-x11.c<br>
-index f3b062d..c8243f4 100644<br>
+index 81479d8..3c8c5c0 100644<br>
=C2=A0 --- a/gdk/x11/gdkvisual-x11.c<br>
=C2=A0 +++ b/gdk/x11/gdkvisual-x11.c<br>
-@@ -345,7 +345,12 @@ _gdk_x11_screen_init_visuals (GdkScreen *screen)<br>
+@@ -306,7 +306,12 @@ _gdk_x11_screen_init_visuals (GdkScreen *screen)<br>
=C2=A0 =C2=A0 =C2=A0/* If GL is available we want to pick better default/rg=
ba visuals,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 as we care about glx details such as alpha/dept=
h/stencil depth,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 stereo and double buffering */<br>
diff --git a/meta/recipes-gnome/gtk+/gtk+3/0001-Add-disable-opengl-configur=
e-option.patch b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-conf=
igure-option.patch<br>
similarity index 71%<br>
rename from meta/recipes-gnome/gtk+/gtk+3/0001-Add-disable-opengl-configure=
-option.patch<br>
rename to meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-o=
ption.patch<br>
index a963334..8552f53 100644<br>
--- a/meta/recipes-gnome/gtk+/gtk+3/0001-Add-disable-opengl-configure-optio=
n.patch<br>
+++ b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-optio=
n.patch<br>
@@ -1,7 +1,7 @@<br>
-From c77afa19881d955d759879aeae8bbd88613dd4fe Mon Sep 17 00:00:00 2001<br>
+From a8fa547fdc1416b330aced805f5343ad912932ae Mon Sep 17 00:00:00 2001<br>
=C2=A0 From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com"=
 target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
-Date: Thu, 16 Jun 2016 15:11:34 +0300<br>
-Subject: [PATCH] Add --disable-opengl configure option<br>
+Date: Tue, 21 Jun 2016 15:11:39 +0300<br>
+Subject: [PATCH 3/4] Add --disable-opengl configure option<br>
<br>
=C2=A0 --disable-opengl will remove the dependency on libepoxy and on the<b=
r>
=C2=A0 OpenGL APIs. This is useful for those who want to keep using gtk+3<b=
r>
@@ -20,37 +20,35 @@ Long-term it would be good to find an alternative solut=
ion to this<br>
=C2=A0 Upstream-Status: Inappropriate [Evil eye expected from upstream]<br>
=C2=A0 Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@i=
ntel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
=C2=A0 ---<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 13 +++++++--<br>
- demos/gtk-demo/glarea.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 13 ++++=
+++++<br>
- docs/tools/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9=
 ++++--<br>
- docs/tools/widgets.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 4 ++-<br>
- gdk/gdkdisplay.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 4 ++-<br>
- gdk/gdkgl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 10 +++++++<br>
- gdk/gdkglcontext.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 6 ++++<br>
- gdk/gdkwindow.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 14 +++++++++-<br>
- gdk/x11/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 28 ++++++++++++++++---<br>
- gdk/x11/gdkdisplay-x11.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++--=
<br>
- gdk/x11/gdkscreen-x11.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5=
 ++++<br>
- gdk/x11/gdkwindow-x11.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4=
 +++<br>
- gdk/x11/gdkx-autocleanups.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
- gdk/x11/gdkx-with-gl-context.h=C2=A0 =C2=A0 | 59 ++++++++++++++++++++++++=
+++++++++++++++<br>
- gdk/x11/gdkx-without-gl-context.h | 58 ++++++++++++++++++++++++++++++++++=
++++<br>
- gdk/x11/gdkx.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 59 ---------------------------------------<br>
- gtk/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 3 +-<br>
- gtk/gtkglarea.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 20 ++++++++++++-<br>
- gtk/inspector/general.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6=
 ++++<br>
- tests/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 10 +++++--<br>
- testsuite/gtk/objects-finalize.c=C2=A0 |=C2=A0 2 ++<br>
- 21 files changed, 257 insertions(+), 78 deletions(-)<br>
- create mode 100644 gdk/x11/gdkx-with-gl-context.h<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 13 +++++--<br>
+ demos/gtk-demo/glarea.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 13 +++++++<br>
+ docs/tools/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 +++--<br>
+ docs/tools/widgets.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++-<br>
+ gdk/gdkdisplay.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++-<br>
+ gdk/gdkgl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 ++++++<br>
+ gdk/gdkglcontext.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++++<br>
+ gdk/gdkwindow.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13 +++++++<br>
+ gdk/x11/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 30 +++++++++++++---<br>
+ gdk/x11/gdkdisplay-x11.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++-<br>
+ gdk/x11/gdkscreen-x11.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++<br>
+ gdk/x11/gdkwindow-x11.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +++<br>
+ gdk/x11/gdkx-autocleanups.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 2 ++<br>
+ gdk/x11/{gdkx.h =3D&gt; gdkx-with-gl-context.h} |=C2=A0 0<br>
+ gdk/x11/gdkx-without-gl-context.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 58 =
++++++++++++++++++++++++++++++<br>
+ gtk/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
+ gtk/gtkglarea.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 20 ++++++++++-<br>
+ gtk/inspector/general.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++++<br>
+ tests/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 ++++--<br>
+ testsuite/gtk/objects-finalize.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 2 ++<br>
+ 20 files changed, 201 insertions(+), 17 deletions(-)<br>
+ rename gdk/x11/{gdkx.h =3D&gt; gdkx-with-gl-context.h} (100%)<br>
=C2=A0 =C2=A0create mode 100644 gdk/x11/gdkx-without-gl-context.h<br>
- delete mode 100644 gdk/x11/gdkx.h<br>
<br>
=C2=A0 diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targ=
et=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nor=
eferrer" target=3D"_blank">configure.ac</a><br>
-index c280543..32da151 100644<br>
+index e27da49..a3e9beb 100644<br>
=C2=A0 --- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
=C2=A0 +++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a><br>
-@@ -340,6 +340,15 @@ AC_ARG_ENABLE(mir-backend,<br>
+@@ -342,6 +342,15 @@ AC_ARG_ENABLE(mir-backend,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[enable the Mir gdk backend])]=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [backend_set=3Dyes])<br>
<br>
@@ -66,7 +64,7 @@ index c280543..32da151 100644<br>
=C2=A0 =C2=A0AC_ARG_ENABLE(glx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AS_HELP_STRI=
NG([--enable-glx],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[When enabled Gdk will try to =
initialize GLX])])<br>
-@@ -1330,7 +1339,7 @@ CFLAGS=3D&quot;$saved_cflags&quot;<br>
+@@ -1333,7 +1342,7 @@ CFLAGS=3D&quot;$saved_cflags&quot;<br>
=C2=A0 =C2=A0LDFLAGS=3D&quot;$saved_ldflags&quot;<br>
<br>
=C2=A0 =C2=A0GDK_PACKAGES=3D&quot;$PANGO_PACKAGES gdk-pixbuf-2.0 &gt;=3D gd=
k_pixbuf_required_version cairo &gt;=3D cairo_required_version cairo-gobjec=
t &gt;=3D cairo_required_version&quot;<br>
@@ -75,7 +73,7 @@ index c280543..32da151 100644<br>
<br>
=C2=A0 =C2=A0PKG_CHECK_MODULES(GDK_DEP, $GDK_PACKAGES $GDK_PRIVATE_PACKAGES=
)<br>
=C2=A0 =C2=A0GDK_DEP_LIBS=3D&quot;$GDK_EXTRA_LIBS $GDK_DEP_LIBS $MATH_LIB&q=
uot;<br>
-@@ -1364,7 +1373,7 @@ fi<br>
+@@ -1367,7 +1376,7 @@ fi<br>
=C2=A0 =C2=A0PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)<br>
<br>
=C2=A0 =C2=A0GTK_PACKAGES=3D&quot;atk &gt;=3D atk_required_version cairo &g=
t;=3D cairo_required_version cairo-gobject &gt;=3D cairo_required_version g=
dk-pixbuf-2.0 &gt;=3D gdk_pixbuf_required_version gio-2.0 &gt;=3D glib_requ=
ired_version&quot;<br>
@@ -85,7 +83,7 @@ index c280543..32da151 100644<br>
=C2=A0 =C2=A0 =C2=A0GTK_PRIVATE_PACKAGES=3D&quot;$GTK_PRIVATE_PACKAGES pang=
oft2&quot;<br>
=C2=A0 =C2=A0fi<br>
=C2=A0 diff --git a/demos/gtk-demo/glarea.c b/demos/gtk-demo/glarea.c<br>
-index c267706..b3bac86 100644<br>
+index 3aba729..c6c79f7 100644<br>
=C2=A0 --- a/demos/gtk-demo/glarea.c<br>
=C2=A0 +++ b/demos/gtk-demo/glarea.c<br>
=C2=A0 @@ -5,7 +5,9 @@<br>
@@ -207,10 +205,10 @@ index 932daf1..54239d6 100644<br>
<br>
=C2=A0 =C2=A0 =C2=A0return info;<br>
=C2=A0 diff --git a/gdk/gdkdisplay.c b/gdk/gdkdisplay.c<br>
-index 892d6a7..8323768 100644<br>
+index 6150ef7..2223629 100644<br>
=C2=A0 --- a/gdk/gdkdisplay.c<br>
=C2=A0 +++ b/gdk/gdkdisplay.c<br>
-@@ -2285,7 +2285,9 @@ gboolean<br>
+@@ -2360,7 +2360,9 @@ gboolean<br>
=C2=A0 =C2=A0gdk_display_make_gl_context_current (GdkDisplay=C2=A0 =C2=A0*d=
isplay,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GdkGLCon=
text *context)<br>
=C2=A0 =C2=A0{<br>
@@ -222,7 +220,7 @@ index 892d6a7..8323768 100644<br>
<br>
=C2=A0 =C2=A0GdkRenderingMode<br>
=C2=A0 diff --git a/gdk/gdkgl.c b/gdk/gdkgl.c<br>
-index 85ce63d..d76e8dc 100644<br>
+index e8ba770..ba7c84b 100644<br>
=C2=A0 --- a/gdk/gdkgl.c<br>
=C2=A0 +++ b/gdk/gdkgl.c<br>
=C2=A0 @@ -22,7 +22,9 @@<br>
@@ -243,7 +241,7 @@ index 85ce63d..d76e8dc 100644<br>
=C2=A0 =C2=A0static const char *<br>
=C2=A0 =C2=A0get_vertex_type_name (int type)<br>
=C2=A0 =C2=A0{<br>
-@@ -205,6 +208,7 @@ use_texture_rect_program (GdkGLContextPaintData *paint=
_data)<br>
+@@ -254,6 +257,7 @@ use_texture_rect_program (GdkGLContextPaintData *paint=
_data)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glUseProgram (paint_data-&gt;current_prog=
ram-&gt;program);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0}<br>
@@ -251,7 +249,7 @@ index 85ce63d..d76e8dc 100644<br>
<br>
=C2=A0 =C2=A0void<br>
=C2=A0 =C2=A0gdk_gl_texture_quads (GdkGLContext *paint_context,<br>
-@@ -212,6 +216,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,<br>
+@@ -261,6 +265,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0int n_quads,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0GdkTexturedQuad *quads)<br>
=C2=A0 =C2=A0{<br>
@@ -259,7 +257,7 @@ index 85ce63d..d76e8dc 100644<br>
=C2=A0 =C2=A0 =C2=A0GdkGLContextPaintData *paint_data=C2=A0 =3D gdk_gl_cont=
ext_get_paint_data (paint_context);<br>
=C2=A0 =C2=A0 =C2=A0GdkGLContextProgram *program;<br>
=C2=A0 =C2=A0 =C2=A0GdkWindow *window =3D gdk_gl_context_get_window (paint_=
context);<br>
-@@ -275,6 +280,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,<br>
+@@ -324,6 +329,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,<br>
<br>
=C2=A0 =C2=A0 =C2=A0glDisableVertexAttribArray (program-&gt;position_locati=
on);<br>
=C2=A0 =C2=A0 =C2=A0glDisableVertexAttribArray (program-&gt;uv_location);<b=
r>
@@ -267,7 +265,7 @@ index 85ce63d..d76e8dc 100644<br>
=C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0/* x,y,width,height describes a rectangle in the gl render buf=
fer<br>
-@@ -323,6 +329,7 @@ gdk_cairo_draw_from_gl (cairo_t=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 *cr,<br>
+@@ -372,6 +378,7 @@ gdk_cairo_draw_from_gl (cairo_t=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 *cr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0width,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0height)<br>
=C2=A0 =C2=A0{<br>
@@ -275,7 +273,7 @@ index 85ce63d..d76e8dc 100644<br>
=C2=A0 =C2=A0 =C2=A0GdkGLContext *paint_context;<br>
=C2=A0 =C2=A0 =C2=A0cairo_surface_t *image;<br>
=C2=A0 =C2=A0 =C2=A0cairo_matrix_t matrix;<br>
-@@ -643,6 +650,7 @@ gdk_cairo_draw_from_gl (cairo_t=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 *cr,<br>
+@@ -692,6 +699,7 @@ gdk_cairo_draw_from_gl (cairo_t=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 *cr,<br>
=C2=A0 =C2=A0 =C2=A0if (clip_region)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0cairo_region_destroy (clip_region);<br>
<br>
@@ -283,7 +281,7 @@ index 85ce63d..d76e8dc 100644<br>
=C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0/* This is always called with the paint context current */<br>
-@@ -650,6 +658,7 @@ void<br>
+@@ -699,6 +707,7 @@ void<br>
=C2=A0 =C2=A0gdk_gl_texture_from_surface (cairo_surface_t *surface,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cairo_region_t=C2=A0 *region)<br>
=C2=A0 =C2=A0{<br>
@@ -291,14 +289,14 @@ index 85ce63d..d76e8dc 100644<br>
=C2=A0 =C2=A0 =C2=A0GdkGLContext *paint_context;<br>
=C2=A0 =C2=A0 =C2=A0cairo_surface_t *image;<br>
=C2=A0 =C2=A0 =C2=A0double device_x_offset, device_y_offset;<br>
-@@ -750,4 +759,5 @@ gdk_gl_texture_from_surface (cairo_surface_t *surface,=
<br>
+@@ -799,4 +808,5 @@ gdk_gl_texture_from_surface (cairo_surface_t *surface,=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0glDisable (GL_SCISSOR_TEST);<br>
=C2=A0 =C2=A0 =C2=A0glDeleteTextures (1, &amp;texture_id);<br>
=C2=A0 +#endif<br>
=C2=A0 =C2=A0}<br>
=C2=A0 diff --git a/gdk/gdkglcontext.c b/gdk/gdkglcontext.c<br>
-index 4d71353..9bb55ef 100644<br>
+index 00a33eb..bd8a793 100644<br>
=C2=A0 --- a/gdk/gdkglcontext.c<br>
=C2=A0 +++ b/gdk/gdkglcontext.c<br>
=C2=A0 @@ -85,7 +85,9 @@<br>
@@ -311,7 +309,7 @@ index 4d71353..9bb55ef 100644<br>
<br>
=C2=A0 =C2=A0typedef struct {<br>
=C2=A0 =C2=A0 =C2=A0GdkDisplay *display;<br>
-@@ -238,6 +240,7 @@ gdk_gl_context_upload_texture (GdkGLContext=C2=A0 =C2=
=A0 *context,<br>
+@@ -239,6 +241,7 @@ gdk_gl_context_upload_texture (GdkGLContext=C2=A0 =C2=
=A0 *context,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 height,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 texture_target)<br>
=C2=A0 =C2=A0{<br>
@@ -319,7 +317,7 @@ index 4d71353..9bb55ef 100644<br>
=C2=A0 =C2=A0 =C2=A0g_return_if_fail (GDK_IS_GL_CONTEXT (context));<br>
<br>
=C2=A0 =C2=A0 =C2=A0glPixelStorei (GL_UNPACK_ALIGNMENT, 4);<br>
-@@ -245,6 +248,7 @@ gdk_gl_context_upload_texture (GdkGLContext=C2=A0 =C2=
=A0 *context,<br>
+@@ -246,6 +249,7 @@ gdk_gl_context_upload_texture (GdkGLContext=C2=A0 =C2=
=A0 *context,<br>
=C2=A0 =C2=A0 =C2=A0glTexImage2D (texture_target, 0, GL_RGBA, width, height=
, 0, GL_BGRA, GL_UNSIGNED_INT_8_8_8_8_REV,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cairo_=
image_surface_get_data (image_surface));<br>
=C2=A0 =C2=A0 =C2=A0glPixelStorei (GL_UNPACK_ROW_LENGTH, 0);<br>
@@ -327,7 +325,7 @@ index 4d71353..9bb55ef 100644<br>
=C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0static void<br>
-@@ -586,6 +590,7 @@ gdk_gl_context_realize (GdkGLContext=C2=A0 *context,<b=
r>
+@@ -635,6 +639,7 @@ gdk_gl_context_realize (GdkGLContext=C2=A0 *context,<b=
r>
=C2=A0 =C2=A0static void<br>
=C2=A0 =C2=A0gdk_gl_context_check_extensions (GdkGLContext *context)<br>
=C2=A0 =C2=A0{<br>
@@ -335,8 +333,8 @@ index 4d71353..9bb55ef 100644<br>
=C2=A0 =C2=A0 =C2=A0GdkGLContextPrivate *priv =3D gdk_gl_context_get_instan=
ce_private (context);<br>
=C2=A0 =C2=A0 =C2=A0gboolean has_npot, has_texture_rectangle;<br>
<br>
-@@ -628,6 +633,7 @@ gdk_gl_context_check_extensions (GdkGLContext *context=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 priv-&gt;use_texture_rectangle ? &quot;yes&quot; : &quot;no&quot;));<br=
>
+@@ -677,6 +682,7 @@ gdk_gl_context_check_extensions (GdkGLContext *context=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 priv-&gt;use_texture_rectangle ? &quot;yes&quot; : &quot;no&quot=
;));<br>
<br>
=C2=A0 =C2=A0 =C2=A0priv-&gt;extensions_checked =3D TRUE;<br>
=C2=A0 +#endif<br>
@@ -344,7 +342,7 @@ index 4d71353..9bb55ef 100644<br>
<br>
=C2=A0 =C2=A0/**<br>
=C2=A0 diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c<br>
-index c34c113..3025e96 100644<br>
+index 66ebb9d..74a0c3a 100644<br>
=C2=A0 --- a/gdk/gdkwindow.c<br>
=C2=A0 +++ b/gdk/gdkwindow.c<br>
=C2=A0 @@ -44,7 +44,9 @@<br>
@@ -357,15 +355,7 @@ index c34c113..3025e96 100644<br>
<br>
=C2=A0 =C2=A0/* for the use of round() */<br>
=C2=A0 =C2=A0#include &quot;fallback-c89.c&quot;<br>
-@@ -1455,7 +1457,6 @@ gdk_window_new (GdkWindow=C2=A0 =C2=A0 =C2=A0*parent=
,<br>
-=C2=A0 =C2=A0g_signal_connect (device_manager, &quot;device-removed&quot;,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0G_CALLBACK (device_removed_cb), window);<br>
-<br>
--<br>
-=C2=A0 =C2=A0if ((_gdk_gl_flags &amp; (GDK_GL_ALWAYS | GDK_GL_DISABLE)) =
=3D=3D GDK_GL_ALWAYS)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GError *error =3D NULL;<br>
-@@ -2761,6 +2762,13 @@ gdk_window_get_paint_gl_context (GdkWindow=C2=A0 *w=
indow,<br>
+@@ -2759,6 +2761,13 @@ gdk_window_get_paint_gl_context (GdkWindow=C2=A0 *w=
indow,<br>
=C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0GError *internal_error =3D NULL;<br>
<br>
@@ -379,7 +369,7 @@ index c34c113..3025e96 100644<br>
=C2=A0 =C2=A0 =C2=A0if (_gdk_gl_flags &amp; GDK_GL_DISABLE)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_set_error_literal (error, GDK_GL_ERROR,=
<br>
-@@ -2957,6 +2965,7 @@ gdk_window_begin_paint_region (GdkWindow=C2=A0 =C2=
=A0 =C2=A0 =C2=A0*window,<br>
+@@ -2955,6 +2964,7 @@ gdk_window_begin_paint_region (GdkWindow=C2=A0 =C2=
=A0 =C2=A0 =C2=A0*window,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
@@ -387,7 +377,7 @@ index c34c113..3025e96 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gdk_gl_context_make_current (context);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* With gl we always need a=
 surface to combine the gl<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drawing with the na=
tive drawing. */<br>
-@@ -2971,6 +2980,7 @@ gdk_window_begin_paint_region (GdkWindow=C2=A0 =C2=
=A0 =C2=A0 =C2=A0*window,<br>
+@@ -2969,6 +2979,7 @@ gdk_window_begin_paint_region (GdkWindow=C2=A0 =C2=
=A0 =C2=A0 =C2=A0*window,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glBlendFunc (GL_ONE, GL_ONE=
_MINUS_SRC_ALPHA);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glViewport (0, 0, ww, wh);<=
br>
@@ -395,7 +385,7 @@ index c34c113..3025e96 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-@@ -3119,6 +3129,7 @@ gdk_window_end_paint (GdkWindow *window)<br>
+@@ -3117,6 +3128,7 @@ gdk_window_end_paint (GdkWindow *window)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gdk_gl_context_make_current=
 (window-&gt;gl_paint_context);<br>
<br>
@@ -403,7 +393,7 @@ index c34c113..3025e96 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cairo_region_is_empty =
(opaque_region))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gdk_gl_texture_from_=
surface (window-&gt;current_paint.surface,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 opaque_region);<br>
-@@ -3129,6 +3140,7 @@ gdk_window_end_paint (GdkWindow *window)<br>
+@@ -3127,6 +3139,7 @@ gdk_window_end_paint (GdkWindow *window)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 window-&gt;current_paint.need_blend_region);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glDisable(GL_=
BLEND);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -412,7 +402,7 @@ index c34c113..3025e96 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cairo_region_destroy (opaqu=
e_region);<br>
<br>
=C2=A0 diff --git a/gdk/x11/Makefile.am b/gdk/x11/Makefile.am<br>
-index c488a31..d0aa7ce 100644<br>
+index c488a31..4ce3c07 100644<br>
=C2=A0 --- a/gdk/x11/Makefile.am<br>
=C2=A0 +++ b/gdk/x11/Makefile.am<br>
=C2=A0 @@ -39,8 +39,6 @@ libgdk_x11_la_SOURCES =3D=C2=A0 =C2=A0 =C2=A0\<br>
@@ -424,7 +414,7 @@ index c488a31..d0aa7ce 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkkeys-x11.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkmain-x11.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkproperty-x11.c=C2=A0 =C2=A0 =C2=A0 =C2=A0\<b=
r>
-@@ -53,14 +51,30 @@ libgdk_x11_la_SOURCES =3D=C2=A0 =C2=A0 \<br>
+@@ -53,14 +51,32 @@ libgdk_x11_la_SOURCES =3D=C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkwindow-x11.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkxftdefaults.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkxid.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
@@ -450,13 +440,15 @@ index c488a31..d0aa7ce 100644<br>
=C2=A0 +<br>
=C2=A0 +BUILT_SOURCES =3D gdkx.h<br>
=C2=A0 +<br>
++.PHONY: gdkx.h<br>
=C2=A0 +gdkx.h:<br>
-+=C2=A0 =C2=A0 =C2=A0 $(AM_V_GEN) cd $(srcdir) &amp;&amp; cp $(GDKX_HEADER=
) gdkx.h<br>
++=C2=A0 =C2=A0 =C2=A0 $(AM_V_GEN) cd $(srcdir) \<br>
++=C2=A0 =C2=A0 =C2=A0 &amp;&amp; (cmp -s $(GDKX_HEADER) gdkx.h || cp $(GDK=
X_HEADER) gdkx.h )<br>
=C2=A0 +<br>
=C2=A0 =C2=A0libgdkx11include_HEADERS =3D=C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkx-autocleanups.h=C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkx11applaunchcontext.h \<br>
-@@ -74,7 +88,6 @@ libgdkx11include_HEADERS =3D=C2=A0 =C2=A0\<br>
+@@ -74,7 +90,6 @@ libgdkx11include_HEADERS =3D=C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkx11display.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkx11displaymanager.h=C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkx11dnd.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>
@@ -464,7 +456,7 @@ index c488a31..d0aa7ce 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkx11keys.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkx11property.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkx11screen.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
-@@ -83,9 +96,16 @@ libgdkx11include_HEADERS =3D=C2=A0 \<br>
+@@ -83,9 +98,16 @@ libgdkx11include_HEADERS =3D=C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkx11visual.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkx11window.h<br>
<br>
@@ -482,7 +474,7 @@ index c488a31..d0aa7ce 100644<br>
=C2=A0 +<br>
=C2=A0 =C2=A0-include $(top_srcdir)/<a href=3D"http://git.mk" rel=3D"norefe=
rrer" target=3D"_blank">git.mk</a><br>
=C2=A0 diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c<br>
-index 5816d18..5d2dae6 100644<br>
+index de91c64..42d50f6 100644<br>
=C2=A0 --- a/gdk/x11/gdkdisplay-x11.c<br>
=C2=A0 +++ b/gdk/x11/gdkdisplay-x11.c<br>
=C2=A0 @@ -37,7 +37,9 @@<br>
@@ -495,19 +487,19 @@ index 5816d18..5d2dae6 100644<br>
=C2=A0 =C2=A0#include &quot;gdk-private.h&quot;<br>
<br>
=C2=A0 =C2=A0#include &lt;glib.h&gt;<br>
-@@ -2989,8 +2991,8 @@ gdk_x11_display_class_init (GdkX11DisplayClass * cla=
ss)<br>
-=C2=A0 =C2=A0display_class-&gt;convert_selection =3D _gdk_x11_display_conv=
ert_selection;<br>
+@@ -2959,7 +2961,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * cla=
ss)<br>
=C2=A0 =C2=A0 =C2=A0display_class-&gt;text_property_to_utf8_list =3D _gdk_x=
11_display_text_property_to_utf8_list;<br>
=C2=A0 =C2=A0 =C2=A0display_class-&gt;utf8_to_string_target =3D _gdk_x11_di=
splay_utf8_to_string_target;<br>
--<br>
+<br>
+-=C2=A0 display_class-&gt;make_gl_context_current =3D gdk_x11_display_make=
_gl_context_current;<br>
=C2=A0 +#ifdef HAVE_OPENGL<br>
-=C2=A0 =C2=A0display_class-&gt;make_gl_context_current =3D gdk_x11_display=
_make_gl_context_current;<br>
--<br>
++=C2=A0 =C2=A0display_class-&gt;make_gl_context_current =3D gdk_x11_displa=
y_make_gl_context_current;<br>
=C2=A0 +#endif<br>
-=C2=A0 =C2=A0_gdk_x11_windowing_init ();<br>
- }<br>
+<br>
+=C2=A0 =C2=A0display_class-&gt;get_default_seat =3D gdk_x11_display_get_de=
fault_seat;<br>
+<br>
=C2=A0 diff --git a/gdk/x11/gdkscreen-x11.c b/gdk/x11/gdkscreen-x11.c<br>
-index 2bd7f28..30032e0 100644<br>
+index 9d8ed20..bd46b00 100644<br>
=C2=A0 --- a/gdk/x11/gdkscreen-x11.c<br>
=C2=A0 +++ b/gdk/x11/gdkscreen-x11.c<br>
=C2=A0 @@ -1968,3 +1968,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen =
*screen)<br>
@@ -520,7 +512,7 @@ index 2bd7f28..30032e0 100644<br>
=C2=A0 +void _gdk_x11_screen_update_visuals_for_gl (GdkScreen *screen) {}<b=
r>
=C2=A0 +#endif<br>
=C2=A0 diff --git a/gdk/x11/gdkwindow-x11.c b/gdk/x11/gdkwindow-x11.c<br>
-index d08cee0..d354628 100644<br>
+index 9ed087a..30d6eb7 100644<br>
=C2=A0 --- a/gdk/x11/gdkwindow-x11.c<br>
=C2=A0 +++ b/gdk/x11/gdkwindow-x11.c<br>
=C2=A0 @@ -36,7 +36,9 @@<br>
@@ -533,7 +525,7 @@ index d08cee0..d354628 100644<br>
=C2=A0 =C2=A0#include &quot;gdkprivate-x11.h&quot;<br>
=C2=A0 =C2=A0#include &quot;gdk-private.h&quot;<br>
<br>
-@@ -5768,7 +5770,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Clas=
s *klass)<br>
+@@ -5782,7 +5784,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Clas=
s *klass)<br>
=C2=A0 =C2=A0 =C2=A0impl_class-&gt;set_opaque_region =3D gdk_x11_window_set=
_opaque_region;<br>
=C2=A0 =C2=A0 =C2=A0impl_class-&gt;set_shadow_width =3D gdk_x11_window_set_=
shadow_width;<br>
=C2=A0 =C2=A0 =C2=A0impl_class-&gt;show_window_menu =3D gdk_x11_window_show=
_window_menu;<br>
@@ -557,71 +549,10 @@ index edb0ea7..a317d61 100644<br>
=C2=A0 =C2=A0G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Keymap, g_object_unref)<br=
>
=C2=A0 =C2=A0G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Screen, g_object_unref)<br=
>
=C2=A0 =C2=A0G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Visual, g_object_unref)<br=
>
-diff --git a/gdk/x11/gdkx-with-gl-context.h b/gdk/x11/gdkx-with-gl-context=
.h<br>
-new file mode 100644<br>
-index 0000000..ae05fa6<br>
---- /dev/null<br>
-+++ b/gdk/x11/gdkx-with-gl-context.h<br>
-@@ -0,0 +1,59 @@<br>
-+/* GDK - The GIMP Drawing Kit<br>
-+ * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDona=
ld<br>
-+ *<br>
-+ * This library is free software; you can redistribute it and/or<br>
-+ * modify it under the terms of the GNU Lesser General Public<br>
-+ * License as published by the Free Software Foundation; either<br>
-+ * version 2 of the License, or (at your option) any later version.<br>
-+ *<br>
-+ * This library is distributed in the hope that it will be useful,<br>
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU=
<br>
-+ * Lesser General Public License for more details.<br>
-+ *<br>
-+ * You should have received a copy of the GNU Lesser General Public<br>
-+ * License along with this library. If not, see &lt;<a href=3D"http://www=
.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org=
/licenses/</a>&gt;.<br>
-+ */<br>
-+<br>
-+/*<br>
-+ * Modified by the GTK+ Team and others 1997-2000.=C2=A0 See the AUTHORS<=
br>
-+ * file for a list of people on the GTK+ Team.=C2=A0 See the ChangeLog<br=
>
-+ * files for a list of changes.=C2=A0 These files are distributed with<br=
>
-+ * GTK+ at <a href=3D"ftp://ftp.gtk.org/pub/gtk/" rel=3D"noreferrer" targ=
et=3D"_blank">ftp://ftp.gtk.org/pub/gtk/</a>.<br>
-+ */<br>
-+<br>
-+#ifndef __GDK_X_H__<br>
-+#define __GDK_X_H__<br>
-+<br>
-+#include &lt;gdk/gdk.h&gt;<br>
-+<br>
-+#include &lt;X11/Xlib.h&gt;<br>
-+#include &lt;X11/Xutil.h&gt;<br>
-+<br>
-+#define __GDKX_H_INSIDE__<br>
-+<br>
-+#include &lt;gdk/x11/gdkx11applaunchcontext.h&gt;<br>
-+#include &lt;gdk/x11/gdkx11cursor.h&gt;<br>
-+#include &lt;gdk/x11/gdkx11device.h&gt;<br>
-+#include &lt;gdk/x11/gdkx11device-core.h&gt;<br>
-+#include &lt;gdk/x11/gdkx11device-xi2.h&gt;<br>
-+#include &lt;gdk/x11/gdkx11devicemanager.h&gt;<br>
-+#include &lt;gdk/x11/gdkx11devicemanager-core.h&gt;<br>
-+#include &lt;gdk/x11/gdkx11devicemanager-xi2.h&gt;<br>
-+#include &lt;gdk/x11/gdkx11display.h&gt;<br>
-+#include &lt;gdk/x11/gdkx11displaymanager.h&gt;<br>
-+#include &lt;gdk/x11/gdkx11dnd.h&gt;<br>
-+#include &lt;gdk/x11/gdkx11glcontext.h&gt;<br>
-+#include &lt;gdk/x11/gdkx11keys.h&gt;<br>
-+#include &lt;gdk/x11/gdkx11property.h&gt;<br>
-+#include &lt;gdk/x11/gdkx11screen.h&gt;<br>
-+#include &lt;gdk/x11/gdkx11selection.h&gt;<br>
-+#include &lt;gdk/x11/gdkx11utils.h&gt;<br>
-+#include &lt;gdk/x11/gdkx11visual.h&gt;<br>
-+#include &lt;gdk/x11/gdkx11window.h&gt;<br>
-+<br>
-+#include &lt;gdk/x11/gdkx-autocleanups.h&gt;<br>
-+<br>
-+#undef __GDKX_H_INSIDE__<br>
-+<br>
-+#endif /* __GDK_X_H__ */<br>
+diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx-with-gl-context.h<br>
+similarity index 100%<br>
+rename from gdk/x11/gdkx.h<br>
+rename to gdk/x11/gdkx-with-gl-context.h<br>
=C2=A0 diff --git a/gdk/x11/gdkx-without-gl-context.h b/gdk/x11/gdkx-withou=
t-gl-context.h<br>
=C2=A0 new file mode 100644<br>
=C2=A0 index 0000000..c9e2617<br>
@@ -686,76 +617,11 @@ index 0000000..c9e2617<br>
=C2=A0 +#undef __GDKX_H_INSIDE__<br>
=C2=A0 +<br>
=C2=A0 +#endif /* __GDK_X_H__ */<br>
-diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx.h<br>
-deleted file mode 100644<br>
-index ae05fa6..0000000<br>
---- a/gdk/x11/gdkx.h<br>
-+++ /dev/null<br>
-@@ -1,59 +0,0 @@<br>
--/* GDK - The GIMP Drawing Kit<br>
-- * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDona=
ld<br>
-- *<br>
-- * This library is free software; you can redistribute it and/or<br>
-- * modify it under the terms of the GNU Lesser General Public<br>
-- * License as published by the Free Software Foundation; either<br>
-- * version 2 of the License, or (at your option) any later version.<br>
-- *<br>
-- * This library is distributed in the hope that it will be useful,<br>
-- * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
-- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU=
<br>
-- * Lesser General Public License for more details.<br>
-- *<br>
-- * You should have received a copy of the GNU Lesser General Public<br>
-- * License along with this library. If not, see &lt;<a href=3D"http://www=
.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org=
/licenses/</a>&gt;.<br>
-- */<br>
--<br>
--/*<br>
-- * Modified by the GTK+ Team and others 1997-2000.=C2=A0 See the AUTHORS<=
br>
-- * file for a list of people on the GTK+ Team.=C2=A0 See the ChangeLog<br=
>
-- * files for a list of changes.=C2=A0 These files are distributed with<br=
>
-- * GTK+ at <a href=3D"ftp://ftp.gtk.org/pub/gtk/" rel=3D"noreferrer" targ=
et=3D"_blank">ftp://ftp.gtk.org/pub/gtk/</a>.<br>
-- */<br>
--<br>
--#ifndef __GDK_X_H__<br>
--#define __GDK_X_H__<br>
--<br>
--#include &lt;gdk/gdk.h&gt;<br>
--<br>
--#include &lt;X11/Xlib.h&gt;<br>
--#include &lt;X11/Xutil.h&gt;<br>
--<br>
--#define __GDKX_H_INSIDE__<br>
--<br>
--#include &lt;gdk/x11/gdkx11applaunchcontext.h&gt;<br>
--#include &lt;gdk/x11/gdkx11cursor.h&gt;<br>
--#include &lt;gdk/x11/gdkx11device.h&gt;<br>
--#include &lt;gdk/x11/gdkx11device-core.h&gt;<br>
--#include &lt;gdk/x11/gdkx11device-xi2.h&gt;<br>
--#include &lt;gdk/x11/gdkx11devicemanager.h&gt;<br>
--#include &lt;gdk/x11/gdkx11devicemanager-core.h&gt;<br>
--#include &lt;gdk/x11/gdkx11devicemanager-xi2.h&gt;<br>
--#include &lt;gdk/x11/gdkx11display.h&gt;<br>
--#include &lt;gdk/x11/gdkx11displaymanager.h&gt;<br>
--#include &lt;gdk/x11/gdkx11dnd.h&gt;<br>
--#include &lt;gdk/x11/gdkx11glcontext.h&gt;<br>
--#include &lt;gdk/x11/gdkx11keys.h&gt;<br>
--#include &lt;gdk/x11/gdkx11property.h&gt;<br>
--#include &lt;gdk/x11/gdkx11screen.h&gt;<br>
--#include &lt;gdk/x11/gdkx11selection.h&gt;<br>
--#include &lt;gdk/x11/gdkx11utils.h&gt;<br>
--#include &lt;gdk/x11/gdkx11visual.h&gt;<br>
--#include &lt;gdk/x11/gdkx11window.h&gt;<br>
--<br>
--#include &lt;gdk/x11/gdkx-autocleanups.h&gt;<br>
--<br>
--#undef __GDKX_H_INSIDE__<br>
--<br>
--#endif /* __GDK_X_H__ */<br>
=C2=A0 diff --git a/gtk/Makefile.am b/gtk/Makefile.am<br>
-index 801c3a5..2d8839d 100644<br>
+index 6a53a2b..49a35e6 100644<br>
=C2=A0 --- a/gtk/Makefile.am<br>
=C2=A0 +++ b/gtk/Makefile.am<br>
-@@ -1246,14 +1246,13 @@ gtkprivatetypebuiltins.c: $(gtk_private_type_h_sou=
rces)=C2=A0 gtkprivatetypebuiltins.<br>
+@@ -1351,14 +1351,13 @@ gtkprivatetypebuiltins.c: $(gtk_private_type_h_sou=
rces)=C2=A0 gtkprivatetypebuiltins.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; cp xgen-gptbc gtkprivatetypebuiltins=
.c=C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; rm -f xgen-gptbc<br>
<br>
@@ -772,7 +638,7 @@ index 801c3a5..2d8839d 100644<br>
=C2=A0 =C2=A0gtktestutils.c: gtktypefuncs.c<br>
<br>
=C2=A0 diff --git a/gtk/gtkglarea.c b/gtk/gtkglarea.c<br>
-index 4098409..45fa1d1 100644<br>
+index 245fc6b..4214ad1 100644<br>
=C2=A0 --- a/gtk/gtkglarea.c<br>
=C2=A0 +++ b/gtk/gtkglarea.c<br>
=C2=A0 @@ -28,7 +28,9 @@<br>
@@ -868,7 +734,7 @@ index 4098409..45fa1d1 100644<br>
<br>
=C2=A0 =C2=A0static gboolean<br>
=C2=A0 diff --git a/gtk/inspector/general.c b/gtk/inspector/general.c<br>
-index 0611373..4499a29 100644<br>
+index 4eab3a7..c4e900e 100644<br>
=C2=A0 --- a/gtk/inspector/general.c<br>
=C2=A0 +++ b/gtk/inspector/general.c<br>
=C2=A0 @@ -33,8 +33,10 @@<br>
@@ -882,7 +748,7 @@ index 0611373..4499a29 100644<br>
<br>
=C2=A0 =C2=A0#ifdef GDK_WINDOWING_WIN32<br>
=C2=A0 =C2=A0#include &quot;win32/gdkwin32.h&quot;<br>
-@@ -146,6 +148,7 @@ append_extension_row (GtkInspectorGeneral *gen,<br>
+@@ -147,6 +149,7 @@ append_extension_row (GtkInspectorGeneral *gen,<br>
=C2=A0 =C2=A0 =C2=A0gtk_size_group_add_widget (GTK_SIZE_GROUP (gen-&gt;priv=
-&gt;labels), label);<br>
=C2=A0 =C2=A0}<br>
<br>
@@ -890,7 +756,7 @@ index 0611373..4499a29 100644<br>
=C2=A0 =C2=A0#ifdef GDK_WINDOWING_X11<br>
=C2=A0 =C2=A0static void<br>
=C2=A0 =C2=A0append_glx_extension_row (GtkInspectorGeneral *gen,<br>
-@@ -155,6 +158,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,<br=
>
+@@ -156,6 +159,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,<br=
>
=C2=A0 =C2=A0 =C2=A0append_extension_row (gen, ext, epoxy_has_glx_extension=
 (dpy, 0, ext));<br>
=C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0#endif<br>
@@ -898,27 +764,27 @@ index 0611373..4499a29 100644<br>
<br>
=C2=A0 =C2=A0#ifdef GDK_WINDOWING_WAYLAND<br>
=C2=A0 =C2=A0static void<br>
-@@ -174,6 +178,7 @@ init_gl (GtkInspectorGeneral *gen)<br>
-<br>
-=C2=A0 =C2=A0display =3D gdk_display_get_default ();<br>
-<br>
+@@ -171,6 +175,7 @@ append_egl_extension_row (GtkInspectorGeneral *gen,<br=
>
+ static void<br>
+ init_gl (GtkInspectorGeneral *gen)<br>
+ {<br>
=C2=A0 +#ifdef HAVE_OPENGL<br>
=C2=A0 =C2=A0#ifdef GDK_WINDOWING_X11<br>
-=C2=A0 =C2=A0if (GDK_IS_X11_DISPLAY (display))<br>
+=C2=A0 =C2=A0if (GDK_IS_X11_DISPLAY (gdk_display_get_default ()))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-@@ -199,6 +204,7 @@ init_gl (GtkInspectorGeneral *gen)<br>
+@@ -197,6 +202,7 @@ init_gl (GtkInspectorGeneral *gen)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0#endif<br>
=C2=A0 +#endif<br>
=C2=A0 =C2=A0#ifdef GDK_WINDOWING_WAYLAND<br>
-=C2=A0 =C2=A0if (GDK_IS_WAYLAND_DISPLAY (display))<br>
+=C2=A0 =C2=A0if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 diff --git a/tests/Makefile.am b/tests/Makefile.am<br>
-index 50f2986..3b39169 100644<br>
+index 681807d..2941a36 100644<br>
=C2=A0 --- a/tests/Makefile.am<br>
=C2=A0 +++ b/tests/Makefile.am<br>
-@@ -78,8 +78,6 @@ noinst_PROGRAMS =3D=C2=A0 $(TEST_PROGS)=C2=A0 =C2=A0 =C2=
=A0\<br>
+@@ -80,8 +80,6 @@ noinst_PROGRAMS =3D=C2=A0 $(TEST_PROGS)=C2=A0 =C2=A0 =C2=
=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 testfullscreen=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 testgeometry=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 testgiconpixbuf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
@@ -927,18 +793,19 @@ index 50f2986..3b39169 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 testgrid=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 testgtk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 testheaderbar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-@@ -166,10 +164,16 @@ noinst_PROGRAMS =3D=C2=A0 $(TEST_PROGS) \<br>
+@@ -169,11 +167,17 @@ noinst_PROGRAMS =3D=C2=A0 $(TEST_PROGS) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 testactionbar=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 testwindowsize=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 testpopover=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 -=C2=A0 =C2=A0 =C2=A0gdkgears=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 listmodel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0testpopup=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(NULL)<br>
<br>
=C2=A0 +if HAVE_OPENGL<br>
=C2=A0 +noinst_PROGRAMS +=3D<br>
-+=C2=A0 =C2=A0 =C2=A0 testglarea=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-+=C2=A0 =C2=A0 =C2=A0 testglblending=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0 =C2=A0 testglarea=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++=C2=A0 =C2=A0 =C2=A0 testglblending=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 +=C2=A0 =C2=A0 =C2=A0gdkgears<br>
=C2=A0 +endif<br>
=C2=A0 +<br>
@@ -946,11 +813,11 @@ index 50f2986..3b39169 100644<br>
=C2=A0 =C2=A0noinst_PROGRAMS +=3D testerrors<br>
=C2=A0 =C2=A0endif<br>
=C2=A0 diff --git a/testsuite/gtk/objects-finalize.c b/testsuite/gtk/object=
s-finalize.c<br>
-index 3568505..682ea10 100644<br>
+index e0ebee0..703643c 100644<br>
=C2=A0 --- a/testsuite/gtk/objects-finalize.c<br>
=C2=A0 +++ b/testsuite/gtk/objects-finalize.c<br>
-@@ -114,8 +114,10 @@ main (int argc, char **argv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0all_types[i] !=3D GDK_TYPE_X11_DISPLAY &=
amp;&amp;<br>
+@@ -115,8 +115,10 @@ main (int argc, char **argv)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0all_types[i] !=3D GDK_TYPE_X11_DEVICE_MA=
NAGER_CORE &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 all_types[i] !=3D GDK_TYPE_X11_DEVICE_MA=
NAGER_XI2 &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 all_types[i] !=3D GDK_TYPE_X11_DISPLAY_M=
ANAGER &amp;&amp;<br>
=C2=A0 +#ifdef HAVE_OPENGL<br>
@@ -961,5 +828,5 @@ index 3568505..682ea10 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 all_types[i] !=3D GDK_TYPE_PIXBUF_LOADER=
 &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 all_types[i] !=3D gdk_pixbuf_simple_anim=
_iter_get_type())<br>
=C2=A0 --<br>
-2.8.1<br>
+2.1.4<br>
<br>
diff --git a/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-pr=
otocols-path.patch b/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wa=
yland-protocols-path.patch<br>
new file mode 100644<br>
index 0000000..634b3a4<br>
--- /dev/null<br>
+++ b/meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols=
-path.patch<br>
@@ -0,0 +1,36 @@<br>
+From 97b78e566634579bbae51be914aeaaa921137a8b Mon Sep 17 00:00:00 2001<br>
+From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com" targe=
t=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
+Date: Thu, 9 Jun 2016 11:21:36 +0300<br>
+Subject: [PATCH 4/4] <a href=3D"http://configure.ac" rel=3D"noreferrer" ta=
rget=3D"_blank">configure.ac</a>: Fix wayland-protocols path<br>
+<br>
+The wayland-protocols directory is used during build: Fix the path<br>
+to point to sysroot specified in recipe.<br>
+<br>
+Normally PKG_CONFIG_SYSROOT_DIR could be used in <a href=3D"http://configu=
re.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a> but that<br>
+breaks multilib gtk+ as it would point to multilib sysroot when the<br>
+(allarch) wayland-protocols is actually in the machine sysroot.<br>
+<br>
+Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
+Upstream-Status: Inappropriate [embedded specific]<br>
+<br>
+Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index a3e9beb..dde9dc5 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -461,7 +461,7 @@ fi<br>
+ if test &quot;$enable_wayland_backend&quot; =3D &quot;yes&quot;; then<br>
+=C2=A0 =C2=A0# For the cairo image backend<br>
+=C2=A0 =C2=A0cairo_backends=3D&quot;$cairo_backends cairo&quot;<br>
+-=C2=A0 AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, `$PKG_CONFIG --variable=3Dpkgd=
atadir wayland-protocols`)<br>
++=C2=A0 AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, ${WAYLAND_PROTOCOLS_SYSROOT_DI=
R}`$PKG_CONFIG --variable=3Dpkgdatadir wayland-protocols`)<br>
+=C2=A0 =C2=A0GDK_BACKENDS=3D&quot;$GDK_BACKENDS wayland&quot;<br>
+=C2=A0 =C2=A0GDK_WINDOWING=3D&quot;$GDK_WINDOWING<br>
+ #define GDK_WINDOWING_WAYLAND&quot;<br>
+--<br>
+2.1.4<br>
+<br>
diff --git a/meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch b/meta/reci=
pes-gnome/gtk+/gtk+3/Dont-force-csd.patch<br>
deleted file mode 100644<br>
index 32d8a84..0000000<br>
--- a/meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch<br>
+++ /dev/null<br>
@@ -1,118 +0,0 @@<br>
-window: Check if we can use CSD before enabling them<br>
-<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
-<br>
-<br>
-From c5e5ee67490e7e7af56052d8f8beb75db002c2f1 Mon Sep 17 00:00:00 2001<br>
-From: Emmanuele Bassi &lt;<a href=3D"mailto:ebassi@gnome.org" target=3D"_b=
lank">ebassi@gnome.org</a>&gt;<br>
-Date: Wed, 3 Jun 2015 14:07:29 +0100<br>
-Subject: window: Check if we can use CSD before enabling them<br>
-<br>
-The change in 03213b9509fc1df16c66194ea168aed6c15110e9 changed the rules<b=
r>
-as to when CSD can be enabled, but it also unconditionally enables CSD<br>
-with the implicit assumption that client-side shadows were the real<br>
-issue, and that we could work around that by drawing our own borders.<br>
-This also means that setting a titlebar for a GtkWindow will enable CSD<br=
>
-unconditionally.<br>
-<br>
-In reality, some window managers (like Matchbox) *only* support<br>
-server-side decorations, and will ignore all hints to the contrary, to<br>
-the point of drawing decorations at random locations on top of the<br>
-window.<br>
-<br>
-Since CSD are enabled unconditionally, the GTK_CSD environment variable<br=
>
-is also not a suitable escape hatch.<br>
-<br>
-In the grand tradition of asking ourselves if we should do something<br>
-just because we can, we should split the environment checks from the<br>
-checks on what the user requested; by doing that, we can also check<br>
-when enabling client-side decorations, and ideally bail out if needed.<br>
-<br>
-<a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D750343" rel=3D"nor=
eferrer" target=3D"_blank">https://bugzilla.gnome.org/show_bug.cgi?id=3D750=
343</a><br>
-<br>
-diff --git a/gtk/gtkwindow.c b/gtk/gtkwindow.c<br>
-index 423c6bd..9fe882f 100644<br>
---- a/gtk/gtkwindow.c<br>
-+++ b/gtk/gtkwindow.c<br>
-@@ -4056,6 +4056,32 @@ gtk_window_supports_client_shadow (GtkWindow *windo=
w)<br>
-=C2=A0 =C2=A0return TRUE;<br>
- }<br>
-<br>
-+static gboolean<br>
-+gtk_window_can_use_csd (GtkWindow *window)<br>
-+{<br>
-+=C2=A0 const gchar *csd_env;<br>
-+<br>
-+#ifdef GDK_WINDOWING_BROADWAY<br>
-+=C2=A0 if (GDK_IS_BROADWAY_DISPLAY (gtk_widget_get_display (GTK_WIDGET (w=
indow))))<br>
-+=C2=A0 =C2=A0 return TRUE;<br>
-+#endif<br>
-+<br>
-+#ifdef GDK_WINDOWING_WAYLAND<br>
-+=C2=A0 if (GDK_IS_WAYLAND_DISPLAY (gtk_widget_get_display (GTK_WIDGET (wi=
ndow))))<br>
-+=C2=A0 =C2=A0 return TRUE;<br>
-+#endif<br>
-+<br>
-+#ifdef GDK_WINDOWING_MIR<br>
-+=C2=A0 if (GDK_IS_MIR_DISPLAY (gtk_widget_get_display (GTK_WIDGET (window=
))))<br>
-+=C2=A0 =C2=A0 return TRUE;<br>
-+#endif<br>
-+<br>
-+=C2=A0 csd_env =3D g_getenv (&quot;GTK_CSD&quot;);<br>
-+<br>
-+=C2=A0 /* If GTK_CSD is unset we default to CSD support */<br>
-+=C2=A0 return csd_env =3D=3D NULL || (strcmp (csd_env, &quot;1&quot;) =3D=
=3D 0);<br>
-+}<br>
-+<br>
- static void<br>
- gtk_window_enable_csd (GtkWindow *window)<br>
- {<br>
-@@ -4063,6 +4089,10 @@ gtk_window_enable_csd (GtkWindow *window)<br>
-=C2=A0 =C2=A0GtkWidget *widget =3D GTK_WIDGET (window);<br>
-=C2=A0 =C2=A0GdkVisual *visual;<br>
-<br>
-+=C2=A0 /* If the environment does not support CSD, then there&#39;s no po=
int in enabling them */<br>
-+=C2=A0 if (!gtk_window_can_use_csd (window))<br>
-+=C2=A0 =C2=A0 return;<br>
-+<br>
-=C2=A0 =C2=A0/* We need a visual with alpha for client shadows */<br>
-=C2=A0 =C2=A0if (priv-&gt;use_client_shadow)<br>
-=C2=A0 =C2=A0 =C2=A0{<br>
-@@ -5839,7 +5869,6 @@ static gboolean<br>
- gtk_window_should_use_csd (GtkWindow *window)<br>
- {<br>
-=C2=A0 =C2=A0GtkWindowPrivate *priv =3D window-&gt;priv;<br>
--=C2=A0 const gchar *csd_env;<br>
-<br>
-=C2=A0 =C2=A0if (priv-&gt;csd_requested)<br>
-=C2=A0 =C2=A0 =C2=A0return TRUE;<br>
-@@ -5850,24 +5879,7 @@ gtk_window_should_use_csd (GtkWindow *window)<br>
-=C2=A0 =C2=A0if (priv-&gt;type =3D=3D GTK_WINDOW_POPUP)<br>
-=C2=A0 =C2=A0 =C2=A0return FALSE;<br>
-<br>
--#ifdef GDK_WINDOWING_BROADWAY<br>
--=C2=A0 if (GDK_IS_BROADWAY_DISPLAY (gtk_widget_get_display (GTK_WIDGET (w=
indow))))<br>
--=C2=A0 =C2=A0 return TRUE;<br>
--#endif<br>
--<br>
--#ifdef GDK_WINDOWING_WAYLAND<br>
--=C2=A0 if (GDK_IS_WAYLAND_DISPLAY (gtk_widget_get_display (GTK_WIDGET (wi=
ndow))))<br>
--=C2=A0 =C2=A0 return TRUE;<br>
--#endif<br>
--<br>
--#ifdef GDK_WINDOWING_MIR<br>
--=C2=A0 if (GDK_IS_MIR_DISPLAY (gtk_widget_get_display (GTK_WIDGET (window=
))))<br>
--=C2=A0 =C2=A0 return TRUE;<br>
--#endif<br>
--<br>
--=C2=A0 csd_env =3D g_getenv (&quot;GTK_CSD&quot;);<br>
--<br>
--=C2=A0 return (g_strcmp0 (csd_env, &quot;1&quot;) =3D=3D 0);<br>
-+=C2=A0 return gtk_window_can_use_csd (window);<br>
- }<br>
-<br>
- static void<br>
---<br>
-cgit v0.10.2<br>
-<br>
diff --git a/meta/recipes-gnome/gtk+/gtk+<a href=3D"http://3_3.18.8.bb" rel=
=3D"noreferrer" target=3D"_blank">3_3.18.8.bb</a> b/meta/recipes-gnome/gtk+=
/gtk+<a href=3D"http://3_3.20.6.bb" rel=3D"noreferrer" target=3D"_blank">3_=
3.20.6.bb</a><br>
similarity index 57%<br>
rename from meta/recipes-gnome/gtk+/gtk+<a href=3D"http://3_3.18.8.bb" rel=
=3D"noreferrer" target=3D"_blank">3_3.18.8.bb</a><br>
rename to meta/recipes-gnome/gtk+/gtk+<a href=3D"http://3_3.20.6.bb" rel=3D=
"noreferrer" target=3D"_blank">3_3.20.6.bb</a><br>
index d776b6d..453a4e2 100644<br>
--- a/meta/recipes-gnome/gtk+/gtk+<a href=3D"http://3_3.18.8.bb" rel=3D"nor=
eferrer" target=3D"_blank">3_3.18.8.bb</a><br>
+++ b/meta/recipes-gnome/gtk+/gtk+<a href=3D"http://3_3.20.6.bb" rel=3D"nor=
eferrer" target=3D"_blank">3_3.20.6.bb</a><br>
@@ -3,14 +3,13 @@ require gtk+3.inc<br>
=C2=A0 MAJ_VER =3D &quot;${@oe.utils.trim_version(&quot;${PV}&quot;, 2)}&qu=
ot;<br>
<br>
=C2=A0 SRC_URI =3D &quot;<a href=3D"http://ftp.gnome.org/pub/gnome/sources/=
gtk+/$%7BMAJ_VER%7D/gtk+-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_bl=
ank">http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.=
xz</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://hardcoded_libtool.patch \<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Dont-force-csd.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Do-not-try-to-initialize-G=
L-without-libGL.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Add-disable-opengl-co=
nfigure-option.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Hardcoded-libtool.pat=
ch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Do-not-try-to-initial=
ize-GL-without-libGL.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-Add-disable-opengl-co=
nfigure-option.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-configure.ac-Fix-wayl=
and-protocols-path.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;9671acb41dc13561d19233f1a75cf184&quot;<br>
-SRC_URI[sha256sum] =3D &quot;1c53ef1bb55364698f7183ecd185b547f92f4a3a7abfa=
fd531400232e2e052f8&quot;<br>
+SRC_URI[md5sum] =3D &quot;914e55ea053161f4a575c1c8dade7954&quot;<br>
+SRC_URI[sha256sum] =3D &quot;3f8016563a96b1cfef4ac9e795647f6316deb2978ff93=
9b19e4e4f8f936fa4b2&quot;<br>
<br>
=C2=A0 S =3D &quot;${WORKDIR}/gtk+-${PV}&quot;<br>
<br>
diff --git a/meta/recipes-gnome/gtk+/<a href=3D"http://gtk-icon-utils-nativ=
e_3.18.8.bb" rel=3D"noreferrer" target=3D"_blank">gtk-icon-utils-native_3.1=
8.8.bb</a> b/meta/recipes-gnome/gtk+/<a href=3D"http://gtk-icon-utils-nativ=
e_3.20.6.bb" rel=3D"noreferrer" target=3D"_blank">gtk-icon-utils-native_3.2=
0.6.bb</a><br>
similarity index 93%<br>
rename from meta/recipes-gnome/gtk+/<a href=3D"http://gtk-icon-utils-native=
_3.18.8.bb" rel=3D"noreferrer" target=3D"_blank">gtk-icon-utils-native_3.18=
.8.bb</a><br>
rename to meta/recipes-gnome/gtk+/<a href=3D"http://gtk-icon-utils-native_3=
.20.6.bb" rel=3D"noreferrer" target=3D"_blank">gtk-icon-utils-native_3.20.6=
.bb</a><br>
index 793f14a..e870ba3 100644<br>
--- a/meta/recipes-gnome/gtk+/<a href=3D"http://gtk-icon-utils-native_3.18.=
8.bb" rel=3D"noreferrer" target=3D"_blank">gtk-icon-utils-native_3.18.8.bb<=
/a><br>
+++ b/meta/recipes-gnome/gtk+/<a href=3D"http://gtk-icon-utils-native_3.20.=
6.bb" rel=3D"noreferrer" target=3D"_blank">gtk-icon-utils-native_3.20.6.bb<=
/a><br>
@@ -10,8 +10,8 @@ MAJ_VER =3D &quot;${@oe.utils.trim_version(&quot;${PV}&qu=
ot;, 2)}&quot;<br>
<br>
=C2=A0 SRC_URI =3D &quot;<a href=3D"http://ftp.gnome.org/pub/gnome/sources/=
gtk+/$%7BMAJ_VER%7D/gtk+-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_bl=
ank">http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.=
xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Remove-Gdk-dependency-from=
-gtk-encode-symbolic-svg.patch&quot;<br>
-SRC_URI[md5sum] =3D &quot;9671acb41dc13561d19233f1a75cf184&quot;<br>
-SRC_URI[sha256sum] =3D &quot;1c53ef1bb55364698f7183ecd185b547f92f4a3a7abfa=
fd531400232e2e052f8&quot;<br>
+SRC_URI[md5sum] =3D &quot;914e55ea053161f4a575c1c8dade7954&quot;<br>
+SRC_URI[sha256sum] =3D &quot;3f8016563a96b1cfef4ac9e795647f6316deb2978ff93=
9b19e4e4f8f936fa4b2&quot;<br>
<br>
=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D5f30f0716dfdd0d91eb4=
39ebec522ec2 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://gtk/gtk.h;endline=3D25;md5=3D1d8dc0fccdbfa26287a271dce88af737 \<=
br>
<br>
</blockquote>
</div></div></blockquote></div><br></div></div>

--001a11c1729ac8cdea0536e3fd14--
