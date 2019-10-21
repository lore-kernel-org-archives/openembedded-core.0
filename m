Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 601497F353
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 21:45:53 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id c2so10407954wrr.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 14:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=inZ0RTOP7Kr0iZxQ1QAh9E1Y8pXvycb3CXpWArdRTms=;
	b=kmSpHB+GVpZ3BrnE1Os3Sv+90i7WKyamcaOlbrT9OrsHKszxFv+eo/Pe8GgJ6TPv/Z
	ozvxh4VOaxim1wrnnHUYlXs1rfjxilocatiJ9k3wT02f2GEn5h9XRDtfEHCRF0c5JuJz
	XKmfMCrZRrosQxdeiXEYiaabdiF2DY6v9Ly+7NXiSpOzZOSiCBg3cw29iIUieTP8QJ5y
	mHCKx4fOUr6HDhhPuY6ssRVAY8O12Fhbj/Lv9Q1iEAMG2sIrSUcYYQc1FXBybdg3M4EA
	fX/DhLx2C2BPwrY5YwljEo2nPyTg2exSFGdSr5imU39dhe2GK2ew6j+P3XB9R628qLdQ
	M/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=inZ0RTOP7Kr0iZxQ1QAh9E1Y8pXvycb3CXpWArdRTms=;
	b=lOIbjjg18D+zskkRjUkNUJrUuBz6ERG0XFcVxc6Ub/K8LpEmc6Rin87gyznP1IYmBS
	C3kBaz/6L1j8ttr5u1CRS4pbN+dorsQkFUzxO0zKN9H4xMISPAKMAc/Yy5/H6jC/QS9X
	3pugo80TO5XquFbsBhcsa4elOlyEptOLkDTsHO5jyAeGVCmj/Smla+9QH+J3M5MYxsyY
	LcNpvb8IThtdTnEoLg7pmYl6nZpFIYrHlSqjFuxvuIMcmS0kAIBUk7suGf8+pN0ju9fe
	SUGVMQEztLy4ajK/bq+w6dephdxMI8Aa/0G6yh68sTsef5LY74CTGpyxzTTfTYqgdmcm
	Q3uQ==
X-Gm-Message-State: APjAAAUhgPwic3LlFxIxnZ6x7DO5cgXqxjDc6AIgQbT7JfSbjpPxNE/s
	CP6enEmfb3Bz3D9Z0NzrJa8rQa6p
X-Google-Smtp-Source: APXvYqzJ2n+cfeThyGu3Tm3an+NcUkS7H/M2uikJDJp8a0IbYyCwZ2dtkRhckhmV+kgAfvVSolp2EQ==
X-Received: by 2002:adf:de84:: with SMTP id w4mr354083wrl.342.1571694353877;
	Mon, 21 Oct 2019 14:45:53 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F04BF542BBFE1EC90EBCF50.dip0.t-ipconnect.de.
	[2003:f0:7f04:bf54:2bbf:e1ec:90eb:cf50])
	by smtp.gmail.com with ESMTPSA id f7sm8996639wre.68.2019.10.21.14.45.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 21 Oct 2019 14:45:53 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2019 23:45:44 +0200
Message-Id: <20191021214544.26125-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] adwaita-icon-theme: upgrade 3.32.0 -> 3.34.0
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
X-List-Received-Date: Mon, 21 Oct 2019 21:45:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch | 2 +-
 ...aita-icon-theme_3.32.0.bb => adwaita-icon-theme_3.34.0.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.32.0.bb => adwaita-icon-theme_3.34.0.bb} (92%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
index 4a98363313..a062aa63d3 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
@@ -19,7 +19,7 @@ index 4a84501..52dbb8e 100644
 +++ b/configure.ac
 @@ -3,7 +3,6 @@ AC_PREREQ(2.53)
  
- AC_INIT([adwaita-icon-theme], [3.32.0],
+ AC_INIT([adwaita-icon-theme], [3.34.0],
          [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
 -AC_CANONICAL_HOST
  AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.32.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.0.bb
similarity index 92%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_3.32.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.0.bb
index 02676f4401..84127339b0 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.32.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Run-installation-commands-as-shell-jobs.patch \
            "
 
-SRC_URI[md5sum] = "4b16278cfed860a86c8221de62eec151"
-SRC_URI[sha256sum] = "698db6e407bb987baec736c6a30216dfc0317e3ca2403c7adf3a5aa46c193286"
+SRC_URI[md5sum] = "41b860c17efe065849b0cbf46e88811a"
+SRC_URI[sha256sum] = "40b7e91f8263552b64d0f9beff33150291b086618ce498c71bf10035e48c7c7f"
 
 DEPENDS += "librsvg-native"
 
-- 
2.21.0


