Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9fLk-0003th-EA
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 17:50:08 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3201846fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 08:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=EeKSHciOc12N2NGUSTMeuavbGlPZ/RnpWQbazxi8PE4=;
	b=NmBHj8ewXchGh1klSRmi5da0w4dUTji6wbCiwLMhu/On1vOdsxS24kDEMDCFyv/uyz
	630abC3J+QeZ0l4nvFKtSSh6/On+14qy8uwFgVIb8LiZevxnNvbCqbCZtmQ+E3jne7lo
	ytTBuvfrPXJiSSl16KU1aSfCjcGBAuEx1kDC0=
Received: by 10.223.99.209 with SMTP id v17mr2852850fan.119.1317397481568;
	Fri, 30 Sep 2011 08:44:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v17sm7170579fai.18.2011.09.30.08.44.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 08:44:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 17:43:28 +0200
Message-Id: <309456df599bf3d1ade20c9f3ca10a1bb5a8bf1e.1317397204.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <e89070827bd58e6b3e54d336dd179ad508a960ee.1317397204.git.Martin.Jansa@gmail.com>
References: <e89070827bd58e6b3e54d336dd179ad508a960ee.1317397204.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317397204.git.Martin.Jansa@gmail.com>
References: <cover.1317397204.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 9/9] gtk+: upgrade to 2.24.6
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
X-List-Received-Date: Fri, 30 Sep 2011 15:50:08 -0000

* older version doesn't build with glib-2.30.0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...Duplicate-the-exec-string-returned-by-gtk.patch |    0
 .../cellrenderer-cairo.patch                       |    0
 .../configurefix.patch                             |    0
 .../{gtk+-2.22.1 => gtk+-2.24.6}/doc-fixes.patch   |    0
 .../{gtk+-2.22.1 => gtk+-2.24.6}/entry-cairo.patch |    0
 .../hardcoded_libtool.patch                        |    0
 .../{gtk+-2.22.1 => gtk+-2.24.6}/no-demos.patch    |    0
 .../run-iconcache.patch                            |    0
 .../{gtk+-2.22.1 => gtk+-2.24.6}/toggle-font.diff  |    0
 .../{gtk+-2.22.1 => gtk+-2.24.6}/xsettings.patch   |    0
 .../gtk+/{gtk+_2.22.1.bb => gtk+_2.24.6.bb}        |    8 +++-----
 11 files changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 => gtk+-2.24.6}/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 => gtk+-2.24.6}/cellrenderer-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 => gtk+-2.24.6}/configurefix.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 => gtk+-2.24.6}/doc-fixes.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 => gtk+-2.24.6}/entry-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 => gtk+-2.24.6}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 => gtk+-2.24.6}/no-demos.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 => gtk+-2.24.6}/run-iconcache.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 => gtk+-2.24.6}/toggle-font.diff (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 => gtk+-2.24.6}/xsettings.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.22.1.bb => gtk+_2.24.6.bb} (90%)

diff --git a/meta/recipes-gnome/gtk+/gtk+-2.22.1/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.6/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.22.1/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.6/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.22.1/cellrenderer-cairo.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.6/cellrenderer-cairo.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.22.1/cellrenderer-cairo.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.6/cellrenderer-cairo.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.22.1/configurefix.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.6/configurefix.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.22.1/configurefix.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.6/configurefix.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.22.1/doc-fixes.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.6/doc-fixes.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.22.1/doc-fixes.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.6/doc-fixes.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.22.1/entry-cairo.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.6/entry-cairo.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.22.1/entry-cairo.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.6/entry-cairo.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.22.1/hardcoded_libtool.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.6/hardcoded_libtool.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.22.1/hardcoded_libtool.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.6/hardcoded_libtool.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.22.1/no-demos.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.6/no-demos.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.22.1/no-demos.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.6/no-demos.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.22.1/run-iconcache.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.6/run-iconcache.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.22.1/run-iconcache.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.6/run-iconcache.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.22.1/toggle-font.diff b/meta/recipes-gnome/gtk+/gtk+-2.24.6/toggle-font.diff
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.22.1/toggle-font.diff
rename to meta/recipes-gnome/gtk+/gtk+-2.24.6/toggle-font.diff
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.22.1/xsettings.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.6/xsettings.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.22.1/xsettings.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.6/xsettings.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.22.1.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
similarity index 90%
rename from meta/recipes-gnome/gtk+/gtk+_2.22.1.bb
rename to meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
index ea8a5cb..c017f99 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.22.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.6.bb
@@ -4,9 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://gtk/gtk.h;endline=27;md5=c59e0b4490dd135a5726ebf851f9b17f \
                     file://gdk/gdk.h;endline=27;md5=07db285ec208fb3e0bf7d861b0614202 \
                     file://tests/testgtk.c;endline=27;md5=262db5db5f776f9863e56df31423e24c"
-PR = "r5"
-
-SRC_URI = "http://download.gnome.org/sources/gtk+/2.22/gtk+-${PV}.tar.bz2 \
+SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
            file://xsettings.patch \
            file://run-iconcache.patch \
            file://hardcoded_libtool.patch \
@@ -28,8 +26,8 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.22/gtk+-${PV}.tar.bz2 \
 #        file://combo-arrow-size.patch;striplevel=0
 #            file://configurefix.patch
 
-SRC_URI[md5sum] = "fdce46ba354c155230b7d4090b17f7d9"
-SRC_URI[sha256sum] = "965bc124f0d25087c4cb2a64cbfd7e4f896e05be8d560fbba68dd8685ba24d07"
+SRC_URI[md5sum] = "421100f6597e613234f8dead6091a9fe"
+SRC_URI[sha256sum] = "6f45bdbf9ea27eb3b5f977d7ee2365dede0d0ce454985680c26e5210163bbf37"
 
 EXTRA_OECONF = "--without-libtiff --without-libjasper --enable-xkb --disable-glibtest --disable-cups --disable-xinerama"
 
-- 
1.7.6.1



