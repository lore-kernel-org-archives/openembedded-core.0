Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30747C71141
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:34 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.27765.1748786123501344362
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=y50ACKSm;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=r2A8ZR0c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101972bc6900e-6b876670-624c-4154-9c20-6ffad7b6386a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786122;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=i3u36E9hIP54ZUYbUDv5p7+9TP6a/W8N7/5I7VCnGVg=;
	b=y50ACKSmhFB+5TieZaz5E8/FQ+EQlm/Pr51FyyVnMboc8ELhxT6QSQbCn5CdVolW
	FoqzO3p0PKdaHzqzlnVB+oMHu3cAxu3ST5yF3jgCwbT1Zbd6PW9ZEluBUfViHjfPJbO
	So6mS8/I7npSGpwEapI/N64LIKp1eJgjd2bbA9Y4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786122;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=i3u36E9hIP54ZUYbUDv5p7+9TP6a/W8N7/5I7VCnGVg=;
	b=r2A8ZR0cgycBFyWr0ScTxXj324rermtlLEUExDfL7/tZ76SSKjwNTlWlU1R0kxUN
	Yl0HcFryHJKI9z8ih986vVB1L1RxLOL22NvP0zNRILNrbXC/f/fPh7S35En8QY51Clt
	KNyGV68G+hC7rf8fpnd/vEJ5sb+r4pIpAy3d4+DY=
Content-Type: multipart/mixed; boundary="===============3792214276766992225=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>, 
	Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography,python3-cryptography-vectors: upgrading to
 45.0.3,45.0.3 FAILED
Message-ID: <010101972bc6900e-6b876670-624c-4154-9c20-6ffad7b6386a-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217562

--===============3792214276766992225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography,python3-cryptography-vectors* to *45.0.3,45.0.3* has Failed(do_compile).

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
From 6bd59f6f16c34b5d65d537ecc5cd852859c861f0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 05:34:08 +0000
Subject: [PATCH] python3-cryptography,python3-cryptography-vectors: upgrade
 44.0.2 -> 45.0.3,44.0.2 -> 45.0.3

---
 .../python/python3-cryptography-common.inc    |   2 +-
 .../python/python3-cryptography-crates.inc    | 100 +++++++++---------
 .../python/python3-cryptography-vectors.bb    |   2 +-
 .../python/python3-cryptography.bb            |   2 +-
 ...toml-remove-benchmark-disable-option.patch |   6 +-
 5 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 368a364cf0..3018d967b2 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "44.0.2"
+PV = "45.0.3"
diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index b3aa66002e..e178790448 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -2,75 +2,75 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/asn1/0.20.0 \
-    crate://crates.io/asn1_derive/0.20.0 \
+    crate://crates.io/asn1/0.21.3 \
+    crate://crates.io/asn1_derive/0.21.3 \
     crate://crates.io/autocfg/1.4.0 \
     crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bitflags/2.6.0 \
-    crate://crates.io/cc/1.2.1 \
+    crate://crates.io/bitflags/2.9.1 \
+    crate://crates.io/cc/1.2.23 \
     crate://crates.io/cfg-if/1.0.0 \
     crate://crates.io/foreign-types/0.3.2 \
     crate://crates.io/foreign-types-shared/0.1.1 \
     crate://crates.io/heck/0.5.0 \
-    crate://crates.io/indoc/2.0.5 \
-    crate://crates.io/itoa/1.0.14 \
-    crate://crates.io/libc/0.2.166 \
+    crate://crates.io/indoc/2.0.6 \
+    crate://crates.io/itoa/1.0.15 \
+    crate://crates.io/libc/0.2.172 \
     crate://crates.io/memoffset/0.9.1 \
-    crate://crates.io/once_cell/1.20.2 \
-    crate://crates.io/openssl/0.10.68 \
+    crate://crates.io/once_cell/1.21.3 \
+    crate://crates.io/openssl/0.10.72 \
     crate://crates.io/openssl-macros/0.1.1 \
-    crate://crates.io/openssl-sys/0.9.104 \
-    crate://crates.io/pem/3.0.4 \
-    crate://crates.io/pkg-config/0.3.31 \
-    crate://crates.io/portable-atomic/1.10.0 \
-    crate://crates.io/proc-macro2/1.0.92 \
-    crate://crates.io/pyo3/0.23.5 \
-    crate://crates.io/pyo3-build-config/0.23.5 \
-    crate://crates.io/pyo3-ffi/0.23.5 \
-    crate://crates.io/pyo3-macros/0.23.5 \
-    crate://crates.io/pyo3-macros-backend/0.23.5 \
-    crate://crates.io/quote/1.0.37 \
-    crate://crates.io/self_cell/1.0.4 \
+    crate://crates.io/openssl-sys/0.9.108 \
+    crate://crates.io/pem/3.0.5 \
+    crate://crates.io/pkg-config/0.3.32 \
+    crate://crates.io/portable-atomic/1.11.0 \
+    crate://crates.io/proc-macro2/1.0.95 \
+    crate://crates.io/pyo3/0.25.0 \
+    crate://crates.io/pyo3-build-config/0.25.0 \
+    crate://crates.io/pyo3-ffi/0.25.0 \
+    crate://crates.io/pyo3-macros/0.25.0 \
+    crate://crates.io/pyo3-macros-backend/0.25.0 \
+    crate://crates.io/quote/1.0.40 \
+    crate://crates.io/self_cell/1.2.0 \
     crate://crates.io/shlex/1.3.0 \
-    crate://crates.io/syn/2.0.89 \
-    crate://crates.io/target-lexicon/0.12.16 \
-    crate://crates.io/unicode-ident/1.0.14 \
-    crate://crates.io/unindent/0.2.3 \
+    crate://crates.io/syn/2.0.101 \
+    crate://crates.io/target-lexicon/0.13.2 \
+    crate://crates.io/unicode-ident/1.0.18 \
+    crate://crates.io/unindent/0.2.4 \
     crate://crates.io/vcpkg/0.2.15 \
 "
 
-SRC_URI[asn1-0.20.0.sha256sum] = "2d8b84b4ea1de2bf1dcd2a759737ddb328fb6695b2a95eb7e44fed67e3406f32"
-SRC_URI[asn1_derive-0.20.0.sha256sum] = "a200809d0138620b3dba989f1d08d0620e76248bc1e62a2ec1b2df5eb1ee08ad"
+SRC_URI[asn1-0.21.3.sha256sum] = "2d9c3502a6f1b50a2c69b97b71638a81ad3b21b9874604880401b9b2b0bf758f"
+SRC_URI[asn1_derive-0.21.3.sha256sum] = "1766ebcb519d8dd186d60dfa912571edcaa2c1f995e2e56643a261a87df69a61"
 SRC_URI[autocfg-1.4.0.sha256sum] = "ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bitflags-2.6.0.sha256sum] = "b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de"
-SRC_URI[cc-1.2.1.sha256sum] = "fd9de9f2205d5ef3fd67e685b0df337994ddd4495e2a28d185500d0e1edfea47"
+SRC_URI[bitflags-2.9.1.sha256sum] = "1b8e56985ec62d17e9c1001dc89c88ecd7dc08e47eba5ec7c29c7b5eeecde967"
+SRC_URI[cc-1.2.23.sha256sum] = "5f4ac86a9e5bc1e2b3449ab9d7d3a6a405e3d1bb28d7b9be8614f55846ae3766"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
 SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
-SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
-SRC_URI[itoa-1.0.14.sha256sum] = "d75a2a4b1b190afb6f5425f10f6a8f959d2ea0b9c2b1d79553551850539e4674"
-SRC_URI[libc-0.2.166.sha256sum] = "c2ccc108bbc0b1331bd061864e7cd823c0cab660bbe6970e66e2c0614decde36"
+SRC_URI[indoc-2.0.6.sha256sum] = "f4c7245a08504955605670dbf141fceab975f15ca21570696aebe9d2e71576bd"
+SRC_URI[itoa-1.0.15.sha256sum] = "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
+SRC_URI[libc-0.2.172.sha256sum] = "d750af042f7ef4f724306de029d18836c26c1765a54a6a3f094cbd23a7267ffa"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
-SRC_URI[once_cell-1.20.2.sha256sum] = "1261fe7e33c73b354eab43b1273a57c8f967d0391e80353e51f764ac02cf6775"
-SRC_URI[openssl-0.10.68.sha256sum] = "6174bc48f102d208783c2c84bf931bb75927a617866870de8a4ea85597f871f5"
+SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
+SRC_URI[openssl-0.10.72.sha256sum] = "fedfea7d58a1f73118430a55da6a286e7b044961736ce96a16a17068ea25e5da"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
-SRC_URI[openssl-sys-0.9.104.sha256sum] = "45abf306cbf99debc8195b66b7346498d7b10c210de50418b5ccd7ceba08c741"
-SRC_URI[pem-3.0.4.sha256sum] = "8e459365e590736a54c3fa561947c84837534b8e9af6fc5bf781307e82658fae"
-SRC_URI[pkg-config-0.3.31.sha256sum] = "953ec861398dccce10c670dfeaf3ec4911ca479e9c02154b3a215178c5f566f2"
-SRC_URI[portable-atomic-1.10.0.sha256sum] = "280dc24453071f1b63954171985a0b0d30058d287960968b9b2aca264c8d4ee6"
-SRC_URI[proc-macro2-1.0.92.sha256sum] = "37d3544b3f2748c54e147655edb5025752e2303145b5aefb3c3ea2c78b973bb0"
-SRC_URI[pyo3-0.23.5.sha256sum] = "7778bffd85cf38175ac1f545509665d0b9b92a198ca7941f131f85f7a4f9a872"
-SRC_URI[pyo3-build-config-0.23.5.sha256sum] = "94f6cbe86ef3bf18998d9df6e0f3fc1050a8c5efa409bf712e661a4366e010fb"
-SRC_URI[pyo3-ffi-0.23.5.sha256sum] = "e9f1b4c431c0bb1c8fb0a338709859eed0d030ff6daa34368d3b152a63dfdd8d"
-SRC_URI[pyo3-macros-0.23.5.sha256sum] = "fbc2201328f63c4710f68abdf653c89d8dbc2858b88c5d88b0ff38a75288a9da"
-SRC_URI[pyo3-macros-backend-0.23.5.sha256sum] = "fca6726ad0f3da9c9de093d6f116a93c1a38e417ed73bf138472cf4064f72028"
-SRC_URI[quote-1.0.37.sha256sum] = "b5b9d34b8991d19d98081b46eacdd8eb58c6f2b201139f7c5f643cc155a633af"
-SRC_URI[self_cell-1.0.4.sha256sum] = "d369a96f978623eb3dc28807c4852d6cc617fed53da5d3c400feff1ef34a714a"
+SRC_URI[openssl-sys-0.9.108.sha256sum] = "e145e1651e858e820e4860f7b9c5e169bc1d8ce1c86043be79fa7b7634821847"
+SRC_URI[pem-3.0.5.sha256sum] = "38af38e8470ac9dee3ce1bae1af9c1671fffc44ddfd8bd1d0a3445bf349a8ef3"
+SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
+SRC_URI[portable-atomic-1.11.0.sha256sum] = "350e9b48cbc6b0e028b0473b114454c6316e57336ee184ceab6e53f72c178b3e"
+SRC_URI[proc-macro2-1.0.95.sha256sum] = "02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778"
+SRC_URI[pyo3-0.25.0.sha256sum] = "f239d656363bcee73afef85277f1b281e8ac6212a1d42aa90e55b90ed43c47a4"
+SRC_URI[pyo3-build-config-0.25.0.sha256sum] = "755ea671a1c34044fa165247aaf6f419ca39caa6003aee791a0df2713d8f1b6d"
+SRC_URI[pyo3-ffi-0.25.0.sha256sum] = "fc95a2e67091e44791d4ea300ff744be5293f394f1bafd9f78c080814d35956e"
+SRC_URI[pyo3-macros-0.25.0.sha256sum] = "a179641d1b93920829a62f15e87c0ed791b6c8db2271ba0fd7c2686090510214"
+SRC_URI[pyo3-macros-backend-0.25.0.sha256sum] = "9dff85ebcaab8c441b0e3f7ae40a6963ecea8a9f5e74f647e33fcf5ec9a1e89e"
+SRC_URI[quote-1.0.40.sha256sum] = "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
+SRC_URI[self_cell-1.2.0.sha256sum] = "0f7d95a54511e0c7be3f51e8867aa8cf35148d7b9445d44de2f943e2b206e749"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
-SRC_URI[syn-2.0.89.sha256sum] = "44d46482f1c1c87acd84dea20c1bf5ebff4c757009ed6bf19cfd36fb10e92c4e"
-SRC_URI[target-lexicon-0.12.16.sha256sum] = "61c41af27dd6d1e27b1b16b489db798443478cef1f06a660c96db617ba5de3b1"
-SRC_URI[unicode-ident-1.0.14.sha256sum] = "adb9e6ca4f869e1180728b7950e35922a7fc6397f7b641499e8f3ef06e50dc83"
-SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
+SRC_URI[syn-2.0.101.sha256sum] = "8ce2b7fc941b3a24138a0a7cf8e858bfc6a992e7978a068a5c760deb0ed43caf"
+SRC_URI[target-lexicon-0.13.2.sha256sum] = "e502f78cdbb8ba4718f566c418c52bc729126ffd16baee5baa718cf25dd5a69a"
+SRC_URI[unicode-ident-1.0.18.sha256sum] = "5a5f39404a5da50712a4c1eecf25e90dd62b613502b7e925fd4e4d19b5c96512"
+SRC_URI[unindent-0.2.4.sha256sum] = "7264e107f553ccae879d21fbea1d6724ac785e8c3bfc762137959b5802826ef3"
 SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 075115f3f9..46597134b6 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "ab32e156b6e7eaf6d8c727a32245967dcce049487301482fca38c0c5fdc84e4b"
+SRC_URI[sha256sum] = "b65cebdc334c6b9db8c79081a08253fddf262d009d2c914398edd24a4321db21"
 
 PYPI_PACKAGE = "cryptography_vectors"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 566e80c4f9..e40e62f626 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "c63454aa261a0cf0c5b4718349629793e9e634993538db841165b3df74f37ec0"
+SRC_URI[sha256sum] = "ec21313dd335c51d7877baf2972569f40a4291b76a0ce51391523ae358d05899"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 19ade60c03..42876e3489 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From 682c99345a7c8cba87e9cea1187aa007eed962fa Mon Sep 17 00:00:00 2001
+From 7da554d52bfed4370766d5afd94bc7865791231d Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,10 +26,10 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 13d8b2c..e93dee9 100644
+index d94a1f5..c0f87a7 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
-@@ -118,7 +118,7 @@ exclude = [
+@@ -129,7 +129,7 @@ exclude = [
  ]
  
  [tool.pytest.ini_options]
-- 
2.47.1


--===============3792214276766992225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1919 entries from dependency cache.
Parsing recipes...done.
Parsing of 936 .bb files complete (934 cached, 2 parsed). 1915 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8dbfacda1ac60b5a8e02df83f8cb1322ef3ef05c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 457 Local 433 Mirrors 0 Missed 24 Current 605 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1481 of 2940 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_recipe_qa)
NOTE: recipe python3-cryptography-45.0.3-r0: task do_recipe_qa: Started
NOTE: Running task 2013 of 2940 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_recipe_qa)
NOTE: recipe python3-cryptography-45.0.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.3-r0: task do_recipe_qa: Started
NOTE: Running task 2134 of 2940 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_fetch)
NOTE: recipe python3-cryptography-45.0.3-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-45.0.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2379 of 2940 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_fetch)
NOTE: recipe python3-cryptography-vectors-45.0.3-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-45.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 2548 of 2940 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_unpack)
NOTE: recipe python3-cryptography-vectors-45.0.3-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-vectors-45.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 2899 of 2940 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-45.0.3-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-45.0.3-r0: task do_patch: Succeeded
NOTE: Running task 2900 of 2940 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_deploy_source_date_epoch)
NOTE: Running task 2901 of 2940 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_populate_lic)
NOTE: recipe python3-cryptography-vectors-45.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-vectors-45.0.3-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-vectors-45.0.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-45.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 2902 of 2940 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_unpack)
NOTE: Running task 2903 of 2940 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-45.0.3-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-45.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-45.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-45.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 2904 of 2940 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_patch)
NOTE: Running task 2905 of 2940 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_collect_spdx_deps)
NOTE: recipe python3-cryptography-45.0.3-r0: task do_patch: Started
NOTE: recipe python3-cryptography-45.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cryptography-45.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-45.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2906 of 2940 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_deploy_source_date_epoch)
NOTE: Running task 2907 of 2940 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_rust_create_wrappers)
NOTE: Running task 2908 of 2940 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_rust_gen_targets)
NOTE: Running task 2909 of 2940 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_populate_lic)
NOTE: recipe python3-cryptography-45.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-45.0.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cryptography-45.0.3-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-cryptography-45.0.3-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-45.0.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-45.0.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe python3-cryptography-45.0.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-cryptography-45.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2910 of 2940 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_configure)
NOTE: recipe python3-cryptography-45.0.3-r0: task do_configure: Started
NOTE: recipe python3-cryptography-45.0.3-r0: task do_configure: Succeeded
NOTE: Running task 2911 of 2940 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_configure_ptest_base)
NOTE: recipe python3-cryptography-45.0.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-cryptography-45.0.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2912 of 2940 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_compile)
NOTE: recipe python3-cryptography-45.0.3-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| ERROR Missing dependencies:
| 	maturin<2,>=1.8.6
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/45.0.3/temp/run.do_compile.1167580:191 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/45.0.3/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/45.0.3/cryptography-45.0.3'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/45.0.3/temp/run.do_compile.1167580, line 191
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/45.0.3/temp/run.do_compile.1167580, line 167
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/45.0.3/temp/run.do_compile.1167580, line 202
NOTE: recipe python3-cryptography-45.0.3-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2912 tasks of which 2893 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250601053347.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250601053347.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/45.0.3/temp/log.do_compile.1167580
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-cryptography-45.0.3-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/45.0.3/temp/run.do_compile.1167580' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-cryptography/45.0.3/temp/log.do_compile.1167580
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_compile) failed with exit code '1'

--===============3792214276766992225==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-python3-cryptography-vectors-up.patch"

RnJvbSA2YmQ1OWY2ZjE2YzM0YjVkNjVkNTM3ZWNjNWNkODUyODU5Yzg2MWYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwNTozNDowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3J5cHRvZ3JhcGh5LHB5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnM6IHVwZ3JhZGUK
IDQ0LjAuMiAtPiA0NS4wLjMsNDQuMC4yIC0+IDQ1LjAuMwoKLS0tCiAuLi4vcHl0aG9uL3B5dGhv
bjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMgICAgfCAgIDIgKy0KIC4uLi9weXRob24vcHl0aG9u
My1jcnlwdG9ncmFwaHktY3JhdGVzLmluYyAgICB8IDEwMCArKysrKysrKystLS0tLS0tLS0KIC4u
Li9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9ycy5iYiAgICB8ICAgMiArLQogLi4u
L3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS5iYiAgICAgICAgICAgIHwgICAyICstCiAuLi50
b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2ggfCAgIDYgKy0KIDUgZmls
ZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgNTYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jb21t
b24uaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBo
eS1jb21tb24uaW5jCmluZGV4IDM2OGEzNjRjZjAuLjMwMThkOTY3YjIgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY29tbW9uLmlu
YworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5
LWNvbW1vbi5pbmMKQEAgLTMsNCArMyw0IEBACiAjCiAjIEFkZGl0aW9uYWxseSBBVUggd2lsbCBk
ZXRlY3QgdGhhdCB0aGV5IHNoYXJlIHRoaXMgLmluYyBmaWxlIGFuZAogIyBwZXJmb3JtIGEgbG9j
a3N0ZXAgdXBncmFkZSBmb3IgYm90aC4KLVBWID0gIjQ0LjAuMiIKK1BWID0gIjQ1LjAuMyIKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFw
aHktY3JhdGVzLmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlw
dG9ncmFwaHktY3JhdGVzLmluYwppbmRleCBiM2FhNjYwMDJlLi5lMTc4NzkwNDQ4IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNy
YXRlcy5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0
b2dyYXBoeS1jcmF0ZXMuaW5jCkBAIC0yLDc1ICsyLDc1IEBACiAKICMgZnJvbSBDYXJnby5sb2Nr
CiBTUkNfVVJJICs9ICIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FzbjEvMC4yMC4wIFwKLSAg
ICBjcmF0ZTovL2NyYXRlcy5pby9hc24xX2Rlcml2ZS8wLjIwLjAgXAorICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2FzbjEvMC4yMS4zIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9hc24xX2Rlcml2ZS8w
LjIxLjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2F1dG9jZmcvMS40LjAgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2Jhc2U2NC8wLjIyLjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2JpdGZs
YWdzLzIuNi4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9jYy8xLjIuMSBcCisgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vYml0ZmxhZ3MvMi45LjEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NjLzEu
Mi4yMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2ZnLWlmLzEuMC4wIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9mb3JlaWduLXR5cGVzLzAuMy4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9m
b3JlaWduLXR5cGVzLXNoYXJlZC8wLjEuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaGVjay8w
LjUuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaW5kb2MvMi4wLjUgXAotICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2l0b2EvMS4wLjE0IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9saWJjLzAuMi4x
NjYgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2luZG9jLzIuMC42IFwKKyAgICBjcmF0ZTovL2Ny
YXRlcy5pby9pdG9hLzEuMC4xNSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGliYy8wLjIuMTcy
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9tZW1vZmZzZXQvMC45LjEgXAotICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL29uY2VfY2VsbC8xLjIwLjIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL29wZW5z
c2wvMC4xMC42OCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb25jZV9jZWxsLzEuMjEuMyBcCisg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb3BlbnNzbC8wLjEwLjcyIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9vcGVuc3NsLW1hY3Jvcy8wLjEuMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb3BlbnNz
bC1zeXMvMC45LjEwNCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcGVtLzMuMC40IFwKLSAgICBj
cmF0ZTovL2NyYXRlcy5pby9wa2ctY29uZmlnLzAuMy4zMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vcG9ydGFibGUtYXRvbWljLzEuMTAuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHJvYy1t
YWNybzIvMS4wLjkyIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLzAuMjMuNSBcCi0gICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1idWlsZC1jb25maWcvMC4yMy41IFwKLSAgICBjcmF0ZTov
L2NyYXRlcy5pby9weW8zLWZmaS8wLjIzLjUgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMt
bWFjcm9zLzAuMjMuNSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3MtYmFja2Vu
ZC8wLjIzLjUgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3F1b3RlLzEuMC4zNyBcCi0gICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vc2VsZl9jZWxsLzEuMC40IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9v
cGVuc3NsLXN5cy8wLjkuMTA4IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9wZW0vMy4wLjUgXAor
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BrZy1jb25maWcvMC4zLjMyIFwKKyAgICBjcmF0ZTovL2Ny
YXRlcy5pby9wb3J0YWJsZS1hdG9taWMvMS4xMS4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9w
cm9jLW1hY3JvMi8xLjAuOTUgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMvMC4yNS4wIFwK
KyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWJ1aWxkLWNvbmZpZy8wLjI1LjAgXAorICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3B5bzMtZmZpLzAuMjUuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
cHlvMy1tYWNyb3MvMC4yNS4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy1i
YWNrZW5kLzAuMjUuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcXVvdGUvMS4wLjQwIFwKKyAg
ICBjcmF0ZTovL2NyYXRlcy5pby9zZWxmX2NlbGwvMS4yLjAgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3NobGV4LzEuMy4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9zeW4vMi4wLjg5IFwKLSAg
ICBjcmF0ZTovL2NyYXRlcy5pby90YXJnZXQtbGV4aWNvbi8wLjEyLjE2IFwKLSAgICBjcmF0ZTov
L2NyYXRlcy5pby91bmljb2RlLWlkZW50LzEuMC4xNCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
dW5pbmRlbnQvMC4yLjMgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5bi8yLjAuMTAxIFwKKyAg
ICBjcmF0ZTovL2NyYXRlcy5pby90YXJnZXQtbGV4aWNvbi8wLjEzLjIgXAorICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3VuaWNvZGUtaWRlbnQvMS4wLjE4IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby91
bmluZGVudC8wLjIuNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdmNwa2cvMC4yLjE1IFwKICIK
IAotU1JDX1VSSVthc24xLTAuMjAuMC5zaGEyNTZzdW1dID0gIjJkOGI4NGI0ZWExZGUyYmYxZGNk
MmE3NTk3MzdkZGIzMjhmYjY2OTViMmE5NWViN2U0NGZlZDY3ZTM0MDZmMzIiCi1TUkNfVVJJW2Fz
bjFfZGVyaXZlLTAuMjAuMC5zaGEyNTZzdW1dID0gImEyMDA4MDlkMDEzODYyMGIzZGJhOTg5ZjFk
MDhkMDYyMGU3NjI0OGJjMWU2MmEyZWMxYjJkZjVlYjFlZTA4YWQiCitTUkNfVVJJW2FzbjEtMC4y
MS4zLnNoYTI1NnN1bV0gPSAiMmQ5YzM1MDJhNmYxYjUwYTJjNjliOTdiNzE2MzhhODFhZDNiMjFi
OTg3NDYwNDg4MDQwMWI5YjJiMGJmNzU4ZiIKK1NSQ19VUklbYXNuMV9kZXJpdmUtMC4yMS4zLnNo
YTI1NnN1bV0gPSAiMTc2NmViY2I1MTlkOGRkMTg2ZDYwZGZhOTEyNTcxZWRjYWEyYzFmOTk1ZTJl
NTY2NDNhMjYxYTg3ZGY2OWE2MSIKIFNSQ19VUklbYXV0b2NmZy0xLjQuMC5zaGEyNTZzdW1dID0g
ImFjZTUwYmFkZThlNjIzNGFhMTQwZDlhMmY1NTJiYmVlMWRiNGQzNTNmNjliODIxN2JjNTAzNDkw
ZmMxYTlmMjYiCiBTUkNfVVJJW2Jhc2U2NC0wLjIyLjEuc2hhMjU2c3VtXSA9ICI3MmIzMjU0ZjE2
MjUxYTgzODFhYTEyZTQwZTNjNGQyZjAxOTlmOGM2NTA4ZmJlY2I5ZDkxZjU3NWUwZmJiOGM2Igot
U1JDX1VSSVtiaXRmbGFncy0yLjYuMC5zaGEyNTZzdW1dID0gImIwNDhmYjYzZmQ4YjU5MjNmYzVh
YTdiMzQwZDhlMTU2YWVjN2VjMDJmMGM3OGZhOGE2ZGRjMjYxM2Y2ZjcxZGUiCi1TUkNfVVJJW2Nj
LTEuMi4xLnNoYTI1NnN1bV0gPSAiZmQ5ZGU5ZjIyMDVkNWVmM2ZkNjdlNjg1YjBkZjMzNzk5NGRk
ZDQ0OTVlMmEyOGQxODU1MDBkMGUxZWRmZWE0NyIKK1NSQ19VUklbYml0ZmxhZ3MtMi45LjEuc2hh
MjU2c3VtXSA9ICIxYjhlNTY5ODVlYzYyZDE3ZTljMTAwMWRjODljODhlY2Q3ZGMwOGU0N2ViYTVl
YzdjMjljN2I1ZWVlY2RlOTY3IgorU1JDX1VSSVtjYy0xLjIuMjMuc2hhMjU2c3VtXSA9ICI1ZjRh
Yzg2YTllNWJjMWUyYjM0NDlhYjlkN2QzYTZhNDA1ZTNkMWJiMjhkN2I5YmU4NjE0ZjU1ODQ2YWUz
NzY2IgogU1JDX1VSSVtjZmctaWYtMS4wLjAuc2hhMjU2c3VtXSA9ICJiYWYxZGU0MzM5NzYxNTg4
YmMwNjE5ZTNjYmMwMTIwZWU1ODJlYmI3NGI1M2I0ZWZiZjc5MTE3YmQyZGE0MGZkIgogU1JDX1VS
SVtmb3JlaWduLXR5cGVzLTAuMy4yLnNoYTI1NnN1bV0gPSAiZjZmMzM5ZWI4YWRjMDUyY2QyY2E3
ODkxMGZkYTg2OWFlZmEzOGQyMmQ1Y2I2NDhlNjQ4NWU0ZDNmYzA2ZjNiMSIKIFNSQ19VUklbZm9y
ZWlnbi10eXBlcy1zaGFyZWQtMC4xLjEuc2hhMjU2c3VtXSA9ICIwMGIwMjI4NDExOTA4Y2E4Njg1
ZGJhN2ZjMmNkZDcwZWM5OTkwYTZlNzUzZTg5YjZhYzkxYTg0YzQwZmJhZjRiIgogU1JDX1VSSVto
ZWNrLTAuNS4wLnNoYTI1NnN1bV0gPSAiMjMwNGUwMDk4M2Y4N2ZmYjM4YjU1YjQ0NGI1ZTNiNjBh
ODg0YjVkMzBjMGZjYTdkODJmZTMzNDQ5YmJlNTVlYSIKLVNSQ19VUklbaW5kb2MtMi4wLjUuc2hh
MjU2c3VtXSA9ICJiMjQ4ZjUyMjRkMWQ2MDYwMDVlMDJjOTdmNWFhNGU4OGVlYjIzMDQ4OGJjYzAz
YmM5Y2E0ZDc5OTEzOTlmMmI1IgotU1JDX1VSSVtpdG9hLTEuMC4xNC5zaGEyNTZzdW1dID0gImQ3
NWEyYTRiMWIxOTBhZmI2ZjU0MjVmMTBmNmE4Zjk1OWQyZWEwYjljMmIxZDc5NTUzNTUxODUwNTM5
ZTQ2NzQiCi1TUkNfVVJJW2xpYmMtMC4yLjE2Ni5zaGEyNTZzdW1dID0gImMyY2NjMTA4YmJjMGIx
MzMxYmQwNjE4NjRlN2NkODIzYzBjYWI2NjBiYmU2OTcwZTY2ZTJjMDYxNGRlY2RlMzYiCitTUkNf
VVJJW2luZG9jLTIuMC42LnNoYTI1NnN1bV0gPSAiZjRjNzI0NWEwODUwNDk1NTYwNTY3MGRiZjE0
MWZjZWFiOTc1ZjE1Y2EyMTU3MDY5NmFlYmU5ZDJlNzE1NzZiZCIKK1NSQ19VUklbaXRvYS0xLjAu
MTUuc2hhMjU2c3VtXSA9ICI0YTVmMTNiODU4YzhkMzE0ZWUzZThmNjM5MDExZjdjY2VmZTcxZjk3
Zjk2ZTUwMTUxZmI5OTFmMjY3OTI4ZTJjIgorU1JDX1VSSVtsaWJjLTAuMi4xNzIuc2hhMjU2c3Vt
XSA9ICJkNzUwYWYwNDJmN2VmNGY3MjQzMDZkZTAyOWQxODgzNmMyNmMxNzY1YTU0YTZhM2YwOTRj
YmQyM2E3MjY3ZmZhIgogU1JDX1VSSVttZW1vZmZzZXQtMC45LjEuc2hhMjU2c3VtXSA9ICI0ODgw
MTZiZmFlNDU3YjAzNmQ5OTYwOTJmNmNiNDQ4Njc3NjExY2U0NDQ5ZTk3MGNlYWY0MjY5NTIwM2Yy
MThhIgotU1JDX1VSSVtvbmNlX2NlbGwtMS4yMC4yLnNoYTI1NnN1bV0gPSAiMTI2MWZlN2UzM2M3
M2IzNTRlYWI0M2IxMjczYTU3YzhmOTY3ZDAzOTFlODAzNTNlNTFmNzY0YWMwMmNmNjc3NSIKLVNS
Q19VUklbb3BlbnNzbC0wLjEwLjY4LnNoYTI1NnN1bV0gPSAiNjE3NGJjNDhmMTAyZDIwODc4M2My
Yzg0YmY5MzFiYjc1OTI3YTYxNzg2Njg3MGRlOGE0ZWE4NTU5N2Y4NzFmNSIKK1NSQ19VUklbb25j
ZV9jZWxsLTEuMjEuMy5zaGEyNTZzdW1dID0gIjQyZjVlMTVjOTk1M2M1ZTRjY2NlZWIyZTczODJh
NzE2NDgyYzM0NTE1MzE1ZjdiMDM1MzJiOGI0ZTgzOTNkMmQiCitTUkNfVVJJW29wZW5zc2wtMC4x
MC43Mi5zaGEyNTZzdW1dID0gImZlZGZlYTdkNThhMWY3MzExODQzMGE1NWRhNmEyODZlN2IwNDQ5
NjE3MzZjZTk2YTE2YTE3MDY4ZWEyNWU1ZGEiCiBTUkNfVVJJW29wZW5zc2wtbWFjcm9zLTAuMS4x
LnNoYTI1NnN1bV0gPSAiYTk0ODY2NmI2MzdhMGY0NjVlODU2NGM3M2U4OWQ0ZGRlMDBkNzJkNGQ0
NzNjYzk3MmYzOTBmYzNkY2VlN2Q5YyIKLVNSQ19VUklbb3BlbnNzbC1zeXMtMC45LjEwNC5zaGEy
NTZzdW1dID0gIjQ1YWJmMzA2Y2JmOTlkZWJjODE5NWI2NmI3MzQ2NDk4ZDdiMTBjMjEwZGU1MDQx
OGI1Y2NkN2NlYmEwOGM3NDEiCi1TUkNfVVJJW3BlbS0zLjAuNC5zaGEyNTZzdW1dID0gIjhlNDU5
MzY1ZTU5MDczNmE1NGMzZmE1NjE5NDdjODQ4Mzc1MzRiOGU5YWY2ZmM1YmY3ODEzMDdlODI2NThm
YWUiCi1TUkNfVVJJW3BrZy1jb25maWctMC4zLjMxLnNoYTI1NnN1bV0gPSAiOTUzZWM4NjEzOThk
Y2NjZTEwYzY3MGRmZWFmM2VjNDkxMWNhNDc5ZTljMDIxNTRiM2EyMTUxNzhjNWY1NjZmMiIKLVNS
Q19VUklbcG9ydGFibGUtYXRvbWljLTEuMTAuMC5zaGEyNTZzdW1dID0gIjI4MGRjMjQ0NTMwNzFm
MWI2Mzk1NDE3MTk4NWEwYjBkMzAwNThkMjg3OTYwOTY4YjliMmFjYTI2NGM4ZDRlZTYiCi1TUkNf
VVJJW3Byb2MtbWFjcm8yLTEuMC45Mi5zaGEyNTZzdW1dID0gIjM3ZDM1NDRiM2YyNzQ4YzU0ZTE0
NzY1NWVkYjUwMjU3NTJlMjMwMzE0NWI1YWVmYjNjM2VhMmM3OGI5NzNiYjAiCi1TUkNfVVJJW3B5
bzMtMC4yMy41LnNoYTI1NnN1bV0gPSAiNzc3OGJmZmQ4NWNmMzgxNzVhYzFmNTQ1NTA5NjY1ZDBi
OWI5MmExOThjYTc5NDFmMTMxZjg1ZjdhNGY5YTg3MiIKLVNSQ19VUklbcHlvMy1idWlsZC1jb25m
aWctMC4yMy41LnNoYTI1NnN1bV0gPSAiOTRmNmNiZTg2ZWYzYmYxODk5OGQ5ZGY2ZTBmM2ZjMTA1
MGE4YzVlZmE0MDliZjcxMmU2NjFhNDM2NmUwMTBmYiIKLVNSQ19VUklbcHlvMy1mZmktMC4yMy41
LnNoYTI1NnN1bV0gPSAiZTlmMWI0YzQzMWMwYmIxYzhmYjBhMzM4NzA5ODU5ZWVkMGQwMzBmZjZk
YWEzNDM2OGQzYjE1MmE2M2RmZGQ4ZCIKLVNSQ19VUklbcHlvMy1tYWNyb3MtMC4yMy41LnNoYTI1
NnN1bV0gPSAiZmJjMjIwMTMyOGY2M2M0NzEwZjY4YWJkZjY1M2M4OWQ4ZGJjMjg1OGI4OGM1ZDg4
YjBmZjM4YTc1Mjg4YTlkYSIKLVNSQ19VUklbcHlvMy1tYWNyb3MtYmFja2VuZC0wLjIzLjUuc2hh
MjU2c3VtXSA9ICJmY2E2NzI2YWQwZjNkYTljOWRlMDkzZDZmMTE2YTkzYzFhMzhlNDE3ZWQ3M2Jm
MTM4NDcyY2Y0MDY0ZjcyMDI4IgotU1JDX1VSSVtxdW90ZS0xLjAuMzcuc2hhMjU2c3VtXSA9ICJi
NWI5ZDM0Yjg5OTFkMTlkOTgwODFiNDZlYWNkZDhlYjU4YzZmMmIyMDExMzlmN2M1ZjY0M2NjMTU1
YTYzM2FmIgotU1JDX1VSSVtzZWxmX2NlbGwtMS4wLjQuc2hhMjU2c3VtXSA9ICJkMzY5YTk2Zjk3
ODYyM2ViM2RjMjg4MDdjNDg1MmQ2Y2M2MTdmZWQ1M2RhNWQzYzQwMGZlZmYxZWYzNGE3MTRhIgor
U1JDX1VSSVtvcGVuc3NsLXN5cy0wLjkuMTA4LnNoYTI1NnN1bV0gPSAiZTE0NWUxNjUxZTg1OGU4
MjBlNDg2MGY3YjljNWUxNjliYzFkOGNlMWM4NjA0M2JlNzlmYTdiNzYzNDgyMTg0NyIKK1NSQ19V
UklbcGVtLTMuMC41LnNoYTI1NnN1bV0gPSAiMzhhZjM4ZTg0NzBhYzlkZWUzY2UxYmFlMWFmOWMx
NjcxZmZmYzQ0ZGRmZDhiZDFkMGEzNDQ1YmYzNDlhOGVmMyIKK1NSQ19VUklbcGtnLWNvbmZpZy0w
LjMuMzIuc2hhMjU2c3VtXSA9ICI3ZWRkZGJkMGI1MmQ3MzJiMjFhZDlhNWZhYjVjNzA0YzE0Y2Q5
NDllNWU5YTFlYzU5MjlhMjRmZGVkMWI5MDRjIgorU1JDX1VSSVtwb3J0YWJsZS1hdG9taWMtMS4x
MS4wLnNoYTI1NnN1bV0gPSAiMzUwZTliNDhjYmM2YjBlMDI4YjA0NzNiMTE0NDU0YzYzMTZlNTcz
MzZlZTE4NGNlYWI2ZTUzZjcyYzE3OGIzZSIKK1NSQ19VUklbcHJvYy1tYWNybzItMS4wLjk1LnNo
YTI1NnN1bV0gPSAiMDJiM2U1ZTY4YTNhMWEwMmFhZDNlYzQ5MGE5ODAwN2NiYzEzYzM3Y2JlODRh
M2NkN2I4ZTQwNmQ3NmU3Zjc3OCIKK1NSQ19VUklbcHlvMy0wLjI1LjAuc2hhMjU2c3VtXSA9ICJm
MjM5ZDY1NjM2M2JjZWU3M2FmZWY4NTI3N2YxYjI4MWU4YWM2MjEyYTFkNDJhYTkwZTU1YjkwZWQ0
M2M0N2E0IgorU1JDX1VSSVtweW8zLWJ1aWxkLWNvbmZpZy0wLjI1LjAuc2hhMjU2c3VtXSA9ICI3
NTVlYTY3MWExYzM0MDQ0ZmExNjUyNDdhYWY2ZjQxOWNhMzljYWE2MDAzYWVlNzkxYTBkZjI3MTNk
OGYxYjZkIgorU1JDX1VSSVtweW8zLWZmaS0wLjI1LjAuc2hhMjU2c3VtXSA9ICJmYzk1YTJlNjcw
OTFlNDQ3OTFkNGVhMzAwZmY3NDRiZTUyOTNmMzk0ZjFiYWZkOWY3OGMwODA4MTRkMzU5NTZlIgor
U1JDX1VSSVtweW8zLW1hY3Jvcy0wLjI1LjAuc2hhMjU2c3VtXSA9ICJhMTc5NjQxZDFiOTM5MjA4
MjlhNjJmMTVlODdjMGVkNzkxYjZjOGRiMjI3MWJhMGZkN2MyNjg2MDkwNTEwMjE0IgorU1JDX1VS
SVtweW8zLW1hY3Jvcy1iYWNrZW5kLTAuMjUuMC5zaGEyNTZzdW1dID0gIjlkZmY4NWViY2FhYjhj
NDQxYjBlM2Y3YWU0MGE2OTYzZWNlYThhOWY1ZTc0ZjY0N2UzM2ZjZjVlYzlhMWU4OWUiCitTUkNf
VVJJW3F1b3RlLTEuMC40MC5zaGEyNTZzdW1dID0gIjE4ODVjMDM5NTcwZGMwMGRjYjRmZjA4N2E4
OWUxODVmZDU2YmFlMjM0ZGRjN2YwNTZhOTQ1YmYzNjQ2NzI0OGQiCitTUkNfVVJJW3NlbGZfY2Vs
bC0xLjIuMC5zaGEyNTZzdW1dID0gIjBmN2Q5NWE1NDUxMWUwYzdiZTNmNTFlODg2N2FhOGNmMzUx
NDhkN2I5NDQ1ZDQ0ZGUyZjk0M2UyYjIwNmU3NDkiCiBTUkNfVVJJW3NobGV4LTEuMy4wLnNoYTI1
NnN1bV0gPSAiMGZkYTJmZjBkMDg0MDE5YmE0ZDdjNmYzNzFjOTVkOGZkNzVjZTM1MjRjM2NiOGZi
NjUzYTMwMjNmNjMyM2U2NCIKLVNSQ19VUklbc3luLTIuMC44OS5zaGEyNTZzdW1dID0gIjQ0ZDQ2
NDgyZjFjMWM4N2FjZDg0ZGVhMjBjMWJmNWViZmY0Yzc1NzAwOWVkNmJmMTljZmQzNmZiMTBlOTJj
NGUiCi1TUkNfVVJJW3RhcmdldC1sZXhpY29uLTAuMTIuMTYuc2hhMjU2c3VtXSA9ICI2MWM0MWFm
MjdkZDZkMWUyN2IxYjE2YjQ4OWRiNzk4NDQzNDc4Y2VmMWYwNmE2NjBjOTZkYjYxN2JhNWRlM2Ix
IgotU1JDX1VSSVt1bmljb2RlLWlkZW50LTEuMC4xNC5zaGEyNTZzdW1dID0gImFkYjllNmNhNGY4
NjllMTE4MDcyOGI3OTUwZTM1OTIyYTdmYzYzOTdmN2I2NDE0OTllOGYzZWYwNmU1MGRjODMiCi1T
UkNfVVJJW3VuaW5kZW50LTAuMi4zLnNoYTI1NnN1bV0gPSAiYzdkZTdkNzNlMTc1NDQ4N2NiNTgz
NjRlZTkwNmE0OTk5MzdhMGRmYWJkODZiY2I5ODBmYTk5ZWM4YzhmYTJjZSIKK1NSQ19VUklbc3lu
LTIuMC4xMDEuc2hhMjU2c3VtXSA9ICI4Y2UyYjdmYzk0MWIzYTI0MTM4YTBhN2NmOGU4NThiZmM2
YTk5MmU3OTc4YTA2OGE1Yzc2MGRlYjBlZDQzY2FmIgorU1JDX1VSSVt0YXJnZXQtbGV4aWNvbi0w
LjEzLjIuc2hhMjU2c3VtXSA9ICJlNTAyZjc4Y2RiYjhiYTQ3MThmNTY2YzQxOGM1MmJjNzI5MTI2
ZmZkMTZiYWVlNWJhYTcxOGNmMjVkZDVhNjlhIgorU1JDX1VSSVt1bmljb2RlLWlkZW50LTEuMC4x
OC5zaGEyNTZzdW1dID0gIjVhNWYzOTQwNGE1ZGE1MDcxMmE0YzFlZWNmMjVlOTBkZDYyYjYxMzUw
MmI3ZTkyNWZkNGU0ZDE5YjVjOTY1MTIiCitTUkNfVVJJW3VuaW5kZW50LTAuMi40LnNoYTI1NnN1
bV0gPSAiNzI2NGUxMDdmNTUzY2NhZTg3OWQyMWZiZWExZDY3MjRhYzc4NWU4YzNiZmM3NjIxMzc5
NTliNTgwMjgyNmVmMyIKIFNSQ19VUklbdmNwa2ctMC4yLjE1LnNoYTI1NnN1bV0gPSAiYWNjZDRl
YTYyZjdiYjdhODJmZTIzMDY2ZmIwOTU3ZDQ4ZWY2NzdmNmVlYjgyMTVmMzcyZjUyZTQ4YmIzMjQy
NiIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlw
dG9ncmFwaHktdmVjdG9ycy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1jcnlwdG9ncmFwaHktdmVjdG9ycy5iYgppbmRleCAwNzUxMTVmM2Y5Li40NjU5NzEzNGI2IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3Jh
cGh5LXZlY3RvcnMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWNyeXB0b2dyYXBoeS12ZWN0b3JzLmJiCkBAIC05LDcgKzksNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT04YzM2MTdkYjRmYjZmYWUwMWYxZDI1M2FiOTE1MTFlNCBc
CiAjIE5PVEU6IE1ha2Ugc3VyZSB0byBrZWVwIHRoaXMgcmVjaXBlIGF0IHRoZSBzYW1lIHZlcnNp
b24gYXMgcHl0aG9uMy1jcnlwdG9ncmFwaHkKICMgICAgICAgVXBncmFkZSBib3RoIHJlY2lwZXMg
YXQgdGhlIHNhbWUgdGltZQogcmVxdWlyZSBweXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5j
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWIzMmUxNTZiNmU3ZWFmNmQ4YzcyN2EzMjI0NTk2N2Rj
Y2UwNDk0ODczMDE0ODJmY2EzOGMwYzVmZGM4NGU0YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJi
NjVjZWJkYzMzNGM2YjlkYjhjNzkwODFhMDgyNTNmZGRmMjYyZDAwOWQyYzkxNDM5OGVkZDI0YTQz
MjFkYjIxIgogCiBQWVBJX1BBQ0tBR0UgPSAiY3J5cHRvZ3JhcGh5X3ZlY3RvcnMiCiBVUFNUUkVB
TV9DSEVDS19QWVBJX1BBQ0tBR0UgPSAiJHtQWVBJX1BBQ0tBR0V9IgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkuYmIKaW5kZXggNTY2
ZTgwYzRmOS4uZTQwZTYyZjYyNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExEU0hBUkVE
ICs9ICItcHRocmVhZCIKICMgTk9URTogTWFrZSBzdXJlIHRvIGtlZXAgdGhpcyByZWNpcGUgYXQg
dGhlIHNhbWUgdmVyc2lvbiBhcyBweXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzCiAjICAgICAg
IFVwZ3JhZGUgYm90aCByZWNpcGVzIGF0IHRoZSBzYW1lIHRpbWUKIHJlcXVpcmUgcHl0aG9uMy1j
cnlwdG9ncmFwaHktY29tbW9uLmluYwotU1JDX1VSSVtzaGEyNTZzdW1dID0gImM2MzQ1NGFhMjYx
YTBjZjBjNWI0NzE4MzQ5NjI5NzkzZTllNjM0OTkzNTM4ZGI4NDExNjViM2RmNzRmMzdlYzAiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZWMyMTMxM2RkMzM1YzUxZDc4NzdiYWYyOTcyNTY5ZjQwYTQy
OTFiNzZhMGNlNTEzOTE1MjNhZTM1OGQwNTg5OSIKIAogU1JDX1VSSSArPSAiZmlsZTovLzAwMDEt
cHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaCBcCiAg
ICAgICAgICAgICBmaWxlOi8vY2hlY2stbWVtZnJlZS5weSBcCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LzAwMDEtcHlwcm9qZWN0
LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkvMDAwMS1weXByb2plY3QudG9t
bC1yZW1vdmUtYmVuY2htYXJrLWRpc2FibGUtb3B0aW9uLnBhdGNoCmluZGV4IDE5YWRlNjBjMDMu
LjQyODc2ZTM0ODkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1jcnlwdG9ncmFwaHkvMDAwMS1weXByb2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJrLWRp
c2FibGUtb3B0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1jcnlwdG9ncmFwaHkvMDAwMS1weXByb2plY3QudG9tbC1yZW1vdmUtYmVuY2htYXJrLWRp
c2FibGUtb3B0aW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2ODJjOTkzNDVhN2M4Y2Jh
ODdlOWNlYTExODdhYTAwN2VlZDk2MmZhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3
ZGE1NTRkNTJiZmVkNDM3MDc2NmQ1YWZkOTRiYzc4NjU3OTEyMzFkIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogTWluZ2xpIFl1IDxtaW5nbGkueXVAd2luZHJpdmVyLmNvbT4KIERhdGU6
IFR1ZSwgMTcgTWF5IDIwMjIgMTc6MjI6NDggKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gcHlwcm9q
ZWN0LnRvbWw6IHJlbW92ZSAtLWJlbmNobWFyay1kaXNhYmxlIG9wdGlvbgpAQCAtMjYsMTAgKzI2
LDEwIEBAIFNpZ25lZC1vZmYtYnk6IFRpbSBPcmxpbmcgPHRpbS5vcmxpbmdAa29uc3Vsa28uY29t
PgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZm
IC0tZ2l0IGEvcHlwcm9qZWN0LnRvbWwgYi9weXByb2plY3QudG9tbAotaW5kZXggMTNkOGIyYy4u
ZTkzZGVlOSAxMDA2NDQKK2luZGV4IGQ5NGExZjUuLmMwZjg3YTcgMTAwNjQ0CiAtLS0gYS9weXBy
b2plY3QudG9tbAogKysrIGIvcHlwcm9qZWN0LnRvbWwKLUBAIC0xMTgsNyArMTE4LDcgQEAgZXhj
bHVkZSA9IFsKK0BAIC0xMjksNyArMTI5LDcgQEAgZXhjbHVkZSA9IFsKICBdCiAgCiAgW3Rvb2wu
cHl0ZXN0LmluaV9vcHRpb25zXQotLSAKMi40Ny4xCgo=

--===============3792214276766992225==--

