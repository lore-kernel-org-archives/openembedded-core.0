Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tbo2R-000416-BU
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 08:51:03 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so3882273lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 23:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=jfzCZQz/4HD1RKMwSekmakikE9UT3BndWEqXqSymDa8=;
	b=yOiYHSaKDSgRZ9e9uGA6xENSwlyi8gIdn9KJOZvHzeQGaVeK8zqlZIqXqK1Et1NqaH
	BpX84Nm45OvFRUgoh2sV/l2S/p+4VqLlOlPYh4i0oVdcXw4TC34Iy8ScL2UjEiXgsKKY
	C15OHJezUt2QoLjHZTsD/xEapbKPXcxFj7NIQkFyIfduKlTI+yrRZXkm+0bXbl/YQRfW
	PGTxyGyUKS2EKLXxGYNJMWiTiJNhdPQauMGKBNnLVC3R5etAk2Jif8nppvTkP34pBv+u
	/itU35FpAtOjwV8lU/rVd8po7JLr0HWsU5kieUchgjUKTmgnhgmNqwmx8KgS6iAgWSLH
	rmqg==
Received: by 10.112.17.169 with SMTP id p9mr1522324lbd.9.1353656215876;
	Thu, 22 Nov 2012 23:36:55 -0800 (PST)
Received: from prime (a91-153-2-41.elisa-laajakaista.fi. [91.153.2.41])
	by mx.google.com with ESMTPS id ma15sm2053341lab.4.2012.11.22.23.36.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Nov 2012 23:36:53 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1Tbnoh-0007rE-Ui; Fri, 23 Nov 2012 09:36:52 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Nov 2012 09:36:14 +0200
Message-Id: <1353656174-30164-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] gtk+: update to upstream version 2.24.13
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
X-List-Received-Date: Fri, 23 Nov 2012 07:51:03 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 ...-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch |    0
 .../{gtk+-2.24.8 => gtk+-2.24.13}/cellrenderer-cairo.patch     |    0
 .../gtk+/{gtk+-2.24.8 => gtk+-2.24.13}/configure-nm.patch      |    0
 .../gtk+/{gtk+-2.24.8 => gtk+-2.24.13}/configurefix.patch      |    0
 .../gtk+/{gtk+-2.24.8 => gtk+-2.24.13}/doc-fixes.patch         |    0
 .../gtk+/{gtk+-2.24.8 => gtk+-2.24.13}/entry-cairo.patch       |    0
 .../gtk+/{gtk+-2.24.8 => gtk+-2.24.13}/hardcoded_libtool.patch |    0
 .../gtk+/{gtk+-2.24.8 => gtk+-2.24.13}/no-demos.patch          |    0
 .../gtk+/{gtk+-2.24.8 => gtk+-2.24.13}/run-iconcache.patch     |    0
 .../gtk+/{gtk+-2.24.8 => gtk+-2.24.13}/toggle-font.diff        |    0
 .../gtk+/{gtk+-2.24.8 => gtk+-2.24.13}/xsettings.patch         |    0
 meta/recipes-gnome/gtk+/{gtk+_2.24.8.bb => gtk+_2.24.13.bb}    |    8 ++++----
 12 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.8 => gtk+-2.24.13}/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.8 => gtk+-2.24.13}/cellrenderer-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.8 => gtk+-2.24.13}/configure-nm.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.8 => gtk+-2.24.13}/configurefix.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.8 => gtk+-2.24.13}/doc-fixes.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.8 => gtk+-2.24.13}/entry-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.8 => gtk+-2.24.13}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.8 => gtk+-2.24.13}/no-demos.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.8 => gtk+-2.24.13}/run-iconcache.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.8 => gtk+-2.24.13}/toggle-font.diff (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.8 => gtk+-2.24.13}/xsettings.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.8.bb => gtk+_2.24.13.bb} (93%)

diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.8/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.13/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.8/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.13/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.8/cellrenderer-cairo.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.13/cellrenderer-cairo.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.8/cellrenderer-cairo.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.13/cellrenderer-cairo.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.8/configure-nm.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.13/configure-nm.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.8/configure-nm.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.13/configure-nm.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.8/configurefix.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.13/configurefix.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.8/configurefix.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.13/configurefix.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.8/doc-fixes.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.13/doc-fixes.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.8/doc-fixes.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.13/doc-fixes.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.8/entry-cairo.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.13/entry-cairo.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.8/entry-cairo.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.13/entry-cairo.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.8/hardcoded_libtool.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.13/hardcoded_libtool.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.8/hardcoded_libtool.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.13/hardcoded_libtool.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.8/no-demos.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.13/no-demos.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.8/no-demos.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.13/no-demos.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.8/run-iconcache.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.13/run-iconcache.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.8/run-iconcache.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.13/run-iconcache.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.8/toggle-font.diff b/meta/recipes-gnome/gtk+/gtk+-2.24.13/toggle-font.diff
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.8/toggle-font.diff
rename to meta/recipes-gnome/gtk+/gtk+-2.24.13/toggle-font.diff
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.8/xsettings.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.13/xsettings.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.8/xsettings.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.13/xsettings.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.13.bb
similarity index 93%
rename from meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
rename to meta/recipes-gnome/gtk+/gtk+_2.24.13.bb
index bbf765b..b358b7f 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.13.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://gtk/gtk.h;endline=27;md5=c59e0b4490dd135a5726ebf851f9b17f \
                     file://gdk/gdk.h;endline=27;md5=07db285ec208fb3e0bf7d861b0614202 \
                     file://tests/testgtk.c;endline=27;md5=262db5db5f776f9863e56df31423e24c"
-SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
+SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
            file://xsettings.patch \
            file://run-iconcache.patch \
            file://configure-nm.patch \
@@ -27,10 +27,10 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
 #        file://combo-arrow-size.patch;striplevel=0
 #            file://configurefix.patch
 
-PR = "r7"
+PR = "r1"
 
-SRC_URI[md5sum] = "0413187f7e596aef00ccd1b54776ff03"
-SRC_URI[sha256sum] = "ac2325a65312922a6722a7c02a389f3f4072d79e13131485cc7b7226e2537043"
+SRC_URI[md5sum] = "e949406751df51e1e40e85628005a069"
+SRC_URI[sha256sum] = "35e1a01e46b02970b02ee9f299390d0aa57c1215ad2667bcd584b72f4ea6513d"
 
 EXTRA_OECONF = "--without-libtiff --without-libjasper --enable-xkb --disable-glibtest --disable-cups --disable-xinerama"
 
-- 
1.7.10.4



