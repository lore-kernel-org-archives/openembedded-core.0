Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 817EEC021B0
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:28 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.14628.1739864485290970726
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IxzYbz0q;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864485; x=1771400485;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FUZZ0l2N9U1M3nwWvW7ShVcaCj0M/RmnMoq9nsusmB4=;
  b=IxzYbz0qwW1QO5a8k8RlJ+jm7NhRP/X4bi/3sP/o4l6eOkdiXWqSjoZR
   OOpgyGbjBUUU0rw/BdO6Krr4HqIjqQ8+Jo4EyveNMi2tAJ6TYQA1968pp
   H8vNNIlOs4Ba12JLBMJCyybIck3V7bOeNWT/0Uv57AZuOCx9Nx4duiYem
   4B3Z9tu95U15m6uOjQUGzfHcCZ6G2JVP0Eb5DDSSqRM5IQEcVdfIElxUn
   z56W6upFJwWeQp0bUneDXQ2nZjzuEdw7GCDH5qNFZ9XzDeWF5+pLouW5C
   bwuXgZ/ue+fursYF4mgt5fzplaAgsheFr8JH+V+i61OXePAFeF80O8mse
   w==;
X-CSE-ConnectionGUID: sGvobkajT1Cr34n517y5zA==
X-CSE-MsgGUID: AmcEgGZuTLSaolMKysqZbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="169232645"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="169232645"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:22 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DEB21D4C48
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A7E26BDC8F
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:20 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4A7291A006C;
	Tue, 18 Feb 2025 15:41:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/32] hwdata: upgrade 0.391 -> 0.392
Date: Tue, 18 Feb 2025 15:39:09 +0800
Message-Id: <1739864375-21394-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211570

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.391.bb => hwdata_0.392.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.391.bb => hwdata_0.392.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.391.bb b/meta/recipes-support/hwdata/hwdata_0.392.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.391.bb
rename to meta/recipes-support/hwdata/hwdata_0.392.bb
index b2fa87c275..e0a1a7fbb2 100644
--- a/meta/recipes-support/hwdata/hwdata_0.391.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.392.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
-SRCREV = "0955087d49d085d1ef2207d6bef0c07b02844b78"
+SRCREV = "e3aac7f6bed87ca6d701bb5ad30f29a8df857f66"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


