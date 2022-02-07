Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE2DC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 09:07:22 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.19860.1644224834864333556
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 01:07:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=l1boa2Wt;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644224841; x=1675760841;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Of9NrhD3Y+I0crK9jPOGFgR6FFZA/EFBFrWGOvIJZ8I=;
  b=l1boa2Wtoihno7O/eo+/ZNNnI7epb5A4jaeZKwfIGGgYId75lNPYvDKe
   dE1b5xsO/HcqO09NDiQU9W4M++iKzHSCMVyLK6eadvtFG2V/Nn66ZdRpl
   Cz+aROXVWeVmCreD8CP6uHGmBUzgdwC/qKdHWSi/UpOAyDK1h7/Hp1epi
   x9S3hFD/0LNy4twDEgWEhVF/qz1udGBz6roXp8torqWo1UNvyFFq7pwaJ
   wfcVMltcfILyvUpJlgrMd9kd9GxzQ07TXjhuwwrYkxsZgkP4d/XHlJqwI
   0XsSVaSOuVuPqtY9pnoR2s8+IYkxBLtJbuoptQdmf1z56lxQgddhAHxA+
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="309420838"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600";
   d="scan'208";a="309420838"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:07:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600";
   d="scan'208";a="499140466"
Received: from xgoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.138.138])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:07:20 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 08/12] linux-firmware: Add CLM blob to
 linux-firmware-bcm4373 package
Date: Mon,  7 Feb 2022 17:06:58 +0800
Message-Id: 
 <c51ace400d3c59b13aaba0c46831ca64ee47e8c2.1644224643.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1644224643.git.anuj.mittal@intel.com>
References: <cover.1644224643.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 09:07:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161450

From: Rudolf J Streif <rudolf.streif@ibeeto.com>

The Country Local Matrix (CLM) blob brcmfmac4373-sdio.clm_blob was not
included with the files for the linux-firmware-bcm4373 package
but instead packaged with linux-firmware.

Signed-off-by: Rudolf J Streif <rudolf.streif@ibeeto.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 18ba64d4a12e7275381cf34fe72b757accbb1544)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
(cherry picked from commit 289a849f8f639cd2546153827fc265a9409f5538)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
index 92b6ff5157..07389f6982 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20211216.bb
@@ -751,6 +751,7 @@ FILES_${PN}-bcm4356-pcie = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-pc
 FILES_${PN}-bcm4373 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.bin \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373.bin \
   ${nonarch_base_libdir}/firmware/cypress/cyfmac4373-sdio.bin \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.clm_blob \
 "
 
 LICENSE_${PN}-bcm-0bb4-0306 = "Firmware-cypress"
-- 
2.34.1


