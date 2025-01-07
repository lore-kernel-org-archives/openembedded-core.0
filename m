Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1500AE7719D
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:01:46 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.16406.1736240495596525238
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X2ILKk9z;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240495; x=1767776495;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EM8IB0TWJoiXBy4svZvYd6lRPOT9w5mJalMryi7vtiw=;
  b=X2ILKk9zizVIw1+wtk9b0TXZLgzzbP9wRxW4Xu/cRFAl/p1rHGxnMX6y
   v6KS9vlniYZ+TJWi3wCgqs+WP/b3dCd5NHoL3i6ZY9QxdmBl2RAXx9Gn1
   8bGQ4hAyxC5mYC4ajFaqNl3rwqmUESoODZjT68ICSXG9HTW3sFPP6EhVL
   MLx892U3mi8SkwbaVmtilEELFlUAkdHmPi0HgB4x+hmv0MiSLLNLCcNuK
   QsWTNuJGOe23OGR3UcP7avys9HpDS29YSN55wriPGx94pDjeBa9WnZejE
   ilPYbmFeC4rJTc457FjOW4j6crv1BYGcwUsTeYPrvXK09aRXlbRrWrarp
   A==;
X-CSE-ConnectionGUID: MabZTd/SQ52tYYe+lH66Rw==
X-CSE-MsgGUID: qyT5qQwXSQK+5lJyP8a0jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="173804694"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="173804694"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:33 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D462DBB89
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:31 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 644ABD4BCF
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 04DAF200930C2
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:31 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B44F01A0073;
	Tue,  7 Jan 2025 17:01:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/13] xf86-input-synaptics: upgrade 1.9.2 -> 1.10.0
Date: Tue,  7 Jan 2025 17:01:21 +0800
Message-Id: <1736240482-5243-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
References: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10-0.816300-10.000000
X-TMASE-MatchedRID: RZx/oPdTBCjg5EqnY2EgGn1zro62qhdCVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorcH4/RZ7lQnuce7gFxhKa2YkAyCbA7KV5soi2XrUn/J8m+
	hzBStans/qD12bv+1ygtuKBGekqUpnH7sbImOEBQkuEyUXt4MtrpL15DkZHAN3dpG0yi0KE1hIv
	tfCcLAsy4QN6G7ouZjGkkM9KZuNvx5M7cqKhtJFS+yxtRAFINbS1C4ewBXhN3sfZ9V6Q6rCZgvU
	oiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 09:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209444

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-input-synaptics_1.9.2.bb => xf86-input-synaptics_1.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.9.2.bb => xf86-input-synaptics_1.10.0.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.2.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.10.0.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.2.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.10.0.bb
index 8e446290b2..09b6f6c966 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.2.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.10.0.bb
@@ -10,7 +10,7 @@ advanced features of the touchpad to become available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=55aacd3535a741824955c5eb8f061398"
 
-SRC_URI[sha256sum] = "b8fa4aab913fc63754bbd6439e020658c412743a055201ddf212760593962c38"
+SRC_URI[sha256sum] = "e0c26adb068edd0869f87a87f5e9127922d61c0265d7692a247a91a5cc1bb5c2"
 
 DEPENDS += "libxi mtdev libxtst libevdev"
 
-- 
2.43.0


