Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA0CBC87FDA
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:50 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.12169.1752594936216481472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=qAxuAJiq;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WLHgR+hw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101980ecc8803-3ad0e1d2-ac89-442c-aec2-18ab12f36d5e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594942;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hg36Ql7Md2VMHWeUY3A9+Qx6rGvOHgHpReR4arrxo5o=;
	b=qAxuAJiqaFtNGE/IgL92psWFoDxAfb2Vs7odmND+VmjBGe+QP+fJJmUFNDmbmX9K
	cROo1409z99xIIDBV+Y8Cw/D+wBPFYMDWIAZS5taxbDMobG+hYaC5mFbmzIfRW0ILuH
	mvVEU/IrgXYfKULLPyVFevnWh+9HaS70gTJ3Rp+U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594942;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hg36Ql7Md2VMHWeUY3A9+Qx6rGvOHgHpReR4arrxo5o=;
	b=WLHgR+hwc79PsQU8lwseLZZelNzT47UdqmYKFyMAI/mrm7HKg0sHLQOmulVzvcAJ
	kFja4UvLn8IvPQsQ5AeQlz2ddqN0D3Dn75M2viuCvWjZi53R/itQsA8IOxp1OQRHQ/N
	j2nB2mz/7BYj9O9ccUahgJpRwQWNv6hplfWUWxpU=
Content-Type: multipart/mixed; boundary="===============1330503084260664448=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-rpds-py: upgrading to 0.26.0 SUCCEEDED
Message-ID: <010101980ecc8803-3ad0e1d2-ac89-442c-aec2-18ab12f36d5e-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220349

--===============1330503084260664448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-rpds-py* to *0.26.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-rpds-py-upgrade-0.25.1-0.26.0.patch
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
From f81dcede6cbf78dbe06ea00d3032919f60744fa4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 10:13:38 +0000
Subject: [PATCH] python3-rpds-py: upgrade 0.25.1 -> 0.26.0

---
 .../python/python3-rpds-py-crates.inc         | 28 +++++++++----------
 ...py_0.25.1.bb => python3-rpds-py_0.26.0.bb} |  2 +-
 2 files changed, 15 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.25.1.bb => python3-rpds-py_0.26.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
index 0a6fbb1bd6..a0b669df2d 100644
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -4,7 +4,7 @@
 SRC_URI += " \
     crate://crates.io/archery/1.2.1 \
     crate://crates.io/autocfg/1.4.0 \
-    crate://crates.io/cc/1.2.22 \
+    crate://crates.io/cc/1.2.25 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/indoc/2.0.6 \
     crate://crates.io/libc/0.2.172 \
@@ -12,12 +12,12 @@ SRC_URI += " \
     crate://crates.io/once_cell/1.21.3 \
     crate://crates.io/portable-atomic/1.11.0 \
     crate://crates.io/proc-macro2/1.0.95 \
-    crate://crates.io/pyo3/0.25.0 \
-    crate://crates.io/pyo3-build-config/0.25.0 \
-    crate://crates.io/pyo3-ffi/0.25.0 \
-    crate://crates.io/pyo3-macros/0.25.0 \
-    crate://crates.io/pyo3-macros-backend/0.25.0 \
-    crate://crates.io/python3-dll-a/0.2.13 \
+    crate://crates.io/pyo3/0.25.1 \
+    crate://crates.io/pyo3-build-config/0.25.1 \
+    crate://crates.io/pyo3-ffi/0.25.1 \
+    crate://crates.io/pyo3-macros/0.25.1 \
+    crate://crates.io/pyo3-macros-backend/0.25.1 \
+    crate://crates.io/python3-dll-a/0.2.14 \
     crate://crates.io/quote/1.0.40 \
     crate://crates.io/rpds/1.1.1 \
     crate://crates.io/shlex/1.3.0 \
@@ -30,7 +30,7 @@ SRC_URI += " \
 
 SRC_URI[archery-1.2.1.sha256sum] = "eae2ed21cd55021f05707a807a5fc85695dafb98832921f6cfa06db67ca5b869"
 SRC_URI[autocfg-1.4.0.sha256sum] = "ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26"
-SRC_URI[cc-1.2.22.sha256sum] = "32db95edf998450acc7881c932f94cd9b05c87b4b2599e8bab064753da4acfd1"
+SRC_URI[cc-1.2.25.sha256sum] = "d0fc897dc1e865cc67c0e05a836d9d3f1df3cbe442aa4a9473b18e12624a4951"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[indoc-2.0.6.sha256sum] = "f4c7245a08504955605670dbf141fceab975f15ca21570696aebe9d2e71576bd"
 SRC_URI[libc-0.2.172.sha256sum] = "d750af042f7ef4f724306de029d18836c26c1765a54a6a3f094cbd23a7267ffa"
@@ -38,12 +38,12 @@ SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce444
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
 SRC_URI[portable-atomic-1.11.0.sha256sum] = "350e9b48cbc6b0e028b0473b114454c6316e57336ee184ceab6e53f72c178b3e"
 SRC_URI[proc-macro2-1.0.95.sha256sum] = "02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778"
-SRC_URI[pyo3-0.25.0.sha256sum] = "f239d656363bcee73afef85277f1b281e8ac6212a1d42aa90e55b90ed43c47a4"
-SRC_URI[pyo3-build-config-0.25.0.sha256sum] = "755ea671a1c34044fa165247aaf6f419ca39caa6003aee791a0df2713d8f1b6d"
-SRC_URI[pyo3-ffi-0.25.0.sha256sum] = "fc95a2e67091e44791d4ea300ff744be5293f394f1bafd9f78c080814d35956e"
-SRC_URI[pyo3-macros-0.25.0.sha256sum] = "a179641d1b93920829a62f15e87c0ed791b6c8db2271ba0fd7c2686090510214"
-SRC_URI[pyo3-macros-backend-0.25.0.sha256sum] = "9dff85ebcaab8c441b0e3f7ae40a6963ecea8a9f5e74f647e33fcf5ec9a1e89e"
-SRC_URI[python3-dll-a-0.2.13.sha256sum] = "49fe4227a288cf9493942ad0220ea3f185f4d1f2a14f197f7344d6d02f4ed4ed"
+SRC_URI[pyo3-0.25.1.sha256sum] = "8970a78afe0628a3e3430376fc5fd76b6b45c4d43360ffd6cdd40bdde72b682a"
+SRC_URI[pyo3-build-config-0.25.1.sha256sum] = "458eb0c55e7ece017adeba38f2248ff3ac615e53660d7c71a238d7d2a01c7598"
+SRC_URI[pyo3-ffi-0.25.1.sha256sum] = "7114fe5457c61b276ab77c5055f206295b812608083644a5c5b2640c3102565c"
+SRC_URI[pyo3-macros-0.25.1.sha256sum] = "a8725c0a622b374d6cb051d11a0983786448f7785336139c3c94f5aa6bef7e50"
+SRC_URI[pyo3-macros-backend-0.25.1.sha256sum] = "4109984c22491085343c05b0dbc54ddc405c3cf7b4374fc533f5c3313a572ccc"
+SRC_URI[python3-dll-a-0.2.14.sha256sum] = "d381ef313ae70b4da5f95f8a4de773c6aa5cd28f73adec4b4a31df70b66780d8"
 SRC_URI[quote-1.0.40.sha256sum] = "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
 SRC_URI[rpds-1.1.1.sha256sum] = "a7f89f654d51fffdd6026289d07d1fd523244d46ae0a8bc22caa6dd7f9e8cb0b"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.25.1.bb b/meta/recipes-devtools/python/python3-rpds-py_0.26.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-rpds-py_0.25.1.bb
rename to meta/recipes-devtools/python/python3-rpds-py_0.26.0.bb
index efc1d4c01c..3fd7701f8d 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.25.1.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.26.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/rpds-py/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
-SRC_URI[sha256sum] = "8960b6dac09b62dac26e75d7e2c4a22efb835d827a7278c34f72b2b84fa160e3"
+SRC_URI[sha256sum] = "20dae58a859b0906f0685642e591056f1e787f3a8b39c8e8749a45dc7d26bdb0"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============1330503084260664448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-rpds-py: PKGV changed from 0.25.1 [default] to 0.26.0 [default]
packages/core2-64-poky-linux/python3-rpds-py: PV changed from "0.25.1" to "0.26.0"
packages/core2-64-poky-linux/python3-rpds-py: SRC_URI changed from "https://files.pythonhosted.org/packages/source/r/rpds_py/rpds_py-0.25.1.tar.gz;downloadfilename=rpds_py-0.25.1.tar.gz crate://crates.io/archery/1.2.1 crate://crates.io/autocfg/1.4.0 crate://crates.io/cc/1.2.22 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/libc/0.2.172 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/portable-atomic/1.11.0 crate://crates.io/proc-macro2/1.0.95 crate://crates.io/pyo3/0.25.0 crate://crates.io/pyo3-build-config/0.25.0 crate://crates.io/pyo3-ffi/0.25.0 crate://crates.io/pyo3-macros/0.25.0 crate://crates.io/pyo3-macros-backend/0.25.0 crate://crates.io/python3-dll-a/0.2.13 crate://crates.io/quote/1.0.40 crate://crates.io/rpds/1.1.1 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.101 crate://crates.io/target-lexicon/0.13.2 crate://crates.io/triomphe/0.1.14 crate://crates.io/unicode-ident/1.0.18 crate://crates.io/unin
 dent/0.2.4" to "https://files.pythonhosted.org/packages/source/r/rpds_py/rpds_py-0.26.0.tar.gz;downloadfilename=rpds_py-0.26.0.tar.gz crate://crates.io/archery/1.2.1 crate://crates.io/autocfg/1.4.0 crate://crates.io/cc/1.2.25 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/libc/0.2.172 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/portable-atomic/1.11.0 crate://crates.io/proc-macro2/1.0.95 crate://crates.io/pyo3/0.25.1 crate://crates.io/pyo3-build-config/0.25.1 crate://crates.io/pyo3-ffi/0.25.1 crate://crates.io/pyo3-macros/0.25.1 crate://crates.io/pyo3-macros-backend/0.25.1 crate://crates.io/python3-dll-a/0.2.14 crate://crates.io/quote/1.0.40 crate://crates.io/rpds/1.1.1 crate://crates.io/shlex/1.3.0 crate://crates.io/syn/2.0.101 crate://crates.io/target-lexicon/0.13.2 crate://crates.io/triomphe/0.1.14 crate://crates.io/unicode-ident/1.0.18 crate://crates.io/unindent/0.2.4"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PKGV changed from 0.25.1 [default] to 0.26.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PV changed from "0.25.1" to "0.26.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dbg: PKGSIZE changed from 288560 to 288456 (-0%)
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dev: PKGV changed from 0.25.1 [default] to 0.26.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-dev: PV changed from "0.25.1" to "0.26.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-doc: PKGV changed from 0.25.1 [default] to 0.26.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-doc: PV changed from "0.25.1" to "0.26.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-locale: PKGV changed from 0.25.1 [default] to 0.26.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-locale: PV changed from "0.25.1" to "0.26.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PKGV changed from 0.25.1 [default] to 0.26.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PV changed from "0.25.1" to "0.26.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-ptest: PKGSIZE changed from 29992 to 30026 (+0%)
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-src: PKGV changed from 0.25.1 [default] to 0.26.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-src: PV changed from "0.25.1" to "0.26.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-staticdev: PKGV changed from 0.25.1 [default] to 0.26.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py-staticdev: PV changed from "0.25.1" to "0.26.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py: PKGV changed from 0.25.1 [default] to 0.26.0 [default]
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py: PV changed from "0.25.1" to "0.26.0"
packages/core2-64-poky-linux/python3-rpds-py/python3-rpds-py: PKGSIZE changed from 821180 to 821231 (+0%)
Changes to packages/core2-64-poky-linux/python3-rpds-py (sysroot):
  /usr/lib/python3.13/site-packages/rpds_py-0.25.1.dist-info moved to /usr/lib/python3.13/site-packages/rpds_py-0.26.0.dist-info

--===============1330503084260664448==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-rpds-py-upgrade-0.25.1-0.26.0.patch"

RnJvbSBmODFkY2VkZTZjYmY3OGRiZTA2ZWEwMGQzMDMyOTE5ZjYwNzQ0ZmE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTA6MTM6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXJwZHMtcHk6IHVwZ3JhZGUgMC4yNS4xIC0+IDAuMjYuMAoKLS0tCiAuLi4vcHl0aG9u
L3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMuaW5jICAgICAgICAgfCAyOCArKysrKysrKystLS0tLS0t
LS0tCiAuLi5weV8wLjI1LjEuYmIgPT4gcHl0aG9uMy1ycGRzLXB5XzAuMjYuMC5iYn0gfCAgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXJwZHMtcHlfMC4yNS4x
LmJiID0+IHB5dGhvbjMtcnBkcy1weV8wLjI2LjAuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHktY3JhdGVzLmluYyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5LWNyYXRlcy5pbmMKaW5k
ZXggMGE2ZmJiMWJkNi4uYTBiNjY5ZGYyZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHktY3JhdGVzLmluYworKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weS1jcmF0ZXMuaW5jCkBAIC00LDcgKzQsNyBA
QAogU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hcmNoZXJ5LzEuMi4xIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9hdXRvY2ZnLzEuNC4wIFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby9jYy8xLjIuMjIgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NjLzEuMi4yNSBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vaGVjay8wLjUuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaW5k
b2MvMi4wLjYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpYmMvMC4yLjE3MiBcCkBAIC0xMiwx
MiArMTIsMTIgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9vbmNlX2Nl
bGwvMS4yMS4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9wb3J0YWJsZS1hdG9taWMvMS4xMS4w
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9wcm9jLW1hY3JvMi8xLjAuOTUgXAotICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3B5bzMvMC4yNS4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWJ1
aWxkLWNvbmZpZy8wLjI1LjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtZmZpLzAuMjUu
MCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3MvMC4yNS4wIFwKLSAgICBjcmF0
ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy1iYWNrZW5kLzAuMjUuMCBcCi0gICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcHl0aG9uMy1kbGwtYS8wLjIuMTMgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5
bzMvMC4yNS4xIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWJ1aWxkLWNvbmZpZy8wLjI1
LjEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtZmZpLzAuMjUuMSBcCisgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3MvMC4yNS4xIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9w
eW8zLW1hY3Jvcy1iYWNrZW5kLzAuMjUuMSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHl0aG9u
My1kbGwtYS8wLjIuMTQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3F1b3RlLzEuMC40MCBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnBkcy8xLjEuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
c2hsZXgvMS4zLjAgXApAQCAtMzAsNyArMzAsNyBAQCBTUkNfVVJJICs9ICIgXAogCiBTUkNfVVJJ
W2FyY2hlcnktMS4yLjEuc2hhMjU2c3VtXSA9ICJlYWUyZWQyMWNkNTUwMjFmMDU3MDdhODA3YTVm
Yzg1Njk1ZGFmYjk4ODMyOTIxZjZjZmEwNmRiNjdjYTViODY5IgogU1JDX1VSSVthdXRvY2ZnLTEu
NC4wLnNoYTI1NnN1bV0gPSAiYWNlNTBiYWRlOGU2MjM0YWExNDBkOWEyZjU1MmJiZWUxZGI0ZDM1
M2Y2OWI4MjE3YmM1MDM0OTBmYzFhOWYyNiIKLVNSQ19VUklbY2MtMS4yLjIyLnNoYTI1NnN1bV0g
PSAiMzJkYjk1ZWRmOTk4NDUwYWNjNzg4MWM5MzJmOTRjZDliMDVjODdiNGIyNTk5ZThiYWIwNjQ3
NTNkYTRhY2ZkMSIKK1NSQ19VUklbY2MtMS4yLjI1LnNoYTI1NnN1bV0gPSAiZDBmYzg5N2RjMWU4
NjVjYzY3YzBlMDVhODM2ZDlkM2YxZGYzY2JlNDQyYWE0YTk0NzNiMThlMTI2MjRhNDk1MSIKIFNS
Q19VUklbaGVjay0wLjUuMC5zaGEyNTZzdW1dID0gIjIzMDRlMDA5ODNmODdmZmIzOGI1NWI0NDRi
NWUzYjYwYTg4NGI1ZDMwYzBmY2E3ZDgyZmUzMzQ0OWJiZTU1ZWEiCiBTUkNfVVJJW2luZG9jLTIu
MC42LnNoYTI1NnN1bV0gPSAiZjRjNzI0NWEwODUwNDk1NTYwNTY3MGRiZjE0MWZjZWFiOTc1ZjE1
Y2EyMTU3MDY5NmFlYmU5ZDJlNzE1NzZiZCIKIFNSQ19VUklbbGliYy0wLjIuMTcyLnNoYTI1NnN1
bV0gPSAiZDc1MGFmMDQyZjdlZjRmNzI0MzA2ZGUwMjlkMTg4MzZjMjZjMTc2NWE1NGE2YTNmMDk0
Y2JkMjNhNzI2N2ZmYSIKQEAgLTM4LDEyICszOCwxMiBAQCBTUkNfVVJJW21lbW9mZnNldC0wLjku
MS5zaGEyNTZzdW1dID0gIjQ4ODAxNmJmYWU0NTdiMDM2ZDk5NjA5MmY2Y2I0NDg2Nzc2MTFjZTQ0
NAogU1JDX1VSSVtvbmNlX2NlbGwtMS4yMS4zLnNoYTI1NnN1bV0gPSAiNDJmNWUxNWM5OTUzYzVl
NGNjY2VlYjJlNzM4MmE3MTY0ODJjMzQ1MTUzMTVmN2IwMzUzMmI4YjRlODM5M2QyZCIKIFNSQ19V
UklbcG9ydGFibGUtYXRvbWljLTEuMTEuMC5zaGEyNTZzdW1dID0gIjM1MGU5YjQ4Y2JjNmIwZTAy
OGIwNDczYjExNDQ1NGM2MzE2ZTU3MzM2ZWUxODRjZWFiNmU1M2Y3MmMxNzhiM2UiCiBTUkNfVVJJ
W3Byb2MtbWFjcm8yLTEuMC45NS5zaGEyNTZzdW1dID0gIjAyYjNlNWU2OGEzYTFhMDJhYWQzZWM0
OTBhOTgwMDdjYmMxM2MzN2NiZTg0YTNjZDdiOGU0MDZkNzZlN2Y3NzgiCi1TUkNfVVJJW3B5bzMt
MC4yNS4wLnNoYTI1NnN1bV0gPSAiZjIzOWQ2NTYzNjNiY2VlNzNhZmVmODUyNzdmMWIyODFlOGFj
NjIxMmExZDQyYWE5MGU1NWI5MGVkNDNjNDdhNCIKLVNSQ19VUklbcHlvMy1idWlsZC1jb25maWct
MC4yNS4wLnNoYTI1NnN1bV0gPSAiNzU1ZWE2NzFhMWMzNDA0NGZhMTY1MjQ3YWFmNmY0MTljYTM5
Y2FhNjAwM2FlZTc5MWEwZGYyNzEzZDhmMWI2ZCIKLVNSQ19VUklbcHlvMy1mZmktMC4yNS4wLnNo
YTI1NnN1bV0gPSAiZmM5NWEyZTY3MDkxZTQ0NzkxZDRlYTMwMGZmNzQ0YmU1MjkzZjM5NGYxYmFm
ZDlmNzhjMDgwODE0ZDM1OTU2ZSIKLVNSQ19VUklbcHlvMy1tYWNyb3MtMC4yNS4wLnNoYTI1NnN1
bV0gPSAiYTE3OTY0MWQxYjkzOTIwODI5YTYyZjE1ZTg3YzBlZDc5MWI2YzhkYjIyNzFiYTBmZDdj
MjY4NjA5MDUxMDIxNCIKLVNSQ19VUklbcHlvMy1tYWNyb3MtYmFja2VuZC0wLjI1LjAuc2hhMjU2
c3VtXSA9ICI5ZGZmODVlYmNhYWI4YzQ0MWIwZTNmN2FlNDBhNjk2M2VjZWE4YTlmNWU3NGY2NDdl
MzNmY2Y1ZWM5YTFlODllIgotU1JDX1VSSVtweXRob24zLWRsbC1hLTAuMi4xMy5zaGEyNTZzdW1d
ID0gIjQ5ZmU0MjI3YTI4OGNmOTQ5Mzk0MmFkMDIyMGVhM2YxODVmNGQxZjJhMTRmMTk3ZjczNDRk
NmQwMmY0ZWQ0ZWQiCitTUkNfVVJJW3B5bzMtMC4yNS4xLnNoYTI1NnN1bV0gPSAiODk3MGE3OGFm
ZTA2MjhhM2UzNDMwMzc2ZmM1ZmQ3NmI2YjQ1YzRkNDMzNjBmZmQ2Y2RkNDBiZGRlNzJiNjgyYSIK
K1NSQ19VUklbcHlvMy1idWlsZC1jb25maWctMC4yNS4xLnNoYTI1NnN1bV0gPSAiNDU4ZWIwYzU1
ZTdlY2UwMTdhZGViYTM4ZjIyNDhmZjNhYzYxNWU1MzY2MGQ3YzcxYTIzOGQ3ZDJhMDFjNzU5OCIK
K1NSQ19VUklbcHlvMy1mZmktMC4yNS4xLnNoYTI1NnN1bV0gPSAiNzExNGZlNTQ1N2M2MWIyNzZh
Yjc3YzUwNTVmMjA2Mjk1YjgxMjYwODA4MzY0NGE1YzViMjY0MGMzMTAyNTY1YyIKK1NSQ19VUklb
cHlvMy1tYWNyb3MtMC4yNS4xLnNoYTI1NnN1bV0gPSAiYTg3MjVjMGE2MjJiMzc0ZDZjYjA1MWQx
MWEwOTgzNzg2NDQ4Zjc3ODUzMzYxMzljM2M5NGY1YWE2YmVmN2U1MCIKK1NSQ19VUklbcHlvMy1t
YWNyb3MtYmFja2VuZC0wLjI1LjEuc2hhMjU2c3VtXSA9ICI0MTA5OTg0YzIyNDkxMDg1MzQzYzA1
YjBkYmM1NGRkYzQwNWMzY2Y3YjQzNzRmYzUzM2Y1YzMzMTNhNTcyY2NjIgorU1JDX1VSSVtweXRo
b24zLWRsbC1hLTAuMi4xNC5zaGEyNTZzdW1dID0gImQzODFlZjMxM2FlNzBiNGRhNWY5NWY4YTRk
ZTc3M2M2YWE1Y2QyOGY3M2FkZWM0YjRhMzFkZjcwYjY2NzgwZDgiCiBTUkNfVVJJW3F1b3RlLTEu
MC40MC5zaGEyNTZzdW1dID0gIjE4ODVjMDM5NTcwZGMwMGRjYjRmZjA4N2E4OWUxODVmZDU2YmFl
MjM0ZGRjN2YwNTZhOTQ1YmYzNjQ2NzI0OGQiCiBTUkNfVVJJW3JwZHMtMS4xLjEuc2hhMjU2c3Vt
XSA9ICJhN2Y4OWY2NTRkNTFmZmZkZDYwMjYyODlkMDdkMWZkNTIzMjQ0ZDQ2YWUwYThiYzIyY2Fh
NmRkN2Y5ZThjYjBiIgogU1JDX1VSSVtzaGxleC0xLjMuMC5zaGEyNTZzdW1dID0gIjBmZGEyZmYw
ZDA4NDAxOWJhNGQ3YzZmMzcxYzk1ZDhmZDc1Y2UzNTI0YzNjYjhmYjY1M2EzMDIzZjYzMjNlNjQi
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1w
eV8wLjI1LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1w
eV8wLjI2LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXJwZHMtcHlfMC4yNS4xLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcnBkcy1weV8wLjI2LjAuYmIKaW5kZXgg
ZWZjMWQ0YzAxYy4uM2ZkNzcwMWY4ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXJwZHMtcHlfMC4yNS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1ycGRzLXB5XzAuMjYuMC5iYgpAQCAtNCw3ICs0LDcgQEAgSE9N
RVBBR0UgPSAiaHR0cHM6Ly9weXBpLm9yZy9wcm9qZWN0L3JwZHMtcHkvIgogTElDRU5TRSA9ICJN
SVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT03NzY3ZmE1MzdjNDU5
NmM1NDE0MWYzMjg4MmM0YTk4NCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg5NjBiNmRhYzA5
YjYyZGFjMjZlNzVkN2UyYzRhMjJlZmI4MzVkODI3YTcyNzhjMzRmNzJiMmI4NGZhMTYwZTMiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMjBkYWU1OGE4NTliMDkwNmYwNjg1NjQyZTU5MTA1NmYxZTc4
N2YzYThiMzljOGU4NzQ5YTQ1ZGM3ZDI2YmRiMCIKIAogcmVxdWlyZSAke0JQTn0tY3JhdGVzLmlu
YwogCi0tIAoyLjQ3LjEKCg==

--===============1330503084260664448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-rpds-py (sysroot):
  /usr/lib/python3.13/site-packages/rpds_py-0.25.1.dist-info moved to /usr/lib/python3.13/site-packages/rpds_py-0.26.0.dist-info

--===============1330503084260664448==--

