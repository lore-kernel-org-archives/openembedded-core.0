Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F37C433FE
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:00:16 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.179.1668308413244837333
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:00:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qo928f8Y;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668308411; i=@fujitsu.com;
	bh=4ONOxsXpLS0XgKK30WKDEQbw0llTe0ZfC+CcuAqdgM8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qo928f8Y4gfminGqkrGU1EDAFsyGYZ3+ssQYRslJk8XpR3MCgCBHFSCzSWaW5nGGr
	 u0QIoHaUzhK1VpbGB4Ldfbz9l1pdWDqGoixgDu5XO/3Tz9C25aung9na00rWxHU2oa
	 jFmlPVL20fBHgS40hc5T/oqV70evSs2KsHLL26tcma0lE1/tUh4bx39Ky1uiWXCorX
	 jo24v4ofafg9srkMMAKdZLMzgunc+Z00N5m4zdcOA2bimWzsFb/fOoPf7644m5cp69
	 0Mwuc0A3NTTJ2JB1xloOxjnCunBHoPWGhCIM3wLCB7QGpcevq2W1e46ccjWTtsrhy4
	 72pIJeSJ5Yl/A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8ORpLs7tiD
  Z4PgpNos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPC64dMBX94Kr7/fsfSwHiOu4uRi0NI4AGj
  xNFX75kgnEtMEptOHINy9jBK7Lw6Bcjh5GATkJK4cf8/WxcjB4eIgJ7E1X+iIGFmARWJF7972
  EHCwgKWEjs2JICEWQRUJT7On8IKYvMKOEk8+nWRDcSWEFCQmPLwPTNEXFDi5MwnLBBjJCQOvn
  jBDFGjKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmM/LOQtM9C0r6AkWkVo2lxalFZapGuiV5SUWZ
  6RkluYmaOXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5qySZGYCCmFLP57GD8t/SP
  3iFGSQ4mJVHetOv5yUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeH9HFiQLCRalpqdWpGXmAKMCJ
  i3BwaMkwlthB5TmLS5IzC3OTIdInWI05vhw6MpeZo6ZX9sOMAux5OXnpUqJ80rEAJUKgJRmlO
  bBDYJF6yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxro4Gm8GTmlcDtewV0ChPQKd8j80B
  OKUlESEk1MCWsqJ2aUn/utn67yRwzZobkaQb/dl+8pv+hwptn1+72m+GeYcnx/2bu2s/kGSP2
  JpmpuzrVcMvdYq1juV8SqsTf3njk6LPj3fYspskbit4fC9/4wTmr1VDAvs8m0f39joOOutyT1
  ESWiCTG3RUz2SR5c9rDmdoud+PK42euvCKcPk/7rf9lxh+vY0+ztt25p3bTbtE3ln2Rnc+Ugt
  NmlFwpnMj0ZdrrwKznb87FRMwMqFk9m6W/ZuWi/umT8s/vXjX9i+wP5Sv7vvxo/Xla8Hiqvdr
  7L7c3f+a7eztnQizfjxcZujX7uttKzRZzd1aLPb/y8mSezNpUN5Edmsf4Fj2dF8BoZLqlW1L8
  4L1w5WIlluKMREMt5qLiRAAalbTdUQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-591.messagelabs.com!1668308410!781452!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18403 invoked from network); 13 Nov 2022 03:00:11 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:00:11 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id BB4791B1
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:00:10 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B07B57B
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:00:10 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:00:09 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mesa: upgrade 22.2.2 -> 22.2.3
Date: Sun, 13 Nov 2022 10:59:53 +0800
Message-ID: <1668308393-14671-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173171

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mesa/{mesa-gl_22.2.2.bb => mesa-gl_22.2.3.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_22.2.2.bb => mesa_22.2.3.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_22.2.2.bb => mesa-gl_22.2.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.2.2.bb => mesa_22.2.3.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.2.2.bb b/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_22.2.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 7dbca5876a..6246b723cf 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -25,7 +25,7 @@ NATIVE_PATCHES ?= ""
 # required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUILD enabled
 NATIVE_PATCHES:class-native = "file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch"
 
-SRC_URI[sha256sum] = "2de11fb74fc5cc671b818e49fe203cea0cd1d8b69756e97cdb06a2f4e78948f9"
+SRC_URI[sha256sum] = "ee7d026f7b1991dbae0861d359b671145c3a86f2a731353b885d2ea2d5c098d6"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_22.2.2.bb b/meta/recipes-graphics/mesa/mesa_22.2.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.2.2.bb
rename to meta/recipes-graphics/mesa/mesa_22.2.3.bb
-- 
2.25.1


