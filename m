Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6410C54732
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:11 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.75481.1722536822847967021
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ETiMk3VC;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Akk9YYxx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101910f3213b1-022ae4e1-8821-4d5e-b2fa-99d2e10b545e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536825;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2K31Tgo1/8hmNeItj6tnscRlcq9rkeiPJEYuwMKgOOE=;
	b=ETiMk3VC454qirjGszF7ZOz9i0pyZWfgiQDJ+dMQt//hkCZB8EA24ZEFLo2EWqu3
	0mQ4Qu8E4I4J+fI1RxSsDX0/8Hh8LZnkpb5DSx1DX9wdgzWr4xiVkBvUXj8FYgDMnK8
	o+pV0FOOH4crysYRB0xvo/anB4rVjKU9437y98wY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536825;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2K31Tgo1/8hmNeItj6tnscRlcq9rkeiPJEYuwMKgOOE=;
	b=Akk9YYxxbg01GNfU0BYtxzuREZlohEKYfjytFRpsObx8xDnl1jvv+fBYKsm/2SWn
	Btv5507+TqiRxY5D6E9fRZBVMmTtDeZRpJTrtJSqvedBRbGOQdWKkqTEfDS9MOt2kXc
	upMGkii5Lo+GoPDdDyu4VK73QTU09AE39i65RqR4=
Content-Type: multipart/mixed; boundary="===============6816997404355105468=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-bcrypt: upgrading to 4.2.0 SUCCEEDED
Message-ID: <010101910f3213b1-022ae4e1-8821-4d5e-b2fa-99d2e10b545e-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202799

--===============6816997404355105468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-bcrypt* to *4.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-bcrypt-upgrade-4.1.3-4.2.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 737d262d9c75e783012c09198795860763ec7b67 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 10:22:36 +0000
Subject: [PATCH] python3-bcrypt: upgrade 4.1.3 -> 4.2.0

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
2.44.0


--===============6816997404355105468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-ptest: FILELIST: removed "/usr/lib/python3-bcrypt/ptest/bcrypt_rust-9c9c3198429d2d5a", added "/usr/lib/python3-bcrypt/ptest/bcrypt_rust-309108bf18a053ce"
Changes to packages/core2-64-poky-linux/python3-bcrypt (sysroot):
  /usr/lib/python3.12/site-packages/bcrypt-4.1.3.dist-info moved to /usr/lib/python3.12/site-packages/bcrypt-4.2.0.dist-info

--===============6816997404355105468==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-bcrypt-upgrade-4.1.3-4.2.0.patch"

RnJvbSA3MzdkMjYyZDljNzVlNzgzMDEyYzA5MTk4Nzk1ODYwNzYzZWM3YjY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxMDoyMjozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYmNyeXB0OiB1cGdyYWRlIDQuMS4zIC0+IDQuMi4wCgotLS0KIC4uLi9weXRob24vcHl0
aG9uMy1iY3J5cHQtY3JhdGVzLmluYyAgICAgICAgICB8IDg4ICsrKysrKy0tLS0tLS0tLS0tLS0K
IC4uLmNyeXB0XzQuMS4zLmJiID0+IHB5dGhvbjMtYmNyeXB0XzQuMi4wLmJifSB8ICAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDYxIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtYmNyeXB0XzQuMS4zLmJiID0+
IHB5dGhvbjMtYmNyeXB0XzQuMi4wLmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iY3J5cHQtY3JhdGVzLmluYyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iY3J5cHQtY3JhdGVzLmluYwppbmRleCA3ZDllMWYz
YjU5Li5jYTEyNWM4MDI2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtYmNyeXB0LWNyYXRlcy5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWJjcnlwdC1jcmF0ZXMuaW5jCkBAIC02LDcgKzYsNiBAQCBTUkNfVVJJICs9
ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Jhc2U2NC8wLjIyLjEgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2JjcnlwdC8wLjE1LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2JjcnlwdC1w
YmtkZi8wLjEwLjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2JpdGZsYWdzLzIuNS4wIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9ibG9jay1idWZmZXIvMC4xMC40IFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9ibG93ZmlzaC8wLjkuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYnl0ZW9yZGVy
LzEuNS4wIFwKQEAgLTE2LDU0ICsxNSwzOCBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2NyeXB0by1jb21tb24vMC4xLjYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Rp
Z2VzdC8wLjEwLjcgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2dlbmVyaWMtYXJyYXkvMC4xNC43
IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9nZXRyYW5kb20vMC4yLjE0IFwKLSAgICBjcmF0ZTov
L2NyYXRlcy5pby9oZWNrLzAuNC4xIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9nZXRyYW5kb20v
MC4yLjE1IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9oZWNrLzAuNS4wIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9pbmRvYy8yLjAuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaW5vdXQvMC4x
LjMgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpYmMvMC4yLjE1NCBcCi0gICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vbG9ja19hcGkvMC40LjEyIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9saWJjLzAu
Mi4xNTUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL21lbW9mZnNldC8wLjkuMSBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vb25jZV9jZWxsLzEuMTkuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
cGFya2luZ19sb3QvMC4xMi4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9wYXJraW5nX2xvdF9j
b3JlLzAuOS4xMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcGJrZGYyLzAuMTIuMiBcCi0gICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcG9ydGFibGUtYXRvbWljLzEuNi4wIFwKLSAgICBjcmF0ZTovL2Ny
YXRlcy5pby9wcm9jLW1hY3JvMi8xLjAuODEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMv
MC4yMS4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWJ1aWxkLWNvbmZpZy8wLjIxLjIg
XAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtZmZpLzAuMjEuMiBcCi0gICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcHlvMy1tYWNyb3MvMC4yMS4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8z
LW1hY3Jvcy1iYWNrZW5kLzAuMjEuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcG9ydGFibGUt
YXRvbWljLzEuNy4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9wcm9jLW1hY3JvMi8xLjAuODYg
XAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMvMC4yMi4yIFwKKyAgICBjcmF0ZTovL2NyYXRl
cy5pby9weW8zLWJ1aWxkLWNvbmZpZy8wLjIyLjIgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5
bzMtZmZpLzAuMjIuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3MvMC4yMi4y
IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy1iYWNrZW5kLzAuMjIuMiBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcXVvdGUvMS4wLjM2IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5p
by9yZWRveF9zeXNjYWxsLzAuNS4xIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9zY29wZWd1YXJk
LzEuMi4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zaGEyLzAuMTAuOCBcCi0gICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vc21hbGx2ZWMvMS4xMy4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9zdWJ0
bGUvMi41LjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5bi8yLjAuNjAgXAotICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3RhcmdldC1sZXhpY29uLzAuMTIuMTQgXAorICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3N1YnRsZS8yLjYuMSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3luLzIuMC43MiBcCisg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGFyZ2V0LWxleGljb24vMC4xMi4xNSBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vdHlwZW51bS8xLjE3LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNv
ZGUtaWRlbnQvMS4wLjEyIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby91bmluZGVudC8wLjIuMyBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdmVyc2lvbl9jaGVjay8wLjkuNCBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vd2FzaS8wLjExLjArd2FzaS1zbmFwc2hvdC1wcmV2aWV3MSBcCi0gICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vd2luZG93cy10YXJnZXRzLzAuNTIuNSBcCi0gICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vd2luZG93c19hYXJjaDY0X2dudWxsdm0vMC41Mi41IFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby93aW5kb3dzX2FhcmNoNjRfbXN2Yy8wLjUyLjUgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3dpbmRvd3NfaTY4Nl9nbnUvMC41Mi41IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dz
X2k2ODZfZ251bGx2bS8wLjUyLjUgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfaTY4
Nl9tc3ZjLzAuNTIuNSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c194ODZfNjRfZ251
LzAuNTIuNSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c194ODZfNjRfZ251bGx2bS8w
LjUyLjUgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfeDg2XzY0X21zdmMvMC41Mi41
IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvaXplLzEuNy4wIFwKKyAgICBjcmF0ZTovL2Ny
YXRlcy5pby96ZXJvaXplLzEuOC4xIFwKICIKIAogU1JDX1VSSVthdXRvY2ZnLTEuMy4wLnNoYTI1
NnN1bV0gPSAiMGM0YjRkMGJkMjViZDBiNzQ2ODFjMGFkMjE0OTc2MTBjZTFiN2M5MWIxMDIyY2Qy
MWM4MGM2ZmJkZDk0NzZiMCIKIFNSQ19VUklbYmFzZTY0LTAuMjIuMS5zaGEyNTZzdW1dID0gIjcy
YjMyNTRmMTYyNTFhODM4MWFhMTJlNDBlM2M0ZDJmMDE5OWY4YzY1MDhmYmVjYjlkOTFmNTc1ZTBm
YmI4YzYiCiBTUkNfVVJJW2JjcnlwdC0wLjE1LjEuc2hhMjU2c3VtXSA9ICJlNjU5MzhlZDA1OGVm
NDdkOTJjZjhiMzQ2Y2M3NmVmNDg5ODQ1NzJhZGU2MzE5MjdlOTkzN2I1ZmZjNzY2MmM3IgogU1JD
X1VSSVtiY3J5cHQtcGJrZGYtMC4xMC4wLnNoYTI1NnN1bV0gPSAiNmFlYWMyZTFmZTg4ODc2OWYz
NGYwNWFjMzQzYmJlZjk4YjE0ZDFmZmIyOTJhYjY5ZDQ2MDhiM2FiYzg2ZjJhMiIKLVNSQ19VUklb
Yml0ZmxhZ3MtMi41LjAuc2hhMjU2c3VtXSA9ICJjZjRiOWQ2YTk0NGY3NjdmOGU1ZTBkYjAxODU3
MDYyM2M4NWYzZDkyNWFjNzE4ZGI0ZTA2ZDAxODdhZGIyMWMxIgogU1JDX1VSSVtibG9jay1idWZm
ZXItMC4xMC40LnNoYTI1NnN1bV0gPSAiMzA3OGM3NjI5YjYyZDNmMDQzOTUxN2ZhMzk0OTk2YWNh
Y2M1Y2JjOTFjNWEyMGQ4YzY1OGU3N2FiZDUwM2E3MSIKIFNSQ19VUklbYmxvd2Zpc2gtMC45LjEu
c2hhMjU2c3VtXSA9ICJlNDEyZTJjZDBmMmIyZDkzZTAyNTQzY2VhZTc5MTdiM2M3MDMzMTU3M2Rm
MTllZTA0NmJjYmMzNWU0NWU4N2Q3IgogU1JDX1VSSVtieXRlb3JkZXItMS41LjAuc2hhMjU2c3Vt
XSA9ICIxZmQwZjI1ODQxNDZmNmYyZWY0ODA4NTA1MDg4NmFjZjM1M2JlZmY3MzA1ZWJkMWFlNjk1
MDBlMjdjNjdmNjRiIgpAQCAtNzMsNDQgKzU2LDI5IEBAIFNSQ19VUklbY3B1ZmVhdHVyZXMtMC4y
LjEyLnNoYTI1NnN1bV0gPSAiNTNmZTVlMjZmZjFiN2FlZjhiY2E5YzYwODA1MjBjZmI4ZDkzMzNj
CiBTUkNfVVJJW2NyeXB0by1jb21tb24tMC4xLjYuc2hhMjU2c3VtXSA9ICIxYmZiMTI1MDJmM2Zj
NDZjY2ExYmI1MWFjMjhkZjlkNjE4ZDgxM2NkYzNkMmYyNWI5ZmU3NzVhMzRhZjI2YmIzIgogU1JD
X1VSSVtkaWdlc3QtMC4xMC43LnNoYTI1NnN1bV0gPSAiOWVkOWEyODFmN2JjOWI3NTc2ZTYxNDY4
YmE2MTVhNjZhNWM4Y2ZkZmY0MjQyMGE3MGFhODI3MDFhM2IxZTI5MiIKIFNSQ19VUklbZ2VuZXJp
Yy1hcnJheS0wLjE0Ljcuc2hhMjU2c3VtXSA9ICI4NTY0OWNhNTFmZDcyMjcyZDc4MjFhZGFmMjc0
YWQ5MWMyODgyNzc3MTNkOWMxODgyMGQ4NDk5YTdmZjY5ZTlhIgotU1JDX1VSSVtnZXRyYW5kb20t
MC4yLjE0LnNoYTI1NnN1bV0gPSAiOTRiMjJlMDZlY2IwMTEwOTgxMDUxNzIzOTEwY2JmMGI1ZjVl
MDlhMjA2MmRkNzY2MzMzNGVlNzlhOWQxMjg2YyIKLVNSQ19VUklbaGVjay0wLjQuMS5zaGEyNTZz
dW1dID0gIjk1NTA1YzM4YjQ1NzJiMmQ5MTBjZWNiMDI4MTU2MGY1NGI0NDBhMTkzMzZjYmJjYjI3
YmY2Y2U2YWRjNmY1YTgiCitTUkNfVVJJW2dldHJhbmRvbS0wLjIuMTUuc2hhMjU2c3VtXSA9ICJj
NDU2N2M4ZGIxMGFlOTEwODljOTlhZjg0YzY4YzM4ZGEzZWMyZjA4N2MzZjgyOTYwYmNkYmYzNjU2
YjZmNGQ3IgorU1JDX1VSSVtoZWNrLTAuNS4wLnNoYTI1NnN1bV0gPSAiMjMwNGUwMDk4M2Y4N2Zm
YjM4YjU1YjQ0NGI1ZTNiNjBhODg0YjVkMzBjMGZjYTdkODJmZTMzNDQ5YmJlNTVlYSIKIFNSQ19V
UklbaW5kb2MtMi4wLjUuc2hhMjU2c3VtXSA9ICJiMjQ4ZjUyMjRkMWQ2MDYwMDVlMDJjOTdmNWFh
NGU4OGVlYjIzMDQ4OGJjYzAzYmM5Y2E0ZDc5OTEzOTlmMmI1IgogU1JDX1VSSVtpbm91dC0wLjEu
My5zaGEyNTZzdW1dID0gImEwYzEwNTUzZDY2NGE0ZDBiY2ZmOWY0MjE1ZDBhYWM2N2E2MzljYzY4
ZWY2NjA4NDBhZmUzMDliODA3YmM5ZjUiCi1TUkNfVVJJW2xpYmMtMC4yLjE1NC5zaGEyNTZzdW1d
ID0gImFlNzQzMzM4YjkyZmY5MTQ2Y2U4Mzk5MmY3NjZhMzEwNjZhOTFhOGM4NGE0NWUwZTlmMjFl
N2NmNmRlNmQzNDYiCi1TUkNfVVJJW2xvY2tfYXBpLTAuNC4xMi5zaGEyNTZzdW1dID0gIjA3YWY4
YjljZGQyODFiNzkxNWY0MTNmYTczZjI5ZWJkNWQ1NWQwZDNmMDE1NTU4NGRhZGUxZmYxOGNlYTFi
MTciCitTUkNfVVJJW2xpYmMtMC4yLjE1NS5zaGEyNTZzdW1dID0gIjk3YjM4ODhhNGFlY2Y3N2U4
MTExNDVjYWRmNmVlZjU5MDFmNDc4MmM1Mzg4NjE5MWIyZjY5M2YyNDc2MTg0N2MiCiBTUkNfVVJJ
W21lbW9mZnNldC0wLjkuMS5zaGEyNTZzdW1dID0gIjQ4ODAxNmJmYWU0NTdiMDM2ZDk5NjA5MmY2
Y2I0NDg2Nzc2MTFjZTQ0NDllOTcwY2VhZjQyNjk1MjAzZjIxOGEiCiBTUkNfVVJJW29uY2VfY2Vs
bC0xLjE5LjAuc2hhMjU2c3VtXSA9ICIzZmRiMTJiMjQ3NmI1OTVmOTM1OGM1MTYxYWE0NjdjMjQz
ODg1OWNhYTEzNmRlYzg2YzI2ZmRkMmVmZTE3YjkyIgotU1JDX1VSSVtwYXJraW5nX2xvdC0wLjEy
LjIuc2hhMjU2c3VtXSA9ICI3ZTRhZjBjYTRmNmNhZWQyMGU5MDBkNTY0YzI0MmI4ZTVkNDkwM2Zk
YWNmMzFkM2RhZjUyN2I2NmZlNmY0MmZiIgotU1JDX1VSSVtwYXJraW5nX2xvdF9jb3JlLTAuOS4x
MC5zaGEyNTZzdW1dID0gIjFlNDAxZjk3N2FiMzg1YzllNGUzYWIzMDYyN2Q2ZjI2ZDAwZTJjNzNl
ZWYzMTc0OTNjNGVjNmQ0Njg3MjZjZjgiCiBTUkNfVVJJW3Bia2RmMi0wLjEyLjIuc2hhMjU2c3Vt
XSA9ICJmOGVkNmE3NzYxZjc2ZTNiOWY5MmRmYjBhNjBhNmE2NDc3YzYxMDI0Yjc3NTE0N2ZmMDk3
M2EwMjY1M2FiYWYyIgotU1JDX1VSSVtwb3J0YWJsZS1hdG9taWMtMS42LjAuc2hhMjU2c3VtXSA9
ICI3MTcwZWY5OTg4YmMxNjliYTE2ZGQzNmE3ZmEwNDFlNWM0Y2JlYjZhMzViNzZkNGMwM2RhZGVk
MzcxZWFlN2MwIgotU1JDX1VSSVtwcm9jLW1hY3JvMi0xLjAuODEuc2hhMjU2c3VtXSA9ICIzZDE1
OTdiMGMwMjQ2MThmMDlhOWMzYjg2NTViN2U0MzAzOTdhMzZkMjNmZGFmZWMyNmQ2OTY1ZTllZWMz
ZWJhIgotU1JDX1VSSVtweW8zLTAuMjEuMi5zaGEyNTZzdW1dID0gImE1ZTAwYjk2YTUyMTcxOGUw
OGUwM2IxYTYyMmYwMWM4YThkZWI1MDcxOTMzNWRlM2Y2MGIzYjM5NTBmMDY5ZDgiCi1TUkNfVVJJ
W3B5bzMtYnVpbGQtY29uZmlnLTAuMjEuMi5zaGEyNTZzdW1dID0gIjc4ODNkZjU4MzVmYWZkYWQ4
N2MwZDg4OGIyNjZjOGVjMGY0YzljYTQ4YTViZWQ2YmJiNTkyZThkZWRlZTFiNTAiCi1TUkNfVVJJ
W3B5bzMtZmZpLTAuMjEuMi5zaGEyNTZzdW1dID0gIjAxYmU1ODQzZGM2MGI5MTZhYjRkYWQxZGNh
NmQyMGI5YjRlNmRkYzhlMTVmNTBjNDdmZTZkODVmMWZiOTc0MDMiCi1TUkNfVVJJW3B5bzMtbWFj
cm9zLTAuMjEuMi5zaGEyNTZzdW1dID0gIjc3YjM0MDY5ZmMwNjgyZTExYjMxZGJkMTAzMjFjYmY5
NDgwODM5NGM1NmZkOTk2Nzk2Y2U0NTIxN2RmYWM1M2MiCi1TUkNfVVJJW3B5bzMtbWFjcm9zLWJh
Y2tlbmQtMC4yMS4yLnNoYTI1NnN1bV0gPSAiMDgyNjA3MjFmMzJkYjVlMWE1YmVhZTY5YTU1NTUz
ZjU2Yjk5YmQwZTFjM2U2ZTBhNWU4ODUxYTlkMGY1YTg1YyIKK1NSQ19VUklbcG9ydGFibGUtYXRv
bWljLTEuNy4wLnNoYTI1NnN1bV0gPSAiZGE1NDRlZTIxOGYwZDI4N2E5MTFlOWM5OWEzOWE4Yzli
YzhmY2FkM2NiOGRiNTk1OTk0MDA0NGVjZmM2NzI2NSIKK1NSQ19VUklbcHJvYy1tYWNybzItMS4w
Ljg2LnNoYTI1NnN1bV0gPSAiNWU3MTllOGRmNjY1ZGYwZDFjOGZiZmQyMzgwMTU3NDQ3MzYxNTFk
NDQ0NWVjMDgzNmI4ZTYyOGFhZTEwM2I3NyIKK1NSQ19VUklbcHlvMy0wLjIyLjIuc2hhMjU2c3Vt
XSA9ICI4MzFlOGU4MTlhMTM4YzM2ZTIxMmYzYWYzZmQ5ZWVmZmVkNmJmMTUxMGE4MDVhZjM1YjBl
ZGVlNWZmYTU5NDMzIgorU1JDX1VSSVtweW8zLWJ1aWxkLWNvbmZpZy0wLjIyLjIuc2hhMjU2c3Vt
XSA9ICIxZTg3MzBlNTkxYjE0NDkyYTg5NDVjZGZmMzJmMDg5MjUwYjA1ZjVhY2NlY2Y3NGFlZGRm
OWU4MjcyY2UxZmE4IgorU1JDX1VSSVtweW8zLWZmaS0wLjIyLjIuc2hhMjU2c3VtXSA9ICI1ZTk3
ZTkxOWQyZGY5MmViODhjYTgwYTAzNzk2OWY0NGU1ZTcwMzU2NTU5NjU0OTYyY2JiMzMxNmQwMDMw
MGM2IgorU1JDX1VSSVtweW8zLW1hY3Jvcy0wLjIyLjIuc2hhMjU2c3VtXSA9ICJlYjU3OTgzMDIy
YWQ0MWY5ZTY4M2E1OTlmMmZkMTNjMzY2NGQ3MDYzYTNhYzU3MTRjYWU0YjdiZWU3ZDNmMjA2Igor
U1JDX1VSSVtweW8zLW1hY3Jvcy1iYWNrZW5kLTAuMjIuMi5zaGEyNTZzdW1dID0gImVjNDgwYzBj
NTFkZGVjODEwMTk1MzE3MDVhY2FjNTFiY2RiZWFlNTYzNTU3Yzk4MmFhODI2M2JiOTY4ODAzNzIi
CiBTUkNfVVJJW3F1b3RlLTEuMC4zNi5zaGEyNTZzdW1dID0gIjBmYTc2YWFmMzkxMDFjNDU3ODM2
YWVjMGNlMjMxNmRiZGMzYWI3MjNjZGRhMWM2YmQ0ZTZhZDQyMDhhY2FjYTciCi1TUkNfVVJJW3Jl
ZG94X3N5c2NhbGwtMC41LjEuc2hhMjU2c3VtXSA9ICI0NjkwNTI4OTRkY2I1NTM0MjFlNDgzZTQy
MDllZTU4MWE0NTEwMGQzMWI0MDE4ZGUwM2U1YTdhZDg2Mzc0YTdlIgotU1JDX1VSSVtzY29wZWd1
YXJkLTEuMi4wLnNoYTI1NnN1bV0gPSAiOTQxNDNmMzc3MjUxMDlmOTJjMjYyZWQyY2Y1ZTU5YmNl
NzQ5OGMwMWJjYzE1MDJkN2I5YWZlNDM5YTRlOWY0OSIKIFNSQ19VUklbc2hhMi0wLjEwLjguc2hh
MjU2c3VtXSA9ICI3OTNkYjc1YWQyYmNhZmMzZmZhN2M2OGIyMTVmZWUyNjhmNTM3OTgyY2Q5MDFk
MTMyZjg5YzYzNDNmM2EzZGM4IgotU1JDX1VSSVtzbWFsbHZlYy0xLjEzLjIuc2hhMjU2c3VtXSA9
ICIzYzVlMWE5YTY0NmQzNmMzNTk5Y2QxNzNhNDEyODJkYWY0N2M0NDU4M2FkMzY3YjhlNjgzNzI1
NTk1MmU1YzY3IgotU1JDX1VSSVtzdWJ0bGUtMi41LjAuc2hhMjU2c3VtXSA9ICI4MWNkZDY0ZDMx
MmJhZWRiNThlMjEzMzZiMzFiYzA0M2I3N2UwMWNjOTkwMzNjZTc2ZWY1MzlmNzhlOTY1ZWJjIgot
U1JDX1VSSVtzeW4tMi4wLjYwLnNoYTI1NnN1bV0gPSAiOTA5NTE4YmM3YjFjOWI3NzlmMWJiZjA3
ZjI5MjlkMzVhZjlmMGYzN2U0N2M2ZTllZjdmOWRkZGMxZTE4MjFmMyIKLVNSQ19VUklbdGFyZ2V0
LWxleGljb24tMC4xMi4xNC5zaGEyNTZzdW1dID0gImUxZmM0MDM4OTFhMjFiY2ZiN2MzNzgzNGJh
NjZhNTQ3YThmNDAyMTQ2ZWJhNzI2NWI1YTZkODgwNTljOWZmMmYiCitTUkNfVVJJW3N1YnRsZS0y
LjYuMS5zaGEyNTZzdW1dID0gIjEzYzJiZGRlY2M1N2IzODRkZWUxODY1MjM1OGZiMjMxNzJmYWNi
OGEyYzUxY2NjMTBkNzRjMTU3YmRlYTMyOTIiCitTUkNfVVJJW3N5bi0yLjAuNzIuc2hhMjU2c3Vt
XSA9ICJkYzRiOWI5YmYyYWRkODA5M2QzZjJjMDIwNDQ3MWU5NTFiMjI4NTU4MDMzNWRlNDJmOWQy
NTM0ZjNhZTdhOGFmIgorU1JDX1VSSVt0YXJnZXQtbGV4aWNvbi0wLjEyLjE1LnNoYTI1NnN1bV0g
PSAiNDg3MzMwN2I3YzI1N2VkZGNiNTBjOWJlZGYxNThlYjY2OTU3ODM1OWZiMjg0MjhiZWY0Mzhm
ZWM4ZTZiYTdjMiIKIFNSQ19VUklbdHlwZW51bS0xLjE3LjAuc2hhMjU2c3VtXSA9ICI0MmZmMGJm
MGM2NmI4MjM4YzZmM2I1NzhkZjM3ZDBiNzg0OGU1NWRmODU3N2IzZjc0ZjkyYTY5YWNjZWViODI1
IgogU1JDX1VSSVt1bmljb2RlLWlkZW50LTEuMC4xMi5zaGEyNTZzdW1dID0gIjMzNTRiOWFjM2Zh
ZTFmZjY3NTVjYjZkYjUzNjgzYWRiNjYxNjM0ZjY3NTU3OTQyZGVhNGZhY2ViZWMwZmVlNGIiCiBT
UkNfVVJJW3VuaW5kZW50LTAuMi4zLnNoYTI1NnN1bV0gPSAiYzdkZTdkNzNlMTc1NDQ4N2NiNTgz
NjRlZTkwNmE0OTk5MzdhMGRmYWJkODZiY2I5ODBmYTk5ZWM4YzhmYTJjZSIKIFNSQ19VUklbdmVy
c2lvbl9jaGVjay0wLjkuNC5zaGEyNTZzdW1dID0gIjQ5ODc0YjUxNjdiNjVkNzE5M2I4YWJhMTU2
N2Y1YzdkOTNkMDAxY2FmYzM0NjAwY2VlMDAzZWRhNzg3ZTQ4M2YiCiBTUkNfVVJJW3dhc2ktMC4x
MS4wK3dhc2ktc25hcHNob3QtcHJldmlldzEuc2hhMjU2c3VtXSA9ICI5YzhkODdlNzJiNjRhM2I0
ZGIyOGQxMWNlMjkyMzdjMjQ2MTg4ZjRmNTEwNTdkNjVhN2VhYjYzYjc5ODdlNDIzIgotU1JDX1VS
SVt3aW5kb3dzLXRhcmdldHMtMC41Mi41LnNoYTI1NnN1bV0gPSAiNmYwNzEzYTQ2NTU5NDA5ZDIw
MmU3MGUyODIyNzI4ODQ0NmJmNzg0MWQzMjExNTgzYTRiNTNlM2Y2ZDk2ZTdlYiIKLVNSQ19VUklb
d2luZG93c19hYXJjaDY0X2dudWxsdm0tMC41Mi41LnNoYTI1NnN1bV0gPSAiNzA4OGVlZDcxZThi
OGRkYTI1OGVjYzhiYWM1ZmIxMTUzYzVjZmZhZjI1NzhmYzhmZjVkNjFlMjM1NzhkMzI2MyIKLVNS
Q19VUklbd2luZG93c19hYXJjaDY0X21zdmMtMC41Mi41LnNoYTI1NnN1bV0gPSAiOTk4NWZkMTUw
NGUyNTBjNjE1Y2E1ZjI4MWMzZjdhNmRhNzYyMTNlYmQ1Y2NjOTU2MTQ5NjU2OGEyNzUyYWZiNiIK
LVNSQ19VUklbd2luZG93c19pNjg2X2dudS0wLjUyLjUuc2hhMjU2c3VtXSA9ICI4OGJhMDczY2Yx
NmQ1MzcyNzIwZWM5NDJhOGNjYmY2MTYyNjA3NGM2ZDRkZDJlNzQ1Mjk5NzI2Y2U4Yjg5NjcwIgot
U1JDX1VSSVt3aW5kb3dzX2k2ODZfZ251bGx2bS0wLjUyLjUuc2hhMjU2c3VtXSA9ICI4N2Y0MjYx
MjI5MDMwYTg1OGYzNmI0NTllNzQ4YWU5NzU0NWQ2ZjFlYzYwZTVlMGQ2YTNkMzJlMGRjMjMyZWU5
IgotU1JDX1VSSVt3aW5kb3dzX2k2ODZfbXN2Yy0wLjUyLjUuc2hhMjU2c3VtXSA9ICJkYjNjMmJm
M2QxM2Q1YjY1OGJlNzM0NjMyODRlYWYxMjgzMGFjOWEyNmE5MGM3MTdiN2Y3NzFkZmU5NzQ4N2Jm
IgotU1JDX1VSSVt3aW5kb3dzX3g4Nl82NF9nbnUtMC41Mi41LnNoYTI1NnN1bV0gPSAiNGU0MjQ2
Zjc2YmRlZmYwOWViNDg4NzVhMGZkM2UyYWY2YWFkYTc5ZDQwOWQzMzAxMTg4NmQzZTE1ODE1MTdk
OSIKLVNSQ19VUklbd2luZG93c194ODZfNjRfZ251bGx2bS0wLjUyLjUuc2hhMjU2c3VtXSA9ICI4
NTIyOThlNDgyY2Q2N2MzNTZkZGQ5NTcwMzg2ZTI4NjJiNTY3M2M4NWJkNWY4OGRmOWFiNjgwMmIz
MzRjNTk2IgotU1JDX1VSSVt3aW5kb3dzX3g4Nl82NF9tc3ZjLTAuNTIuNS5zaGEyNTZzdW1dID0g
ImJlYzQ3ZTViZmQxYmZmMGVlYWY2ZDhiNDg1Y2MxMDc0ODkxYTE5N2FiNDIyNWQ1MDRjYjdhMWFi
ODhiMDJiZjAiCi1TUkNfVVJJW3plcm9pemUtMS43LjAuc2hhMjU2c3VtXSA9ICI1MjViNGVjMTQy
YzZiNjhhMmQxMGYwMWY3YmJmNjc1NTU5OWNhM2Y4MWVhNTNiODQzMWI3ZGQzNDhmNWZkYjJkIgor
U1JDX1VSSVt6ZXJvaXplLTEuOC4xLnNoYTI1NnN1bV0gPSAiY2VkMzY3OGEyODc5YjMwMzA2ZDMy
M2Y0NTQyNjI2Njk3YTQ2NGE5N2MwYTA3YzlhZWJmN2ViY2E2NWNkNGRkZSIKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iY3J5cHRfNC4xLjMuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmNyeXB0XzQuMi4wLmJiCnNpbWls
YXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1iY3J5cHRfNC4xLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1iY3J5cHRfNC4yLjAuYmIKaW5kZXggOWJlZDVlZTE0OC4uMDg4N2Q4OGQz
NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJjcnlw
dF80LjEuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmNy
eXB0XzQuMi4wLmJiCkBAIC02LDcgKzYsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3B5cGkub3Jn
L3Byb2plY3QvYmNyeXB0LyIKIERFUEVORFMgKz0gInB5dGhvbjMtY2ZmaS1uYXRpdmUiCiBMREZM
QUdTICs9ICIke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3B0ZXN0Jywg
Jy1mdXNlLWxkPWJmZCcsICcnLCBkKX0iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyZWUxNWRk
NzQ5ZjU5NTJmZTNmMDQzMGQwZmY2Yjc0MDgyZTE1OWM1MDMzMmExNDEzZDUxYjU2ODljZjA2NjIz
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImNmNjllYWY1MTg1ZmQ1OGYyNjhmODA1YjUwNWNlMzFm
OWI5ZmMyZDY0YjM3NjY0MjE2NGU5MjQ0NTQwYzEyMjEiCiAKIGluaGVyaXQgcHlwaSBweXRob25f
c2V0dXB0b29sczNfcnVzdCBwdGVzdC1jYXJnbyBjYXJnby11cGRhdGUtcmVjaXBlLWNyYXRlcwog
Ci0tIAoyLjQ0LjAKCg==

--===============6816997404355105468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-bcrypt: PV changed from "4.1.3" to "4.2.0"
packages/core2-64-poky-linux/python3-bcrypt: PKGV changed from 4.1.3 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/python3-bcrypt: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/bcrypt/bcrypt-4.1.3.tar.gz;downloadfilename=bcrypt-4.1.3.tar.gz file://run-ptest crate://crates.io/autocfg/1.3.0 crate://crates.io/base64/0.22.1 crate://crates.io/bcrypt/0.15.1 crate://crates.io/bcrypt-pbkdf/0.10.0 crate://crates.io/bitflags/2.5.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/blowfish/0.9.1 crate://crates.io/byteorder/1.5.0 crate://crates.io/cfg-if/1.0.0 crate://crates.io/cipher/0.4.4 crate://crates.io/cpufeatures/0.2.12 crate://crates.io/crypto-common/0.1.6 crate://crates.io/digest/0.10.7 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.14 crate://crates.io/heck/0.4.1 crate://crates.io/indoc/2.0.5 crate://crates.io/inout/0.1.3 crate://crates.io/libc/0.2.154 crate://crates.io/lock_api/0.4.12 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.19.0 crate://crates.io/parking_lot/0.12.2 crate://crates.io/parking_
 lot_core/0.9.10 crate://crates.io/pbkdf2/0.12.2 crate://crates.io/portable-atomic/1.6.0 crate://crates.io/proc-macro2/1.0.81 crate://crates.io/pyo3/0.21.2 crate://crates.io/pyo3-build-config/0.21.2 crate://crates.io/pyo3-ffi/0.21.2 crate://crates.io/pyo3-macros/0.21.2 crate://crates.io/pyo3-macros-backend/0.21.2 crate://crates.io/quote/1.0.36 crate://crates.io/redox_syscall/0.5.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/sha2/0.10.8 crate://crates.io/smallvec/1.13.2 crate://crates.io/subtle/2.5.0 crate://crates.io/syn/2.0.60 crate://crates.io/target-lexicon/0.12.14 crate://crates.io/typenum/1.17.0 crate://crates.io/unicode-ident/1.0.12 crate://crates.io/unindent/0.2.3 crate://crates.io/version_check/0.9.4 crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 crate://crates.io/windows-targets/0.52.5 crate://crates.io/windows_aarch64_gnullvm/0.52.5 crate://crates.io/windows_aarch64_msvc/0.52.5 crate://crates.io/windows_i686_gnu/0.52.5 crate://crates.io/windows_i686_gnullvm/0
 .52.5 crate://crates.io/windows_i686_msvc/0.52.5 crate://crates.io/windows_x86_64_gnu/0.52.5 crate://crates.io/windows_x86_64_gnullvm/0.52.5 crate://crates.io/windows_x86_64_msvc/0.52.5 crate://crates.io/zeroize/1.7.0" to "https://files.pythonhosted.org/packages/source/b/bcrypt/bcrypt-4.2.0.tar.gz;downloadfilename=bcrypt-4.2.0.tar.gz file://run-ptest crate://crates.io/autocfg/1.3.0 crate://crates.io/base64/0.22.1 crate://crates.io/bcrypt/0.15.1 crate://crates.io/bcrypt-pbkdf/0.10.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/blowfish/0.9.1 crate://crates.io/byteorder/1.5.0 crate://crates.io/cfg-if/1.0.0 crate://crates.io/cipher/0.4.4 crate://crates.io/cpufeatures/0.2.12 crate://crates.io/crypto-common/0.1.6 crate://crates.io/digest/0.10.7 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.15 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/inout/0.1.3 crate://crates.io/libc/0.2.155 crate://crates.io/memoffset/0.9.1 crate://
 crates.io/once_cell/1.19.0 crate://crates.io/pbkdf2/0.12.2 crate://crates.io/portable-atomic/1.7.0 crate://crates.io/proc-macro2/1.0.86 crate://crates.io/pyo3/0.22.2 crate://crates.io/pyo3-build-config/0.22.2 crate://crates.io/pyo3-ffi/0.22.2 crate://crates.io/pyo3-macros/0.22.2 crate://crates.io/pyo3-macros-backend/0.22.2 crate://crates.io/quote/1.0.36 crate://crates.io/sha2/0.10.8 crate://crates.io/subtle/2.6.1 crate://crates.io/syn/2.0.72 crate://crates.io/target-lexicon/0.12.15 crate://crates.io/typenum/1.17.0 crate://crates.io/unicode-ident/1.0.12 crate://crates.io/unindent/0.2.3 crate://crates.io/version_check/0.9.4 crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 crate://crates.io/zeroize/1.8.1"
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-dbg: PV changed from "4.1.3" to "4.2.0"
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-dbg: PKGV changed from 4.1.3 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-dbg: FILELIST: removed "/usr/lib/python3-bcrypt/ptest/.debug/bcrypt_rust-9c9c3198429d2d5a", added "/usr/lib/python3-bcrypt/ptest/.debug/bcrypt_rust-309108bf18a053ce"
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-dbg: PKGSIZE changed from 409816 to 403344 (-2%)
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-dev: PV changed from "4.1.3" to "4.2.0"
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-dev: PKGV changed from 4.1.3 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-doc: PV changed from "4.1.3" to "4.2.0"
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-doc: PKGV changed from 4.1.3 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-locale: PV changed from "4.1.3" to "4.2.0"
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-locale: PKGV changed from 4.1.3 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-ptest: PV changed from "4.1.3" to "4.2.0"
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-ptest: PKGV changed from 4.1.3 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-ptest: FILELIST: removed "/usr/lib/python3-bcrypt/ptest/bcrypt_rust-9c9c3198429d2d5a", added "/usr/lib/python3-bcrypt/ptest/bcrypt_rust-309108bf18a053ce"
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-src: PV changed from "4.1.3" to "4.2.0"
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-src: PKGV changed from 4.1.3 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-staticdev: PV changed from "4.1.3" to "4.2.0"
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-staticdev: PKGV changed from 4.1.3 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt: PV changed from "4.1.3" to "4.2.0"
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt: PKGV changed from 4.1.3 [default] to 4.2.0 [default]
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt: PKGSIZE changed from 570196 to 553912 (-3%)
Changes to packages/core2-64-poky-linux/python3-bcrypt (sysroot):
  /usr/lib/python3.12/site-packages/bcrypt-4.1.3.dist-info moved to /usr/lib/python3.12/site-packages/bcrypt-4.2.0.dist-info

--===============6816997404355105468==--

