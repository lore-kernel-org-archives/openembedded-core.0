Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A251CC54E65
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 23:40:05 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.5091.1747784399021986284
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 16:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hmbleAnV;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54KNdd6N165601;
	Tue, 20 May 2025 18:39:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747784379;
	bh=TqxMIKdi/YIPQxQ3+0gTIiKey+P8eUMUrI8+Oi0CXX0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hmbleAnVOVor9zeWbvCOa1IssGofJc25mZT0CKxfjGMoDmN8gLAlpRNWLWukjRTIh
	 V0878x2Fp9h3dodGS49XmVdkf4qhVNTj+5q38PQJTgsX4UI4rFmvVgVemO4LLu2+iM
	 qvux6kG65OS6hgKxGNIDkbFMoQTm5b5awp83KAcM=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54KNddbl2311225
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 20 May 2025 18:39:39 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 May 2025 18:39:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 May 2025 18:39:38 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54KNdcsd015026;
	Tue, 20 May 2025 18:39:38 -0500
From: <rs@ti.com>
To: <mathieu.dubois-briand@bootlin.com>, <richard.purdie@linuxfoundation.org>,
        <ross.burton@arm.com>, <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
CC: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv6 4/5] weston: remove deprecated weston-start scripts
Date: Tue, 20 May 2025 18:39:33 -0500
Message-ID: <20250520233935.740242-5-rs@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520233935.740242-1-rs@ti.com>
References: <20250520233935.740242-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216955

From: Randolph Sapp <rs@ti.com>

The weston-start scripts are not parsed unless using the old version of
weston-init. These files are no longer required since weston-init moved
to a virtual-emptty-conf.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../wayland/weston/systemd-notify.weston-start         |  9 ---------
 .../wayland/weston/xwayland.weston-start               |  6 ------
 meta/recipes-graphics/wayland/weston_14.0.1.bb         | 10 ----------
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
diff --git a/meta/recipes-graphics/wayland/weston_14.0.1.bb b/meta/recipes-graphics/wayland/weston_14.0.1.bb
index 2a0a403d99..e9a4c68ff0 100644
--- a/meta/recipes-graphics/wayland/weston_14.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_14.0.1.bb
@@ -9,8 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
 SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
-           file://xwayland.weston-start \
-           file://systemd-notify.weston-start \
            "
 
 SRC_URI[sha256sum] = "a8150505b126a59df781fe8c30c8e6f87da7013e179039eb844a5bbbcc7c79b3"
@@ -108,14 +106,6 @@ do_install:append() {
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
2.49.0


