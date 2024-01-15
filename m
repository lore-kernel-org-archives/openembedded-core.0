Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CC7C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:24:45 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.74469.1705310678558844527
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:24:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="125561264"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="125561264"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:24:37 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 70720D9D8F
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:24:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 75F57BF3C5
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:24:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 042B06895D
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:24:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9DBFF1A0070;
	Mon, 15 Jan 2024 17:24:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pycryptodome: upgrade 3.19.1 -> 3.20.0
Date: Mon, 15 Jan 2024 17:24:11 +0800
Message-Id: <1705310651-24655-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10-2.455100-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrTEFC0zV7bKQGgRu8CzxXGQzK
	NF0GZctobOvU8D4ykQdrnCn6xJEf5EihLTCKfRwRM6A0eGVTtgyp/958oU3WcIwnGKAoIKJLqsw
	ZNzn0DJCc2h8L4WInNGrEgED4SQwb7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5AE59
	pk4kcc5bF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlygeYb8nGU0yJ0w4imPcQ168OFj
	PnnD+f1t383uEehnl8avNKUL7hlhlB+p4Dza7fC6JU45bPLfXV3mvA/P7YXFd90XgC6baBh/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193659

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Added support for TurboSHAKE128 and TurboSHAKE256.
-Added method Crypto.Hash.new() to generate a hash object given a hash name.
-Added support for AES-GCM encryption of PBES2 and PKCS#8 containers.
-Added support for SHA-2 and SHA-3 algorithms in PBKDF2 when creating PBES2
 and PKCS#8 containers.
-Export of RSA keys accepts the prot_params dictionary as parameter to control
 the number of iterations for PBKDF2 and scrypt.
-C unit tests also run on non-x86 architectures.
-GH#787: Fixed autodetect logic for GCC 14 in combination with LTO.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pycryptodome_3.19.1.bb => python3-pycryptodome_3.20.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycryptodome_3.19.1.bb => python3-pycryptodome_3.20.0.bb} (38%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.19.1.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
similarity index 38%
rename from meta/recipes-devtools/python/python3-pycryptodome_3.19.1.bb
rename to meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
index 70f16c7f6d..d24fa58d43 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.19.1.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
@@ -1,5 +1,5 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "8ae0dd1bcfada451c35f9e29a3e5db385caabc190f98e4a80ad02a61098fb776"
+SRC_URI[sha256sum] = "09609209ed7de61c2b560cc5c8c4fbf892f8b15b1faf7e4cbffac97db1fffda7"
 
-- 
2.34.1


