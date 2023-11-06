Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9A3C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 02:38:26 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.46411.1699238297457365825
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Nov 2023 18:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="118037575"
X-IronPort-AV: E=Sophos;i="6.03,280,1694703600"; 
   d="scan'208";a="118037575"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 11:38:09 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 364C0D6188
	for <openembedded-core@lists.openembedded.org>; Mon,  6 Nov 2023 11:38:06 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6FD72D9684
	for <openembedded-core@lists.openembedded.org>; Mon,  6 Nov 2023 11:38:05 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E00C2FC6CFD;
	Mon,  6 Nov 2023 11:38:04 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] python3-cryptography(-vectors): upgrade 41.0.4 -> 41.0.5
Date: Mon,  6 Nov 2023 10:37:35 +0800
Message-Id: <1699238255-22657-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27980.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27980.004
X-TMASE-Result: 10--2.536800-10.000000
X-TMASE-MatchedRID: LFhZ4D3Qpaydsbtv2+OMzH1zro62qhdCpxAd6mi1Ga1mVECMV6nHa1Qj
	ex2nn0pf20+HR51dnEEAzLwZoZKu8tz4cH5hW96YP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW4Em8Adulyv5TMuZ8ZjqIORKj6duBA8c4QSEYfcJF0pRTshAysjZ8/vSMg2Oe/b8EwCAS
	ysVpSrKQwjZ2/Aq7zaq5UJ2wehuDf+Xe8sRLrv3m9OepgphdNGVeAZ5VSHdZ2bKItl61J/yZ+in
	TK0bC9eKrauXd3MZDXdPm6Zo4+L6jUXOdtYpkf/dgfDyBW8Rv0iq6pvkRV5dMJ+54dB7cNgP4TN
	M8W4FqrYZfWKHIkb4UGXzq8rk0BPP80AUPS/gY5jgo81taOvxFPJnXL2yNYdkuo847l05tDEzMy
	Amsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 02:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190192

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 3.1.4.
Added a function to support an upcoming pyOpenSSL release.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...vectors_41.0.4.bb => python3-cryptography-vectors_41.0.5.bb} | 2 +-
 ...n3-cryptography_41.0.4.bb => python3-cryptography_41.0.5.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_41.0.4.bb => python3-cryptography-vectors_41.0.5.bb} (91%)
 rename meta/recipes-devtools/python/{python3-cryptography_41.0.4.bb => python3-cryptography_41.0.5.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb
index 6b5d8adee9..44c67fdd76 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "440af2813ea7aeb52181ec651a36d9ae8f0976e8b3a62b411a800fe6fa57a19e"
+SRC_URI[sha256sum] = "75e82aea2982729312af735adb2983f347bb21fff88ad5dda3673ed70e1d1caf"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb b/meta/recipes-devtools/python/python3-cryptography_41.0.5.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-cryptography_41.0.4.bb
rename to meta/recipes-devtools/python/python3-cryptography_41.0.5.bb
index 94977789c8..17b08f05cd 100644
--- a/meta/recipes-devtools/python/python3-cryptography_41.0.4.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_41.0.5.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "7febc3094125fc126a7f6fb1f420d0da639f3f32cb15c8ff0dc3997c4549f51a"
+SRC_URI[sha256sum] = "392cb88b597247177172e02da6b7a63deeff1937fa6fec3bbf902ebd75d97ec7"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://0001-Fix-include-directory-when-cross-compiling-9129.patch \
-- 
2.34.1


