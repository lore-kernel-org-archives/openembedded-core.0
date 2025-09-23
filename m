Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1617CAC5B0
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 22:52:33 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.2089.1758667952865773331
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 15:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CVNLPCgT;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58NMq95w1098381;
	Tue, 23 Sep 2025 17:52:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758667929;
	bh=6HkPSmq0BGSSTISz/1ww59KxCcwU8u48aDoFbPM/dzo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CVNLPCgT3EdDed/CRskFoXw1wDGEMvABasc6p4eHQUjV35q77m/CO32M1Jqy/9Qyg
	 aH8dCplEArXTngUPpdbtUaamGeFhRf8qdIInhnJfQLZYrLKNQplr3pf/QH8TShL8OJ
	 ds/3+64yOjTwlIwT/GiHG4iDOtWRBYsgZywL0KT8=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58NMq9CI1406612
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 23 Sep 2025 17:52:09 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 23
 Sep 2025 17:52:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Sep 2025 17:52:08 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58NMq8TL750856;
	Tue, 23 Sep 2025 17:52:08 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <mathieu.dubois-briand@bootlin.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
        <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv10 5/7] weston: remove deprecated weston-start scripts
Date: Tue, 23 Sep 2025 17:51:41 -0500
Message-ID: <20250923225150.2407390-6-rs@ti.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923225150.2407390-1-rs@ti.com>
References: <20250923225150.2407390-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 22:52:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223932

From: Randolph Sapp <rs@ti.com>

The weston-start scripts are not parsed unless using the old version of
weston-init. These files are no longer required since weston-init moved
to a virtual-emptty-conf.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../wayland/weston/systemd-notify.weston-start         |  9 ---------
 .../wayland/weston/xwayland.weston-start               |  6 ------
 meta/recipes-graphics/wayland/weston_14.0.2.bb         | 10 ----------
 3 files changed, 25 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
 delete mode 100644 meta/recipes-graphics/wayland/weston/xwayland.weston-start

diff --git a/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start b/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
deleted file mode 100644
index a97e7b38d9..0000000000
--- a/meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/bin/sh
-  
-# SPDX-FileCopyrightText: Huawei Inc.
-# SPDX-License-Identifier: Apache-2.0
-
-
-if [[ -x "/usr/lib/weston/systemd-notify.so" ]]; then
-        add_weston_module "systemd-notify.so"
-fi
diff --git a/meta/recipes-graphics/wayland/weston/xwayland.weston-start b/meta/recipes-graphics/wayland/weston/xwayland.weston-start
deleted file mode 100644
index 342ac8d129..0000000000
--- a/meta/recipes-graphics/wayland/weston/xwayland.weston-start
+++ /dev/null
@@ -1,6 +0,0 @@
-#!/bin/sh
-
-if type Xwayland  >/dev/null 2>/dev/null; then
-	mkdir -m 775 -p /tmp/.X11-unix
-	chown root:video /tmp/.X11-unix
-fi
diff --git a/meta/recipes-graphics/wayland/weston_14.0.2.bb b/meta/recipes-graphics/wayland/weston_14.0.2.bb
index 451fb961a1..7a9d7f63f0 100644
--- a/meta/recipes-graphics/wayland/weston_14.0.2.bb
+++ b/meta/recipes-graphics/wayland/weston_14.0.2.bb
@@ -9,8 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
 SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
-           file://xwayland.weston-start \
-           file://systemd-notify.weston-start \
            "
 
 SRC_URI[sha256sum] = "b47216b3530da76d02a3a1acbf1846a9cd41d24caa86448f9c46f78f20b6e0ac"
@@ -107,14 +105,6 @@ do_install:append() {
 		install ${UNPACKDIR}/weston.png ${D}${datadir}/icons/hicolor/48x48/apps
 	fi
 
-	if [ "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'yes', 'no', d)}" = "yes" ]; then
-		install -Dm 644 ${UNPACKDIR}/xwayland.weston-start ${D}${datadir}/weston-start/xwayland
-	fi
-
-	if [ "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'yes', 'no', d)}" = "yes" ]; then
-		install -Dm 644 ${UNPACKDIR}/systemd-notify.weston-start ${D}${datadir}/weston-start/systemd-notify
-	fi
-
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'launch', 'yes', 'no', d)}" = "yes" ]; then
 		chmod u+s ${D}${bindir}/weston-launch
 	fi
-- 
2.51.0


