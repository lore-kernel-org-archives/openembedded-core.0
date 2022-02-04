Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC30C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:13:09 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.9481.1643983972820228964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 06:13:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=nDGMisxp;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643983988; x=1675519988;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=kAIErnyzqhHF/UvJo8iiYQ16WDdGoWf09NjjBvMGw7c=;
  b=nDGMisxpHXgquss9brqEY3XiRDMvb3x/AsJ3SXrDogmGLf1m0kEQ7Yh4
   clnGQV4cenqV8QPwfTHvtWlNwhRoJ64LpPd325zlKLY4kltHpcDLZRzCD
   2MUKoV+4rkdtyKWFu6vv6iwUT5vPGYG8Ymn4LrcvGYk9/VfpB1LltRtH9
   ebPBm8ppmn/ZamSBlmwLSh2v2DisOE43+wKYdS4kJxfpQOMr9qb+KYbgO
   kqz+tRyKIR2QQWmdpiO72QBJp5lohJNGyw0UlrDCzUaMwTu6Fl3Xos6Kr
   4PSCprv9qd2GYOo61aB8RvcL5MxV4CmmiZRyFLHcZ5RfU87px9J1tiUbI
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248321638"
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="248321638"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:13:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="566750096"
Received: from raajloka-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.235.116])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:13:07 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 11/17] linux-firmware: Add CLM blob to
 linux-firmware-bcm4373 package
Date: Fri,  4 Feb 2022 22:12:37 +0800
Message-Id: 
 <289a849f8f639cd2546153827fc265a9409f5538.1643983711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643983711.git.anuj.mittal@intel.com>
References: <cover.1643983711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 14:13:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161358

From: Rudolf J Streif <rudolf.streif@ibeeto.com>

The Country Local Matrix (CLM) blob brcmfmac4373-sdio.clm_blob was not
included with the files for the linux-firmware-bcm4373 package
but instead packaged with linux-firmware.

Signed-off-by: Rudolf J Streif <rudolf.streif@ibeeto.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 18ba64d4a12e7275381cf34fe72b757accbb1544)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
index 65bfda1d9f..5f1b696092 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
@@ -751,6 +751,7 @@ FILES:${PN}-bcm4356-pcie = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-pc
 FILES:${PN}-bcm4373 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.bin \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373.bin \
   ${nonarch_base_libdir}/firmware/cypress/cyfmac4373-sdio.bin \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.clm_blob \
 "
 
 LICENSE:${PN}-bcm-0bb4-0306 = "Firmware-cypress"
-- 
2.34.1


