Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3961C77B7C
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 06:47:45 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.web11.24666.1685256457039929883
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 May 2023 23:47:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=dV7/vdBx;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=886; q=dns/txt; s=iport;
  t=1685256457; x=1686466057;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NhDDDI/5Ap1E89aXOfP3DEgJikF9g1n0lkCAoVx1NRQ=;
  b=dV7/vdBxQRtAv04TYezAiGeZ0Ssz0CQsbpOCEQR3iOI6p8HyILheSDSR
   HmzSix7x3xhFB52BAHq4AUbE03LeaVszU5OLiYeQ4vMWZCgSSnCoBPJOv
   u4l2656WLa/8l4s0GkyXznqKb/ihSLqGsUlkuAVdDjCi8IyviAd01OovB
   A=;
X-IronPort-AV: E=Sophos;i="6.00,198,1681171200"; 
   d="scan'208";a="55659266"
Received: from rcdn-core-1.cisco.com ([173.37.93.152])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 28 May 2023 06:47:37 +0000
Received: from sjc-ads-7441.cisco.com (sjc-ads-7441.cisco.com [10.30.220.226])
	by rcdn-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 34S6lZx5019716
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 28 May 2023 06:47:36 GMT
Received: by sjc-ads-7441.cisco.com (Postfix, from userid 1812315)
	id 7251DCC1293; Sat, 27 May 2023 23:47:35 -0700 (PDT)
From: Sanjay Chitroda <schitrod@cisco.com>
To: openembedded-core@lists.openembedded.org, schitrod@cisco.com
Subject: [OE-core][PATCH] Revert "sqlite3: update CVE_PRODUCT"
Date: Sat, 27 May 2023 23:47:32 -0700
Message-Id: <20230528064732.3890226-1-schitrod@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.226, sjc-ads-7441.cisco.com
X-Outbound-Node: rcdn-core-1.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 06:47:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181813

This reverts commit 8800976e79d65956218ab462d9644d0661579301.

As per NVD database "ghost:sqlite3" product is specific to "node.js"
CVEs reported against above products are not applicable to us.

Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
---
 meta/recipes-support/sqlite/sqlite3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index c246d42fdf..9a0de08553 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -18,7 +18,7 @@ S = "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
 UPSTREAM_CHECK_URI = "http://www.sqlite.org/"
 UPSTREAM_CHECK_REGEX = "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
 
-CVE_PRODUCT = "sqlite sqlite3"
+CVE_PRODUCT = "sqlite"
 
 inherit autotools pkgconfig siteinfo
 
-- 
2.35.6


