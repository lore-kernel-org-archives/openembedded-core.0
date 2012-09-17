Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TDZ9u-0000g3-T7
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 13:06:34 +0200
Received: by bkcik5 with SMTP id ik5so2250597bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 03:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=oKrEz+qLApmxv6cEHaRa80FF9A3VCqx+gepLjrf1e7Q=;
	b=q8+8pMpxpENTlew4wXgSa0qcolPpmf0duEnuThnrY999sAihAAQ4QNMNjGrg2wisaI
	cvmVKNkQexbgFJmbd9c8HMNhaxaUpfYwGeANEaa4ermXsTyG9btsnnPjdnvGHP2Omee9
	Hq8yDluP7gxliyxQ55aGoAOVmzTQI+rj3X2CZtYrVicrkmdl1HScKU9Z+cnhRYXSDu2K
	Al9ctcPBCIEVBmcfuifjAAJ0cgwBnLhLJQAleayYKmcXBFLNTSm8OK4inTi+HheEgEj3
	mtvOYwrkQslJJosB3gKKoPJ9ARk1ugH0pA+Az74R9IYcx7bUK8k1fiz1oLw8a/tja1KM
	KG9Q==
Received: by 10.204.129.76 with SMTP id n12mr4094077bks.18.1347879236186;
	Mon, 17 Sep 2012 03:53:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g12sm5060463bkt.7.2012.09.17.03.53.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 03:53:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 12:54:00 +0200
Message-Id: <1347879240-17214-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <1347821246-13169-1-git-send-email-Martin.Jansa@gmail.com>
References: <1347821246-13169-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH] recipes: few more PR bumps to rebuild after libffi5 -> libffi6
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
X-List-Received-Date: Mon, 17 Sep 2012 11:06:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb           | 2 +-
 meta/recipes-connectivity/galago/libgalago_0.5.2.bb                     | 2 +-
 meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb                         | 2 +-
 meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb                       | 2 +-
 meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb                         | 2 +-
 meta/recipes-connectivity/telepathy/telepathy-glib_0.19.8.bb            | 2 +-
 meta/recipes-connectivity/telepathy/telepathy-mission-control_5.13.0.bb | 2 +-
 meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb                             | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb b/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
index 49135ab..f2dc0da 100644
--- a/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
+++ b/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
@@ -1,7 +1,7 @@
 require bluez4.inc
 require recipes-multimedia/gstreamer/gst-plugins-package.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
 SRC_URI[sha256sum] = "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4ad75fe52846f7487"
diff --git a/meta/recipes-connectivity/galago/libgalago_0.5.2.bb b/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
index 1a5dd23..2071952 100644
--- a/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
+++ b/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
@@ -13,7 +13,7 @@ SRC_URI =	"http://www.galago-project.org/files/releases/source/${BPN}/${BPN}-${P
 
 SRC_URI[md5sum] = "7ec92f2ecba1309ac4b71b4b4d8d0a0d"
 SRC_URI[sha256sum] = "9b7c9845e2f661dbf5c2595e67bc7afd48f090ac2c033726c89d7f0e90791dfa"
-PR = "r2"
+PR = "r3"
 
 inherit autotools pkgconfig gettext
 
diff --git a/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb b/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
index b87c755..9dc05e5 100644
--- a/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
+++ b/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 DEPENDS = "glib-2.0 libsoup-2.4 gobject-introspection-stub"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz"
 
diff --git a/meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb b/meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb
index ae96eda..598aa4d 100644
--- a/meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb
+++ b/meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb
@@ -7,7 +7,7 @@ DEPENDS = "gupnp"
 
 SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz"
 
-PR = "r1"
+PR = "r2"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb b/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
index 84e0679..c226c9e 100644
--- a/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
+++ b/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "021bb237741532af4bca50157ff326e4"
 SRC_URI[sha256sum] = "f01a1f4fd36ce161a3df29fa83e1a0a2fb40d3c9f30f6b403e7791688ad24cfe"
 
-PR = "r1"
+PR = "r2"
 
 EXTRA_OECONF = "--disable-introspection"
 
diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.8.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.8.bb
index 2b072bb..6bf27b2 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.8.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.8.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Telepathy Framework: GLib-based helper library for connection man
 HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
 DEPENDS = "glib-2.0 dbus python-native-runtime dbus-native dbus-glib"
 LICENSE = "LGPLv2.1+"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
 
diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.13.0.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.13.0.bb
index f1f4c1e..55ae117 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.13.0.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.13.0.bb
@@ -8,7 +8,7 @@ DEPENDS = "libtelepathy dbus-glib gconf"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-mission-control/telepathy-mission-control-${PV}.tar.gz"
 
-PR = "r0"
+PR = "r1"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb b/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
index da74a82..2fafcec 100644
--- a/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
+++ b/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 SRCREV = "1161"
 PV = "2.11.0+svnr${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "svn://svn.gnome.org/svn/gtkhtml2/;module=trunk;protocol=http \
            http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/css-stylesheet-user.patch;striplevel=0;name=patch2 \
-- 
1.7.12



