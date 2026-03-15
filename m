Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD335EFCBAB
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:41:55 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28791.1773582111946183869
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=E/LeMpIF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=wbS6xeDq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019cf1bb524b-f298b87e-f0b3-4fe6-8dfb-39d090f587f3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582111;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/Bpp06t8uGejbkJlBrLD/NmsjiUf+uwZ1IdbMrFCoJg=;
	b=E/LeMpIFMVBuQXK2p7VAv2/FAqrjGDTyo2/rsACzkK3BLiu/hEa94lSNY9SGThUt
	PoT8wVY3BBWCRsDIdPylsUW9FJOe2rwNjz2dgBMYev00TdmpV9MH/8slJCRvxN++SGB
	f6rNtcEAxhm8to9XME48GrgY/W6/ziEcvvx8yZvE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582111;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/Bpp06t8uGejbkJlBrLD/NmsjiUf+uwZ1IdbMrFCoJg=;
	b=wbS6xeDqFa4rIyzoSp9TbJkP8auerps6zZoJVMQXNLMb69t+eG3o6JNOemH5epDq
	GDKA8Q0MS3LTbT0HzkvjNRahg4WrZhnGmcmUuoSgtbCweg3Z4do3KqieaOVx5wZm/ed
	kZIpOcU7+SES0GjVWRNEWeN60YgG/1lAhl6eRv2c=
Content-Type: multipart/mixed; boundary="===============7996137944473877743=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] mesa,mesa-tools-native: upgrading to 26.0.2,26.0.2 SUCCEEDED
Message-ID: <0101019cf1bb524b-f298b87e-f0b3-4fe6-8dfb-39d090f587f3-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:41:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233122

--===============7996137944473877743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa,mesa-tools-native* to *26.0.2,26.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-mesa-tools-native-upgrade-26.0.1-26.0.2-26.0.1-.patch
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
From a4f5254e401a4f5ac0d92d128a229fe2ac3059c8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 05:44:09 +0000
Subject: [PATCH] mesa,mesa-tools-native: upgrade 26.0.1 -> 26.0.2,26.0.1 ->
 26.0.2

---
 ...01-freedreno-don-t-encode-build-path-into-binaries.patch | 6 +++---
 .../0001-meson-misdetects-64bit-atomics-on-mips-clang.patch | 2 +-
 meta/recipes-graphics/mesa/mesa-tools-native.bb             | 1 +
 meta/recipes-graphics/mesa/mesa.inc                         | 4 ++--
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index 4d36e68a58..795315417e 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From 8299fe0615638dc88694f08b95a62e9dd3943a6f Mon Sep 17 00:00:00 2001
+From 81a6c333b9a3a6c36e67918e7abeb2ee56684bc0 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
index baa98a0d46..57acbcc0e6 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From 02cc21800fe29f566add525e63f619c0536d6e7b Mon Sep 17 00:00:00 2001
+From b56e06872a75d12e2a283b7db8c77e45bb01b119 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb b/meta/recipes-graphics/mesa/mesa-tools-native.bb
index 50d2f5cbb0..cc6a53f115 100644
--- a/meta/recipes-graphics/mesa/mesa-tools-native.bb
+++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
@@ -17,3 +17,4 @@ EXTRA_OEMESON += " \
     -Dmesa-clc=enabled -Dinstall-mesa-clc=true -Dmesa-clc-bundle-headers=enabled \
     -Dprecomp-compiler=enabled -Dinstall-precomp-compiler=true \
 "
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index e8dd3ee6ac..10877ff9a7 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,8 +19,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
 "
 
-SRC_URI[sha256sum] = "bb5104f9f9a46c9b5175c24e601e0ef1ab44ce2d0fdbe81548b59adc8b385dcc"
-PV = "26.0.1"
+SRC_URI[sha256sum] = "973f535221be211c6363842b4cce9ef8e9b3e1d5ea86c5450ca86060163c7346"
+PV = "26.0.2"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============7996137944473877743==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-mesa-tools-native-upgrade-26.0.1-26.0.2-26.0.1-.patch"

RnJvbSBhNGY1MjU0ZTQwMWE0ZjVhYzBkOTJkMTI4YTIyOWZlMmFjMzA1OWM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMDU6NDQ6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
ZXNhLG1lc2EtdG9vbHMtbmF0aXZlOiB1cGdyYWRlIDI2LjAuMSAtPiAyNi4wLjIsMjYuMC4xIC0+
CiAyNi4wLjIKCi0tLQogLi4uMDEtZnJlZWRyZW5vLWRvbi10LWVuY29kZS1idWlsZC1wYXRoLWlu
dG8tYmluYXJpZXMucGF0Y2ggfCA2ICsrKy0tLQogLi4uLzAwMDEtbWVzb24tbWlzZGV0ZWN0cy02
NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xhbmcucGF0Y2ggfCAyICstCiBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvbWVzYS9tZXNhLXRvb2xzLW5hdGl2ZS5iYiAgICAgICAgICAgICB8IDEgKwogbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS5pbmMgICAgICAgICAgICAgICAgICAgICAgICAgfCA0
ICsrLS0KIDQgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZnJlZWRy
ZW5vLWRvbi10LWVuY29kZS1idWlsZC1wYXRoLWludG8tYmluYXJpZXMucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWZyZWVkcmVuby1kb24tdC1lbmNvZGUtYnVp
bGQtcGF0aC1pbnRvLWJpbmFyaWVzLnBhdGNoCmluZGV4IDRkMzZlNjhhNTguLjc5NTMxNTQxN2Ug
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZnJlZWRy
ZW5vLWRvbi10LWVuY29kZS1idWlsZC1wYXRoLWludG8tYmluYXJpZXMucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1mcmVlZHJlbm8tZG9uLXQtZW5jb2Rl
LWJ1aWxkLXBhdGgtaW50by1iaW5hcmllcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gODI5
OWZlMDYxNTYzOGRjODg2OTRmMDhiOTVhNjJlOWRkMzk0M2E2ZiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gODFhNmMzMzNiOWEzYTZjMzZlNjc5MThlN2FiZWIyZWU1NjY4NGJjMCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5
c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT4KIERhdGU6IFdlZCwgMTAgRGVjIDIwMjUgMDI6Mjc6MTYg
KzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gZnJlZWRyZW5vOiBkb24ndCBlbmNvZGUgYnVpbGQgcGF0
aCBpbnRvIGJpbmFyaWVzCkBAIC0yNSw3ICsyNSw3IEBAIFNpZ25lZC1vZmYtYnk6IFF1ZW50aW4g
U2NodWx6IDxxdWVudGluLnNjaHVsekBjaGVycnkuZGU+CiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvZnJlZWRyZW5v
L21lc29uLmJ1aWxkIGIvc3JjL2ZyZWVkcmVuby9tZXNvbi5idWlsZAotaW5kZXggYTRiZmQzMzcx
NzkuLjMzMGI2NDY4ZDAxIDEwMDY0NAoraW5kZXggYTRiZmQzMy4uMzMwYjY0NiAxMDA2NDQKIC0t
LSBhL3NyYy9mcmVlZHJlbm8vbWVzb24uYnVpbGQKICsrKyBiL3NyYy9mcmVlZHJlbm8vbWVzb24u
YnVpbGQKIEBAIC00LDkgKzQsMTAgQEAKQEAgLTQyLDcgKzQyLDcgQEAgaW5kZXggYTRiZmQzMzcx
NzkuLjMzMGI2NDY4ZDAxIDEwMDY0NAogIGRlcF9saWJhcmNoaXZlID0gZGVwZW5kZW5jeSgnbGli
YXJjaGl2ZScsIGFsbG93X2ZhbGxiYWNrOiB0cnVlLCByZXF1aXJlZDogZmFsc2UsIGRpc2FibGVy
IDogdHJ1ZSkKICBkZXBfbGlieG1sMiA9IGRlcGVuZGVuY3koJ2xpYnhtbC0yLjAnLCBhbGxvd19m
YWxsYmFjazogdHJ1ZSwgcmVxdWlyZWQ6IGZhbHNlKQogZGlmZiAtLWdpdCBhL3NyYy9mcmVlZHJl
bm8vcmVnaXN0ZXJzL21lc29uLmJ1aWxkIGIvc3JjL2ZyZWVkcmVuby9yZWdpc3RlcnMvbWVzb24u
YnVpbGQKLWluZGV4IGY0YmU2ODExN2MzLi5jZDBjYWFmYTQzMSAxMDA2NDQKK2luZGV4IGY0YmU2
ODEuLmNkMGNhYWYgMTAwNjQ0CiAtLS0gYS9zcmMvZnJlZWRyZW5vL3JlZ2lzdGVycy9tZXNvbi5i
dWlsZAogKysrIGIvc3JjL2ZyZWVkcmVuby9yZWdpc3RlcnMvbWVzb24uYnVpbGQKIEBAIC00Myw0
ICs0Myw2IEBAIGlmIGluc3RhbGxfZmRfZGVjb2RlX3Rvb2xzCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLW1pc2RldGVjdHMtNjRiaXQtYXRv
bWljcy1vbi1taXBzLWNsYW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmls
ZXMvMDAwMS1tZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRj
aAppbmRleCBiYWE5OGEwZDQ2Li41N2FjYmNjMGU2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLW1pc2RldGVjdHMtNjRiaXQtYXRvbWljcy1v
bi1taXBzLWNsYW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVz
LzAwMDEtbWVzb24tbWlzZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xhbmcucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDAyY2MyMTgwMGZlMjlmNTY2YWRkNTI1ZTYzZjYxOWMwNTM2
ZDZlN2IgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGI1NmUwNjg3MmE3NWQxMmUyYTI4
M2I3ZGI4Yzc3ZTQ1YmIwMWIxMTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogTW9uLCAxMyBKYW4gMjAyMCAxNToyMzo0
NyAtMDgwMAogU3ViamVjdDogW1BBVENIXSBtZXNvbiBtaXNkZXRlY3RzIDY0Yml0IGF0b21pY3Mg
b24gbWlwcy9jbGFuZwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVz
YS10b29scy1uYXRpdmUuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLXRvb2xz
LW5hdGl2ZS5iYgppbmRleCA1MGQyZjVjYmIwLi5jYzZhNTNmMTE1IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLXRvb2xzLW5hdGl2ZS5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLXRvb2xzLW5hdGl2ZS5iYgpAQCAtMTcsMyArMTcsNCBA
QCBFWFRSQV9PRU1FU09OICs9ICIgXAogICAgIC1EbWVzYS1jbGM9ZW5hYmxlZCAtRGluc3RhbGwt
bWVzYS1jbGM9dHJ1ZSAtRG1lc2EtY2xjLWJ1bmRsZS1oZWFkZXJzPWVuYWJsZWQgXAogICAgIC1E
cHJlY29tcC1jb21waWxlcj1lbmFibGVkIC1EaW5zdGFsbC1wcmVjb21wLWNvbXBpbGVyPXRydWUg
XAogIgorCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmluYyBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EuaW5jCmluZGV4IGU4ZGQzZWU2YWMuLjEw
ODc3ZmY5YTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EuaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EuaW5jCkBAIC0xOSw4ICsxOSw4
IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9hcmNoaXZlLm1lc2EzZC5vcmcvbWVzYS0ke1BWfS50YXIu
eHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1mcmVlZHJlbm8tZG9uLXQtZW5jb2RlLWJ1aWxk
LXBhdGgtaW50by1iaW5hcmllcy5wYXRjaCBcCiAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJi
YjUxMDRmOWY5YTQ2YzliNTE3NWMyNGU2MDFlMGVmMWFiNDRjZTJkMGZkYmU4MTU0OGI1OWFkYzhi
Mzg1ZGNjIgotUFYgPSAiMjYuMC4xIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk3M2Y1MzUyMjFi
ZTIxMWM2MzYzODQyYjRjY2U5ZWY4ZTliM2UxZDVlYTg2YzU0NTBjYTg2MDYwMTYzYzczNDYiCitQ
ViA9ICIyNi4wLjIiCiAKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIm1lc2EtKD9QPHB2
ZXI+XGQrKFwuXGQrKSspIgogCi0tIAoyLjQ3LjEKCg==

--===============7996137944473877743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mesa: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa: SRC_URI changed from "https://archive.mesa3d.org/mesa-26.0.1.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch" to "https://archive.mesa3d.org/mesa-26.0.2.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch"
packages/x86-64-v3-poky-linux/mesa: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/libgallium: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGSIZE changed from 42870496 to 42874592 (+0%)
packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.0.1.so", added "/usr/lib/libgallium-26.0.2.so"
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/libgbm: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/libgbm: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/libglapi: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/libteflon: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/libteflon: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 717438328 to 717496672 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: FILELIST: removed "/usr/lib/.debug/libgallium-26.0.1.so", added "/usr/lib/.debug/libgallium-26.0.2.so"
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 211109 to 211422 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-src: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGSIZE changed from 198517169 to 198517956 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-src: FILELIST: directory renamed /usr/src/debug/mesa/26.0.1/src/amd/vulkan/layers -> /usr/src/debug/mesa/26.0.2/src/amd/vulkan/layers, directory renamed /usr/src/debug/mesa/26.0.1/src/vulkan/util -> /usr/src/debug/mesa/26.0.2/src/vulkan/util, directory renamed /usr/src/debug/mesa/26.0.1/src/intel/genxml -> /usr/src/debug/mesa/26.0.2/src/intel/genxml, directory renamed /usr/src/debug/mesa/26.0.1/src/mesa/glapi/shared-glapi -> /usr/src/debug/mesa/26.0.2/src/mesa/glapi/shared-glapi, directory renamed /usr/src/debug/mesa/26.0.1/src/intel/vulkan -> /usr/src/debug/mesa/26.0.2/src/intel/vulkan, directory renamed /usr/src/debug/mesa/26.0.1/src/mesa/program -> /usr/src/debug/mesa/26.0.2/src/mesa/program, directory renamed /usr/src/debug/mesa/26.0.1/src/amd/vulkan -> /usr/src/debug/mesa/26.0.2/src/amd/vulkan, directory renamed /usr/src/debug/mesa/26.0.1/src/intel/dev -> /usr/src/debug/mesa/26.0.2/src/intel/dev, directory renamed /usr/src/debug/mesa/26.0.
 1/src/amd/common -> /usr/src/debug/mesa/26.0.2/src/amd/common, directory renamed /usr/src/debug/mesa/26.0.1/src/gallium/drivers/r300 -> /usr/src/debug/mesa/26.0.2/src/gallium/drivers/r300, directory renamed /usr/src/debug/mesa/26.0.1/src/gallium/drivers/r600 -> /usr/src/debug/mesa/26.0.2/src/gallium/drivers/r600, directory renamed /usr/src/debug/mesa/26.0.1/src/intel/compiler/brw -> /usr/src/debug/mesa/26.0.2/src/intel/compiler/brw, directory renamed /usr/src/debug/mesa/26.0.1/src/intel/ds -> /usr/src/debug/mesa/26.0.2/src/intel/ds, directory renamed /usr/src/debug/mesa/26.0.1/src/compiler/glsl/glcpp -> /usr/src/debug/mesa/26.0.2/src/compiler/glsl/glcpp, directory renamed /usr/src/debug/mesa/26.0.1/src/gallium/frontends/lavapipe -> /usr/src/debug/mesa/26.0.2/src/gallium/frontends/lavapipe, directory renamed /usr/src/debug/mesa/26.0.1/src/compiler/glsl -> /usr/src/debug/mesa/26.0.2/src/compiler/glsl, directory renamed /usr/src/debug/mesa/26.0.1/src/intel/blorp -> /usr/src/debug/mesa/
 26.0.2/src/intel/blorp, directory renamed /usr/src/debug/mesa/26.0.1/src/intel/isl -> /usr/src/debug/mesa/26.0.2/src/intel/isl, directory renamed /usr/src/debug/mesa/26.0.1/src/intel/compiler/elk -> /usr/src/debug/mesa/26.0.2/src/intel/compiler/elk, directory renamed /usr/src/debug/mesa/26.0.1/src/intel/vulkan_hasvk -> /usr/src/debug/mesa/26.0.2/src/intel/vulkan_hasvk, directory renamed /usr/src/debug/mesa/26.0.1/src/vulkan/runtime -> /usr/src/debug/mesa/26.0.2/src/vulkan/runtime, directory renamed /usr/src/debug/mesa/26.0.1/src/intel/shaders -> /usr/src/debug/mesa/26.0.2/src/intel/shaders, directory renamed /usr/src/debug/mesa/26.0.1/src/gallium/auxiliary -> /usr/src/debug/mesa/26.0.2/src/gallium/auxiliary, directory renamed /usr/src/debug/mesa/26.0.1/src/mesa/glapi/glapi/gen -> /usr/src/debug/mesa/26.0.2/src/mesa/glapi/glapi/gen, directory renamed /usr/src/debug/mesa/26.0.1/src/intel/perf -> /usr/src/debug/mesa/26.0.2/src/intel/perf, directory renamed /usr/src/debug/mesa/26.0.1/sr
 c/mesa -> /usr/src/debug/mesa/26.0.2/src/mesa, directory renamed /usr/src/debug/mesa/26.0.1/src/loader -> /usr/src/debug/mesa/26.0.2/src/loader, directory renamed /usr/src/debug/mesa/26.0.1/src/compiler -> /usr/src/debug/mesa/26.0.2/src/compiler, directory renamed /usr/src/debug/mesa/26.0.1/src/gallium/drivers/zink -> /usr/src/debug/mesa/26.0.2/src/gallium/drivers/zink, directory renamed /usr/src/debug/mesa/26.0.1/src/gallium/drivers/radeonsi -> /usr/src/debug/mesa/26.0.2/src/gallium/drivers/radeonsi, directory renamed /usr/src/debug/mesa/26.0.1/src/virtio/vulkan -> /usr/src/debug/mesa/26.0.2/src/virtio/vulkan, directory renamed /usr/src/debug/mesa/26.0.1/src/compiler/spirv -> /usr/src/debug/mesa/26.0.2/src/compiler/spirv, directory renamed /usr/src/debug/mesa/26.0.1/src/compiler/nir -> /usr/src/debug/mesa/26.0.2/src/compiler/nir, directory renamed /usr/src/debug/mesa/26.0.1/src/intel/compiler -> /usr/src/debug/mesa/26.0.2/src/intel/compiler, directory renamed /usr/src/debug/mesa/26
 .0.1/src/util/format -> /usr/src/debug/mesa/26.0.2/src/util/format, directory renamed /usr/src/debug/mesa/26.0.1/src/vulkan/wsi -> /usr/src/debug/mesa/26.0.2/src/vulkan/wsi, directory renamed /usr/src/debug/mesa/26.0.1/src/amd/compiler -> /usr/src/debug/mesa/26.0.2/src/amd/compiler, directory renamed /usr/src/debug/mesa/26.0.1/src/util -> /usr/src/debug/mesa/26.0.2/src/util, directory renamed /usr/src/debug/mesa/26.0.1/src/gfxstream/guest/vulkan_enc -> /usr/src/debug/mesa/26.0.2/src/gfxstream/guest/vulkan_enc, directory renamed /usr/src/debug/mesa/26.0.1/src/nouveau/headers -> /usr/src/debug/mesa/26.0.2/src/nouveau/headers
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGSIZE changed from 76915160 to 76919256 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa: PV changed from "26.0.1" to "26.0.2"
packages/x86-64-v3-poky-linux/mesa/mesa: PKGV changed from 26.0.1 [default] to 26.0.2 [default]
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.0.1.so moved to /usr/lib/libgallium-26.0.2.so

--===============7996137944473877743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.0.1.so", added "/usr/lib/libgallium-26.0.2.so"
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.0.1.so moved to /usr/lib/libgallium-26.0.2.so

--===============7996137944473877743==--

