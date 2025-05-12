Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A66C3ABD4
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:01 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.45969.1747040638105268631
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G6VisvEP;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040640; x=1778576640;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8tJWVq8zGiQbIy7lXUMdc/pWDDaWi0W3VFDmFQ39aZo=;
  b=G6VisvEPGZYdWkTXBblDT7XfJ2Pldp17bn8K5XV8YNjS3zo+ZU6Q8wr3
   s2MhSLJR/gZhWJzSnh/Kg1V/hWTWxEy91JglHAB+YJasB/nfG3AXTV5qb
   3bjza1HUpWDCXR80nVbGSGlmO5+F//t9kAicw5CHqoVu/4NsbwYBm1RyR
   IKl36P1VSnLACe4TpJoU55LHvtgwRUnAta9wvCH9KoOcpUM5CNOr0FO+0
   hHrL884EtTMVRGGpiRuh1vJ+YEllg0WHmv5lXIdtZd6vhnpFvcH9wuSTc
   BV52pWY2PEWsEepGcCj2saRWyj7JdtgO//oy20UM2M8mJXBHOJAL8yWKT
   Q==;
X-CSE-ConnectionGUID: 6Fn5Y4HzRleEkIvA8Mn/bA==
X-CSE-MsgGUID: ykveBD+tTuKKZ2xoNAPDZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="198343069"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="198343069"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:03:57 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DC8A5D5014
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A499D5045
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:54 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5B0B21A009A;
	Mon, 12 May 2025 17:03:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/56] debianutils: upgrade 5.21 -> 5.22
Date: Mon, 12 May 2025 17:02:53 +0800
Message-Id: <1747040619-7566-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216311

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../debianutils/{debianutils_5.21.bb => debianutils_5.22.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/debianutils/{debianutils_5.21.bb => debianutils_5.22.bb} (95%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.21.bb b/meta/recipes-support/debianutils/debianutils_5.22.bb
similarity index 95%
rename from meta/recipes-support/debianutils/debianutils_5.21.bb
rename to meta/recipes-support/debianutils/debianutils_5.22.bb
index e0485b24a3..f5deead51a 100644
--- a/meta/recipes-support/debianutils/debianutils_5.21.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.22.bb
@@ -8,10 +8,10 @@ SECTION = "base"
 LICENSE = "GPL-2.0-only & SMAIL_GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9"
 
-SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
+SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master;tag=debian/${PV} \
            "
 
-SRCREV = "ae002b498f2e310c934a0b3f0992e83391f108c7"
+SRCREV = "528fac5c7448989f33c54599ae6e4c2b84d41e21"
 
 inherit autotools update-alternatives
 
-- 
2.43.0


