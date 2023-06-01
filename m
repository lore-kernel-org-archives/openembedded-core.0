Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BF9C7EE32
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:18 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.26615.1685610245593289228
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="119146833"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="119146833"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:04:10 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id BAD35D3EAC
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:06 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 03C48CF7F2
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:06 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 45FD988857;
	Thu,  1 Jun 2023 18:04:05 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pycryptodomex: upgrade 3.17 -> 3.18.0
Date: Thu,  1 Jun 2023 17:03:33 +0800
Message-Id: <1685610221-29015-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10-2.218000-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrKQNhMboqZlox9I+EPr/hD4+w
	qgvZUWqofdCuuzQ7DBgQtWQZJqxoDCJcv5X7ObmJL7p//vLv4bPYUDvAr2Y/19MIXgOsLuq/owu
	jpd11c5hcTFAN0zkeIgXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZOhR0VsdhRrCXlb
	ToGzqA3LF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyvjAmXmPDS9J+g4fF1YsgDnC7w
	yzf11TWf/ruPAjVkUPoej6l4HHradZYYgWoaYqGpXJl6dcXzf2JBL5mY4oeppuOJvz+dBbi/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182081

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
New features
---------------
* Added support for DER BOOLEAN encodings.
* The library now compiles on Windows ARM64.

Resolved issues
---------------
* GH#722: "nonce" attribute was not correctly set for XChaCha20_Poly1305 ciphers.
* GH#728: Workaround for a possible x86 emulator bug in Windows for ARM64.
* GH#739: OID encoding for arc 2 didn't accept children larger than 39.
* Correctly check that the scalar matches the point when importing an ECC private key.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pycryptodomex_3.17.bb => python3-pycryptodomex_3.18.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.17.bb => python3-pycryptodomex_3.18.0.bb} (69%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.17.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.18.0.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.17.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.18.0.bb
index 720aec2d36..cbbc17adba 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.17.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.18.0.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "0af93aad8d62e810247beedef0261c148790c52f3cd33643791cc6396dd217c1"
+SRC_URI[sha256sum] = "3e3ecb5fe979e7c1bb0027e518340acf7ee60415d79295e5251d13c68dde576e"
 
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.34.1


