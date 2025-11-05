Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C185CD37A7
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:36 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2352.1762384576429757912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Vq4kvDif;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=LoS0fe/r;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019a564eb244-f24055b6-0241-4a4e-9c27-12843fc3e8e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384589;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=btmp+Z0TRu2OnN0CCUAoAu0ZbF1ifj5dRUju89gZlXA=;
	b=Vq4kvDifMHcTlaG82SU56235GZNKyBlHVL2zRe8TESeotZUGZWAUoVdIJ0mXnHrN
	QaS+YwHgYdS0wWShgyZslKhMd/4lXA3xoFLPXjPMs7A1TcjTvbgC5hnohIH76/1FD50
	fqxlEDQ5iL5XJcd3rgthvTSr9IvYTE3dqQnTyRzM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384589;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=btmp+Z0TRu2OnN0CCUAoAu0ZbF1ifj5dRUju89gZlXA=;
	b=LoS0fe/rwloG/UQqKw7XpHM+jkql04whwWz2j07PMC8vpA3qLLx/5VWsHGpaqhau
	98o/zcuuiOxAVsdKI5KSedbGE349527e9GCeQKxJcvK4wCS8n/nezQO6BMrfymCcbRM
	U0bqzevMJ6pRRJ3yN/SusHDhyDfYglne018yE/ZM=
Content-Type: multipart/mixed; boundary="===============4781413470019733161=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-rpds-py: upgrading to 0.28.0 SUCCEEDED
Message-ID: <0101019a564eb244-f24055b6-0241-4a4e-9c27-12843fc3e8e4-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225846

--===============4781413470019733161==
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
From eaf21bc5bf34dcc33a338158fc06c441389bd507 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 17:48:59 +0000
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


--===============4781413470019733161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-rpds-py (sysroot):
  /usr/lib/python3.13/site-packages/rpds_py-0.27.1.dist-info moved to /usr/lib/python3.13/site-packages/rpds_py-0.28.0.dist-info

--===============4781413470019733161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-rpds-py: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/rpds_py/rpds_py-0.27.1.tar.gz;downloadfilename=rpds_py-0.27.1.tar.gz crate://crates.io/archery/1.2.1 crate://crates.io/autocfg/1.4.0 crate://crates.io/cc/1.2.25 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/libc/0.2.172 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/portable-atomic/1.11.0 crate://crates.io/proc-macro2/1.0.95 crate://crates.io/pyo3/0.25.1 crate://crates.io/pyo3-build-config/0.25.1 crate://crates.io/pyo3-ffi/0.25.1 crate://crates.io/pyo3-macros/0.25.1 crate://crates.io/pyo3-macros-backend/0.25.1 crate://crates.io/python3-dll-a/0.2.14 crate://crates.io/quote/1.0.40 crate://crates.io/rpds/1.1.1 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.101 crate://crates.io/target-lexicon/0.13.2 crate://crates.io/triomphe/0.1.14 crate://crates.io/unicode-ident/1.0.18 crate://crates.io/uni
 ndent/0.2.4" to "https://files.pythonhosted.org/packages/source/r/rpds_py/rpds_py-0.28.0.tar.gz;downloadfilename=rpds_py-0.28.0.tar.gz crate://crates.io/archery/1.2.2 crate://crates.io/autocfg/1.5.0 crate://crates.io/cc/1.2.34 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/libc/0.2.175 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/portable-atomic/1.11.1 crate://crates.io/proc-macro2/1.0.101 crate://crates.io/pyo3/0.27.1 crate://crates.io/pyo3-build-config/0.27.1 crate://crates.io/pyo3-ffi/0.27.1 crate://crates.io/pyo3-macros/0.27.1 crate://crates.io/pyo3-macros-backend/0.27.1 crate://crates.io/python3-dll-a/0.2.14 crate://crates.io/quote/1.0.40 crate://crates.io/rpds/1.1.2 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.106 crate://crates.io/target-lexicon/0.13.2 crate://crates.io/triomphe/0.1.14 crate://crates.io/unicode-ident/1.0.18 crate://crates.io/unindent/0.2.4"
packages/x86-64-v3-poky-linux/python3-rpds-py: PKGV changed from 0.27.1 [default] to 0.28.0 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py: PV changed from "0.27.1" to "0.28.0"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PKGV changed from 0.27.1 [default] to 0.28.0 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PV changed from "0.27.1" to "0.28.0"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PKGSIZE changed from 291808 to 282296 (-3%)
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
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: PKGV changed from 0.27.1 [default] to 0.28.0 [default]
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: PV changed from "0.27.1" to "0.28.0"
packages/x86-64-v3-poky-linux/python3-rpds-py/python3-rpds-py: PKGSIZE changed from 793114 to 784505 (-1%)
Changes to packages/x86-64-v3-poky-linux/python3-rpds-py (sysroot):
  /usr/lib/python3.13/site-packages/rpds_py-0.27.1.dist-info moved to /usr/lib/python3.13/site-packages/rpds_py-0.28.0.dist-info

--===============4781413470019733161==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-rpds-py-upgrade-0.27.1-0.28.0.patch"

RnJvbSBlYWYyMWJjNWJmMzRkY2MzM2EzMzgxNThmYzA2YzQ0MTM4OWJkNTA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNzo0ODo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcnBkcy1weTogdXBncmFkZSAwLjI3LjEgLT4gMC4yOC4wCgotLS0KIC4uLi9weXRob24v
cHl0aG9uMy1ycGRzLXB5LWNyYXRlcy5pbmMgICAgICAgICB8IDUyICsrKysrKysrKy0tLS0tLS0t
LS0KIC4uLnB5XzAuMjcuMS5iYiA9PiBweXRob24zLXJwZHMtcHlfMC4yOC4wLmJifSB8ICAyICst
CiAyIGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcnBkcy1weV8wLjI3LjEu
YmIgPT4gcHl0aG9uMy1ycGRzLXB5XzAuMjguMC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMuaW5jIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHktY3JhdGVzLmluYwppbmRl
eCBhMGI2NjlkZjJkLi45M2NkMjYxMjljIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5LWNyYXRlcy5pbmMKQEAgLTIsNTIgKzIsNTIg
QEAKIAogIyBmcm9tIENhcmdvLmxvY2sKIFNSQ19VUkkgKz0gIiBcCi0gICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vYXJjaGVyeS8xLjIuMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXV0b2NmZy8xLjQu
MCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2MvMS4yLjI1IFwKKyAgICBjcmF0ZTovL2NyYXRl
cy5pby9hcmNoZXJ5LzEuMi4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9hdXRvY2ZnLzEuNS4w
IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9jYy8xLjIuMzQgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2hlY2svMC41LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2luZG9jLzIuMC42IFwKLSAg
ICBjcmF0ZTovL2NyYXRlcy5pby9saWJjLzAuMi4xNzIgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2xpYmMvMC4yLjE3NSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWVtb2Zmc2V0LzAuOS4xIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9vbmNlX2NlbGwvMS4yMS4zIFwKLSAgICBjcmF0ZTovL2Ny
YXRlcy5pby9wb3J0YWJsZS1hdG9taWMvMS4xMS4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9w
cm9jLW1hY3JvMi8xLjAuOTUgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMvMC4yNS4xIFwK
LSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWJ1aWxkLWNvbmZpZy8wLjI1LjEgXAotICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3B5bzMtZmZpLzAuMjUuMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
cHlvMy1tYWNyb3MvMC4yNS4xIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy1i
YWNrZW5kLzAuMjUuMSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcG9ydGFibGUtYXRvbWljLzEu
MTEuMSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHJvYy1tYWNybzIvMS4wLjEwMSBcCisgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy8wLjI3LjEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5
bzMtYnVpbGQtY29uZmlnLzAuMjcuMSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1mZmkv
MC4yNy4xIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy8wLjI3LjEgXAorICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLWJhY2tlbmQvMC4yNy4xIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9weXRob24zLWRsbC1hLzAuMi4xNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vcXVvdGUvMS4wLjQwIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9ycGRzLzEuMS4xIFwKKyAg
ICBjcmF0ZTovL2NyYXRlcy5pby9ycGRzLzEuMS4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9z
aGxleC8xLjMuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3luLzIuMC4xMDEgXAorICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3N5bi8yLjAuMTA2IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90YXJn
ZXQtbGV4aWNvbi8wLjEzLjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RyaW9tcGhlLzAuMS4x
NCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdW5pY29kZS1pZGVudC8xLjAuMTggXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3VuaW5kZW50LzAuMi40IFwKICIKIAotU1JDX1VSSVthcmNoZXJ5LTEu
Mi4xLnNoYTI1NnN1bV0gPSAiZWFlMmVkMjFjZDU1MDIxZjA1NzA3YTgwN2E1ZmM4NTY5NWRhZmI5
ODgzMjkyMWY2Y2ZhMDZkYjY3Y2E1Yjg2OSIKLVNSQ19VUklbYXV0b2NmZy0xLjQuMC5zaGEyNTZz
dW1dID0gImFjZTUwYmFkZThlNjIzNGFhMTQwZDlhMmY1NTJiYmVlMWRiNGQzNTNmNjliODIxN2Jj
NTAzNDkwZmMxYTlmMjYiCi1TUkNfVVJJW2NjLTEuMi4yNS5zaGEyNTZzdW1dID0gImQwZmM4OTdk
YzFlODY1Y2M2N2MwZTA1YTgzNmQ5ZDNmMWRmM2NiZTQ0MmFhNGE5NDczYjE4ZTEyNjI0YTQ5NTEi
CitTUkNfVVJJW2FyY2hlcnktMS4yLjIuc2hhMjU2c3VtXSA9ICI3MGUwYTVmOTlkZmViYjg3YmIz
NDJkMGY1M2JiOTJjODE4NDJlMTAwYmJiOTE1MjIzZTM4MzQ5NTgwZTU0NDFkIgorU1JDX1VSSVth
dXRvY2ZnLTEuNS4wLnNoYTI1NnN1bV0gPSAiYzA4NjA2ZjhjM2NiZjRjZTZlYzhlMjhmYjAwMTRh
MmMwODY3MDhmZTk1NGVhYTg4NTM4NGE2MTY1MTcyZTdlOCIKK1NSQ19VUklbY2MtMS4yLjM0LnNo
YTI1NnN1bV0gPSAiNDJiYzRhZWE4MDAzMmI3YmY0MDliMGJjN2NjYWQ4ODg1Mzg1ODkxMWI3NzEz
YTgwNjJmZGMwNjIzODY3YmVkYyIKIFNSQ19VUklbaGVjay0wLjUuMC5zaGEyNTZzdW1dID0gIjIz
MDRlMDA5ODNmODdmZmIzOGI1NWI0NDRiNWUzYjYwYTg4NGI1ZDMwYzBmY2E3ZDgyZmUzMzQ0OWJi
ZTU1ZWEiCiBTUkNfVVJJW2luZG9jLTIuMC42LnNoYTI1NnN1bV0gPSAiZjRjNzI0NWEwODUwNDk1
NTYwNTY3MGRiZjE0MWZjZWFiOTc1ZjE1Y2EyMTU3MDY5NmFlYmU5ZDJlNzE1NzZiZCIKLVNSQ19V
UklbbGliYy0wLjIuMTcyLnNoYTI1NnN1bV0gPSAiZDc1MGFmMDQyZjdlZjRmNzI0MzA2ZGUwMjlk
MTg4MzZjMjZjMTc2NWE1NGE2YTNmMDk0Y2JkMjNhNzI2N2ZmYSIKK1NSQ19VUklbbGliYy0wLjIu
MTc1LnNoYTI1NnN1bV0gPSAiNmE4MmFlNDkzZTU5OGJhYWVhNTIwOTgwNWM0OWJiZjJlYTdkZTk1
NmQ1MGQ3ZGEwZGExMTY0ZjljNmQyODU0MyIKIFNSQ19VUklbbWVtb2Zmc2V0LTAuOS4xLnNoYTI1
NnN1bV0gPSAiNDg4MDE2YmZhZTQ1N2IwMzZkOTk2MDkyZjZjYjQ0ODY3NzYxMWNlNDQ0OWU5NzBj
ZWFmNDI2OTUyMDNmMjE4YSIKIFNSQ19VUklbb25jZV9jZWxsLTEuMjEuMy5zaGEyNTZzdW1dID0g
IjQyZjVlMTVjOTk1M2M1ZTRjY2NlZWIyZTczODJhNzE2NDgyYzM0NTE1MzE1ZjdiMDM1MzJiOGI0
ZTgzOTNkMmQiCi1TUkNfVVJJW3BvcnRhYmxlLWF0b21pYy0xLjExLjAuc2hhMjU2c3VtXSA9ICIz
NTBlOWI0OGNiYzZiMGUwMjhiMDQ3M2IxMTQ0NTRjNjMxNmU1NzMzNmVlMTg0Y2VhYjZlNTNmNzJj
MTc4YjNlIgotU1JDX1VSSVtwcm9jLW1hY3JvMi0xLjAuOTUuc2hhMjU2c3VtXSA9ICIwMmIzZTVl
NjhhM2ExYTAyYWFkM2VjNDkwYTk4MDA3Y2JjMTNjMzdjYmU4NGEzY2Q3YjhlNDA2ZDc2ZTdmNzc4
IgotU1JDX1VSSVtweW8zLTAuMjUuMS5zaGEyNTZzdW1dID0gIjg5NzBhNzhhZmUwNjI4YTNlMzQz
MDM3NmZjNWZkNzZiNmI0NWM0ZDQzMzYwZmZkNmNkZDQwYmRkZTcyYjY4MmEiCi1TUkNfVVJJW3B5
bzMtYnVpbGQtY29uZmlnLTAuMjUuMS5zaGEyNTZzdW1dID0gIjQ1OGViMGM1NWU3ZWNlMDE3YWRl
YmEzOGYyMjQ4ZmYzYWM2MTVlNTM2NjBkN2M3MWEyMzhkN2QyYTAxYzc1OTgiCi1TUkNfVVJJW3B5
bzMtZmZpLTAuMjUuMS5zaGEyNTZzdW1dID0gIjcxMTRmZTU0NTdjNjFiMjc2YWI3N2M1MDU1ZjIw
NjI5NWI4MTI2MDgwODM2NDRhNWM1YjI2NDBjMzEwMjU2NWMiCi1TUkNfVVJJW3B5bzMtbWFjcm9z
LTAuMjUuMS5zaGEyNTZzdW1dID0gImE4NzI1YzBhNjIyYjM3NGQ2Y2IwNTFkMTFhMDk4Mzc4NjQ0
OGY3Nzg1MzM2MTM5YzNjOTRmNWFhNmJlZjdlNTAiCi1TUkNfVVJJW3B5bzMtbWFjcm9zLWJhY2tl
bmQtMC4yNS4xLnNoYTI1NnN1bV0gPSAiNDEwOTk4NGMyMjQ5MTA4NTM0M2MwNWIwZGJjNTRkZGM0
MDVjM2NmN2I0Mzc0ZmM1MzNmNWMzMzEzYTU3MmNjYyIKK1NSQ19VUklbcG9ydGFibGUtYXRvbWlj
LTEuMTEuMS5zaGEyNTZzdW1dID0gImY4NDI2N2IyMGExNmVhOTE4ZTQzYzZhODg0MzNjMmQ1NGZh
MTQ1YzkyYTgxMWI1YjA0N2NjYmUxNTM2NzQ0ODMiCitTUkNfVVJJW3Byb2MtbWFjcm8yLTEuMC4x
MDEuc2hhMjU2c3VtXSA9ICI4OWFlNDNmZDg2ZTQxNThkNmRiNTFhZDhlMmI4MGYzMTNhZjljYzc0
ZjVjMGUwM2NjYjg3ZGUwOTk5ODczMmRlIgorU1JDX1VSSVtweW8zLTAuMjcuMS5zaGEyNTZzdW1d
ID0gIjM3YTZkZjdlYWI2NWZjN2JlZTY1NGE0MjE0MDQ5NDdlMTBhMGY3MDg1YjY5NTFiZjJlYTM5
NWY0NjU5ZmIwY2YiCitTUkNfVVJJW3B5bzMtYnVpbGQtY29uZmlnLTAuMjcuMS5zaGEyNTZzdW1d
ID0gImY3N2QzODc3NzRmNmY2ZWVjNjRhMDA0ZWFjMGVkNTI1YWFiN2ZhMTk2NmQ5NGI0MmY3NDM3
OTdiM2UzOTVhZmIiCitTUkNfVVJJW3B5bzMtZmZpLTAuMjcuMS5zaGEyNTZzdW1dID0gIjJkZDEz
ODQ0YTQyNDI3OTNlMDJkZjNlMmVjMDkzZjU0MGQ5NDgyOTlhNmE3N2VhOWNlN2FmZDg2MjNmNTQy
YmUiCitTUkNfVVJJW3B5bzMtbWFjcm9zLTAuMjcuMS5zaGEyNTZzdW1dID0gImVhZjhmOWYxMTA4
MjcwYjkwZDM2NzZiODY3OTU4NjM4NTQzMGU1YzBiYjc4YmI1ZjA0M2Y5NTQ5OWM4MjFhNzEiCitT
UkNfVVJJW3B5bzMtbWFjcm9zLWJhY2tlbmQtMC4yNy4xLnNoYTI1NnN1bV0gPSAiNzBhM2IyMjc0
NDUwYmE1Mjg4YmM5YjhjMWI2OWZmNTY5ZDFkNjExODlkNGJmZjM4ZjhkMjJlMDNkMTdmOTMyYiIK
IFNSQ19VUklbcHl0aG9uMy1kbGwtYS0wLjIuMTQuc2hhMjU2c3VtXSA9ICJkMzgxZWYzMTNhZTcw
YjRkYTVmOTVmOGE0ZGU3NzNjNmFhNWNkMjhmNzNhZGVjNGI0YTMxZGY3MGI2Njc4MGQ4IgogU1JD
X1VSSVtxdW90ZS0xLjAuNDAuc2hhMjU2c3VtXSA9ICIxODg1YzAzOTU3MGRjMDBkY2I0ZmYwODdh
ODllMTg1ZmQ1NmJhZTIzNGRkYzdmMDU2YTk0NWJmMzY0NjcyNDhkIgotU1JDX1VSSVtycGRzLTEu
MS4xLnNoYTI1NnN1bV0gPSAiYTdmODlmNjU0ZDUxZmZmZGQ2MDI2Mjg5ZDA3ZDFmZDUyMzI0NGQ0
NmFlMGE4YmMyMmNhYTZkZDdmOWU4Y2IwYiIKK1NSQ19VUklbcnBkcy0xLjEuMi5zaGEyNTZzdW1d
ID0gImFjYjRlZmNkYmY1ZDU0ODlhODc4ZjQ4Njg2ZTA4ZTBlMzhkYTU5NGU5ODI5NTIzNWI1YWVl
YWJlOTA1ZmJmZjYiCiBTUkNfVVJJW3NobGV4LTEuMy4wLnNoYTI1NnN1bV0gPSAiMGZkYTJmZjBk
MDg0MDE5YmE0ZDdjNmYzNzFjOTVkOGZkNzVjZTM1MjRjM2NiOGZiNjUzYTMwMjNmNjMyM2U2NCIK
LVNSQ19VUklbc3luLTIuMC4xMDEuc2hhMjU2c3VtXSA9ICI4Y2UyYjdmYzk0MWIzYTI0MTM4YTBh
N2NmOGU4NThiZmM2YTk5MmU3OTc4YTA2OGE1Yzc2MGRlYjBlZDQzY2FmIgorU1JDX1VSSVtzeW4t
Mi4wLjEwNi5zaGEyNTZzdW1dID0gImVkZTdjNDM4MDI4ZDQ0MzZkNzExMDQ5MTY5MTBmNWJiNjEx
OTcyYzVjZmQ3Zjg5YjgzMDBhODE4NmU2ZmFkYTYiCiBTUkNfVVJJW3RhcmdldC1sZXhpY29uLTAu
MTMuMi5zaGEyNTZzdW1dID0gImU1MDJmNzhjZGJiOGJhNDcxOGY1NjZjNDE4YzUyYmM3MjkxMjZm
ZmQxNmJhZWU1YmFhNzE4Y2YyNWRkNWE2OWEiCiBTUkNfVVJJW3RyaW9tcGhlLTAuMS4xNC5zaGEy
NTZzdW1dID0gImVmOGY3NzI2ZGE0ODA3YjU4ZWE1Yzk2ZmRjMTIyZjgwNzAyMDMwZWRjMzNiMzVh
ZmY5MTkwYTUxMTQ4Y2NjODUiCiBTUkNfVVJJW3VuaWNvZGUtaWRlbnQtMS4wLjE4LnNoYTI1NnN1
bV0gPSAiNWE1ZjM5NDA0YTVkYTUwNzEyYTRjMWVlY2YyNWU5MGRkNjJiNjEzNTAyYjdlOTI1ZmQ0
ZTRkMTliNWM5NjUxMiIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1ycGRzLXB5XzAuMjcuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1ycGRzLXB5XzAuMjguMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weV8wLjI3LjEuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5XzAu
MjguMC5iYgppbmRleCBkZmFmZmI2NTQ2Li45ZjdmMDliZWM4IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weV8wLjI3LjEuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHlfMC4yOC4wLmJiCkBAIC00
LDcgKzQsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3B5cGkub3JnL3Byb2plY3QvcnBkcy1weS8i
CiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1
PTc3NjdmYTUzN2M0NTk2YzU0MTQxZjMyODgyYzRhOTg0IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMjZhMWM3MzE3MWQxMGI3YWNjY2JkZWQ4MmJmNmE1ODZhYjgyMDM2MDFlNTY1YmFkYzc0YmJi
ZjhiYzVhMTBmOCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhYmQ0ZGYyMDQ4NWEwOTgzZTJjYTMz
NGEyMTYyNDliNjE4NmQ2ZTNjMTYyN2UxMDY2NTE5NDNkYmRiNzkxYWVhIgogCiByZXF1aXJlICR7
QlBOfS1jcmF0ZXMuaW5jCiAKLS0gCjIuNDcuMQoK

--===============4781413470019733161==--

