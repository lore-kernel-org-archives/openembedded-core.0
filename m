Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D57FC47DDB
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 05:49:09 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.9367.1706766547006772860
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 21:49:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tCg+cYJX;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706766547; x=1738302547;
  h=from:to:cc:subject:date:message-id;
  bh=pcAyu0lvyURmefOyyRtIt9laHAwzc5z+IPK9UMW9e6o=;
  b=tCg+cYJXNZCdkWh24/R8PAj2GZqZF322dJG4mTxG3f1iyklQ1WAiCDmH
   zLqQKV93JBr1a9ipice3LmsRaoPx7mId9BYQxTAE2OrKsgciCC9XsNy79
   25ck9118u780SvNw0MvAuQgYVw3RMXkkpxO1HrMFb0q+gaZ4MMUte6qi1
   CVwusqd6PQkUpvlkGH66xVYqW8er/S2v7AkpHTDP18E3vQW53LRx5yzDI
   arrGww/Ud5LEaI7AIVJtfeIiND2Ov8eJo9eAM9d/2plxhanmjvT7zTcIz
   XLB1p/bX9yRJpGGiVHkflxKWHclHNc5k7MpLISKbu6kyA4nrL2T0/hnqv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="136449831"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="136449831"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 14:49:04 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B01101A3916
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:49:02 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id F3E68D5628
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:49:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 815B26BEDE
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:49:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 240D11A006A;
	Thu,  1 Feb 2024 13:49:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] repo: upgrade 2.40 -> 2.41
Date: Thu,  1 Feb 2024 13:48:28 +0800
Message-Id: <1706766508-13074-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10-2.776400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yfx0ykrbAxjCRzUPAqhCjtiO7PyvQAVVyiFL
	Sh+QCTPZIvrftAIhWmLy9zcRSkKatYgrKnsJ1GRgOwpfLMeBwRuC7C2rJeUToWFHVj+6F+rIKsm
	10TThDCJbJcQH3furV3k48PxckV+kHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w4nyU
	qzzMfX6fPjq2y80PskYzuzalB6NS34ylg7b0ZZVUDEH8n8F6zcURadREp811tPDNPACMpjjd0+m
	xgu33vDDL/+tIXnB1qCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 05:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194575

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.40.bb => repo_2.41.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.40.bb => repo_2.41.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.40.bb b/meta/recipes-devtools/repo/repo_2.41.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.40.bb
rename to meta/recipes-devtools/repo/repo_2.41.bb
index e749ee1b76..4d614d9c5f 100644
--- a/meta/recipes-devtools/repo/repo_2.40.bb
+++ b/meta/recipes-devtools/repo/repo_2.41.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "4c80921d22c20a28d531c9e3e8a0ce4433c6509d"
+SRCREV = "4217a82bec7b95c1a0bc7b081a1764a6a6d6c59b"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.34.1


