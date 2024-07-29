Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEB2C3DA70
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:41 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.46590.1722215425506508167
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cnEhksXa;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215435; x=1753751435;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=lcRObiNvlXHjY+XGY7+80/Y4TYF4LOrIv+/Tp8vnB7E=;
  b=cnEhksXaX+tSBKMQoCuW9g/oWudvsrvOU+bGi8l2O4iV/LIsUzWwEpah
   1XQApHfgJ6hJ2TpnBsLCBs2IWkepA+muEoTZFuhhuZwUuAN7+imp0aeg1
   MT9nidRCfbIezljsP9Z8JEDkwGx63EtT+CATJykNZ8VvNBT1jA6Giirnu
   Q/APoO6A89AK+rKloxl9b06c7Q7Qb+gNnazqbUNRXxu8tCqeBx8VmoSyU
   RXR2veIW1SaP6QWEWAhUyQ6a0Ac9DvWhSxd3AhXvr+rL/jFEPsSjWNF0s
   8n+pjwfaUFVXC8VIp6A7syFff3t5i+QKTUmV13Ep5itGQz1o8A4u/Wqup
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="170816577"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="170816577"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:34 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 00B5ACA1E1
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:31 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C434D4F40
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C633120071A1D
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6D34D1A0002;
	Mon, 29 Jul 2024 09:10:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 32/33] vulkan-volk: upgrade 1.3.283.0 -> 1.3.290.0
Date: Mon, 29 Jul 2024 09:10:07 +0800
Message-Id: <1722215408-27541-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.004
X-TMASE-Result: 10-0.769700-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4Baxij4Vq8gZkH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRvAQzqh8D4IY5soi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62S36sGGEHHEKaGYZszDaRNgmLzLXirxV751c7700J0x5vYIn
	KBdCUvwLhUuY1FTkYRzMMNzIMswQ8SM0YinWxSu0F2u3y91hFFS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202605

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{vulkan-volk_1.3.283.0.bb => vulkan-volk_1.3.290.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.3.283.0.bb => vulkan-volk_1.3.290.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.283.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.3.290.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.3.283.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.3.290.0.bb
index 5485aa0b0d..e1bad6a96d 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.283.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.3.290.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=12e6af3a0e2a5e5dbf7796aa82b64626"
 
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
-SRCREV = "3a8068a57417940cf2bf9d837a7bb60d015ca2f1"
+SRCREV = "466085407d5d2f50583fd663c1d65f93a7709d3e"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


