Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62014EB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 15:34:06 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.15870.1686756836267150316
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 08:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vO7EkGs8;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35EFXk1n127636;
	Wed, 14 Jun 2023 10:33:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686756826;
	bh=NojykeR1Gm6Om6G3HyS8scuhvXqqs4ibJyA8kApBVq8=;
	h=From:To:CC:Subject:Date;
	b=vO7EkGs8GroWbvkus9kFRlb8R4oNDeklSZ35WSK7xQJ04QdrwjeaumdasS7bIcOUi
	 L5bZEAEw7n0DT8QcPbK1W45hlFznB6PO3saeuf6K1Egszth3xyz+44zBF6j0Q94rz/
	 yMxUyn7qtEuvaL4zfydrtmZBIOvw27UULXRxZ6nM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35EFXjuP006013
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Jun 2023 10:33:45 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 10:33:45 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 10:33:45 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35EFXjHG001494;
	Wed, 14 Jun 2023 10:33:45 -0500
From: <rs@ti.com>
To: <richard.purdie@linuxfoundation.org>, <alex.kanavin@gmail.com>,
        <peter.kjellerstedt@axis.com>
CC: <reatmon@ti.com>, <denis@denix.org>, <alexandre.belloni@bootlin.com>,
        <openembedded-core@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [OE-core][PATCHv2 1/3] weston-init: fix the mixed indentation
Date: Wed, 14 Jun 2023 10:33:29 -0500
Message-ID: <20230614153331.3410792-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 15:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182819

From: Randolph Sapp <rs@ti.com>

I know my text editor is going to get angry at me if this continues.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 4fa302c833..e538469a58 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -26,19 +26,19 @@ DEFAULTBACKEND ??= ""
 DEFAULTBACKEND:qemuall ?= "drm"
 
 do_install() {
-        if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
+	if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
 		install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
 		sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init.d/weston
-        fi
+	fi
 	install -D -p -m0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
 	install -Dm644 ${WORKDIR}/weston.env ${D}${sysconfdir}/default/weston
 
 	# Install Weston systemd service and accompanying udev rule
 	install -D -p -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
 	install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
-        if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
+	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
 		install -D -p -m0644 ${WORKDIR}/weston-autologin ${D}${sysconfdir}/pam.d/weston-autologin
-        fi
+	fi
 	sed -i -e s:/etc:${sysconfdir}:g \
 		-e s:/usr/bin:${bindir}:g \
 		-e s:/var:${localstatedir}:g \
@@ -47,7 +47,7 @@ do_install() {
 	install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
 	sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
 	sed -i 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${bindir}/weston-start
-        if [ -n "${DEFAULTBACKEND}" ]; then
+	if [ -n "${DEFAULTBACKEND}" ]; then
 		sed -i -e "/^\[core\]/a backend=${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/weston.ini
 	fi
 
-- 
2.41.0


