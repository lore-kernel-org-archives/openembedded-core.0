Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCB9C49EA1
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.46938.1722215429447118537
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rRhVxpNt;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215430; x=1753751430;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6yzoWC5XJ4/qE87tBbeNDC583DwopkU42CcnO7Rqh7w=;
  b=rRhVxpNtQs9TFYmLDZ+l9S0xAvIMErC5M9jfdXHTZfzY2rnz3QPL77D5
   KRQmsf8+GZ73UCJ+fqAtgMhKDCpcJQbaKYpGWkr52NtfVnZpBc7rh+Ifq
   s+wiFOJQJ8nbzKLD5BKIfDpsGE+xPNUc/RqlDHRZYk9USIHKS7tvr1c2K
   APCnixZrR1RfrhPl9hmubTQ45GffpPxqg4i2amBG/nt0KtVCqa8hLCO7q
   9MA7RF1FAO+lufXhFBT+1dDMSnyAOWww/5JIS5O+ymAZeS8QHS4DCBavB
   AvuZ6UTPrH3ABPoqyhRANoS2q7/PDNe6M41Ye62IlANKuwzFX26IWXmAy
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="168101677"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="168101677"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:27 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C9F4CA1F2
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:24 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C95E7BF3D7
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5948A20071A1D
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EE4801A000C;
	Mon, 29 Jul 2024 09:10:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/33] python3-bcrypt: upgrade 4.1.3 -> 4.2.0
Date: Mon, 29 Jul 2024 09:09:47 +0800
Message-Id: <1722215408-27541-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.004
X-TMASE-Result: 10--3.236600-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yQPZZctd3P4BEITY2UGMiNwH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJoibT7XR2+QFQ+GYt8f/VhTtMQULTNXtspORWL+8cTh3ANUI
	c8ma/DM/S0+DEiI6pcEjBgsju+zn2DCED/Oc5L9ugcOgSnZOzMfioIsi7Sa0gxrLmMm+vGow3oX
	IAPL3FR+LzNWBegCW2wgn7iDBesS0nRE+fI6etkghxwEhZJCpwRyM0fsIltwb+b+T4umL+cxpZI
	2wid8IL4JZdmFc1F0igGNm+hjEGjYeGIQorzN4IeTPSUSRXT0+2xfVRwNhLAku/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202589

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-bcrypt-crates.inc          | 88 ++++++-------------
 ...crypt_4.1.3.bb => python3-bcrypt_4.2.0.bb} |  2 +-
 2 files changed, 29 insertions(+), 61 deletions(-)
 rename meta/recipes-devtools/python/{python3-bcrypt_4.1.3.bb => python3-bcrypt_4.2.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-bcrypt-crates.inc b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
index 7d9e1f3b59..ca125c8026 100644
--- a/meta/recipes-devtools/python/python3-bcrypt-crates.inc
+++ b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
@@ -6,7 +6,6 @@ SRC_URI += " \
     crate://crates.io/base64/0.22.1 \
     crate://crates.io/bcrypt/0.15.1 \
     crate://crates.io/bcrypt-pbkdf/0.10.0 \
-    crate://crates.io/bitflags/2.5.0 \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/blowfish/0.9.1 \
     crate://crates.io/byteorder/1.5.0 \
@@ -16,54 +15,38 @@ SRC_URI += " \
     crate://crates.io/crypto-common/0.1.6 \
     crate://crates.io/digest/0.10.7 \
     crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/getrandom/0.2.14 \
-    crate://crates.io/heck/0.4.1 \
+    crate://crates.io/getrandom/0.2.15 \
+    crate://crates.io/heck/0.5.0 \
     crate://crates.io/indoc/2.0.5 \
     crate://crates.io/inout/0.1.3 \
-    crate://crates.io/libc/0.2.154 \
-    crate://crates.io/lock_api/0.4.12 \
+    crate://crates.io/libc/0.2.155 \
     crate://crates.io/memoffset/0.9.1 \
     crate://crates.io/once_cell/1.19.0 \
-    crate://crates.io/parking_lot/0.12.2 \
-    crate://crates.io/parking_lot_core/0.9.10 \
     crate://crates.io/pbkdf2/0.12.2 \
-    crate://crates.io/portable-atomic/1.6.0 \
-    crate://crates.io/proc-macro2/1.0.81 \
-    crate://crates.io/pyo3/0.21.2 \
-    crate://crates.io/pyo3-build-config/0.21.2 \
-    crate://crates.io/pyo3-ffi/0.21.2 \
-    crate://crates.io/pyo3-macros/0.21.2 \
-    crate://crates.io/pyo3-macros-backend/0.21.2 \
+    crate://crates.io/portable-atomic/1.7.0 \
+    crate://crates.io/proc-macro2/1.0.86 \
+    crate://crates.io/pyo3/0.22.2 \
+    crate://crates.io/pyo3-build-config/0.22.2 \
+    crate://crates.io/pyo3-ffi/0.22.2 \
+    crate://crates.io/pyo3-macros/0.22.2 \
+    crate://crates.io/pyo3-macros-backend/0.22.2 \
     crate://crates.io/quote/1.0.36 \
-    crate://crates.io/redox_syscall/0.5.1 \
-    crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/sha2/0.10.8 \
-    crate://crates.io/smallvec/1.13.2 \
-    crate://crates.io/subtle/2.5.0 \
-    crate://crates.io/syn/2.0.60 \
-    crate://crates.io/target-lexicon/0.12.14 \
+    crate://crates.io/subtle/2.6.1 \
+    crate://crates.io/syn/2.0.72 \
+    crate://crates.io/target-lexicon/0.12.15 \
     crate://crates.io/typenum/1.17.0 \
     crate://crates.io/unicode-ident/1.0.12 \
     crate://crates.io/unindent/0.2.3 \
     crate://crates.io/version_check/0.9.4 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
-    crate://crates.io/windows-targets/0.52.5 \
-    crate://crates.io/windows_aarch64_gnullvm/0.52.5 \
-    crate://crates.io/windows_aarch64_msvc/0.52.5 \
-    crate://crates.io/windows_i686_gnu/0.52.5 \
-    crate://crates.io/windows_i686_gnullvm/0.52.5 \
-    crate://crates.io/windows_i686_msvc/0.52.5 \
-    crate://crates.io/windows_x86_64_gnu/0.52.5 \
-    crate://crates.io/windows_x86_64_gnullvm/0.52.5 \
-    crate://crates.io/windows_x86_64_msvc/0.52.5 \
-    crate://crates.io/zeroize/1.7.0 \
+    crate://crates.io/zeroize/1.8.1 \
 "
 
 SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
 SRC_URI[bcrypt-0.15.1.sha256sum] = "e65938ed058ef47d92cf8b346cc76ef48984572ade631927e9937b5ffc7662c7"
 SRC_URI[bcrypt-pbkdf-0.10.0.sha256sum] = "6aeac2e1fe888769f34f05ac343bbef98b14d1ffb292ab69d4608b3abc86f2a2"
-SRC_URI[bitflags-2.5.0.sha256sum] = "cf4b9d6a944f767f8e5e0db018570623c85f3d925ac718db4e06d0187adb21c1"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[blowfish-0.9.1.sha256sum] = "e412e2cd0f2b2d93e02543ceae7917b3c70331573df19ee046bcbc35e45e87d7"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
@@ -73,44 +56,29 @@ SRC_URI[cpufeatures-0.2.12.sha256sum] = "53fe5e26ff1b7aef8bca9c6080520cfb8d9333c
 SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[getrandom-0.2.14.sha256sum] = "94b22e06ecb0110981051723910cbf0b5f5e09a2062dd7663334ee79a9d1286c"
-SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
+SRC_URI[getrandom-0.2.15.sha256sum] = "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
+SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
 SRC_URI[inout-0.1.3.sha256sum] = "a0c10553d664a4d0bcff9f4215d0aac67a639cc68ef660840afe309b807bc9f5"
-SRC_URI[libc-0.2.154.sha256sum] = "ae743338b92ff9146ce83992f766a31066a91a8c84a45e0e9f21e7cf6de6d346"
-SRC_URI[lock_api-0.4.12.sha256sum] = "07af8b9cdd281b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17"
+SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
 SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
-SRC_URI[parking_lot-0.12.2.sha256sum] = "7e4af0ca4f6caed20e900d564c242b8e5d4903fdacf31d3daf527b66fe6f42fb"
-SRC_URI[parking_lot_core-0.9.10.sha256sum] = "1e401f977ab385c9e4e3ab30627d6f26d00e2c73eef317493c4ec6d468726cf8"
 SRC_URI[pbkdf2-0.12.2.sha256sum] = "f8ed6a7761f76e3b9f92dfb0a60a6a6477c61024b775147ff0973a02653abaf2"
-SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
-SRC_URI[proc-macro2-1.0.81.sha256sum] = "3d1597b0c024618f09a9c3b8655b7e430397a36d23fdafec26d6965e9eec3eba"
-SRC_URI[pyo3-0.21.2.sha256sum] = "a5e00b96a521718e08e03b1a622f01c8a8deb50719335de3f60b3b3950f069d8"
-SRC_URI[pyo3-build-config-0.21.2.sha256sum] = "7883df5835fafdad87c0d888b266c8ec0f4c9ca48a5bed6bbb592e8dedee1b50"
-SRC_URI[pyo3-ffi-0.21.2.sha256sum] = "01be5843dc60b916ab4dad1dca6d20b9b4e6ddc8e15f50c47fe6d85f1fb97403"
-SRC_URI[pyo3-macros-0.21.2.sha256sum] = "77b34069fc0682e11b31dbd10321cbf94808394c56fd996796ce45217dfac53c"
-SRC_URI[pyo3-macros-backend-0.21.2.sha256sum] = "08260721f32db5e1a5beae69a55553f56b99bd0e1c3e6e0a5e8851a9d0f5a85c"
+SRC_URI[portable-atomic-1.7.0.sha256sum] = "da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265"
+SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
+SRC_URI[pyo3-0.22.2.sha256sum] = "831e8e819a138c36e212f3af3fd9eeffed6bf1510a805af35b0edee5ffa59433"
+SRC_URI[pyo3-build-config-0.22.2.sha256sum] = "1e8730e591b14492a8945cdff32f089250b05f5accecf74aeddf9e8272ce1fa8"
+SRC_URI[pyo3-ffi-0.22.2.sha256sum] = "5e97e919d2df92eb88ca80a037969f44e5e70356559654962cbb3316d00300c6"
+SRC_URI[pyo3-macros-0.22.2.sha256sum] = "eb57983022ad41f9e683a599f2fd13c3664d7063a3ac5714cae4b7bee7d3f206"
+SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] = "ec480c0c51ddec81019531705acac51bcdbeae563557c982aa8263bb96880372"
 SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
-SRC_URI[redox_syscall-0.5.1.sha256sum] = "469052894dcb553421e483e4209ee581a45100d31b4018de03e5a7ad86374a7e"
-SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
-SRC_URI[smallvec-1.13.2.sha256sum] = "3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67"
-SRC_URI[subtle-2.5.0.sha256sum] = "81cdd64d312baedb58e21336b31bc043b77e01cc99033ce76ef539f78e965ebc"
-SRC_URI[syn-2.0.60.sha256sum] = "909518bc7b1c9b779f1bbf07f2929d35af9f0f37e47c6e9ef7f9dddc1e1821f3"
-SRC_URI[target-lexicon-0.12.14.sha256sum] = "e1fc403891a21bcfb7c37834ba66a547a8f402146eba7265b5a6d88059c9ff2f"
+SRC_URI[subtle-2.6.1.sha256sum] = "13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292"
+SRC_URI[syn-2.0.72.sha256sum] = "dc4b9b9bf2add8093d3f2c0204471e951b2285580335de42f9d2534f3ae7a8af"
+SRC_URI[target-lexicon-0.12.15.sha256sum] = "4873307b7c257eddcb50c9bedf158eb669578359fb28428bef438fec8e6ba7c2"
 SRC_URI[typenum-1.17.0.sha256sum] = "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
 SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
 SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
 SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
-SRC_URI[windows-targets-0.52.5.sha256sum] = "6f0713a46559409d202e70e28227288446bf7841d3211583a4b53e3f6d96e7eb"
-SRC_URI[windows_aarch64_gnullvm-0.52.5.sha256sum] = "7088eed71e8b8dda258ecc8bac5fb1153c5cffaf2578fc8ff5d61e23578d3263"
-SRC_URI[windows_aarch64_msvc-0.52.5.sha256sum] = "9985fd1504e250c615ca5f281c3f7a6da76213ebd5ccc9561496568a2752afb6"
-SRC_URI[windows_i686_gnu-0.52.5.sha256sum] = "88ba073cf16d5372720ec942a8ccbf61626074c6d4dd2e745299726ce8b89670"
-SRC_URI[windows_i686_gnullvm-0.52.5.sha256sum] = "87f4261229030a858f36b459e748ae97545d6f1ec60e5e0d6a3d32e0dc232ee9"
-SRC_URI[windows_i686_msvc-0.52.5.sha256sum] = "db3c2bf3d13d5b658be73463284eaf12830ac9a26a90c717b7f771dfe97487bf"
-SRC_URI[windows_x86_64_gnu-0.52.5.sha256sum] = "4e4246f76bdeff09eb48875a0fd3e2af6aada79d409d33011886d3e1581517d9"
-SRC_URI[windows_x86_64_gnullvm-0.52.5.sha256sum] = "852298e482cd67c356ddd9570386e2862b5673c85bd5f88df9ab6802b334c596"
-SRC_URI[windows_x86_64_msvc-0.52.5.sha256sum] = "bec47e5bfd1bff0eeaf6d8b485cc1074891a197ab4225d504cb7a1ab88b02bf0"
-SRC_URI[zeroize-1.7.0.sha256sum] = "525b4ec142c6b68a2d10f01f7bbf6755599ca3f81ea53b8431b7dd348f5fdb2d"
+SRC_URI[zeroize-1.8.1.sha256sum] = "ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde"
diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.1.3.bb b/meta/recipes-devtools/python/python3-bcrypt_4.2.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-bcrypt_4.1.3.bb
rename to meta/recipes-devtools/python/python3-bcrypt_4.2.0.bb
index 9bed5ee148..0887d88d36 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.1.3.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.2.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://pypi.org/project/bcrypt/"
 DEPENDS += "python3-cffi-native"
 LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '-fuse-ld=bfd', '', d)}"
 
-SRC_URI[sha256sum] = "2ee15dd749f5952fe3f0430d0ff6b74082e159c50332a1413d51b5689cf06623"
+SRC_URI[sha256sum] = "cf69eaf5185fd58f268f805b505ce31f9b9fc2d64b376642164e9244540c1221"
 
 inherit pypi python_setuptools3_rust ptest-cargo cargo-update-recipe-crates
 
-- 
2.34.1


