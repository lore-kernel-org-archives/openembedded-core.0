Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FBDC77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 21:36:38 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.9143.1683840993159535931
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 14:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xLcXLLUC;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34BLaMtf022945;
	Thu, 11 May 2023 16:36:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683840982;
	bh=7XQiQ/SPzEHoNgCGZK+97oThNC0Fp42uctJ6qldlRBA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xLcXLLUC+qQB2NiACYxB4ofvuFMD8rED60IoHb79pSeqAxJSaO4yJldiNrBj1VILZ
	 TbAFISV/v9tN9Mn5ynIx3Q8EPqrFP9njkQ9bPoNI0YDX2pBTWCqvAS+nh2aNCFyfBJ
	 yl7AMdrGSKsvl8hS6waxYzu0mfxhbfN8B8kt6pYQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34BLaLbc077327
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 May 2023 16:36:22 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 11
 May 2023 16:36:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 11 May 2023 16:36:21 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34BLaLXA012865;
	Thu, 11 May 2023 16:36:21 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>,
        <martin.jansa@gmail.com>, <peter.kjellerstedt@axis.com>,
        <alexandre.belloni@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>,
        Martin Jansa
	<Martin.Jansa@gmail.com>, Randolph Sapp <rs@ti.com>
Subject: [OE-core][PATCH 1/2] kernel-devicetree: make shell scripts posix compliant
Date: Thu, 11 May 2023 16:36:13 -0500
Message-ID: <20230511213614.466484-2-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511213614.466484-1-rs@ti.com>
References: <20230511213614.466484-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 21:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181156

From: Martin Jansa <Martin.Jansa@gmail.com>

Use the notation suggested by Martin Jansa to avoid a bashism. Also
switch KERNEL_DTBVENDORED to the more common 0/1 notation instead of
true/false.

Fixes: 04ab57d200 (kernel-devicetree: allow specification of dtb
directory, 2023-05-02)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta/classes-recipe/kernel-devicetree.bbclass | 4 ++--
 meta/classes-recipe/kernel.bbclass            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/kernel-devicetree.bbclass b/meta/classes-recipe/kernel-devicetree.bbclass
index a6c6c5f227..831fdd1527 100644
--- a/meta/classes-recipe/kernel-devicetree.bbclass
+++ b/meta/classes-recipe/kernel-devicetree.bbclass
@@ -82,7 +82,7 @@ do_install:append() {
 	for dtbf in ${KERNEL_DEVICETREE}; do
 		dtb=`normalize_dtb "$dtbf"`
 		dtb_path=`get_real_dtb_path_in_kernel "$dtb"`
-		if [ ${KERNEL_DTBVENDORED} == "false" ]; then
+		if "${@'false' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) else 'true'}"; then
 			dtb_ext=${dtb##*.}
 			dtb_base_name=`basename $dtb .$dtb_ext`
 			dtb=$dtb_base_name.$dtb_ext
@@ -97,7 +97,7 @@ do_deploy:append() {
 		dtb_ext=${dtb##*.}
 		dtb_base_name=`basename $dtb .$dtb_ext`
 		install -d $deployDir
-		if [ ${KERNEL_DTBVENDORED} == "false" ]; then
+		if "${@'false' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) else 'true'}"; then
 			dtb=$dtb_base_name.$dtb_ext
 		fi
 		install -m 0644 ${D}/${KERNEL_DTBDEST}/$dtb $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 8f022b234d..4bce64cf6a 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -216,7 +216,7 @@ KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 KERNEL_OUTPUT_DIR ?= "arch/${ARCH}/boot"
 KERNEL_IMAGEDEST ?= "boot"
 KERNEL_DTBDEST ?= "${KERNEL_IMAGEDEST}"
-KERNEL_DTBVENDORED ?= "false"
+KERNEL_DTBVENDORED ?= "0"
 
 #
 # configuration
-- 
2.40.1


