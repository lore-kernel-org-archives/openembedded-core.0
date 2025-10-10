Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C147ECCD185
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 16:08:49 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.99.1760112523544187165
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 09:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NDEu2ZT6;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59AG8gLk722554
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 11:08:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760112522;
	bh=zmVa2xhUxcmTQ+cark5pZTt0UyUyLm20knp4DLLSgkk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=NDEu2ZT6Bt8Qi/zjvkfy2UHHH5s+Zut7fJafAd9bXy1MQ8PpE+Atoq5Qw8cVQhP3d
	 ps56Iq4UwQRaPXlm2zBmQzeqFnxC9K9xQU4JtSHhpw3+ECFwstV+NkUO3g7OthbWha
	 dBjn2YL7TOPcTljqy23MdXEPWq5yK4xbtiMu89QA=
Received: from DFLE205.ent.ti.com (dfle205.ent.ti.com [10.64.6.63])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59AG8gJU1791080
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 11:08:42 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Oct
 2025 11:08:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 11:08:42 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59AG8gGl1892351
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 11:08:42 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1v7Ffe-0007Ty-Dt
	for openembedded-core@lists.openembedded.org; Fri, 10 Oct 2025 11:08:42 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH v3 3/3] linux-firmware: Set FILES to ""
Date: Fri, 10 Oct 2025 11:08:42 -0500
Message-ID: <20251010160842.28715-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251010160842.28715-1-reatmon@ti.com>
References: <20251010160842.28715-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 16:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224699

Now that all of the current firmware has either been moved into
sub-packages or removed due to licensing the base package is now
empty. Going forward we would like to keep the base package empty
and force the version updates to bin any new firmwares into
sub-packages.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: Split single patch into three patches, and add ALLOW_EMPTY.

 .../linux-firmware/linux-firmware_20250917.bb             | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
index 4efdc73a45..9a12f45435 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
@@ -3311,8 +3311,14 @@ LICENSE:${PN} = "\
     & WHENCE \
 "
 
+# The goal for this recipe is to creata bunch of breakout packages for the
+# firmware so that you can choose which files to include and not have to pull
+# them all in.  To that end, we do want any files to be part of the
+# linux-firmware package.  So set it to "".  Do not change this.
+FILES:${PN} = ""
+ALLOW_EMPTY:${PN} = "1"
+
 FILES:${PN}-license += "${nonarch_base_libdir}/firmware/LICEN*"
-FILES:${PN} += "${nonarch_base_libdir}/firmware/*"
 RDEPENDS:${PN} += "${PN}-license"
 RDEPENDS:${PN} += "${PN}-whence-license"
 
-- 
2.17.1


