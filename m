Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id DC3D578555
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 00:07:58 +0000 (UTC)
Received: from seahawk.toradex.int
	(75-146-58-181-Washington.hfc.comcastbusiness.net [75.146.58.181])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id CDDEC5C13DA;
	Wed, 13 Sep 2017 02:04:12 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Sep 2017 17:07:52 -0700
Message-Id: <1505261272-25017-2-git-send-email-stefan@agner.ch>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505261272-25017-1-git-send-email-stefan@agner.ch>
References: <1505261272-25017-1-git-send-email-stefan@agner.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1505261053; bh=lyuli7HHZtJrFQ/YIzMiin3z9AdZjacrZa3ot4wh0yk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=gn32/P12CUZZr3018srIyRqhddCmj8eI8lD+u7F812SxLtrBdR2YdLytDNQI+J6c7M5J/1qWV2gB+Jy3f4hJgopj+QSSYI4opGgbC8JPgNO+7435aU11H41RT7FVJrXA7aVkhDU6LkIZcqDyMPEN8L5risIXvEYV02JSY+XB0Eo=
Cc: Stefan Agner <stefan.agner@toradex.com>, dominik.sliwa@toradex.com
Subject: [PATCH 2/2] linux-firmware: bump to latest linux-firmware git revision
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
X-List-Received-Date: Wed, 13 Sep 2017 00:07:59 -0000

From: Stefan Agner <stefan.agner@toradex.com>

This requires MD5 sum updates for
- LICENSE.QualcommAtheros_ath10k: year change
- WHENCE: various version updates and addition of new firmwares

The new firmware for Qualcom Venus causes a QA error:
  QA Issue: linux-firmware: Recipe inherits the allarch class, but has packaged architecture-specific binaries

Since firmware typically do not run on the CPU, the architecture of
the firmware file is independent from the CPU architecture the image
will be running on. Disable the QA check for the linux-firmware
package by default.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 20d140c..ea77d65 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -1,6 +1,8 @@
 SUMMARY = "Firmware files for use with Linux kernel"
 SECTION = "kernel"
 
+ERROR_QA_remove = "arch"
+
 LICENSE = "\
     Firmware-Abilis \
     & Firmware-adsp_sst \
@@ -98,7 +100,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d \
     file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0 \
     file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5 \
-    file://LICENSE.QualcommAtheros_ath10k;md5=b5fe244fb2b532311de1472a3bc06da5 \
+    file://LICENSE.QualcommAtheros_ath10k;md5=cb42b686ee5f5cb890275e4321db60a8 \
     file://LICENCE.r8a779x_usb3;md5=4c1671656153025d7076105a5da7e498 \
     file://LICENSE.radeon;md5=68ec28bacb3613200bca44f404c69b16 \
     file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435 \
@@ -114,7 +116,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-    file://WHENCE;md5=ad12d0618287e8c10ae3da05fa0edcfb \
+    file://WHENCE;md5=08f6d4371353cac5f6fc271d5407c63e \
 "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -175,7 +177,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
-SRCREV = "b14134583c2a15d4404695f72cb523daedb877ab"
+SRCREV = "a61ac5cf8374edbfe692d12f805a1b194f7fead2"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
2.7.4


