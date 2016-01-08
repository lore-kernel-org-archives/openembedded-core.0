Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB6073283
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 09:12:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u089C8jJ019981
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jan 2016 01:12:09 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 8 Jan 2016 01:12:08 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 8 Jan 2016 01:12:07 -0800
Message-ID: <d68122a8892e52ec326acd22385f1193feeae2c9.1452244296.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452244296.git.liezhi.yang@windriver.com>
References: <cover.1452244296.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] fix-for-mips-n32.patch: remove it
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
X-List-Received-Date: Fri, 08 Jan 2016 09:12:09 -0000
Content-Type: text/plain

Not needed it any more since qt4 has been moved to meta-qt4.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../qt4/qt4-4.8.7/fix-for-mips-n32.patch           |   38 --------------------
 1 file changed, 38 deletions(-)
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/fix-for-mips-n32.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.7/fix-for-mips-n32.patch b/meta/recipes-qt/qt4/qt4-4.8.7/fix-for-mips-n32.patch
deleted file mode 100644
index 9f90b78..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.7/fix-for-mips-n32.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 269b1a82e654d9b8d682d861b4d0db0bd50d3106 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Fri, 27 Nov 2015 03:09:07 +0000
-Subject: [PATCH] wtf/Platform.h: fix build for mips n32
-
-If _ABIN32 is defined, it should go into 32 bit branch.
-
-Fixed:
-./wtf/StdLibExtras.h: In instantiation of 'TO WTF::bitwise_cast(FROM) [with TO = int; FROM = double]':
-runtime/JSValueInlineMethods.h:495:44:   required from here
-./wtf/Assertions.h:326:47: error: size of array is negative
- #define COMPILE_ASSERT(exp, name) typedef int dummy##name [(exp) ? 1 : -1]
-
-https://bugreports.qt.io/browse/QTBUG-39224
-
-Upstream-Status: Submitted
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- src/3rdparty/webkit/Source/JavaScriptCore/wtf/Platform.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/3rdparty/webkit/Source/JavaScriptCore/wtf/Platform.h b/src/3rdparty/webkit/Source/JavaScriptCore/wtf/Platform.h
-index e8b03be..dfc6a74 100644
---- a/src/3rdparty/webkit/Source/JavaScriptCore/wtf/Platform.h
-+++ b/src/3rdparty/webkit/Source/JavaScriptCore/wtf/Platform.h
-@@ -147,7 +147,7 @@
- /* CPU(MIPS) - MIPS 32-bit and 64-bit */
- #if (defined(mips) || defined(__mips__) || defined(MIPS) || defined(_MIPS_) \
-     || defined(__mips64))
--#if defined(__mips64)
-+#if defined(__mips64) && !defined(_ABIN32)
- #define WTF_CPU_MIPS64 1
- #define WTF_MIPS_ARCH __mips64
- #else
--- 
-2.5.0
-
-- 
1.7.9.5


