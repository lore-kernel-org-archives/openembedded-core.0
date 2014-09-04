Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 21C68713E0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 00:48:22 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id s18so193345lam.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 17:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kkpNMHP7ac0314bAJNRJK0lW+AHABjCuxjVXP3SFpYQ=;
	b=rbJvf4GHnItdnFEi0TJSz/4LhyvX1ku8Pf/qS0ssMtXh5MKzS/6G/lDVXjFl8Zpds1
	MahgFjDmbpDvTxHZYvIcmrt752auUwAVUNto28gompFvXpYf5vYfWMZ1BeHHIbcSTHFN
	7pOncy2x6/ToHoD7ZdaPA/FCbJezxiZ/V959wy8qLtBwcm0Safebfm9gK+V2uQJRjmFi
	z+rz2i0AOsjdDZSmvJi3PmpfPaVKeUDPxPkjgnqf0171qFJgcw+YC0K8WuxYdIX9/s6d
	dipL5TjLkYr56Oc+Dj9/oK8xwTfp/tkQgWh4jekv69eNRWyukFzJ5o1jjjTQnW6OkZU5
	d4ow==
X-Received: by 10.152.23.42 with SMTP id j10mr905828laf.82.1409791702885;
	Wed, 03 Sep 2014 17:48:22 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id xe10sm39032lbb.37.2014.09.03.17.48.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Sep 2014 17:48:21 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.84)
	(envelope-from <cazfi74@gmail.com>)
	id 1XPLDn-0008TX-VG; Thu, 04 Sep 2014 03:48:20 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Sep 2014 03:48:12 +0300
Message-Id: <01fc289dc196b0e1bff3359fcfff1a3f33691302.1409791242.git.cazfi74@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1409791241.git.cazfi74@gmail.com>
References: <cover.1409791241.git.cazfi74@gmail.com>
Subject: [PATCH 1/6] gtk+2: update to 2.24.24
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
X-List-Received-Date: Thu, 04 Sep 2014 00:48:25 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch  |  0
 ...bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch |  0
 .../{gtk+-2.24.22 => gtk+-2.24.24}/cellrenderer-cairo.patch   |  0
 .../gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/configure-nm.patch    |  0
 .../gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/configurefix.patch    |  0
 .../gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/doc-fixes.patch       |  0
 .../gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/entry-cairo.patch     |  0
 .../{gtk+-2.24.22 => gtk+-2.24.24}/hardcoded_libtool.patch    |  0
 .../gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/run-iconcache.patch   | 11 ++++++-----
 .../gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/toggle-font.diff      |  0
 .../gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/xsettings.patch       |  0
 meta/recipes-gnome/gtk+/{gtk+_2.24.22.bb => gtk+_2.24.24.bb}  |  4 ++--
 12 files changed, 8 insertions(+), 7 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/cellrenderer-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/configure-nm.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/configurefix.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/doc-fixes.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/entry-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/run-iconcache.patch (72%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/toggle-font.diff (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.22 => gtk+-2.24.24}/xsettings.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.22.bb => gtk+_2.24.24.bb} (93%)

diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.22/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.24/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.22/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.24/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.22/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.24/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.22/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.24/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.22/cellrenderer-cairo.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.24/cellrenderer-cairo.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.22/cellrenderer-cairo.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.24/cellrenderer-cairo.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.22/configure-nm.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.24/configure-nm.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.22/configure-nm.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.24/configure-nm.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.22/configurefix.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.24/configurefix.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.22/configurefix.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.24/configurefix.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.22/doc-fixes.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.24/doc-fixes.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.22/doc-fixes.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.24/doc-fixes.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.22/entry-cairo.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.24/entry-cairo.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.22/entry-cairo.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.24/entry-cairo.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.22/hardcoded_libtool.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.24/hardcoded_libtool.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.22/hardcoded_libtool.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.24/hardcoded_libtool.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.22/run-iconcache.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.24/run-iconcache.patch
similarity index 72%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.22/run-iconcache.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.24/run-iconcache.patch
index 597ba32..a4e2254 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.24.22/run-iconcache.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.24.24/run-iconcache.patch
@@ -1,21 +1,22 @@
 Upstream-Status: Inappropriate [configuration]
 
-Index: gtk+-2.21.2/gtk/Makefile.am
-===================================================================
---- gtk+-2.21.2.orig/gtk/Makefile.am	2010-06-22 17:21:41.000000000 +0800
-+++ gtk+-2.21.2/gtk/Makefile.am	2010-06-22 17:28:12.000000000 +0800
-@@ -1376,11 +1376,11 @@
+diff -Nurd gtk+-2.24.24/gtk/Makefile.am gtk+-2.24.24/gtk/Makefile.am
+--- gtk+-2.24.24/gtk/Makefile.am	2014-06-23 18:08:14.000000000 +0300
++++ gtk+-2.24.24/gtk/Makefile.am	2014-09-03 23:45:12.669307700 +0300
+@@ -1391,12 +1391,12 @@
  	   ./gtk-update-icon-cache
  endif
  
 -gtkbuiltincache.h: @REBUILD@ stamp-icons
 -	$(MAKE) $(AM_MAKEFLAGS) gtk-update-icon-cache$(EXEEXT) $(GTK_UPDATE_ICON_CACHE_MANIFEST)
 -	$(gtk_update_icon_cache_program) --force --ignore-theme-index		\
+-	   --include-image-data							\
 -	   --source builtin_icons stock-icons > gtkbuiltincache.h.tmp &&        \
 -	mv gtkbuiltincache.h.tmp gtkbuiltincache.h
 +#gtkbuiltincache.h: @REBUILD@ stamp-icons
 +#	$(MAKE) $(AM_MAKEFLAGS) gtk-update-icon-cache$(EXEEXT) $(GTK_UPDATE_ICON_CACHE_MANIFEST)
 +#	$(gtk_update_icon_cache_program) --force --ignore-theme-index		\
++#	   --include-image-data							\
 +#	   --source builtin_icons stock-icons > gtkbuiltincache.h.tmp &&        \
 +#	mv gtkbuiltincache.h.tmp gtkbuiltincache.h
  
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.22/toggle-font.diff b/meta/recipes-gnome/gtk+/gtk+-2.24.24/toggle-font.diff
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.22/toggle-font.diff
rename to meta/recipes-gnome/gtk+/gtk+-2.24.24/toggle-font.diff
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.22/xsettings.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.24/xsettings.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.22/xsettings.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.24/xsettings.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.22.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.24.bb
similarity index 93%
rename from meta/recipes-gnome/gtk+/gtk+_2.24.22.bb
rename to meta/recipes-gnome/gtk+/gtk+_2.24.24.bb
index 98c65a5..7d0a0a2 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.22.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.24.bb
@@ -28,8 +28,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
 #        file://combo-arrow-size.patch;striplevel=0
 #            file://configurefix.patch
 
-SRC_URI[md5sum] = "5fbbfb7637bbd571a572a2dae0e736d2"
-SRC_URI[sha256sum] = "b114b6e9fb389bf3aa8a6d09576538f58dce740779653084046852fb4140ae7f"
+SRC_URI[md5sum] = "f80ac8aa95ea8482ad89656d0370752e"
+SRC_URI[sha256sum] = "12ceb2e198c82bfb93eb36348b6e9293c8fdcd60786763d04cfec7ebe7ed3d6d"
 
 EXTRA_OECONF = "--enable-xkb --disable-glibtest --disable-cups --disable-xinerama"
 
-- 
2.1.0


