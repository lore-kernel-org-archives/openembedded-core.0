Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tjpkf-0001da-Bh
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 12:17:54 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so1978635bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2012 03:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=sWYlpYKjwsxunSptbhEhKuhnBOsUNgMx35n4obRc4Wg=;
	b=fPn55yyFQugknDIOExiGrUeHDZXpa0W6fzOpgC1YACbCq+pzHQkhsZP68wFT/VA+FJ
	ei9cJ0CK1tOS09G9yfwYu2IkHD4qS7elgMH85Arqw4Vydmyxy24G/P/k84Zv369eBldp
	p9+/8jgRRAD/DXTSxMEbONAGx50/cr6SMPjYGpQG4KoCrlomWHkqQZyoTCi7JmVMrguQ
	oPHrx2TO4z8xWZBizyVEUMjKLJwFcKLwb+2bTDEkSm/ROpTQ/AaeZEKl4yFEj0ggGNJ8
	EWBhq4A4a6mrmn5QkthstR2vw5AUcH+W+bd4LIl7A8ZYI5r0K5JXZ+6N3IM2yCdV9qoD
	B7tw==
Received: by 10.204.130.210 with SMTP id u18mr3703302bks.129.1355569395664;
	Sat, 15 Dec 2012 03:03:15 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id i20sm6150659bkw.5.2012.12.15.03.03.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Dec 2012 03:03:14 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TjpWT-00019p-02; Sat, 15 Dec 2012 13:03:13 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Dec 2012 13:03:12 +0200
Message-Id: <1355569392-4419-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] gtk+: update to upstream version 2.24.14
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
X-List-Received-Date: Sat, 15 Dec 2012 11:18:08 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch     |    0
 ...01-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch |    0
 .../gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/cellrenderer-cairo.patch |    0
 .../gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/configure-nm.patch       |    0
 .../gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/configurefix.patch       |    0
 .../gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/doc-fixes.patch          |    0
 .../gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/entry-cairo.patch        |    0
 .../gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/hardcoded_libtool.patch  |    0
 .../gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/no-demos.patch           |    0
 .../gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/run-iconcache.patch      |    0
 .../gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/toggle-font.diff         |    0
 .../gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/xsettings.patch          |    0
 meta/recipes-gnome/gtk+/{gtk+_2.24.13.bb => gtk+_2.24.14.bb}     |    6 +++---
 13 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/cellrenderer-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/configure-nm.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/configurefix.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/doc-fixes.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/entry-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/no-demos.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/run-iconcache.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/toggle-font.diff (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.13 => gtk+-2.24.14}/xsettings.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.13.bb => gtk+_2.24.14.bb} (93%)

diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.13/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.14/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.13/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.14/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.13/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.14/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.13/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.14/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.13/cellrenderer-cairo.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.14/cellrenderer-cairo.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.13/cellrenderer-cairo.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.14/cellrenderer-cairo.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.13/configure-nm.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.14/configure-nm.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.13/configure-nm.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.14/configure-nm.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.13/configurefix.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.14/configurefix.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.13/configurefix.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.14/configurefix.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.13/doc-fixes.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.14/doc-fixes.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.13/doc-fixes.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.14/doc-fixes.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.13/entry-cairo.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.14/entry-cairo.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.13/entry-cairo.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.14/entry-cairo.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.13/hardcoded_libtool.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.14/hardcoded_libtool.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.13/hardcoded_libtool.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.14/hardcoded_libtool.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.13/no-demos.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.14/no-demos.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.13/no-demos.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.14/no-demos.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.13/run-iconcache.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.14/run-iconcache.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.13/run-iconcache.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.14/run-iconcache.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.13/toggle-font.diff b/meta/recipes-gnome/gtk+/gtk+-2.24.14/toggle-font.diff
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.13/toggle-font.diff
rename to meta/recipes-gnome/gtk+/gtk+-2.24.14/toggle-font.diff
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.13/xsettings.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.14/xsettings.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.13/xsettings.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.14/xsettings.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.13.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.14.bb
similarity index 93%
rename from meta/recipes-gnome/gtk+/gtk+_2.24.13.bb
rename to meta/recipes-gnome/gtk+/gtk+_2.24.14.bb
index bc88284..465f2b7 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.13.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.14.bb
@@ -28,10 +28,10 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
 #        file://combo-arrow-size.patch;striplevel=0
 #            file://configurefix.patch
 
-PR = "r2"
+PR = "r0"
 
-SRC_URI[md5sum] = "e949406751df51e1e40e85628005a069"
-SRC_URI[sha256sum] = "35e1a01e46b02970b02ee9f299390d0aa57c1215ad2667bcd584b72f4ea6513d"
+SRC_URI[md5sum] = "e2c16f119ed624893ecfc3775930ae4c"
+SRC_URI[sha256sum] = "8bd1b8b511a3004e8972badf467ce829e6855cdff15540b9344dc934c68008ac"
 
 EXTRA_OECONF = "--without-libtiff --without-libjasper --enable-xkb --disable-glibtest --disable-cups --disable-xinerama"
 
-- 
1.7.10.4



