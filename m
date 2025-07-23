Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD95FC83F34
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 01:07:12 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.3851.1753232822361844292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 18:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Kdm48qsu;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753232822; x=1784768822;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qav6i1XoHB81o9BoDxnCi51+trwhTyELR+5aXt1wzOc=;
  b=Kdm48qsueSLRf/OGNv+6s3HUku9TeufCUVgTdj/zQgaTc4R96Mp7S+/6
   DV5GtqWYwmYaBBYaKFx5R+C/jggJ6qaDmBBdoh0LuBcSNOTk4GP9iMfDJ
   QZi7NzHNq78BIjCcUmEOlFzgff3y4/wmp3EALdKyO7A1nj397J5C/EQAB
   n+DtfeKgwOaTByMx6pbZAOj0e17WF2UZh7MtsE0LQw1fETPwzKA/KE4/A
   GoRMsUdPG/RMPfxK8g+VhlPwu/EqA4g8lszl9DqwfDw5qlt0pEZv5YiOb
   wKewd/0QaOQKAmwEMLRDf/Uromu1VreaDxAGj6hrAyarf2Wb+2w7hwBNE
   g==;
X-CSE-ConnectionGUID: TwNTJKcsTOGV8ikZSiU3Ug==
X-CSE-MsgGUID: S3dLvNZzSOy00CTps9zfzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="207036564"
X-IronPort-AV: E=Sophos;i="6.16,333,1744038000"; 
   d="scan'208";a="207036564"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 10:07:01 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id C5F2A100034A
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:07:00 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 2AE8FC00D50
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:07:00 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3B4481A0073;
	Wed, 23 Jul 2025 09:06:57 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 09/12] python3-rpds-py: upgrade 0.25.1 -> 0.26.0
Date: Wed, 23 Jul 2025 09:06:11 +0800
Message-ID: <20250723010614.926-9-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
References: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:07:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220768

ptest ok:
============================================================================
 Testsuite summary
 # TOTAL: 116
 # PASS: 116
 # SKIP: 0
 # XFAIL: 0
 # FAIL: 0
 # XPASS: 0
 # ERROR: 0
 DURATION: 14
 END: /usr/lib/python3-rpds-py/ptest
 2025-07-22T09:57
 STOP: ptest-runner
 TOTAL: 1 FAIL: 0

Changelog:
===========
- Build CPython 3.14 wheels
- Require maturin>=1.9.0 to ensure support for PEP 639

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../python/python3-rpds-py-crates.inc         | 28 +++++++++----------
 ...py_0.25.1.bb => python3-rpds-py_0.26.0.bb} |  2 +-
 2 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.25.1.bb => python3-rpds-py_0.26.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
index 0a6fbb1bd6..a0b669df2d 100644
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -4,7 +4,7 @@
 SRC_URI += " \
     crate://crates.io/archery/1.2.1 \
     crate://crates.io/autocfg/1.4.0 \
-    crate://crates.io/cc/1.2.22 \
+    crate://crates.io/cc/1.2.25 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/indoc/2.0.6 \
     crate://crates.io/libc/0.2.172 \
@@ -12,12 +12,12 @@ SRC_URI += " \
     crate://crates.io/once_cell/1.21.3 \
     crate://crates.io/portable-atomic/1.11.0 \
     crate://crates.io/proc-macro2/1.0.95 \
-    crate://crates.io/pyo3/0.25.0 \
-    crate://crates.io/pyo3-build-config/0.25.0 \
-    crate://crates.io/pyo3-ffi/0.25.0 \
-    crate://crates.io/pyo3-macros/0.25.0 \
-    crate://crates.io/pyo3-macros-backend/0.25.0 \
-    crate://crates.io/python3-dll-a/0.2.13 \
+    crate://crates.io/pyo3/0.25.1 \
+    crate://crates.io/pyo3-build-config/0.25.1 \
+    crate://crates.io/pyo3-ffi/0.25.1 \
+    crate://crates.io/pyo3-macros/0.25.1 \
+    crate://crates.io/pyo3-macros-backend/0.25.1 \
+    crate://crates.io/python3-dll-a/0.2.14 \
     crate://crates.io/quote/1.0.40 \
     crate://crates.io/rpds/1.1.1 \
     crate://crates.io/shlex/1.3.0 \
@@ -30,7 +30,7 @@ SRC_URI += " \
 
 SRC_URI[archery-1.2.1.sha256sum] = "eae2ed21cd55021f05707a807a5fc85695dafb98832921f6cfa06db67ca5b869"
 SRC_URI[autocfg-1.4.0.sha256sum] = "ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26"
-SRC_URI[cc-1.2.22.sha256sum] = "32db95edf998450acc7881c932f94cd9b05c87b4b2599e8bab064753da4acfd1"
+SRC_URI[cc-1.2.25.sha256sum] = "d0fc897dc1e865cc67c0e05a836d9d3f1df3cbe442aa4a9473b18e12624a4951"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[indoc-2.0.6.sha256sum] = "f4c7245a08504955605670dbf141fceab975f15ca21570696aebe9d2e71576bd"
 SRC_URI[libc-0.2.172.sha256sum] = "d750af042f7ef4f724306de029d18836c26c1765a54a6a3f094cbd23a7267ffa"
@@ -38,12 +38,12 @@ SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce444
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
 SRC_URI[portable-atomic-1.11.0.sha256sum] = "350e9b48cbc6b0e028b0473b114454c6316e57336ee184ceab6e53f72c178b3e"
 SRC_URI[proc-macro2-1.0.95.sha256sum] = "02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778"
-SRC_URI[pyo3-0.25.0.sha256sum] = "f239d656363bcee73afef85277f1b281e8ac6212a1d42aa90e55b90ed43c47a4"
-SRC_URI[pyo3-build-config-0.25.0.sha256sum] = "755ea671a1c34044fa165247aaf6f419ca39caa6003aee791a0df2713d8f1b6d"
-SRC_URI[pyo3-ffi-0.25.0.sha256sum] = "fc95a2e67091e44791d4ea300ff744be5293f394f1bafd9f78c080814d35956e"
-SRC_URI[pyo3-macros-0.25.0.sha256sum] = "a179641d1b93920829a62f15e87c0ed791b6c8db2271ba0fd7c2686090510214"
-SRC_URI[pyo3-macros-backend-0.25.0.sha256sum] = "9dff85ebcaab8c441b0e3f7ae40a6963ecea8a9f5e74f647e33fcf5ec9a1e89e"
-SRC_URI[python3-dll-a-0.2.13.sha256sum] = "49fe4227a288cf9493942ad0220ea3f185f4d1f2a14f197f7344d6d02f4ed4ed"
+SRC_URI[pyo3-0.25.1.sha256sum] = "8970a78afe0628a3e3430376fc5fd76b6b45c4d43360ffd6cdd40bdde72b682a"
+SRC_URI[pyo3-build-config-0.25.1.sha256sum] = "458eb0c55e7ece017adeba38f2248ff3ac615e53660d7c71a238d7d2a01c7598"
+SRC_URI[pyo3-ffi-0.25.1.sha256sum] = "7114fe5457c61b276ab77c5055f206295b812608083644a5c5b2640c3102565c"
+SRC_URI[pyo3-macros-0.25.1.sha256sum] = "a8725c0a622b374d6cb051d11a0983786448f7785336139c3c94f5aa6bef7e50"
+SRC_URI[pyo3-macros-backend-0.25.1.sha256sum] = "4109984c22491085343c05b0dbc54ddc405c3cf7b4374fc533f5c3313a572ccc"
+SRC_URI[python3-dll-a-0.2.14.sha256sum] = "d381ef313ae70b4da5f95f8a4de773c6aa5cd28f73adec4b4a31df70b66780d8"
 SRC_URI[quote-1.0.40.sha256sum] = "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
 SRC_URI[rpds-1.1.1.sha256sum] = "a7f89f654d51fffdd6026289d07d1fd523244d46ae0a8bc22caa6dd7f9e8cb0b"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.25.1.bb b/meta/recipes-devtools/python/python3-rpds-py_0.26.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-rpds-py_0.25.1.bb
rename to meta/recipes-devtools/python/python3-rpds-py_0.26.0.bb
index efc1d4c01c..3fd7701f8d 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.25.1.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.26.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/rpds-py/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
-SRC_URI[sha256sum] = "8960b6dac09b62dac26e75d7e2c4a22efb835d827a7278c34f72b2b84fa160e3"
+SRC_URI[sha256sum] = "20dae58a859b0906f0685642e591056f1e787f3a8b39c8e8749a45dc7d26bdb0"
 
 require ${BPN}-crates.inc
 
-- 
2.43.0


