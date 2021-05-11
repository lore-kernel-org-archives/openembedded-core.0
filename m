Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.11908.1620736404399895537
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 05:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vzzi8v17;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id zg3so29515414ejb.8
        for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 05:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IgSA3lgA3FUnEHanzNZomgWg5DZLkI3EmYtp69AA74U=;
        b=Vzzi8v17tHIRPi5cfdQgAyzK7PCd9u04tR4UqGzNNQYqfJR7OCW+n9vCbGCzecnXPW
         paj60CrsGbLdsyUFfwztt3dM6zxk0csQqjWXH7BFoDAwKsFDxmfGjdc5rvPlNRmZBF8C
         1S3IXTBhsO/5H7rncYEMRCA7FDxDq6tpFbeb3af8mL2+LDRBRC0pS1jobke8E4zholej
         Tib4PRsUTIk1DX/B6iSEl/pNuF3E2tQK2DoG1vQAzTrFyDfgOchWKwIFuL/5KVtIoYhg
         /kOtF2amBFk7bpWle1wVfASNOtkMoEYXdYXeIZXYOPfZVzzQyK+cuqzOcgwCQzqKbo0I
         5V0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IgSA3lgA3FUnEHanzNZomgWg5DZLkI3EmYtp69AA74U=;
        b=cgyPvJzJAp6eDcu9RAKlvxqMcSn8gBF6e9mb5docMg6qHvuhNQ1hPWaa0FDg8TMDQI
         q29hoLrJDjXrR/09O2J1yQl7wrCWYn8yVp2mXLISM6lRTxNY6gFS+ImeYIKLGsCl+McF
         +foRcGBSJbUhTMi+ckuG2CO3noHdOqPt1X3FHXmqceNLuoPB33Hl75kONnglpBIhYS9Z
         RR6rqhclGQM0tL/1bkq4vj5WkyPKfNYta8jaHOzQw1a2c06Emuyf5ytLXCsrHjXYEP+D
         +BW2NnTWEsuR76CnLy0qBoFAAFxqKDaBsPtOT8QWPaYEysnTPRm53QJaGC8kdjhtsawq
         dM7w==
X-Gm-Message-State: AOAM531h35qnOzSKaeSx6GxFMH2FJReuFz8oLwXUAHETh8qy70S4R/3+
	8Ke0stloCZG/ehnWBWmHrGFzqLrUA/s=
X-Google-Smtp-Source: ABdhPJySYHFe4yr6i1ifWAwrpIJcr8tc5acZpXLAa/sHTmkzquxmnSA2wZO2nZHEOlVvWhJpgvNQvg==
X-Received: by 2002:a17:906:11d4:: with SMTP id o20mr31452081eja.247.1620736402760;
        Tue, 11 May 2021 05:33:22 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id i19sm11308173ejd.114.2021.05.11.05.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 05:33:21 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] gnome: drop upstream even condition from a few recipes
Date: Tue, 11 May 2021 14:33:11 +0200
Message-Id: <20210511123311.975969-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They have adopted the new gnome version scheme where the distinction
is no longer:
https://lwn.net/Articles/831746/

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.38.3.bb                  | 2 +-
 meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb           | 2 +-
 meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb           | 2 +-
 .../gsettings-desktop-schemas_3.38.0.bb                         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
index ce24336ace..64b7b33aa1 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
@@ -11,7 +11,7 @@ DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr gnutls \
 	   glib-2.0 glib-2.0-native json-glib libdazzle libhandy libportal"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase gsettings features_check upstream-version-is-even gettext mime-xdg
+inherit gnomebase gsettings features_check gettext mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb
index 6cde6fffa3..61927c0dd1 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
                     file://COPYING_CCBYSA3;md5=96143d33de3a79321b1006c4e8ed07e7 \
                     file://COPYING_LGPL;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-inherit allarch autotools pkgconfig gettext gtk-icon-cache upstream-version-is-even
+inherit allarch autotools pkgconfig gettext gtk-icon-cache
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb
index a36a2b113c..672fbd2b07 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
                     file://COPYING_CCBYSA3;md5=96143d33de3a79321b1006c4e8ed07e7 \
                     file://COPYING_LGPL;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-inherit allarch autotools pkgconfig gettext gtk-icon-cache upstream-version-is-even
+inherit allarch autotools pkgconfig gettext gtk-icon-cache
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.38.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.38.0.bb
index 34681197d8..cf06af57d6 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.38.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.38.0.bb
@@ -11,6 +11,6 @@ DEPENDS = "glib-2.0"
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gsettings gobject-introspection gettext upstream-version-is-even
+inherit gnomebase gsettings gobject-introspection gettext
 
 SRC_URI[archive.sha256sum] = "5704c8266004b296036671f223c705dc046aa694a1b1abb87c67e7d2747a8c67"
-- 
2.31.1

