Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E46CCDB467
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 06:18:30 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37021.1781849905589954080
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 23:18:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZMLYRZFc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BKWz1gHm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019ede87d6b5-6e012f33-ad39-4c31-8602-e804a411f575-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781849905;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KOQ3R766CcCsjezsnL8Imhr1+NR+lYMabi5yihkUlBo=;
	b=ZMLYRZFcilbHTXDkLZyxLDcG/OMidxOK5/gPQr2FgFAIi7doSmoC9tYzvbYuq5iP
	ZG5lIDt2JFZBLCLB+hV64m8qINnQ8c0ncxMH4EXrRSTp8ccfTmd4t6ysHM2d/3UB0r2
	zpbLBMKePoJM4eMvNuLBqzYwOmK+Mks1xXEdQMSU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781849905;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KOQ3R766CcCsjezsnL8Imhr1+NR+lYMabi5yihkUlBo=;
	b=BKWz1gHmM9zndZkX5QvIBL8IbPjY3tanry0IAL/7mcy9d//P4hBEj62W3lSj0SCx
	0JUhvilcdglc0kcD36XDfP176vMfawWQC2bEWE2KsAkSqdLnoakEmKYZ5FOnElBxz6n
	SRJAM0pX8icVDNNBq2e5ocGJVEc/jFlOE2TM3SZs=
Content-Type: multipart/mixed; boundary="===============6651005044229893771=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] mesa-tools-native,mesa: upgrading to 26.1.3,26.1.3 SUCCEEDED
Message-ID: <0101019ede87d6b5-6e012f33-ad39-4c31-8602-e804a411f575-000000@us-west-2.amazonses.com>
Date: Fri, 19 Jun 2026 06:18:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.19-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 06:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239118

--===============6651005044229893771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa-tools-native,mesa* to *26.1.3,26.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-tools-native-mesa-upgrade-26.1.2-26.1.3-26.1.2-.patch
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
From bf3b657dbfae0b99a17c11f51723d8f951b2dc9b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 19 Jun 2026 05:21:23 +0000
Subject: [PATCH] mesa-tools-native,mesa: upgrade 26.1.2 -> 26.1.3,26.1.2 ->
 26.1.3

---
 ...001-freedreno-don-t-encode-build-path-into-binaries.patch | 4 ++--
 .../files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch | 4 ++--
 .../0001-meson-misdetects-64bit-atomics-on-mips-clang.patch  | 2 +-
 ...rc-intel-compiler-jay-fix-GCC-10-case-label-declara.patch | 5 +----
 ...rc-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch | 5 +----
 meta/recipes-graphics/mesa/mesa.inc                          | 4 ++--
 6 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index e976b3399f..53afdc3fb4 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From 4ef7487109f9acfa2baf1a2224da31a0ae0c74c6 Mon Sep 17 00:00:00 2001
+From 1c75f7037c00fdb02ab416f146e025c6edaa5b40 Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 10 Dec 2025 02:27:16 +0200
 Subject: [PATCH] freedreno: don't encode build path into binaries
@@ -25,7 +25,7 @@ Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
  2 files changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/src/freedreno/meson.build b/src/freedreno/meson.build
-index a4bfd33..330b646 100644
+index e8f01b8..8144a75 100644
 --- a/src/freedreno/meson.build
 +++ b/src/freedreno/meson.build
 @@ -4,9 +4,10 @@
diff --git a/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch b/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
index 065dd373a7..df2158d539 100644
--- a/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
+++ b/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
@@ -1,4 +1,4 @@
-From 2a40c481affef4df729d794daf378ed2e0184895 Mon Sep 17 00:00:00 2001
+From 44fbd37cea24dc9449ee23b7583d753867f6deb4 Mon Sep 17 00:00:00 2001
 From: Alessandro Astone <ales.astone@gmail.com>
 Date: Sun, 1 Mar 2026 18:14:09 +0100
 Subject: [PATCH] gallivm: Fix armhf build against LLVM 22
@@ -13,7 +13,7 @@ Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-index d3ad342..c95d86e 100644
+index ce8ca02..86779f0 100644
 --- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
 +++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
 @@ -331,7 +331,7 @@ lp_build_fill_mattrs(std::vector<std::string> &MAttrs)
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
index b039ac213e..1e697b3b29 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From 8943b38a0c14b220e3e173c038c87ce9a697c173 Mon Sep 17 00:00:00 2001
+From 3936d5862b6d5000a800a2608b16523ca8eccbd4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch
index b8b8718979..1b38d45d5e 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch
@@ -1,4 +1,4 @@
-From 0b4b577b7fc926d374234c80267a4bf9dcccb7ef Mon Sep 17 00:00:00 2001
+From 519d3334842d2b710971d1b1f65f59deba26693e Mon Sep 17 00:00:00 2001
 From: Wang Mingyu <wangmy@fujitsu.com>
 Date: Tue, 16 Jun 2026 09:12:34 +0000
 Subject: [PATCH] src/intel/compiler/jay: fix GCC 10 case label declaration
@@ -37,6 +37,3 @@ index 62b9576..a0a9498 100644
  
     case JAY_OPCODE_DESWIZZLE_EVEN:
        brw_set_default_exec_size(p, BRW_EXECUTE_16);
--- 
-2.43.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
index 904b20d440..4ecbab019f 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
@@ -1,4 +1,4 @@
-From 3adae0d97f655c2991d5b428a3bc95a972e6228b Mon Sep 17 00:00:00 2001
+From 03b25279832661bca5d3f273cee480eba084e8f0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 14 Jun 2026 17:42:19 +0200
 Subject: [PATCH] src/intel/compiler/jay/jay_ir.h: do not used typed enum
@@ -34,6 +34,3 @@ index 8307044..abf175a 100644
     enum jay_conditional_mod conditional_mod;
  
     jay_def cond_flag; /**< conditional flag */
--- 
-2.47.3
-
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 67b740f9e9..826c9dc931 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,8 +22,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch \
 "
 
-SRC_URI[sha256sum] = "bac2bca9121897a2b8162e79636b50ac998fca799c8e6cf914edd85962babdf0"
-PV = "26.1.2"
+SRC_URI[sha256sum] = "7725004e724b34c6d4fbaf5c48fc6c6223aa9f2741d6d7782c699b049356fc45"
+PV = "26.1.3"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============6651005044229893771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.1.2.so", added "/usr/lib/libgallium-26.1.3.so"
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.1.2.so moved to /usr/lib/libgallium-26.1.3.so

--===============6651005044229893771==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-tools-native-mesa-upgrade-26.1.2-26.1.3-26.1.2-.patch"

RnJvbSBiZjNiNjU3ZGJmYWUwYjk5YTE3YzExZjUxNzIzZDhmOTUxYjJkYzliIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTkgSnVuIDIwMjYgMDU6MjE6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNhLXRvb2xzLW5hdGl2ZSxtZXNhOiB1cGdyYWRlIDI2LjEuMiAtPiAyNi4xLjMsMjYuMS4yIC0+
CiAyNi4xLjMKCi0tLQogLi4uMDAxLWZyZWVkcmVuby1kb24tdC1lbmNvZGUtYnVpbGQtcGF0aC1p
bnRvLWJpbmFyaWVzLnBhdGNoIHwgNCArKy0tCiAuLi4vZmlsZXMvMDAwMS1nYWxsaXZtLUZpeC1h
cm1oZi1idWlsZC1hZ2FpbnN0LUxMVk0tMjIucGF0Y2ggfCA0ICsrLS0KIC4uLi8wMDAxLW1lc29u
LW1pc2RldGVjdHMtNjRiaXQtYXRvbWljcy1vbi1taXBzLWNsYW5nLnBhdGNoICB8IDIgKy0KIC4u
LnJjLWludGVsLWNvbXBpbGVyLWpheS1maXgtR0NDLTEwLWNhc2UtbGFiZWwtZGVjbGFyYS5wYXRj
aCB8IDUgKy0tLS0KIC4uLnJjLWludGVsLWNvbXBpbGVyLWpheS1qYXlfaXIuaC1kby1ub3QtdXNl
ZC10eXBlZC1lbi5wYXRjaCB8IDUgKy0tLS0KIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21l
c2EuaW5jICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKystLQogNiBmaWxlcyBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZnJlZWRyZW5vLWRvbi10LWVuY29kZS1idWls
ZC1wYXRoLWludG8tYmluYXJpZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9m
aWxlcy8wMDAxLWZyZWVkcmVuby1kb24tdC1lbmNvZGUtYnVpbGQtcGF0aC1pbnRvLWJpbmFyaWVz
LnBhdGNoCmluZGV4IGU5NzZiMzM5OWYuLjUzYWZkYzNmYjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZnJlZWRyZW5vLWRvbi10LWVuY29kZS1idWls
ZC1wYXRoLWludG8tYmluYXJpZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21l
c2EvZmlsZXMvMDAwMS1mcmVlZHJlbm8tZG9uLXQtZW5jb2RlLWJ1aWxkLXBhdGgtaW50by1iaW5h
cmllcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNGVmNzQ4NzEwOWY5YWNmYTJiYWYxYTIy
MjRkYTMxYTBhZTBjNzRjNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWM3NWY3MDM3
YzAwZmRiMDJhYjQxNmYxNDZlMDI1YzZlZGFhNWI0MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNv
bT4KIERhdGU6IFdlZCwgMTAgRGVjIDIwMjUgMDI6Mjc6MTYgKzAyMDAKIFN1YmplY3Q6IFtQQVRD
SF0gZnJlZWRyZW5vOiBkb24ndCBlbmNvZGUgYnVpbGQgcGF0aCBpbnRvIGJpbmFyaWVzCkBAIC0y
NSw3ICsyNSw3IEBAIFNpZ25lZC1vZmYtYnk6IFF1ZW50aW4gU2NodWx6IDxxdWVudGluLnNjaHVs
ekBjaGVycnkuZGU+CiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvZnJlZWRyZW5vL21lc29uLmJ1aWxkIGIvc3JjL2Zy
ZWVkcmVuby9tZXNvbi5idWlsZAotaW5kZXggYTRiZmQzMy4uMzMwYjY0NiAxMDA2NDQKK2luZGV4
IGU4ZjAxYjguLjgxNDRhNzUgMTAwNjQ0CiAtLS0gYS9zcmMvZnJlZWRyZW5vL21lc29uLmJ1aWxk
CiArKysgYi9zcmMvZnJlZWRyZW5vL21lc29uLmJ1aWxkCiBAQCAtNCw5ICs0LDEwIEBACmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWdhbGxpdm0tRml4
LWFybWhmLWJ1aWxkLWFnYWluc3QtTExWTS0yMi5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9tZXNhL2ZpbGVzLzAwMDEtZ2FsbGl2bS1GaXgtYXJtaGYtYnVpbGQtYWdhaW5zdC1MTFZNLTIy
LnBhdGNoCmluZGV4IDA2NWRkMzczYTcuLmRmMjE1OGQ1MzkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZ2FsbGl2bS1GaXgtYXJtaGYtYnVpbGQtYWdh
aW5zdC1MTFZNLTIyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVz
LzAwMDEtZ2FsbGl2bS1GaXgtYXJtaGYtYnVpbGQtYWdhaW5zdC1MTFZNLTIyLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSAyYTQwYzQ4MWFmZmVmNGRmNzI5ZDc5NGRhZjM3OGVkMmUwMTg0ODk1
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0NGZiZDM3Y2VhMjRkYzk0NDllZTIzYjc1
ODNkNzUzODY3ZjZkZWI0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxlc3NhbmRy
byBBc3RvbmUgPGFsZXMuYXN0b25lQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgMSBNYXIgMjAyNiAx
ODoxNDowOSArMDEwMAogU3ViamVjdDogW1BBVENIXSBnYWxsaXZtOiBGaXggYXJtaGYgYnVpbGQg
YWdhaW5zdCBMTFZNIDIyCkBAIC0xMyw3ICsxMyw3IEBAIFNpZ25lZC1vZmYtYnk6IEpvc2UgUXVh
cmVzbWEgPGpvc2UucXVhcmVzbWFAb3NzLnF1YWxjb21tLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9nYWxsaXVt
L2F1eGlsaWFyeS9nYWxsaXZtL2xwX2JsZF9taXNjLmNwcCBiL3NyYy9nYWxsaXVtL2F1eGlsaWFy
eS9nYWxsaXZtL2xwX2JsZF9taXNjLmNwcAotaW5kZXggZDNhZDM0Mi4uYzk1ZDg2ZSAxMDA2NDQK
K2luZGV4IGNlOGNhMDIuLjg2Nzc5ZjAgMTAwNjQ0CiAtLS0gYS9zcmMvZ2FsbGl1bS9hdXhpbGlh
cnkvZ2FsbGl2bS9scF9ibGRfbWlzYy5jcHAKICsrKyBiL3NyYy9nYWxsaXVtL2F1eGlsaWFyeS9n
YWxsaXZtL2xwX2JsZF9taXNjLmNwcAogQEAgLTMzMSw3ICszMzEsNyBAQCBscF9idWlsZF9maWxs
X21hdHRycyhzdGQ6OnZlY3RvcjxzdGQ6OnN0cmluZz4gJk1BdHRycykKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtbWVzb24tbWlzZGV0ZWN0cy02NGJp
dC1hdG9taWNzLW9uLW1pcHMtY2xhbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVz
YS9maWxlcy8wMDAxLW1lc29uLW1pc2RldGVjdHMtNjRiaXQtYXRvbWljcy1vbi1taXBzLWNsYW5n
LnBhdGNoCmluZGV4IGIwMzlhYzIxM2UuLjFlNjk3YjNiMjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtbWVzb24tbWlzZGV0ZWN0cy02NGJpdC1hdG9t
aWNzLW9uLW1pcHMtY2xhbmcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2Ev
ZmlsZXMvMDAwMS1tZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gODk0M2IzOGEwYzE0YjIyMGUzZTE3M2MwMzhjODdj
ZTlhNjk3YzE3MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzkzNmQ1ODYyYjZkNTAw
MGE4MDBhMjYwOGIxNjUyM2NhOGVjY2JkNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDEzIEphbiAyMDIwIDE1
OjIzOjQ3IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIG1lc29uIG1pc2RldGVjdHMgNjRiaXQgYXRv
bWljcyBvbiBtaXBzL2NsYW5nCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVz
YS9maWxlcy8wMDAxLXNyYy1pbnRlbC1jb21waWxlci1qYXktZml4LUdDQy0xMC1jYXNlLWxhYmVs
LWRlY2xhcmEucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLXNy
Yy1pbnRlbC1jb21waWxlci1qYXktZml4LUdDQy0xMC1jYXNlLWxhYmVsLWRlY2xhcmEucGF0Y2gK
aW5kZXggYjhiODcxODk3OS4uMWIzOGQ0NWQ1ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL21lc2EvZmlsZXMvMDAwMS1zcmMtaW50ZWwtY29tcGlsZXItamF5LWZpeC1HQ0MtMTAt
Y2FzZS1sYWJlbC1kZWNsYXJhLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNh
L2ZpbGVzLzAwMDEtc3JjLWludGVsLWNvbXBpbGVyLWpheS1maXgtR0NDLTEwLWNhc2UtbGFiZWwt
ZGVjbGFyYS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMGI0YjU3N2I3ZmM5MjZkMzc0MjM0
YzgwMjY3YTRiZjlkY2NjYjdlZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTE5ZDMz
MzQ4NDJkMmI3MTA5NzFkMWIxZjY1ZjU5ZGViYTI2NjkzZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+CiBEYXRlOiBUdWUsIDE2
IEp1biAyMDI2IDA5OjEyOjM0ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNyYy9pbnRlbC9jb21w
aWxlci9qYXk6IGZpeCBHQ0MgMTAgY2FzZSBsYWJlbCBkZWNsYXJhdGlvbgpAQCAtMzcsNiArMzcs
MyBAQCBpbmRleCA2MmI5NTc2Li5hMGE5NDk4IDEwMDY0NAogIAogICAgIGNhc2UgSkFZX09QQ09E
RV9ERVNXSVpaTEVfRVZFTjoKICAgICAgICBicndfc2V0X2RlZmF1bHRfZXhlY19zaXplKHAsIEJS
V19FWEVDVVRFXzE2KTsKLS0tIAotMi40My4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtc3JjLWludGVsLWNvbXBpbGVyLWpheS1qYXlfaXIuaC1k
by1ub3QtdXNlZC10eXBlZC1lbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2Zp
bGVzLzAwMDEtc3JjLWludGVsLWNvbXBpbGVyLWpheS1qYXlfaXIuaC1kby1ub3QtdXNlZC10eXBl
ZC1lbi5wYXRjaAppbmRleCA5MDRiMjBkNDQwLi40ZWNiYWIwMTlmIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLXNyYy1pbnRlbC1jb21waWxlci1qYXkt
amF5X2lyLmgtZG8tbm90LXVzZWQtdHlwZWQtZW4ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL21lc2EvZmlsZXMvMDAwMS1zcmMtaW50ZWwtY29tcGlsZXItamF5LWpheV9pci5oLWRv
LW5vdC11c2VkLXR5cGVkLWVuLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzYWRhZTBkOTdm
NjU1YzI5OTFkNWI0MjhhM2JjOTVhOTcyZTYyMjhiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSAwM2IyNTI3OTgzMjY2MWJjYTVkM2YyNzNjZWU0ODBlYmEwODRlOGYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5k
ZT4KIERhdGU6IFN1biwgMTQgSnVuIDIwMjYgMTc6NDI6MTkgKzAyMDAKIFN1YmplY3Q6IFtQQVRD
SF0gc3JjL2ludGVsL2NvbXBpbGVyL2pheS9qYXlfaXIuaDogZG8gbm90IHVzZWQgdHlwZWQgZW51
bQpAQCAtMzQsNiArMzQsMyBAQCBpbmRleCA4MzA3MDQ0Li5hYmYxNzVhIDEwMDY0NAogICAgIGVu
dW0gamF5X2NvbmRpdGlvbmFsX21vZCBjb25kaXRpb25hbF9tb2Q7CiAgCiAgICAgamF5X2RlZiBj
b25kX2ZsYWc7IC8qKjwgY29uZGl0aW9uYWwgZmxhZyAqLwotLS0gCi0yLjQ3LjMKLQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS5pbmMgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvbWVzYS9tZXNhLmluYwppbmRleCA2N2I3NDBmOWU5Li44MjZjOWRjOTMxIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmluYworKysgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmluYwpAQCAtMjIsOCArMjIsOCBAQCBTUkNfVVJJID0g
Imh0dHBzOi8vYXJjaGl2ZS5tZXNhM2Qub3JnL21lc2EtJHtQVn0udGFyLnh6IFwKICAgICAgICAg
ICAgZmlsZTovLzAwMDEtc3JjLWludGVsLWNvbXBpbGVyLWpheS1maXgtR0NDLTEwLWNhc2UtbGFi
ZWwtZGVjbGFyYS5wYXRjaCBcCiAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiYWMyYmNhOTEy
MTg5N2EyYjgxNjJlNzk2MzZiNTBhYzk5OGZjYTc5OWM4ZTZjZjkxNGVkZDg1OTYyYmFiZGYwIgot
UFYgPSAiMjYuMS4yIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc3MjUwMDRlNzI0YjM0YzZkNGZi
YWY1YzQ4ZmM2YzYyMjNhYTlmMjc0MWQ2ZDc3ODJjNjk5YjA0OTM1NmZjNDUiCitQViA9ICIyNi4x
LjMiCiAKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIm1lc2EtKD9QPHB2ZXI+XGQrKFwu
XGQrKSspIgogCi0tIAoyLjQ3LjEKCg==

--===============6651005044229893771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mesa: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa: SRC_URI changed from "https://archive.mesa3d.org/mesa-26.1.2.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch file://0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch file://0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch" to "https://archive.mesa3d.org/mesa-26.1.3.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch file://0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch file://0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.1.2.so", added "/usr/lib/libgallium-26.1.3.so"
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGSIZE changed from 44609248 to 44629728 (+0%)
packages/x86-64-v3-poky-linux/mesa/libgallium: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgbm: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/libgbm: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/libglapi: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/libteflon: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/libteflon: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: FILELIST: removed "/usr/lib/.debug/libgallium-26.1.2.so", added "/usr/lib/.debug/libgallium-26.1.3.so"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 750900328 to 751023448 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-src: FILELIST: directory renamed /usr/src/debug/mesa/26.1.2/src/gallium/drivers/zink -> /usr/src/debug/mesa/26.1.3/src/gallium/drivers/zink, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/compiler -> /usr/src/debug/mesa/26.1.3/src/intel/compiler, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/perf -> /usr/src/debug/mesa/26.1.3/src/intel/perf, directory renamed /usr/src/debug/mesa/26.1.2/src/gallium/frontends/lavapipe -> /usr/src/debug/mesa/26.1.3/src/gallium/frontends/lavapipe, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/ds -> /usr/src/debug/mesa/26.1.3/src/intel/ds, directory renamed /usr/src/debug/mesa/26.1.2/src/mesa/glapi/glapi/gen -> /usr/src/debug/mesa/26.1.3/src/mesa/glapi/glapi/gen, directory renamed /usr/src/debug/mesa/26.1.2/src/vulkan/wsi -> /usr/src/debug/mesa/26.1.3/src/vulkan/wsi, directory renamed /usr/src/debug/mesa/26.1.2/src/compiler/nir -> /usr/src/debug/mesa/26.1.3/src/compiler/nir, directory renam
 ed /usr/src/debug/mesa/26.1.2/src/compiler/glsl -> /usr/src/debug/mesa/26.1.3/src/compiler/glsl, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/vulkan_hasvk -> /usr/src/debug/mesa/26.1.3/src/intel/vulkan_hasvk, directory renamed /usr/src/debug/mesa/26.1.2/src/gallium/drivers/radeonsi -> /usr/src/debug/mesa/26.1.3/src/gallium/drivers/radeonsi, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/vulkan -> /usr/src/debug/mesa/26.1.3/src/intel/vulkan, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/dev -> /usr/src/debug/mesa/26.1.3/src/intel/dev, directory renamed /usr/src/debug/mesa/26.1.2/src/gfxstream/guest/vulkan_enc -> /usr/src/debug/mesa/26.1.3/src/gfxstream/guest/vulkan_enc, directory renamed /usr/src/debug/mesa/26.1.2/src/mesa -> /usr/src/debug/mesa/26.1.3/src/mesa, directory renamed /usr/src/debug/mesa/26.1.2/src/compiler -> /usr/src/debug/mesa/26.1.3/src/compiler, directory renamed /usr/src/debug/mesa/26.1.2/src/util -> /usr/src/debug/mesa/26.1.3/src/util, di
 rectory renamed /usr/src/debug/mesa/26.1.2/src/amd/compiler -> /usr/src/debug/mesa/26.1.3/src/amd/compiler, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/blorp -> /usr/src/debug/mesa/26.1.3/src/intel/blorp, directory renamed /usr/src/debug/mesa/26.1.2/src/amd/vulkan -> /usr/src/debug/mesa/26.1.3/src/amd/vulkan, directory renamed /usr/src/debug/mesa/26.1.2/src/amd/common -> /usr/src/debug/mesa/26.1.3/src/amd/common, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/genxml -> /usr/src/debug/mesa/26.1.3/src/intel/genxml, directory renamed /usr/src/debug/mesa/26.1.2/src/mesa/program -> /usr/src/debug/mesa/26.1.3/src/mesa/program, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/compiler/elk -> /usr/src/debug/mesa/26.1.3/src/intel/compiler/elk, directory renamed /usr/src/debug/mesa/26.1.2/src/compiler/glsl/glcpp -> /usr/src/debug/mesa/26.1.3/src/compiler/glsl/glcpp, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/compiler/brw -> /usr/src/debug/mesa/26.1.3/src/i
 ntel/compiler/brw, directory renamed /usr/src/debug/mesa/26.1.2/src/gallium/drivers/r600 -> /usr/src/debug/mesa/26.1.3/src/gallium/drivers/r600, directory renamed /usr/src/debug/mesa/26.1.2/src/util/format -> /usr/src/debug/mesa/26.1.3/src/util/format, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/compiler/jay -> /usr/src/debug/mesa/26.1.3/src/intel/compiler/jay, directory renamed /usr/src/debug/mesa/26.1.2/src/intel/shaders -> /usr/src/debug/mesa/26.1.3/src/intel/shaders, directory renamed /usr/src/debug/mesa/26.1.2/src/compiler/spirv -> /usr/src/debug/mesa/26.1.3/src/compiler/spirv, directory renamed /usr/src/debug/mesa/26.1.2/src/virtio/vulkan -> /usr/src/debug/mesa/26.1.3/src/virtio/vulkan, directory renamed /usr/src/debug/mesa/26.1.2/src/gallium/drivers/r300 -> /usr/src/debug/mesa/26.1.3/src/gallium/drivers/r300, directory renamed /usr/src/debug/mesa/26.1.2/src/vulkan/util -> /usr/src/debug/mesa/26.1.3/src/vulkan/util, directory renamed /usr/src/debug/mesa/26.1.2/src/i
 ntel/isl -> /usr/src/debug/mesa/26.1.3/src/intel/isl, directory renamed /usr/src/debug/mesa/26.1.2/src/amd/vulkan/layers -> /usr/src/debug/mesa/26.1.3/src/amd/vulkan/layers, directory renamed /usr/src/debug/mesa/26.1.2/src/nouveau/headers -> /usr/src/debug/mesa/26.1.3/src/nouveau/headers, directory renamed /usr/src/debug/mesa/26.1.2/src/loader -> /usr/src/debug/mesa/26.1.3/src/loader, directory renamed /usr/src/debug/mesa/26.1.2/src/vulkan/runtime -> /usr/src/debug/mesa/26.1.3/src/vulkan/runtime, directory renamed /usr/src/debug/mesa/26.1.2/src/mesa/glapi/shared-glapi -> /usr/src/debug/mesa/26.1.3/src/mesa/glapi/shared-glapi, removed "/usr/src/debug/mesa/26.1.2/src/gallium/auxiliary/u_tracepoints.h /usr/src/debug/mesa/26.1.2/src/gallium/auxiliary/tr_util.h /usr/src/debug/mesa/26.1.2/src/gallium/auxiliary/tr_util.c /usr/src/debug/mesa/26.1.2/src/gallium/auxiliary/u_unfilled_gen.c /usr/src/debug/mesa/26.1.2/src/gallium/auxiliary/u_tracepoints.c /usr/src/debug/mesa/26.1.2/src/gallium/a
 uxiliary/u_indices_gen.c", added "/usr/src/debug/mesa/26.1.3/src/gallium/auxiliary/draw_nir_lower_opcodes.c /usr/src/debug/mesa/26.1.3/src/gallium/auxiliary/u_tracepoints.h /usr/src/debug/mesa/26.1.3/src/gallium/auxiliary/tr_util.h /usr/src/debug/mesa/26.1.3/src/gallium/auxiliary/tr_util.c /usr/src/debug/mesa/26.1.3/src/gallium/auxiliary/u_unfilled_gen.c /usr/src/debug/mesa/26.1.3/src/gallium/auxiliary/u_tracepoints.c /usr/src/debug/mesa/26.1.3/src/gallium/auxiliary/u_indices_gen.c"
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGSIZE changed from 201061109 to 201084582 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-src: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGSIZE changed from 81458296 to 81478776 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
packages/x86-64-v3-poky-linux/mesa/mesa: PV changed from "26.1.2" to "26.1.3"
packages/x86-64-v3-poky-linux/mesa/mesa: PKGV changed from 26.1.2 [default] to 26.1.3 [default]
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.1.2.so moved to /usr/lib/libgallium-26.1.3.so

--===============6651005044229893771==--

