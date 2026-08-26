Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FB2C61DC4
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:18:59 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7687.1787732332661040757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=g7YX8BKe;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787732333; x=1819268333;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fQ5jgjPAsEDJih8hRHNxjz5NDombbZRMRZviacG15yQ=;
  b=g7YX8BKeNuCxIX/gNh8VTGw1bZl1cIk10oSX1j4NYlBrgphqge+X1byl
   ABUMrqeGh6YPidq02Ya8U9oz+1WGZLFhqJHVbk82JUoeuBXNS4UMAm+mC
   9nLl99FYBNpXUaphvTTKMl0WC6a/XVSKOav0gOn4tVB9WBupiwawDPNG4
   cVqvob/820LeXel/noJMjD/PUBFQpHg0aHBlbV44lWTMGY76zki4N0c75
   uG66DP9pNowO0n1jHJddQXS8+yhYRKMrhxaCScTdEf6PuRpmISaK/XkJO
   +SCD50GWZIF0K4N/ZnUZd9T1hqgNFU3fk3EZbNUxRNrjyKga0NJxYKfdR
   g==;
X-CSE-ConnectionGUID: kS8sYT+MSlC2KL+puFX97Q==
X-CSE-MsgGUID: lahURJqrRcam/Q+kvmU7lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="256374436"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="256374436"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:18:52 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E35EF1C1C701
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:51 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 9C2591401200
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 9243F8214F5;
	Wed, 26 Aug 2026 08:18:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/17] rpm-sequoia-crypto-policy: upgrade to latest revision
Date: Wed, 26 Aug 2026 16:18:31 +0800
Message-ID: <20260826081832.1059-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826081832.1059-1-wangmy@fujitsu.com>
References: <20260826081832.1059-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244357

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index c094f3b205..7f7896cf85 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -10,7 +10,7 @@ inherit allarch python3native
 
 SRC_URI = "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master"
 
-SRCREV = "c42da772d5fcedc55aee8f2a3348e7d718551910"
+SRCREV = "359ab169da6a0d4d0fa09fed562bb0d56f470030"
 UPSTREAM_CHECK_COMMITS = "1"
 
 do_compile () {
-- 
2.43.0


