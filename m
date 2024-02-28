Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1600C54E58
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:20 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.8386.1709105591785340666
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=arL4tr81;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105591; x=1740641591;
  h=from:to:cc:subject:date:message-id;
  bh=vfgA55BbPQ+MxCfbwSjuF8WokouBZA3eNRqgYbwhnF4=;
  b=arL4tr81WN1NZe0gt+xSn+BQpA6A6LoYdrTu14QI9aPkf/AGzg2NeWEJ
   +Pz/L7mfU1QcwVZkfJb6ZKBI7TsL5w0T0OGJ6CgngEaZO/Tua4Iyu/JmZ
   JsdURNrlv9bd7rEjm2dxcVZSkQv3b9cwjfR0Z1rx2nD06PgvkhyyrmxPY
   wmuMEmTKsL9bPBne0bfeO3ZjIE4BAlWXGdX2O93VDmQfxse8TF2eSwksb
   TOAXuXSmJ7J9ZrzvChHnR5uHnvOalGp7PkQbURZ/07N6QNeV0QUnPbIuo
   fVnP4Mtw6q+iVfAQBvfnU82z1XgBc8pNJj11oQhEZhF5SDhZwbAMEQQyZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="129958978"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="129958978"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:05 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 427FDA0290
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:03 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F4E0D7B82
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E84C741180
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6FAC41A006A;
	Wed, 28 Feb 2024 15:33:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/48] bash-completion: upgrade 2.11 -> 2.12.0
Date: Wed, 28 Feb 2024 15:32:08 +0800
Message-Id: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--4.989500-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74C2SlZsf8SKLsSiwizsgluQ1vZ
	7s3YIVDIkh+VE4CoQd+ezToK22g6ls11Uem18eXpvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8lBgw
	5G4NYCZDgGsBPCbyGiJ0RPnyOnrZLTO2Nlg9gSPPE+rfaL1Tsg1wyI+LVUSE1ovaRod8NT6NFdg
	CP2SRnQmyVx52jl5oxX1tZBFLToo3QQFzDpOQjchajteZHyKLFLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196327

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 docs(COPYING): use unmodified upstream license file

Changelog:
 https://github.com/scop/bash-completion/releases/tag/2.12.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{bash-completion_2.11.bb => bash-completion_2.12.0.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/bash-completion/{bash-completion_2.11.bb => bash-completion_2.12.0.bb} (83%)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.11.bb b/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb
similarity index 83%
rename from meta/recipes-support/bash-completion/bash-completion_2.11.bb
rename to meta/recipes-support/bash-completion/bash-completion_2.12.0.bb
index 19bc81619f..66f65f565c 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.11.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb
@@ -8,14 +8,13 @@ HOMEPAGE = "https://github.com/scop/bash-completion"
 BUGTRACKER = "https://github.com/scop/bash-completion/issues"
 
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SECTION = "console/utils"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "2514c6772d0de6254758b98c53f91861"
-SRC_URI[sha256sum] = "73a8894bad94dee83ab468fa09f628daffd567e8bef1a24277f1e9a0daf911ac"
+SRC_URI[sha256sum] = "3eb05b1783c339ef59ed576afb0f678fa4ef49a6de8a696397df3148f8345af9"
 GITHUB_BASE_URI = "https://github.com/scop/bash-completion/releases"
 
 PARALLEL_MAKE = ""
-- 
2.34.1


