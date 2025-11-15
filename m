Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC35CCEB2FA
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:03 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12119.1763224719787781609
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ai+vZqNC;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=m+0kekGK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019a88624733-ce145290-5ff5-48a5-a741-9dda200710f4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224733;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=08MnFJMg4MUfquD+Wu6KKbyfDu2cMnc81SzToXLTqA8=;
	b=Ai+vZqNCnDmG7J9Bo1q/n2iJ2MxmPYuMHF6he9Ilf16Y8M9LfMh3eGHFBUmQXviR
	Nir3hCuFt7pFtGlJz/SwUdwR9w6YL4L/x/VbXiib+Mn6GG0wMGiGXEZhdWL4WukHtj9
	bKBlsl6ikX+8cRdh55r1HGViyklw9jjT6uT1VbUk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224733;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=08MnFJMg4MUfquD+Wu6KKbyfDu2cMnc81SzToXLTqA8=;
	b=m+0kekGKqJNMfmIAH37XMmyTy2LFoW6X5StI3BJPJS5lXxEQNhHt/AmhUa/osYhp
	DUmKJxHpKRtJ1XH0gWxpS9pUIT/sXLOO2jIVaw0tSIi/Mj3aI/RQovRvoGdc6ww3cxF
	uMKL/MKfNR4lh1oHkYcnDmgCss3XMr81odx19kZQ=
Content-Type: multipart/mixed; boundary="===============1126386889582881340=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-rpds-py: upgrading to 0.28.0 SUCCEEDED
Message-ID: <0101019a88624733-ce145290-5ff5-48a5-a741-9dda200710f4-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226372

--===============1126386889582881340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-rpds-py* to *0.28.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-rpds-py-upgrade-0.27.1-0.28.0.patch
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
From a41e672cb2bdcbd2c197abfca90a532083679ca4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 11:14:49 +0000
Subject: [PATCH] python3-rpds-py: upgrade 0.27.1 -> 0.28.0

---
 .../python/python3-rpds-py-crates.inc         | 52 +++++++++----------
 ...py_0.27.1.bb => python3-rpds-py_0.28.0.bb} |  2 +-
 2 files changed, 27 insertions(+), 27 deletions(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.27.1.bb => python3-rpds-py_0.28.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
index a0b669df2d..93cd26129c 100644
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -2,52 +2,52 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/archery/1.2.1 \
-    crate://crates.io/autocfg/1.4.0 \
-    crate://crates.io/cc/1.2.25 \
+    crate://crates.io/archery/1.2.2 \
+    crate://crates.io/autocfg/1.5.0 \
+    crate://crates.io/cc/1.2.34 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/indoc/2.0.6 \
-    crate://crates.io/libc/0.2.172 \
+    crate://crates.io/libc/0.2.175 \
     crate://crates.io/memoffset/0.9.1 \
     crate://crates.io/once_cell/1.21.3 \
-    crate://crates.io/portable-atomic/1.11.0 \
-    crate://crates.io/proc-macro2/1.0.95 \
-    crate://crates.io/pyo3/0.25.1 \
-    crate://crates.io/pyo3-build-config/0.25.1 \
-    crate://crates.io/pyo3-ffi/0.25.1 \
-    crate://crates.io/pyo3-macros/0.25.1 \
-    crate://crates.io/pyo3-macros-backend/0.25.1 \
+    crate://crates.io/portable-atomic/1.11.1 \
+    crate://crates.io/proc-macro2/1.0.101 \
+    crate://crates.io/pyo3/0.27.1 \
+    crate://crates.io/pyo3-build-config/0.27.1 \
+    crate://crates.io/pyo3-ffi/0.27.1 \
+    crate://crates.io/pyo3-macros/0.27.1 \
+    crate://crates.io/pyo3-macros-backend/0.27.1 \
     crate://crates.io/python3-dll-a/0.2.14 \
     crate://crates.io/quote/1.0.40 \
-    crate://crates.io/rpds/1.1.1 \
+    crate://crates.io/rpds/1.1.2 \
     crate://crates.io/shlex/1.3.0 \
-    crate://crates.io/syn/2.0.101 \
+    crate://crates.io/syn/2.0.106 \
     crate://crates.io/target-lexicon/0.13.2 \
     crate://crates.io/triomphe/0.1.14 \
     crate://crates.io/unicode-ident/1.0.18 \
     crate://crates.io/unindent/0.2.4 \
 "
 
-SRC_URI[archery-1.2.1.sha256sum] = "eae2ed21cd55021f05707a807a5fc85695dafb98832921f6cfa06db67ca5b869"
-SRC_URI[autocfg-1.4.0.sha256sum] = "ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26"
-SRC_URI[cc-1.2.25.sha256sum] = "d0fc897dc1e865cc67c0e05a836d9d3f1df3cbe442aa4a9473b18e12624a4951"
+SRC_URI[archery-1.2.2.sha256sum] = "70e0a5f99dfebb87bb342d0f53bb92c81842e100bbb915223e38349580e5441d"
+SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
+SRC_URI[cc-1.2.34.sha256sum] = "42bc4aea80032b7bf409b0bc7ccad88853858911b7713a8062fdc0623867bedc"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[indoc-2.0.6.sha256sum] = "f4c7245a08504955605670dbf141fceab975f15ca21570696aebe9d2e71576bd"
-SRC_URI[libc-0.2.172.sha256sum] = "d750af042f7ef4f724306de029d18836c26c1765a54a6a3f094cbd23a7267ffa"
+SRC_URI[libc-0.2.175.sha256sum] = "6a82ae493e598baaea5209805c49bbf2ea7de956d50d7da0da1164f9c6d28543"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
-SRC_URI[portable-atomic-1.11.0.sha256sum] = "350e9b48cbc6b0e028b0473b114454c6316e57336ee184ceab6e53f72c178b3e"
-SRC_URI[proc-macro2-1.0.95.sha256sum] = "02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778"
-SRC_URI[pyo3-0.25.1.sha256sum] = "8970a78afe0628a3e3430376fc5fd76b6b45c4d43360ffd6cdd40bdde72b682a"
-SRC_URI[pyo3-build-config-0.25.1.sha256sum] = "458eb0c55e7ece017adeba38f2248ff3ac615e53660d7c71a238d7d2a01c7598"
-SRC_URI[pyo3-ffi-0.25.1.sha256sum] = "7114fe5457c61b276ab77c5055f206295b812608083644a5c5b2640c3102565c"
-SRC_URI[pyo3-macros-0.25.1.sha256sum] = "a8725c0a622b374d6cb051d11a0983786448f7785336139c3c94f5aa6bef7e50"
-SRC_URI[pyo3-macros-backend-0.25.1.sha256sum] = "4109984c22491085343c05b0dbc54ddc405c3cf7b4374fc533f5c3313a572ccc"
+SRC_URI[portable-atomic-1.11.1.sha256sum] = "f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483"
+SRC_URI[proc-macro2-1.0.101.sha256sum] = "89ae43fd86e4158d6db51ad8e2b80f313af9cc74f5c0e03ccb87de09998732de"
+SRC_URI[pyo3-0.27.1.sha256sum] = "37a6df7eab65fc7bee654a421404947e10a0f7085b6951bf2ea395f4659fb0cf"
+SRC_URI[pyo3-build-config-0.27.1.sha256sum] = "f77d387774f6f6eec64a004eac0ed525aab7fa1966d94b42f743797b3e395afb"
+SRC_URI[pyo3-ffi-0.27.1.sha256sum] = "2dd13844a4242793e02df3e2ec093f540d948299a6a77ea9ce7afd8623f542be"
+SRC_URI[pyo3-macros-0.27.1.sha256sum] = "eaf8f9f1108270b90d3676b8679586385430e5c0bb78bb5f043f95499c821a71"
+SRC_URI[pyo3-macros-backend-0.27.1.sha256sum] = "70a3b2274450ba5288bc9b8c1b69ff569d1d61189d4bff38f8d22e03d17f932b"
 SRC_URI[python3-dll-a-0.2.14.sha256sum] = "d381ef313ae70b4da5f95f8a4de773c6aa5cd28f73adec4b4a31df70b66780d8"
 SRC_URI[quote-1.0.40.sha256sum] = "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
-SRC_URI[rpds-1.1.1.sha256sum] = "a7f89f654d51fffdd6026289d07d1fd523244d46ae0a8bc22caa6dd7f9e8cb0b"
+SRC_URI[rpds-1.1.2.sha256sum] = "acb4efcdbf5d5489a878f48686e08e0e38da594e98295235b5aeeabe905fbff6"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
-SRC_URI[syn-2.0.101.sha256sum] = "8ce2b7fc941b3a24138a0a7cf8e858bfc6a992e7978a068a5c760deb0ed43caf"
+SRC_URI[syn-2.0.106.sha256sum] = "ede7c438028d4436d71104916910f5bb611972c5cfd7f89b8300a8186e6fada6"
 SRC_URI[target-lexicon-0.13.2.sha256sum] = "e502f78cdbb8ba4718f566c418c52bc729126ffd16baee5baa718cf25dd5a69a"
 SRC_URI[triomphe-0.1.14.sha256sum] = "ef8f7726da4807b58ea5c96fdc122f80702030edc33b35aff9190a51148ccc85"
 SRC_URI[unicode-ident-1.0.18.sha256sum] = "5a5f39404a5da50712a4c1eecf25e90dd62b613502b7e925fd4e4d19b5c96512"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.27.1.bb b/meta/recipes-devtools/python/python3-rpds-py_0.28.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-rpds-py_0.27.1.bb
rename to meta/recipes-devtools/python/python3-rpds-py_0.28.0.bb
index dfaffb6546..9f7f09bec8 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.27.1.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.28.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/rpds-py/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
-SRC_URI[sha256sum] = "26a1c73171d10b7acccbded82bf6a586ab8203601e565badc74bbbf8bc5a10f8"
+SRC_URI[sha256sum] = "abd4df20485a0983e2ca334a216249b6186d6e3c1627e106651943dbdb791aea"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============1126386889582881340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-rpds-py: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/rpds_py/rpds_py-0.27.1.tar.gz;downloadfilename=rpds_py-0.27.1.tar.gz crate://crates.io/archery/1.2.1 crate://crates.io/autocfg/1.4.0 crate://crates.io/cc/1.2.25 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/libc/0.2.172 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/portable-atomic/1.11.0 crate://crates.io/proc-macro2/1.0.95 crate://crates.io/pyo3/0.25.1 crate://crates.io/pyo3-build-config/0.25.1 crate://crates.io/pyo3-ffi/0.25.1 crate://crates.io/pyo3-macros/0.25.1 crate://crates.io/pyo3-macros-backend/0.25.1 crate://crates.io/python3-dll-a/0.2.14 crate://crates.io/quote/1.0.40 crate://crates.io/rpds/1.1.1 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.101 crate://crates.io/target-lexicon/0.13.2 crate://crates.io/triomphe/0.1.14 crate://crates.io/unicode-ident/1.0.18 crate://crates.io/uni
 ndent/0.2.4" to "https://files.pythonhosted.org/packages/source/r/rpds_py/rpds_py-0.28.0.tar.gz;downloadfilename=rpds_py-0.28.0.tar.gz crate://crates.io/archery/1.2.2 crate://crates.io/autocfg/1.5.0 crate://crates.io/cc/1.2.34 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/libc/0.2.175 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/portable-atomic/1.11.1 crate://crates.io/proc-macro2/1.0.101 crate://crates.io/pyo3/0.27.1 crate://crates.io/pyo3-build-config/0.27.1 crate://crates.io/pyo3-ffi/0.27.1 crate://crates.io/pyo3-macros/0.27.1 crate://crates.io/pyo3-macros-backend/0.27.1 crate://crates.io/python3-dll-a/0.2.14 crate://crates.io/quote/1.0.40 crate://crates.io/rpds/1.1.2 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.106 crate://crates.io/target-lexicon/0.13.2 crate://crates.io/triomphe/0.1.14 crate://crates.io/unicode-ident/1.0.18 crate://crates.io/unindent/0.2.4"
packages/x86-64-v3-poky-linux/python3-rpds-py: PKGV changed from 0.27.1 [default] to 0.28.0 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py: PV changed from "0.27.1" to "0.28.0"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PKGSIZE changed from 291808 to 282424 (-3%)
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PKGV changed from 0.27.1 [default] to 0.28.0 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PV changed from "0.27.1" to "0.28.0"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dev: PKGV changed from 0.27.1 [default] to 0.28.0 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dev: PV changed from "0.27.1" to "0.28.0"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-doc: PKGV changed from 0.27.1 [default] to 0.28.0 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-doc: PV changed from "0.27.1" to "0.28.0"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-locale: PKGV changed from 0.27.1 [default] to 0.28.0 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-locale: PV changed from "0.27.1" to "0.28.0"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PKGV changed from 0.27.1 [default] to 0.28.0 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PV changed from "0.27.1" to "0.28.0"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-src: PKGV changed from 0.27.1 [default] to 0.28.0 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-src: PV changed from "0.27.1" to "0.28.0"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-staticdev: PKGV changed from 0.27.1 [default] to 0.28.0 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-staticdev: PV changed from "0.27.1" to "0.28.0"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: PKGSIZE changed from 793114 to 784505 (-1%)
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: PKGV changed from 0.27.1 [default] to 0.28.0 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: PV changed from "0.27.1" to "0.28.0"
Changes to packages/x86-64-v3-poky-linux/python3-rpds-py (sysroot):
  /usr/lib/python3.13/site-packages/rpds_py-0.27.1.dist-info moved to /usr/lib/python3.13/site-packages/rpds_py-0.28.0.dist-info

--===============1126386889582881340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-rpds-py (sysroot):
  /usr/lib/python3.13/site-packages/rpds_py-0.27.1.dist-info moved to /usr/lib/python3.13/site-packages/rpds_py-0.28.0.dist-info

--===============1126386889582881340==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-rpds-py-upgrade-0.27.1-0.28.0.patch"

RnJvbSBhNDFlNjcyY2IyYmRjYmQyYzE5N2FiZmNhOTBhNTMyMDgzNjc5Y2E0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTE6MTQ6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXJwZHMtcHk6IHVwZ3JhZGUgMC4yNy4xIC0+IDAuMjguMAoKLS0tCiAuLi4vcHl0aG9u
L3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMuaW5jICAgICAgICAgfCA1MiArKysrKysrKystLS0tLS0t
LS0tCiAuLi5weV8wLjI3LjEuYmIgPT4gcHl0aG9uMy1ycGRzLXB5XzAuMjguMC5iYn0gfCAgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXJwZHMtcHlfMC4yNy4x
LmJiID0+IHB5dGhvbjMtcnBkcy1weV8wLjI4LjAuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHktY3JhdGVzLmluYyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5LWNyYXRlcy5pbmMKaW5k
ZXggYTBiNjY5ZGYyZC4uOTNjZDI2MTI5YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHktY3JhdGVzLmluYworKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMuaW5jCkBAIC0yLDUyICsyLDUy
IEBACiAKICMgZnJvbSBDYXJnby5sb2NrCiBTUkNfVVJJICs9ICIgXAotICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2FyY2hlcnkvMS4yLjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2F1dG9jZmcvMS40
LjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NjLzEuMi4yNSBcCisgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vYXJjaGVyeS8xLjIuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXV0b2NmZy8xLjUu
MCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2MvMS4yLjM0IFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9oZWNrLzAuNS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pbmRvYy8yLjAuNiBcCi0g
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGliYy8wLjIuMTcyIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5p
by9saWJjLzAuMi4xNzUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL21lbW9mZnNldC8wLjkuMSBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb25jZV9jZWxsLzEuMjEuMyBcCi0gICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcG9ydGFibGUtYXRvbWljLzEuMTEuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
cHJvYy1tYWNybzIvMS4wLjk1IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLzAuMjUuMSBc
Ci0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1idWlsZC1jb25maWcvMC4yNS4xIFwKLSAgICBj
cmF0ZTovL2NyYXRlcy5pby9weW8zLWZmaS8wLjI1LjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3B5bzMtbWFjcm9zLzAuMjUuMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3Mt
YmFja2VuZC8wLjI1LjEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BvcnRhYmxlLWF0b21pYy8x
LjExLjEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Byb2MtbWFjcm8yLzEuMC4xMDEgXAorICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMvMC4yNy4xIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9w
eW8zLWJ1aWxkLWNvbmZpZy8wLjI3LjEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtZmZp
LzAuMjcuMSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3MvMC4yNy4xIFwKKyAg
ICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy1iYWNrZW5kLzAuMjcuMSBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vcHl0aG9uMy1kbGwtYS8wLjIuMTQgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3F1b3RlLzEuMC40MCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnBkcy8xLjEuMSBcCisg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnBkcy8xLjEuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
c2hsZXgvMS4zLjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5bi8yLjAuMTAxIFwKKyAgICBj
cmF0ZTovL2NyYXRlcy5pby9zeW4vMi4wLjEwNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGFy
Z2V0LWxleGljb24vMC4xMy4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90cmlvbXBoZS8wLjEu
MTQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUtaWRlbnQvMS4wLjE4IFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby91bmluZGVudC8wLjIuNCBcCiAiCiAKLVNSQ19VUklbYXJjaGVyeS0x
LjIuMS5zaGEyNTZzdW1dID0gImVhZTJlZDIxY2Q1NTAyMWYwNTcwN2E4MDdhNWZjODU2OTVkYWZi
OTg4MzI5MjFmNmNmYTA2ZGI2N2NhNWI4NjkiCi1TUkNfVVJJW2F1dG9jZmctMS40LjAuc2hhMjU2
c3VtXSA9ICJhY2U1MGJhZGU4ZTYyMzRhYTE0MGQ5YTJmNTUyYmJlZTFkYjRkMzUzZjY5YjgyMTdi
YzUwMzQ5MGZjMWE5ZjI2IgotU1JDX1VSSVtjYy0xLjIuMjUuc2hhMjU2c3VtXSA9ICJkMGZjODk3
ZGMxZTg2NWNjNjdjMGUwNWE4MzZkOWQzZjFkZjNjYmU0NDJhYTRhOTQ3M2IxOGUxMjYyNGE0OTUx
IgorU1JDX1VSSVthcmNoZXJ5LTEuMi4yLnNoYTI1NnN1bV0gPSAiNzBlMGE1Zjk5ZGZlYmI4N2Ji
MzQyZDBmNTNiYjkyYzgxODQyZTEwMGJiYjkxNTIyM2UzODM0OTU4MGU1NDQxZCIKK1NSQ19VUklb
YXV0b2NmZy0xLjUuMC5zaGEyNTZzdW1dID0gImMwODYwNmY4YzNjYmY0Y2U2ZWM4ZTI4ZmIwMDE0
YTJjMDg2NzA4ZmU5NTRlYWE4ODUzODRhNjE2NTE3MmU3ZTgiCitTUkNfVVJJW2NjLTEuMi4zNC5z
aGEyNTZzdW1dID0gIjQyYmM0YWVhODAwMzJiN2JmNDA5YjBiYzdjY2FkODg4NTM4NTg5MTFiNzcx
M2E4MDYyZmRjMDYyMzg2N2JlZGMiCiBTUkNfVVJJW2hlY2stMC41LjAuc2hhMjU2c3VtXSA9ICIy
MzA0ZTAwOTgzZjg3ZmZiMzhiNTViNDQ0YjVlM2I2MGE4ODRiNWQzMGMwZmNhN2Q4MmZlMzM0NDli
YmU1NWVhIgogU1JDX1VSSVtpbmRvYy0yLjAuNi5zaGEyNTZzdW1dID0gImY0YzcyNDVhMDg1MDQ5
NTU2MDU2NzBkYmYxNDFmY2VhYjk3NWYxNWNhMjE1NzA2OTZhZWJlOWQyZTcxNTc2YmQiCi1TUkNf
VVJJW2xpYmMtMC4yLjE3Mi5zaGEyNTZzdW1dID0gImQ3NTBhZjA0MmY3ZWY0ZjcyNDMwNmRlMDI5
ZDE4ODM2YzI2YzE3NjVhNTRhNmEzZjA5NGNiZDIzYTcyNjdmZmEiCitTUkNfVVJJW2xpYmMtMC4y
LjE3NS5zaGEyNTZzdW1dID0gIjZhODJhZTQ5M2U1OThiYWFlYTUyMDk4MDVjNDliYmYyZWE3ZGU5
NTZkNTBkN2RhMGRhMTE2NGY5YzZkMjg1NDMiCiBTUkNfVVJJW21lbW9mZnNldC0wLjkuMS5zaGEy
NTZzdW1dID0gIjQ4ODAxNmJmYWU0NTdiMDM2ZDk5NjA5MmY2Y2I0NDg2Nzc2MTFjZTQ0NDllOTcw
Y2VhZjQyNjk1MjAzZjIxOGEiCiBTUkNfVVJJW29uY2VfY2VsbC0xLjIxLjMuc2hhMjU2c3VtXSA9
ICI0MmY1ZTE1Yzk5NTNjNWU0Y2NjZWViMmU3MzgyYTcxNjQ4MmMzNDUxNTMxNWY3YjAzNTMyYjhi
NGU4MzkzZDJkIgotU1JDX1VSSVtwb3J0YWJsZS1hdG9taWMtMS4xMS4wLnNoYTI1NnN1bV0gPSAi
MzUwZTliNDhjYmM2YjBlMDI4YjA0NzNiMTE0NDU0YzYzMTZlNTczMzZlZTE4NGNlYWI2ZTUzZjcy
YzE3OGIzZSIKLVNSQ19VUklbcHJvYy1tYWNybzItMS4wLjk1LnNoYTI1NnN1bV0gPSAiMDJiM2U1
ZTY4YTNhMWEwMmFhZDNlYzQ5MGE5ODAwN2NiYzEzYzM3Y2JlODRhM2NkN2I4ZTQwNmQ3NmU3Zjc3
OCIKLVNSQ19VUklbcHlvMy0wLjI1LjEuc2hhMjU2c3VtXSA9ICI4OTcwYTc4YWZlMDYyOGEzZTM0
MzAzNzZmYzVmZDc2YjZiNDVjNGQ0MzM2MGZmZDZjZGQ0MGJkZGU3MmI2ODJhIgotU1JDX1VSSVtw
eW8zLWJ1aWxkLWNvbmZpZy0wLjI1LjEuc2hhMjU2c3VtXSA9ICI0NThlYjBjNTVlN2VjZTAxN2Fk
ZWJhMzhmMjI0OGZmM2FjNjE1ZTUzNjYwZDdjNzFhMjM4ZDdkMmEwMWM3NTk4IgotU1JDX1VSSVtw
eW8zLWZmaS0wLjI1LjEuc2hhMjU2c3VtXSA9ICI3MTE0ZmU1NDU3YzYxYjI3NmFiNzdjNTA1NWYy
MDYyOTViODEyNjA4MDgzNjQ0YTVjNWIyNjQwYzMxMDI1NjVjIgotU1JDX1VSSVtweW8zLW1hY3Jv
cy0wLjI1LjEuc2hhMjU2c3VtXSA9ICJhODcyNWMwYTYyMmIzNzRkNmNiMDUxZDExYTA5ODM3ODY0
NDhmNzc4NTMzNjEzOWMzYzk0ZjVhYTZiZWY3ZTUwIgotU1JDX1VSSVtweW8zLW1hY3Jvcy1iYWNr
ZW5kLTAuMjUuMS5zaGEyNTZzdW1dID0gIjQxMDk5ODRjMjI0OTEwODUzNDNjMDViMGRiYzU0ZGRj
NDA1YzNjZjdiNDM3NGZjNTMzZjVjMzMxM2E1NzJjY2MiCitTUkNfVVJJW3BvcnRhYmxlLWF0b21p
Yy0xLjExLjEuc2hhMjU2c3VtXSA9ICJmODQyNjdiMjBhMTZlYTkxOGU0M2M2YTg4NDMzYzJkNTRm
YTE0NWM5MmE4MTFiNWIwNDdjY2JlMTUzNjc0NDgzIgorU1JDX1VSSVtwcm9jLW1hY3JvMi0xLjAu
MTAxLnNoYTI1NnN1bV0gPSAiODlhZTQzZmQ4NmU0MTU4ZDZkYjUxYWQ4ZTJiODBmMzEzYWY5Y2M3
NGY1YzBlMDNjY2I4N2RlMDk5OTg3MzJkZSIKK1NSQ19VUklbcHlvMy0wLjI3LjEuc2hhMjU2c3Vt
XSA9ICIzN2E2ZGY3ZWFiNjVmYzdiZWU2NTRhNDIxNDA0OTQ3ZTEwYTBmNzA4NWI2OTUxYmYyZWEz
OTVmNDY1OWZiMGNmIgorU1JDX1VSSVtweW8zLWJ1aWxkLWNvbmZpZy0wLjI3LjEuc2hhMjU2c3Vt
XSA9ICJmNzdkMzg3Nzc0ZjZmNmVlYzY0YTAwNGVhYzBlZDUyNWFhYjdmYTE5NjZkOTRiNDJmNzQz
Nzk3YjNlMzk1YWZiIgorU1JDX1VSSVtweW8zLWZmaS0wLjI3LjEuc2hhMjU2c3VtXSA9ICIyZGQx
Mzg0NGE0MjQyNzkzZTAyZGYzZTJlYzA5M2Y1NDBkOTQ4Mjk5YTZhNzdlYTljZTdhZmQ4NjIzZjU0
MmJlIgorU1JDX1VSSVtweW8zLW1hY3Jvcy0wLjI3LjEuc2hhMjU2c3VtXSA9ICJlYWY4ZjlmMTEw
ODI3MGI5MGQzNjc2Yjg2Nzk1ODYzODU0MzBlNWMwYmI3OGJiNWYwNDNmOTU0OTljODIxYTcxIgor
U1JDX1VSSVtweW8zLW1hY3Jvcy1iYWNrZW5kLTAuMjcuMS5zaGEyNTZzdW1dID0gIjcwYTNiMjI3
NDQ1MGJhNTI4OGJjOWI4YzFiNjlmZjU2OWQxZDYxMTg5ZDRiZmYzOGY4ZDIyZTAzZDE3ZjkzMmIi
CiBTUkNfVVJJW3B5dGhvbjMtZGxsLWEtMC4yLjE0LnNoYTI1NnN1bV0gPSAiZDM4MWVmMzEzYWU3
MGI0ZGE1Zjk1ZjhhNGRlNzczYzZhYTVjZDI4ZjczYWRlYzRiNGEzMWRmNzBiNjY3ODBkOCIKIFNS
Q19VUklbcXVvdGUtMS4wLjQwLnNoYTI1NnN1bV0gPSAiMTg4NWMwMzk1NzBkYzAwZGNiNGZmMDg3
YTg5ZTE4NWZkNTZiYWUyMzRkZGM3ZjA1NmE5NDViZjM2NDY3MjQ4ZCIKLVNSQ19VUklbcnBkcy0x
LjEuMS5zaGEyNTZzdW1dID0gImE3Zjg5ZjY1NGQ1MWZmZmRkNjAyNjI4OWQwN2QxZmQ1MjMyNDRk
NDZhZTBhOGJjMjJjYWE2ZGQ3ZjllOGNiMGIiCitTUkNfVVJJW3JwZHMtMS4xLjIuc2hhMjU2c3Vt
XSA9ICJhY2I0ZWZjZGJmNWQ1NDg5YTg3OGY0ODY4NmUwOGUwZTM4ZGE1OTRlOTgyOTUyMzViNWFl
ZWFiZTkwNWZiZmY2IgogU1JDX1VSSVtzaGxleC0xLjMuMC5zaGEyNTZzdW1dID0gIjBmZGEyZmYw
ZDA4NDAxOWJhNGQ3YzZmMzcxYzk1ZDhmZDc1Y2UzNTI0YzNjYjhmYjY1M2EzMDIzZjYzMjNlNjQi
Ci1TUkNfVVJJW3N5bi0yLjAuMTAxLnNoYTI1NnN1bV0gPSAiOGNlMmI3ZmM5NDFiM2EyNDEzOGEw
YTdjZjhlODU4YmZjNmE5OTJlNzk3OGEwNjhhNWM3NjBkZWIwZWQ0M2NhZiIKK1NSQ19VUklbc3lu
LTIuMC4xMDYuc2hhMjU2c3VtXSA9ICJlZGU3YzQzODAyOGQ0NDM2ZDcxMTA0OTE2OTEwZjViYjYx
MTk3MmM1Y2ZkN2Y4OWI4MzAwYTgxODZlNmZhZGE2IgogU1JDX1VSSVt0YXJnZXQtbGV4aWNvbi0w
LjEzLjIuc2hhMjU2c3VtXSA9ICJlNTAyZjc4Y2RiYjhiYTQ3MThmNTY2YzQxOGM1MmJjNzI5MTI2
ZmZkMTZiYWVlNWJhYTcxOGNmMjVkZDVhNjlhIgogU1JDX1VSSVt0cmlvbXBoZS0wLjEuMTQuc2hh
MjU2c3VtXSA9ICJlZjhmNzcyNmRhNDgwN2I1OGVhNWM5NmZkYzEyMmY4MDcwMjAzMGVkYzMzYjM1
YWZmOTE5MGE1MTE0OGNjYzg1IgogU1JDX1VSSVt1bmljb2RlLWlkZW50LTEuMC4xOC5zaGEyNTZz
dW1dID0gIjVhNWYzOTQwNGE1ZGE1MDcxMmE0YzFlZWNmMjVlOTBkZDYyYjYxMzUwMmI3ZTkyNWZk
NGU0ZDE5YjVjOTY1MTIiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcnBkcy1weV8wLjI3LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcnBkcy1weV8wLjI4LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHlfMC4yNy4xLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weV8w
LjI4LjAuYmIKaW5kZXggZGZhZmZiNjU0Ni4uOWY3ZjA5YmVjOCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHlfMC4yNy4xLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5XzAuMjguMC5iYgpAQCAt
NCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9weXBpLm9yZy9wcm9qZWN0L3JwZHMtcHkv
IgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21k
NT03NzY3ZmE1MzdjNDU5NmM1NDE0MWYzMjg4MmM0YTk4NCIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjI2YTFjNzMxNzFkMTBiN2FjY2NiZGVkODJiZjZhNTg2YWI4MjAzNjAxZTU2NWJhZGM3NGJi
YmY4YmM1YTEwZjgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWJkNGRmMjA0ODVhMDk4M2UyY2Ez
MzRhMjE2MjQ5YjYxODZkNmUzYzE2MjdlMTA2NjUxOTQzZGJkYjc5MWFlYSIKIAogcmVxdWlyZSAk
e0JQTn0tY3JhdGVzLmluYwogCi0tIAoyLjQ3LjEKCg==

--===============1126386889582881340==--

