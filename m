Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9542EC3ABD2
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:12 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.45981.1747040646361447708
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XiWC3gJw;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040648; x=1778576648;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=S5soin9ygQkZhuDjjTlRjSTIoKJuv7WQhNhP6WUCyBQ=;
  b=XiWC3gJwAcLovw9hXDQrCu+Rr511mTuPFc1Or4cgLbNaTZyxHGuStvtR
   08RuUNVlx8xuqafDwXyzg/pnkOYdzaUAc+JjeePLA/2bXT9hQ4YJJPERi
   dSKYv0e8IAdHJXbrDUFoxp5NzHR3XfyvYvxPZcPg5cF2TLJT5edi5V9YO
   NpsPgI5Eo5mL2vq1A3ihEPkQoKIdW3rEZcUl4hTxglIbJI9pHVnE5QplX
   HMEjzIa4mUHrVxgkZZDjIcWAiOxg3s/SWR7q1rUfuflLQ2yEHbqyvKh60
   ceVnyWqEGLW0FeLMU/l6EfPJmrCb0WsuST5xfNzGOEwgO8b5o8a7goxxO
   w==;
X-CSE-ConnectionGUID: LWy+mr5DT5CJSnoRMJdGFw==
X-CSE-MsgGUID: ogmSkZNRQJSJ6DVZUHMNYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="186489691"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="186489691"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:07 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 442B2D5051
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 04F3ECFBA2
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:05 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B65B91A00AE;
	Mon, 12 May 2025 17:04:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 54/56] resolvconf: upgrade 1.92 -> 1.93
Date: Mon, 12 May 2025 17:03:37 +0800
Message-Id: <1747040619-7566-54-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216347

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../resolvconf/{resolvconf_1.92.bb => resolvconf_1.93.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.92.bb => resolvconf_1.93.bb} (98%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.92.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb
similarity index 98%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.92.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb
index c3ce5bc22e..93e5a944d1 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.92.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.93.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=un
            file://0001-avoid-using-m-option-for-readlink.patch \
            "
 
-SRCREV = "86047276c80705c51859a19f0c472102e0822f34"
+SRCREV = "ab766fa31f7939f6d879123236b4275320b7ff64"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


