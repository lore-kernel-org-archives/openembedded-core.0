Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 01F2973D54
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:37:14 +0000 (UTC)
Received: by ierf6 with SMTP id f6so26628336ier.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 10:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=N9PUA9rQx4EmDUDLq6L5zKF0h3ofpNLttLlqHHRIeYY=;
	b=0a4qfiF0NoFRIVz475xzWWA+qjYkSA7Mu8prGNd63+kNwYqlveFum0NXGnfp/fyJ91
	Xl3/rmVv6nTR8D8xeLbCpk6QckokD1Gqlg33XynK0cV+NEZktNL0EunZ9sRhqebL3bKE
	Ac6v2BmyxqP63IHwnbbF7Tmy6KYaxIyqeJ+Bnj0w04u1GUkVUN/9bYXX5hhrMwbcuiIv
	yzumiwsUJ1V7SEm65VEvui733FvfavLVVlpLRi5iE32lLTQLGD7kf2fgTReBq0E2aSdy
	ANGwBwTpWa1Osy1hMwsWBoElC/7afBnPLtI/vvcaFaagfZ7pCelku06wpB8If9fRTBlR
	wCSg==
X-Received: by 10.50.110.104 with SMTP id hz8mr536516igb.38.1428341836136;
	Mon, 06 Apr 2015 10:37:16 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 7sm3063135iol.43.2015.04.06.10.37.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 10:37:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 17:36:50 +0000
Message-Id: <61d57466a0a9de7acbd99d2733651863179013b9.1428341478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428341477.git.raj.khem@gmail.com>
References: <cover.1428341477.git.raj.khem@gmail.com>
Subject: [PATCH 22/24] wpa-supplicant: Replace non-standard base defines with c99 compliant ones
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
X-List-Received-Date: Mon, 06 Apr 2015 17:37:15 -0000

Makes it more portable

Change-Id: I033787934cd91243ce8f8ce3a974a157aa5cfd6a
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../wpa-supplicant/wpa-supplicant.inc              |  1 +
 .../0001-linux_wext-Fix-types-for-musl.patch       | 38 ++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-linux_wext-Fix-types-for-musl.patch

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index f95e91c..dae0606 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -25,6 +25,7 @@ SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
            file://fix-libnl3-host-contamination.patch \
+           file://0001-linux_wext-Fix-types-for-musl.patch \
           "
 SRC_URI[md5sum] = "f2ed8fef72cf63d8d446a2d0a6da630a"
 SRC_URI[sha256sum] = "eaaa5bf3055270e521b2dff64f2d203ec8040f71958b8588269a82c00c9d7b6a"
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-linux_wext-Fix-types-for-musl.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-linux_wext-Fix-types-for-musl.patch
new file mode 100644
index 0000000..49a988b
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-linux_wext-Fix-types-for-musl.patch
@@ -0,0 +1,38 @@
+From 159db445dc4cb0af5f6ad85f3a146ad137db5057 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 3 Apr 2015 20:38:21 -0700
+Subject: [PATCH] linux_wext: Fix types for musl
+
+| ../src/drivers/linux_wext.h:24:9: error: unknown type name '__uint32_t'
+|  typedef __uint32_t __u32;
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+---
+ src/drivers/linux_wext.h | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/drivers/linux_wext.h b/src/drivers/linux_wext.h
+index 55cf955..e66df91 100644
+--- a/src/drivers/linux_wext.h
++++ b/src/drivers/linux_wext.h
+@@ -21,11 +21,11 @@
+ 
+ #include <sys/types.h>
+ #include <net/if.h>
+-typedef __uint32_t __u32;
+-typedef __int32_t __s32;
+-typedef __uint16_t __u16;
+-typedef __int16_t __s16;
+-typedef __uint8_t __u8;
++typedef u_int32_t __u32;
++typedef int32_t __s32;
++typedef u_int16_t __u16;
++typedef int16_t __s16;
++typedef u_int8_t __u8;
+ #ifndef __user
+ #define __user
+ #endif /* __user */
+-- 
+2.1.4
+
-- 
2.1.4


