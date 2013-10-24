Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1DE766D3DB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 18:29:42 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id eh20so2257322lab.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 11:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1Kj63RwWL8ZkmZ8H/bj1O3eCB03NA2vEzRZGSYTUT94=;
	b=dVzPGvlRF3+O4QqXieKcHf2IlucNiOpDnZzzk0LhhvmBE4Ad6uptkyUnX8beMJJRdi
	mlOs6gznr+elLg9OjXyCgAnG63XtRqbcAOHv58TJiZ7mosstHDrLpN3jIcGcogSWEl8D
	hLLm87ofG6NHL8cciI6iBniNZpNMCHRwDV174+DY8PskV4O8Lh8ODI6pHaqkB/ZRnanY
	18ZRQNEm+B/24Xe1niWv/HeVFWHd/4wLSAFdHPKcg/cNH1NWFLDhzpp48U4SlRiAuQZv
	KueiEg2d8pK1TdBShjbX5lMHmH03VKdxjUClj/NrmftzX2naIvYh/ST+xxxfsMbjN7Mc
	rLOA==
X-Received: by 10.112.57.49 with SMTP id f17mr2769971lbq.26.1382639384305;
	Thu, 24 Oct 2013 11:29:44 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id ac2sm3142186lbc.10.2013.10.24.11.29.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Oct 2013 11:29:43 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VZPfC-0000ms-1t; Thu, 24 Oct 2013 21:29:42 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2013 21:29:38 +0300
Message-Id: <dfce1648ef7781347e1a159067e788c0f3c85f03.1382639156.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <cover.1382639156.git.cazfi74@gmail.com>
References: <cover.1382639156.git.cazfi74@gmail.com>
Subject: [PATCH 1/3] gtk+: upgrade gtk+ to upstream version 2.24.22
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
X-List-Received-Date: Thu, 24 Oct 2013 18:29:43 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch          | 0
 .../0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch   | 0
 .../gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/cellrenderer-cairo.patch      | 0
 .../gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/configure-nm.patch            | 0
 .../gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/configurefix.patch            | 0
 .../recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/doc-fixes.patch | 0
 .../gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/entry-cairo.patch             | 0
 .../gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/hardcoded_libtool.patch       | 0
 meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/no-demos.patch | 0
 .../gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/run-iconcache.patch           | 0
 .../gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/toggle-font.diff              | 0
 .../recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/xsettings.patch | 0
 meta/recipes-gnome/gtk+/{gtk+_2.24.20.bb => gtk+_2.24.22.bb}          | 4 ++--
 13 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/cellrenderer-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/configure-nm.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/configurefix.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/doc-fixes.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/entry-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/no-demos.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/run-iconcache.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/toggle-font.diff (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.20 => gtk+-2.24.22}/xsettings.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.20.bb => gtk+_2.24.22.bb} (93%)

diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.20/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.22/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.20/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.22/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.20/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.22/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.20/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.22/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.20/cellrenderer-cairo.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.22/cellrenderer-cairo.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.20/cellrenderer-cairo.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.22/cellrenderer-cairo.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.20/configure-nm.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.22/configure-nm.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.20/configure-nm.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.22/configure-nm.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.20/configurefix.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.22/configurefix.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.20/configurefix.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.22/configurefix.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.20/doc-fixes.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.22/doc-fixes.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.20/doc-fixes.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.22/doc-fixes.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.20/entry-cairo.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.22/entry-cairo.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.20/entry-cairo.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.22/entry-cairo.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.20/hardcoded_libtool.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.22/hardcoded_libtool.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.20/hardcoded_libtool.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.22/hardcoded_libtool.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.20/no-demos.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.22/no-demos.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.20/no-demos.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.22/no-demos.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.20/run-iconcache.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.22/run-iconcache.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.20/run-iconcache.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.22/run-iconcache.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.20/toggle-font.diff b/meta/recipes-gnome/gtk+/gtk+-2.24.22/toggle-font.diff
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.20/toggle-font.diff
rename to meta/recipes-gnome/gtk+/gtk+-2.24.22/toggle-font.diff
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.24.20/xsettings.patch b/meta/recipes-gnome/gtk+/gtk+-2.24.22/xsettings.patch
similarity index 100%
rename from meta/recipes-gnome/gtk+/gtk+-2.24.20/xsettings.patch
rename to meta/recipes-gnome/gtk+/gtk+-2.24.22/xsettings.patch
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.20.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.22.bb
similarity index 93%
rename from meta/recipes-gnome/gtk+/gtk+_2.24.20.bb
rename to meta/recipes-gnome/gtk+/gtk+_2.24.22.bb
index ad3b4e9..98c65a5 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.20.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.22.bb
@@ -28,8 +28,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
 #        file://combo-arrow-size.patch;striplevel=0
 #            file://configurefix.patch
 
-SRC_URI[md5sum] = "9d7833331d7accd80668e29d7f567ce5"
-SRC_URI[sha256sum] = "cc66bcbf9239a7d9861175c681ba95894b55c70dc0b37aad8345c46ecfda0da3"
+SRC_URI[md5sum] = "5fbbfb7637bbd571a572a2dae0e736d2"
+SRC_URI[sha256sum] = "b114b6e9fb389bf3aa8a6d09576538f58dce740779653084046852fb4140ae7f"
 
 EXTRA_OECONF = "--enable-xkb --disable-glibtest --disable-cups --disable-xinerama"
 
-- 
1.8.4.rc3


