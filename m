Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-06.prod.phx3.secureserver.net
	(p3plsmtpa07-06.prod.phx3.secureserver.net [173.201.192.235])
	by mail.openembedded.org (Postfix) with ESMTP id 49CCE61F47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 18:59:23 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa07-06.prod.phx3.secureserver.net with 
	id HuzN1m00P1mTNtu01uzPht; Tue, 27 Aug 2013 11:59:23 -0700
Message-ID: <521CF70C.2050100@pabigot.com>
Date: Tue, 27 Aug 2013 13:59:24 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: qt4-x11-free dependence on gtk+
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
X-List-Received-Date: Tue, 27 Aug 2013 18:59:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Since "bitbake qt4-x11-free" failed for me until I did "bitbake gtk+", 
qt4-x11-free needs some sort of dependency on gtk+ to avoid the failure 
below.  I'm guessing it's something like the following added to 
qt4-x11-free.inc:

PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk', '', 
d)}"
PACKAGECONFIG[gtk] = "-gtkstyle,-no-gtkstyle,gtk+"

but since it takes about an hour to build qt4-x11-free on my system I'm 
hoping somebody can tell me whether that's the right approach.

Peter

arm-poky-linux-gnueabi-g++  -march=armv7-a -mthumb-interwork 
-mfloat-abi=softfp -mfpu=neon 
--sysroot=/prj/oe/omap/build-gumstix-dev/tmp/sysroots/overo -c -O2 -pipe 
-g -feliminate-unused-debug-types -fpermissive 
-fvisibility-inlines-hidden 
-I/prj/oe/omap/build-gumstix-dev/tmp/sysroots/overo/usr/include 
-I/prj/oe/omap/build-gumstix-dev/tmp/sysroots/overo/usr/include/freetype2 -pthread 
-I/prj/oe/omap/build-gumstix-dev/tmp/sysroots/overo/usr/include/glib-2.0 
-I/prj/oe/omap/build-gumstix-dev/tmp/sysroots/overo/usr/lib/glib-2.0/include 
-pthread 
-I/prj/oe/omap/build-gumstix-dev/tmp/sysroots/overo/usr/include/gtk-2.0 
-I/prj/oe/omap/build-gumstix-dev/tmp/sysroots/overo/usr/lib/gtk-2.0/include 
-I/prj/oe/omap/build-gumstix-dev/tmp/sysroots/overo/usr/include/pango-1.0 -I/prj/oe/omap/build-gumstix-dev/tmp/sysroots/overo/usr/include/cairo 
-I/prj/oe/omap/build-gumstix-dev/tmp/sysroots/overo/usr/include/pixman-1 
-I/prj/oe/omap/build-gumstix-dev/tmp/sysroots/overo/usr/include/libpng16 
-I/prj/oe/omap/build-gumstix-dev/tmp/sysroots/overo/usr/include/gdk-pixbuf-2.0 
-I/prj/oe/omap/build-gumstix-dev/tmp/sysroots/overo/usr/include/libpng16 
-I/prj/oe/omap/build-gumstix-dev/tmp/sysroots/overo/usr/include/pango-1.0 -I/prj/oe/omap/build-gumstix-dev/tmp/sysroots/overo/usr/include/harfbuzz 
-I/prj/oe/omap/build-gumstix-dev/tmp/sysroots/overo/usr/include/pango-1.0 -I/prj/oe/omap/build-gumstix-dev/tmp/sysroots/overo/usr/include/freetype2 
-I/prj/oe/omap/build-gumstix-dev/tmp/sysroots/overo/usr/include/atk-1.0 
-I/prj/oe/omap/build-gumstix-dev/tmp/sysroots/overo/usr/include/glib-2.0 
-I/prj/oe/omap/build-gumstix-dev/tmp/sysroots/overo/usr/lib/glib-2.0/include 
-O2 -O2 -fvisibility=hidden -fvisibility-inlines-hidden 
-fvisibility=hidden -fvisibility=hidden -fvisibility-inlines-hidden 
-Wall -W -Wall -W -Wall -W -D_REENTRANT 
-I/prj/oe/omap/build-gumstix-dev/tmp/sysroots/overo/usr/include/freetype2 -fPIC 
-fPIC -fPIC -DQT_SHARED -DQT_BUILD_GUI_LIB -DQT_NO_USING_NAMESPACE 
-DQT_NO_CAST_TO_ASCII -DQT_ASCII_CAST_WARNINGS -DQT3_SUPPORT 
-DQT_MOC_COMPAT -DQT_USE_QSTRINGBUILDER -DQT_NO_OPENTYPE 
-DQT_NO_STYLE_MAC -DQT_NO_STYLE_WINDOWSVISTA -DQT_NO_STYLE_WINDOWSXP 
-DQT_NO_STYLE_WINDOWSCE -DQT_NO_STYLE_WINDOWSMOBILE -DQT_NO_STYLE_S60 
-DQ_INTERNAL_QAPP_SRC -DQT_HAVE_NEON -DQT_NO_DEBUG -DQT_CORE_LIB 
-D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -I../../mkspecs/linux-g++ -I. 
-I../../include/QtCore -I../../include -I../../include/QtGui 
-I.rcc/release-shared -I../3rdparty/xorg -Iimage 
-I../3rdparty/harfbuzz/src -Idialogs 
-I/prj/oe/omap/build-gumstix-dev/tmp/sysroots/overo/usr/include/freetype2 -I.moc/release-shared 
-I.uic/release-shared -o .obj/release-shared/qx11embed_x11.o 
kernel/qx11embed_x11.cpp
In file included from ../../include/QtGui/private/qgtkstyle_p.h:1:0,
                  from kernel/qguiplatformplugin.cpp:63:
../../include/QtGui/private/../../../src/gui/styles/qgtkstyle_p.h:69:21: 
fatal error: gtk/gtk.h: No such file or directory
  #include <gtk/gtk.h>
                      ^
compilation terminated.
make[1]: *** [.obj/release-shared/qguiplatformplugin.o] Error 1



