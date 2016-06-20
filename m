Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9A29A731B9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 17:49:36 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id t190so12032858pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 10:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OEt7+ZmknmgohHlGIDXCfPwS2G7rD9eXbOX7R8VHnSA=;
	b=YUv4o9mlJxxt2wppl2c3dnjZQ75N0uNp7nlg3kOk5iPiOcHlTDY/D5Ve1Fsdv+Bx4f
	GNeSowl4evmtUYKD2BVa3oMSwhp3AIiBxWpDoD+CA3fThnW07ls6befnB8EQhEakBASs
	F0trQyJmpkCnxmD6fQTKJO6SqXFYO52QT+HXlto8gSLp+ldWNxXFaF++ywkMY7IRnKv7
	e/uDOVv248xQyaFFAgd8sEeMIVnxR9gK+U76+83MEPoGi3MUDO3w5bN+RCNEcT58RTWN
	2SKuofD8CvkL4zcGFpsWDuzlrNWHCGTTQ9hUv7DRdgoSQaaReZc90ckBhsUcbmK+JddI
	mXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OEt7+ZmknmgohHlGIDXCfPwS2G7rD9eXbOX7R8VHnSA=;
	b=eZNq/0rNPNGOo/N/ozti47j/i6hN7KgvzRLnYcret1BReWY5NWTBFysxjPI2qCHnlb
	gQEd16yzGIdeIda3swQQTthsu/8xyVqbTVuUEmtLvDCEaNSHnZnuCrbGS2klyQHInqV6
	/xPBhPijBgAwCJ13XTerl+lCS6fbflHLH3LLkvR17WQF/6rA880RRGty7ecdCi89UWwJ
	ctaC503jtfGHpnZ+TVIp7VGRZ4ub9hSFowMzeQKuGAzE0+UfNWjc59/xRa5t1OSIqV3o
	BL5LzpJcwaLGNZ52xMesCzB/oIfQNOp884kZ1ahjK67LC2AEWgD60kZ+S1tz+Lo8fJvq
	ENmQ==
X-Gm-Message-State: ALyK8tLLa3SOtn39xmw9Syj9QtVDIQOQNpdj/PjHDJbNQX7zQ1MTtvWi3qfLFCvWQy8cUw==
X-Received: by 10.98.34.153 with SMTP id p25mr22820848pfj.116.1466444977577;
	Mon, 20 Jun 2016 10:49:37 -0700 (PDT)
Received: from localhost.localdomain
	(static-50-53-79-155.bvtn.or.frontiernet.net. [50.53.79.155])
	by smtp.gmail.com with ESMTPSA id
	i187sm56862025pfc.62.2016.06.20.10.49.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Jun 2016 10:49:37 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jun 2016 10:48:55 -0700
Message-Id: <1466444935-16308-5-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1466444935-16308-1-git-send-email-christopher.w.clark@gmail.com>
References: <1466444935-16308-1-git-send-email-christopher.w.clark@gmail.com>
Cc: Christopher Clark <christopher.clark6@baesystems.com>
Subject: [PATCH v3 5/5] linux-firmware : add iwlwifi-misc package for remaining iwlwifi firmware
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
X-List-Received-Date: Mon, 20 Jun 2016 17:49:37 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

Package all remaining iwlwifi firmwares that are not individually
packaged into a single package. This is distinct from the virtual
linux-firmware-iwlwifi package so that the -misc firmwares can be
installed without pulling in all other firmwares via dependencies.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 947e79b..fd2403f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -229,6 +229,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-iwlwifi-7260 \
              ${PN}-iwlwifi-7265 \
              ${PN}-iwlwifi-7265d ${PN}-iwlwifi-8000c ${PN}-iwlwifi-8265 \
+             ${PN}-iwlwifi-misc \
              ${PN}-i915-license ${PN}-i915 \
              ${PN}-adsp-sst-license ${PN}-adsp-sst \
              ${PN}-bnx2-mips \
@@ -462,6 +463,7 @@ LICENSE_${PN}-iwlwifi-7265      = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-7265d     = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-8000c     = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-8265      = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-misc      = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-license   = "Firmware-iwlwifi_firmware"
 
 
@@ -482,6 +484,7 @@ FILES_${PN}-iwlwifi-7265   = "/lib/firmware/iwlwifi-7265-*.ucode"
 FILES_${PN}-iwlwifi-7265d   = "/lib/firmware/iwlwifi-7265D-*.ucode"
 FILES_${PN}-iwlwifi-8000c   = "/lib/firmware/iwlwifi-8000C-*.ucode"
 FILES_${PN}-iwlwifi-8265   = "/lib/firmware/iwlwifi-8265-*.ucode"
+FILES_${PN}-iwlwifi-misc   = "/lib/firmware/iwlwifi-*.ucode"
 
 RDEPENDS_${PN}-iwlwifi-135-6     = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-3160-7    = "${PN}-iwlwifi-license"
@@ -499,8 +502,15 @@ RDEPENDS_${PN}-iwlwifi-7265      = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-7265d     = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-8000c     = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-8265      = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-misc      = "${PN}-iwlwifi-license"
 
+# -iwlwifi-misc is a "catch all" package that includes all the iwlwifi
+# firmwares that are not already included in other -iwlwifi- packages.
+# -iwlwifi is a virtual package that depends upon all iwlwifi packages.
+# These are distinct in order to allow the -misc firmwares to be installed
+# without pulling in every other iwlwifi package.
 ALLOW_EMPTY_${PN}-iwlwifi = "1"
+ALLOW_EMPTY_${PN}-iwlwifi-misc = "1"
 
 # Handle package updating for the newly merged iwlwifi groupings
 RPROVIDES_${PN}-iwlwifi-7265 = "${PN}-iwlwifi-7265-8 ${PN}-iwlwifi-7265-9"
-- 
2.1.4


