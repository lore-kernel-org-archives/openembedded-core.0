Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFDB1088E60
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:15:25 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7871.1773915320116014892
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:15:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LzqAEUy3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915320; x=1805451320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0B1cMLxYXqftMQ7C8KJ32K+/Xlpr1CS1Zyg/7zEiPxU=;
  b=LzqAEUy3KC/X2Thb+sbjmS+x0Er1QpohsolrsKQqOUnl07RNDRJ0Brr2
   yeGNjrjDu1rcC7dOQbj0yizcMRCRoI1ZbD/bt/eWZT3lqCNqe+zPaJ9u9
   LKd/u+CWzVNb/ffYoPrJ86aWcvGegxU+CoT7US0YT13e98LAgPqn2t3Gb
   rYbwwwMBxCIT7LRbF/VXVj+6lzE6VmoqFc4GrIqlZjSxX6xyX4f77BOC0
   uHEgC/3U/pIwhthav5aj7zDn8nKwikgbb7yFjvVmzO1Bib5im3JowsSuq
   edo7etkl1veJ9aI2nPbesCmuKFXkhFNwie9/XpAm0h8m/jGES3aRujmTD
   A==;
X-CSE-ConnectionGUID: +Yqx+Fs9Qy2++8tBtXqHeg==
X-CSE-MsgGUID: KVghB3eCR4i9sCtbH/Z+hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="233848551"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="233848551"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:14:43 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 7A3EE2BA5
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:44 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 2D0BF100D100
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 4C379101E523;
	Thu, 19 Mar 2026 10:14:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/40] hwdata: upgrade 0.404 -> 0.405
Date: Thu, 19 Mar 2026 18:13:05 +0800
Message-ID: <20260319101332.2067-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233492

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.404.bb => hwdata_0.405.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.404.bb => hwdata_0.405.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.404.bb b/meta/recipes-support/hwdata/hwdata_0.405.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.404.bb
rename to meta/recipes-support/hwdata/hwdata_0.405.bb
index 04b9da8a40..7247e9f365 100644
--- a/meta/recipes-support/hwdata/hwdata_0.404.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.405.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "428ad3882fff801c553fc575d99bcdb2edbd41f7"
+SRCREV = "be46d7186e918e62eb75de399e800145a781c8db"
 
 inherit allarch
 
-- 
2.43.0


