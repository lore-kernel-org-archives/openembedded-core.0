Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD11C28B23
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:33 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.18104.1741079371384597477
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GMKS3CB7;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079372; x=1772615372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=TFDsxhOrq/owetlFjcbB6d4NCfBmdI3N1cjnBXaPods=;
  b=GMKS3CB7BxcqsGVieaVrEqUj3ryUzzknjICAjDfRiLfXCb8qzmYq1wBv
   zWhxhrewmUnp1tHeW8Rj2b5rzaeLS+WAj9Isqk/qWB/S8MThKjLQ5L7Es
   /dtflbJABKjFo0IuxVCeGCuGPz8Fhqz5lLue0IO5wxHFmgW1lr4N7A94Q
   Dxgt1FwrfcMiwzK7T9gSfBDp7Jg3GLiDsqRvviSxOR45SFtdVor3NlkPg
   d29Yp9bagBHoKySRqH99KWJfFTY5rdR04ixJQjU9CePXswG4dP/wB/hxV
   pSAEWQvySu+eC/hXSft8/6iZ9lM6IXXuM4fsAndrZp8nhLxTXNBAIBOtS
   g==;
X-CSE-ConnectionGUID: Eaoi7ITmST+j6F3naLdsTQ==
X-CSE-MsgGUID: 8du7IQpfR9GIb4PzCxUFpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="194539728"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="194539728"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:30 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7667FD4807
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 39263D72A6
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:27 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EE3B41A009A;
	Tue,  4 Mar 2025 17:09:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/31] nghttp2: upgrade 1.64.0 -> 1.65.0
Date: Tue,  4 Mar 2025 17:09:00 +0800
Message-Id: <1741079356-13445-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212243

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nghttp2/{nghttp2_1.64.0.bb => nghttp2_1.65.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.64.0.bb => nghttp2_1.65.0.bb} (91%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.64.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.65.0.bb
similarity index 91%
rename from meta/recipes-support/nghttp2/nghttp2_1.64.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.65.0.bb
index 5d5111a937..008935f165 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.64.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.65.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
-SRC_URI[sha256sum] = "88bb94c9e4fd1c499967f83dece36a78122af7d5fb40da2019c56b9ccc6eb9dd"
+SRC_URI[sha256sum] = "f1b9df5f02e9942b31247e3d415483553bc4ac501c87aa39340b6d19c92a9331"
 
 inherit cmake manpages python3native github-releases
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0


