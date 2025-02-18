Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0BCC021B6
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:39 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.14683.1739864488156792405
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oGBZWVgb;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864493; x=1771400493;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JYFTlt0u3tyG0KNMOBbDxpY3K9R9M6gGKAzUVWG4Ti0=;
  b=oGBZWVgbO1HfBwF1k8VLlmNoRtIndPTNxamA0WF/y/bHDLc2mREVI5g6
   y9JWar6KNloR6QOv9A7aOGtBRTF2lHY1mU8UDbmCDsqousOrvESEJFfyh
   hyjPFjiGVmWoDiJ2Bxu5G4YhVeIx7WFGGC0aYZbzTP1CofSCUC+H1ryyq
   mp/0x5eMAtR7D/upNamusMeDsSWB7lf7ayVwb+sMvq+2ErRWXbV8zLngI
   Kj8NkbHmyiPe9zAdrr7lGYC2XGJO3MJuIYCnyf+jYihqTw447VGY9QHMo
   0522Ihtt0AwedrY/+Jegt2BMyZXNUZQRYYzR9E54fSLu2c6b247rqBhp0
   A==;
X-CSE-ConnectionGUID: Fn9+B6njQuauHSkMEVkhvA==
X-CSE-MsgGUID: dJPOI4qeTViwO6tEL9WwEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="190382326"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="190382326"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:32 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1337C1631D
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C99CBBDC8A
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:29 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 918BC1A000B;
	Tue, 18 Feb 2025 15:41:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 28/32] ttyrun: upgrade 2.36.0 -> 2.37.0
Date: Tue, 18 Feb 2025 15:39:31 +0800
Message-Id: <1739864375-21394-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211587

From: Wang Mingyu <wangmy@fujitsu.com>

Changes of existing tools:
- dbginfo.sh: Add details on CPU-measurement
- dbginfo.sh: Add new crypto command
- dbginfo.sh: Add overview commands and crypto update
- dbginfo.sh: Adding kdump info
- dbginfo.sh: Removing outdated email references
- dbginfo.sh: Rework network section
- dbginfo.sh: Update copyright 2nd year
- pvimg: Add '--(enable|disable)-image-encryption' flags to 'pvimg create'
- pvimg: Add '--cck <FILE>' command line option and make '--comm-key' an alias
- pvimg: Add '--hdr-key' command line option to 'pvimg create'
- pvimg: Rename '--key' into '--hdr-key' and use '--key' as an alias (for 'pvimg info')
- pvsecret: Add support for retrievable secrets
- ziorep_config: Add PCHID field to adapter report
- ziorep_traffic: Add DEVBUSID column to traffic report
- ziorep_utilization: Add --fcp-device parameter to print virtual adapter report
- ziorep_utilization: Add PCHID column to physical adapter report
- ziorep_utilization: Now prints only physical adapter report by default
- ziorep_utilization: Swap Bus-ID and CHPID columns in virtual adapter report
- zipl/boot: Increase section size for eckd_mv dumper
- zkey: Add support for listing and importing protected virtualization secrets

Bug Fixes:
- chpstat: Fix invalid utilization data on older kernels
- opticsmon: Fix runaway loop in on_link_change()
- zipl: Update inline assembly for GCC 15
- zipl_helper.device-mapper: Add missed step in logical device resolution

gned-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ttyrun/{ttyrun_2.36.0.bb => ttyrun_2.37.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.36.0.bb => ttyrun_2.37.0.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.36.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.37.0.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.36.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.37.0.bb
index 3a58f19a9a..e8fb4831e2 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.36.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.37.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
-SRCREV = "0cd063e40d12d7ca5bc59a09b2ee4803653678bd"
+SRCREV = "793c037ded98cd001075cdb55a9c58e122380256"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.43.0


