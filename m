Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id E06FB7C106
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 16:30:26 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id g67so3445379wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 08:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yRYgTzqs/XTLF/uvAs+fhu1UVngdO0xWbrsfoLx0XUs=;
	b=oO+AazTH0kyuiY61E9jct1sY4oEUszfwqlBWKh8I1qgGPOy7FNYJyoYw2KtBa5dv6T
	elOx+4WJal0PFRX8AC8ULm+Q5yTv+q1VSzIzJsImR8X4pmXAMXSWZHEdMgRHOaZSzzbm
	IMD78qDO1ffNwwGs9OUxdXcBHHutkGwPt20tbFhFi4ZhNcLQtuQs0qPae1rXg2O81GAF
	X9buScNXohvBodl84KKG+0UHXC50+ZIis6HRNdcj2Hax2yeL5knAmxG1oZi9IToHSLa7
	UW1+zJ+M/OEhdJjD5tApDWHcLbaPfZt8rwxQEKWQwynlIB7pFkEUfF8MXxxAia0V6IMm
	w31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yRYgTzqs/XTLF/uvAs+fhu1UVngdO0xWbrsfoLx0XUs=;
	b=JTHI+OLCqG+pL5eUI6mdhPZy8/C/b3IhOIAE7j3RYDQqbJe4lUxNm3xWAIa7ghb9il
	rAO5rIWPAo5xTuGr1e7traPhNsMdUSGjgdga4X2evbiJ8oQe8qLwtGg7gIc16dsNc219
	BQh1jThUp4XaDo+Vuwitn7UKb9XRknyGkX/iWaF+trPsQLLjXXbiIrf+PJ6+D/S2qUym
	+zbtjzbR6kyWzj8yGX1wLTjyLDMFTB1Q248JeW6APl/1lCCdyMV31VzPxY4LT6pFsX+v
	1gAyZQDozCFH30LTuuAT1g+pWHrZSmpIvAZ4RkZ+Rh/ZxotJGuYdGbGfm5tm9EgQDf1D
	P/iw==
X-Gm-Message-State: AA+aEWakwQ5OgDynijQ+m+zVNRi+oQJPlBWzd2Tk+C4SYUBxEHVDa+9P
	U2WNtwTZe+eJCYVdw70Z70gDpYUr
X-Google-Smtp-Source: AFSGD/XMq4oqP+uTMYqcGDkLKrIk8Wr8dS26mRlUNVMQRPp+pOcvjByThsHbLTuzLVCtnms5+GUgsw==
X-Received: by 2002:a7b:c24c:: with SMTP id b12mr3522083wmj.29.1545150627123; 
	Tue, 18 Dec 2018 08:30:27 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f18sm2237849wrs.92.2018.12.18.08.30.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 08:30:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 17:30:05 +0100
Message-Id: <20181218163005.1330-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181218163005.1330-1-alex.kanavin@gmail.com>
References: <20181218163005.1330-1-alex.kanavin@gmail.com>
Subject: [PATCH 13/13] librepo: upgrade 1.9.2 -> 1.9.3
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
X-List-Received-Date: Tue, 18 Dec 2018 16:30:27 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...gpgme-variables-with-pkg-config-not-with-cmake-m.patch | 8 ++++----
 .../librepo/{librepo_1.9.2.bb => librepo_1.9.3.bb}        | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/librepo/{librepo_1.9.2.bb => librepo_1.9.3.bb} (84%)

diff --git a/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch b/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
index 488657154a9..73902e5f58d 100644
--- a/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
+++ b/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
@@ -1,4 +1,4 @@
-From 9f44d2f4aaf706027fe5a02f6d83547ff343f09c Mon Sep 17 00:00:00 2001
+From f5a1dfe4c87c228165bc25e7fe464120d8139a3d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:23:27 +0200
 Subject: [PATCH] Set gpgme variables with pkg-config, not with cmake module
@@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 0f7271f..d71373f 100644
+index e949dbe..c954b2e 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -30,7 +30,8 @@ PKG_CHECK_MODULES(GLIB2 glib-2.0 REQUIRED)
+@@ -31,7 +31,8 @@ PKG_CHECK_MODULES(GLIB2 glib-2.0 REQUIRED)
  PKG_SEARCH_MODULE(LIBCRYPTO REQUIRED libcrypto openssl)
  PKG_CHECK_MODULES(LIBXML2 libxml-2.0 REQUIRED)
  FIND_PACKAGE(CURL REQUIRED)
@@ -23,5 +23,5 @@ index 0f7271f..d71373f 100644
 +PKG_CHECK_MODULES(GPGME gpgme REQUIRED)
 +set(GPGME_VANILLA_LIBRARIES ${GPGME_LIBRARIES})
  
- INCLUDE_DIRECTORIES(${GLIB2_INCLUDE_DIRS})
  
+ IF (WITH_ZCHUNK)
diff --git a/meta/recipes-devtools/librepo/librepo_1.9.2.bb b/meta/recipes-devtools/librepo/librepo_1.9.3.bb
similarity index 84%
rename from meta/recipes-devtools/librepo/librepo_1.9.2.bb
rename to meta/recipes-devtools/librepo/librepo_1.9.3.bb
index 69c2411f7d4..abfed798f35 100644
--- a/meta/recipes-devtools/librepo/librepo_1.9.2.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.9.3.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "313a7644d03f9657ee0c7aa747d1db260f8e2fc0"
+SRCREV = "f1212bd4a55467ab8578c87f98ed363cccd5907a"
 
 S = "${WORKDIR}/git"
 
@@ -15,7 +15,7 @@ DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 
 inherit cmake distutils3-base pkgconfig
 
-EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3 -DENABLE_TESTS=OFF -DENABLE_DOCS=OFF"
+EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3 -DENABLE_TESTS=OFF -DENABLE_DOCS=OFF -DWITH_ZCHUNK=OFF"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1


