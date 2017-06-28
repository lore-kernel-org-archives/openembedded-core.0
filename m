Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8F06378072
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 16:04:50 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id u62so33929971pgb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 09:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ESW0DW78X4R2ggMhaQLbPZXDgL0HBc4voKsGJuXCFus=;
	b=jrJnASyzMr+/H/or3dHfFWSSQXSrAg26nq1NqMP0sMWPfPv7UsqiYgqnKi0KJCcBE7
	HfbysBCr6ro/u474Fb7m2AlbKwf5KbHtcZXK6d4nAT/P3/4TSR3ulKtwS+GCUt8QqyE7
	Op8gMolhsoGv1O4qlyL1iMU5zdmqg7fGqXpHci6h9LwZBRfE6Sxg05elry1+NdNUZ8n+
	zOqfNu/9xWEiRUzZrczEh6BskcVnnt+VlyiDgVppqyiMoljLdcML1/K8VBDpuZAW1JkA
	vSMd7pVh0OVVNUOy2Kxdd7dBAjwbferEYObql1AvFQJ1z5jrk4psfcpAfggdzeTpmViN
	Yv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ESW0DW78X4R2ggMhaQLbPZXDgL0HBc4voKsGJuXCFus=;
	b=PxASupkyZg6/wnv8KN6U1KqZDhkTEBQ0wbdrWkSkuCBBbZIe32U6lN2JIcYdeZBhKU
	+KO6Y+8DnJlJpDsZfTRTrRNN+TukPmdkYF7nTYpZ4ifUwBK3UvGTuYwYkfmRaMhtUGCa
	+Mrc64j9AHzRRfzWS6q+k8f/JNbufp5dcjBagqAjMY7XEMQFK8WHntohqdZlIM+e8HWy
	fmKiDpKHFBI4tM6fTjrTJ22BR620gpoweEnjcDebc6ASMFH6Qq8vkVuURjG2bBmyxo+C
	L1aV75kXrucADB922Rnot/i2Dopy5UxkfKs1Nd+0Bl6ocJBl5g0pYmvKF60M2hhukd2u
	E7+w==
X-Gm-Message-State: AKS2vOxq9AecH4YwVcFM/dOK827hc8IJ7mcZ+0TNAsX8nyjFkVTFrHtk
	gssd0fDclgS9qdtF
X-Received: by 10.98.1.72 with SMTP id 69mr11480156pfb.124.1498665891282;
	Wed, 28 Jun 2017 09:04:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	v62sm5243608pfb.124.2017.06.28.09.04.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 09:04:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jun 2017 09:04:22 -0700
Message-Id: <9604c347c99ea49d1d533296265c3d2b39f9980d.1498665211.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498665211.git.raj.khem@gmail.com>
References: <cover.1498665211.git.raj.khem@gmail.com>
Subject: [PATCH 09/10] icu: Fix build with glibc 2.26
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
X-List-Received-Date: Wed, 28 Jun 2017 16:04:50 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../icu/icu/0001-i18n-Drop-include-xlocale.h.patch | 31 ++++++++++++++++++++++
 meta/recipes-support/icu/icu_58.2.bb               |  3 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch

diff --git a/meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch b/meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch
new file mode 100644
index 0000000000..add0d765b7
--- /dev/null
+++ b/meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch
@@ -0,0 +1,31 @@
+From c4254fd8ff1888ca285e3242b812010357ce2b3e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 24 Jun 2017 22:52:40 -0700
+Subject: [PATCH] i18n: Drop include <xlocale.h>
+
+glibc 2.26 drops this header
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ i18n/digitlst.cpp | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+Index: source/i18n/digitlst.cpp
+===================================================================
+--- source.orig/i18n/digitlst.cpp
++++ source/i18n/digitlst.cpp
+@@ -61,11 +61,7 @@
+ #endif
+ 
+ #if U_USE_STRTOD_L
+-# if U_PLATFORM_USES_ONLY_WIN32_API || U_PLATFORM == U_PF_CYGWIN
+-#   include <locale.h>
+-# else
+-#   include <xlocale.h>
+-# endif
++# include <locale.h>
+ #endif
+ 
+ // ***************************************************************************
diff --git a/meta/recipes-support/icu/icu_58.2.bb b/meta/recipes-support/icu/icu_58.2.bb
index 4d062ebf94..47684a6c8b 100644
--- a/meta/recipes-support/icu/icu_58.2.bb
+++ b/meta/recipes-support/icu/icu_58.2.bb
@@ -16,7 +16,8 @@ BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-${ICU_PV
 SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
-          "
+           file://0001-i18n-Drop-include-xlocale.h.patch \
+           "
 
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
-- 
2.13.2


