Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7553C72A5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 06:52:34 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id ey11so16631669pad.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 22:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=s6XpzXIBr7Oh3+tH5bWr8fBGVEJhkMtFTxBPcIXkd3E=;
	b=l/U8fFN471iZYpZvGSCKoA1PLv9NnriPYl1aInGvCwORxjJjm8Vzq5VcjIYNVX3CSw
	08JqJQYQb5db3KX6R7STEl3AaQA8b7Oe2DP4fT07Gwayf8UpWwXl4uyLSiL6a0U0agT5
	b7GVIvNhsG2yaUeuJGqHIdNGjUGTZvzSWTDJekF8HKDnoh196G+smoeVj9CIhBsxLs5c
	7krZHPTjC55aqqXp/g+LqH/HRUwX1tnRgIpU5Cz1+9KOKmaIjOT7YfSrFs1P5MG82pg+
	2MpzYmtgEyoc1emftLxF5kS/3X7+LMV0s0xU5ldccM6MXkOv71euDTNg/SbM0iUeGxV6
	T3Eg==
X-Received: by 10.70.132.73 with SMTP id os9mr10583087pdb.110.1422341555420;
	Mon, 26 Jan 2015 22:52:35 -0800 (PST)
Received: from haswell.localdomain (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id mz7sm533112pdb.3.2015.01.26.22.52.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Jan 2015 22:52:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jan 2015 22:56:10 -0800
Message-Id: <1422341773-12634-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.2.2
In-Reply-To: <1422341773-12634-1-git-send-email-raj.khem@gmail.com>
References: <1422341773-12634-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/5] icu: Upgrade to v54
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
X-List-Received-Date: Tue, 27 Jan 2015 06:52:40 -0000

The license checksum changed because instead of having
the license text in the local html file it is now
referred to as a href to url

Change-Id: Ifd93cbf4d22d2842c97e8c0d72d8a6378cf3b095
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/icu/icu.inc                      | 2 +-
 meta/recipes-support/icu/{icu_53.1.bb => icu_54.1.bb} | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/icu/{icu_53.1.bb => icu_54.1.bb} (67%)

diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index 15d002d..26994bb 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -25,7 +25,7 @@ EXTRA_OECONF_class-native = ""
 EXTRA_OECONF_class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
 
 # ICU puts custom m4 autoconf functions in aclocal.m4.
-# However, this file is deleted in our build system. 
+# However, this file is deleted in our build system.
 # To make it work, we copy aclocal.m4 to acinclude.m4.
 # This is a bug of ICU. See bug reference:
 # http://bugs.icu-project.org/trac/ticket/9790
diff --git a/meta/recipes-support/icu/icu_53.1.bb b/meta/recipes-support/icu/icu_54.1.bb
similarity index 67%
rename from meta/recipes-support/icu/icu_53.1.bb
rename to meta/recipes-support/icu/icu_54.1.bb
index d93af68..45b5cb6 100644
--- a/meta/recipes-support/icu/icu_53.1.bb
+++ b/meta/recipes-support/icu/icu_54.1.bb
@@ -1,6 +1,6 @@
 require icu.inc
 
-LIC_FILES_CHKSUM = "file://../license.html;md5=8b139ac5b93769623bd343318048238c"
+LIC_FILES_CHKSUM = "file://../license.html;md5=9890f5ff4ed056a0c2fa84848b9b6066"
 
 def icu_download_version(d):
     pvsplit = d.getVar('PV', True).split('.')
@@ -16,6 +16,6 @@ SRC_URI = "${BASE_SRC_URI} \
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
+SRC_URI[md5sum] = "e844caed8f2ca24c088505b0d6271bc0"
+SRC_URI[sha256sum] = "d42bc9a8ca6a91c55eb0925c279f49e5b508d51ef26ac9850d9be55de5bb8ab3"
 
-SRC_URI[md5sum] = "b73baa6fbdfef197608d1f69300919b9"
-SRC_URI[sha256sum] = "6fa74fb5aac070c23eaba1711a7178fe582c59867484c5ec07c49002787a9a28"
-- 
2.1.1


