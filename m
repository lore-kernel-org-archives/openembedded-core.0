Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 02FAF70F28
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 17:28:18 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id kq14so17599896pab.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 10:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=WvXxuwvUTX1R0Y1rBuPAM7Zs84fOZqy5pIJkEba4X4Y=;
	b=UTFjAlhThStIptTyULEahRdTgXnWI2Hc7aQvdgX8xsVV2zV+G/itDr6QvHM3XB5xXG
	4O1mEAMei1YSCdxGC3Aeujyc17pjsiAMPmAzhGX9AGJbPkzKoYSKI+K0yf6igHT8lKvY
	egWecfpbtpvnqd8lr6iH8naOuD3Ys13zIfOsW5mxrW616DrZBX4CIo520IQeLSmJqlh0
	0BVxOHRI9ryFb+vEvC2E3uCHJF51HG+oUQ23OiolKIHRb+IGilCit5GUzXLjW3NiIIXI
	gQpYM6mplCA76dz91O1ostF2bZmD2y8gezFQ/gMIpZozgxehQGIbRvU5NL/5G6RX3fTt
	OBcw==
X-Received: by 10.70.91.73 with SMTP id cc9mr32454871pdb.138.1409765294347;
	Wed, 03 Sep 2014 10:28:14 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id zm5sm7367263pbb.76.2014.09.03.10.28.11
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Sep 2014 10:28:12 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Sep 2014 10:27:44 -0700
Message-Id: <d323bbf79127a7216a0970375369a0ae773b89c7.1409764769.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 5/8] hostap-utils: obey LDFLAGS
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
X-List-Received-Date: Wed, 03 Sep 2014 17:28:19 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../hostap/hostap-utils-0.4.7/ldflags.patch        | 27 ++++++++++++++++++++++
 meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb      |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch

diff --git a/meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch b/meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch
new file mode 100644
index 0000000..fe60303
--- /dev/null
+++ b/meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch
@@ -0,0 +1,27 @@
+---
+ Makefile |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+--- hostap-utils-0.4.7.orig/Makefile
++++ hostap-utils-0.4.7/Makefile
+@@ -14,17 +14,17 @@ prism2_srec.o: prism2_srec.c util.h
+ hostap_crypt_conf: hostap_crypt_conf.c
+ 
+ hostap_diag: hostap_diag.o util.o
+-	$(CC) -o hostap_diag $(CFLAGS) hostap_diag.o util.o
++	$(CC) -o hostap_diag $(CFLAGS) $(LDFLAGS) hostap_diag.o util.o
+ 
+ hostap_diag.o: hostap_diag.c util.h
+ 
+ util.o: util.c util.h
+ 
+ hostap_io_debug: hostap_io_debug.c
+-	$(CC) -o hostap_io_debug $(CFLAGS) hostap_io_debug.c
++	$(CC) -o hostap_io_debug $(CFLAGS) $(LDFLAGS) hostap_io_debug.c
+ 
+ hostap_rid: hostap_rid.o util.o
+-	$(CC) -o hostap_rid $(CFLAGS) hostap_rid.o util.o
++	$(CC) -o hostap_rid $(CFLAGS) $(LDFLAGS) hostap_rid.o util.o
+ 
+ hostap_rid.o: hostap_rid.c util.h
+ 
diff --git a/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb b/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb
index 7b224a8..be5481f 100644
--- a/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb
+++ b/meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb
@@ -1,4 +1,5 @@
 require hostap-utils.inc
 
+SRC_URI += "file://ldflags.patch"
 SRC_URI[md5sum] = "afe041581b8f01666e353bec20917c85"
 SRC_URI[sha256sum] = "c6f598d8e356c1620fa009eca0a700bf1105e16817eefd77d891994261009355"
-- 
1.8.3.4


