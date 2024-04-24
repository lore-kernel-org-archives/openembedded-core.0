Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93942C41513
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:14 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.11791.1713948189441937092
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jMhdizc3;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948192; x=1745484192;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=3zhBmfrESP0ZK+ep+00FFE+ZHsrwb7ckJJIAhRCxGCE=;
  b=jMhdizc3Gxfp8w5fWYoRwJnnKy1B3c3nzOW3KKDS3epQ+cRzhJhpzEC4
   i2CAQfCKgngDcXhs4KyoyDUh3RNepvdzuFjrBZNfrDTdjmZC4RSvashnT
   pQGn/F1boiWaCf8Y14U9tFkRo1pl789jtkMr8hJfNBM3vjPJvMYLo4+7+
   k1m5i+EYSXhy/G9BYsRSXWkHAEvmL8otZk2+sTHOw+zBZzaXhOvqZxk3O
   g5iXcAohbOg93COeyGq0AXYrx37c9nQ0NG1Tug11gTmY9+Gas6zU+s0sY
   Ozp0kElEWbWJzSQh2o6vvIo4+37wF29gGrRrW/cxh+ddnd191XxiBiHrd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="158512451"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="158512451"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:11 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id F1879C2AA1
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:07 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 43070D7B8F
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C05EE220024
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6B3FA1A000B;
	Wed, 24 Apr 2024 16:43:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 32/38] repo: upgrade 2.44 -> 2.45
Date: Wed, 24 Apr 2024 16:42:26 +0800
Message-Id: <1713948152-13501-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10-4.161900-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrWQ+QsDdwtAdRiRl337i3bwbo
	TDS3zulAjDVMw6TJvuFBxGEz1MyfiKcUQ7z3S96i8t4fUUGeErQvCQK7USQq0QfxTM57BPHDvwU
	evDt+uW5/XjpbSJS7axK4lG1JTzijeBzEkCCpnRloMLOoNHsM9q4sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcjmExxZa3RmbHdTm6tyZr7N/E+seIMt2ANX3f
	bTjblNX3Of0pnAJ/onJ6F+PtTq84nEc6Rc5wt7Hcyxh8L2rmkHPlRdatLQdr/6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198675

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- project: Check if dotgit exists w/out symlink check
- git: raise soft version to 2.7.4
- git: raise hard version to 1.7.9
- docs: release: add recent git/python/ssh/debian info
- main: Stringify project name in error_info

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.44.bb => repo_2.45.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.44.bb => repo_2.45.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.44.bb b/meta/recipes-devtools/repo/repo_2.45.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.44.bb
rename to meta/recipes-devtools/repo/repo_2.45.bb
index 875897851a..81bf31754b 100644
--- a/meta/recipes-devtools/repo/repo_2.44.bb
+++ b/meta/recipes-devtools/repo/repo_2.45.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            "
-SRCREV = "fff1d2d74c2078b62cc9c2561330e41a842dc197"
+SRCREV = "73356f1d5ccbebf5a33e5e9aa1ba06c5f5437fed"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.34.1


