Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF0FCC83F2D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:08:35 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.2990.1752566910760890102
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 01:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rQpZwi2W;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752566910; x=1784102910;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MMMdAu+xZJborYY+MJENFQAAoyrEOYYA5sV9/MT1Dao=;
  b=rQpZwi2W4UxwT5kmS505+DxZlVjEfooQZQt6FYiuGGlA0iMIcQoT0Esx
   rKCM8C5rHs5t8M6+cXOfFY4jk69l9B9fH9qHjDB/YgQ4KYU0AziFoIPg+
   hFK5GVpIHWOBuxQiTg3CqPtadeZk0zd8qKOTRztd2GbaDYwzOXQjinPwc
   rO5b7US8+S0QP/go8KMB8qXgc/xZ9J6auaLwYzM8gKrH19BwwJdrKszAF
   yQs1L+AzBM32cqVHMWSLegwAaGB45tcxFETUErHYSyIt8A/J5x+H8JPE8
   fVMaw5FlZjPuoH3uAhrheplzG0cgWLTwoePmL+GJvSb14C20uyX4Z0lz/
   A==;
X-CSE-ConnectionGUID: 9V+edV7iRv6A/7ir2slD5A==
X-CSE-MsgGUID: ZgpgJLhlTnedvxc8ozC61A==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="185255735"
X-IronPort-AV: E=Sophos;i="6.16,313,1744038000"; 
   d="scan'208";a="185255735"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 17:08:29 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 2C2C61002B93
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:29 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 8550E8D65EA
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E85A31A008D;
	Tue, 15 Jul 2025 16:08:24 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/19] hwdata: upgrade 0.396 -> 0.397
Date: Tue, 15 Jul 2025 16:08:05 +0800
Message-ID: <20250715080819.622-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250715080819.622-1-wangmy@fujitsu.com>
References: <20250715080819.622-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220274

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Update pci and vendor ids

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.396.bb => hwdata_0.397.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.396.bb => hwdata_0.397.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.396.bb b/meta/recipes-support/hwdata/hwdata_0.397.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.396.bb
rename to meta/recipes-support/hwdata/hwdata_0.397.bb
index bf6dd9889e..bd985c2a14 100644
--- a/meta/recipes-support/hwdata/hwdata_0.396.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.397.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "736513dfc1d44c5fb48bead62af7e91c4e1d1dd2"
+SRCREV = "e4423c783ca7db5c9d6d4881985272849f4892cf"
 
 inherit allarch
 
-- 
2.43.0


