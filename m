Return-Path: <andrei@gherzan.ro>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id AD7526B5E7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Dec 2013 18:03:01 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so830641ead.22
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Dec 2013 10:03:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WBPwwFCdfQCTLYlsz4kaz0DxEF02D+THzaF8wdLFn3c=;
	b=Z59H5NDAM0yGzFGAtmn2iPZvvnEtz7W8+SB+GZx9Wx1llnGpAre3UBHqiswxEk0IPB
	GeqGYzph/gTUVNEBE+rJnWd0iwciyi/wx9pUB3H7awHW6h7udQONXxlgAtOBdqFmz7Cc
	nOTHGmnB8wpC/gN4iLuOsAIOqjrMkpwqUk8Pyn2REo2DSzp7LgmaPsulvgXyg7183SOe
	lSk9zFR25q3RRXQjf9r9l+LShO5XItP+tvFNMcLfUtvKemZZLcJcNGr6z0HAdGXbIZNy
	o889iq8XAAK006BeI/cCVXJUhfP5+RBup39iPl8+XF4/RvuvbJrSelaE9RyRJeg0hH5z
	/AJA==
X-Gm-Message-State: ALoCoQkRQAc2wcXyh3SlzdtPRIJQcqCNHJbk9s2+O93xFmPZr1UMVcYyR4ybTsCt1pYl9w5YWDNT
X-Received: by 10.15.54.72 with SMTP id s48mr6837792eew.3.1386439380935;
	Sat, 07 Dec 2013 10:03:00 -0800 (PST)
Received: from localhost.localdomain (5-13-147-220.residential.rdsnet.ro.
	[5.13.147.220])
	by mx.google.com with ESMTPSA id e3sm8741204eeg.11.2013.12.07.10.03.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Dec 2013 10:03:00 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Dec 2013 20:02:53 +0200
Message-Id: <1386439373-8104-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 1/1] libav: Use "BP" and "libav" patch directory
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
X-List-Received-Date: Sat, 07 Dec 2013 18:03:02 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../0001-configure-enable-pic-for-AArch64.patch    | 23 ++++++++++++++++++++++
 meta/recipes-multimedia/libav/libav_0.8.9.bb       |  2 +-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AArch64.patch

diff --git a/meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AArch64.patch b/meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AArch64.patch
new file mode 100644
index 0000000..d9b22b9
--- /dev/null
+++ b/meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AArch64.patch
@@ -0,0 +1,23 @@
+From 58db99e98f615d79ea90cac8f4bcf11c94e3e7c7 Mon Sep 17 00:00:00 2001
+From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+Date: Thu, 10 Jan 2013 12:42:19 +0100
+Subject: [PATCH] configure: enable pic for AArch64
+
+Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+
+Upstream-Status: Backport
+---
+ configure |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- git.orig/configure
++++ git/configure
+@@ -2393,7 +2393,7 @@ check_host_cflags -std=c99
+ check_host_cflags -Wall
+ 
+ case "$arch" in
+-    alpha|ia64|mips|parisc|ppc|sparc)
++    alpha|ia64|mips|parisc|ppc|sparc|aarch64)
+         spic=$shared
+     ;;
+     x86)
diff --git a/meta/recipes-multimedia/libav/libav_0.8.9.bb b/meta/recipes-multimedia/libav/libav_0.8.9.bb
index 065a6d2..ce8b1ef 100644
--- a/meta/recipes-multimedia/libav/libav_0.8.9.bb
+++ b/meta/recipes-multimedia/libav/libav_0.8.9.bb
@@ -1,6 +1,6 @@
 require libav.inc
 
-SRC_URI = "http://libav.org/releases/libav-0.8.9.tar.xz \
+SRC_URI = "http://libav.org/releases/${BP}.tar.xz \
            file://0001-configure-enable-pic-for-AArch64.patch"
 
 SRC_URI[md5sum] = "7c0e5743cd5c4d4b1bcafd02a2e82e09"
-- 
1.8.1.4


