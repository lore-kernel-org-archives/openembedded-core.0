Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6A34865CF3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2019 12:21:37 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r24so2811500wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2019 04:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=o9Y4Ngynwp9fB24ksL6dMr5MT2o9X3/kuRECBexy+8g=;
	b=Hu8ms1bscq9SfJoK/FCCLzTu3tWUtvbylREqyugUgJhEtU3LhW4RTFoQUHu2/T1bun
	Q2WI1Z8fmKRhMdJQvYMHKbNIb3m/D1fSR3hoji0GNr8t60dTqWAzIDKnVUZfI2H1QnpQ
	a05C0v1xPuGCuPO5JJPDckZ16E1lQZ1GdE9IV+z0YHspphWxbm74SfxbuYhh0cMQn4Qj
	6fKvKT+43+qCKcMgJFB7Dl0jc+F/KkmmLCBfokff2Aw8fxb5dv1mV0PSiYRqNO+gSr38
	eV6fthKzz4+/R1O/JBTrhTSlm34s9aU83rFiimLY0HnQFWxrGIgYjgbVCWlFVgEbZWNG
	lcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=o9Y4Ngynwp9fB24ksL6dMr5MT2o9X3/kuRECBexy+8g=;
	b=eATFt7MVeldS0U0NXiKi8yR/urhDPWBlQ/PYN72SYwsou3lulME+ElRLs9ypqLFyGt
	JszdVQslGwFOBCrARIr1Vr9cDWY7wD5KQiP4k+vLRP9CM88fmYJ+cArqlUJLqK2NrNfJ
	fycYCiRrxDraRkik2SnrLq0ZIrLWHbyR/0yRQAvx8KhC6g9cpJo5UR6AF1IqiSfTv9qh
	utXJ43+CAv4gVoDKpYAC0JobGOik9u73J1SijcD5CMJ0GD3Tc7dgaSAFTiKCXKcfHKqE
	jr0T5EvCa+X2YaRb4B4ybSnAC24GAfPuASXdkK31Zl2hBKgKQr01rm0SrLFoHmX/PqIh
	7WfQ==
X-Gm-Message-State: AJcUukdLjXVc14Z+kQY9I8W6Eqdfba90/YNJPpXM1UamCrujFfzQWCxp
	K/x5d04vqKZfR7zJ/Ye8vXdQmi8J
X-Google-Smtp-Source: ALg8bN6mB9tmQx62Dy9gv2awXPltrJo7gqIa73kKxTHTvCDNvn9+o5UqKIsuGC+9HHbPvd+Ug+eSgg==
X-Received: by 2002:a1c:1688:: with SMTP id 130mr17963369wmw.86.1547900497656; 
	Sat, 19 Jan 2019 04:21:37 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j8sm66100437wrt.40.2019.01.19.04.21.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Jan 2019 04:21:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2019 13:21:28 +0100
Message-Id: <20190119122128.41062-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] u-boot: drop ${PV} from u-boot-common.inc filename
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
X-List-Received-Date: Sat, 19 Jan 2019 12:21:37 -0000

This will let AUH test-build the proposed upgrades made by devtool.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../u-boot/{u-boot-common_2018.11.inc => u-boot-common.inc}     | 0
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.11.bb              | 2 +-
 meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb                 | 2 +-
 meta/recipes-bsp/u-boot/u-boot_2018.11.bb                       | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-common_2018.11.inc => u-boot-common.inc} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2018.11.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-common_2018.11.inc
rename to meta/recipes-bsp/u-boot/u-boot-common.inc
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.11.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.11.bb
index 52c13e75d8d..b5ce56847be 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.11.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.11.bb
@@ -1,4 +1,4 @@
-require u-boot-common_${PV}.inc
+require u-boot-common.inc
 
 SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
 DEPENDS += "mtd-utils"
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb
index 7893d2aebcb..ff26e324829 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb
@@ -1,4 +1,4 @@
-require u-boot-common_${PV}.inc
+require u-boot-common.inc
 
 SUMMARY = "U-Boot bootloader tools"
 DEPENDS += "openssl"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2018.11.bb b/meta/recipes-bsp/u-boot/u-boot_2018.11.bb
index 37c21dcaa38..02d67c0db25 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2018.11.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2018.11.bb
@@ -1,4 +1,4 @@
-require u-boot-common_${PV}.inc
+require u-boot-common.inc
 require u-boot.inc
 
 DEPENDS += "bc-native dtc-native"
-- 
2.17.1


