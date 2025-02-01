Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30CFC021AC
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:00 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.42715.1738416048586333496
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KQFnPS1U;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=VpV5kWJ7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010194c1abd0f3-4bf69726-3745-43ad-9495-390982b5d6de-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416051;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SVfc933057JnzYkAVGYQ7c3Kn9lUib6ItLXUOgwiOJw=;
	b=KQFnPS1UomgEF5uCVqy1XSoTuUCGSUXciXL1fJhb82dVN12gf0StBLEyFPrbSKtd
	AFHw38d43SCEmpL+jZ1RlJbjgHb4FK3bTqrqC200UaSWv5b6mQWHZWv5ZRKIj5u2ieV
	HA8lHyiJsAnuVxIV3KciaJ3bNtIF3yQ3iv0jU9zE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416051;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SVfc933057JnzYkAVGYQ7c3Kn9lUib6ItLXUOgwiOJw=;
	b=VpV5kWJ7QshI7MnJ8BflTSUv/TEYUBjwkfOI3ACwvE6qtwQRmTjFqYH56YglGMuL
	Oqp6Fc7FqrXLLvJG4OWTn7PF4w0r3QgHgAK5uAG4yFFTQHq3yuAogoQFZZ3CDPvgN1k
	fZIS92A5kBpt845sBr9mLED7S5yxnwTSOinepWu0=
Content-Type: multipart/mixed; boundary="===============5549987559956013651=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 19.1.7 SUCCEEDED
Message-ID: <01010194c1abd0f3-4bf69726-3745-43ad-9495-390982b5d6de-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210529

--===============5549987559956013651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *llvm* to *19.1.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-llvm-upgrade-19.1.6-19.1.7.patch
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
From 46f142d85ca751900081a921a406d27776d22629 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 07:52:17 +0000
Subject: [PATCH] llvm: upgrade 19.1.6 -> 19.1.7

---
 ...tcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch | 4 ++--
 .../llvm/0007-llvm-allow-env-override-of-exe-path.patch  | 9 ++++-----
 .../llvm/{llvm_19.1.6.bb => llvm_19.1.7.bb}              | 4 +++-
 3 files changed, 9 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/llvm/{llvm_19.1.6.bb => llvm_19.1.7.bb} (98%)

diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
index a5c53b6657..f2447e07fd 100644
--- a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -1,4 +1,4 @@
-From 3b30a9bda88374e8f03bf96e972aee5bd214b98b Mon Sep 17 00:00:00 2001
+From 51d1ecbd5fc05aa801ded4ada9d9ff6426087aea Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 27 Nov 2020 10:11:08 +0000
 Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-index 73724e662f9e..1ca9c73415db 100644
+index 5035ef527..03fc84203 100644
 --- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 +++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 @@ -361,7 +361,10 @@ public:
diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
index add38b3bb4..edd8824a38 100644
--- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
+++ b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
@@ -1,4 +1,4 @@
-From 588a8694c6540e31140c7e242bfb5e279d6ca08c Mon Sep 17 00:00:00 2001
+From e10e7f1ef8816f99550cc124ea8c0c8c265cfc16 Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 19 May 2017 00:22:57 -0700
 Subject: [PATCH] llvm: allow env override of exe and libdir path
@@ -13,11 +13,11 @@ Upstream-Status: Inappropriate [OE-specific]
 Signed-off-by: Martin Kelly <mkelly@xevo.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- llvm/tools/llvm-config/llvm-config.cpp | 25 +++++++++++++++++++------
- 1 file changed, 19 insertions(+), 6 deletions(-)
+ llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++
+ 1 file changed, 7 insertions(+)
 
 diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
-index e86eb2b44b10..7b2abf318dbe 100644
+index d5b76b1bb..6c28c34bc 100644
 --- a/llvm/tools/llvm-config/llvm-config.cpp
 +++ b/llvm/tools/llvm-config/llvm-config.cpp
 @@ -246,6 +246,13 @@ Typical components:\n\
@@ -34,4 +34,3 @@ index e86eb2b44b10..7b2abf318dbe 100644
    // This just needs to be some symbol in the binary; C++ doesn't
    // allow taking the address of ::main however.
    void *P = (void *)(intptr_t)GetExecutablePath;
- 
diff --git a/meta/recipes-devtools/llvm/llvm_19.1.6.bb b/meta/recipes-devtools/llvm/llvm_19.1.7.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_19.1.6.bb
rename to meta/recipes-devtools/llvm/llvm_19.1.7.bb
index 3efd6c40c3..c834731a4c 100644
--- a/meta/recipes-devtools/llvm/llvm_19.1.6.bb
+++ b/meta/recipes-devtools/llvm/llvm_19.1.7.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "e3f79317adaa9196d2cfffe1c869d7c100b7540832bc44fe0d3f44a12861fa34"
+SRC_URI[sha256sum] = "82401fea7b79d0078043f7598b835284d6650a75b93e64b6f761ea7b63097501"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
@@ -179,3 +179,5 @@ FILES:${PN}-staticdev += "\
 INSANE_SKIP:${PN}-libllvm += "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PV = "19.1.7"
-- 
2.44.1


--===============5549987559956013651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/llvm: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm: SRC_URI changed from "https://github.com/llvm/llvm-project/releases/download/llvmorg-19.1.6/llvm-project-19.1.6.src.tar.xz file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 file://llvm-config" to "https://github.com/llvm/llvm-project/releases/download/llvmorg-19.1.7/llvm-project-19.1.7.src.tar.xz file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 file://llvm-config"
packages/core2-64-poky-linux/llvm: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-bugpointpasses: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm-bugpointpasses: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-dbg: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm-dbg: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-dbg: PKGSIZE changed from 56113416 to 56113640 (+0%)
packages/core2-64-poky-linux/llvm/llvm-dev: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm-dev: FILES: removed "/usr/lib/libLLVM-19.1.6.so", added "/usr/lib/libLLVM-19.1.7.so"
packages/core2-64-poky-linux/llvm/llvm-dev: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-dev: PKGSIZE changed from 26271224 to 26271386 (+0%)
packages/core2-64-poky-linux/llvm/llvm-doc: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm-doc: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-libllvm: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm-libllvm: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-liblto: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm-liblto: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-llvmhello: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm-llvmhello: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-locale: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm-locale: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-src: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm-src: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-staticdev: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm-staticdev: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
packages/core2-64-poky-linux/llvm/llvm-staticdev: PKGSIZE changed from 226447280 to 226448864 (+0%)
packages/core2-64-poky-linux/llvm/llvm: PV changed from "19.1.6" to "19.1.7"
packages/core2-64-poky-linux/llvm/llvm: PKGV changed from 19.1.6 [default] to 19.1.7 [default]
Changes to packages/core2-64-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config19.1.6 moved to /usr/bin/crossscripts/llvm-config19.1.7
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config19.1.6 to llvm-config19.1.7
  /usr/bin/llvm-config19.1.6 moved to /usr/bin/llvm-config19.1.7
  /usr/bin/llvm-tblgen19.1.6 moved to /usr/bin/llvm-tblgen19.1.7

--===============5549987559956013651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config19.1.6 moved to /usr/bin/crossscripts/llvm-config19.1.7
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config19.1.6 to llvm-config19.1.7
  /usr/bin/llvm-config19.1.6 moved to /usr/bin/llvm-config19.1.7
  /usr/bin/llvm-tblgen19.1.6 moved to /usr/bin/llvm-tblgen19.1.7

--===============5549987559956013651==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-llvm-upgrade-19.1.6-19.1.7.patch"

RnJvbSA0NmYxNDJkODVjYTc1MTkwMDA4MWE5MjFhNDA2ZDI3Nzc2ZDIyNjI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwNzo1MjoxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxs
dm06IHVwZ3JhZGUgMTkuMS42IC0+IDE5LjEuNwoKLS0tCiAuLi50Y2hlckVtaXR0ZXItc29ydC1D
bGFzc0luZm8tbGlzdHMtYnktbmFtZS1hcy13ZS5wYXRjaCB8IDQgKystLQogLi4uL2xsdm0vMDAw
Ny1sbHZtLWFsbG93LWVudi1vdmVycmlkZS1vZi1leGUtcGF0aC5wYXRjaCAgfCA5ICsrKystLS0t
LQogLi4uL2xsdm0ve2xsdm1fMTkuMS42LmJiID0+IGxsdm1fMTkuMS43LmJifSAgICAgICAgICAg
ICAgfCA0ICsrKy0KIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9u
cygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL3tsbHZtXzE5LjEuNi5iYiA9
PiBsbHZtXzE5LjEuNy5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbGx2bS9sbHZtLzAwMDEtQXNtTWF0Y2hlckVtaXR0ZXItc29ydC1DbGFzc0luZm8tbGlzdHMt
YnktbmFtZS1hcy13ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm0vMDAw
MS1Bc21NYXRjaGVyRW1pdHRlci1zb3J0LUNsYXNzSW5mby1saXN0cy1ieS1uYW1lLWFzLXdlLnBh
dGNoCmluZGV4IGE1YzUzYjY2NTcuLmYyNDQ3ZTA3ZmQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9sbHZtL2xsdm0vMDAwMS1Bc21NYXRjaGVyRW1pdHRlci1zb3J0LUNsYXNzSW5m
by1saXN0cy1ieS1uYW1lLWFzLXdlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9s
bHZtL2xsdm0vMDAwMS1Bc21NYXRjaGVyRW1pdHRlci1zb3J0LUNsYXNzSW5mby1saXN0cy1ieS1u
YW1lLWFzLXdlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzYjMwYTliZGE4ODM3NGU4ZjAz
YmY5NmU5NzJhZWU1YmQyMTRiOThiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1MWQx
ZWNiZDVmYzA1YWE4MDFkZWQ0YWRhOWQ5ZmY2NDI2MDg3YWVhIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBE
YXRlOiBGcmksIDI3IE5vdiAyMDIwIDEwOjExOjA4ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFz
bU1hdGNoZXJFbWl0dGVyOiBzb3J0IENsYXNzSW5mbyBsaXN0cyBieSBuYW1lIGFzIHdlbGwKQEAg
LTE0LDcgKzE0LDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2Fu
YXZpbkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbGx2bS91dGlscy9UYWJsZUdlbi9Bc21NYXRjaGVyRW1p
dHRlci5jcHAgYi9sbHZtL3V0aWxzL1RhYmxlR2VuL0FzbU1hdGNoZXJFbWl0dGVyLmNwcAotaW5k
ZXggNzM3MjRlNjYyZjllLi4xY2E5YzczNDE1ZGIgMTAwNjQ0CitpbmRleCA1MDM1ZWY1MjcuLjAz
ZmM4NDIwMyAxMDA2NDQKIC0tLSBhL2xsdm0vdXRpbHMvVGFibGVHZW4vQXNtTWF0Y2hlckVtaXR0
ZXIuY3BwCiArKysgYi9sbHZtL3V0aWxzL1RhYmxlR2VuL0FzbU1hdGNoZXJFbWl0dGVyLmNwcAog
QEAgLTM2MSw3ICszNjEsMTAgQEAgcHVibGljOgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2xsdm0vbGx2bS8wMDA3LWxsdm0tYWxsb3ctZW52LW92ZXJyaWRlLW9mLWV4ZS1wYXRo
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xsdm0vbGx2bS8wMDA3LWxsdm0tYWxsb3ct
ZW52LW92ZXJyaWRlLW9mLWV4ZS1wYXRoLnBhdGNoCmluZGV4IGFkZDM4YjNiYjQuLmVkZDg4MjRh
MzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm0vMDAwNy1sbHZt
LWFsbG93LWVudi1vdmVycmlkZS1vZi1leGUtcGF0aC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvbGx2bS9sbHZtLzAwMDctbGx2bS1hbGxvdy1lbnYtb3ZlcnJpZGUtb2YtZXhlLXBh
dGgucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDU4OGE4Njk0YzY1NDBlMzExNDBjN2UyNDJi
ZmI1ZTI3OWQ2Y2EwOGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGUxMGU3ZjFlZjg4
MTZmOTk1NTBjYzEyNGVhOGMwYzhjMjY1Y2ZjMTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBNYXJ0aW4gS2VsbHkgPG1rZWxseUB4ZXZvLmNvbT4KIERhdGU6IEZyaSwgMTkgTWF5IDIw
MTcgMDA6MjI6NTcgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gbGx2bTogYWxsb3cgZW52IG92ZXJy
aWRlIG9mIGV4ZSBhbmQgbGliZGlyIHBhdGgKQEAgLTEzLDExICsxMywxMSBAQCBVcHN0cmVhbS1T
dGF0dXM6IEluYXBwcm9wcmlhdGUgW09FLXNwZWNpZmljXQogU2lnbmVkLW9mZi1ieTogTWFydGlu
IEtlbGx5IDxta2VsbHlAeGV2by5jb20+CiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmto
ZW1AZ21haWwuY29tPgogLS0tCi0gbGx2bS90b29scy9sbHZtLWNvbmZpZy9sbHZtLWNvbmZpZy5j
cHAgfCAyNSArKysrKysrKysrKysrKysrKysrLS0tLS0tCi0gMSBmaWxlIGNoYW5nZWQsIDE5IGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCisgbGx2bS90b29scy9sbHZtLWNvbmZpZy9sbHZt
LWNvbmZpZy5jcHAgfCA3ICsrKysrKysKKyAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
CiAKIGRpZmYgLS1naXQgYS9sbHZtL3Rvb2xzL2xsdm0tY29uZmlnL2xsdm0tY29uZmlnLmNwcCBi
L2xsdm0vdG9vbHMvbGx2bS1jb25maWcvbGx2bS1jb25maWcuY3BwCi1pbmRleCBlODZlYjJiNDRi
MTAuLjdiMmFiZjMxOGRiZSAxMDA2NDQKK2luZGV4IGQ1Yjc2YjFiYi4uNmMyOGMzNGJjIDEwMDY0
NAogLS0tIGEvbGx2bS90b29scy9sbHZtLWNvbmZpZy9sbHZtLWNvbmZpZy5jcHAKICsrKyBiL2xs
dm0vdG9vbHMvbGx2bS1jb25maWcvbGx2bS1jb25maWcuY3BwCiBAQCAtMjQ2LDYgKzI0NiwxMyBA
QCBUeXBpY2FsIGNvbXBvbmVudHM6XG5cCkBAIC0zNCw0ICszNCwzIEBAIGluZGV4IGU4NmViMmI0
NGIxMC4uN2IyYWJmMzE4ZGJlIDEwMDY0NAogICAgLy8gVGhpcyBqdXN0IG5lZWRzIHRvIGJlIHNv
bWUgc3ltYm9sIGluIHRoZSBiaW5hcnk7IEMrKyBkb2Vzbid0CiAgICAvLyBhbGxvdyB0YWtpbmcg
dGhlIGFkZHJlc3Mgb2YgOjptYWluIGhvd2V2ZXIuCiAgICB2b2lkICpQID0gKHZvaWQgKikoaW50
cHRyX3QpR2V0RXhlY3V0YWJsZVBhdGg7Ci0gCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbGx2bS9sbHZtXzE5LjEuNi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xs
dm1fMTkuMS43LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9sbHZtL2xsdm1fMTkuMS42LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbGx2bS9sbHZtXzE5LjEuNy5iYgppbmRleCAzZWZkNmM0MGMzLi5jODM0NzMxYTRjIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9sbHZtXzE5LjEuNi5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9sbHZtXzE5LjEuNy5iYgpAQCAtMjcsNyArMjcs
NyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC9yZWxl
YXNlcy9kb3dubG9hZC9sbHZtb3JnLSR7UFZ9LwogICAgICAgICAgICBmaWxlOi8vMDAwMS1Bc21N
YXRjaGVyRW1pdHRlci1zb3J0LUNsYXNzSW5mby1saXN0cy1ieS1uYW1lLWFzLXdlLnBhdGNoO3N0
cmlwbGV2ZWw9MiBcCiAgICAgICAgICAgIGZpbGU6Ly9sbHZtLWNvbmZpZyBcCiAgICAgICAgICAg
ICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlM2Y3OTMxN2FkYWE5MTk2ZDJjZmZmZTFjODY5ZDdj
MTAwYjc1NDA4MzJiYzQ0ZmUwZDNmNDRhMTI4NjFmYTM0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjgyNDAxZmVhN2I3OWQwMDc4MDQzZjc1OThiODM1Mjg0ZDY2NTBhNzViOTNlNjRiNmY3NjFlYTdi
NjMwOTc1MDEiCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL2xsdm0v
bGx2bS1wcm9qZWN0IgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAibGx2bW9yZy0oP1A8cHZlcj5c
ZCsoXC5cZCspKykiCiAKQEAgLTE3OSwzICsxNzksNSBAQCBGSUxFUzoke1BOfS1zdGF0aWNkZXYg
Kz0gIlwKIElOU0FORV9TS0lQOiR7UE59LWxpYmxsdm0gKz0gImRldi1zbyIKIAogQkJDTEFTU0VY
VEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgorCitQViA9ICIxOS4xLjciCi0tIAoyLjQ0LjEKCg==

--===============5549987559956013651==--

