Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354D0C982C1
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 05:44:57 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8417.1789537495427102703
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 22:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aXskvCea;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=zTMSqe8k;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a0a8bf2626-fe118923-d4ec-4ba3-95d0-aa612ca8fd17-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789537494;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vOKw3tPFOMAK/knz6dn1dFfBHRZteSqOvF0AvPM0qe4=;
	b=aXskvCeazFGwFJs2fDRMraBeRXoV7uHUvsiXvH+nB33bGabT4wVrxVvIVuTP8sAf
	wcd1xNSI5eKy0TbTG0fn8NJS6khc8ei1sWG4EpFYsbo1i0AwGDI8RSxa8fuNzw4RVHo
	oB5fkAoFxcwQiNwfIT1llCNEnCa/DcEv6TFlsTGk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789537494;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vOKw3tPFOMAK/knz6dn1dFfBHRZteSqOvF0AvPM0qe4=;
	b=zTMSqe8kwKLu8O1CMo6TVX0L0qiSXq0l0g6X5WQGKCp4IIhlaTXzQW3FiVySJGTk
	DBC1zPivCp4ltrplrAqm1NVUXfpKywsz6zsG6GA/DnRmPcy2SqwzlSMgj2A68hYKhP2
	RoqZrdJS/OecEj/tn33ceU6O9wz4csZQF0XLsy+o=
Content-Type: multipart/mixed; boundary="===============7300250817294069471=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.12.15 SUCCEEDED
Message-ID: <010101a0a8bf2626-fe118923-d4ec-4ba3-95d0-aa612ca8fd17-000000@us-west-2.amazonses.com>
Date: Wed, 16 Sep 2026 05:44:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 05:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245920

--===============7300250817294069471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.12.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.12.13-0.12.15.patch
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
From d00b9b14b10be9ddcd8c2f6001b13008af44476c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Sep 2026 05:44:47 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.12.13 -> 0.12.15

---
 .../python/python3-uv-build-crates.inc        | 52 ++++++++-----------
 ...0.12.13.bb => python3-uv-build_0.12.15.bb} |  2 +-
 2 files changed, 23 insertions(+), 31 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.12.13.bb => python3-uv-build_0.12.15.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 02e8f9a8ab..1488da59e3 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -78,18 +78,17 @@ SRC_URI += " \
     crate://crates.io/form_urlencoded/1.2.2 \
     crate://crates.io/fs-err/3.3.1 \
     crate://crates.io/fs-set-times/0.20.3 \
-    crate://crates.io/futures/0.3.33 \
-    crate://crates.io/futures-channel/0.3.33 \
-    crate://crates.io/futures-core/0.3.33 \
-    crate://crates.io/futures-executor/0.3.33 \
-    crate://crates.io/futures-io/0.3.33 \
+    crate://crates.io/futures/0.3.34 \
+    crate://crates.io/futures-channel/0.3.34 \
+    crate://crates.io/futures-core/0.3.34 \
+    crate://crates.io/futures-executor/0.3.34 \
+    crate://crates.io/futures-io/0.3.34 \
     crate://crates.io/futures-lite/2.6.1 \
-    crate://crates.io/futures-macro/0.3.33 \
-    crate://crates.io/futures-sink/0.3.33 \
-    crate://crates.io/futures-task/0.3.33 \
-    crate://crates.io/futures-util/0.3.33 \
+    crate://crates.io/futures-macro/0.3.34 \
+    crate://crates.io/futures-sink/0.3.34 \
+    crate://crates.io/futures-task/0.3.34 \
+    crate://crates.io/futures-util/0.3.34 \
     crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/getrandom/0.3.4 \
     crate://crates.io/getrandom/0.4.3 \
     crate://crates.io/globset/0.4.20 \
     crate://crates.io/gloo-timers/0.3.0 \
@@ -167,7 +166,6 @@ SRC_URI += " \
     crate://crates.io/ptr_meta_derive/0.3.1 \
     crate://crates.io/quote/1.0.47 \
     crate://crates.io/quoted_printable/0.5.1 \
-    crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/r-efi/6.0.0 \
     crate://crates.io/rancor/0.1.1 \
     crate://crates.io/redox_syscall/0.5.15 \
@@ -222,8 +220,8 @@ SRC_URI += " \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/terminal_size/0.4.4 \
     crate://crates.io/textwrap/0.16.2 \
-    crate://crates.io/thiserror/2.0.19 \
-    crate://crates.io/thiserror-impl/2.0.19 \
+    crate://crates.io/thiserror/2.0.20 \
+    crate://crates.io/thiserror-impl/2.0.20 \
     crate://crates.io/thread_local/1.1.9 \
     crate://crates.io/tinystr/0.8.2 \
     crate://crates.io/tinyvec/1.11.0 \
@@ -260,7 +258,6 @@ SRC_URI += " \
     crate://crates.io/vte/0.14.1 \
     crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
-    crate://crates.io/wasip2/1.0.4+wasi-0.2.12 \
     crate://crates.io/wasm-bindgen/0.2.114 \
     crate://crates.io/wasm-bindgen-macro/0.2.114 \
     crate://crates.io/wasm-bindgen-macro-support/0.2.114 \
@@ -301,7 +298,6 @@ SRC_URI += " \
     crate://crates.io/windows_x86_64_msvc/0.53.1 \
     crate://crates.io/winnow/1.0.3 \
     crate://crates.io/winx/0.36.4 \
-    crate://crates.io/wit-bindgen/0.57.1 \
     crate://crates.io/writeable/0.6.2 \
     crate://crates.io/xattr/1.6.1 \
     crate://crates.io/yoke/0.8.1 \
@@ -396,18 +392,17 @@ SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac1917768
 SRC_URI[form_urlencoded-1.2.2.sha256sum] = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
 SRC_URI[fs-err-3.3.1.sha256sum] = "b91aa448ca50d7e79433bdf3ee8d99215430d2ec02ade5aefab2a073a1822e8a"
 SRC_URI[fs-set-times-0.20.3.sha256sum] = "94e7099f6313ecacbe1256e8ff9d617b75d1bcb16a6fddef94866d225a01a14a"
-SRC_URI[futures-0.3.33.sha256sum] = "a88cf1f829d945f548cf8fec32c61b1f202b6d93b45848602fc02af4b12ad218"
-SRC_URI[futures-channel-0.3.33.sha256sum] = "262590f4fe6afeb0bc83be1daa64e52657fe185690a958af7f3ad0e92085c5ae"
-SRC_URI[futures-core-0.3.33.sha256sum] = "2cd50c473c80f6d7c3670a752354b8e569b1a7cbfdc0419ec88e5edad85e0dc7"
-SRC_URI[futures-executor-0.3.33.sha256sum] = "6754879cc9f2c66f88c6e5c35344bb0bdb0708b0352b1201815667c7eabc7458"
-SRC_URI[futures-io-0.3.33.sha256sum] = "4577ecaa3c4f96589d473f679a71b596316f6641bc350038b962a5daf0085d7a"
+SRC_URI[futures-0.3.34.sha256sum] = "9a31d2a3fbaaeb2af2368bbdd904aa8e812d3c04a1ee10d3171f52d556e5d0a3"
+SRC_URI[futures-channel-0.3.34.sha256sum] = "b1f9e3d69d39e4862ffed03ed071a76f9a13ba1d9109d355b0f0aa6b15e393c4"
+SRC_URI[futures-core-0.3.34.sha256sum] = "92d699e522242e69e3003b94ecc1f960f3a5e015aa7c5d7486e65ad01dd94f5e"
+SRC_URI[futures-executor-0.3.34.sha256sum] = "031b47cf1a3c6cc8bc2fc76cd437f521619387907d469316e7c0bc278f1f5432"
+SRC_URI[futures-io-0.3.34.sha256sum] = "53c0fa8157de1303bfffdaa1cc2a673bfffb60102f76b0ef4441659124373fed"
 SRC_URI[futures-lite-2.6.1.sha256sum] = "f78e10609fe0e0b3f4157ffab1876319b5b0db102a2c60dc4626306dc46b44ad"
-SRC_URI[futures-macro-0.3.33.sha256sum] = "2d6d3cde68c518367be28956066ddfef33813991b77a55005a69dae04bf3b10b"
-SRC_URI[futures-sink-0.3.33.sha256sum] = "e34418ac499d6305c2fb5ad0ed2f6ac998c5f8ca209b4510f7f94242c647e307"
-SRC_URI[futures-task-0.3.33.sha256sum] = "b231ed28831efb4a61a08580c4bc233ec56bc009f4cd8f52da2c3cb97df0c109"
-SRC_URI[futures-util-0.3.33.sha256sum] = "a77a90a256fce34da66415271e30f94ee91c57b04b8a2c042d9cf3220179deaa"
+SRC_URI[futures-macro-0.3.34.sha256sum] = "9fb9654ba8355388abeb8dcb4fc62f511300867002afc858860463bdd9fe0c44"
+SRC_URI[futures-sink-0.3.34.sha256sum] = "1944426bf7d03f1d14f708785e4b33efd750b36d48a157b836b3efc15ede8e1d"
+SRC_URI[futures-task-0.3.34.sha256sum] = "cd417de3d1d015fc3bfd2b1ea46dfc7bab72ef86f1cc7cc9c78e728b34a6d1fd"
+SRC_URI[futures-util-0.3.34.sha256sum] = "0d50a92467f8ba5dd6e3ee5d4bd04d73ab2e4e1c44474a0674821dfce14b79bc"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
 SRC_URI[getrandom-0.4.3.sha256sum] = "300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099"
 SRC_URI[globset-0.4.20.sha256sum] = "07c34a9410465b45bd9787443bc7370f37735bad04b0f0cd57ff1a3186c98988"
 SRC_URI[gloo-timers-0.3.0.sha256sum] = "bbb143cf96099802033e0d4f4963b19fd2e0b728bcf076cd9cf7f6634f092994"
@@ -485,7 +480,6 @@ SRC_URI[ptr_meta-0.3.1.sha256sum] = "0b9a0cf95a1196af61d4f1cbdab967179516d9a4a43
 SRC_URI[ptr_meta_derive-0.3.1.sha256sum] = "7347867d0a7e1208d93b46767be83e2b8f978c3dad35f775ac8d8847551d6fe1"
 SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
 SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17c73"
-SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
 SRC_URI[rancor-0.1.1.sha256sum] = "a063ea72381527c2a0561da9c80000ef822bdd7c3241b1cc1b12100e3df081ee"
 SRC_URI[redox_syscall-0.5.15.sha256sum] = "7e8af0dde094006011e6a740d4879319439489813bd0bcdc7d821beaeeff48ec"
@@ -540,8 +534,8 @@ SRC_URI[temp-env-0.3.6.sha256sum] = "96374855068f47402c3121c6eed88d29cb1de8f3ab2
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[terminal_size-0.4.4.sha256sum] = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
 SRC_URI[textwrap-0.16.2.sha256sum] = "c13547615a44dc9c452a8a534638acdf07120d4b6847c8178705da06306a3057"
-SRC_URI[thiserror-2.0.19.sha256sum] = "09a43598840e33d5b0331f38c5e30d13bb11c11210a4b58f0d9b18a5a5eefcd9"
-SRC_URI[thiserror-impl-2.0.19.sha256sum] = "43cbfe0cf76104d42a574802844187e84a305e531ed54455f11fbde0f10541cd"
+SRC_URI[thiserror-2.0.20.sha256sum] = "ec86235f5fcc2a73650310756d2ac5b138a5780bbbdfae3eeccec992c435ba4f"
+SRC_URI[thiserror-impl-2.0.20.sha256sum] = "bc04cd3e1236dd4a98afca4569f2deb3f120e5422a4023be2cb683f8486292af"
 SRC_URI[thread_local-1.1.9.sha256sum] = "f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185"
 SRC_URI[tinystr-0.8.2.sha256sum] = "42d3e9c45c09de15d06dd8acf5f4e0e399e85927b7f00711024eb7ae10fa4869"
 SRC_URI[tinyvec-1.11.0.sha256sum] = "3e61e67053d25a4e82c844e8424039d9745781b3fc4f32b8d55ed50f5f667ef3"
@@ -578,7 +572,6 @@ SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5
 SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
-SRC_URI[wasip2-1.0.4+wasi-0.2.12.sha256sum] = "b67efb37e106e55ce722a510d6b5f9c17f083e5fc79afc2badeb12cc313d9487"
 SRC_URI[wasm-bindgen-0.2.114.sha256sum] = "6532f9a5c1ece3798cb1c2cfdba640b9b3ba884f5db45973a6f442510a87d38e"
 SRC_URI[wasm-bindgen-macro-0.2.114.sha256sum] = "18a2d50fcf105fb33bb15f00e7a77b772945a2ee45dcf454961fd843e74c18e6"
 SRC_URI[wasm-bindgen-macro-support-0.2.114.sha256sum] = "03ce4caeaac547cdf713d280eda22a730824dd11e6b8c3ca9e42247b25c631e3"
@@ -619,7 +612,6 @@ SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661
 SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
 SRC_URI[winnow-1.0.3.sha256sum] = "0592e1c9d151f854e6fd382574c3a0855250e1d9b2f99d9281c6e6391af352f1"
 SRC_URI[winx-0.36.4.sha256sum] = "3f3fd376f71958b862e7afb20cfe5a22830e1963462f3a17f49d82a6c1d1f42d"
-SRC_URI[wit-bindgen-0.57.1.sha256sum] = "1ebf944e87a7c253233ad6766e082e3cd714b5d03812acc24c318f549614536e"
 SRC_URI[writeable-0.6.2.sha256sum] = "9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9"
 SRC_URI[xattr-1.6.1.sha256sum] = "32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156"
 SRC_URI[yoke-0.8.1.sha256sum] = "72d6e5c6afb84d73944e5cedb052c4680d5657337201555f9f2a16b7406d4954"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.13.bb b/meta/recipes-devtools/python/python3-uv-build_0.12.15.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.13.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.12.15.bb
index 51e85d5a85..c6730174dc 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.13.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.15.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "46936ab24c8674be28df2784a9ca2878478a84a98e6ce3df5cb976102e99b8f1"
+SRC_URI[sha256sum] = "afd586089d301df068204cd4111817bd9d475eebdeab7ea329c3fb1a48b4fb7a"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============7300250817294069471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.13.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.12.15.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.13.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.12.15.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.12.13.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.12.15.dist-info

--===============7300250817294069471==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.12.13-0.12.15.patch"

RnJvbSBkMDBiOWIxNGIxMGJlOWRkY2Q4YzJmNjAwMWIxMzAwOGFmNDQ0NzZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgU2VwIDIwMjYgMDU6NDQ6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuMTIuMTMgLT4gMC4xMi4xNQoKLS0tCiAuLi4vcHl0
aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYyAgICAgICAgfCA1MiArKysrKysrKy0tLS0t
LS0tLS0tCiAuLi4wLjEyLjEzLmJiID0+IHB5dGhvbjMtdXYtYnVpbGRfMC4xMi4xNS5iYn0gfCAg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXV2LWJ1aWxkXzAu
MTIuMTMuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjEyLjE1LmJifSAoOTIlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMu
aW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRl
cy5pbmMKaW5kZXggMDJlOGY5YThhYi4uMTQ4OGRhNTllMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKQEAg
LTc4LDE4ICs3OCwxNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Zv
cm1fdXJsZW5jb2RlZC8xLjIuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnMtZXJyLzMuMy4x
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9mcy1zZXQtdGltZXMvMC4yMC4zIFwKLSAgICBjcmF0
ZTovL2NyYXRlcy5pby9mdXR1cmVzLzAuMy4zMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0
dXJlcy1jaGFubmVsLzAuMy4zMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0dXJlcy1jb3Jl
LzAuMy4zMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0dXJlcy1leGVjdXRvci8wLjMuMzMg
XAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMtaW8vMC4zLjMzIFwKKyAgICBjcmF0ZTov
L2NyYXRlcy5pby9mdXR1cmVzLzAuMy4zNCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0dXJl
cy1jaGFubmVsLzAuMy4zNCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0dXJlcy1jb3JlLzAu
My4zNCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0dXJlcy1leGVjdXRvci8wLjMuMzQgXAor
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMtaW8vMC4zLjM0IFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9mdXR1cmVzLWxpdGUvMi42LjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVy
ZXMtbWFjcm8vMC4zLjMzIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9mdXR1cmVzLXNpbmsvMC4z
LjMzIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9mdXR1cmVzLXRhc2svMC4zLjMzIFwKLSAgICBj
cmF0ZTovL2NyYXRlcy5pby9mdXR1cmVzLXV0aWwvMC4zLjMzIFwKKyAgICBjcmF0ZTovL2NyYXRl
cy5pby9mdXR1cmVzLW1hY3JvLzAuMy4zNCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0dXJl
cy1zaW5rLzAuMy4zNCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0dXJlcy10YXNrLzAuMy4z
NCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0dXJlcy11dGlsLzAuMy4zNCBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vZ2VuZXJpYy1hcnJheS8wLjE0LjcgXAotICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2dldHJhbmRvbS8wLjMuNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZ2V0cmFuZG9tLzAu
NC4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9nbG9ic2V0LzAuNC4yMCBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vZ2xvby10aW1lcnMvMC4zLjAgXApAQCAtMTY3LDcgKzE2Niw2IEBAIFNSQ19V
UkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHRyX21ldGFfZGVyaXZlLzAuMy4xIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9xdW90ZS8xLjAuNDcgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3F1b3RlZF9wcmludGFibGUvMC41LjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ItZWZp
LzUuMy4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9yLWVmaS82LjAuMCBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vcmFuY29yLzAuMS4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWRveF9z
eXNjYWxsLzAuNS4xNSBcCkBAIC0yMjIsOCArMjIwLDggQEAgU1JDX1VSSSArPSAiIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby90ZW1wZmlsZS8zLjI3LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3Rlcm1pbmFsX3NpemUvMC40LjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RleHR3cmFwLzAu
MTYuMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGhpc2Vycm9yLzIuMC4xOSBcCi0gICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vdGhpc2Vycm9yLWltcGwvMi4wLjE5IFwKKyAgICBjcmF0ZTovL2NyYXRl
cy5pby90aGlzZXJyb3IvMi4wLjIwIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby90aGlzZXJyb3It
aW1wbC8yLjAuMjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RocmVhZF9sb2NhbC8xLjEuOSBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGlueXN0ci8wLjguMiBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vdGlueXZlYy8xLjExLjAgXApAQCAtMjYwLDcgKzI1OCw2IEBAIFNSQ19VUkkgKz0gIiBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdnRlLzAuMTQuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vd2Fsa2Rpci8yLjUuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FzaS8wLjExLjErd2Fz
aS1zbmFwc2hvdC1wcmV2aWV3MSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FzaXAyLzEuMC40
K3dhc2ktMC4yLjEyIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93YXNtLWJpbmRnZW4vMC4yLjEx
NCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FzbS1iaW5kZ2VuLW1hY3JvLzAuMi4xMTQgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc20tYmluZGdlbi1tYWNyby1zdXBwb3J0LzAuMi4xMTQg
XApAQCAtMzAxLDcgKzI5OCw2IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vd2luZG93c194ODZfNjRfbXN2Yy8wLjUzLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dp
bm5vdy8xLjAuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2lueC8wLjM2LjQgXAotICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3dpdC1iaW5kZ2VuLzAuNTcuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vd3JpdGVhYmxlLzAuNi4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby94YXR0ci8xLjYuMSBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8veW9rZS8wLjguMSBcCkBAIC0zOTYsMTggKzM5MiwxNyBA
QCBTUkNfVVJJW2ZvbGRoYXNoLTAuMi4wLnNoYTI1NnN1bV0gPSAiNzdjZTI0Y2I1ODIyOGZiYjhh
YTA0MTQyNWJiMTA1MDg1MGFjMTkxNzc2OAogU1JDX1VSSVtmb3JtX3VybGVuY29kZWQtMS4yLjIu
c2hhMjU2c3VtXSA9ICJjYjRjYjI0NTAzODUxNmY1Zjg1Mjc3ODc1Y2RhYTRmN2QyYzlhMGZhMDQ2
OGRlMDZlZDE5MDE2M2IxNTgxZmNmIgogU1JDX1VSSVtmcy1lcnItMy4zLjEuc2hhMjU2c3VtXSA9
ICJiOTFhYTQ0OGNhNTBkN2U3OTQzM2JkZjNlZThkOTkyMTU0MzBkMmVjMDJhZGU1YWVmYWIyYTA3
M2ExODIyZThhIgogU1JDX1VSSVtmcy1zZXQtdGltZXMtMC4yMC4zLnNoYTI1NnN1bV0gPSAiOTRl
NzA5OWY2MzEzZWNhY2JlMTI1NmU4ZmY5ZDYxN2I3NWQxYmNiMTZhNmZkZGVmOTQ4NjZkMjI1YTAx
YTE0YSIKLVNSQ19VUklbZnV0dXJlcy0wLjMuMzMuc2hhMjU2c3VtXSA9ICJhODhjZjFmODI5ZDk0
NWY1NDhjZjhmZWMzMmM2MWIxZjIwMmI2ZDkzYjQ1ODQ4NjAyZmMwMmFmNGIxMmFkMjE4IgotU1JD
X1VSSVtmdXR1cmVzLWNoYW5uZWwtMC4zLjMzLnNoYTI1NnN1bV0gPSAiMjYyNTkwZjRmZTZhZmVi
MGJjODNiZTFkYWE2NGU1MjY1N2ZlMTg1NjkwYTk1OGFmN2YzYWQwZTkyMDg1YzVhZSIKLVNSQ19V
UklbZnV0dXJlcy1jb3JlLTAuMy4zMy5zaGEyNTZzdW1dID0gIjJjZDUwYzQ3M2M4MGY2ZDdjMzY3
MGE3NTIzNTRiOGU1NjliMWE3Y2JmZGMwNDE5ZWM4OGU1ZWRhZDg1ZTBkYzciCi1TUkNfVVJJW2Z1
dHVyZXMtZXhlY3V0b3ItMC4zLjMzLnNoYTI1NnN1bV0gPSAiNjc1NDg3OWNjOWYyYzY2Zjg4YzZl
NWMzNTM0NGJiMGJkYjA3MDhiMDM1MmIxMjAxODE1NjY3YzdlYWJjNzQ1OCIKLVNSQ19VUklbZnV0
dXJlcy1pby0wLjMuMzMuc2hhMjU2c3VtXSA9ICI0NTc3ZWNhYTNjNGY5NjU4OWQ0NzNmNjc5YTcx
YjU5NjMxNmY2NjQxYmMzNTAwMzhiOTYyYTVkYWYwMDg1ZDdhIgorU1JDX1VSSVtmdXR1cmVzLTAu
My4zNC5zaGEyNTZzdW1dID0gIjlhMzFkMmEzZmJhYWViMmFmMjM2OGJiZGQ5MDRhYThlODEyZDNj
MDRhMWVlMTBkMzE3MWY1MmQ1NTZlNWQwYTMiCitTUkNfVVJJW2Z1dHVyZXMtY2hhbm5lbC0wLjMu
MzQuc2hhMjU2c3VtXSA9ICJiMWY5ZTNkNjlkMzllNDg2MmZmZWQwM2VkMDcxYTc2ZjlhMTNiYTFk
OTEwOWQzNTViMGYwYWE2YjE1ZTM5M2M0IgorU1JDX1VSSVtmdXR1cmVzLWNvcmUtMC4zLjM0LnNo
YTI1NnN1bV0gPSAiOTJkNjk5ZTUyMjI0MmU2OWUzMDAzYjk0ZWNjMWY5NjBmM2E1ZTAxNWFhN2M1
ZDc0ODZlNjVhZDAxZGQ5NGY1ZSIKK1NSQ19VUklbZnV0dXJlcy1leGVjdXRvci0wLjMuMzQuc2hh
MjU2c3VtXSA9ICIwMzFiNDdjZjFhM2M2Y2M4YmMyZmM3NmNkNDM3ZjUyMTYxOTM4NzkwN2Q0Njkz
MTZlN2MwYmMyNzhmMWY1NDMyIgorU1JDX1VSSVtmdXR1cmVzLWlvLTAuMy4zNC5zaGEyNTZzdW1d
ID0gIjUzYzBmYTgxNTdkZTEzMDNiZmZmZGFhMWNjMmE2NzNiZmZmYjYwMTAyZjc2YjBlZjQ0NDE2
NTkxMjQzNzNmZWQiCiBTUkNfVVJJW2Z1dHVyZXMtbGl0ZS0yLjYuMS5zaGEyNTZzdW1dID0gImY3
OGUxMDYwOWZlMGUwYjNmNDE1N2ZmYWIxODc2MzE5YjViMGRiMTAyYTJjNjBkYzQ2MjYzMDZkYzQ2
YjQ0YWQiCi1TUkNfVVJJW2Z1dHVyZXMtbWFjcm8tMC4zLjMzLnNoYTI1NnN1bV0gPSAiMmQ2ZDNj
ZGU2OGM1MTgzNjdiZTI4OTU2MDY2ZGRmZWYzMzgxMzk5MWI3N2E1NTAwNWE2OWRhZTA0YmYzYjEw
YiIKLVNSQ19VUklbZnV0dXJlcy1zaW5rLTAuMy4zMy5zaGEyNTZzdW1dID0gImUzNDQxOGFjNDk5
ZDYzMDVjMmZiNWFkMGVkMmY2YWM5OThjNWY4Y2EyMDliNDUxMGY3Zjk0MjQyYzY0N2UzMDciCi1T
UkNfVVJJW2Z1dHVyZXMtdGFzay0wLjMuMzMuc2hhMjU2c3VtXSA9ICJiMjMxZWQyODgzMWVmYjRh
NjFhMDg1ODBjNGJjMjMzZWM1NmJjMDA5ZjRjZDhmNTJkYTJjM2NiOTdkZjBjMTA5IgotU1JDX1VS
SVtmdXR1cmVzLXV0aWwtMC4zLjMzLnNoYTI1NnN1bV0gPSAiYTc3YTkwYTI1NmZjZTM0ZGE2NjQx
NTI3MWUzMGY5NGVlOTFjNTdiMDRiOGEyYzA0MmQ5Y2YzMjIwMTc5ZGVhYSIKK1NSQ19VUklbZnV0
dXJlcy1tYWNyby0wLjMuMzQuc2hhMjU2c3VtXSA9ICI5ZmI5NjU0YmE4MzU1Mzg4YWJlYjhkY2I0
ZmM2MmY1MTEzMDA4NjcwMDJhZmM4NTg4NjA0NjNiZGQ5ZmUwYzQ0IgorU1JDX1VSSVtmdXR1cmVz
LXNpbmstMC4zLjM0LnNoYTI1NnN1bV0gPSAiMTk0NDQyNmJmN2QwM2YxZDE0ZjcwODc4NWU0YjMz
ZWZkNzUwYjM2ZDQ4YTE1N2I4MzZiM2VmYzE1ZWRlOGUxZCIKK1NSQ19VUklbZnV0dXJlcy10YXNr
LTAuMy4zNC5zaGEyNTZzdW1dID0gImNkNDE3ZGUzZDFkMDE1ZmMzYmZkMmIxZWE0NmRmYzdiYWI3
MmVmODZmMWNjN2NjOWM3OGU3MjhiMzRhNmQxZmQiCitTUkNfVVJJW2Z1dHVyZXMtdXRpbC0wLjMu
MzQuc2hhMjU2c3VtXSA9ICIwZDUwYTkyNDY3ZjhiYTVkZDZlM2VlNWQ0YmQwNGQ3M2FiMmU0ZTFj
NDQ0NzRhMDY3NDgyMWRmY2UxNGI3OWJjIgogU1JDX1VSSVtnZW5lcmljLWFycmF5LTAuMTQuNy5z
aGEyNTZzdW1dID0gIjg1NjQ5Y2E1MWZkNzIyNzJkNzgyMWFkYWYyNzRhZDkxYzI4ODI3NzcxM2Q5
YzE4ODIwZDg0OTlhN2ZmNjllOWEiCi1TUkNfVVJJW2dldHJhbmRvbS0wLjMuNC5zaGEyNTZzdW1d
ID0gIjg5OWRlZjVjMzdjNGZkN2IyNjY0NjQ4YzI4MTIwZWNlYzEzOGU0ZDM5NWI0NTllNWNhMzRm
OWNjZTJkZDc3ZmQiCiBTUkNfVVJJW2dldHJhbmRvbS0wLjQuMy5zaGEyNTZzdW1dID0gIjMwMGU4
ODNkNzU2YjJlNGVjOTRlMDI3OTFmMzliMDRiNTIyMjc2MTM4ODUyY2ZjNDFkOWZiN2U5MDQxMDYw
OTkiCiBTUkNfVVJJW2dsb2JzZXQtMC40LjIwLnNoYTI1NnN1bV0gPSAiMDdjMzRhOTQxMDQ2NWI0
NWJkOTc4NzQ0M2JjNzM3MGYzNzczNWJhZDA0YjBmMGNkNTdmZjFhMzE4NmM5ODk4OCIKIFNSQ19V
UklbZ2xvby10aW1lcnMtMC4zLjAuc2hhMjU2c3VtXSA9ICJiYmIxNDNjZjk2MDk5ODAyMDMzZTBk
NGY0OTYzYjE5ZmQyZTBiNzI4YmNmMDc2Y2Q5Y2Y3ZjY2MzRmMDkyOTk0IgpAQCAtNDg1LDcgKzQ4
MCw2IEBAIFNSQ19VUklbcHRyX21ldGEtMC4zLjEuc2hhMjU2c3VtXSA9ICIwYjlhMGNmOTVhMTE5
NmFmNjFkNGYxY2JkYWI5NjcxNzk1MTZkOWE0YTQzCiBTUkNfVVJJW3B0cl9tZXRhX2Rlcml2ZS0w
LjMuMS5zaGEyNTZzdW1dID0gIjczNDc4NjdkMGE3ZTEyMDhkOTNiNDY3NjdiZTgzZTJiOGY5Nzhj
M2RhZDM1Zjc3NWFjOGQ4ODQ3NTUxZDZmZTEiCiBTUkNfVVJJW3F1b3RlLTEuMC40Ny5zaGEyNTZz
dW1dID0gIjFmYmY0ZGIxNDJhNDczYThkODBjMjZiYmYxODQ1NGVkNDU4YmY4ZDI2YzgyMTljMzMx
ZGFlY2ZkYmQwNzkwMDEiCiBTUkNfVVJJW3F1b3RlZF9wcmludGFibGUtMC41LjEuc2hhMjU2c3Vt
XSA9ICI2NDBjOWJkODQ5N2IwMjQ2NWFlZWY1Mzc1MTQ0YzI2MDYyZTBkY2Q1OTM5ZGZjYmIwZjVk
Yjc2Y2I4YzE3YzczIgotU1JDX1VSSVtyLWVmaS01LjMuMC5zaGEyNTZzdW1dID0gIjY5Y2RiMzRj
MTU4Y2ViMjg4ZGYxMWUxOGI0YmQzOWRlOTk0ZjY2NTdkODM4NDdiZGZmZGJkN2YzNDY3NTRiMGYi
CiBTUkNfVVJJW3ItZWZpLTYuMC4wLnNoYTI1NnN1bV0gPSAiZjhkY2M5YzdkNTJhODExNjk3ZDIx
NTFjNzAxZTBkMDg5NTZmOTJiMGUyNDEzNmNmNGNmMjdiNTdhNmEwZDliZiIKIFNSQ19VUklbcmFu
Y29yLTAuMS4xLnNoYTI1NnN1bV0gPSAiYTA2M2VhNzIzODE1MjdjMmEwNTYxZGE5YzgwMDAwZWY4
MjJiZGQ3YzMyNDFiMWNjMWIxMjEwMGUzZGYwODFlZSIKIFNSQ19VUklbcmVkb3hfc3lzY2FsbC0w
LjUuMTUuc2hhMjU2c3VtXSA9ICI3ZThhZjBkZGUwOTQwMDYwMTFlNmE3NDBkNDg3OTMxOTQzOTQ4
OTgxM2JkMGJjZGM3ZDgyMWJlYWVlZmY0OGVjIgpAQCAtNTQwLDggKzUzNCw4IEBAIFNSQ19VUklb
dGVtcC1lbnYtMC4zLjYuc2hhMjU2c3VtXSA9ICI5NjM3NDg1NTA2OGY0NzQwMmMzMTIxYzZlZWQ4
OGQyOWNiMWRlOGYzYWIyCiBTUkNfVVJJW3RlbXBmaWxlLTMuMjcuMC5zaGEyNTZzdW1dID0gIjMy
NDk3ZTlhNGM3YjM4NTMyZWZjZGViZWVmODc5NzA3YWE5Zjc5NDI5NmE0ZjAyNDRmNmY2OWU5YmM4
NTc0YmQiCiBTUkNfVVJJW3Rlcm1pbmFsX3NpemUtMC40LjQuc2hhMjU2c3VtXSA9ICIyMzBhMWI4
MjFjY2JkNzViMTg1ODIwYTFmMWZmN2IxNGQyMWRhMWU0NDJlMjJjMDg2M2VhNWYwODc3MWE4ODc0
IgogU1JDX1VSSVt0ZXh0d3JhcC0wLjE2LjIuc2hhMjU2c3VtXSA9ICJjMTM1NDc2MTVhNDRkYzlj
NDUyYThhNTM0NjM4YWNkZjA3MTIwZDRiNjg0N2M4MTc4NzA1ZGEwNjMwNmEzMDU3IgotU1JDX1VS
SVt0aGlzZXJyb3ItMi4wLjE5LnNoYTI1NnN1bV0gPSAiMDlhNDM1OTg4NDBlMzNkNWIwMzMxZjM4
YzVlMzBkMTNiYjExYzExMjEwYTRiNThmMGQ5YjE4YTVhNWVlZmNkOSIKLVNSQ19VUklbdGhpc2Vy
cm9yLWltcGwtMi4wLjE5LnNoYTI1NnN1bV0gPSAiNDNjYmZlMGNmNzYxMDRkNDJhNTc0ODAyODQ0
MTg3ZTg0YTMwNWU1MzFlZDU0NDU1ZjExZmJkZTBmMTA1NDFjZCIKK1NSQ19VUklbdGhpc2Vycm9y
LTIuMC4yMC5zaGEyNTZzdW1dID0gImVjODYyMzVmNWZjYzJhNzM2NTAzMTA3NTZkMmFjNWIxMzhh
NTc4MGJiYmRmYWUzZWVjY2VjOTkyYzQzNWJhNGYiCitTUkNfVVJJW3RoaXNlcnJvci1pbXBsLTIu
MC4yMC5zaGEyNTZzdW1dID0gImJjMDRjZDNlMTIzNmRkNGE5OGFmY2E0NTY5ZjJkZWIzZjEyMGU1
NDIyYTQwMjNiZTJjYjY4M2Y4NDg2MjkyYWYiCiBTUkNfVVJJW3RocmVhZF9sb2NhbC0xLjEuOS5z
aGEyNTZzdW1dID0gImY2MDI0NmE0OTQ0ZjI0ZjZlMDE4YWExN2NkZWZmYjc4MThiNzYzNTY5NjVk
MDNiMDdkNmE5ODg2ZTg5NjIxODUiCiBTUkNfVVJJW3RpbnlzdHItMC44LjIuc2hhMjU2c3VtXSA9
ICI0MmQzZTljNDVjMDlkZTE1ZDA2ZGQ4YWNmNWY0ZTBlMzk5ZTg1OTI3YjdmMDA3MTEwMjRlYjdh
ZTEwZmE0ODY5IgogU1JDX1VSSVt0aW55dmVjLTEuMTEuMC5zaGEyNTZzdW1dID0gIjNlNjFlNjcw
NTNkMjVhNGU4MmM4NDRlODQyNDAzOWQ5NzQ1NzgxYjNmYzRmMzJiOGQ1NWVkNTBmNWY2NjdlZjMi
CkBAIC01NzgsNyArNTcyLDYgQEAgU1JDX1VSSVt2ZXJzaW9uX2NoZWNrLTAuOS41LnNoYTI1NnN1
bV0gPSAiMGI5MjhmMzNkOTc1ZmM2YWQ5Zjg2YzhmMjgzODUzYWQyNmJkZDUKIFNSQ19VUklbdnRl
LTAuMTQuMS5zaGEyNTZzdW1dID0gIjIzMWZkY2Q3ZWYzMDM3ZTgzMzBkOGUxN2U2MTAxMWEyYzI0
NDEyNmFjYzBhOTgyZjQwNDBhYzNmOWYwYmMwNzciCiBTUkNfVVJJW3dhbGtkaXItMi41LjAuc2hh
MjU2c3VtXSA9ICIyOTc5MDk0NjQwNGY5MWQ5YzVkMDZmOTg3NGVmZGRlYTFkYzA2YzVlZmU5NDU0
MWE3ZDY4NjMxMDhlM2E1ZTRiIgogU1JDX1VSSVt3YXNpLTAuMTEuMSt3YXNpLXNuYXBzaG90LXBy
ZXZpZXcxLnNoYTI1NnN1bV0gPSAiY2NmM2VjNjUxYTg0N2ViMDFkZTczY2NhZDE1ZWI3ZDk5Zjgw
NDg1ZGUwNDNlZmIyZjM3MGNkNjU0ZjRlYTQ0YiIKLVNSQ19VUklbd2FzaXAyLTEuMC40K3dhc2kt
MC4yLjEyLnNoYTI1NnN1bV0gPSAiYjY3ZWZiMzdlMTA2ZTU1Y2U3MjJhNTEwZDZiNWY5YzE3ZjA4
M2U1ZmM3OWFmYzJiYWRlYjEyY2MzMTNkOTQ4NyIKIFNSQ19VUklbd2FzbS1iaW5kZ2VuLTAuMi4x
MTQuc2hhMjU2c3VtXSA9ICI2NTMyZjlhNWMxZWNlMzc5OGNiMWMyY2ZkYmE2NDBiOWIzYmE4ODRm
NWRiNDU5NzNhNmY0NDI1MTBhODdkMzhlIgogU1JDX1VSSVt3YXNtLWJpbmRnZW4tbWFjcm8tMC4y
LjExNC5zaGEyNTZzdW1dID0gIjE4YTJkNTBmY2YxMDVmYjMzYmIxNWYwMGU3YTc3Yjc3Mjk0NWEy
ZWU0NWRjZjQ1NDk2MWZkODQzZTc0YzE4ZTYiCiBTUkNfVVJJW3dhc20tYmluZGdlbi1tYWNyby1z
dXBwb3J0LTAuMi4xMTQuc2hhMjU2c3VtXSA9ICIwM2NlNGNhZWFhYzU0N2NkZjcxM2QyODBlZGEy
MmE3MzA4MjRkZDExZTZiOGMzY2E5ZTQyMjQ3YjI1YzYzMWUzIgpAQCAtNjE5LDcgKzYxMiw2IEBA
IFNSQ19VUklbd2luZG93c194ODZfNjRfbXN2Yy0wLjUyLjYuc2hhMjU2c3VtXSA9ICI1ODlmNmRh
ODRjNjQ2MjA0NzQ3ZDEyNzBhMmE1NjYxCiBTUkNfVVJJW3dpbmRvd3NfeDg2XzY0X21zdmMtMC41
My4xLnNoYTI1NnN1bV0gPSAiZDZiYmZmNWYwYWFkYTQyN2ExZTVhNmRhNWYxZjk4MTU4MTgyZjI2
NTU2ZjM0NWFjOWUwNGQzNmQwZWJlZDY1MCIKIFNSQ19VUklbd2lubm93LTEuMC4zLnNoYTI1NnN1
bV0gPSAiMDU5MmUxYzlkMTUxZjg1NGU2ZmQzODI1NzRjM2EwODU1MjUwZTFkOWIyZjk5ZDkyODFj
NmU2MzkxYWYzNTJmMSIKIFNSQ19VUklbd2lueC0wLjM2LjQuc2hhMjU2c3VtXSA9ICIzZjNmZDM3
NmY3MTk1OGI4NjJlN2FmYjIwY2ZlNWEyMjgzMGUxOTYzNDYyZjNhMTdmNDlkODJhNmMxZDFmNDJk
IgotU1JDX1VSSVt3aXQtYmluZGdlbi0wLjU3LjEuc2hhMjU2c3VtXSA9ICIxZWJmOTQ0ZTg3YTdj
MjUzMjMzYWQ2NzY2ZTA4MmUzY2Q3MTRiNWQwMzgxMmFjYzI0YzMxOGY1NDk2MTQ1MzZlIgogU1JD
X1VSSVt3cml0ZWFibGUtMC42LjIuc2hhMjU2c3VtXSA9ICI5ZWRkZTBkYjQ3NjlkMmRjNjg1Nzk4
OTNmMjMwNmIyNmM2ZWNmYmUwZWY0OTliMDEzZDczMWI3YjkyNDdlMGI5IgogU1JDX1VSSVt4YXR0
ci0xLjYuMS5zaGEyNTZzdW1dID0gIjMyZTQ1YWQ0MjA2ZjZkMjQ3OTA4NTE0N2YwMmJjMmVmODM0
YWM4NTg4NjYyNGEyMzU3NWFlMTM3YzhhYTgxNTYiCiBTUkNfVVJJW3lva2UtMC44LjEuc2hhMjU2
c3VtXSA9ICI3MmQ2ZTVjNmFmYjg0ZDczOTQ0ZTVjZWRiMDUyYzQ2ODBkNTY1NzMzNzIwMTU1NWY5
ZjJhMTZiNzQwNmQ0OTU0IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXV2LWJ1aWxkXzAuMTIuMTMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMi4xNS5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4x
Mi4xMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2
LWJ1aWxkXzAuMTIuMTUuYmIKaW5kZXggNTFlODVkNWE4NS4uYzY3MzAxNzRkYyAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkXzAuMTIuMTMu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkXzAu
MTIuMTUuYmIKQEAgLTExLDcgKzExLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElD
RU5TRS1BUEFDSEU7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3IFwKICAgICAg
ICAgICAgICAgICAgICAgZmlsZTovL2NyYXRlcy91di1wZXA1MDgvTGljZW5zZS1BcGFjaGU7bWQ1
PWUyM2ZhZGQ2Y2VlZjhjNjE4ZmMxYzY1MTkxZDg0NmZhIFwKICAgICAgICAgICAgICAgICAgICAg
ZmlsZTovL2NyYXRlcy91di1wZXA1MDgvTGljZW5zZS1CU0Q7bWQ1PWVmN2E2MDI3ZGM0YzIzODli
OWFmYWQ3ZTY5MDI3NGM3IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDY5MzZhYjI0Yzg2NzRi
ZTI4ZGYyNzg0YTljYTI4Nzg0NzhhODRhOThlNmNlM2RmNWNiOTc2MTAyZTk5YjhmMSIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICJhZmQ1ODYwODlkMzAxZGYwNjgyMDRjZDQxMTE4MTdiZDlkNDc1ZWVi
ZGVhYjdlYTMyOWMzZmIxYTQ4YjRmYjdhIgogCiByZXF1aXJlICR7QlBOfS1jcmF0ZXMuaW5jCiAK
LS0gCjIuNDcuMQoK

--===============7300250817294069471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.12.13.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.14 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.7.0 crate://crates.io/astral-version-ranges/0.2.2 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.1 crate://crates.io/block-buffer/0.10.4 crate:
 //crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.6 crate://crates.io/clap_builder/4.6.6 crate://crates.io/clap_derive/4.6.4 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/const-oid/0.10.2 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.1 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crat
 es.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.17.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.33 crate://crates.io/futures-channel/0.3.33 crate://crates.io/futures-core/0.3.33 crate://crates.io/futures-executor/0.3.33 crate://c
 rates.io/futures-io/0.3.33 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.33 crate://crates.io/futures-sink/0.3.33 crate://crates.io/futures-task/0.3.33 crate://crates.io/futures-util/0.3.33 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.3.4 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.
 48.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.35 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.35 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.35 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4
 .7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1
  crate://crates.io/quote/1.0.47 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.26 crate://crates.io/ref-cast-impl/1.0.26 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.18 crate://crates.io/rkyv_derive/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.4 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/se
 rde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.5 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.3 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.14 crate://crates.io/tar-framing/0.0.14 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.
 16.2 crate://crates.io/thiserror/2.0.19 crate://crates.io/thiserror-impl/2.0.19 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/tokio-util/0.7.19 crate://crates.io/toml/1.1.3+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.13+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/
 1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.24.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-
 link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.
 53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.56 crate://crates.io/zerocopy-derive/0.8.56 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.12.15.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/ambient-authority/0.0.2 crate://crate
 s.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.14 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.7.0 crate://crates.io/astral-version-ranges/0.2.2 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://cr
 ates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.6 crate://crates.io/clap_builder/4.6.6 crate://crates.io/clap_derive/4.6.4 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/const-oid/0.10.2 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.1 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.17.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io
 /encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.34 crate://crates.io/futures-channel/0.3.34 crate://crates.io/futures-core/0.3.34 crate://crates.io/futures-executor/0.3.34 crate://crates.io/futures-io/0.3.34 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.34 crate://crates.io/futures-sink/0.3.34 crate://crates.io/futures-task/0.3.34 crate://crates.io/futures-util/0.3.34 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globse
 t/0.4.20 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.35 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-stati
 c/0.2.35 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.35 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate:
 //crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.26 crate://crates.io/ref-cast-impl/1.0.26 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/
 0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.18 crate://crates.io/rkyv_derive/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.4 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adle
 r32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.5 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.3 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.14 crate://crates.io/tar-framing/0.0.14 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.20 crate://crates.io/thiserror-impl/2.0.20 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/tokio-util/0.7.19 crate://crates.
 io/toml/1.1.3+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.13+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.24.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 
 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate:
 //crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.56 crate://crates.io/zerocopy-derive/0.8.56 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-d
 erive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.12.13" to "0.12.15"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.12.13 [default] to 0.12.15 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.12.13" to "0.12.15"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.12.13 [default] to 0.12.15 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.12.13" to "0.12.15"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.12.13 [default] to 0.12.15 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.12.13" to "0.12.15"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.12.13 [default] to 0.12.15 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.12.13" to "0.12.15"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.12.13 [default] to 0.12.15 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.12.13" to "0.12.15"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.12.13 [default] to 0.12.15 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.12.13" to "0.12.15"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.12.13 [default] to 0.12.15 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.13.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.12.15.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.13.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.12.15.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.12.13" to "0.12.15"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.12.13 [default] to 0.12.15 [default]
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.12.13.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.12.15.dist-info

--===============7300250817294069471==--

