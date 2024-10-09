Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26362CED254
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:47 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.9173.1728452976699233839
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=feDk2Mis;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452981; x=1759988981;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0lVGdFDT80L4SeJY/IjisQnTvKw8BMo1K7RXA/Eo94M=;
  b=feDk2Misg2mB5FCJkfgxDOvmnrRyDWSYIIbFHWtWziZOVwcNSqKYOftb
   mhyFSTi7JQEpDMa3IV2+UidcmppoDzVeoKAc2srf2/JsEGD3pRkLOePHW
   XgxqVm1NVolJBE5Tn+5PUQqOOcN+F3WjVPatZCQmd6qEHvfthIZWJcu1p
   ofteoiQrXq2oSnXb6QoQPetMAfLLLtp4PLC3d5J+P7GFuFiOnUxheEWd1
   NM2Av7LCtv2QeCXfByOwD/Hpc7YptRt6w4s53eMMTKa9IzYPNIgEFURv7
   V8tcJwqDpOIx5pMeP2luLJtQ+kv12cdfCHTMJTYmxMivrt7AJjDQ5FJDx
   w==;
X-CSE-ConnectionGUID: sy1yT5mnRj6QSLEr/AfmmA==
X-CSE-MsgGUID: UZtOc2lVR+OixsKRgoP3SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="163622123"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="163622123"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:40 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1076CC9442
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C71ECF7FE
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CBD4B20081319
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 73C0F1A000A;
	Wed,  9 Oct 2024 13:49:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/26] python3-hypothesis: upgrade 6.112.1 -> 6.112.4
Date: Wed,  9 Oct 2024 13:49:04 +0800
Message-Id: <1728452955-25051-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10--2.644800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTJDl9FKHbrkPdZmyx8xAazlw
	dnKldJgikthGj3MnovTqTMVunjJJ58fdkIlEiI2kOf/Bx1+MuMLVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnx4LalWvXBvkfRhdidsajMURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO19R4
	Ss0oUmJ2B2zl5Qws5bq+aBJZ6D33I+kbvpfqRbKB7q1kaB2ARYvO5ZSLg2t4YyPFTC0mOapP2Ul
	bDqxDHrdPCwO0r1CyNIzi8C5ORUQfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205325

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- tweak the paths in @example(...) patches, so that both git apply and patch will work by default.
- refactor internals of hypothesis.stateful.Bundle to have a more consistent representation internally.
- fixe an internal error when the __context__ attribute of a raised exception leads to a cycle

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-hypothesis_6.112.1.bb => python3-hypothesis_6.112.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.112.1.bb => python3-hypothesis_6.112.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.112.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.112.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.112.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.112.4.bb
index e4b7b53579..1010348e38 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.112.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.112.4.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "b070d7a1bb9bd84706c31885c9aeddc138e2b36a9c112a91984f49501c567856"
+SRC_URI[sha256sum] = "8fe64e4a6d0862e209e3c36b42037aee9665cb839d619d9281be45345ab7d856"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


