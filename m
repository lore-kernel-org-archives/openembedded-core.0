Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id D4EE4731A4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 14:04:30 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id w104so120756065qge.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 06:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3kKEQRG4ExXMpVC6+xPPGFa6nREZ7Vfl2L1PHRAKDKY=;
	b=JJu+ZNRjnDbK4QqVeqaraHoF/w6l0ZYaIqGscX+D5Osp9Leyh0k1qMCHQNy/nJSLaf
	8A+uxWL+keFCTRnVTkYXQ5r0bhftAB9yLNpWl18Wc1bqrAfYcKeNCyj6nJ5YcqI/Gj46
	LXyr7YOTYI5nX8AHrtHnH51Qq9SeGOv9N/+E4QzDn7IyMdDuBwzdEAkAyB4jgyJtqCkE
	gtNhZJUGoeWkHKGRZjB24ODKvuTkWLZu71abkhNNVIhCPyhwEW6pwuXFxtymZF4gYmgQ
	5RzYGO0q9xekgH/MC+PGdqsgBJqb2pXsgxv9w7ep855M9N2kzs6lFoGWm8X2TiUdR8Wa
	LrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3kKEQRG4ExXMpVC6+xPPGFa6nREZ7Vfl2L1PHRAKDKY=;
	b=OVHnCTfCUPbGAdiKo0G/udUo252Me/ylsl/OikAyeCAylmWh1zasU1ubVTwDAyClT7
	O96zYMJPVmbgtztUdNbURCpSXkkW2B+ucMuNGpPU+3Qlns/oQ6tr9arab5gC8IcF7dxv
	Qx6WLwxV6GvKyxeqjob2/Wz2OuZd4FNTaINgP3Vd34f0JqhcSwoIfJnTR7uv5sBQtHqJ
	Tgk/s1FXf6eRa6QpggxZsdmv/P5FhowAsElK41wNtAQC7RyFNYK7deIsQ6kJmKBeXuMi
	D1g6zvwhibOJOhuhue+FHNA5wBF6cQT1ddGyAvgdPiTAaL4mMzohmeRFh66uAguh4pZ5
	RIpA==
X-Gm-Message-State: AD7BkJLqb9dtXk/v0D8RWRn/AqU4GkGxaTnGSTycB94YzuEdTWB4JdxqmWI8UrZHyxsCTQ==
X-Received: by 10.140.107.182 with SMTP id h51mr18427120qgf.53.1457791471257; 
	Sat, 12 Mar 2016 06:04:31 -0800 (PST)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	w188sm6117570qhb.37.2016.03.12.06.04.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 12 Mar 2016 06:04:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Mar 2016 14:04:23 +0000
Message-Id: <1457791463-18541-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] busybox: Drop -r passthrough patch
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
X-List-Received-Date: Sat, 12 Mar 2016 14:04:32 -0000

This was added to help clang compile busybox but since then
the option has been added to llvm and now we have upgraded clang
to 3.8 which has this option available

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../busybox/0002-Passthrough-r-to-linker.patch     | 32 ----------------------
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  1 -
 2 files changed, 33 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/0002-Passthrough-r-to-linker.patch

diff --git a/meta/recipes-core/busybox/busybox/0002-Passthrough-r-to-linker.patch b/meta/recipes-core/busybox/busybox/0002-Passthrough-r-to-linker.patch
deleted file mode 100644
index de286fb..0000000
--- a/meta/recipes-core/busybox/busybox/0002-Passthrough-r-to-linker.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From df2cc76cdebc4773361477f3db203790f6986e3b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 22 Aug 2015 23:42:40 -0700
-Subject: [PATCH 2/2] Passthrough -r to linker
-
-clang does not have -r switch and it does not pass it down to linker
-either, LDFLAGS_RELOCATABLE is used when CC is used for LD, so this
-should not cause side effects
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 9da02cb..10dd4a9 100644
---- a/Makefile
-+++ b/Makefile
-@@ -309,7 +309,7 @@ CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ -Wbitwise $(C
- MODFLAGS	= -DMODULE
- CFLAGS_MODULE   = $(MODFLAGS)
- AFLAGS_MODULE   = $(MODFLAGS)
--LDFLAGS_RELOCATABLE = -r -nostdlib
-+LDFLAGS_RELOCATABLE = -Xlinker -r -nostdlib
- LDFLAGS_MODULE  = $(LDFLAGS_RELOCATABLE)
- CFLAGS_KERNEL	=
- AFLAGS_KERNEL	=
--- 
-2.1.4
-
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index 174ca47..bdaa5a5 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -29,7 +29,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
            file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
-           file://0002-Passthrough-r-to-linker.patch \
            file://busybox-1.24.1-unzip.patch \
            file://busybox-1.24.1-unzip-regression.patch \
            file://busybox-1.24.1-truncate-open-mode.patch \
-- 
1.9.1


