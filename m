Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2919CF42117
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:38 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19732.1776261871044280724
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LDqgoyhl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=0JeSVgmX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019d9175323e-7933f147-6ba4-4c39-95b5-3c41ba64190d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261870;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=u7aZLGfxfmde6PqiA62gGfbgA3HsOj/G2LJCx5Znak8=;
	b=LDqgoyhlioSxY6fbFBF85A6lMBL3wMLrZBxTlr6JDGOi0q5wgvCovbUumzBE34qW
	6iTc7qDurT4I+nZLe+IAtHFK/s4pe/JKD01hOBmxsZ8ioYZGquf2FlOOua0r3YVFpHd
	sFIS35PFrnruwSj/iLj9RYQFpg++BMCIlRZ2ltiM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261870;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=u7aZLGfxfmde6PqiA62gGfbgA3HsOj/G2LJCx5Znak8=;
	b=0JeSVgmXppZGrgg+SOFwbbMPXOZzFNgsvl9foaWWtpR6IMF73qa6BcENn8DAFSOO
	DRCVoFW+5w9KVPREnIAnDaDCDM90+nlZ7VFt7ichLQh9hgDVQvbdE7zDHDFdTJbgmC8
	RpLKxLVX1Fouyp7R5gRp16/qDxx0nRvMyOCFeVJo=
Content-Type: multipart/mixed; boundary="===============8536496198291187302=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] mesa-tools-native,mesa: upgrading to 26.0.4,26.0.4 SUCCEEDED
Message-ID: <0101019d9175323e-7933f147-6ba4-4c39-95b5-3c41ba64190d-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235208

--===============8536496198291187302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa-tools-native,mesa* to *26.0.4,26.0.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-tools-native-mesa-upgrade-26.0.3-26.0.4-26.0.3-.patch
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
From 35b9f4056b32534e5e371e46f0179834e20f60f6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 05:49:55 +0000
Subject: [PATCH] mesa-tools-native,mesa: upgrade 26.0.3 -> 26.0.4,26.0.3 ->
 26.0.4

---
 ...01-freedreno-don-t-encode-build-path-into-binaries.patch | 6 +++---
 .../0001-gallivm-Fix-armhf-build-against-LLVM-22.patch      | 5 +----
 .../0001-meson-misdetects-64bit-atomics-on-mips-clang.patch | 2 +-
 meta/recipes-graphics/mesa/mesa-tools-native.bb             | 1 +
 meta/recipes-graphics/mesa/mesa.inc                         | 4 ++--
 5 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index 4d36e68a58..b646e8885c 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From 8299fe0615638dc88694f08b95a62e9dd3943a6f Mon Sep 17 00:00:00 2001
+From ce652d647fc56103ba8fb7c19c220ac1d12a69a6 Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 10 Dec 2025 02:27:16 +0200
 Subject: [PATCH] freedreno: don't encode build path into binaries
@@ -25,7 +25,7 @@ Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
  2 files changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/src/freedreno/meson.build b/src/freedreno/meson.build
-index a4bfd337179..330b6468d01 100644
+index a4bfd33..330b646 100644
 --- a/src/freedreno/meson.build
 +++ b/src/freedreno/meson.build
 @@ -4,9 +4,10 @@
@@ -42,7 +42,7 @@ index a4bfd337179..330b6468d01 100644
  dep_libarchive = dependency('libarchive', allow_fallback: true, required: false, disabler : true)
  dep_libxml2 = dependency('libxml-2.0', allow_fallback: true, required: false)
 diff --git a/src/freedreno/registers/meson.build b/src/freedreno/registers/meson.build
-index f4be68117c3..cd0caafa431 100644
+index f4be681..cd0caaf 100644
 --- a/src/freedreno/registers/meson.build
 +++ b/src/freedreno/registers/meson.build
 @@ -43,4 +43,6 @@ if install_fd_decode_tools
diff --git a/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch b/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
index dfa2e86568..5da5636e5e 100644
--- a/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
+++ b/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
@@ -1,4 +1,4 @@
-From 973dc32026c164d0c13f7f5bef36c8d1c2375973 Mon Sep 17 00:00:00 2001
+From 16898cd6cfe9b4b4b2b8288727aa39b36ad12ab4 Mon Sep 17 00:00:00 2001
 From: Alessandro Astone <ales.astone@gmail.com>
 Date: Sun, 1 Mar 2026 18:14:09 +0100
 Subject: [PATCH] gallivm: Fix armhf build against LLVM 22
@@ -25,6 +25,3 @@ index d3ad342..c95d86e 100644
          f != features.end();
          ++f) {
        MAttrs.push_back(((*f).second ? "+" : "-") + (*f).first().str());
--- 
-2.53.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
index baa98a0d46..f06982d5e5 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From 02cc21800fe29f566add525e63f619c0536d6e7b Mon Sep 17 00:00:00 2001
+From c8aa2e6a6dd1513a78315f14780d89917c899c8e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb b/meta/recipes-graphics/mesa/mesa-tools-native.bb
index 0fff6ef1dd..20207450bf 100644
--- a/meta/recipes-graphics/mesa/mesa-tools-native.bb
+++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
@@ -17,3 +17,4 @@ EXTRA_OEMESON += " \
     -Dmesa-clc=enabled -Dinstall-mesa-clc=true -Dmesa-clc-bundle-headers=enabled \
     -Dprecomp-compiler=enabled -Dinstall-precomp-compiler=true \
 "
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b3ad9d8a54..0861440233 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,8 +20,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch \
 "
 
-SRC_URI[sha256sum] = "ddb7443d328e89aa45b4b6b80f077bf937f099daeca8ba48cabe32aab769e134"
-PV = "26.0.3"
+SRC_URI[sha256sum] = "6d91541e086f29bb003602d2c81070f2be4c0693a90b181ca91e46fa3953fe78"
+PV = "26.0.4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============8536496198291187302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.0.3.so", added "/usr/lib/libgallium-26.0.4.so"
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.0.3.so moved to /usr/lib/libgallium-26.0.4.so

--===============8536496198291187302==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-tools-native-mesa-upgrade-26.0.3-26.0.4-26.0.3-.patch"

RnJvbSAzNWI5ZjQwNTZiMzI1MzRlNWUzNzFlNDZmMDE3OTgzNGUyMGY2MGY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDU6NDk6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNhLXRvb2xzLW5hdGl2ZSxtZXNhOiB1cGdyYWRlIDI2LjAuMyAtPiAyNi4wLjQsMjYuMC4zIC0+
CiAyNi4wLjQKCi0tLQogLi4uMDEtZnJlZWRyZW5vLWRvbi10LWVuY29kZS1idWlsZC1wYXRoLWlu
dG8tYmluYXJpZXMucGF0Y2ggfCA2ICsrKy0tLQogLi4uLzAwMDEtZ2FsbGl2bS1GaXgtYXJtaGYt
YnVpbGQtYWdhaW5zdC1MTFZNLTIyLnBhdGNoICAgICAgfCA1ICstLS0tCiAuLi4vMDAwMS1tZXNv
bi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRjaCB8IDIgKy0KIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EtdG9vbHMtbmF0aXZlLmJiICAgICAgICAgICAg
IHwgMSArCiBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmluYyAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDQgKystLQogNSBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEw
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2Zp
bGVzLzAwMDEtZnJlZWRyZW5vLWRvbi10LWVuY29kZS1idWlsZC1wYXRoLWludG8tYmluYXJpZXMu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWZyZWVkcmVuby1k
b24tdC1lbmNvZGUtYnVpbGQtcGF0aC1pbnRvLWJpbmFyaWVzLnBhdGNoCmluZGV4IDRkMzZlNjhh
NTguLmI2NDZlODg4NWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2Zp
bGVzLzAwMDEtZnJlZWRyZW5vLWRvbi10LWVuY29kZS1idWlsZC1wYXRoLWludG8tYmluYXJpZXMu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1mcmVlZHJl
bm8tZG9uLXQtZW5jb2RlLWJ1aWxkLXBhdGgtaW50by1iaW5hcmllcy5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gODI5OWZlMDYxNTYzOGRjODg2OTRmMDhiOTVhNjJlOWRkMzk0M2E2ZiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gY2U2NTJkNjQ3ZmM1NjEwM2JhOGZiN2MxOWMyMjBh
YzFkMTJhNjlhNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IERtaXRyeSBCYXJ5c2hr
b3YgPGRtaXRyeS5iYXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT4KIERhdGU6IFdlZCwgMTAgRGVj
IDIwMjUgMDI6Mjc6MTYgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gZnJlZWRyZW5vOiBkb24ndCBl
bmNvZGUgYnVpbGQgcGF0aCBpbnRvIGJpbmFyaWVzCkBAIC0yNSw3ICsyNSw3IEBAIFNpZ25lZC1v
ZmYtYnk6IFF1ZW50aW4gU2NodWx6IDxxdWVudGluLnNjaHVsekBjaGVycnkuZGU+CiAgMiBmaWxl
cyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQg
YS9zcmMvZnJlZWRyZW5vL21lc29uLmJ1aWxkIGIvc3JjL2ZyZWVkcmVuby9tZXNvbi5idWlsZAot
aW5kZXggYTRiZmQzMzcxNzkuLjMzMGI2NDY4ZDAxIDEwMDY0NAoraW5kZXggYTRiZmQzMy4uMzMw
YjY0NiAxMDA2NDQKIC0tLSBhL3NyYy9mcmVlZHJlbm8vbWVzb24uYnVpbGQKICsrKyBiL3NyYy9m
cmVlZHJlbm8vbWVzb24uYnVpbGQKIEBAIC00LDkgKzQsMTAgQEAKQEAgLTQyLDcgKzQyLDcgQEAg
aW5kZXggYTRiZmQzMzcxNzkuLjMzMGI2NDY4ZDAxIDEwMDY0NAogIGRlcF9saWJhcmNoaXZlID0g
ZGVwZW5kZW5jeSgnbGliYXJjaGl2ZScsIGFsbG93X2ZhbGxiYWNrOiB0cnVlLCByZXF1aXJlZDog
ZmFsc2UsIGRpc2FibGVyIDogdHJ1ZSkKICBkZXBfbGlieG1sMiA9IGRlcGVuZGVuY3koJ2xpYnht
bC0yLjAnLCBhbGxvd19mYWxsYmFjazogdHJ1ZSwgcmVxdWlyZWQ6IGZhbHNlKQogZGlmZiAtLWdp
dCBhL3NyYy9mcmVlZHJlbm8vcmVnaXN0ZXJzL21lc29uLmJ1aWxkIGIvc3JjL2ZyZWVkcmVuby9y
ZWdpc3RlcnMvbWVzb24uYnVpbGQKLWluZGV4IGY0YmU2ODExN2MzLi5jZDBjYWFmYTQzMSAxMDA2
NDQKK2luZGV4IGY0YmU2ODEuLmNkMGNhYWYgMTAwNjQ0CiAtLS0gYS9zcmMvZnJlZWRyZW5vL3Jl
Z2lzdGVycy9tZXNvbi5idWlsZAogKysrIGIvc3JjL2ZyZWVkcmVuby9yZWdpc3RlcnMvbWVzb24u
YnVpbGQKIEBAIC00Myw0ICs0Myw2IEBAIGlmIGluc3RhbGxfZmRfZGVjb2RlX3Rvb2xzCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWdhbGxpdm0tRml4
LWFybWhmLWJ1aWxkLWFnYWluc3QtTExWTS0yMi5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9tZXNhL2ZpbGVzLzAwMDEtZ2FsbGl2bS1GaXgtYXJtaGYtYnVpbGQtYWdhaW5zdC1MTFZNLTIy
LnBhdGNoCmluZGV4IGRmYTJlODY1NjguLjVkYTU2MzZlNWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZ2FsbGl2bS1GaXgtYXJtaGYtYnVpbGQtYWdh
aW5zdC1MTFZNLTIyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVz
LzAwMDEtZ2FsbGl2bS1GaXgtYXJtaGYtYnVpbGQtYWdhaW5zdC1MTFZNLTIyLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSA5NzNkYzMyMDI2YzE2NGQwYzEzZjdmNWJlZjM2YzhkMWMyMzc1OTcz
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxNjg5OGNkNmNmZTliNGI0YjJiODI4ODcy
N2FhMzliMzZhZDEyYWI0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxlc3NhbmRy
byBBc3RvbmUgPGFsZXMuYXN0b25lQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgMSBNYXIgMjAyNiAx
ODoxNDowOSArMDEwMAogU3ViamVjdDogW1BBVENIXSBnYWxsaXZtOiBGaXggYXJtaGYgYnVpbGQg
YWdhaW5zdCBMTFZNIDIyCkBAIC0yNSw2ICsyNSwzIEBAIGluZGV4IGQzYWQzNDIuLmM5NWQ4NmUg
MTAwNjQ0CiAgICAgICAgICBmICE9IGZlYXR1cmVzLmVuZCgpOwogICAgICAgICAgKytmKSB7CiAg
ICAgICAgTUF0dHJzLnB1c2hfYmFjaygoKCpmKS5zZWNvbmQgPyAiKyIgOiAiLSIpICsgKCpmKS5m
aXJzdCgpLnN0cigpKTsKLS0tIAotMi41My4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtbWVzb24tbWlzZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9u
LW1pcHMtY2xhbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAx
LW1lc29uLW1pc2RldGVjdHMtNjRiaXQtYXRvbWljcy1vbi1taXBzLWNsYW5nLnBhdGNoCmluZGV4
IGJhYTk4YTBkNDYuLmYwNjk4MmQ1ZTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9tZXNhL2ZpbGVzLzAwMDEtbWVzb24tbWlzZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMt
Y2xhbmcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1t
ZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gMDJjYzIxODAwZmUyOWY1NjZhZGQ1MjVlNjNmNjE5YzA1MzZkNmU3YiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzhhYTJlNmE2ZGQxNTEzYTc4MzE1ZjE0Nzgw
ZDg5OTE3Yzg5OWM4ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxy
YWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDEzIEphbiAyMDIwIDE1OjIzOjQ3IC0wODAw
CiBTdWJqZWN0OiBbUEFUQ0hdIG1lc29uIG1pc2RldGVjdHMgNjRiaXQgYXRvbWljcyBvbiBtaXBz
L2NsYW5nCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLXRvb2xz
LW5hdGl2ZS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EtdG9vbHMtbmF0aXZl
LmJiCmluZGV4IDBmZmY2ZWYxZGQuLjIwMjA3NDUwYmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9tZXNhL21lc2EtdG9vbHMtbmF0aXZlLmJiCisrKyBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9tZXNhL21lc2EtdG9vbHMtbmF0aXZlLmJiCkBAIC0xNywzICsxNyw0IEBAIEVYVFJB
X09FTUVTT04gKz0gIiBcCiAgICAgLURtZXNhLWNsYz1lbmFibGVkIC1EaW5zdGFsbC1tZXNhLWNs
Yz10cnVlIC1EbWVzYS1jbGMtYnVuZGxlLWhlYWRlcnM9ZW5hYmxlZCBcCiAgICAgLURwcmVjb21w
LWNvbXBpbGVyPWVuYWJsZWQgLURpbnN0YWxsLXByZWNvbXAtY29tcGlsZXI9dHJ1ZSBcCiAiCisK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EuaW5jIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS5pbmMKaW5kZXggYjNhZDlkOGE1NC4uMDg2MTQ0MDIz
MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS5pbmMKKysrIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS5pbmMKQEAgLTIwLDggKzIwLDggQEAgU1JD
X1VSSSA9ICJodHRwczovL2FyY2hpdmUubWVzYTNkLm9yZy9tZXNhLSR7UFZ9LnRhci54eiBcCiAg
ICAgICAgICAgIGZpbGU6Ly8wMDAxLWdhbGxpdm0tRml4LWFybWhmLWJ1aWxkLWFnYWluc3QtTExW
TS0yMi5wYXRjaCBcCiAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkZGI3NDQzZDMyOGU4OWFh
NDViNGI2YjgwZjA3N2JmOTM3ZjA5OWRhZWNhOGJhNDhjYWJlMzJhYWI3NjllMTM0IgotUFYgPSAi
MjYuMC4zIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZkOTE1NDFlMDg2ZjI5YmIwMDM2MDJkMmM4
MTA3MGYyYmU0YzA2OTNhOTBiMTgxY2E5MWU0NmZhMzk1M2ZlNzgiCitQViA9ICIyNi4wLjQiCiAK
IFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIm1lc2EtKD9QPHB2ZXI+XGQrKFwuXGQrKSsp
IgogCi0tIAoyLjQ3LjEKCg==

--===============8536496198291187302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mesa: SRC_URI changed from "https://archive.mesa3d.org/mesa-26.0.3.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch" to "https://archive.mesa3d.org/mesa-26.0.4.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch"
packages/x86-64-v3-poky-linux/mesa: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgallium: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGSIZE changed from 42878688 to 42882784 (+0%)
packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.0.3.so", added "/usr/lib/libgallium-26.0.4.so"
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgbm: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/libgbm: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/libglapi: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/libteflon: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/libteflon: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 716853464 to 717104976 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: FILELIST: removed "/usr/lib/.debug/libgallium-26.0.3.so", added "/usr/lib/.debug/libgallium-26.0.4.so"
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 211422 to 211993 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-src: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGSIZE changed from 198542662 to 198542526 (-0%)
packages/x86-64-v3-poky-linux/mesa/mesa-src: FILELIST: directory renamed /usr/src/debug/mesa/26.0.3/src/gallium/drivers/r600 -> /usr/src/debug/mesa/26.0.4/src/gallium/drivers/r600, directory renamed /usr/src/debug/mesa/26.0.3/src/intel/compiler/brw -> /usr/src/debug/mesa/26.0.4/src/intel/compiler/brw, directory renamed /usr/src/debug/mesa/26.0.3/src/compiler/glsl -> /usr/src/debug/mesa/26.0.4/src/compiler/glsl, directory renamed /usr/src/debug/mesa/26.0.3/src/intel/vulkan_hasvk -> /usr/src/debug/mesa/26.0.4/src/intel/vulkan_hasvk, directory renamed /usr/src/debug/mesa/26.0.3/src/compiler -> /usr/src/debug/mesa/26.0.4/src/compiler, directory renamed /usr/src/debug/mesa/26.0.3/src/gallium/drivers/radeonsi -> /usr/src/debug/mesa/26.0.4/src/gallium/drivers/radeonsi, directory renamed /usr/src/debug/mesa/26.0.3/src/amd/compiler -> /usr/src/debug/mesa/26.0.4/src/amd/compiler, directory renamed /usr/src/debug/mesa/26.0.3/src/intel/genxml -> /usr/src/debug/mesa/26.0.4/src/intel/genxml, direc
 tory renamed /usr/src/debug/mesa/26.0.3/src/intel/compiler/elk -> /usr/src/debug/mesa/26.0.4/src/intel/compiler/elk, directory renamed /usr/src/debug/mesa/26.0.3/src/gallium/drivers/r300 -> /usr/src/debug/mesa/26.0.4/src/gallium/drivers/r300, directory renamed /usr/src/debug/mesa/26.0.3/src/intel/blorp -> /usr/src/debug/mesa/26.0.4/src/intel/blorp, directory renamed /usr/src/debug/mesa/26.0.3/src/gallium/drivers/zink -> /usr/src/debug/mesa/26.0.4/src/gallium/drivers/zink, directory renamed /usr/src/debug/mesa/26.0.3/src/vulkan/wsi -> /usr/src/debug/mesa/26.0.4/src/vulkan/wsi, directory renamed /usr/src/debug/mesa/26.0.3/src/compiler/nir -> /usr/src/debug/mesa/26.0.4/src/compiler/nir, directory renamed /usr/src/debug/mesa/26.0.3/src/compiler/glsl/glcpp -> /usr/src/debug/mesa/26.0.4/src/compiler/glsl/glcpp, directory renamed /usr/src/debug/mesa/26.0.3/src/mesa/glapi/shared-glapi -> /usr/src/debug/mesa/26.0.4/src/mesa/glapi/shared-glapi, directory renamed /usr/src/debug/mesa/26.0.3/src
 /loader -> /usr/src/debug/mesa/26.0.4/src/loader, directory renamed /usr/src/debug/mesa/26.0.3/src/gallium/frontends/lavapipe -> /usr/src/debug/mesa/26.0.4/src/gallium/frontends/lavapipe, directory renamed /usr/src/debug/mesa/26.0.3/src/intel/compiler -> /usr/src/debug/mesa/26.0.4/src/intel/compiler, directory renamed /usr/src/debug/mesa/26.0.3/src/amd/common -> /usr/src/debug/mesa/26.0.4/src/amd/common, directory renamed /usr/src/debug/mesa/26.0.3/src/amd/vulkan -> /usr/src/debug/mesa/26.0.4/src/amd/vulkan, directory renamed /usr/src/debug/mesa/26.0.3/src/amd/vulkan/layers -> /usr/src/debug/mesa/26.0.4/src/amd/vulkan/layers, directory renamed /usr/src/debug/mesa/26.0.3/src/nouveau/headers -> /usr/src/debug/mesa/26.0.4/src/nouveau/headers, directory renamed /usr/src/debug/mesa/26.0.3/src/mesa/glapi/glapi/gen -> /usr/src/debug/mesa/26.0.4/src/mesa/glapi/glapi/gen, directory renamed /usr/src/debug/mesa/26.0.3/src/compiler/spirv -> /usr/src/debug/mesa/26.0.4/src/compiler/spirv, directo
 ry renamed /usr/src/debug/mesa/26.0.3/src/intel/vulkan -> /usr/src/debug/mesa/26.0.4/src/intel/vulkan, directory renamed /usr/src/debug/mesa/26.0.3/src/gfxstream/guest/vulkan_enc -> /usr/src/debug/mesa/26.0.4/src/gfxstream/guest/vulkan_enc, directory renamed /usr/src/debug/mesa/26.0.3/src/intel/ds -> /usr/src/debug/mesa/26.0.4/src/intel/ds, directory renamed /usr/src/debug/mesa/26.0.3/src/intel/dev -> /usr/src/debug/mesa/26.0.4/src/intel/dev, directory renamed /usr/src/debug/mesa/26.0.3/src/gallium/auxiliary -> /usr/src/debug/mesa/26.0.4/src/gallium/auxiliary, directory renamed /usr/src/debug/mesa/26.0.3/src/mesa/program -> /usr/src/debug/mesa/26.0.4/src/mesa/program, directory renamed /usr/src/debug/mesa/26.0.3/src/vulkan/util -> /usr/src/debug/mesa/26.0.4/src/vulkan/util, directory renamed /usr/src/debug/mesa/26.0.3/src/util/format -> /usr/src/debug/mesa/26.0.4/src/util/format, directory renamed /usr/src/debug/mesa/26.0.3/src/mesa -> /usr/src/debug/mesa/26.0.4/src/mesa, directory 
 renamed /usr/src/debug/mesa/26.0.3/src/intel/isl -> /usr/src/debug/mesa/26.0.4/src/intel/isl, directory renamed /usr/src/debug/mesa/26.0.3/src/vulkan/runtime -> /usr/src/debug/mesa/26.0.4/src/vulkan/runtime, directory renamed /usr/src/debug/mesa/26.0.3/src/util -> /usr/src/debug/mesa/26.0.4/src/util, directory renamed /usr/src/debug/mesa/26.0.3/src/virtio/vulkan -> /usr/src/debug/mesa/26.0.4/src/virtio/vulkan, directory renamed /usr/src/debug/mesa/26.0.3/src/intel/shaders -> /usr/src/debug/mesa/26.0.4/src/intel/shaders, directory renamed /usr/src/debug/mesa/26.0.3/src/intel/perf -> /usr/src/debug/mesa/26.0.4/src/intel/perf
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGSIZE changed from 76923352 to 76943832 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa: PV changed from "26.0.3" to "26.0.4"
packages/x86-64-v3-poky-linux/mesa/mesa: PKGV changed from 26.0.3 [default] to 26.0.4 [default]
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.0.3.so moved to /usr/lib/libgallium-26.0.4.so

--===============8536496198291187302==--

