Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9530ECD11BF
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:37:33 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.7932.1711413449271762083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QVCjKFYw;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413450; x=1742949450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/QpiB6xmmOO8lZmcJdO1g4yluZ141/seXkoBh1njuI8=;
  b=QVCjKFYw24952OircMeyrV4Yhv38NnggXKCLGa5RrvT5MJfGIJd6Bl0o
   ebx4mBr7fZWU30QwXQbwi8+gFWp+8LoXUZd/9pk+fW+tmWQWzOrf+o5NY
   YGvNgmduQ//9qfxFvTHcAn0fHrHZk5t5d2a6xfOT0N1/b2kc3ayK3Ntrw
   LoD24P+aCgRntqi3CndBnIcairqV13By+2tmzEHN3cOPiSjIF4OgawkPT
   NLwJX9Xeo4qap1ECliPy6odV2PfEGD35NpIWRYq47iFEHByBW70FptVHJ
   xOXPW4oDtme2p3RfHWbd1+CLQvjqIuiKpdQ6dpRFij+7naZytdEpWwa4D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="153359841"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="153359841"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:37:27 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1FB1BD4808
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:25 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 19B81BF4B7
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A97876B4C5
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:37:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 579481A006A;
	Tue, 26 Mar 2024 08:37:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 11/34] libcomps: upgrade 0.1.20 -> 0.1.21
Date: Tue, 26 Mar 2024 08:34:29 +0800
Message-Id: <1711413292-3025-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--4.234000-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrIF9l7eKb2JF4YeSlHZYFoqB8
	tGwEqygaWmMnPB+kSbKzhKUDWj9B6m94Ipa1otxoP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6wYUB/Gxrq/A+Ic2U8xeYHOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqt/ReHO0HBE0BY5tWiR9QUrNGCTb54A6ZtWxvgPG2/JJJNkNdeeP+eKROJV
	wqiQ6S8D1tWCisl0iyWw263VL9DpfnN4BVCo27jHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197501

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Build aarch64 python packages during releases
-Fix build: use correct variable for category and env
-build: Restore compatiblity with libxml2-2.12.0
-tests: Unify formatting of current test announcements
-tests: Don't print parsing errors during tests
-Update CI

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcomps/{libcomps_0.1.20.bb => libcomps_0.1.21.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libcomps/{libcomps_0.1.20.bb => libcomps_0.1.21.bb} (94%)

diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb
similarity index 94%
rename from meta/recipes-devtools/libcomps/libcomps_0.1.20.bb
rename to meta/recipes-devtools/libcomps/libcomps_0.1.21.bb
index 1f59c5ea1e..91170dfbed 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.21.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master;p
            file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "854fbb9fe733b774981e1ffcf825b2d2ce0f8072"
+SRCREV = "2e973ce22698dd64f472180e3a689755268fb06b"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


