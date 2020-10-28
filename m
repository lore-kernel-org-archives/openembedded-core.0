Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.3911.1603919191431341587
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i+RlzTvs;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id g25so134416edm.6
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=unxPs7RJjSUJq08Ct5v1lQ5TCPN+XWMh0Gw+A6JtyR4=;
        b=i+RlzTvscE90HpcSriMPsYaPw76DFKB9m5glzfAnv/BDJuKvM9L7ZCHDpKkjiI9z7k
         p8sX7jTYURwF5//LhtTB9Abq59JpVD9zKkbrj0nx5kQ7phglHQHrRdt3m4DrgjBlqFAP
         yyE+asaU6Pg92Y3Vtqf93zohBjxKT7L9cs/SsSaZuwzs7ftHguOTBAzRv2qmnffHzqfv
         GRCDedexOI3EAMA47eCstAgJkDmqB1yadAWFvpDxUrjyQx9Gt/ICQ9F9d9ATvMS8ftK8
         L24RR7Japl9rZLf21dr8vAF9/u3Ybkb2scRhtPZksq2ydlLIVSFM5mYDagVc+vVN310r
         iTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=unxPs7RJjSUJq08Ct5v1lQ5TCPN+XWMh0Gw+A6JtyR4=;
        b=KMrqbbOnDARlMyCuzY4P9ZBdRUV69j/d9ftOcQYB3eq6nhcWbESg8FGZbzrnP1MJ33
         T+iEkAZH94wy33u8T2aEC8tSR1ml38ujn69u7dj7l0DmZ031azbUrdSzpw7HodtYK4Ek
         q8d7gMkdzZtzKEQMfHa3hf/YwjWrdTMzcexsHdcsgfcXIYXd8P46qzV2iN62RYNiOsYr
         VIrsBHRBZ7tq3kedKDCuWixKNaOpVOUIU8QPVjnZE13T4lYp693Fi7lFNVsuU0OCp0Fz
         MHc3lWISEVUuVERqAr3UAxa5gpSW3BM1vXZpE6ukIE+FwqghA3fNetxt0SCeGNoY/12G
         7gSA==
X-Gm-Message-State: AOAM531ucUbsuZZaQ1mxx28yCzFlBkzp5fIdxeBX+KT8z9GMCUBOn1gr
	uEd8q0SCaRN+unNpQFkFB/WvK+OaRU6ZAg==
X-Google-Smtp-Source: ABdhPJw+0pOw6hQHHPp+xpTr1xRF3iYjDOHf/iZ5tICP+qJfPvkGWE5qka4UoGv7bGauYTzMAijlRA==
X-Received: by 2002:aa7:c2d9:: with SMTP id m25mr877371edp.226.1603919189828;
        Wed, 28 Oct 2020 14:06:29 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:29 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 27/33] epiphany: upgrade 3.36.4 -> 3.38.1
Date: Wed, 28 Oct 2020 22:05:52 +0100
Message-Id: <20201028210558.21070-27-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libportal is a new hard dependency.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../epiphany/{epiphany_3.36.4.bb => epiphany_3.38.1.bb}     | 4 ++--
 .../0002-help-meson.build-disable-the-use-of-yelp.patch     | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.36.4.bb => epiphany_3.38.1.bb} (83%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.36.4.bb b/meta/recipes-gnome/epiphany/epiphany_3.38.1.bb
similarity index 83%
rename from meta/recipes-gnome/epiphany/epiphany_3.36.4.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.38.1.bb
index 4c3b18331a..f9daa8bfe2 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.36.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.38.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr \
 	   gsettings-desktop-schemas libxml2-native \
-	   glib-2.0 glib-2.0-native json-glib libdazzle libhandy"
+	   glib-2.0 glib-2.0-native json-glib libdazzle libhandy libportal"
 
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gsettings features_check upstream-version-is-even gettext mime-xdg
@@ -14,7 +14,7 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            "
-SRC_URI[archive.sha256sum] = "588a75b1588f5a509c33cf0be6a38a0f4fc1748eeb499a51d991ddef485242bf"
+SRC_URI[archive.sha256sum] = "59b7576acb11fbb52eaca6dbf6fce28664de5c915ca2580c47f0b08ba83d2843"
 
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index d4f3cc1d35..118b5d1825 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 0048ae2d225d25cc58f378718ca6f9ddb1a228f9 Mon Sep 17 00:00:00 2001
+From 3725c254f1d1d8204fa299e71c1e2bfd0ff6a634 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
@@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/help/meson.build b/help/meson.build
-index fddcf4c..f7d76c6 100644
+index 484860c..d9b2e80 100644
 --- a/help/meson.build
 +++ b/help/meson.build
 @@ -32,7 +32,7 @@ help_media = [
-   'media/web-browser.png'
+   'media/epiphany-private-3-36.png'
  ]
  
 -gnome.yelp(meson.project_name(),
-- 
2.29.0

