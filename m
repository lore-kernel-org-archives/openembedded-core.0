Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AD3D10DC0
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:05:59 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.148757.1733047552833607560
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:05:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Y8UyO+8M;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=EyAGvPmf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019381af0812-de1f261c-5b28-4bf2-976c-05b6b2f77a40-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=niAcMYyZTDKIjbQtOHBYiery6wbSZys8/NJHH5t9OeM=;
	b=Y8UyO+8M6Gr0z7hIYmVYnFjZbCqMYxi4KuRaF69QNKMjcuIcVsRZTRSQRQs4Ydxn
	M0gSG3es9zUevoaK0Xlf56RxpPCvSJZJI1IlKgn5QPWA5X/Nct0ZVeoB1rVFQRd/Sek
	xfFfxIHI0E7IKbiaVR/Ms3JCkmGJNfZZyY9FtO4Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=niAcMYyZTDKIjbQtOHBYiery6wbSZys8/NJHH5t9OeM=;
	b=EyAGvPmfhwVhRb+HT6uxdHZuD7FeE2Ly+BReomfi1qTXuFgmJ6ih3hQKhwu6p4wv
	SRvl438lQbYT3pcaLfyi401C8+GyJrwHgk1hVPN/ChA6u2f4L9kJk5doKNhV3q7CxCN
	J/4EzkgPTXv7cogsgeF6R4UD+7cEmV8Dt9V8JBlQ=
Content-Type: multipart/mixed; boundary="===============1855396950573239128=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>, 
	Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors,python3-cryptography: upgrading to
 44.0.0,44.0.0 SUCCEEDED
Message-ID: <0101019381af0812-de1f261c-5b28-4bf2-976c-05b6b2f77a40-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:05:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208054

--===============1855396950573239128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography-vectors,python3-cryptography* to *44.0.0,44.0.0* has Succeeded.

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
From 012b0bc90b5a3d29d67730f0e17a7f5c7e2f8998 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Dec 2024 05:42:15 +0000
Subject: [PATCH] python3-cryptography-vectors,python3-cryptography: upgrade
 43.0.3 -> 44.0.0,43.0.3 -> 44.0.0

---
 .../python/python3-cryptography-common.inc    |  2 +-
 .../python/python3-cryptography-crates.inc    | 78 ++++++++++---------
 .../python/python3-cryptography-vectors.bb    |  2 +-
 .../python/python3-cryptography.bb            |  2 +-
 ...toml-remove-benchmark-disable-option.patch |  6 +-
 5 files changed, 47 insertions(+), 43 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography-common.inc b/meta/recipes-devtools/python/python3-cryptography-common.inc
index 288f4c9f70..4220c7d62c 100644
--- a/meta/recipes-devtools/python/python3-cryptography-common.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-common.inc
@@ -3,4 +3,4 @@
 #
 # Additionally AUH will detect that they share this .inc file and
 # perform a lockstep upgrade for both.
-PV = "43.0.3"
+PV = "44.0.0"
diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index b30d96eea1..18f346aed4 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -1,72 +1,76 @@
 # Autogenerated with 'bitbake -c update_crates python3-cryptography'
 
-# from src/rust/Cargo.lock
+# from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/asn1/0.16.2 \
-    crate://crates.io/asn1_derive/0.16.2 \
-    crate://crates.io/autocfg/1.3.0 \
+    crate://crates.io/asn1/0.20.0 \
+    crate://crates.io/asn1_derive/0.20.0 \
+    crate://crates.io/autocfg/1.4.0 \
     crate://crates.io/base64/0.22.1 \
     crate://crates.io/bitflags/2.6.0 \
-    crate://crates.io/cc/1.1.6 \
+    crate://crates.io/cc/1.2.1 \
     crate://crates.io/cfg-if/1.0.0 \
     crate://crates.io/foreign-types/0.3.2 \
     crate://crates.io/foreign-types-shared/0.1.1 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/indoc/2.0.5 \
-    crate://crates.io/libc/0.2.155 \
+    crate://crates.io/itoa/1.0.14 \
+    crate://crates.io/libc/0.2.166 \
     crate://crates.io/memoffset/0.9.1 \
-    crate://crates.io/once_cell/1.19.0 \
+    crate://crates.io/once_cell/1.20.2 \
     crate://crates.io/openssl/0.10.68 \
     crate://crates.io/openssl-macros/0.1.1 \
     crate://crates.io/openssl-sys/0.9.104 \
     crate://crates.io/pem/3.0.4 \
-    crate://crates.io/pkg-config/0.3.30 \
-    crate://crates.io/portable-atomic/1.7.0 \
-    crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/pyo3/0.22.2 \
-    crate://crates.io/pyo3-build-config/0.22.2 \
-    crate://crates.io/pyo3-ffi/0.22.2 \
-    crate://crates.io/pyo3-macros/0.22.2 \
-    crate://crates.io/pyo3-macros-backend/0.22.2 \
-    crate://crates.io/quote/1.0.36 \
+    crate://crates.io/pkg-config/0.3.31 \
+    crate://crates.io/portable-atomic/1.10.0 \
+    crate://crates.io/proc-macro2/1.0.92 \
+    crate://crates.io/pyo3/0.23.2 \
+    crate://crates.io/pyo3-build-config/0.23.2 \
+    crate://crates.io/pyo3-ffi/0.23.2 \
+    crate://crates.io/pyo3-macros/0.23.2 \
+    crate://crates.io/pyo3-macros-backend/0.23.2 \
+    crate://crates.io/quote/1.0.37 \
     crate://crates.io/self_cell/1.0.4 \
-    crate://crates.io/syn/2.0.71 \
-    crate://crates.io/target-lexicon/0.12.15 \
-    crate://crates.io/unicode-ident/1.0.12 \
+    crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/syn/2.0.89 \
+    crate://crates.io/target-lexicon/0.12.16 \
+    crate://crates.io/unicode-ident/1.0.14 \
     crate://crates.io/unindent/0.2.3 \
     crate://crates.io/vcpkg/0.2.15 \
 "
 
-SRC_URI[asn1-0.16.2.sha256sum] = "532ceda058281b62096b2add4ab00ab3a453d30dee28b8890f62461a0109ebbd"
-SRC_URI[asn1_derive-0.16.2.sha256sum] = "56e6076d38cc17cc22b0f65f31170a2ee1975e6b07f0012893aefd86ce19c987"
-SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
+SRC_URI[asn1-0.20.0.sha256sum] = "2d8b84b4ea1de2bf1dcd2a759737ddb328fb6695b2a95eb7e44fed67e3406f32"
+SRC_URI[asn1_derive-0.20.0.sha256sum] = "a200809d0138620b3dba989f1d08d0620e76248bc1e62a2ec1b2df5eb1ee08ad"
+SRC_URI[autocfg-1.4.0.sha256sum] = "ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
 SRC_URI[bitflags-2.6.0.sha256sum] = "b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de"
-SRC_URI[cc-1.1.6.sha256sum] = "2aba8f4e9906c7ce3c73463f62a7f0c65183ada1a2d47e397cc8810827f9694f"
+SRC_URI[cc-1.2.1.sha256sum] = "fd9de9f2205d5ef3fd67e685b0df337994ddd4495e2a28d185500d0e1edfea47"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
 SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
-SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
+SRC_URI[itoa-1.0.14.sha256sum] = "d75a2a4b1b190afb6f5425f10f6a8f959d2ea0b9c2b1d79553551850539e4674"
+SRC_URI[libc-0.2.166.sha256sum] = "c2ccc108bbc0b1331bd061864e7cd823c0cab660bbe6970e66e2c0614decde36"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
-SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
+SRC_URI[once_cell-1.20.2.sha256sum] = "1261fe7e33c73b354eab43b1273a57c8f967d0391e80353e51f764ac02cf6775"
 SRC_URI[openssl-0.10.68.sha256sum] = "6174bc48f102d208783c2c84bf931bb75927a617866870de8a4ea85597f871f5"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
 SRC_URI[openssl-sys-0.9.104.sha256sum] = "45abf306cbf99debc8195b66b7346498d7b10c210de50418b5ccd7ceba08c741"
 SRC_URI[pem-3.0.4.sha256sum] = "8e459365e590736a54c3fa561947c84837534b8e9af6fc5bf781307e82658fae"
-SRC_URI[pkg-config-0.3.30.sha256sum] = "d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec"
-SRC_URI[portable-atomic-1.7.0.sha256sum] = "da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265"
-SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[pyo3-0.22.2.sha256sum] = "831e8e819a138c36e212f3af3fd9eeffed6bf1510a805af35b0edee5ffa59433"
-SRC_URI[pyo3-build-config-0.22.2.sha256sum] = "1e8730e591b14492a8945cdff32f089250b05f5accecf74aeddf9e8272ce1fa8"
-SRC_URI[pyo3-ffi-0.22.2.sha256sum] = "5e97e919d2df92eb88ca80a037969f44e5e70356559654962cbb3316d00300c6"
-SRC_URI[pyo3-macros-0.22.2.sha256sum] = "eb57983022ad41f9e683a599f2fd13c3664d7063a3ac5714cae4b7bee7d3f206"
-SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] = "ec480c0c51ddec81019531705acac51bcdbeae563557c982aa8263bb96880372"
-SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
+SRC_URI[pkg-config-0.3.31.sha256sum] = "953ec861398dccce10c670dfeaf3ec4911ca479e9c02154b3a215178c5f566f2"
+SRC_URI[portable-atomic-1.10.0.sha256sum] = "280dc24453071f1b63954171985a0b0d30058d287960968b9b2aca264c8d4ee6"
+SRC_URI[proc-macro2-1.0.92.sha256sum] = "37d3544b3f2748c54e147655edb5025752e2303145b5aefb3c3ea2c78b973bb0"
+SRC_URI[pyo3-0.23.2.sha256sum] = "f54b3d09cbdd1f8c20650b28e7b09e338881482f4aa908a5f61a00c98fba2690"
+SRC_URI[pyo3-build-config-0.23.2.sha256sum] = "3015cf985888fe66cfb63ce0e321c603706cd541b7aec7ddd35c281390af45d8"
+SRC_URI[pyo3-ffi-0.23.2.sha256sum] = "6fca7cd8fd809b5ac4eefb89c1f98f7a7651d3739dfb341ca6980090f554c270"
+SRC_URI[pyo3-macros-0.23.2.sha256sum] = "34e657fa5379a79151b6ff5328d9216a84f55dc93b17b08e7c3609a969b73aa0"
+SRC_URI[pyo3-macros-backend-0.23.2.sha256sum] = "295548d5ffd95fd1981d2d3cf4458831b21d60af046b729b6fd143b0ba7aee2f"
+SRC_URI[quote-1.0.37.sha256sum] = "b5b9d34b8991d19d98081b46eacdd8eb58c6f2b201139f7c5f643cc155a633af"
 SRC_URI[self_cell-1.0.4.sha256sum] = "d369a96f978623eb3dc28807c4852d6cc617fed53da5d3c400feff1ef34a714a"
-SRC_URI[syn-2.0.71.sha256sum] = "b146dcf730474b4bcd16c311627b31ede9ab149045db4d6088b3becaea046462"
-SRC_URI[target-lexicon-0.12.15.sha256sum] = "4873307b7c257eddcb50c9bedf158eb669578359fb28428bef438fec8e6ba7c2"
-SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
+SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
+SRC_URI[syn-2.0.89.sha256sum] = "44d46482f1c1c87acd84dea20c1bf5ebff4c757009ed6bf19cfd36fb10e92c4e"
+SRC_URI[target-lexicon-0.12.16.sha256sum] = "61c41af27dd6d1e27b1b16b489db798443478cef1f06a660c96db617ba5de3b1"
+SRC_URI[unicode-ident-1.0.14.sha256sum] = "adb9e6ca4f869e1180728b7950e35922a7fc6397f7b641499e8f3ef06e50dc83"
 SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
 SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 02d10dbfa7..a03b464a29 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "ff6a885265f484e8907277614b73e9c774b01658623ad763dde2858188e486b4"
+SRC_URI[sha256sum] = "106228766c45b9a5ffd1a8b3e254f0560c821da79d5cd7fd113a17e3753580ab"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 484dc1129a..69329ec954 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -11,7 +11,7 @@ LDSHARED += "-pthread"
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography-vectors
 #       Upgrade both recipes at the same time
 require python3-cryptography-common.inc
-SRC_URI[sha256sum] = "315b9001266a492a6ff443b61238f956b214dbec9910a081ba5b6646a055a805"
+SRC_URI[sha256sum] = "cd4e834f340b4293430701e772ec543b0fbe6c2dea510a5286fe0acabe153a02"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 4dcaa5d8d4..31ca54d6d0 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From e12a40966069083ed0a3dd270d9271f9cd5a5941 Mon Sep 17 00:00:00 2001
+From f259346fa4e45a4289ddb06c897b87c8fd839630 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,10 +26,10 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 03b178d..2ddcb48 100644
+index 949d684..8c62432 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
-@@ -117,7 +117,7 @@ exclude = [
+@@ -118,7 +118,7 @@ exclude = [
  ]
  
  [tool.pytest.ini_options]
-- 
2.44.1


--===============1855396950573239128==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-vectors-python3-cryptography-up.patch"

RnJvbSAwMTJiMGJjOTBiNWEzZDI5ZDY3NzMwZjBlMTdhN2Y1YzdlMmY4OTk4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBEZWMgMjAyNCAwNTo0MjoxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnMscHl0aG9uMy1jcnlwdG9ncmFwaHk6IHVwZ3JhZGUK
IDQzLjAuMyAtPiA0NC4wLjAsNDMuMC4zIC0+IDQ0LjAuMAoKLS0tCiAuLi4vcHl0aG9uL3B5dGhv
bjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMgICAgfCAgMiArLQogLi4uL3B5dGhvbi9weXRob24z
LWNyeXB0b2dyYXBoeS1jcmF0ZXMuaW5jICAgIHwgNzggKysrKysrKysrKy0tLS0tLS0tLQogLi4u
L3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzLmJiICAgIHwgIDIgKy0KIC4uLi9w
eXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkuYmIgICAgICAgICAgICB8ICAyICstCiAuLi50b21s
LXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2ggfCAgNiArLQogNSBmaWxlcyBj
aGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCA0MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5p
bmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LWNv
bW1vbi5pbmMKaW5kZXggMjg4ZjRjOWY3MC4uNDIyMGM3ZDYyYyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5jCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY29t
bW9uLmluYwpAQCAtMyw0ICszLDQgQEAKICMKICMgQWRkaXRpb25hbGx5IEFVSCB3aWxsIGRldGVj
dCB0aGF0IHRoZXkgc2hhcmUgdGhpcyAuaW5jIGZpbGUgYW5kCiAjIHBlcmZvcm0gYSBsb2Nrc3Rl
cCB1cGdyYWRlIGZvciBib3RoLgotUFYgPSAiNDMuMC4zIgorUFYgPSAiNDQuMC4wIgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS1j
cmF0ZXMuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dy
YXBoeS1jcmF0ZXMuaW5jCmluZGV4IGIzMGQ5NmVlYTEuLjE4ZjM0NmFlZDQgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktY3JhdGVz
LmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3Jh
cGh5LWNyYXRlcy5pbmMKQEAgLTEsNzIgKzEsNzYgQEAKICMgQXV0b2dlbmVyYXRlZCB3aXRoICdi
aXRiYWtlIC1jIHVwZGF0ZV9jcmF0ZXMgcHl0aG9uMy1jcnlwdG9ncmFwaHknCiAKLSMgZnJvbSBz
cmMvcnVzdC9DYXJnby5sb2NrCisjIGZyb20gQ2FyZ28ubG9jawogU1JDX1VSSSArPSAiIFwKLSAg
ICBjcmF0ZTovL2NyYXRlcy5pby9hc24xLzAuMTYuMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
YXNuMV9kZXJpdmUvMC4xNi4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9hdXRvY2ZnLzEuMy4w
IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9hc24xLzAuMjAuMCBcCisgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vYXNuMV9kZXJpdmUvMC4yMC4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9hdXRvY2Zn
LzEuNC4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9iYXNlNjQvMC4yMi4xIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9iaXRmbGFncy8yLjYuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2Mv
MS4xLjYgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NjLzEuMi4xIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9jZmctaWYvMS4wLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ZvcmVpZ24tdHlw
ZXMvMC4zLjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ZvcmVpZ24tdHlwZXMtc2hhcmVkLzAu
MS4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9oZWNrLzAuNS4wIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9pbmRvYy8yLjAuNSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGliYy8wLjIuMTU1
IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9pdG9hLzEuMC4xNCBcCisgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vbGliYy8wLjIuMTY2IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9tZW1vZmZzZXQvMC45
LjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL29uY2VfY2VsbC8xLjE5LjAgXAorICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL29uY2VfY2VsbC8xLjIwLjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL29w
ZW5zc2wvMC4xMC42OCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb3BlbnNzbC1tYWNyb3MvMC4x
LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL29wZW5zc2wtc3lzLzAuOS4xMDQgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3BlbS8zLjAuNCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcGtnLWNv
bmZpZy8wLjMuMzAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BvcnRhYmxlLWF0b21pYy8xLjcu
MCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHJvYy1tYWNybzIvMS4wLjg2IFwKLSAgICBjcmF0
ZTovL2NyYXRlcy5pby9weW8zLzAuMjIuMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1i
dWlsZC1jb25maWcvMC4yMi4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWZmaS8wLjIy
LjIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLzAuMjIuMiBcCi0gICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3MtYmFja2VuZC8wLjIyLjIgXAotICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3F1b3RlLzEuMC4zNiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcGtnLWNvbmZp
Zy8wLjMuMzEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BvcnRhYmxlLWF0b21pYy8xLjEwLjAg
XAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Byb2MtbWFjcm8yLzEuMC45MiBcCisgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vcHlvMy8wLjIzLjIgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtYnVp
bGQtY29uZmlnLzAuMjMuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1mZmkvMC4yMy4y
IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy8wLjIzLjIgXAorICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLWJhY2tlbmQvMC4yMy4yIFwKKyAgICBjcmF0ZTovL2Ny
YXRlcy5pby9xdW90ZS8xLjAuMzcgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlbGZfY2VsbC8x
LjAuNCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3luLzIuMC43MSBcCi0gICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vdGFyZ2V0LWxleGljb24vMC4xMi4xNSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
dW5pY29kZS1pZGVudC8xLjAuMTIgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NobGV4LzEuMy4w
IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9zeW4vMi4wLjg5IFwKKyAgICBjcmF0ZTovL2NyYXRl
cy5pby90YXJnZXQtbGV4aWNvbi8wLjEyLjE2IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby91bmlj
b2RlLWlkZW50LzEuMC4xNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdW5pbmRlbnQvMC4yLjMg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ZjcGtnLzAuMi4xNSBcCiAiCiAKLVNSQ19VUklbYXNu
MS0wLjE2LjIuc2hhMjU2c3VtXSA9ICI1MzJjZWRhMDU4MjgxYjYyMDk2YjJhZGQ0YWIwMGFiM2E0
NTNkMzBkZWUyOGI4ODkwZjYyNDYxYTAxMDllYmJkIgotU1JDX1VSSVthc24xX2Rlcml2ZS0wLjE2
LjIuc2hhMjU2c3VtXSA9ICI1NmU2MDc2ZDM4Y2MxN2NjMjJiMGY2NWYzMTE3MGEyZWUxOTc1ZTZi
MDdmMDAxMjg5M2FlZmQ4NmNlMTljOTg3IgotU1JDX1VSSVthdXRvY2ZnLTEuMy4wLnNoYTI1NnN1
bV0gPSAiMGM0YjRkMGJkMjViZDBiNzQ2ODFjMGFkMjE0OTc2MTBjZTFiN2M5MWIxMDIyY2QyMWM4
MGM2ZmJkZDk0NzZiMCIKK1NSQ19VUklbYXNuMS0wLjIwLjAuc2hhMjU2c3VtXSA9ICIyZDhiODRi
NGVhMWRlMmJmMWRjZDJhNzU5NzM3ZGRiMzI4ZmI2Njk1YjJhOTVlYjdlNDRmZWQ2N2UzNDA2ZjMy
IgorU1JDX1VSSVthc24xX2Rlcml2ZS0wLjIwLjAuc2hhMjU2c3VtXSA9ICJhMjAwODA5ZDAxMzg2
MjBiM2RiYTk4OWYxZDA4ZDA2MjBlNzYyNDhiYzFlNjJhMmVjMWIyZGY1ZWIxZWUwOGFkIgorU1JD
X1VSSVthdXRvY2ZnLTEuNC4wLnNoYTI1NnN1bV0gPSAiYWNlNTBiYWRlOGU2MjM0YWExNDBkOWEy
ZjU1MmJiZWUxZGI0ZDM1M2Y2OWI4MjE3YmM1MDM0OTBmYzFhOWYyNiIKIFNSQ19VUklbYmFzZTY0
LTAuMjIuMS5zaGEyNTZzdW1dID0gIjcyYjMyNTRmMTYyNTFhODM4MWFhMTJlNDBlM2M0ZDJmMDE5
OWY4YzY1MDhmYmVjYjlkOTFmNTc1ZTBmYmI4YzYiCiBTUkNfVVJJW2JpdGZsYWdzLTIuNi4wLnNo
YTI1NnN1bV0gPSAiYjA0OGZiNjNmZDhiNTkyM2ZjNWFhN2IzNDBkOGUxNTZhZWM3ZWMwMmYwYzc4
ZmE4YTZkZGMyNjEzZjZmNzFkZSIKLVNSQ19VUklbY2MtMS4xLjYuc2hhMjU2c3VtXSA9ICIyYWJh
OGY0ZTk5MDZjN2NlM2M3MzQ2M2Y2MmE3ZjBjNjUxODNhZGExYTJkNDdlMzk3Y2M4ODEwODI3Zjk2
OTRmIgorU1JDX1VSSVtjYy0xLjIuMS5zaGEyNTZzdW1dID0gImZkOWRlOWYyMjA1ZDVlZjNmZDY3
ZTY4NWIwZGYzMzc5OTRkZGQ0NDk1ZTJhMjhkMTg1NTAwZDBlMWVkZmVhNDciCiBTUkNfVVJJW2Nm
Zy1pZi0xLjAuMC5zaGEyNTZzdW1dID0gImJhZjFkZTQzMzk3NjE1ODhiYzA2MTllM2NiYzAxMjBl
ZTU4MmViYjc0YjUzYjRlZmJmNzkxMTdiZDJkYTQwZmQiCiBTUkNfVVJJW2ZvcmVpZ24tdHlwZXMt
MC4zLjIuc2hhMjU2c3VtXSA9ICJmNmYzMzllYjhhZGMwNTJjZDJjYTc4OTEwZmRhODY5YWVmYTM4
ZDIyZDVjYjY0OGU2NDg1ZTRkM2ZjMDZmM2IxIgogU1JDX1VSSVtmb3JlaWduLXR5cGVzLXNoYXJl
ZC0wLjEuMS5zaGEyNTZzdW1dID0gIjAwYjAyMjg0MTE5MDhjYTg2ODVkYmE3ZmMyY2RkNzBlYzk5
OTBhNmU3NTNlODliNmFjOTFhODRjNDBmYmFmNGIiCiBTUkNfVVJJW2hlY2stMC41LjAuc2hhMjU2
c3VtXSA9ICIyMzA0ZTAwOTgzZjg3ZmZiMzhiNTViNDQ0YjVlM2I2MGE4ODRiNWQzMGMwZmNhN2Q4
MmZlMzM0NDliYmU1NWVhIgogU1JDX1VSSVtpbmRvYy0yLjAuNS5zaGEyNTZzdW1dID0gImIyNDhm
NTIyNGQxZDYwNjAwNWUwMmM5N2Y1YWE0ZTg4ZWViMjMwNDg4YmNjMDNiYzljYTRkNzk5MTM5OWYy
YjUiCi1TUkNfVVJJW2xpYmMtMC4yLjE1NS5zaGEyNTZzdW1dID0gIjk3YjM4ODhhNGFlY2Y3N2U4
MTExNDVjYWRmNmVlZjU5MDFmNDc4MmM1Mzg4NjE5MWIyZjY5M2YyNDc2MTg0N2MiCitTUkNfVVJJ
W2l0b2EtMS4wLjE0LnNoYTI1NnN1bV0gPSAiZDc1YTJhNGIxYjE5MGFmYjZmNTQyNWYxMGY2YThm
OTU5ZDJlYTBiOWMyYjFkNzk1NTM1NTE4NTA1MzllNDY3NCIKK1NSQ19VUklbbGliYy0wLjIuMTY2
LnNoYTI1NnN1bV0gPSAiYzJjY2MxMDhiYmMwYjEzMzFiZDA2MTg2NGU3Y2Q4MjNjMGNhYjY2MGJi
ZTY5NzBlNjZlMmMwNjE0ZGVjZGUzNiIKIFNSQ19VUklbbWVtb2Zmc2V0LTAuOS4xLnNoYTI1NnN1
bV0gPSAiNDg4MDE2YmZhZTQ1N2IwMzZkOTk2MDkyZjZjYjQ0ODY3NzYxMWNlNDQ0OWU5NzBjZWFm
NDI2OTUyMDNmMjE4YSIKLVNSQ19VUklbb25jZV9jZWxsLTEuMTkuMC5zaGEyNTZzdW1dID0gIjNm
ZGIxMmIyNDc2YjU5NWY5MzU4YzUxNjFhYTQ2N2MyNDM4ODU5Y2FhMTM2ZGVjODZjMjZmZGQyZWZl
MTdiOTIiCitTUkNfVVJJW29uY2VfY2VsbC0xLjIwLjIuc2hhMjU2c3VtXSA9ICIxMjYxZmU3ZTMz
YzczYjM1NGVhYjQzYjEyNzNhNTdjOGY5NjdkMDM5MWU4MDM1M2U1MWY3NjRhYzAyY2Y2Nzc1Igog
U1JDX1VSSVtvcGVuc3NsLTAuMTAuNjguc2hhMjU2c3VtXSA9ICI2MTc0YmM0OGYxMDJkMjA4Nzgz
YzJjODRiZjkzMWJiNzU5MjdhNjE3ODY2ODcwZGU4YTRlYTg1NTk3Zjg3MWY1IgogU1JDX1VSSVtv
cGVuc3NsLW1hY3Jvcy0wLjEuMS5zaGEyNTZzdW1dID0gImE5NDg2NjZiNjM3YTBmNDY1ZTg1NjRj
NzNlODlkNGRkZTAwZDcyZDRkNDczY2M5NzJmMzkwZmMzZGNlZTdkOWMiCiBTUkNfVVJJW29wZW5z
c2wtc3lzLTAuOS4xMDQuc2hhMjU2c3VtXSA9ICI0NWFiZjMwNmNiZjk5ZGViYzgxOTViNjZiNzM0
NjQ5OGQ3YjEwYzIxMGRlNTA0MThiNWNjZDdjZWJhMDhjNzQxIgogU1JDX1VSSVtwZW0tMy4wLjQu
c2hhMjU2c3VtXSA9ICI4ZTQ1OTM2NWU1OTA3MzZhNTRjM2ZhNTYxOTQ3Yzg0ODM3NTM0YjhlOWFm
NmZjNWJmNzgxMzA3ZTgyNjU4ZmFlIgotU1JDX1VSSVtwa2ctY29uZmlnLTAuMy4zMC5zaGEyNTZz
dW1dID0gImQyMzFiMjMwOTI3YjVlNGFkMjAzZGI1N2JiY2JlZTI4MDJmNmJjZTYyMGIxZTRhOTAy
NGEwN2Q5NGUyOTA3ZWMiCi1TUkNfVVJJW3BvcnRhYmxlLWF0b21pYy0xLjcuMC5zaGEyNTZzdW1d
ID0gImRhNTQ0ZWUyMThmMGQyODdhOTExZTljOTlhMzlhOGM5YmM4ZmNhZDNjYjhkYjU5NTk5NDAw
NDRlY2ZjNjcyNjUiCi1TUkNfVVJJW3Byb2MtbWFjcm8yLTEuMC44Ni5zaGEyNTZzdW1dID0gIjVl
NzE5ZThkZjY2NWRmMGQxYzhmYmZkMjM4MDE1NzQ0NzM2MTUxZDQ0NDVlYzA4MzZiOGU2MjhhYWUx
MDNiNzciCi1TUkNfVVJJW3B5bzMtMC4yMi4yLnNoYTI1NnN1bV0gPSAiODMxZThlODE5YTEzOGMz
NmUyMTJmM2FmM2ZkOWVlZmZlZDZiZjE1MTBhODA1YWYzNWIwZWRlZTVmZmE1OTQzMyIKLVNSQ19V
UklbcHlvMy1idWlsZC1jb25maWctMC4yMi4yLnNoYTI1NnN1bV0gPSAiMWU4NzMwZTU5MWIxNDQ5
MmE4OTQ1Y2RmZjMyZjA4OTI1MGIwNWY1YWNjZWNmNzRhZWRkZjllODI3MmNlMWZhOCIKLVNSQ19V
UklbcHlvMy1mZmktMC4yMi4yLnNoYTI1NnN1bV0gPSAiNWU5N2U5MTlkMmRmOTJlYjg4Y2E4MGEw
Mzc5NjlmNDRlNWU3MDM1NjU1OTY1NDk2MmNiYjMzMTZkMDAzMDBjNiIKLVNSQ19VUklbcHlvMy1t
YWNyb3MtMC4yMi4yLnNoYTI1NnN1bV0gPSAiZWI1Nzk4MzAyMmFkNDFmOWU2ODNhNTk5ZjJmZDEz
YzM2NjRkNzA2M2EzYWM1NzE0Y2FlNGI3YmVlN2QzZjIwNiIKLVNSQ19VUklbcHlvMy1tYWNyb3Mt
YmFja2VuZC0wLjIyLjIuc2hhMjU2c3VtXSA9ICJlYzQ4MGMwYzUxZGRlYzgxMDE5NTMxNzA1YWNh
YzUxYmNkYmVhZTU2MzU1N2M5ODJhYTgyNjNiYjk2ODgwMzcyIgotU1JDX1VSSVtxdW90ZS0xLjAu
MzYuc2hhMjU2c3VtXSA9ICIwZmE3NmFhZjM5MTAxYzQ1NzgzNmFlYzBjZTIzMTZkYmRjM2FiNzIz
Y2RkYTFjNmJkNGU2YWQ0MjA4YWNhY2E3IgorU1JDX1VSSVtwa2ctY29uZmlnLTAuMy4zMS5zaGEy
NTZzdW1dID0gIjk1M2VjODYxMzk4ZGNjY2UxMGM2NzBkZmVhZjNlYzQ5MTFjYTQ3OWU5YzAyMTU0
YjNhMjE1MTc4YzVmNTY2ZjIiCitTUkNfVVJJW3BvcnRhYmxlLWF0b21pYy0xLjEwLjAuc2hhMjU2
c3VtXSA9ICIyODBkYzI0NDUzMDcxZjFiNjM5NTQxNzE5ODVhMGIwZDMwMDU4ZDI4Nzk2MDk2OGI5
YjJhY2EyNjRjOGQ0ZWU2IgorU1JDX1VSSVtwcm9jLW1hY3JvMi0xLjAuOTIuc2hhMjU2c3VtXSA9
ICIzN2QzNTQ0YjNmMjc0OGM1NGUxNDc2NTVlZGI1MDI1NzUyZTIzMDMxNDViNWFlZmIzYzNlYTJj
NzhiOTczYmIwIgorU1JDX1VSSVtweW8zLTAuMjMuMi5zaGEyNTZzdW1dID0gImY1NGIzZDA5Y2Jk
ZDFmOGMyMDY1MGIyOGU3YjA5ZTMzODg4MTQ4MmY0YWE5MDhhNWY2MWEwMGM5OGZiYTI2OTAiCitT
UkNfVVJJW3B5bzMtYnVpbGQtY29uZmlnLTAuMjMuMi5zaGEyNTZzdW1dID0gIjMwMTVjZjk4NTg4
OGZlNjZjZmI2M2NlMGUzMjFjNjAzNzA2Y2Q1NDFiN2FlYzdkZGQzNWMyODEzOTBhZjQ1ZDgiCitT
UkNfVVJJW3B5bzMtZmZpLTAuMjMuMi5zaGEyNTZzdW1dID0gIjZmY2E3Y2Q4ZmQ4MDliNWFjNGVl
ZmI4OWMxZjk4ZjdhNzY1MWQzNzM5ZGZiMzQxY2E2OTgwMDkwZjU1NGMyNzAiCitTUkNfVVJJW3B5
bzMtbWFjcm9zLTAuMjMuMi5zaGEyNTZzdW1dID0gIjM0ZTY1N2ZhNTM3OWE3OTE1MWI2ZmY1MzI4
ZDkyMTZhODRmNTVkYzkzYjE3YjA4ZTdjMzYwOWE5NjliNzNhYTAiCitTUkNfVVJJW3B5bzMtbWFj
cm9zLWJhY2tlbmQtMC4yMy4yLnNoYTI1NnN1bV0gPSAiMjk1NTQ4ZDVmZmQ5NWZkMTk4MWQyZDNj
ZjQ0NTg4MzFiMjFkNjBhZjA0NmI3MjliNmZkMTQzYjBiYTdhZWUyZiIKK1NSQ19VUklbcXVvdGUt
MS4wLjM3LnNoYTI1NnN1bV0gPSAiYjViOWQzNGI4OTkxZDE5ZDk4MDgxYjQ2ZWFjZGQ4ZWI1OGM2
ZjJiMjAxMTM5ZjdjNWY2NDNjYzE1NWE2MzNhZiIKIFNSQ19VUklbc2VsZl9jZWxsLTEuMC40LnNo
YTI1NnN1bV0gPSAiZDM2OWE5NmY5Nzg2MjNlYjNkYzI4ODA3YzQ4NTJkNmNjNjE3ZmVkNTNkYTVk
M2M0MDBmZWZmMWVmMzRhNzE0YSIKLVNSQ19VUklbc3luLTIuMC43MS5zaGEyNTZzdW1dID0gImIx
NDZkY2Y3MzA0NzRiNGJjZDE2YzMxMTYyN2IzMWVkZTlhYjE0OTA0NWRiNGQ2MDg4YjNiZWNhZWEw
NDY0NjIiCi1TUkNfVVJJW3RhcmdldC1sZXhpY29uLTAuMTIuMTUuc2hhMjU2c3VtXSA9ICI0ODcz
MzA3YjdjMjU3ZWRkY2I1MGM5YmVkZjE1OGViNjY5NTc4MzU5ZmIyODQyOGJlZjQzOGZlYzhlNmJh
N2MyIgotU1JDX1VSSVt1bmljb2RlLWlkZW50LTEuMC4xMi5zaGEyNTZzdW1dID0gIjMzNTRiOWFj
M2ZhZTFmZjY3NTVjYjZkYjUzNjgzYWRiNjYxNjM0ZjY3NTU3OTQyZGVhNGZhY2ViZWMwZmVlNGIi
CitTUkNfVVJJW3NobGV4LTEuMy4wLnNoYTI1NnN1bV0gPSAiMGZkYTJmZjBkMDg0MDE5YmE0ZDdj
NmYzNzFjOTVkOGZkNzVjZTM1MjRjM2NiOGZiNjUzYTMwMjNmNjMyM2U2NCIKK1NSQ19VUklbc3lu
LTIuMC44OS5zaGEyNTZzdW1dID0gIjQ0ZDQ2NDgyZjFjMWM4N2FjZDg0ZGVhMjBjMWJmNWViZmY0
Yzc1NzAwOWVkNmJmMTljZmQzNmZiMTBlOTJjNGUiCitTUkNfVVJJW3RhcmdldC1sZXhpY29uLTAu
MTIuMTYuc2hhMjU2c3VtXSA9ICI2MWM0MWFmMjdkZDZkMWUyN2IxYjE2YjQ4OWRiNzk4NDQzNDc4
Y2VmMWYwNmE2NjBjOTZkYjYxN2JhNWRlM2IxIgorU1JDX1VSSVt1bmljb2RlLWlkZW50LTEuMC4x
NC5zaGEyNTZzdW1dID0gImFkYjllNmNhNGY4NjllMTE4MDcyOGI3OTUwZTM1OTIyYTdmYzYzOTdm
N2I2NDE0OTllOGYzZWYwNmU1MGRjODMiCiBTUkNfVVJJW3VuaW5kZW50LTAuMi4zLnNoYTI1NnN1
bV0gPSAiYzdkZTdkNzNlMTc1NDQ4N2NiNTgzNjRlZTkwNmE0OTk5MzdhMGRmYWJkODZiY2I5ODBm
YTk5ZWM4YzhmYTJjZSIKIFNSQ19VUklbdmNwa2ctMC4yLjE1LnNoYTI1NnN1bV0gPSAiYWNjZDRl
YTYyZjdiYjdhODJmZTIzMDY2ZmIwOTU3ZDQ4ZWY2NzdmNmVlYjgyMTVmMzcyZjUyZTQ4YmIzMjQy
NiIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlw
dG9ncmFwaHktdmVjdG9ycy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1jcnlwdG9ncmFwaHktdmVjdG9ycy5iYgppbmRleCAwMmQxMGRiZmE3Li5hMDNiNDY0YTI5IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3Jh
cGh5LXZlY3RvcnMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWNyeXB0b2dyYXBoeS12ZWN0b3JzLmJiCkBAIC05LDcgKzksNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT04YzM2MTdkYjRmYjZmYWUwMWYxZDI1M2FiOTE1MTFlNCBc
CiAjIE5PVEU6IE1ha2Ugc3VyZSB0byBrZWVwIHRoaXMgcmVjaXBlIGF0IHRoZSBzYW1lIHZlcnNp
b24gYXMgcHl0aG9uMy1jcnlwdG9ncmFwaHkKICMgICAgICAgVXBncmFkZSBib3RoIHJlY2lwZXMg
YXQgdGhlIHNhbWUgdGltZQogcmVxdWlyZSBweXRob24zLWNyeXB0b2dyYXBoeS1jb21tb24uaW5j
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmY2YTg4NTI2NWY0ODRlODkwNzI3NzYxNGI3M2U5Yzc3
NGIwMTY1ODYyM2FkNzYzZGRlMjg1ODE4OGU0ODZiNCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIx
MDYyMjg3NjZjNDViOWE1ZmZkMWE4YjNlMjU0ZjA1NjBjODIxZGE3OWQ1Y2Q3ZmQxMTNhMTdlMzc1
MzU4MGFiIgogCiBQWVBJX1BBQ0tBR0UgPSAiY3J5cHRvZ3JhcGh5X3ZlY3RvcnMiCiAKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHku
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJi
CmluZGV4IDQ4NGRjMTEyOWEuLjY5MzI5ZWM5NTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHkuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS5iYgpAQCAtMTEsNyArMTEsNyBA
QCBMRFNIQVJFRCArPSAiLXB0aHJlYWQiCiAjIE5PVEU6IE1ha2Ugc3VyZSB0byBrZWVwIHRoaXMg
cmVjaXBlIGF0IHRoZSBzYW1lIHZlcnNpb24gYXMgcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9y
cwogIyAgICAgICBVcGdyYWRlIGJvdGggcmVjaXBlcyBhdCB0aGUgc2FtZSB0aW1lCiByZXF1aXJl
IHB5dGhvbjMtY3J5cHRvZ3JhcGh5LWNvbW1vbi5pbmMKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIz
MTViOTAwMTI2NmE0OTJhNmZmNDQzYjYxMjM4Zjk1NmIyMTRkYmVjOTkxMGEwODFiYTViNjY0NmEw
NTVhODA1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImNkNGU4MzRmMzQwYjQyOTM0MzA3MDFlNzcy
ZWM1NDNiMGZiZTZjMmRlYTUxMGE1Mjg2ZmUwYWNhYmUxNTNhMDIiCiAKIFNSQ19VUkkgKz0gImZp
bGU6Ly8wMDAxLXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24u
cGF0Y2ggXAogICAgICAgICAgICAgZmlsZTovL2NoZWNrLW1lbWZyZWUucHkgXApkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS8wMDAx
LXB5cHJvamVjdC50b21sLXJlbW92ZS1iZW5jaG1hcmstZGlzYWJsZS1vcHRpb24ucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LzAwMDEtcHlw
cm9qZWN0LnRvbWwtcmVtb3ZlLWJlbmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaAppbmRleCA0
ZGNhYTVkOGQ0Li4zMWNhNTRkNmQwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJl
bmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LzAwMDEtcHlwcm9qZWN0LnRvbWwtcmVtb3ZlLWJl
bmNobWFyay1kaXNhYmxlLW9wdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTEyYTQw
OTY2MDY5MDgzZWQwYTNkZDI3MGQ5MjcxZjljZDVhNTk0MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gZjI1OTM0NmZhNGU0NWE0Mjg5ZGRiMDZjODk3Yjg3YzhmZDgzOTYzMCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1pbmdsaSBZdSA8bWluZ2xpLnl1QHdpbmRyaXZlci5j
b20+CiBEYXRlOiBUdWUsIDE3IE1heSAyMDIyIDE3OjIyOjQ4ICswODAwCiBTdWJqZWN0OiBbUEFU
Q0hdIHB5cHJvamVjdC50b21sOiByZW1vdmUgLS1iZW5jaG1hcmstZGlzYWJsZSBvcHRpb24KQEAg
LTI2LDEwICsyNiwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBUaW0gT3JsaW5nIDx0aW0ub3JsaW5nQGtv
bnN1bGtvLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIAogZGlmZiAtLWdpdCBhL3B5cHJvamVjdC50b21sIGIvcHlwcm9qZWN0LnRvbWwKLWluZGV4
IDAzYjE3OGQuLjJkZGNiNDggMTAwNjQ0CitpbmRleCA5NDlkNjg0Li44YzYyNDMyIDEwMDY0NAog
LS0tIGEvcHlwcm9qZWN0LnRvbWwKICsrKyBiL3B5cHJvamVjdC50b21sCi1AQCAtMTE3LDcgKzEx
Nyw3IEBAIGV4Y2x1ZGUgPSBbCitAQCAtMTE4LDcgKzExOCw3IEBAIGV4Y2x1ZGUgPSBbCiAgXQog
IAogIFt0b29sLnB5dGVzdC5pbmlfb3B0aW9uc10KLS0gCjIuNDQuMQoK

--===============1855396950573239128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.13/site-packages/cryptography_vectors-43.0.3.dist-info -> /usr/lib/python3.13/site-packages/cryptography_vectors-44.0.0.dist-info, added "/usr/lib/python3.13/site-packages/cryptography_vectors/x509/custom/malformed-ian.pem /usr/lib/python3.13/site-packages/cryptography_vectors/x509/custom/malformed-san.pem /usr/lib/python3.13/site-packages/cryptography_vectors/asymmetric/DSA/custom/nilpotent.pem /usr/lib/python3.13/site-packages/cryptography_vectors/pkcs7/enveloped-no-content.der /usr/lib/python3.13/site-packages/cryptography_vectors/x509/custom/admissions_extension_authority_not_provided.pem /usr/lib/python3.13/site-packages/cryptography_vectors/pkcs7/enveloped-aes-256-cbc.pem /usr/lib/python3.13/site-packages/cryptography_vectors/x509/custom/admissions_extension_optional_data_not_provided.pem /usr/lib/python3.13/site-packages/cryptography_vectors/pkcs
 7/enveloped-rsa-oaep.pem /usr/lib/python3.13/site-packages/cryptography_vectors/x509/requests/zero-element-attribute.pem /usr/lib/python3.13/site-packages/cryptography_vectors/x509/custom/empty-eku.pem /usr/lib/python3.13/site-packages/cryptography_vectors/KDF/argon2id.txt"
Changes to packages/core2-64-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.13/site-packages/cryptography_vectors-43.0.3.dist-info moved to /usr/lib/python3.13/site-packages/cryptography_vectors-44.0.0.dist-info
  /usr/lib/python3.13/site-packages/cryptography_vectors/asymmetric/DSA/custom was added
  /usr/lib/python3.13/site-packages/cryptography_vectors/asymmetric/DSA/custom/nilpotent.pem was added
  /usr/lib/python3.13/site-packages/cryptography_vectors/KDF/argon2id.txt was added
  /usr/lib/python3.13/site-packages/cryptography_vectors/pkcs7/enveloped-aes-256-cbc.pem was added
  /usr/lib/python3.13/site-packages/cryptography_vectors/pkcs7/enveloped-no-content.der was added
  /usr/lib/python3.13/site-packages/cryptography_vectors/pkcs7/enveloped-rsa-oaep.pem was added
  /usr/lib/python3.13/site-packages/cryptography_vectors/x509/custom/admissions_extension_authority_not_provided.pem was added
  /usr/lib/python3.13/site-packages/cryptography_vectors/x509/custom/admissions_extension_optional_data_not_provided.pem was added
  /usr/lib/python3.13/site-packages/cryptography_vectors/x509/custom/empty-eku.pem was added
  /usr/lib/python3.13/site-packages/cryptography_vectors/x509/custom/malformed-ian.pem was added
  /usr/lib/python3.13/site-packages/cryptography_vectors/x509/custom/malformed-san.pem was added
  /usr/lib/python3.13/site-packages/cryptography_vectors/x509/requests/zero-element-attribute.pem was added
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-ptest: FILELIST: added "/usr/lib/python3-cryptography/ptest/tests/hazmat/primitives/test_argon2.py"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography: FILELIST: directory renamed /usr/lib/python3.13/site-packages/cryptography-43.0.3.dist-info/licenses -> /usr/lib/python3.13/site-packages/cryptography-44.0.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/cryptography-43.0.3.dist-info -> /usr/lib/python3.13/site-packages/cryptography-44.0.0.dist-info, added "/usr/lib/python3.13/site-packages/rust/cryptography-openssl/Cargo.toml /usr/lib/python3.13/site-packages/rust/cryptography-x509-verification/Cargo.toml /usr/lib/python3.13/site-packages/rust/cryptography-cffi/Cargo.toml /usr/lib/python3.13/site-packages/rust/cryptography-x509/Cargo.toml /usr/lib/python3.13/site-packages/rust/cryptography-keepalive/Cargo.toml /usr/lib/python3.13/site-packages/cryptography/hazmat/primitives/kdf/argon2.py /usr/lib/python3.13/site-packages/rust/Cargo.toml /usr/lib/python3.13/site-packages/cryptography/hazmat/primitives/kdf/__pycache__/argon2.cpython-313.p
 yc /usr/lib/python3.13/site-packages/rust/cryptography-key-parsing/Cargo.toml"
Changes to packages/core2-64-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.13/site-packages/cryptography-43.0.3.dist-info moved to /usr/lib/python3.13/site-packages/cryptography-44.0.0.dist-info
  /usr/lib/python3.13/site-packages/cryptography/hazmat/primitives/kdf/argon2.py was added
  /usr/lib/python3.13/site-packages/cryptography/hazmat/primitives/kdf/__pycache__/argon2.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/rust was added
  /usr/lib/python3.13/site-packages/rust/Cargo.toml was added
  /usr/lib/python3.13/site-packages/rust/cryptography-cffi was added
  /usr/lib/python3.13/site-packages/rust/cryptography-cffi/Cargo.toml was added
  /usr/lib/python3.13/site-packages/rust/cryptography-keepalive was added
  /usr/lib/python3.13/site-packages/rust/cryptography-keepalive/Cargo.toml was added
  /usr/lib/python3.13/site-packages/rust/cryptography-key-parsing was added
  /usr/lib/python3.13/site-packages/rust/cryptography-key-parsing/Cargo.toml was added
  /usr/lib/python3.13/site-packages/rust/cryptography-openssl was added
  /usr/lib/python3.13/site-packages/rust/cryptography-openssl/Cargo.toml was added
  /usr/lib/python3.13/site-packages/rust/cryptography-x509 was added
  /usr/lib/python3.13/site-packages/rust/cryptography-x509/Cargo.toml was added
  /usr/lib/python3.13/site-packages/rust/cryptography-x509-verification was added
  /usr/lib/python3.13/site-packages/rust/cryptography-x509-verification/Cargo.toml was added

--===============1855396950573239128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-cryptography-vectors: PV changed from "43.0.3" to "44.0.0"
packages/core2-64-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-43.0.3.tar.gz;downloadfilename=cryptography_vectors-43.0.3.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-44.0.0.tar.gz;downloadfilename=cryptography_vectors-44.0.0.tar.gz"
packages/core2-64-poky-linux/python3-cryptography-vectors: PKGV changed from 43.0.3 [default] to 44.0.0 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "43.0.3" to "44.0.0"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 43.0.3 [default] to 44.0.0 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "43.0.3" to "44.0.0"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 43.0.3 [default] to 44.0.0 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "43.0.3" to "44.0.0"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 43.0.3 [default] to 44.0.0 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "43.0.3" to "44.0.0"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 43.0.3 [default] to 44.0.0 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "43.0.3" to "44.0.0"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 43.0.3 [default] to 44.0.0 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "43.0.3" to "44.0.0"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 43.0.3 [default] to 44.0.0 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "43.0.3" to "44.0.0"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGSIZE changed from 74967833 to 74983975 (+0%)
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 43.0.3 [default] to 44.0.0 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.13/site-packages/cryptography_vectors-43.0.3.dist-info -> /usr/lib/python3.13/site-packages/cryptography_vectors-44.0.0.dist-info, added "/usr/lib/python3.13/site-packages/cryptography_vectors/x509/custom/malformed-san.pem /usr/lib/python3.13/site-packages/cryptography_vectors/x509/custom/empty-eku.pem /usr/lib/python3.13/site-packages/cryptography_vectors/x509/custom/admissions_extension_optional_data_not_provided.pem /usr/lib/python3.13/site-packages/cryptography_vectors/x509/requests/zero-element-attribute.pem /usr/lib/python3.13/site-packages/cryptography_vectors/pkcs7/enveloped-rsa-oaep.pem /usr/lib/python3.13/site-packages/cryptography_vectors/KDF/argon2id.txt /usr/lib/python3.13/site-packages/cryptography_vectors/asymmetric/DSA/custom/nilpotent.pem /usr/lib/python3.13/site-packages/cryptography_vectors/x509/custom/malformed-ian.pem /usr/lib/pytho
 n3.13/site-packages/cryptography_vectors/pkcs7/enveloped-aes-256-cbc.pem /usr/lib/python3.13/site-packages/cryptography_vectors/pkcs7/enveloped-no-content.der /usr/lib/python3.13/site-packages/cryptography_vectors/x509/custom/admissions_extension_authority_not_provided.pem"
Changes to packages/core2-64-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.13/site-packages/cryptography_vectors-43.0.3.dist-info moved to /usr/lib/python3.13/site-packages/cryptography_vectors-44.0.0.dist-info
  /usr/lib/python3.13/site-packages/cryptography_vectors/asymmetric/DSA/custom was added
  /usr/lib/python3.13/site-packages/cryptography_vectors/asymmetric/DSA/custom/nilpotent.pem was added
  /usr/lib/python3.13/site-packages/cryptography_vectors/KDF/argon2id.txt was added
  /usr/lib/python3.13/site-packages/cryptography_vectors/pkcs7/enveloped-aes-256-cbc.pem was added
  /usr/lib/python3.13/site-packages/cryptography_vectors/pkcs7/enveloped-no-content.der was added
  /usr/lib/python3.13/site-packages/cryptography_vectors/pkcs7/enveloped-rsa-oaep.pem was added
  /usr/lib/python3.13/site-packages/cryptography_vectors/x509/custom/admissions_extension_authority_not_provided.pem was added
  /usr/lib/python3.13/site-packages/cryptography_vectors/x509/custom/admissions_extension_optional_data_not_provided.pem was added
  /usr/lib/python3.13/site-packages/cryptography_vectors/x509/custom/empty-eku.pem was added
  /usr/lib/python3.13/site-packages/cryptography_vectors/x509/custom/malformed-ian.pem was added
  /usr/lib/python3.13/site-packages/cryptography_vectors/x509/custom/malformed-san.pem was added
  /usr/lib/python3.13/site-packages/cryptography_vectors/x509/requests/zero-element-attribute.pem was added
packages/core2-64-poky-linux/python3-cryptography: PV changed from "43.0.3" to "44.0.0"
packages/core2-64-poky-linux/python3-cryptography: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-43.0.3.tar.gz;downloadfilename=cryptography-43.0.3.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.16.2 crate://crates.io/asn1_derive/0.16.2 crate://crates.io/autocfg/1.3.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.6.0 crate://crates.io/cc/1.1.6 crate://crates.io/cfg-if/1.0.0 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/libc/0.2.155 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.19.0 crate://crates.io/openssl/0.10.68 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.104 crate://crates.io/pem/3.0.4 crate://crates.io/pkg-config/0.3.30 crate://crates.io/portable-atomic/1.7.0 crate:/
 /crates.io/proc-macro2/1.0.86 crate://crates.io/pyo3/0.22.2 crate://crates.io/pyo3-build-config/0.22.2 crate://crates.io/pyo3-ffi/0.22.2 crate://crates.io/pyo3-macros/0.22.2 crate://crates.io/pyo3-macros-backend/0.22.2 crate://crates.io/quote/1.0.36 crate://crates.io/self_cell/1.0.4 crate://crates.io/syn/2.0.71 crate://crates.io/target-lexicon/0.12.15 crate://crates.io/unicode-ident/1.0.12 crate://crates.io/unindent/0.2.3 crate://crates.io/vcpkg/0.2.15" to "https://files.pythonhosted.org/packages/source/c/cryptography/cryptography-44.0.0.tar.gz;downloadfilename=cryptography-44.0.0.tar.gz file://0001-pyproject.toml-remove-benchmark-disable-option.patch file://check-memfree.py file://run-ptest crate://crates.io/asn1/0.20.0 crate://crates.io/asn1_derive/0.20.0 crate://crates.io/autocfg/1.4.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.6.0 crate://crates.io/cc/1.2.1 crate://crates.io/cfg-if/1.0.0 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shar
 ed/0.1.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/itoa/1.0.14 crate://crates.io/libc/0.2.166 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.20.2 crate://crates.io/openssl/0.10.68 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-sys/0.9.104 crate://crates.io/pem/3.0.4 crate://crates.io/pkg-config/0.3.31 crate://crates.io/portable-atomic/1.10.0 crate://crates.io/proc-macro2/1.0.92 crate://crates.io/pyo3/0.23.2 crate://crates.io/pyo3-build-config/0.23.2 crate://crates.io/pyo3-ffi/0.23.2 crate://crates.io/pyo3-macros/0.23.2 crate://crates.io/pyo3-macros-backend/0.23.2 crate://crates.io/quote/1.0.37 crate://crates.io/self_cell/1.0.4 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.89 crate://crates.io/target-lexicon/0.12.16 crate://crates.io/unicode-ident/1.0.14 crate://crates.io/unindent/0.2.3 crate://crates.io/vcpkg/0.2.15"
packages/core2-64-poky-linux/python3-cryptography: PKGV changed from 43.0.3 [default] to 44.0.0 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PV changed from "43.0.3" to "44.0.0"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGSIZE changed from 1041784 to 1065912 (+2%)
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dbg: PKGV changed from 43.0.3 [default] to 44.0.0 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dev: PV changed from "43.0.3" to "44.0.0"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-dev: PKGV changed from 43.0.3 [default] to 44.0.0 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-doc: PV changed from "43.0.3" to "44.0.0"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-doc: PKGV changed from 43.0.3 [default] to 44.0.0 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-locale: PV changed from "43.0.3" to "44.0.0"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-locale: PKGV changed from 43.0.3 [default] to 44.0.0 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-ptest: PV changed from "43.0.3" to "44.0.0"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGSIZE changed from 1678295 to 1742002 (+4%)
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-ptest: PKGV changed from 43.0.3 [default] to 44.0.0 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-ptest: FILELIST: added "/usr/lib/python3-cryptography/ptest/tests/hazmat/primitives/test_argon2.py"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-src: PV changed from "43.0.3" to "44.0.0"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-src: PKGV changed from 43.0.3 [default] to 44.0.0 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-staticdev: PV changed from "43.0.3" to "44.0.0"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography-staticdev: PKGV changed from 43.0.3 [default] to 44.0.0 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography: PV changed from "43.0.3" to "44.0.0"
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography: PKGSIZE changed from 4259123 to 4535226 (+6%)
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography: PKGV changed from 43.0.3 [default] to 44.0.0 [default]
packages/core2-64-poky-linux/python3-cryptography/python3-cryptography: FILELIST: directory renamed /usr/lib/python3.13/site-packages/cryptography-43.0.3.dist-info -> /usr/lib/python3.13/site-packages/cryptography-44.0.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/cryptography-43.0.3.dist-info/licenses -> /usr/lib/python3.13/site-packages/cryptography-44.0.0.dist-info/licenses, added "/usr/lib/python3.13/site-packages/cryptography/hazmat/primitives/kdf/argon2.py /usr/lib/python3.13/site-packages/rust/cryptography-keepalive/Cargo.toml /usr/lib/python3.13/site-packages/cryptography/hazmat/primitives/kdf/__pycache__/argon2.cpython-313.pyc /usr/lib/python3.13/site-packages/rust/Cargo.toml /usr/lib/python3.13/site-packages/rust/cryptography-x509-verification/Cargo.toml /usr/lib/python3.13/site-packages/rust/cryptography-key-parsing/Cargo.toml /usr/lib/python3.13/site-packages/rust/cryptography-cffi/Cargo.toml /usr/lib/python3.13/site-packages/rust/cryptography-x509/Carg
 o.toml /usr/lib/python3.13/site-packages/rust/cryptography-openssl/Cargo.toml"
Changes to packages/core2-64-poky-linux/python3-cryptography (sysroot):
  /usr/lib/python3.13/site-packages/cryptography-43.0.3.dist-info moved to /usr/lib/python3.13/site-packages/cryptography-44.0.0.dist-info
  /usr/lib/python3.13/site-packages/cryptography/hazmat/primitives/kdf/argon2.py was added
  /usr/lib/python3.13/site-packages/cryptography/hazmat/primitives/kdf/__pycache__/argon2.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/rust was added
  /usr/lib/python3.13/site-packages/rust/Cargo.toml was added
  /usr/lib/python3.13/site-packages/rust/cryptography-cffi was added
  /usr/lib/python3.13/site-packages/rust/cryptography-cffi/Cargo.toml was added
  /usr/lib/python3.13/site-packages/rust/cryptography-keepalive was added
  /usr/lib/python3.13/site-packages/rust/cryptography-keepalive/Cargo.toml was added
  /usr/lib/python3.13/site-packages/rust/cryptography-key-parsing was added
  /usr/lib/python3.13/site-packages/rust/cryptography-key-parsing/Cargo.toml was added
  /usr/lib/python3.13/site-packages/rust/cryptography-openssl was added
  /usr/lib/python3.13/site-packages/rust/cryptography-openssl/Cargo.toml was added
  /usr/lib/python3.13/site-packages/rust/cryptography-x509 was added
  /usr/lib/python3.13/site-packages/rust/cryptography-x509/Cargo.toml was added
  /usr/lib/python3.13/site-packages/rust/cryptography-x509-verification was added
  /usr/lib/python3.13/site-packages/rust/cryptography-x509-verification/Cargo.toml was added

--===============1855396950573239128==--

