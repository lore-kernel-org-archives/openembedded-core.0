Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TJ4db-00056A-OP
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 17:44:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Oct 2012 08:31:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,524,1344236400"; d="scan'208";a="218375723"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by orsmga002.jf.intel.com with ESMTP; 02 Oct 2012 08:31:00 -0700
Message-ID: <506B08B4.7010200@linux.intel.com>
Date: Tue, 02 Oct 2012 08:31:00 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1349171025-17731-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1349171025-17731-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] galago: remove
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
X-List-Received-Date: Tue, 02 Oct 2012 15:44:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/02/2012 02:43 AM, Ross Burton wrote:
> Galago has been replaced with Telepathy and Folks, and has been unmaintained for
> years.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   .../galago/galago-daemon_0.5.1.bb                  |   18 ------------
>   .../galago/libgalago-0.5.2/mkdir.patch             |   29 --------------------
>   .../galago/libgalago-0.5.2/pkgconfig.patch         |   16 -----------
>   .../recipes-connectivity/galago/libgalago_0.5.2.bb |   29 --------------------
>   .../packagegroups/packagegroup-sdk-gmae.inc        |    2 --
>   5 files changed, 94 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/galago/galago-daemon_0.5.1.bb
>   delete mode 100644 meta/recipes-connectivity/galago/libgalago-0.5.2/mkdir.patch
>   delete mode 100644 meta/recipes-connectivity/galago/libgalago-0.5.2/pkgconfig.patch
>   delete mode 100644 meta/recipes-connectivity/galago/libgalago_0.5.2.bb
>
Merged into OE-Core

Thanks
	Sau!

> diff --git a/meta/recipes-connectivity/galago/galago-daemon_0.5.1.bb b/meta/recipes-connectivity/galago/galago-daemon_0.5.1.bb
> deleted file mode 100644
> index 81a367d..0000000
> --- a/meta/recipes-connectivity/galago/galago-daemon_0.5.1.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -SUMMARY =       "Desktop presence framework"
> -DESCRIPTION =   "Galago is a desktop presence framework, designed to transmit presence information between programs."
> -HOMEPAGE =      "http://www.galago-project.org/"
> -LICENSE =       "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> -DEPENDS =       "libgalago dbus glib-2.0"
> -
> -SRC_URI =       "http://www.galago-project.org/files/releases/source/${BPN}/${BPN}-${PV}.tar.gz "
> -
> -SRC_URI[md5sum] = "fdb81f938f86f380b127158ebb542279"
> -SRC_URI[sha256sum] = "db42a0d1d0f8b069ea5ac1203207f9178f25ac1367f4910bd48547f5be1db4c2"
> -
> -EXTRA_OECONF =	"--disable-binreloc --disable-check --disable-tests"
> -
> -FILES_${PN} += "${datadir}/dbus-1/services/"
> -
> -inherit autotools pkgconfig gettext
> -
> diff --git a/meta/recipes-connectivity/galago/libgalago-0.5.2/mkdir.patch b/meta/recipes-connectivity/galago/libgalago-0.5.2/mkdir.patch
> deleted file mode 100644
> index 4f18686..0000000
> --- a/meta/recipes-connectivity/galago/libgalago-0.5.2/mkdir.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> -Index: libgalago-0.5.2/po/Makefile.in.in
> -===================================================================
> ---- libgalago-0.5.2.orig/po/Makefile.in.in	2006-06-06 09:59:17.000000000 +0100
> -+++ libgalago-0.5.2/po/Makefile.in.in	2009-08-19 20:31:56.000000000 +0100
> -@@ -29,7 +29,7 @@
> - INSTALL = @INSTALL@
> - INSTALL_DATA = @INSTALL_DATA@
> - MKINSTALLDIRS = @MKINSTALLDIRS@
> --mkinstalldirs = $(SHELL) `case "$(MKINSTALLDIRS)" in /*) echo "$(MKINSTALLDIRS)" ;; *) echo "$(MKINSTALLDIRS)" ;; esac`
> -+mkinstalldirs = $(MKINSTALLDIRS)
> -
> - CC = @CC@
> - GMSGFMT = @GMSGFMT@
> -Index: libgalago-0.5.2/configure.ac
> -===================================================================
> ---- libgalago-0.5.2.orig/configure.ac	2009-08-19 20:30:56.000000000 +0100
> -+++ libgalago-0.5.2/configure.ac	2009-08-19 20:31:28.000000000 +0100
> -@@ -157,6 +157,9 @@
> -
> - AC_SUBST(CFLAGS)
> -
> -+MKINSTALLDIRS="mkdir -p"
> -+AC_SUBST(MKINSTALLDIRS)
> -+
> - dnl ################################################################
> - dnl # Output the Makefiles
> - dnl ################################################################
> diff --git a/meta/recipes-connectivity/galago/libgalago-0.5.2/pkgconfig.patch b/meta/recipes-connectivity/galago/libgalago-0.5.2/pkgconfig.patch
> deleted file mode 100644
> index 6fbf552..0000000
> --- a/meta/recipes-connectivity/galago/libgalago-0.5.2/pkgconfig.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> -Index: libgalago-0.5.2/libgalago.pc.in
> -===================================================================
> ---- libgalago-0.5.2.orig/libgalago.pc.in	2006-05-17 08:53:26.000000000 +0100
> -+++ libgalago-0.5.2/libgalago.pc.in	2008-03-19 22:34:16.000000000 +0000
> -@@ -6,6 +6,7 @@
> - Name: libgalago
> - Description: Galago Association/Presence Communication Library
> - Version: @VERSION@
> --Libs: -L${libdir} -lgalago @PACKAGE_LIBS@
> --Cflags: -I${includedir} @PACKAGE_CFLAGS@
> -+Requires: dbus-1 glib-2.0 dbus-glib-1
> -+Libs: -L${libdir} -lgalago
> -+Cflags: -I${includedir}
> -
> diff --git a/meta/recipes-connectivity/galago/libgalago_0.5.2.bb b/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
> deleted file mode 100644
> index 2071952..0000000
> --- a/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -SUMMARY =       "Desktop presence framework"
> -DESCRIPTION =	"Galago is a desktop presence framework, designed to transmit presence information between programs."
> -HOMEPAGE =	"http://www.galago-project.org/"
> -LICENSE =	"LGPLv2.1+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
> -                    file://libgalago/galago.h;endline=21;md5=141785cb9ec62067398dda136a7bb401"
> -
> -DEPENDS = 	"dbus glib-2.0 dbus-glib"
> -
> -SRC_URI =	"http://www.galago-project.org/files/releases/source/${BPN}/${BPN}-${PV}.tar.gz \
> -                 file://mkdir.patch \
> -                 file://pkgconfig.patch "
> -
> -SRC_URI[md5sum] = "7ec92f2ecba1309ac4b71b4b4d8d0a0d"
> -SRC_URI[sha256sum] = "9b7c9845e2f661dbf5c2595e67bc7afd48f090ac2c033726c89d7f0e90791dfa"
> -PR = "r3"
> -
> -inherit autotools pkgconfig gettext
> -
> -EXTRA_OECONF = "--disable-tests --disable-check"
> -
> -do_configure_prepend_libc-uclibc() {
> -        touch ${S}/config.rpath
> -}
> -
> -do_install_append() {
> -	# We don't package autopackage files
> -	rm -rf ${D}${datadir}/autopackage
> -}
> diff --git a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> index f9e373d..2289572 100644
> --- a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> +++ b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> @@ -12,7 +12,6 @@ SDK-GMAE = " \
>       libebook-dev \
>       libxi-dev \
>       libsqlite3-dev \
> -    galago-daemon \
>       gnome-desktop \
>       gssdp \
>       gupnp \
> @@ -20,7 +19,6 @@ SDK-GMAE = " \
>       gupnp-tools \
>       gypsy \
>       libart-lgpl \
> -    libgalago \
>       libtelepathy \
>       pulseaudio \
>       telepathy-glib \
>


