Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2CCEE77190
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:11:32 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.10451.1734945086279928918
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:11:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sJmHRZUd;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734945087; x=1766481087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=UCIBZ3zpzpSGqsSGLQaxbHHmt78v0z4veHgXJDJV33c=;
  b=sJmHRZUdmH6+WlzbBivLIfKdNuA9Hop/IY3Fw36mPIfeLhQJ2ubO4OfT
   C/QcU7MzcKUiTmfaNNLoIKVQ+54otoNypFE7qN5KmiWol/lbCECR1PazZ
   jeiLAMzizXPI4uhcZ/NLXBtyxn5ohAQtC8KMkNpu0rVNSP31Lrdgyguri
   tcWY/x7BRir3/VqCVUfz22qcgWD+r52zUwcNAW2YdqF33M5dUSv6fkhV7
   M1F+P3Anse29BYw3qWcaBH0quTCWHUWZEAHda9e7cB5Y/p/3/gG+bbB5H
   iNjWY7um39uOYpjwY4Xtsyyi8SKubMxDaIgjp3AWWT0nIsHJI4LhTg66J
   A==;
X-CSE-ConnectionGUID: Ty3s8pohRs+JK+jotJtgJg==
X-CSE-MsgGUID: 4ZlFOdKwSVC1yWl+MdFRwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="184623673"
X-IronPort-AV: E=Sophos;i="6.12,256,1728918000"; 
   d="scan'208";a="184623673"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:11:24 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 627F6D5019
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 32B64CF7C4
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 98E726B4DF
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:21 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 419281A006C;
	Mon, 23 Dec 2024 17:11:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/22] repo: upgrade 2.49.3 -> 2.50.1
Date: Mon, 23 Dec 2024 17:11:02 +0800
Message-Id: <1734945065-4373-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28876.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28876.006
X-TMASE-Result: 10--8.479800-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrKQNhMboqZlrkWF+5pfFjvVOn
	pjPgCq4y0qthY6eBVpBxaxJjJ5XCpodhJvvq7rh/ag//jiWuh4NKuILn2p0SMmzUivg1nMWaL/q
	hD90Ny8pngukTeEViUTF7dbwCRbTkWkIi5GvRHEo/QdUh6LEl0ME5XPQnBzGXq8KsbROd9VTZ3y
	a1EhGxQ4GQRIwjTl3ioe/KDVmzFN82uyAbjj7YRJ4CIKY/Hg3AaZGo0EeYG95UMLUJu4leYyq2r
	l3dzGQ1WsehxZFF0rieNii7SYBK45PsiQZK8D9O1ohRbLpeQmI4QvyDSBhE8w==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209034

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- gc: Introduce new command to remove old projects
- sync: Delete symlinks relative to client topdir
- Add smoke test for subcmd forall
- Remove gitc support from repo
- branches: Escape percent signs in branch names
- sync: Do not fail to sync a manifest with no projects
- Fix event log command event hierarchy.
- Make repo installation work without .git

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.49.3.bb => repo_2.50.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.49.3.bb => repo_2.50.1.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.49.3.bb b/meta/recipes-devtools/repo/repo_2.50.1.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.49.3.bb
rename to meta/recipes-devtools/repo/repo_2.50.1.bb
index 5cb10b6096..f1fcc9c8a1 100644
--- a/meta/recipes-devtools/repo/repo_2.49.3.bb
+++ b/meta/recipes-devtools/repo/repo_2.50.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            "
-SRCREV = "ab2d3211043e2cb42a55f56e5abf69d23103c105"
+SRCREV = "13d6588bf60f0980ffa3d178441fa707655fee95"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.43.0


