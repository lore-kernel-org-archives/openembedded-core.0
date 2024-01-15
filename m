Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11AFFC47258
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:25:45 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.74000.1705310738839916766
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="134549021"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="134549021"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:25:37 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5DF8ED63DB
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:25:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 95923D5E93
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:25:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1FAE86895D
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:25:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B1C9D1A0070;
	Mon, 15 Jan 2024 17:25:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pycryptodomex: upgrade 3.19.1 -> 3.20.0
Date: Mon, 15 Jan 2024 17:24:57 +0800
Message-Id: <1705310697-24692-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10-3.326100-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrTEFC0zV7bKQGgRu8CzxXGQzK
	NF0GZctobOvU8D4ykQdrnCn6xJEf5EihLTCKfRwRM6A0eGVTtgyp/958oU3WcIwnGKAoIKJLqsw
	ZNzn0DJCc2h8L4WInNGrEgED4SQwb7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5BEGD
	rWRIrgOK73ETS8mlfneTjw/FyRX6QfE8yM4pjsDwtuKBGekqUpnH7sbImOEBSVw+8UAh//3DrWy
	BxsOizSWXeDCIL+3n5FqIKV6Z8TggsnhofW8elsD2WYvgOZgopLH9TKjU3DSHjA4l2jMQ0lb1Ay
	cwBMB8vsfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193660

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
 ...-pycryptodomex_3.19.1.bb => python3-pycryptodomex_3.20.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.19.1.bb => python3-pycryptodomex_3.20.0.bb} (69%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.19.1.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.19.1.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb
index d6e5c6d3ee..2673ea8326 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.19.1.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "0b7154aff2272962355f8941fd514104a88cb29db2d8f43a29af900d6398eb1c"
+SRC_URI[sha256sum] = "7a710b79baddd65b806402e14766c721aee8fb83381769c27920f26476276c1e"
 
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.34.1


