Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 865406F0A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 19:33:02 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id up15so15696525pbc.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 11:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ku+g3uQEqwLUn/CWVpTUg/FNpN1T+4Wse2Hg24I5rpM=;
	b=RJe1Xa/MW02JIPnLFgCqLkMIc2YlROY60W5lz94HuiAt2t8WSqj9hEBAK54RxPkl5t
	3CBIB9pgSl2lEHD5ir93pUK4uVDEJivYVOLoFJz0U9XjrL6xZNEPmkpjFSXcO0589fJX
	z2axLH5nv7oAmrven5dhtnRbcuQr1YluP7DIW4Cy6gDbTZn1qqazM1SKoy0ffmAQiO4T
	1R4Q7pi4xo/jexxO/y4A2SQrXdWpCjFCYylbBNxXKX3KoXfHaQZUzQ1xkmZBl+yTyAym
	tIOVfHiZIi6e3HQJS2w3+IauS5htfMhDzVvO5MtC/h1ZGGizp2HwPeitmELoOLlRNGEh
	AN0g==
X-Received: by 10.66.232.40 with SMTP id tl8mr10465337pac.137.1392665583889;
	Mon, 17 Feb 2014 11:33:03 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	nm5sm48339985pbc.29.2014.02.17.11.33.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Feb 2014 11:33:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 11:34:16 -0800
Message-Id: <08134b74807c2647df869b226024213082332899.1392665521.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <74162f3b1e7a4f7da6939103dfee9bb3f16c2c39.1392665521.git.raj.khem@gmail.com>
References: <74162f3b1e7a4f7da6939103dfee9bb3f16c2c39.1392665521.git.raj.khem@gmail.com>
In-Reply-To: <cover.1392665521.git.raj.khem@gmail.com>
References: <cover.1392665521.git.raj.khem@gmail.com>
Subject: [PATCH 4/6] icu: Disable the default LDFLAGSICUDT for target compile
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
X-List-Received-Date: Mon, 17 Feb 2014 19:33:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Disable-LDFLAGSICUDT-for-Linux.patch      |   28 ++++++++++++++++++++
 meta/recipes-support/icu/icu_51.2.bb               |    3 +++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu-51.2/0001-Disable-LDFLAGSICUDT-for-Linux.patch

diff --git a/meta/recipes-support/icu/icu-51.2/0001-Disable-LDFLAGSICUDT-for-Linux.patch b/meta/recipes-support/icu/icu-51.2/0001-Disable-LDFLAGSICUDT-for-Linux.patch
new file mode 100644
index 0000000..2968d57
--- /dev/null
+++ b/meta/recipes-support/icu/icu-51.2/0001-Disable-LDFLAGSICUDT-for-Linux.patch
@@ -0,0 +1,28 @@
+From 0c82d6aa02c08e41b13c83b14782bd7024e25d59 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 15 Feb 2014 21:06:42 +0000
+Subject: [PATCH] Disable LDFLAGSICUDT for Linux
+
+Upstream-Status: Inappropriate [ OE Configuration ]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ source/config/mh-linux |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/mh-linux b/config/mh-linux
+index 366f0cc..2689aab 100644
+--- a/config/mh-linux
++++ b/config/mh-linux
+@@ -21,7 +21,7 @@ LD_RPATH= -Wl,-zorigin,-rpath,'$$'ORIGIN
+ LD_RPATH_PRE = -Wl,-rpath,
+ 
+ ## These are the library specific LDFLAGS
+-LDFLAGSICUDT=-nodefaultlibs -nostdlib
++# LDFLAGSICUDT=-nodefaultlibs -nostdlib
+ 
+ ## Compiler switch to embed a library name
+ # The initial tab in the next line is to prevent icu-config from reading it.
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-support/icu/icu_51.2.bb b/meta/recipes-support/icu/icu_51.2.bb
index aabe07b..2d1fd42 100644
--- a/meta/recipes-support/icu/icu_51.2.bb
+++ b/meta/recipes-support/icu/icu_51.2.bb
@@ -9,5 +9,8 @@ SRC_URI = "${BASE_SRC_URI} \
            file://add_buffer_length_check_to_UTF_16_or_32_detector.patch \
           "
 
+SRC_URI_append_class-target = "\
+           file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
+          "
 SRC_URI[md5sum] = "072e501b87065f3a0ca888f1b5165709"
 SRC_URI[sha256sum] = "deb027a05f1b3bec03298b96fb93b28c84e9683c22e6f94effa67fdc7bd704cc"
-- 
1.7.10.4


