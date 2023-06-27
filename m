Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84DC0C001DD
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:45 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.7579.1687850375226719701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="122336906"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="122336906"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:33 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C7E62D29F4
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:30 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EB3E9BF4B1
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:29 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BCAF40B47;
	Tue, 27 Jun 2023 16:19:29 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-typing-extensions: upgrade 4.6.2 -> 4.6.3
Date: Tue, 27 Jun 2023 15:17:15 +0800
Message-Id: <1687850250-20040-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10--2.319100-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/ySNHByyOpYYCpxAd6mi1Ga14YeSlHZYFoiTx
	ic9Q9nnr4PKuGN+8yk1qxIBA+EkMG+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKINUccATRyd1Hp5g9gYJWDLeBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1R0bQh4y98h8a5wOKGnRPoXb4v5OQkeJJuVMlIBbS/lAubdb7Q2cokcDvd
	wWaRHo1QyB9NZIsbquUw12U/6HF08I1V8sqRutsBDlYzH+FaIxTyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183460

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:Sync LICENSE with CPython

Changelog:
==========
- Fix a regression introduced in v4.6.0 in the implementation of runtime-checkable protocols.
- Sync the repository's LICENSE file with that of CPython. typing_extensions
  is distributed under the same license as CPython itself.
- Skip a problematic test on Python 3.12.0b1. The test fails on 3.12.0b1 due
  to a bug in CPython, which will be fixed in 3.12.0b2. The typing_extensions
  test suite now passes on 3.12.0b1.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...extensions_4.6.2.bb => python3-typing-extensions_4.6.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.6.2.bb => python3-typing-extensions_4.6.3.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.6.2.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.6.3.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.6.2.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.6.3.bb
index be43fe4a64..ebce6e8d4e 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.6.2.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.6.3.bb
@@ -10,12 +10,12 @@ HOMEPAGE = "https://github.com/python/typing_extensions"
 BUGTRACKER = "https://github.com/python/typing_extensions/issues"
 SECTIONS = "libs"
 LICENSE = "PSF-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f16b323917992e0f8a6f0071bc9913e2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[sha256sum] = "06006244c70ac8ee83fa8282cb188f697b8db25bc8b4df07be1873c43897060c"
+SRC_URI[sha256sum] = "d91d5919357fe7f681a9f2b5b4cb2a5f1ef0a1e9f59c4d8ff0d3491e05c0ffd5"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


