Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015CFCCFA1C
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:13 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2349.1762384572388914338
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Uffjvo1b;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=BT9i7YjX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019a564e6c21-a1473abf-7a4b-4b63-8b6a-12665258109f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384571;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=V6rp7VeKQuvyRS6jLWbhJGJR2cV3yqtEwM/6NGWSqhY=;
	b=Uffjvo1bsJswitKGY8InA/olLRIRNzOnF3Pk5k6SE20BJVnzPyPh0BWn7onNUt31
	Fe+54zy1EpnYgKcA/hKeIphSrLWFh7AT513/7Lp2baVK3tAA4M3aNUQYueSKB2NNEj0
	1HICzJUVgvJCCnMRy3NrbpebGqg8dfQoTCZ2Z1GY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384571;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=V6rp7VeKQuvyRS6jLWbhJGJR2cV3yqtEwM/6NGWSqhY=;
	b=BT9i7YjXk7mXLJP4QbtUBfjsQ2H8ic7A6OvWU+aPVRZZY0N1SYsONJa0f95tj11g
	/bMTxPrLV+MEvpvtHtoSEc2aQA53rxbD/vRWZDDzms0fLAi8In6qtTibSBzmT2Mq5vK
	6OIFTG+7vJxoS2aXyM+PhSvRFaPPcghrT1Gt34B8=
Content-Type: multipart/mixed; boundary="===============8817045647411925922=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>, 
	Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors,python3-cryptography: upgrading to
 46.0.3,46.0.3 FAILED
Message-ID: <0101019a564e6c21-a1473abf-7a4b-4b63-8b6a-12665258109f-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225785

--===============8817045647411925922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography-vectors,python3-cryptography* to *46.0.3,46.0.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-cryptography-vectors-python3-cryptography-up.patch
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
From 9bdaf77753c48267e52aa4eafecee243f26c8c56 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 12:48:40 +0000
Subject: [PATCH] python3-cryptography-vectors,python3-cryptography: upgrade
 45.0.7 -> 46.0.3,45.0.7 -> 46.0.3

---
 .../python/python3-cryptography-common.inc    |  2 +-
 .../python/python3-cryptography-crates.inc    | 78 ++++++++++---------
 .../python/python3-cryptography-vectors.bb    |  2 +-
 .../python/python3-cryptography.bb            |  2 +-
 ...toml-remove-benchmark-disable-option.patch |  6 +-
 5 files changed, 46 insertions(+), 44 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index bcb907b645..24969828b1 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "45.0.7"
+PV = "46.0.3"
diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index e178790448..6e3667eef1 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -2,75 +2,77 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/asn1/0.21.3 \
-    crate://crates.io/asn1_derive/0.21.3 \
-    crate://crates.io/autocfg/1.4.0 \
+    crate://crates.io/asn1/0.22.0 \
+    crate://crates.io/asn1_derive/0.22.0 \
+    crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bitflags/2.9.1 \
-    crate://crates.io/cc/1.2.23 \
-    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/bitflags/2.9.4 \
+    crate://crates.io/cc/1.2.37 \
+    crate://crates.io/cfg-if/1.0.3 \
+    crate://crates.io/find-msvc-tools/0.1.1 \
     crate://crates.io/foreign-types/0.3.2 \
     crate://crates.io/foreign-types-shared/0.1.1 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/indoc/2.0.6 \
     crate://crates.io/itoa/1.0.15 \
-    crate://crates.io/libc/0.2.172 \
+    crate://crates.io/libc/0.2.175 \
     crate://crates.io/memoffset/0.9.1 \
     crate://crates.io/once_cell/1.21.3 \
-    crate://crates.io/openssl/0.10.72 \
+    crate://crates.io/openssl/0.10.74 \
     crate://crates.io/openssl-macros/0.1.1 \
-    crate://crates.io/openssl-sys/0.9.108 \
+    crate://crates.io/openssl-sys/0.9.110 \
     crate://crates.io/pem/3.0.5 \
     crate://crates.io/pkg-config/0.3.32 \
-    crate://crates.io/portable-atomic/1.11.0 \
-    crate://crates.io/proc-macro2/1.0.95 \
-    crate://crates.io/pyo3/0.25.0 \
-    crate://crates.io/pyo3-build-config/0.25.0 \
-    crate://crates.io/pyo3-ffi/0.25.0 \
-    crate://crates.io/pyo3-macros/0.25.0 \
-    crate://crates.io/pyo3-macros-backend/0.25.0 \
+    crate://crates.io/portable-atomic/1.11.1 \
+    crate://crates.io/proc-macro2/1.0.101 \
+    crate://crates.io/pyo3/0.26.0 \
+    crate://crates.io/pyo3-build-config/0.26.0 \
+    crate://crates.io/pyo3-ffi/0.26.0 \
+    crate://crates.io/pyo3-macros/0.26.0 \
+    crate://crates.io/pyo3-macros-backend/0.26.0 \
     crate://crates.io/quote/1.0.40 \
     crate://crates.io/self_cell/1.2.0 \
     crate://crates.io/shlex/1.3.0 \
-    crate://crates.io/syn/2.0.101 \
-    crate://crates.io/target-lexicon/0.13.2 \
-    crate://crates.io/unicode-ident/1.0.18 \
+    crate://crates.io/syn/2.0.106 \
+    crate://crates.io/target-lexicon/0.13.3 \
+    crate://crates.io/unicode-ident/1.0.19 \
     crate://crates.io/unindent/0.2.4 \
     crate://crates.io/vcpkg/0.2.15 \
 "
 
-SRC_URI[asn1-0.21.3.sha256sum] = "2d9c3502a6f1b50a2c69b97b71638a81ad3b21b9874604880401b9b2b0bf758f"
-SRC_URI[asn1_derive-0.21.3.sha256sum] = "1766ebcb519d8dd186d60dfa912571edcaa2c1f995e2e56643a261a87df69a61"
-SRC_URI[autocfg-1.4.0.sha256sum] = "ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26"
+SRC_URI[asn1-0.22.0.sha256sum] = "df42c2b01c5e1060b8281f67b4e5fb858260694916a667345a7305cd11e5dbfa"
+SRC_URI[asn1_derive-0.22.0.sha256sum] = "cdccf849b54365e3693e9a90ad36e4482b79937e6373ac8e2cf229c985187b21"
+SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bitflags-2.9.1.sha256sum] = "1b8e56985ec62d17e9c1001dc89c88ecd7dc08e47eba5ec7c29c7b5eeecde967"
-SRC_URI[cc-1.2.23.sha256sum] = "5f4ac86a9e5bc1e2b3449ab9d7d3a6a405e3d1bb28d7b9be8614f55846ae3766"
-SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[bitflags-2.9.4.sha256sum] = "2261d10cca569e4643e526d8dc2e62e433cc8aba21ab764233731f8d369bf394"
+SRC_URI[cc-1.2.37.sha256sum] = "65193589c6404eb80b450d618eaf9a2cafaaafd57ecce47370519ef674a7bd44"
+SRC_URI[cfg-if-1.0.3.sha256sum] = "2fd1289c04a9ea8cb22300a459a72a385d7c73d3259e2ed7dcb2af674838cfa9"
+SRC_URI[find-msvc-tools-0.1.1.sha256sum] = "7fd99930f64d146689264c637b5af2f0233a933bef0d8570e2526bf9e083192d"
 SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[indoc-2.0.6.sha256sum] = "f4c7245a08504955605670dbf141fceab975f15ca21570696aebe9d2e71576bd"
 SRC_URI[itoa-1.0.15.sha256sum] = "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
-SRC_URI[libc-0.2.172.sha256sum] = "d750af042f7ef4f724306de029d18836c26c1765a54a6a3f094cbd23a7267ffa"
+SRC_URI[libc-0.2.175.sha256sum] = "6a82ae493e598baaea5209805c49bbf2ea7de956d50d7da0da1164f9c6d28543"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
-SRC_URI[openssl-0.10.72.sha256sum] = "fedfea7d58a1f73118430a55da6a286e7b044961736ce96a16a17068ea25e5da"
+SRC_URI[openssl-0.10.74.sha256sum] = "24ad14dd45412269e1a30f52ad8f0664f0f4f4a89ee8fe28c3b3527021ebb654"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
-SRC_URI[openssl-sys-0.9.108.sha256sum] = "e145e1651e858e820e4860f7b9c5e169bc1d8ce1c86043be79fa7b7634821847"
+SRC_URI[openssl-sys-0.9.110.sha256sum] = "0a9f0075ba3c21b09f8e8b2026584b1d18d49388648f2fbbf3c97ea8deced8e2"
 SRC_URI[pem-3.0.5.sha256sum] = "38af38e8470ac9dee3ce1bae1af9c1671fffc44ddfd8bd1d0a3445bf349a8ef3"
 SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
-SRC_URI[portable-atomic-1.11.0.sha256sum] = "350e9b48cbc6b0e028b0473b114454c6316e57336ee184ceab6e53f72c178b3e"
-SRC_URI[proc-macro2-1.0.95.sha256sum] = "02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778"
-SRC_URI[pyo3-0.25.0.sha256sum] = "f239d656363bcee73afef85277f1b281e8ac6212a1d42aa90e55b90ed43c47a4"
-SRC_URI[pyo3-build-config-0.25.0.sha256sum] = "755ea671a1c34044fa165247aaf6f419ca39caa6003aee791a0df2713d8f1b6d"
-SRC_URI[pyo3-ffi-0.25.0.sha256sum] = "fc95a2e67091e44791d4ea300ff744be5293f394f1bafd9f78c080814d35956e"
-SRC_URI[pyo3-macros-0.25.0.sha256sum] = "a179641d1b93920829a62f15e87c0ed791b6c8db2271ba0fd7c2686090510214"
-SRC_URI[pyo3-macros-backend-0.25.0.sha256sum] = "9dff85ebcaab8c441b0e3f7ae40a6963ecea8a9f5e74f647e33fcf5ec9a1e89e"
+SRC_URI[portable-atomic-1.11.1.sha256sum] = "f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483"
+SRC_URI[proc-macro2-1.0.101.sha256sum] = "89ae43fd86e4158d6db51ad8e2b80f313af9cc74f5c0e03ccb87de09998732de"
+SRC_URI[pyo3-0.26.0.sha256sum] = "7ba0117f4212101ee6544044dae45abe1083d30ce7b29c4b5cbdfa2354e07383"
+SRC_URI[pyo3-build-config-0.26.0.sha256sum] = "4fc6ddaf24947d12a9aa31ac65431fb1b851b8f4365426e182901eabfb87df5f"
+SRC_URI[pyo3-ffi-0.26.0.sha256sum] = "025474d3928738efb38ac36d4744a74a400c901c7596199e20e45d98eb194105"
+SRC_URI[pyo3-macros-0.26.0.sha256sum] = "2e64eb489f22fe1c95911b77c44cc41e7c19f3082fc81cce90f657cdc42ffded"
+SRC_URI[pyo3-macros-backend-0.26.0.sha256sum] = "100246c0ecf400b475341b8455a9213344569af29a3c841d29270e53102e0fcf"
 SRC_URI[quote-1.0.40.sha256sum] = "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
 SRC_URI[self_cell-1.2.0.sha256sum] = "0f7d95a54511e0c7be3f51e8867aa8cf35148d7b9445d44de2f943e2b206e749"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
-SRC_URI[syn-2.0.101.sha256sum] = "8ce2b7fc941b3a24138a0a7cf8e858bfc6a992e7978a068a5c760deb0ed43caf"
-SRC_URI[target-lexicon-0.13.2.sha256sum] = "e502f78cdbb8ba4718f566c418c52bc729126ffd16baee5baa718cf25dd5a69a"
-SRC_URI[unicode-ident-1.0.18.sha256sum] = "5a5f39404a5da50712a4c1eecf25e90dd62b613502b7e925fd4e4d19b5c96512"
+SRC_URI[syn-2.0.106.sha256sum] = "ede7c438028d4436d71104916910f5bb611972c5cfd7f89b8300a8186e6fada6"
+SRC_URI[target-lexicon-0.13.3.sha256sum] = "df7f62577c25e07834649fc3b39fafdc597c0a3527dc1c60129201ccfcbaa50c"
+SRC_URI[unicode-ident-1.0.19.sha256sum] = "f63a545481291138910575129486daeaf8ac54aee4387fe7906919f7830c7d9d"
 SRC_URI[unindent-0.2.4.sha256sum] = "7264e107f553ccae879d21fbea1d6724ac785e8c3bfc762137959b5802826ef3"
 SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index e845486a94..3973638e44 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "48e71fc4ac5f6298b2de53a99726ddc4a9e5ef0a94d921820109e7b90baf9f56"
+SRC_URI[sha256sum] = "a23246fcb794fc87d814d1b4be20df74a299840a2430cc74651bc7ba0f3b548c"
 
 PYPI_PACKAGE = "cryptography_vectors"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 55fdf13972..b3b45cd172 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "4b1654dfc64ea479c242508eb8c724044f1e964a47d1d1cacc5132292d851971"
+SRC_URI[sha256sum] = "a8b17438104fed022ce745b362294d9ce35b4c2e45c1d958ad4a4b019285f4a1"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 16681e80a8..b0de0704c3 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From b033cd32813a104fb216135cdca7da7180912e56 Mon Sep 17 00:00:00 2001
+From 8fc8707535643131e81a0d862715e00e767af4d3 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,10 +26,10 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 4746201..df98351 100644
+index b3d8c31..6593057 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
-@@ -129,7 +129,7 @@ exclude = [
+@@ -134,7 +134,7 @@ exclude = [
  ]
  
  [tool.pytest.ini_options]
-- 
2.47.1


--===============8817045647411925922==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-vectors-python3-cryptography-up.patch"

RnJvbSA5YmRhZjc3NzUzYzQ4MjY3ZTUyYWE0ZWFmZWNlZTI0M2YyNmM4YzU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxMjo0ODo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMscHl0aG9uMy1jcnlwdG9ncmFwaHk6IHVwZ3JhZGUK
IDQ1LjAuNyAtPiA0Ni4wLjMsNDUuMC43IC0+IDQ2LjAuMwoKLS0tCiAuLi4vcHl0aG9uL3B5dGhv
bjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMgICAgfCAgMiArLQogLi4uL3B5dGhvbi9weXRob24z
LWNyeXB0b2dyYXBoeS1jcmF0ZXMuaW5jICAgIHwgNzggKysrKysrKysrKy0tLS0tLS0tLQogLi4u
L3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLmJiICAgIHwgIDIgKy0KIC4uLi9w
eXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkuYmIgICAgICAgICAgICB8ICAyICstCiAuLi50b21s
LXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2ggfCAgNiArLQogNSBmaWxlcyBj
aGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspLCA0NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5p
bmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNv
bW1vbi5pbmMKaW5kZXggYmNiOTA3YjY0NS4uMjQ5Njk4MjhiMSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY29t
bW9uLmluYwpAQCAtMyw0ICszLDQgQEAKICMKICMgQWRkaXRpb25hbGx5IEFVSCB3aWxsIGRldGVj
dCB0aGF0IHRoZXkgc2hhcmUgdGhpcyAuaW5jIGZpbGUgYW5kCiAjIHBlcmZvcm0gYSBsb2Nrc3Rl
cCB1cGdyYWRlIGZvciBib3RoLgotUFYgPSAiNDUuMC43IgorUFYgPSAiNDYuMC4zIgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1j
cmF0ZXMuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dy
YXBoeS1jcmF0ZXMuaW5jCmluZGV4IGUxNzg3OTA0NDguLjZlMzY2N2VlZjEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY3JhdGVz
LmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3Jh
cGh5LWNyYXRlcy5pbmMKQEAgLTIsNzUgKzIsNzcgQEAKIAogIyBmcm9tIENhcmdvLmxvY2sKIFNS
Q19VUkkgKz0gIiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXNuMS8wLjIxLjMgXAotICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2FzbjFfZGVyaXZlLzAuMjEuMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vYXV0b2NmZy8xLjQuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXNuMS8wLjIyLjAgXAor
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FzbjFfZGVyaXZlLzAuMjIuMCBcCisgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vYXV0b2NmZy8xLjUuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYmFzZTY0LzAu
MjIuMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYml0ZmxhZ3MvMi45LjEgXAotICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2NjLzEuMi4yMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2ZnLWlmLzEu
MC4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9iaXRmbGFncy8yLjkuNCBcCisgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vY2MvMS4yLjM3IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9jZmctaWYvMS4w
LjMgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ZpbmQtbXN2Yy10b29scy8wLjEuMSBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vZm9yZWlnbi10eXBlcy8wLjMuMiBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vZm9yZWlnbi10eXBlcy1zaGFyZWQvMC4xLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2hlY2svMC41LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2luZG9jLzIuMC42IFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9pdG9hLzEuMC4xNSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGli
Yy8wLjIuMTcyIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9saWJjLzAuMi4xNzUgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL21lbW9mZnNldC8wLjkuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
b25jZV9jZWxsLzEuMjEuMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb3BlbnNzbC8wLjEwLjcy
IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9vcGVuc3NsLzAuMTAuNzQgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL29wZW5zc2wtbWFjcm9zLzAuMS4xIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9v
cGVuc3NsLXN5cy8wLjkuMTA4IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9vcGVuc3NsLXN5cy8w
LjkuMTEwIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9wZW0vMy4wLjUgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3BrZy1jb25maWcvMC4zLjMyIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9wb3J0
YWJsZS1hdG9taWMvMS4xMS4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9wcm9jLW1hY3JvMi8x
LjAuOTUgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMvMC4yNS4wIFwKLSAgICBjcmF0ZTov
L2NyYXRlcy5pby9weW8zLWJ1aWxkLWNvbmZpZy8wLjI1LjAgXAotICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3B5bzMtZmZpLzAuMjUuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3Mv
MC4yNS4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy1iYWNrZW5kLzAuMjUu
MCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcG9ydGFibGUtYXRvbWljLzEuMTEuMSBcCisgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcHJvYy1tYWNybzIvMS4wLjEwMSBcCisgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vcHlvMy8wLjI2LjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtYnVpbGQtY29u
ZmlnLzAuMjYuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1mZmkvMC4yNi4wIFwKKyAg
ICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy8wLjI2LjAgXAorICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3B5bzMtbWFjcm9zLWJhY2tlbmQvMC4yNi4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9xdW90ZS8xLjAuNDAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlbGZfY2VsbC8xLjIuMCBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2hsZXgvMS4zLjAgXAotICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3N5bi8yLjAuMTAxIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby90YXJnZXQtbGV4aWNvbi8w
LjEzLjIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUtaWRlbnQvMS4wLjE4IFwKKyAg
ICBjcmF0ZTovL2NyYXRlcy5pby9zeW4vMi4wLjEwNiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
dGFyZ2V0LWxleGljb24vMC4xMy4zIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby91bmljb2RlLWlk
ZW50LzEuMC4xOSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdW5pbmRlbnQvMC4yLjQgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3ZjcGtnLzAuMi4xNSBcCiAiCiAKLVNSQ19VUklbYXNuMS0wLjIx
LjMuc2hhMjU2c3VtXSA9ICIyZDljMzUwMmE2ZjFiNTBhMmM2OWI5N2I3MTYzOGE4MWFkM2IyMWI5
ODc0NjA0ODgwNDAxYjliMmIwYmY3NThmIgotU1JDX1VSSVthc24xX2Rlcml2ZS0wLjIxLjMuc2hh
MjU2c3VtXSA9ICIxNzY2ZWJjYjUxOWQ4ZGQxODZkNjBkZmE5MTI1NzFlZGNhYTJjMWY5OTVlMmU1
NjY0M2EyNjFhODdkZjY5YTYxIgotU1JDX1VSSVthdXRvY2ZnLTEuNC4wLnNoYTI1NnN1bV0gPSAi
YWNlNTBiYWRlOGU2MjM0YWExNDBkOWEyZjU1MmJiZWUxZGI0ZDM1M2Y2OWI4MjE3YmM1MDM0OTBm
YzFhOWYyNiIKK1NSQ19VUklbYXNuMS0wLjIyLjAuc2hhMjU2c3VtXSA9ICJkZjQyYzJiMDFjNWUx
MDYwYjgyODFmNjdiNGU1ZmI4NTgyNjA2OTQ5MTZhNjY3MzQ1YTczMDVjZDExZTVkYmZhIgorU1JD
X1VSSVthc24xX2Rlcml2ZS0wLjIyLjAuc2hhMjU2c3VtXSA9ICJjZGNjZjg0OWI1NDM2NWUzNjkz
ZTlhOTBhZDM2ZTQ0ODJiNzk5MzdlNjM3M2FjOGUyY2YyMjljOTg1MTg3YjIxIgorU1JDX1VSSVth
dXRvY2ZnLTEuNS4wLnNoYTI1NnN1bV0gPSAiYzA4NjA2ZjhjM2NiZjRjZTZlYzhlMjhmYjAwMTRh
MmMwODY3MDhmZTk1NGVhYTg4NTM4NGE2MTY1MTcyZTdlOCIKIFNSQ19VUklbYmFzZTY0LTAuMjIu
MS5zaGEyNTZzdW1dID0gIjcyYjMyNTRmMTYyNTFhODM4MWFhMTJlNDBlM2M0ZDJmMDE5OWY4YzY1
MDhmYmVjYjlkOTFmNTc1ZTBmYmI4YzYiCi1TUkNfVVJJW2JpdGZsYWdzLTIuOS4xLnNoYTI1NnN1
bV0gPSAiMWI4ZTU2OTg1ZWM2MmQxN2U5YzEwMDFkYzg5Yzg4ZWNkN2RjMDhlNDdlYmE1ZWM3YzI5
YzdiNWVlZWNkZTk2NyIKLVNSQ19VUklbY2MtMS4yLjIzLnNoYTI1NnN1bV0gPSAiNWY0YWM4NmE5
ZTViYzFlMmIzNDQ5YWI5ZDdkM2E2YTQwNWUzZDFiYjI4ZDdiOWJlODYxNGY1NTg0NmFlMzc2NiIK
LVNSQ19VUklbY2ZnLWlmLTEuMC4wLnNoYTI1NnN1bV0gPSAiYmFmMWRlNDMzOTc2MTU4OGJjMDYx
OWUzY2JjMDEyMGVlNTgyZWJiNzRiNTNiNGVmYmY3OTExN2JkMmRhNDBmZCIKK1NSQ19VUklbYml0
ZmxhZ3MtMi45LjQuc2hhMjU2c3VtXSA9ICIyMjYxZDEwY2NhNTY5ZTQ2NDNlNTI2ZDhkYzJlNjJl
NDMzY2M4YWJhMjFhYjc2NDIzMzczMWY4ZDM2OWJmMzk0IgorU1JDX1VSSVtjYy0xLjIuMzcuc2hh
MjU2c3VtXSA9ICI2NTE5MzU4OWM2NDA0ZWI4MGI0NTBkNjE4ZWFmOWEyY2FmYWFhZmQ1N2VjY2U0
NzM3MDUxOWVmNjc0YTdiZDQ0IgorU1JDX1VSSVtjZmctaWYtMS4wLjMuc2hhMjU2c3VtXSA9ICIy
ZmQxMjg5YzA0YTllYThjYjIyMzAwYTQ1OWE3MmEzODVkN2M3M2QzMjU5ZTJlZDdkY2IyYWY2NzQ4
MzhjZmE5IgorU1JDX1VSSVtmaW5kLW1zdmMtdG9vbHMtMC4xLjEuc2hhMjU2c3VtXSA9ICI3ZmQ5
OTkzMGY2NGQxNDY2ODkyNjRjNjM3YjVhZjJmMDIzM2E5MzNiZWYwZDg1NzBlMjUyNmJmOWUwODMx
OTJkIgogU1JDX1VSSVtmb3JlaWduLXR5cGVzLTAuMy4yLnNoYTI1NnN1bV0gPSAiZjZmMzM5ZWI4
YWRjMDUyY2QyY2E3ODkxMGZkYTg2OWFlZmEzOGQyMmQ1Y2I2NDhlNjQ4NWU0ZDNmYzA2ZjNiMSIK
IFNSQ19VUklbZm9yZWlnbi10eXBlcy1zaGFyZWQtMC4xLjEuc2hhMjU2c3VtXSA9ICIwMGIwMjI4
NDExOTA4Y2E4Njg1ZGJhN2ZjMmNkZDcwZWM5OTkwYTZlNzUzZTg5YjZhYzkxYTg0YzQwZmJhZjRi
IgogU1JDX1VSSVtoZWNrLTAuNS4wLnNoYTI1NnN1bV0gPSAiMjMwNGUwMDk4M2Y4N2ZmYjM4YjU1
YjQ0NGI1ZTNiNjBhODg0YjVkMzBjMGZjYTdkODJmZTMzNDQ5YmJlNTVlYSIKIFNSQ19VUklbaW5k
b2MtMi4wLjYuc2hhMjU2c3VtXSA9ICJmNGM3MjQ1YTA4NTA0OTU1NjA1NjcwZGJmMTQxZmNlYWI5
NzVmMTVjYTIxNTcwNjk2YWViZTlkMmU3MTU3NmJkIgogU1JDX1VSSVtpdG9hLTEuMC4xNS5zaGEy
NTZzdW1dID0gIjRhNWYxM2I4NThjOGQzMTRlZTNlOGY2MzkwMTFmN2NjZWZlNzFmOTdmOTZlNTAx
NTFmYjk5MWYyNjc5MjhlMmMiCi1TUkNfVVJJW2xpYmMtMC4yLjE3Mi5zaGEyNTZzdW1dID0gImQ3
NTBhZjA0MmY3ZWY0ZjcyNDMwNmRlMDI5ZDE4ODM2YzI2YzE3NjVhNTRhNmEzZjA5NGNiZDIzYTcy
NjdmZmEiCitTUkNfVVJJW2xpYmMtMC4yLjE3NS5zaGEyNTZzdW1dID0gIjZhODJhZTQ5M2U1OThi
YWFlYTUyMDk4MDVjNDliYmYyZWE3ZGU5NTZkNTBkN2RhMGRhMTE2NGY5YzZkMjg1NDMiCiBTUkNf
VVJJW21lbW9mZnNldC0wLjkuMS5zaGEyNTZzdW1dID0gIjQ4ODAxNmJmYWU0NTdiMDM2ZDk5NjA5
MmY2Y2I0NDg2Nzc2MTFjZTQ0NDllOTcwY2VhZjQyNjk1MjAzZjIxOGEiCiBTUkNfVVJJW29uY2Vf
Y2VsbC0xLjIxLjMuc2hhMjU2c3VtXSA9ICI0MmY1ZTE1Yzk5NTNjNWU0Y2NjZWViMmU3MzgyYTcx
NjQ4MmMzNDUxNTMxNWY3YjAzNTMyYjhiNGU4MzkzZDJkIgotU1JDX1VSSVtvcGVuc3NsLTAuMTAu
NzIuc2hhMjU2c3VtXSA9ICJmZWRmZWE3ZDU4YTFmNzMxMTg0MzBhNTVkYTZhMjg2ZTdiMDQ0OTYx
NzM2Y2U5NmExNmExNzA2OGVhMjVlNWRhIgorU1JDX1VSSVtvcGVuc3NsLTAuMTAuNzQuc2hhMjU2
c3VtXSA9ICIyNGFkMTRkZDQ1NDEyMjY5ZTFhMzBmNTJhZDhmMDY2NGYwZjRmNGE4OWVlOGZlMjhj
M2IzNTI3MDIxZWJiNjU0IgogU1JDX1VSSVtvcGVuc3NsLW1hY3Jvcy0wLjEuMS5zaGEyNTZzdW1d
ID0gImE5NDg2NjZiNjM3YTBmNDY1ZTg1NjRjNzNlODlkNGRkZTAwZDcyZDRkNDczY2M5NzJmMzkw
ZmMzZGNlZTdkOWMiCi1TUkNfVVJJW29wZW5zc2wtc3lzLTAuOS4xMDguc2hhMjU2c3VtXSA9ICJl
MTQ1ZTE2NTFlODU4ZTgyMGU0ODYwZjdiOWM1ZTE2OWJjMWQ4Y2UxYzg2MDQzYmU3OWZhN2I3NjM0
ODIxODQ3IgorU1JDX1VSSVtvcGVuc3NsLXN5cy0wLjkuMTEwLnNoYTI1NnN1bV0gPSAiMGE5ZjAw
NzViYTNjMjFiMDlmOGU4YjIwMjY1ODRiMWQxOGQ0OTM4ODY0OGYyZmJiZjNjOTdlYThkZWNlZDhl
MiIKIFNSQ19VUklbcGVtLTMuMC41LnNoYTI1NnN1bV0gPSAiMzhhZjM4ZTg0NzBhYzlkZWUzY2Ux
YmFlMWFmOWMxNjcxZmZmYzQ0ZGRmZDhiZDFkMGEzNDQ1YmYzNDlhOGVmMyIKIFNSQ19VUklbcGtn
LWNvbmZpZy0wLjMuMzIuc2hhMjU2c3VtXSA9ICI3ZWRkZGJkMGI1MmQ3MzJiMjFhZDlhNWZhYjVj
NzA0YzE0Y2Q5NDllNWU5YTFlYzU5MjlhMjRmZGVkMWI5MDRjIgotU1JDX1VSSVtwb3J0YWJsZS1h
dG9taWMtMS4xMS4wLnNoYTI1NnN1bV0gPSAiMzUwZTliNDhjYmM2YjBlMDI4YjA0NzNiMTE0NDU0
YzYzMTZlNTczMzZlZTE4NGNlYWI2ZTUzZjcyYzE3OGIzZSIKLVNSQ19VUklbcHJvYy1tYWNybzIt
MS4wLjk1LnNoYTI1NnN1bV0gPSAiMDJiM2U1ZTY4YTNhMWEwMmFhZDNlYzQ5MGE5ODAwN2NiYzEz
YzM3Y2JlODRhM2NkN2I4ZTQwNmQ3NmU3Zjc3OCIKLVNSQ19VUklbcHlvMy0wLjI1LjAuc2hhMjU2
c3VtXSA9ICJmMjM5ZDY1NjM2M2JjZWU3M2FmZWY4NTI3N2YxYjI4MWU4YWM2MjEyYTFkNDJhYTkw
ZTU1YjkwZWQ0M2M0N2E0IgotU1JDX1VSSVtweW8zLWJ1aWxkLWNvbmZpZy0wLjI1LjAuc2hhMjU2
c3VtXSA9ICI3NTVlYTY3MWExYzM0MDQ0ZmExNjUyNDdhYWY2ZjQxOWNhMzljYWE2MDAzYWVlNzkx
YTBkZjI3MTNkOGYxYjZkIgotU1JDX1VSSVtweW8zLWZmaS0wLjI1LjAuc2hhMjU2c3VtXSA9ICJm
Yzk1YTJlNjcwOTFlNDQ3OTFkNGVhMzAwZmY3NDRiZTUyOTNmMzk0ZjFiYWZkOWY3OGMwODA4MTRk
MzU5NTZlIgotU1JDX1VSSVtweW8zLW1hY3Jvcy0wLjI1LjAuc2hhMjU2c3VtXSA9ICJhMTc5NjQx
ZDFiOTM5MjA4MjlhNjJmMTVlODdjMGVkNzkxYjZjOGRiMjI3MWJhMGZkN2MyNjg2MDkwNTEwMjE0
IgotU1JDX1VSSVtweW8zLW1hY3Jvcy1iYWNrZW5kLTAuMjUuMC5zaGEyNTZzdW1dID0gIjlkZmY4
NWViY2FhYjhjNDQxYjBlM2Y3YWU0MGE2OTYzZWNlYThhOWY1ZTc0ZjY0N2UzM2ZjZjVlYzlhMWU4
OWUiCitTUkNfVVJJW3BvcnRhYmxlLWF0b21pYy0xLjExLjEuc2hhMjU2c3VtXSA9ICJmODQyNjdi
MjBhMTZlYTkxOGU0M2M2YTg4NDMzYzJkNTRmYTE0NWM5MmE4MTFiNWIwNDdjY2JlMTUzNjc0NDgz
IgorU1JDX1VSSVtwcm9jLW1hY3JvMi0xLjAuMTAxLnNoYTI1NnN1bV0gPSAiODlhZTQzZmQ4NmU0
MTU4ZDZkYjUxYWQ4ZTJiODBmMzEzYWY5Y2M3NGY1YzBlMDNjY2I4N2RlMDk5OTg3MzJkZSIKK1NS
Q19VUklbcHlvMy0wLjI2LjAuc2hhMjU2c3VtXSA9ICI3YmEwMTE3ZjQyMTIxMDFlZTY1NDQwNDRk
YWU0NWFiZTEwODNkMzBjZTdiMjljNGI1Y2JkZmEyMzU0ZTA3MzgzIgorU1JDX1VSSVtweW8zLWJ1
aWxkLWNvbmZpZy0wLjI2LjAuc2hhMjU2c3VtXSA9ICI0ZmM2ZGRhZjI0OTQ3ZDEyYTlhYTMxYWM2
NTQzMWZiMWI4NTFiOGY0MzY1NDI2ZTE4MjkwMWVhYmZiODdkZjVmIgorU1JDX1VSSVtweW8zLWZm
aS0wLjI2LjAuc2hhMjU2c3VtXSA9ICIwMjU0NzRkMzkyODczOGVmYjM4YWMzNmQ0NzQ0YTc0YTQw
MGM5MDFjNzU5NjE5OWUyMGU0NWQ5OGViMTk0MTA1IgorU1JDX1VSSVtweW8zLW1hY3Jvcy0wLjI2
LjAuc2hhMjU2c3VtXSA9ICIyZTY0ZWI0ODlmMjJmZTFjOTU5MTFiNzdjNDRjYzQxZTdjMTlmMzA4
MmZjODFjY2U5MGY2NTdjZGM0MmZmZGVkIgorU1JDX1VSSVtweW8zLW1hY3Jvcy1iYWNrZW5kLTAu
MjYuMC5zaGEyNTZzdW1dID0gIjEwMDI0NmMwZWNmNDAwYjQ3NTM0MWI4NDU1YTkyMTMzNDQ1Njlh
ZjI5YTNjODQxZDI5MjcwZTUzMTAyZTBmY2YiCiBTUkNfVVJJW3F1b3RlLTEuMC40MC5zaGEyNTZz
dW1dID0gIjE4ODVjMDM5NTcwZGMwMGRjYjRmZjA4N2E4OWUxODVmZDU2YmFlMjM0ZGRjN2YwNTZh
OTQ1YmYzNjQ2NzI0OGQiCiBTUkNfVVJJW3NlbGZfY2VsbC0xLjIuMC5zaGEyNTZzdW1dID0gIjBm
N2Q5NWE1NDUxMWUwYzdiZTNmNTFlODg2N2FhOGNmMzUxNDhkN2I5NDQ1ZDQ0ZGUyZjk0M2UyYjIw
NmU3NDkiCiBTUkNfVVJJW3NobGV4LTEuMy4wLnNoYTI1NnN1bV0gPSAiMGZkYTJmZjBkMDg0MDE5
YmE0ZDdjNmYzNzFjOTVkOGZkNzVjZTM1MjRjM2NiOGZiNjUzYTMwMjNmNjMyM2U2NCIKLVNSQ19V
Uklbc3luLTIuMC4xMDEuc2hhMjU2c3VtXSA9ICI4Y2UyYjdmYzk0MWIzYTI0MTM4YTBhN2NmOGU4
NThiZmM2YTk5MmU3OTc4YTA2OGE1Yzc2MGRlYjBlZDQzY2FmIgotU1JDX1VSSVt0YXJnZXQtbGV4
aWNvbi0wLjEzLjIuc2hhMjU2c3VtXSA9ICJlNTAyZjc4Y2RiYjhiYTQ3MThmNTY2YzQxOGM1MmJj
NzI5MTI2ZmZkMTZiYWVlNWJhYTcxOGNmMjVkZDVhNjlhIgotU1JDX1VSSVt1bmljb2RlLWlkZW50
LTEuMC4xOC5zaGEyNTZzdW1dID0gIjVhNWYzOTQwNGE1ZGE1MDcxMmE0YzFlZWNmMjVlOTBkZDYy
YjYxMzUwMmI3ZTkyNWZkNGU0ZDE5YjVjOTY1MTIiCitTUkNfVVJJW3N5bi0yLjAuMTA2LnNoYTI1
NnN1bV0gPSAiZWRlN2M0MzgwMjhkNDQzNmQ3MTEwNDkxNjkxMGY1YmI2MTE5NzJjNWNmZDdmODli
ODMwMGE4MTg2ZTZmYWRhNiIKK1NSQ19VUklbdGFyZ2V0LWxleGljb24tMC4xMy4zLnNoYTI1NnN1
bV0gPSAiZGY3ZjYyNTc3YzI1ZTA3ODM0NjQ5ZmMzYjM5ZmFmZGM1OTdjMGEzNTI3ZGMxYzYwMTI5
MjAxY2NmY2JhYTUwYyIKK1NSQ19VUklbdW5pY29kZS1pZGVudC0xLjAuMTkuc2hhMjU2c3VtXSA9
ICJmNjNhNTQ1NDgxMjkxMTM4OTEwNTc1MTI5NDg2ZGFlYWY4YWM1NGFlZTQzODdmZTc5MDY5MTlm
NzgzMGM3ZDlkIgogU1JDX1VSSVt1bmluZGVudC0wLjIuNC5zaGEyNTZzdW1dID0gIjcyNjRlMTA3
ZjU1M2NjYWU4NzlkMjFmYmVhMWQ2NzI0YWM3ODVlOGMzYmZjNzYyMTM3OTU5YjU4MDI4MjZlZjMi
CiBTUkNfVVJJW3ZjcGtnLTAuMi4xNS5zaGEyNTZzdW1dID0gImFjY2Q0ZWE2MmY3YmI3YTgyZmUy
MzA2NmZiMDk1N2Q0OGVmNjc3ZjZlZWI4MjE1ZjM3MmY1MmU0OGJiMzI0MjYiCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3Rv
cnMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5
LXZlY3RvcnMuYmIKaW5kZXggZTg0NTQ4NmE5NC4uMzk3MzYzOGU0NCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkt
dmVjdG9ycy5iYgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElD
RU5TRTttZDU9OGMzNjE3ZGI0ZmI2ZmFlMDFmMWQyNTNhYjkxNTExZTQgXAogIyBOT1RFOiBNYWtl
IHN1cmUgdG8ga2VlcCB0aGlzIHJlY2lwZSBhdCB0aGUgc2FtZSB2ZXJzaW9uIGFzIHB5dGhvbjMt
Y3J5cHRvZ3JhcGh5CiAjICAgICAgIFVwZ3JhZGUgYm90aCByZWNpcGVzIGF0IHRoZSBzYW1lIHRp
bWUKIHJlcXVpcmUgcHl0aG9uMy1jcnlwdG9ncmFwaHktY29tbW9uLmluYwotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjQ4ZTcxZmM0YWM1ZjYyOThiMmRlNTNhOTk3MjZkZGM0YTllNWVmMGE5NGQ5MjE4
MjAxMDllN2I5MGJhZjlmNTYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTIzMjQ2ZmNiNzk0ZmM4
N2Q4MTRkMWI0YmUyMGRmNzRhMjk5ODQwYTI0MzBjYzc0NjUxYmM3YmEwZjNiNTQ4YyIKIAogUFlQ
SV9QQUNLQUdFID0gImNyeXB0b2dyYXBoeV92ZWN0b3JzIgogVVBTVFJFQU1fQ0hFQ0tfUFlQSV9Q
QUNLQUdFID0gIiR7UFlQSV9QQUNLQUdFfSIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJiCmluZGV4IDU1ZmRmMTM5NzIuLmIzYjQ1
Y2QxNzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1j
cnlwdG9ncmFwaHkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWNyeXB0b2dyYXBoeS5iYgpAQCAtMTEsNyArMTEsNyBAQCBMRFNIQVJFRCArPSAiLXB0aHJlYWQi
CiAjIE5PVEU6IE1ha2Ugc3VyZSB0byBrZWVwIHRoaXMgcmVjaXBlIGF0IHRoZSBzYW1lIHZlcnNp
b24gYXMgcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycwogIyAgICAgICBVcGdyYWRlIGJvdGgg
cmVjaXBlcyBhdCB0aGUgc2FtZSB0aW1lCiByZXF1aXJlIHB5dGhvbjMtY3J5cHRvZ3JhcGh5LWNv
bW1vbi5pbmMKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0YjE2NTRkZmM2NGVhNDc5YzI0MjUwOGVi
OGM3MjQwNDRmMWU5NjRhNDdkMWQxY2FjYzUxMzIyOTJkODUxOTcxIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImE4YjE3NDM4MTA0ZmVkMDIyY2U3NDViMzYyMjk0ZDljZTM1YjRjMmU0NWMxZDk1OGFk
NGE0YjAxOTI4NWY0YTEiCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLXB5cHJvamVjdC50b21s
LXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2ggXAogICAgICAgICAgICAgZmls
ZTovL2NoZWNrLW1lbWZyZWUucHkgXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1i
ZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNo
bWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaAppbmRleCAxNjY4MWU4MGE4Li5iMGRlMDcwNGMzIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3Jh
cGh5LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3Jh
cGh5LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYjAzM2NkMzI4MTNhMTA0ZmIyMTYxMzVjZGNhN2Rh
NzE4MDkxMmU1NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOGZjODcwNzUzNTY0MzEz
MWU4MWEwZDg2MjcxNWUwMGU3NjdhZjRkMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IE1pbmdsaSBZdSA8bWluZ2xpLnl1QHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE3IE1heSAy
MDIyIDE3OjIyOjQ4ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHB5cHJvamVjdC50b21sOiByZW1v
dmUgLS1iZW5jaG1hcmstZGlzYWJsZSBvcHRpb24KQEAgLTI2LDEwICsyNiwxMCBAQCBTaWduZWQt
b2ZmLWJ5OiBUaW0gT3JsaW5nIDx0aW0ub3JsaW5nQGtvbnN1bGtvLmNvbT4KICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3B5cHJv
amVjdC50b21sIGIvcHlwcm9qZWN0LnRvbWwKLWluZGV4IDQ3NDYyMDEuLmRmOTgzNTEgMTAwNjQ0
CitpbmRleCBiM2Q4YzMxLi42NTkzMDU3IDEwMDY0NAogLS0tIGEvcHlwcm9qZWN0LnRvbWwKICsr
KyBiL3B5cHJvamVjdC50b21sCi1AQCAtMTI5LDcgKzEyOSw3IEBAIGV4Y2x1ZGUgPSBbCitAQCAt
MTM0LDcgKzEzNCw3IEBAIGV4Y2x1ZGUgPSBbCiAgXQogIAogIFt0b29sLnB5dGVzdC5pbmlfb3B0
aW9uc10KLS0gCjIuNDcuMQoK

--===============8817045647411925922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1948 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (946 cached, 2 parsed). 1945 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-8c05e67c5a009e9ff20611653fdf818ca1aa6170"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:8c05e67c5a009e9ff20611653fdf818ca1aa6170"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 475 Local 452 Mirrors 0 Missed 23 Current 576 (95% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 927 of 1051 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1003 of 1051 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_recipe_qa_setscene)
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-46.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1051 of 1051 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_recipe_qa_setscene)
NOTE: recipe python3-cryptography-46.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1564 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_fetch)
NOTE: Running task 1970 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_fetch)
NOTE: recipe python3-cryptography-46.0.3-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 2391 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_unpack)
NOTE: Running task 2392 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 2872 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_patch)
NOTE: Running task 2873 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_patch: Succeeded
NOTE: Running task 2875 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_configure)
NOTE: Running task 2876 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_populate_lic)
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_configure: Succeeded
NOTE: Running task 2877 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-cryptography-vectors/46.0.3/recipe-sysroot-native/usr/lib/python3.13/site-packages/pyproject_hooks/_impl.py", line 402, in _call_hook
|     raise BackendUnavailable(
|     ...<4 lines>...
|     )
| pyproject_hooks._impl.BackendUnavailable: Cannot import 'uv_build'
| 
| ERROR Backend 'uv_build' is not available.
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-cryptography-vectors/46.0.3/temp/run.do_compile.3564321:158 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-cryptography-vectors/46.0.3/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-cryptography-vectors/46.0.3/sources/cryptography_vectors-46.0.3'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-cryptography-vectors/46.0.3/temp/run.do_compile.3564321, line 158
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-cryptography-vectors/46.0.3/temp/run.do_compile.3564321, line 153
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-cryptography-vectors/46.0.3/temp/run.do_compile.3564321, line 169
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_compile: Failed
NOTE: recipe python3-cryptography-46.0.3-r0: task do_fetch: Succeeded
NOTE: Tasks Summary: Attempted 2877 tasks of which 2868 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105124823.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105124823.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-cryptography-vectors/46.0.3/temp/log.do_compile.3564321
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-cryptography-vectors-46.0.3-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-cryptography-vectors/46.0.3/temp/run.do_compile.3564321' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-cryptography-vectors/46.0.3/temp/log.do_compile.3564321
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_compile) failed with exit code '1'

--===============8817045647411925922==--

