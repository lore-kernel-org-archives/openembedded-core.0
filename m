Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2SL9-0002os-3b
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 20:03:59 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Feb 2012 10:55:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="112351238"
Received: from unknown (HELO [10.255.15.37]) ([10.255.15.37])
	by azsmga001.ch.intel.com with ESMTP; 28 Feb 2012 10:55:29 -0800
Message-ID: <4F4D2321.6050508@linux.intel.com>
Date: Tue, 28 Feb 2012 10:55:29 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1330362610-12851-1-git-send-email-obi@opendreambox.org>
	<CAP9ODKr1faEWrO877gfeMkutp8_STOvNp81iA00uiC0w46A1qQ@mail.gmail.com>
	<1624619.CXJLtNuTG7@helios> <4F4C279E.8020801@opendreambox.org>
In-Reply-To: <4F4C279E.8020801@opendreambox.org>
Subject: Re: [PATCH v2] qt4.inc: depend on tiff
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
X-List-Received-Date: Tue, 28 Feb 2012 19:03:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/27/2012 05:02 PM, Andreas Oberritter wrote:
>  From fdececee9146f4d23494361d29a34877d67b879b Mon Sep 17 00:00:00 2001
> From: Andreas Oberritter<obi@opendreambox.org>
> Date: Mon, 27 Feb 2012 18:03:22 +0100
> Subject: [PATCH] qt4.inc: depend on tiff
>
> * Fixes the following error with qt4-embedded-4.8.0 and possibly others:
>
> | ../../../gui/image/qtiffhandler.cpp:48:20: fatal error: tiffio.h: No such file or directory
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
>   meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
>   meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
>   meta/recipes-qt/qt4/qt4.inc          |    4 ++--
>   3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
> index e472af5..80948f3 100644
> --- a/meta/recipes-qt/qt4/qt4-embedded.inc
> +++ b/meta/recipes-qt/qt4/qt4-embedded.inc
> @@ -2,7 +2,7 @@ DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is
>   SECTION = "libs"
>   HOMEPAGE ="http://qt.nokia.com"
>   DEPENDS += "directfb tslib"
> -INC_PR = "r40"
> +INC_PR = "r41"
>
>   QT_BASE_LIB  ?= "libqt-embedded"
>
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
> index 40939de..75487f7 100644
> --- a/meta/recipes-qt/qt4/qt4-x11-free.inc
> +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> @@ -5,7 +5,7 @@ HOMEPAGE ="http://qt.nokia.com"
>   SECTION = "x11/libs"
>   DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
>
> -INC_PR = "r37"
> +INC_PR = "r38"
>
>   QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
>   QT_GLFLAGS_qemux86 = "-opengl"
> diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
> index ea868ff..161daa3 100644
> --- a/meta/recipes-qt/qt4/qt4.inc
> +++ b/meta/recipes-qt/qt4/qt4.inc
> @@ -1,6 +1,6 @@
>   inherit qmake_base
>
> -DEPENDS += "qt4-tools-native freetype jpeg libpng zlib dbus openssl glib-2.0 gstreamer gst-plugins-base sqlite3"
> +DEPENDS += "qt4-tools-native freetype jpeg libpng zlib dbus openssl glib-2.0 gstreamer gst-plugins-base sqlite3 tiff"
>
>   require qt4_arch.inc
>   QT_ARCH := "${@qt_arch(d)}"
> @@ -15,7 +15,7 @@ QT_GLFLAGS ?= ""
>
>   QT_CONFIG_FLAGS += "-release -no-cups -reduce-relocations \
>                       -shared -no-nas-sound -no-nis \
> -                    -system-libjpeg -system-libpng -system-zlib \
> +                    -system-libjpeg -system-libpng -system-libtiff -system-zlib \
>                       -no-pch -qdbus -stl -glib -phonon -webkit \
>                       -xmlpatterns -no-rpath -qt3support -silent \
>                       ${QT_SQL_DRIVER_FLAGS} \
> -- 1.7.5.4

Merged into OE-core

Thanks
	Sau!


