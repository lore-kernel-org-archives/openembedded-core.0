Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD58C4167B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:41:23 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.39103.1698997276102518365
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="117876379"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="117876379"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:41:14 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 379E8D4F5A
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:41:11 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8C430F87E
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:41:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 925362FC845D;
	Fri,  3 Nov 2023 16:41:09 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pyopenssl: upgrade 23.2.0 -> 23.3.0
Date: Fri,  3 Nov 2023 15:40:05 +0800
Message-Id: <1698997205-31043-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27974.005
X-TMASE-Result: 10--7.763200-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mr6qG5M9QNAO19avChsELqKFOn
	pjPgCq4ysLlKK6gtMyqVq6RC/pZuyg/ijdWq03SWG8wrEcD1580BZBplMxI/zmbBKQay3S1dcxZ
	+avxQRTyojj6sGnsr6abUwv9wWaT9T46WBWMXju+jC9ni38xhbgO3/A5KGHP/lPH7Ysio2a3TI4
	8G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDbnHu4BcYSmtAUDqlLFoMeYCGfvnVpx+256ba
	/D5x6cp4vM1YF6AJbb2xnRRfQRo4gtuKBGekqUpI/NGWt0UYPDeIPDqwSs90Wufr2ZFaHzmPWW4
	8t2XjgxcYpCLnQuFnMOGPq33mlSu
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190131

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Dropped support for Python 3.6.
-The minimum cryptography version is now 41.0.5.
-Removed OpenSSL.crypto.loads_pkcs7 and OpenSSL.crypto.loads_pkcs12 which had
 been deprecated for 3 years.
-Added OpenSSL.SSL.OP_LEGACY_SERVER_CONNECT to allow legacy insecure
 renegotiation between OpenSSL and unpatched servers. #1234.
-Changed OpenSSL.crypto.X509Store.add_crl to also accept cryptography's
 x509.CertificateRevocationList arguments in addition to the now deprecated
 OpenSSL.crypto.CRL arguments.
-Fixed test_set_default_verify_paths test so that it is skipped if no network
 connection is available.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pyopenssl_23.2.0.bb => python3-pyopenssl_23.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_23.2.0.bb => python3-pyopenssl_23.3.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb
index 86ae406ffb..cdcae48d60 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_23.2.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl ${PYTHON_PN}-cryptography"
 
-SRC_URI[sha256sum] = "276f931f55a452e7dea69c7173e984eb2a4407ce413c918aa34b55f82f9b8bac"
+SRC_URI[sha256sum] = "6b2cba5cc46e822750ec3e5a81ee12819850b11303630d575e98108a079c2b12"
 
 PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools3
-- 
2.34.1


