Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22CE6C83035
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.35176.1751274809073093360
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Wqi4aIxL;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274814; x=1782810814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FqM/2Vywv0C/hcopmYgc76Svh9WpDxSpifk0BbaNYKE=;
  b=Wqi4aIxL2MSqXGlitzAmCgpCKOgbHWJ4HN16FsMUFNqbv6BfqfCsGvHg
   w8UDU6mItMwaEZoxzUDjHQKCh6dSfUrAwQBg2Aoqzfw8zmL4zyEneU0LR
   IwMlfqndas76sxVWhxdogYXoJEpyNNweniIuPhUj89yqj77lZPIUpCvL+
   vLbTJnRliqZfdhB1YsUYev+H/RbLanZP33DykTJXDHZ5v87KppLe2S057
   T8Jn3hAgxm3CFd2I2YRlLeyJCGuQvRDwqZUa6nDL7x+8lzgRUN8H1bWzE
   Osmzy2EXG2+Fxm9kGn8Qi0pYA3+Zr8i50o562hbCwpY9gTjg5joj1tyeM
   Q==;
X-CSE-ConnectionGUID: 4wI1gF96QBqwhkEFZPYP/w==
X-CSE-MsgGUID: 0/g1y9//TCubvdzS9U+2YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="193015491"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="193015491"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:33 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 9234A1000350
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:33 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTP id 14CFE10000E1
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:33 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 797B3F8111
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:32 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EFA021A0073;
	Mon, 30 Jun 2025 17:13:31 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 34/37] repo: upgrade 2.55.2 -> 2.56
Date: Mon, 30 Jun 2025 17:13:12 +0800
Message-ID: <20250630091315.1897-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219490

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.55.2.bb => repo_2.56.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.55.2.bb => repo_2.56.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.55.2.bb b/meta/recipes-devtools/repo/repo_2.56.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.55.2.bb
rename to meta/recipes-devtools/repo/repo_2.56.bb
index 882f3e6312..efdb9bd0c9 100644
--- a/meta/recipes-devtools/repo/repo_2.55.2.bb
+++ b/meta/recipes-devtools/repo/repo_2.56.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "b262d0e4619c406a2708856ed312091d21c5bf39"
+SRCREV = "99b5a17f2c951fe5979100c36e7e1dbb4c61b36c"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.43.0


