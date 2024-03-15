Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECC4C54E89
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:13 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1235.1710522010786895544
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Yj8gs2CX;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=18/5Q2/W;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018e430e8c7d-327aeabd-9c3b-4892-a9ee-88657e13999d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522010;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eclmLpK9h1BaGrbGSxDXKkmXl7yqal3SGnF3FnnkMPY=;
	b=Yj8gs2CXIxgv9/rKpxkNUrNFrOXkrmmePlb8MoK8AafeqnM1Z+d24Sh22mVA20xf
	9+w88+Q617WwBkKcl/rja9zFFrPlrmXMmGaKo38+XYUsxQSj3U++a0ayudXO3WdkX3g
	NvcwddzVmrQMkJECrDBBTjBSvLOQpJqwjONdXESk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522010;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eclmLpK9h1BaGrbGSxDXKkmXl7yqal3SGnF3FnnkMPY=;
	b=18/5Q2/WYW7+6k6hZO1nL04J2yNK1vOuGuXhUthvI0elHTeKysJxz0EksKbzP7pV
	g3Bj5yBNzUrK9eDTtOHe/JP5iz8QusHvDrKamnPlamiq5wCpZ2iRygxa5uFJo/jePo1
	c5qjQ6/Ew853/IoaBp2W/qyHTHXN+cWSYoyVBYso=
Content-Type: multipart/mixed; boundary="===============7899163945018831068=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 18.1.1 SUCCEEDED
Message-ID: <0101018e430e8c7d-327aeabd-9c3b-4892-a9ee-88657e13999d-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197156

--===============7899163945018831068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *llvm* to *18.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-llvm-upgrade-18.1.0-18.1.1.patch
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
From 69edcdd8e48c2272f7e0cd5c9d3c684914152355 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 07:35:36 +0000
Subject: [PATCH] llvm: upgrade 18.1.0 -> 18.1.1

---
 ...tcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch | 6 +++---
 .../llvm/0007-llvm-allow-env-override-of-exe-path.patch  | 9 ++++-----
 meta/recipes-devtools/llvm/llvm_git.bb                   | 4 ++--
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
index 48af6fc283..2a97f3c060 100644
--- a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -1,4 +1,4 @@
-From 86940d87026432683fb6741cd8a34d3b9b18e40d Mon Sep 17 00:00:00 2001
+From 1cf96613829740a8244523d3f44b116bfd671abd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 27 Nov 2020 10:11:08 +0000
 Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-index ccf0959389b..1f801e83b7d 100644
+index 73724e662f9e..1ca9c73415db 100644
 --- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 +++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-@@ -359,7 +359,10 @@ public:
+@@ -361,7 +361,10 @@ public:
      // name of a class shouldn't be significant. However, some of the backends
      // accidentally rely on this behaviour, so it will have to stay like this
      // until they are fixed.
diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
index add38b3bb4..f7147dbbe0 100644
--- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
+++ b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
@@ -1,4 +1,4 @@
-From 588a8694c6540e31140c7e242bfb5e279d6ca08c Mon Sep 17 00:00:00 2001
+From 3777b4fc95689de877beb58e30a27bac78e8280a Mon Sep 17 00:00:00 2001
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
+index d5b76b1bb6c1..6c28c34bc514 100644
 --- a/llvm/tools/llvm-config/llvm-config.cpp
 +++ b/llvm/tools/llvm-config/llvm-config.cpp
 @@ -246,6 +246,13 @@ Typical components:\n\
@@ -34,4 +34,3 @@ index e86eb2b44b10..7b2abf318dbe 100644
    // This just needs to be some symbol in the binary; C++ doesn't
    // allow taking the address of ::main however.
    void *P = (void *)(intptr_t)GetExecutablePath;
- 
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 111fb07fac..92080c7613 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -17,14 +17,14 @@ inherit cmake pkgconfig
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
-PV = "18.1.0${VER_SUFFIX}"
+PV = "18.1.1"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "461274b81d8641eab64d494accddc81d7db8a09e"
+SRCREV = "dba2a75e9c7ef81fe84774ba5eee5e67e01d801a"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.42.0


--===============7899163945018831068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/llvm: PKGV changed from 18.1.0 [default] to 18.1.1 [default]
packages/core2-64-poky-linux/llvm: PV changed from "18.1.0" to "18.1.1"
packages/core2-64-poky-linux/llvm/llvm-bugpointpasses: PKGV changed from 18.1.0 [default] to 18.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-bugpointpasses: PV changed from "18.1.0" to "18.1.1"
packages/core2-64-poky-linux/llvm/llvm-dbg: PKGV changed from 18.1.0 [default] to 18.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-dbg: PV changed from "18.1.0" to "18.1.1"
packages/core2-64-poky-linux/llvm/llvm-dev: FILES: removed "/usr/lib/libLLVM-18.1.0.so", added "/usr/lib/libLLVM-18.1.1.so"
packages/core2-64-poky-linux/llvm/llvm-dev: PKGV changed from 18.1.0 [default] to 18.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-dev: PV changed from "18.1.0" to "18.1.1"
packages/core2-64-poky-linux/llvm/llvm-doc: PKGV changed from 18.1.0 [default] to 18.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-doc: PV changed from "18.1.0" to "18.1.1"
packages/core2-64-poky-linux/llvm/llvm-libllvm: PKGV changed from 18.1.0 [default] to 18.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-libllvm: PV changed from "18.1.0" to "18.1.1"
packages/core2-64-poky-linux/llvm/llvm-liblto: PKGV changed from 18.1.0 [default] to 18.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-liblto: PV changed from "18.1.0" to "18.1.1"
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PKGV changed from 18.1.0 [default] to 18.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PV changed from "18.1.0" to "18.1.1"
packages/core2-64-poky-linux/llvm/llvm-llvmhello: PKGV changed from 18.1.0 [default] to 18.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-llvmhello: PV changed from "18.1.0" to "18.1.1"
packages/core2-64-poky-linux/llvm/llvm-locale: PKGV changed from 18.1.0 [default] to 18.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-locale: PV changed from "18.1.0" to "18.1.1"
packages/core2-64-poky-linux/llvm/llvm-src: PKGV changed from 18.1.0 [default] to 18.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-src: PV changed from "18.1.0" to "18.1.1"
packages/core2-64-poky-linux/llvm/llvm-staticdev: PKGV changed from 18.1.0 [default] to 18.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-staticdev: PKGSIZE changed from 3909196938 to 3909198826 (+0%)
packages/core2-64-poky-linux/llvm/llvm-staticdev: PV changed from "18.1.0" to "18.1.1"
packages/core2-64-poky-linux/llvm/llvm: PKGV changed from 18.1.0 [default] to 18.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm: PV changed from "18.1.0" to "18.1.1"
Changes to packages/core2-64-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config18.1.0 moved to /usr/bin/crossscripts/llvm-config18.1.1
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config18.1.0 to llvm-config18.1.1
  /usr/bin/llvm-config18.1.0 moved to /usr/bin/llvm-config18.1.1
  /usr/bin/llvm-tblgen18.1.0 moved to /usr/bin/llvm-tblgen18.1.1

--===============7899163945018831068==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-llvm-upgrade-18.1.0-18.1.1.patch"

RnJvbSA2OWVkY2RkOGU0OGMyMjcyZjdlMGNkNWM5ZDNjNjg0OTE0MTUyMzU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMDc6MzU6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
bHZtOiB1cGdyYWRlIDE4LjEuMCAtPiAxOC4xLjEKCi0tLQogLi4udGNoZXJFbWl0dGVyLXNvcnQt
Q2xhc3NJbmZvLWxpc3RzLWJ5LW5hbWUtYXMtd2UucGF0Y2ggfCA2ICsrKy0tLQogLi4uL2xsdm0v
MDAwNy1sbHZtLWFsbG93LWVudi1vdmVycmlkZS1vZi1leGUtcGF0aC5wYXRjaCAgfCA5ICsrKyst
LS0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xsdm0vbGx2bV9naXQuYmIgICAgICAgICAgICAg
ICAgICAgfCA0ICsrLS0KIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9sbHZtLzAw
MDEtQXNtTWF0Y2hlckVtaXR0ZXItc29ydC1DbGFzc0luZm8tbGlzdHMtYnktbmFtZS1hcy13ZS5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm0vMDAwMS1Bc21NYXRjaGVyRW1p
dHRlci1zb3J0LUNsYXNzSW5mby1saXN0cy1ieS1uYW1lLWFzLXdlLnBhdGNoCmluZGV4IDQ4YWY2
ZmMyODMuLjJhOTdmM2MwNjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZt
L2xsdm0vMDAwMS1Bc21NYXRjaGVyRW1pdHRlci1zb3J0LUNsYXNzSW5mby1saXN0cy1ieS1uYW1l
LWFzLXdlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm0vMDAwMS1B
c21NYXRjaGVyRW1pdHRlci1zb3J0LUNsYXNzSW5mby1saXN0cy1ieS1uYW1lLWFzLXdlLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4Njk0MGQ4NzAyNjQzMjY4M2ZiNjc0MWNkOGEzNGQzYjli
MThlNDBkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxY2Y5NjYxMzgyOTc0MGE4MjQ0
NTIzZDNmNDRiMTE2YmZkNjcxYWJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxl
eGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDI3IE5v
diAyMDIwIDEwOjExOjA4ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFzbU1hdGNoZXJFbWl0dGVy
OiBzb3J0IENsYXNzSW5mbyBsaXN0cyBieSBuYW1lIGFzIHdlbGwKQEAgLTE0LDEwICsxNCwxMCBA
QCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4KICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRp
ZmYgLS1naXQgYS9sbHZtL3V0aWxzL1RhYmxlR2VuL0FzbU1hdGNoZXJFbWl0dGVyLmNwcCBiL2xs
dm0vdXRpbHMvVGFibGVHZW4vQXNtTWF0Y2hlckVtaXR0ZXIuY3BwCi1pbmRleCBjY2YwOTU5Mzg5
Yi4uMWY4MDFlODNiN2QgMTAwNjQ0CitpbmRleCA3MzcyNGU2NjJmOWUuLjFjYTljNzM0MTVkYiAx
MDA2NDQKIC0tLSBhL2xsdm0vdXRpbHMvVGFibGVHZW4vQXNtTWF0Y2hlckVtaXR0ZXIuY3BwCiAr
KysgYi9sbHZtL3V0aWxzL1RhYmxlR2VuL0FzbU1hdGNoZXJFbWl0dGVyLmNwcAotQEAgLTM1OSw3
ICszNTksMTAgQEAgcHVibGljOgorQEAgLTM2MSw3ICszNjEsMTAgQEAgcHVibGljOgogICAgICAv
LyBuYW1lIG9mIGEgY2xhc3Mgc2hvdWxkbid0IGJlIHNpZ25pZmljYW50LiBIb3dldmVyLCBzb21l
IG9mIHRoZSBiYWNrZW5kcwogICAgICAvLyBhY2NpZGVudGFsbHkgcmVseSBvbiB0aGlzIGJlaGF2
aW91ciwgc28gaXQgd2lsbCBoYXZlIHRvIHN0YXkgbGlrZSB0aGlzCiAgICAgIC8vIHVudGlsIHRo
ZXkgYXJlIGZpeGVkLgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xsdm0vbGx2
bS8wMDA3LWxsdm0tYWxsb3ctZW52LW92ZXJyaWRlLW9mLWV4ZS1wYXRoLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2xsdm0vbGx2bS8wMDA3LWxsdm0tYWxsb3ctZW52LW92ZXJyaWRlLW9m
LWV4ZS1wYXRoLnBhdGNoCmluZGV4IGFkZDM4YjNiYjQuLmY3MTQ3ZGJiZTAgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm0vMDAwNy1sbHZtLWFsbG93LWVudi1vdmVy
cmlkZS1vZi1leGUtcGF0aC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9s
bHZtLzAwMDctbGx2bS1hbGxvdy1lbnYtb3ZlcnJpZGUtb2YtZXhlLXBhdGgucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDU4OGE4Njk0YzY1NDBlMzExNDBjN2UyNDJiZmI1ZTI3OWQ2Y2EwOGMg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDM3NzdiNGZjOTU2ODlkZTg3N2JlYjU4ZTMw
YTI3YmFjNzhlODI4MGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNYXJ0aW4gS2Vs
bHkgPG1rZWxseUB4ZXZvLmNvbT4KIERhdGU6IEZyaSwgMTkgTWF5IDIwMTcgMDA6MjI6NTcgLTA3
MDAKIFN1YmplY3Q6IFtQQVRDSF0gbGx2bTogYWxsb3cgZW52IG92ZXJyaWRlIG9mIGV4ZSBhbmQg
bGliZGlyIHBhdGgKQEAgLTEzLDExICsxMywxMSBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9w
cmlhdGUgW09FLXNwZWNpZmljXQogU2lnbmVkLW9mZi1ieTogTWFydGluIEtlbGx5IDxta2VsbHlA
eGV2by5jb20+CiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgog
LS0tCi0gbGx2bS90b29scy9sbHZtLWNvbmZpZy9sbHZtLWNvbmZpZy5jcHAgfCAyNSArKysrKysr
KysrKysrKysrKysrLS0tLS0tCi0gMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDYg
ZGVsZXRpb25zKC0pCisgbGx2bS90b29scy9sbHZtLWNvbmZpZy9sbHZtLWNvbmZpZy5jcHAgfCA3
ICsrKysrKysKKyAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQg
YS9sbHZtL3Rvb2xzL2xsdm0tY29uZmlnL2xsdm0tY29uZmlnLmNwcCBiL2xsdm0vdG9vbHMvbGx2
bS1jb25maWcvbGx2bS1jb25maWcuY3BwCi1pbmRleCBlODZlYjJiNDRiMTAuLjdiMmFiZjMxOGRi
ZSAxMDA2NDQKK2luZGV4IGQ1Yjc2YjFiYjZjMS4uNmMyOGMzNGJjNTE0IDEwMDY0NAogLS0tIGEv
bGx2bS90b29scy9sbHZtLWNvbmZpZy9sbHZtLWNvbmZpZy5jcHAKICsrKyBiL2xsdm0vdG9vbHMv
bGx2bS1jb25maWcvbGx2bS1jb25maWcuY3BwCiBAQCAtMjQ2LDYgKzI0NiwxMyBAQCBUeXBpY2Fs
IGNvbXBvbmVudHM6XG5cCkBAIC0zNCw0ICszNCwzIEBAIGluZGV4IGU4NmViMmI0NGIxMC4uN2Iy
YWJmMzE4ZGJlIDEwMDY0NAogICAgLy8gVGhpcyBqdXN0IG5lZWRzIHRvIGJlIHNvbWUgc3ltYm9s
IGluIHRoZSBiaW5hcnk7IEMrKyBkb2Vzbid0CiAgICAvLyBhbGxvdyB0YWtpbmcgdGhlIGFkZHJl
c3Mgb2YgOjptYWluIGhvd2V2ZXIuCiAgICB2b2lkICpQID0gKHZvaWQgKikoaW50cHRyX3QpR2V0
RXhlY3V0YWJsZVBhdGg7Ci0gCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2
bS9sbHZtX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm1fZ2l0LmJiCmlu
ZGV4IDExMWZiMDdmYWMuLjkyMDgwYzc2MTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9sbHZtL2xsdm1fZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xs
dm1fZ2l0LmJiCkBAIC0xNywxNCArMTcsMTQgQEAgaW5oZXJpdCBjbWFrZSBwa2djb25maWcKICMg
Y291bGQgYmUgJ3JjWCcgb3IgJ2dpdCcgb3IgZW1wdHkgKCBmb3IgcmVsZWFzZSApCiBWRVJfU1VG
RklYID0gIiIKIAotUFYgPSAiMTguMS4wJHtWRVJfU1VGRklYfSIKK1BWID0gIjE4LjEuMSIKIAog
TUFKT1JfVkVSU0lPTiA9ICIke0BvZS51dGlscy50cmltX3ZlcnNpb24oIiR7UFZ9IiwgMSl9Igog
CiBMTFZNX1JFTEVBU0UgPSAiJHtQVn0iCiAKIEJSQU5DSCA9ICJyZWxlYXNlLyR7TUFKT1JfVkVS
U0lPTn0ueCIKLVNSQ1JFViA9ICI0NjEyNzRiODFkODY0MWVhYjY0ZDQ5NGFjY2RkYzgxZDdkYjhh
MDllIgorU1JDUkVWID0gImRiYTJhNzVlOWM3ZWY4MWZlODQ3NzRiYTVlZWU1ZTY3ZTAxZDgwMWEi
CiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QuZ2l0O2JyYW5j
aD0ke0JSQU5DSH07cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vMDAwNy1sbHZt
LWFsbG93LWVudi1vdmVycmlkZS1vZi1leGUtcGF0aC5wYXRjaDtzdHJpcGxldmVsPTIgXAogICAg
ICAgICAgICBmaWxlOi8vMDAwMS1Bc21NYXRjaGVyRW1pdHRlci1zb3J0LUNsYXNzSW5mby1saXN0
cy1ieS1uYW1lLWFzLXdlLnBhdGNoO3N0cmlwbGV2ZWw9MiBcCi0tIAoyLjQyLjAKCg==

--===============7899163945018831068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config18.1.0 moved to /usr/bin/crossscripts/llvm-config18.1.1
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config18.1.0 to llvm-config18.1.1
  /usr/bin/llvm-config18.1.0 moved to /usr/bin/llvm-config18.1.1
  /usr/bin/llvm-tblgen18.1.0 moved to /usr/bin/llvm-tblgen18.1.1

--===============7899163945018831068==--

