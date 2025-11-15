Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11E8CEBF6B
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:40 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11928.1763224711617854114
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IiCmWDwh;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hOMh2D7P;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019a8861ef38-9b849c86-645d-40e1-abda-2039a42c06a8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224711;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=luNxtoRoYsfOJ22DT5NxmEcBcZcReJLM9TCMzHBeJ3c=;
	b=IiCmWDwhfH79D5Pv8HNor4ns67o6yAq0uSVU/GtKfQIjZL1dwN2PTC4bUh/82fmk
	Ogs5HnWcWOMjEh6OUWTvdPhL8jgsQFJgWDCqSetUBr6/mf7r32+4yTeuMjXu72FpWcg
	q7kaMyqdV/489zEQ/Ty0Vkih+q5TCOcTbPZuBP+k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224711;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=luNxtoRoYsfOJ22DT5NxmEcBcZcReJLM9TCMzHBeJ3c=;
	b=hOMh2D7PlCF5+5wrCiUNdJD0vW1igfH3pJxk/Tlt7StydVz3U/Rwy0PX3t8qm9O9
	dTrxE8zYWzix7Y207hV4NoBMBLPbhRUIeMYnl+I4rUOFTrsr6xaCTshsod91B5TGkXM
	XFfOAk/MJ22jCCcf/CnUS1C3DpRs7emHILXAtNVE=
Content-Type: multipart/mixed; boundary="===============5162108987861509320=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>, 
	Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography,python3-cryptography-vectors: upgrading to
 46.0.3,46.0.3 FAILED
Message-ID: <0101019a8861ef38-9b849c86-645d-40e1-abda-2039a42c06a8-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226310

--===============5162108987861509320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography,python3-cryptography-vectors* to *46.0.3,46.0.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-cryptography-python3-cryptography-vectors-up.patch
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
From c395f0f514e66741ccdd265d5db625432c2775ff Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 06:21:29 +0000
Subject: [PATCH] python3-cryptography,python3-cryptography-vectors: upgrade
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
index 16681e80a8..aba8e49e66 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From b033cd32813a104fb216135cdca7da7180912e56 Mon Sep 17 00:00:00 2001
+From 492701269bc9ab757e4c233f245e85ea0219b282 Mon Sep 17 00:00:00 2001
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


--===============5162108987861509320==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-python3-cryptography-vectors-up.patch"

RnJvbSBjMzk1ZjBmNTE0ZTY2NzQxY2NkZDI2NWQ1ZGI2MjU0MzJjMjc3NWZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDY6MjE6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeSxweXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzOiB1cGdyYWRl
CiA0NS4wLjcgLT4gNDYuMC4zLDQ1LjAuNyAtPiA0Ni4wLjMKCi0tLQogLi4uL3B5dGhvbi9weXRo
b24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jICAgIHwgIDIgKy0KIC4uLi9weXRob24vcHl0aG9u
My1jcnlwdG9ncmFwaHktY3JhdGVzLmluYyAgICB8IDc4ICsrKysrKysrKystLS0tLS0tLS0KIC4u
Li9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy5iYiAgICB8ICAyICstCiAuLi4v
cHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJiICAgICAgICAgICAgfCAgMiArLQogLi4udG9t
bC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoIHwgIDYgKy0KIDUgZmlsZXMg
Y2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKSwgNDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24u
aW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1j
b21tb24uaW5jCmluZGV4IGJjYjkwN2I2NDUuLjI0OTY5ODI4YjEgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY29tbW9uLmluYwor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNv
bW1vbi5pbmMKQEAgLTMsNCArMyw0IEBACiAjCiAjIEFkZGl0aW9uYWxseSBBVUggd2lsbCBkZXRl
Y3QgdGhhdCB0aGV5IHNoYXJlIHRoaXMgLmluYyBmaWxlIGFuZAogIyBwZXJmb3JtIGEgbG9ja3N0
ZXAgdXBncmFkZSBmb3IgYm90aC4KLVBWID0gIjQ1LjAuNyIKK1BWID0gIjQ2LjAuMyIKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkt
Y3JhdGVzLmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9n
cmFwaHktY3JhdGVzLmluYwppbmRleCBlMTc4NzkwNDQ4Li42ZTM2NjdlZWYxIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNyYXRl
cy5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dy
YXBoeS1jcmF0ZXMuaW5jCkBAIC0yLDc1ICsyLDc3IEBACiAKICMgZnJvbSBDYXJnby5sb2NrCiBT
UkNfVVJJICs9ICIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FzbjEvMC4yMS4zIFwKLSAgICBj
cmF0ZTovL2NyYXRlcy5pby9hc24xX2Rlcml2ZS8wLjIxLjMgXAotICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2F1dG9jZmcvMS40LjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FzbjEvMC4yMi4wIFwK
KyAgICBjcmF0ZTovL2NyYXRlcy5pby9hc24xX2Rlcml2ZS8wLjIyLjAgXAorICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2F1dG9jZmcvMS41LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Jhc2U2NC8w
LjIyLjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2JpdGZsYWdzLzIuOS4xIFwKLSAgICBjcmF0
ZTovL2NyYXRlcy5pby9jYy8xLjIuMjMgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NmZy1pZi8x
LjAuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYml0ZmxhZ3MvMi45LjQgXAorICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2NjLzEuMi4zNyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2ZnLWlmLzEu
MC4zIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9maW5kLW1zdmMtdG9vbHMvMC4xLjEgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2ZvcmVpZ24tdHlwZXMvMC4zLjIgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2ZvcmVpZ24tdHlwZXMtc2hhcmVkLzAuMS4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9oZWNrLzAuNS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pbmRvYy8yLjAuNiBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vaXRvYS8xLjAuMTUgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xp
YmMvMC4yLjE3MiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGliYy8wLjIuMTc1IFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9tZW1vZmZzZXQvMC45LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L29uY2VfY2VsbC8xLjIxLjMgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL29wZW5zc2wvMC4xMC43
MiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb3BlbnNzbC8wLjEwLjc0IFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9vcGVuc3NsLW1hY3Jvcy8wLjEuMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
b3BlbnNzbC1zeXMvMC45LjEwOCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb3BlbnNzbC1zeXMv
MC45LjExMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcGVtLzMuMC41IFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9wa2ctY29uZmlnLzAuMy4zMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcG9y
dGFibGUtYXRvbWljLzEuMTEuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHJvYy1tYWNybzIv
MS4wLjk1IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLzAuMjUuMCBcCi0gICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vcHlvMy1idWlsZC1jb25maWcvMC4yNS4wIFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby9weW8zLWZmaS8wLjI1LjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9z
LzAuMjUuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3MtYmFja2VuZC8wLjI1
LjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BvcnRhYmxlLWF0b21pYy8xLjExLjEgXAorICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3Byb2MtbWFjcm8yLzEuMC4xMDEgXAorICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3B5bzMvMC4yNi4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWJ1aWxkLWNv
bmZpZy8wLjI2LjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtZmZpLzAuMjYuMCBcCisg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3MvMC4yNi4wIFwKKyAgICBjcmF0ZTovL2Ny
YXRlcy5pby9weW8zLW1hY3Jvcy1iYWNrZW5kLzAuMjYuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vcXVvdGUvMS4wLjQwIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zZWxmX2NlbGwvMS4yLjAg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NobGV4LzEuMy4wIFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby9zeW4vMi4wLjEwMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGFyZ2V0LWxleGljb24v
MC4xMy4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby91bmljb2RlLWlkZW50LzEuMC4xOCBcCisg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3luLzIuMC4xMDYgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3RhcmdldC1sZXhpY29uLzAuMTMuMyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdW5pY29kZS1p
ZGVudC8xLjAuMTkgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaW5kZW50LzAuMi40IFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby92Y3BrZy8wLjIuMTUgXAogIgogCi1TUkNfVVJJW2FzbjEtMC4y
MS4zLnNoYTI1NnN1bV0gPSAiMmQ5YzM1MDJhNmYxYjUwYTJjNjliOTdiNzE2MzhhODFhZDNiMjFi
OTg3NDYwNDg4MDQwMWI5YjJiMGJmNzU4ZiIKLVNSQ19VUklbYXNuMV9kZXJpdmUtMC4yMS4zLnNo
YTI1NnN1bV0gPSAiMTc2NmViY2I1MTlkOGRkMTg2ZDYwZGZhOTEyNTcxZWRjYWEyYzFmOTk1ZTJl
NTY2NDNhMjYxYTg3ZGY2OWE2MSIKLVNSQ19VUklbYXV0b2NmZy0xLjQuMC5zaGEyNTZzdW1dID0g
ImFjZTUwYmFkZThlNjIzNGFhMTQwZDlhMmY1NTJiYmVlMWRiNGQzNTNmNjliODIxN2JjNTAzNDkw
ZmMxYTlmMjYiCitTUkNfVVJJW2FzbjEtMC4yMi4wLnNoYTI1NnN1bV0gPSAiZGY0MmMyYjAxYzVl
MTA2MGI4MjgxZjY3YjRlNWZiODU4MjYwNjk0OTE2YTY2NzM0NWE3MzA1Y2QxMWU1ZGJmYSIKK1NS
Q19VUklbYXNuMV9kZXJpdmUtMC4yMi4wLnNoYTI1NnN1bV0gPSAiY2RjY2Y4NDliNTQzNjVlMzY5
M2U5YTkwYWQzNmU0NDgyYjc5OTM3ZTYzNzNhYzhlMmNmMjI5Yzk4NTE4N2IyMSIKK1NSQ19VUklb
YXV0b2NmZy0xLjUuMC5zaGEyNTZzdW1dID0gImMwODYwNmY4YzNjYmY0Y2U2ZWM4ZTI4ZmIwMDE0
YTJjMDg2NzA4ZmU5NTRlYWE4ODUzODRhNjE2NTE3MmU3ZTgiCiBTUkNfVVJJW2Jhc2U2NC0wLjIy
LjEuc2hhMjU2c3VtXSA9ICI3MmIzMjU0ZjE2MjUxYTgzODFhYTEyZTQwZTNjNGQyZjAxOTlmOGM2
NTA4ZmJlY2I5ZDkxZjU3NWUwZmJiOGM2IgotU1JDX1VSSVtiaXRmbGFncy0yLjkuMS5zaGEyNTZz
dW1dID0gIjFiOGU1Njk4NWVjNjJkMTdlOWMxMDAxZGM4OWM4OGVjZDdkYzA4ZTQ3ZWJhNWVjN2My
OWM3YjVlZWVjZGU5NjciCi1TUkNfVVJJW2NjLTEuMi4yMy5zaGEyNTZzdW1dID0gIjVmNGFjODZh
OWU1YmMxZTJiMzQ0OWFiOWQ3ZDNhNmE0MDVlM2QxYmIyOGQ3YjliZTg2MTRmNTU4NDZhZTM3NjYi
Ci1TUkNfVVJJW2NmZy1pZi0xLjAuMC5zaGEyNTZzdW1dID0gImJhZjFkZTQzMzk3NjE1ODhiYzA2
MTllM2NiYzAxMjBlZTU4MmViYjc0YjUzYjRlZmJmNzkxMTdiZDJkYTQwZmQiCitTUkNfVVJJW2Jp
dGZsYWdzLTIuOS40LnNoYTI1NnN1bV0gPSAiMjI2MWQxMGNjYTU2OWU0NjQzZTUyNmQ4ZGMyZTYy
ZTQzM2NjOGFiYTIxYWI3NjQyMzM3MzFmOGQzNjliZjM5NCIKK1NSQ19VUklbY2MtMS4yLjM3LnNo
YTI1NnN1bV0gPSAiNjUxOTM1ODljNjQwNGViODBiNDUwZDYxOGVhZjlhMmNhZmFhYWZkNTdlY2Nl
NDczNzA1MTllZjY3NGE3YmQ0NCIKK1NSQ19VUklbY2ZnLWlmLTEuMC4zLnNoYTI1NnN1bV0gPSAi
MmZkMTI4OWMwNGE5ZWE4Y2IyMjMwMGE0NTlhNzJhMzg1ZDdjNzNkMzI1OWUyZWQ3ZGNiMmFmNjc0
ODM4Y2ZhOSIKK1NSQ19VUklbZmluZC1tc3ZjLXRvb2xzLTAuMS4xLnNoYTI1NnN1bV0gPSAiN2Zk
OTk5MzBmNjRkMTQ2Njg5MjY0YzYzN2I1YWYyZjAyMzNhOTMzYmVmMGQ4NTcwZTI1MjZiZjllMDgz
MTkyZCIKIFNSQ19VUklbZm9yZWlnbi10eXBlcy0wLjMuMi5zaGEyNTZzdW1dID0gImY2ZjMzOWVi
OGFkYzA1MmNkMmNhNzg5MTBmZGE4NjlhZWZhMzhkMjJkNWNiNjQ4ZTY0ODVlNGQzZmMwNmYzYjEi
CiBTUkNfVVJJW2ZvcmVpZ24tdHlwZXMtc2hhcmVkLTAuMS4xLnNoYTI1NnN1bV0gPSAiMDBiMDIy
ODQxMTkwOGNhODY4NWRiYTdmYzJjZGQ3MGVjOTk5MGE2ZTc1M2U4OWI2YWM5MWE4NGM0MGZiYWY0
YiIKIFNSQ19VUklbaGVjay0wLjUuMC5zaGEyNTZzdW1dID0gIjIzMDRlMDA5ODNmODdmZmIzOGI1
NWI0NDRiNWUzYjYwYTg4NGI1ZDMwYzBmY2E3ZDgyZmUzMzQ0OWJiZTU1ZWEiCiBTUkNfVVJJW2lu
ZG9jLTIuMC42LnNoYTI1NnN1bV0gPSAiZjRjNzI0NWEwODUwNDk1NTYwNTY3MGRiZjE0MWZjZWFi
OTc1ZjE1Y2EyMTU3MDY5NmFlYmU5ZDJlNzE1NzZiZCIKIFNSQ19VUklbaXRvYS0xLjAuMTUuc2hh
MjU2c3VtXSA9ICI0YTVmMTNiODU4YzhkMzE0ZWUzZThmNjM5MDExZjdjY2VmZTcxZjk3Zjk2ZTUw
MTUxZmI5OTFmMjY3OTI4ZTJjIgotU1JDX1VSSVtsaWJjLTAuMi4xNzIuc2hhMjU2c3VtXSA9ICJk
NzUwYWYwNDJmN2VmNGY3MjQzMDZkZTAyOWQxODgzNmMyNmMxNzY1YTU0YTZhM2YwOTRjYmQyM2E3
MjY3ZmZhIgorU1JDX1VSSVtsaWJjLTAuMi4xNzUuc2hhMjU2c3VtXSA9ICI2YTgyYWU0OTNlNTk4
YmFhZWE1MjA5ODA1YzQ5YmJmMmVhN2RlOTU2ZDUwZDdkYTBkYTExNjRmOWM2ZDI4NTQzIgogU1JD
X1VSSVttZW1vZmZzZXQtMC45LjEuc2hhMjU2c3VtXSA9ICI0ODgwMTZiZmFlNDU3YjAzNmQ5OTYw
OTJmNmNiNDQ4Njc3NjExY2U0NDQ5ZTk3MGNlYWY0MjY5NTIwM2YyMThhIgogU1JDX1VSSVtvbmNl
X2NlbGwtMS4yMS4zLnNoYTI1NnN1bV0gPSAiNDJmNWUxNWM5OTUzYzVlNGNjY2VlYjJlNzM4MmE3
MTY0ODJjMzQ1MTUzMTVmN2IwMzUzMmI4YjRlODM5M2QyZCIKLVNSQ19VUklbb3BlbnNzbC0wLjEw
LjcyLnNoYTI1NnN1bV0gPSAiZmVkZmVhN2Q1OGExZjczMTE4NDMwYTU1ZGE2YTI4NmU3YjA0NDk2
MTczNmNlOTZhMTZhMTcwNjhlYTI1ZTVkYSIKK1NSQ19VUklbb3BlbnNzbC0wLjEwLjc0LnNoYTI1
NnN1bV0gPSAiMjRhZDE0ZGQ0NTQxMjI2OWUxYTMwZjUyYWQ4ZjA2NjRmMGY0ZjRhODllZThmZTI4
YzNiMzUyNzAyMWViYjY1NCIKIFNSQ19VUklbb3BlbnNzbC1tYWNyb3MtMC4xLjEuc2hhMjU2c3Vt
XSA9ICJhOTQ4NjY2YjYzN2EwZjQ2NWU4NTY0YzczZTg5ZDRkZGUwMGQ3MmQ0ZDQ3M2NjOTcyZjM5
MGZjM2RjZWU3ZDljIgotU1JDX1VSSVtvcGVuc3NsLXN5cy0wLjkuMTA4LnNoYTI1NnN1bV0gPSAi
ZTE0NWUxNjUxZTg1OGU4MjBlNDg2MGY3YjljNWUxNjliYzFkOGNlMWM4NjA0M2JlNzlmYTdiNzYz
NDgyMTg0NyIKK1NSQ19VUklbb3BlbnNzbC1zeXMtMC45LjExMC5zaGEyNTZzdW1dID0gIjBhOWYw
MDc1YmEzYzIxYjA5ZjhlOGIyMDI2NTg0YjFkMThkNDkzODg2NDhmMmZiYmYzYzk3ZWE4ZGVjZWQ4
ZTIiCiBTUkNfVVJJW3BlbS0zLjAuNS5zaGEyNTZzdW1dID0gIjM4YWYzOGU4NDcwYWM5ZGVlM2Nl
MWJhZTFhZjljMTY3MWZmZmM0NGRkZmQ4YmQxZDBhMzQ0NWJmMzQ5YThlZjMiCiBTUkNfVVJJW3Br
Zy1jb25maWctMC4zLjMyLnNoYTI1NnN1bV0gPSAiN2VkZGRiZDBiNTJkNzMyYjIxYWQ5YTVmYWI1
YzcwNGMxNGNkOTQ5ZTVlOWExZWM1OTI5YTI0ZmRlZDFiOTA0YyIKLVNSQ19VUklbcG9ydGFibGUt
YXRvbWljLTEuMTEuMC5zaGEyNTZzdW1dID0gIjM1MGU5YjQ4Y2JjNmIwZTAyOGIwNDczYjExNDQ1
NGM2MzE2ZTU3MzM2ZWUxODRjZWFiNmU1M2Y3MmMxNzhiM2UiCi1TUkNfVVJJW3Byb2MtbWFjcm8y
LTEuMC45NS5zaGEyNTZzdW1dID0gIjAyYjNlNWU2OGEzYTFhMDJhYWQzZWM0OTBhOTgwMDdjYmMx
M2MzN2NiZTg0YTNjZDdiOGU0MDZkNzZlN2Y3NzgiCi1TUkNfVVJJW3B5bzMtMC4yNS4wLnNoYTI1
NnN1bV0gPSAiZjIzOWQ2NTYzNjNiY2VlNzNhZmVmODUyNzdmMWIyODFlOGFjNjIxMmExZDQyYWE5
MGU1NWI5MGVkNDNjNDdhNCIKLVNSQ19VUklbcHlvMy1idWlsZC1jb25maWctMC4yNS4wLnNoYTI1
NnN1bV0gPSAiNzU1ZWE2NzFhMWMzNDA0NGZhMTY1MjQ3YWFmNmY0MTljYTM5Y2FhNjAwM2FlZTc5
MWEwZGYyNzEzZDhmMWI2ZCIKLVNSQ19VUklbcHlvMy1mZmktMC4yNS4wLnNoYTI1NnN1bV0gPSAi
ZmM5NWEyZTY3MDkxZTQ0NzkxZDRlYTMwMGZmNzQ0YmU1MjkzZjM5NGYxYmFmZDlmNzhjMDgwODE0
ZDM1OTU2ZSIKLVNSQ19VUklbcHlvMy1tYWNyb3MtMC4yNS4wLnNoYTI1NnN1bV0gPSAiYTE3OTY0
MWQxYjkzOTIwODI5YTYyZjE1ZTg3YzBlZDc5MWI2YzhkYjIyNzFiYTBmZDdjMjY4NjA5MDUxMDIx
NCIKLVNSQ19VUklbcHlvMy1tYWNyb3MtYmFja2VuZC0wLjI1LjAuc2hhMjU2c3VtXSA9ICI5ZGZm
ODVlYmNhYWI4YzQ0MWIwZTNmN2FlNDBhNjk2M2VjZWE4YTlmNWU3NGY2NDdlMzNmY2Y1ZWM5YTFl
ODllIgorU1JDX1VSSVtwb3J0YWJsZS1hdG9taWMtMS4xMS4xLnNoYTI1NnN1bV0gPSAiZjg0MjY3
YjIwYTE2ZWE5MThlNDNjNmE4ODQzM2MyZDU0ZmExNDVjOTJhODExYjViMDQ3Y2NiZTE1MzY3NDQ4
MyIKK1NSQ19VUklbcHJvYy1tYWNybzItMS4wLjEwMS5zaGEyNTZzdW1dID0gIjg5YWU0M2ZkODZl
NDE1OGQ2ZGI1MWFkOGUyYjgwZjMxM2FmOWNjNzRmNWMwZTAzY2NiODdkZTA5OTk4NzMyZGUiCitT
UkNfVVJJW3B5bzMtMC4yNi4wLnNoYTI1NnN1bV0gPSAiN2JhMDExN2Y0MjEyMTAxZWU2NTQ0MDQ0
ZGFlNDVhYmUxMDgzZDMwY2U3YjI5YzRiNWNiZGZhMjM1NGUwNzM4MyIKK1NSQ19VUklbcHlvMy1i
dWlsZC1jb25maWctMC4yNi4wLnNoYTI1NnN1bV0gPSAiNGZjNmRkYWYyNDk0N2QxMmE5YWEzMWFj
NjU0MzFmYjFiODUxYjhmNDM2NTQyNmUxODI5MDFlYWJmYjg3ZGY1ZiIKK1NSQ19VUklbcHlvMy1m
ZmktMC4yNi4wLnNoYTI1NnN1bV0gPSAiMDI1NDc0ZDM5Mjg3MzhlZmIzOGFjMzZkNDc0NGE3NGE0
MDBjOTAxYzc1OTYxOTllMjBlNDVkOThlYjE5NDEwNSIKK1NSQ19VUklbcHlvMy1tYWNyb3MtMC4y
Ni4wLnNoYTI1NnN1bV0gPSAiMmU2NGViNDg5ZjIyZmUxYzk1OTExYjc3YzQ0Y2M0MWU3YzE5ZjMw
ODJmYzgxY2NlOTBmNjU3Y2RjNDJmZmRlZCIKK1NSQ19VUklbcHlvMy1tYWNyb3MtYmFja2VuZC0w
LjI2LjAuc2hhMjU2c3VtXSA9ICIxMDAyNDZjMGVjZjQwMGI0NzUzNDFiODQ1NWE5MjEzMzQ0NTY5
YWYyOWEzYzg0MWQyOTI3MGU1MzEwMmUwZmNmIgogU1JDX1VSSVtxdW90ZS0xLjAuNDAuc2hhMjU2
c3VtXSA9ICIxODg1YzAzOTU3MGRjMDBkY2I0ZmYwODdhODllMTg1ZmQ1NmJhZTIzNGRkYzdmMDU2
YTk0NWJmMzY0NjcyNDhkIgogU1JDX1VSSVtzZWxmX2NlbGwtMS4yLjAuc2hhMjU2c3VtXSA9ICIw
ZjdkOTVhNTQ1MTFlMGM3YmUzZjUxZTg4NjdhYThjZjM1MTQ4ZDdiOTQ0NWQ0NGRlMmY5NDNlMmIy
MDZlNzQ5IgogU1JDX1VSSVtzaGxleC0xLjMuMC5zaGEyNTZzdW1dID0gIjBmZGEyZmYwZDA4NDAx
OWJhNGQ3YzZmMzcxYzk1ZDhmZDc1Y2UzNTI0YzNjYjhmYjY1M2EzMDIzZjYzMjNlNjQiCi1TUkNf
VVJJW3N5bi0yLjAuMTAxLnNoYTI1NnN1bV0gPSAiOGNlMmI3ZmM5NDFiM2EyNDEzOGEwYTdjZjhl
ODU4YmZjNmE5OTJlNzk3OGEwNjhhNWM3NjBkZWIwZWQ0M2NhZiIKLVNSQ19VUklbdGFyZ2V0LWxl
eGljb24tMC4xMy4yLnNoYTI1NnN1bV0gPSAiZTUwMmY3OGNkYmI4YmE0NzE4ZjU2NmM0MThjNTJi
YzcyOTEyNmZmZDE2YmFlZTViYWE3MThjZjI1ZGQ1YTY5YSIKLVNSQ19VUklbdW5pY29kZS1pZGVu
dC0xLjAuMTguc2hhMjU2c3VtXSA9ICI1YTVmMzk0MDRhNWRhNTA3MTJhNGMxZWVjZjI1ZTkwZGQ2
MmI2MTM1MDJiN2U5MjVmZDRlNGQxOWI1Yzk2NTEyIgorU1JDX1VSSVtzeW4tMi4wLjEwNi5zaGEy
NTZzdW1dID0gImVkZTdjNDM4MDI4ZDQ0MzZkNzExMDQ5MTY5MTBmNWJiNjExOTcyYzVjZmQ3Zjg5
YjgzMDBhODE4NmU2ZmFkYTYiCitTUkNfVVJJW3RhcmdldC1sZXhpY29uLTAuMTMuMy5zaGEyNTZz
dW1dID0gImRmN2Y2MjU3N2MyNWUwNzgzNDY0OWZjM2IzOWZhZmRjNTk3YzBhMzUyN2RjMWM2MDEy
OTIwMWNjZmNiYWE1MGMiCitTUkNfVVJJW3VuaWNvZGUtaWRlbnQtMS4wLjE5LnNoYTI1NnN1bV0g
PSAiZjYzYTU0NTQ4MTI5MTEzODkxMDU3NTEyOTQ4NmRhZWFmOGFjNTRhZWU0Mzg3ZmU3OTA2OTE5
Zjc4MzBjN2Q5ZCIKIFNSQ19VUklbdW5pbmRlbnQtMC4yLjQuc2hhMjU2c3VtXSA9ICI3MjY0ZTEw
N2Y1NTNjY2FlODc5ZDIxZmJlYTFkNjcyNGFjNzg1ZThjM2JmYzc2MjEzNzk1OWI1ODAyODI2ZWYz
IgogU1JDX1VSSVt2Y3BrZy0wLjIuMTUuc2hhMjU2c3VtXSA9ICJhY2NkNGVhNjJmN2JiN2E4MmZl
MjMwNjZmYjA5NTdkNDhlZjY3N2Y2ZWViODIxNWYzNzJmNTJlNDhiYjMyNDI2IgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0
b3JzLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBo
eS12ZWN0b3JzLmJiCmluZGV4IGU4NDU0ODZhOTQuLjM5NzM2MzhlNDQgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5
LXZlY3RvcnMuYmIKQEAgLTksNyArOSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOU0U7bWQ1PThjMzYxN2RiNGZiNmZhZTAxZjFkMjUzYWI5MTUxMWU0IFwKICMgTk9URTogTWFr
ZSBzdXJlIHRvIGtlZXAgdGhpcyByZWNpcGUgYXQgdGhlIHNhbWUgdmVyc2lvbiBhcyBweXRob24z
LWNyeXB0b2dyYXBoeQogIyAgICAgICBVcGdyYWRlIGJvdGggcmVjaXBlcyBhdCB0aGUgc2FtZSB0
aW1lCiByZXF1aXJlIHB5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI0OGU3MWZjNGFjNWY2Mjk4YjJkZTUzYTk5NzI2ZGRjNGE5ZTVlZjBhOTRkOTIx
ODIwMTA5ZTdiOTBiYWY5ZjU2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImEyMzI0NmZjYjc5NGZj
ODdkODE0ZDFiNGJlMjBkZjc0YTI5OTg0MGEyNDMwY2M3NDY1MWJjN2JhMGYzYjU0OGMiCiAKIFBZ
UElfUEFDS0FHRSA9ICJjcnlwdG9ncmFwaHlfdmVjdG9ycyIKIFVQU1RSRUFNX0NIRUNLX1BZUElf
UEFDS0FHRSA9ICIke1BZUElfUEFDS0FHRX0iCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS5iYgppbmRleCA1NWZkZjEzOTcyLi5iM2I0
NWNkMTcyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
Y3J5cHRvZ3JhcGh5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1jcnlwdG9ncmFwaHkuYmIKQEAgLTExLDcgKzExLDcgQEAgTERTSEFSRUQgKz0gIi1wdGhyZWFk
IgogIyBOT1RFOiBNYWtlIHN1cmUgdG8ga2VlcCB0aGlzIHJlY2lwZSBhdCB0aGUgc2FtZSB2ZXJz
aW9uIGFzIHB5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMKICMgICAgICAgVXBncmFkZSBib3Ro
IHJlY2lwZXMgYXQgdGhlIHNhbWUgdGltZQogcmVxdWlyZSBweXRob24zLWNyeXB0b2dyYXBoeS1j
b21tb24uaW5jCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNGIxNjU0ZGZjNjRlYTQ3OWMyNDI1MDhl
YjhjNzI0MDQ0ZjFlOTY0YTQ3ZDFkMWNhY2M1MTMyMjkyZDg1MTk3MSIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJhOGIxNzQzODEwNGZlZDAyMmNlNzQ1YjM2MjI5NGQ5Y2UzNWI0YzJlNDVjMWQ5NThh
ZDRhNGIwMTkyODVmNGExIgogCiBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1weXByb2plY3QudG9t
bC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoIFwKICAgICAgICAgICAgIGZp
bGU6Ly9jaGVjay1tZW1mcmVlLnB5IFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkvMDAwMS1weXByb2plY3QudG9tbC1yZW1vdmUt
YmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5j
aG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2gKaW5kZXggMTY2ODFlODBhOC4uYWJhOGU0OWU2NiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dy
YXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24u
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dy
YXBoeS8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24u
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGIwMzNjZDMyODEzYTEwNGZiMjE2MTM1Y2RjYTdk
YTcxODA5MTJlNTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQ5MjcwMTI2OWJjOWFi
NzU3ZTRjMjMzZjI0NWU4NWVhMDIxOWIyODIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBNaW5nbGkgWXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNyBNYXkg
MjAyMiAxNzoyMjo0OCArMDgwMAogU3ViamVjdDogW1BBVENIXSBweXByb2plY3QudG9tbDogcmVt
b3ZlIC0tYmVuY2htYXJrLWRpc2FibGUgb3B0aW9uCkBAIC0yNiwxMCArMjYsMTAgQEAgU2lnbmVk
LW9mZi1ieTogVGltIE9ybGluZyA8dGltLm9ybGluZ0Brb25zdWxrby5jb20+CiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9weXBy
b2plY3QudG9tbCBiL3B5cHJvamVjdC50b21sCi1pbmRleCA0NzQ2MjAxLi5kZjk4MzUxIDEwMDY0
NAoraW5kZXggYjNkOGMzMS4uNjU5MzA1NyAxMDA2NDQKIC0tLSBhL3B5cHJvamVjdC50b21sCiAr
KysgYi9weXByb2plY3QudG9tbAotQEAgLTEyOSw3ICsxMjksNyBAQCBleGNsdWRlID0gWworQEAg
LTEzNCw3ICsxMzQsNyBAQCBleGNsdWRlID0gWwogIF0KICAKICBbdG9vbC5weXRlc3QuaW5pX29w
dGlvbnNdCi0tIAoyLjQ3LjEKCg==

--===============5162108987861509320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1949 entries from dependency cache.
Parsing recipes...done.
Parsing of 947 .bb files complete (945 cached, 2 parsed). 1944 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-9e94d2fd8ca152596febf8637797608fa44a7634"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:9e94d2fd8ca152596febf8637797608fa44a7634"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 428 Local 406 Mirrors 0 Missed 22 Current 623 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 773 of 1051 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_populate_lic_setscene)
NOTE: Running setscene task 962 of 1051 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 966 of 1051 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_recipe_qa_setscene)
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-46.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 1051 of 1051 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_recipe_qa_setscene)
NOTE: recipe python3-cryptography-46.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1564 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_fetch)
NOTE: recipe python3-cryptography-46.0.3-r0: task do_fetch: Started
NOTE: Running task 1970 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_fetch)
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 2365 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_unpack)
NOTE: Running task 2366 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_prepare_recipe_sysroot)
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
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_configure: Succeeded
NOTE: Running task 2877 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_compile: Started
NOTE: recipe python3-cryptography-46.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 2878 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_unpack)
NOTE: Running task 2879 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-46.0.3-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-46.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-46.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-46.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 2880 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_patch)
NOTE: Running task 2881 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-46.0.3-r0: task do_patch: Started
NOTE: recipe python3-cryptography-46.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cryptography-46.0.3-r0: task do_patch: Succeeded
NOTE: Running task 2882 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_deploy_source_date_epoch)
NOTE: Running task 2883 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_rust_create_wrappers)
NOTE: recipe python3-cryptography-46.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2884 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_rust_gen_targets)
NOTE: Running task 2885 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_populate_lic)
NOTE: recipe python3-cryptography-46.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-46.0.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-46.0.3-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-46.0.3-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-46.0.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-46.0.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-cryptography-46.0.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-cryptography-46.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_deploy_source_date_epoch unihash changed to dfb25be27c0d401a3bd69b991b5393c0e99f2f0a8b9aa254c25cc7108bccce37
NOTE: Setscene tasks completed
NOTE: Running task 2886 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_configure)
NOTE: recipe python3-cryptography-46.0.3-r0: task do_configure: Started
NOTE: recipe python3-cryptography-46.0.3-r0: task do_configure: Succeeded
NOTE: Running task 2887 of 2912 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_configure_ptest_base)
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-cryptography-vectors/46.0.3/temp/run.do_compile.16859:158 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-cryptography-vectors/46.0.3/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-cryptography-vectors/46.0.3/sources/cryptography_vectors-46.0.3'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-cryptography-vectors/46.0.3/temp/run.do_compile.16859, line 158
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-cryptography-vectors/46.0.3/temp/run.do_compile.16859, line 153
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-cryptography-vectors/46.0.3/temp/run.do_compile.16859, line 169
NOTE: recipe python3-cryptography-vectors-46.0.3-r0: task do_compile: Failed
NOTE: recipe python3-cryptography-46.0.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-46.0.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Tasks Summary: Attempted 2887 tasks of which 2869 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115062113.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115062113.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-cryptography-vectors/46.0.3/temp/log.do_compile.16859
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-cryptography-vectors-46.0.3-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-cryptography-vectors/46.0.3/temp/run.do_compile.16859' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-cryptography-vectors/46.0.3/temp/log.do_compile.16859
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_compile) failed with exit code '1'

--===============5162108987861509320==--

