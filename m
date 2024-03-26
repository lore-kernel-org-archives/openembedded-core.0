Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFAACD1285
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:43 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.7881.1711413457301266588
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CT1xNSj9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413457; x=1742949457;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7/TMmFtDzEFIGkLVQnM+RqgGLl4UttJbh66EXa2LpS0=;
  b=CT1xNSj9NZLTWOZ3CpiGUWfXhRTSznKJVyPiAioJlktCjfqG8+tmTdkn
   7ZqjUyh1qSDqOwOkDB9tydrpddZTDX1lB5wAUGhrHanO4cbdHMBkvhlRJ
   rx39gGfH85W4Db92aYVGAacVr3nItMq2fxKA/G8/JLxhyOxVb/zNjySOG
   KdsNWbt9dS8zLgpftYuaNAuJp5W3fXjrdVZbQ2nsmuma+Tmx7WXtxR+KC
   DwCrzeciXgXfqe1at7GEPvliom9Ybx4eg1+tRF9/WqVXJTNLbpBbB9BM+
   k85fJxr0gzwEbXA7ReOvXhoo144ZY5RIg1bZ62XBLYjcWR4/HIScJt6EV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="155200314"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="155200314"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:35 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 06D08F0FEE
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2FA26D52B1
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C15D520097BFD
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6B58A1A006A;
	Tue, 26 Mar 2024 08:37:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 20/34] python3-importlib-metadata: upgrade 7.0.2 -> 7.1.0
Date: Tue, 26 Mar 2024 08:34:38 +0800
Message-Id: <1711413292-3025-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--0.238200-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrAWQaZTMSP87fUZT83lbkEMHm
	cwAHIyVA+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74DhKQh1LCmGBlCx3a/pWcPanpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFCc00dvXtd1QJZdEb3aarPnPOF
	ceSyJKuycnnVcrMbaOSUjMVClqtfmg+bnpeegPUreq8FYZVhechl+hm0DFjrpCz06MerxfY+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197510

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Make MetadataPathFinder.find_distributions a classmethod for consistency
 with CPython.
-Allow MetadataPathFinder.invalidate_caches to be called as a classmethod.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ib-metadata_7.0.2.bb => python3-importlib-metadata_7.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_7.0.2.bb => python3-importlib-metadata_7.1.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_7.0.2.bb b/meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_7.0.2.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb
index 719d5f84f9..fdb37cecef 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_7.0.2.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "198f568f3230878cb1b44fbd7975f87906c22336dba2e4a7f05278c281fbd792"
+SRC_URI[sha256sum] = "b78938b926ee8d5f020fc4772d487045805a55ddbad2ecf21c6d60938dc7fcd2"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.34.1


