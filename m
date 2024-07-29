Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC0EC3DA70
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:31 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.46588.1722215424359450708
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aNJhNxtQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215430; x=1753751430;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=I2LhDHKApt3E8jAhhSLJJexcnc+4cvGn85JywJvyBTc=;
  b=aNJhNxtQgsogFd1r231ZIRhmXaYbGHW2ClYWEfhcdxNdo9SReBAHbgK1
   kjLZy8tZ23PoB4Rhb2RTAMdHMl3enTq4cJUl1oWElpSHjJXzaEUzXYoCV
   g/xRYyp9hxaMM+uzaEWVaOYC0ewAANHTkC3d2VA3GLS15WAPRwUc4LPSp
   qC9lRztF7hrrbev8l90D4aEmlnzsd9FCDjTcWQ5vwq6EdyaiQGGJ8rGoA
   +extsy6ZwniTuF+gciNTAVQ81tD8iBYLVjhy5bg6rpxsDRhbF8rqAWzAo
   smAufcSDqaayuG7RS9IK0jV2EBqDu/zP70RujiVyVzwMwfDaPhiX0cVEq
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="147911727"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="147911727"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:28 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B520D8016
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6356ED5C20
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0500EE51AE
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CB00B1A000C;
	Mon, 29 Jul 2024 09:10:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/33] python3-setuptools: upgrade 70.3.0 -> 71.1.0
Date: Mon, 29 Jul 2024 09:09:54 +0800
Message-Id: <1722215408-27541-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.003
X-TMASE-Result: 10--1.248600-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrc6veiGt9+9Nk55TPiguhpeWh
	NKYuM7eNovKsDZ9LurR9+b2UAY3sBlK8HW5BYYruOIQ9GP2P2u8xVUWGXs3C8zAGSr0nagb3vqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgCUnLzk1+Ixz8aY1C5IEb4WjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq2rxYF9o8a/vCD//aT6Se8TpoxO8kuLtY1k8bUNRztAIacse
	+tYImwJm8KqBjESdXsGKcUaref6GAOrPmr1lTJH2hoO5ERRuysdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202591

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Added return types to typed public functions
- Marked Package Discovery and Resource Access using pkg_resources as py.typed
- Removed lingering unused code around Distribution._patched_dist.
- Reset the backports module when enabling vendored packages.
- Include all vendored files in the sdist.
- Restored package data that went missing in 71.0. This change also incidentally
  causes tests to be installed once again.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-setuptools_70.3.0.bb => python3-setuptools_71.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_70.3.0.bb => python3-setuptools_71.1.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb b/meta/recipes-devtools/python/python3-setuptools_71.1.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_70.3.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_71.1.0.bb
index 72a8d7bc3c..9503c36bb6 100644
--- a/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_71.1.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "f171bab1dfbc86b132997f26a119f6056a57950d058587841a0082e8830f9dc5"
+SRC_URI[sha256sum] = "032d42ee9fb536e33087fb66cac5f840eb9391ed05637b3f2a76a7c8fb477936"
 
 DEPENDS += "python3"
 
-- 
2.34.1


