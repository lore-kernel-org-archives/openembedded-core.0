Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92839E668BD
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 01:30:28 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.35691.1732584623237394915
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 17:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=az8qSlAK;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1732584623; x=1764120623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XLK7GyBw7aObQANBrCOdWc45hqKqETKwJKIR3qtdQpM=;
  b=az8qSlAK4xIVy0HN5Vdx45jUh+TdkahcXMvQNQibLEN7LxLQiHqJNs1U
   4D0skntyMrDRK4Y2fCF2sBDZtKrGKjzS0gRXFVk/7ApE1uDeD3PHZAKJP
   uxzLTPCnKe2nQsQK7iFznBCHap3ZyFR/KYlPBXB0uORImvHQIa6sTcvp2
   BFAJifFOTXue68NX9z/dnDI3PTqrZSaOie/SANf42c38hvD6QrLGawZKm
   QYJUcKYhM5V0EERm/QKKapxIe8QoIpEzZmg0fI80gnK1RyMLZ2Kfcye5y
   GZMmgVkEIaMknKLmbcTcpDQNctQ9vCwFD00BH/0wmlVVblQ3y1xqEueUk
   A==;
X-CSE-ConnectionGUID: Q33z7fUASF6D4wFsu4OpjA==
X-CSE-MsgGUID: aCegAelHTnukAs3QOVjTHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="183928859"
X-IronPort-AV: E=Sophos;i="6.12,184,1728918000"; 
   d="scan'208";a="183928859"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:30:21 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CE496D4C6E
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 66C10D9CB2
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 06AE821D6CB
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:18 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A37E71A006C;
	Tue, 26 Nov 2024 09:30:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/16] python3-bcrypt: upgrade 4.2.0 -> 4.2.1
Date: Tue, 26 Nov 2024 09:29:56 +0800
Message-Id: <1732584602-4785-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
References: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28820.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28820.004
X-TMASE-Result: 10--1.760600-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yQPZZctd3P4BEITY2UGMiNwH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJonuUjOM44LShMKPrF7dK57N70npWTCd4VhqB+wKK9uZeB2G
	XC4LTsCtUIeTk4LIolFFBlAi/auAgkTgVTZl1A7hbUzvsaHW6BptKRmFOGWfZEd+K6O5Nt52MzB
	CmNDlrXuLzNWBegCW2wgn7iDBesS0nRE+fI6etkjvzNU3GN+PZmnMEHuEup0MqWSTFNvogK1ep8
	Xz2x5s5C5iAOcJl2buTCAcETPeNliEKZy6blvUvj/b7TwzhyjATXaRFNguy3Uu/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 01:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207818

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-bcrypt-crates.inc          | 68 +++++++++----------
 ...crypt_4.2.0.bb => python3-bcrypt_4.2.1.bb} |  2 +-
 2 files changed, 35 insertions(+), 35 deletions(-)
 rename meta/recipes-devtools/python/{python3-bcrypt_4.2.0.bb => python3-bcrypt_4.2.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-bcrypt-crates.inc b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
index ca125c8026..576abcd7cb 100644
--- a/meta/recipes-devtools/python/python3-bcrypt-crates.inc
+++ b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
@@ -2,16 +2,16 @@
 
 # from src/_bcrypt/Cargo.lock
 SRC_URI += " \
-    crate://crates.io/autocfg/1.3.0 \
+    crate://crates.io/autocfg/1.4.0 \
     crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bcrypt/0.15.1 \
+    crate://crates.io/bcrypt/0.16.0 \
     crate://crates.io/bcrypt-pbkdf/0.10.0 \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/blowfish/0.9.1 \
     crate://crates.io/byteorder/1.5.0 \
     crate://crates.io/cfg-if/1.0.0 \
     crate://crates.io/cipher/0.4.4 \
-    crate://crates.io/cpufeatures/0.2.12 \
+    crate://crates.io/cpufeatures/0.2.15 \
     crate://crates.io/crypto-common/0.1.6 \
     crate://crates.io/digest/0.10.7 \
     crate://crates.io/generic-array/0.14.7 \
@@ -19,40 +19,40 @@ SRC_URI += " \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/indoc/2.0.5 \
     crate://crates.io/inout/0.1.3 \
-    crate://crates.io/libc/0.2.155 \
+    crate://crates.io/libc/0.2.164 \
     crate://crates.io/memoffset/0.9.1 \
-    crate://crates.io/once_cell/1.19.0 \
+    crate://crates.io/once_cell/1.20.2 \
     crate://crates.io/pbkdf2/0.12.2 \
-    crate://crates.io/portable-atomic/1.7.0 \
-    crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/pyo3/0.22.2 \
-    crate://crates.io/pyo3-build-config/0.22.2 \
-    crate://crates.io/pyo3-ffi/0.22.2 \
-    crate://crates.io/pyo3-macros/0.22.2 \
-    crate://crates.io/pyo3-macros-backend/0.22.2 \
-    crate://crates.io/quote/1.0.36 \
+    crate://crates.io/portable-atomic/1.9.0 \
+    crate://crates.io/proc-macro2/1.0.89 \
+    crate://crates.io/pyo3/0.23.1 \
+    crate://crates.io/pyo3-build-config/0.23.1 \
+    crate://crates.io/pyo3-ffi/0.23.1 \
+    crate://crates.io/pyo3-macros/0.23.1 \
+    crate://crates.io/pyo3-macros-backend/0.23.1 \
+    crate://crates.io/quote/1.0.37 \
     crate://crates.io/sha2/0.10.8 \
     crate://crates.io/subtle/2.6.1 \
-    crate://crates.io/syn/2.0.72 \
-    crate://crates.io/target-lexicon/0.12.15 \
+    crate://crates.io/syn/2.0.87 \
+    crate://crates.io/target-lexicon/0.12.16 \
     crate://crates.io/typenum/1.17.0 \
-    crate://crates.io/unicode-ident/1.0.12 \
+    crate://crates.io/unicode-ident/1.0.13 \
     crate://crates.io/unindent/0.2.3 \
-    crate://crates.io/version_check/0.9.4 \
+    crate://crates.io/version_check/0.9.5 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
     crate://crates.io/zeroize/1.8.1 \
 "
 
-SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
+SRC_URI[autocfg-1.4.0.sha256sum] = "ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bcrypt-0.15.1.sha256sum] = "e65938ed058ef47d92cf8b346cc76ef48984572ade631927e9937b5ffc7662c7"
+SRC_URI[bcrypt-0.16.0.sha256sum] = "2b1866ecef4f2d06a0bb77880015fdf2b89e25a1c2e5addacb87e459c86dc67e"
 SRC_URI[bcrypt-pbkdf-0.10.0.sha256sum] = "6aeac2e1fe888769f34f05ac343bbef98b14d1ffb292ab69d4608b3abc86f2a2"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[blowfish-0.9.1.sha256sum] = "e412e2cd0f2b2d93e02543ceae7917b3c70331573df19ee046bcbc35e45e87d7"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
 SRC_URI[cipher-0.4.4.sha256sum] = "773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad"
-SRC_URI[cpufeatures-0.2.12.sha256sum] = "53fe5e26ff1b7aef8bca9c6080520cfb8d9333c7568e1829cef191a9723e5504"
+SRC_URI[cpufeatures-0.2.15.sha256sum] = "0ca741a962e1b0bff6d724a1a0958b686406e853bb14061f218562e1896f95e6"
 SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
@@ -60,25 +60,25 @@ SRC_URI[getrandom-0.2.15.sha256sum] = "c4567c8db10ae91089c99af84c68c38da3ec2f087
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
 SRC_URI[inout-0.1.3.sha256sum] = "a0c10553d664a4d0bcff9f4215d0aac67a639cc68ef660840afe309b807bc9f5"
-SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
+SRC_URI[libc-0.2.164.sha256sum] = "433bfe06b8c75da9b2e3fbea6e5329ff87748f0b144ef75306e674c3f6f7c13f"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
-SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
+SRC_URI[once_cell-1.20.2.sha256sum] = "1261fe7e33c73b354eab43b1273a57c8f967d0391e80353e51f764ac02cf6775"
 SRC_URI[pbkdf2-0.12.2.sha256sum] = "f8ed6a7761f76e3b9f92dfb0a60a6a6477c61024b775147ff0973a02653abaf2"
-SRC_URI[portable-atomic-1.7.0.sha256sum] = "da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265"
-SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[pyo3-0.22.2.sha256sum] = "831e8e819a138c36e212f3af3fd9eeffed6bf1510a805af35b0edee5ffa59433"
-SRC_URI[pyo3-build-config-0.22.2.sha256sum] = "1e8730e591b14492a8945cdff32f089250b05f5accecf74aeddf9e8272ce1fa8"
-SRC_URI[pyo3-ffi-0.22.2.sha256sum] = "5e97e919d2df92eb88ca80a037969f44e5e70356559654962cbb3316d00300c6"
-SRC_URI[pyo3-macros-0.22.2.sha256sum] = "eb57983022ad41f9e683a599f2fd13c3664d7063a3ac5714cae4b7bee7d3f206"
-SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] = "ec480c0c51ddec81019531705acac51bcdbeae563557c982aa8263bb96880372"
-SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
+SRC_URI[portable-atomic-1.9.0.sha256sum] = "cc9c68a3f6da06753e9335d63e27f6b9754dd1920d941135b7ea8224f141adb2"
+SRC_URI[proc-macro2-1.0.89.sha256sum] = "f139b0662de085916d1fb67d2b4169d1addddda1919e696f3252b740b629986e"
+SRC_URI[pyo3-0.23.1.sha256sum] = "7ebb0c0cc0de9678e53be9ccf8a2ab53045e6e3a8be03393ceccc5e7396ccb40"
+SRC_URI[pyo3-build-config-0.23.1.sha256sum] = "80e3ce69c4ec34476534b490e412b871ba03a82e35604c3dfb95fcb6bfb60c09"
+SRC_URI[pyo3-ffi-0.23.1.sha256sum] = "3b09f311c76b36dfd6dd6f7fa6f9f18e7e46a1c937110d283e80b12ba2468a75"
+SRC_URI[pyo3-macros-0.23.1.sha256sum] = "fd4f74086536d1e1deaff99ec0387481fb3325c82e4e48be0e75ab3d3fcb487a"
+SRC_URI[pyo3-macros-backend-0.23.1.sha256sum] = "9e77dfeb76b32bbf069144a5ea0a36176ab59c8db9ce28732d0f06f096bbfbc8"
+SRC_URI[quote-1.0.37.sha256sum] = "b5b9d34b8991d19d98081b46eacdd8eb58c6f2b201139f7c5f643cc155a633af"
 SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
 SRC_URI[subtle-2.6.1.sha256sum] = "13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292"
-SRC_URI[syn-2.0.72.sha256sum] = "dc4b9b9bf2add8093d3f2c0204471e951b2285580335de42f9d2534f3ae7a8af"
-SRC_URI[target-lexicon-0.12.15.sha256sum] = "4873307b7c257eddcb50c9bedf158eb669578359fb28428bef438fec8e6ba7c2"
+SRC_URI[syn-2.0.87.sha256sum] = "25aa4ce346d03a6dcd68dd8b4010bcb74e54e62c90c573f394c46eae99aba32d"
+SRC_URI[target-lexicon-0.12.16.sha256sum] = "61c41af27dd6d1e27b1b16b489db798443478cef1f06a660c96db617ba5de3b1"
 SRC_URI[typenum-1.17.0.sha256sum] = "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
-SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
+SRC_URI[unicode-ident-1.0.13.sha256sum] = "e91b56cd4cadaeb79bbf1a5645f6b4f8dc5bde8834ad5894a8db35fda9efa1fe"
 SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
-SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
+SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
 SRC_URI[zeroize-1.8.1.sha256sum] = "ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde"
diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.2.0.bb b/meta/recipes-devtools/python/python3-bcrypt_4.2.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-bcrypt_4.2.0.bb
rename to meta/recipes-devtools/python/python3-bcrypt_4.2.1.bb
index 0887d88d36..7ca73acc48 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.2.0.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.2.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://pypi.org/project/bcrypt/"
 DEPENDS += "python3-cffi-native"
 LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '-fuse-ld=bfd', '', d)}"
 
-SRC_URI[sha256sum] = "cf69eaf5185fd58f268f805b505ce31f9b9fc2d64b376642164e9244540c1221"
+SRC_URI[sha256sum] = "6765386e3ab87f569b276988742039baab087b2cdb01e809d74e74503c2faafe"
 
 inherit pypi python_setuptools3_rust ptest-cargo cargo-update-recipe-crates
 
-- 
2.34.1


