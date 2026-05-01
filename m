Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D67CD3441
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:40 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15708.1777645532001932005
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NsForNrs;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=a1RwGtgf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019de3ee3057-fcfd2f9d-d0af-4eed-8709-0589e378f8da-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645531;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=R1TrJ9tRnA7qBxtul2ruuo9OO4RvayIeHta/12od4mc=;
	b=NsForNrsiP4VDaAXuQHoWmtsuYPnQG9bWYyFII4NrvNCh+C1hNoyH87LIEk76LOz
	LSqoFIkbtXg8FpkrWI6Xt9wWq7fHmj2Dnvg339cVGuDFb4qXuHNVnFWEYsMfhBK8lCq
	cHGDqP3vovpMhhR3ypmYiLDneUWWWDHYjYMaDeuU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645531;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=R1TrJ9tRnA7qBxtul2ruuo9OO4RvayIeHta/12od4mc=;
	b=a1RwGtgfC8WrtytGD+odlMEsqRMeILVhqkIC7R2qOcQ2pujDs0WCNI4YW4D7VGY9
	TEobywMEHuMlpw1xGrgCJpSQJTRoOjxoKaOKnFTw5U8IwvXmFYzZ2fVo+bFDoWvWeHI
	ykqJJ5+o3X7lFepm1H7hyZ5XTiSxNxLUodajlLkc=
Content-Type: multipart/mixed; boundary="===============7840905709632564715=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] mesa-tools-native,mesa: upgrading to 26.0.6,26.0.6 SUCCEEDED
Message-ID: <0101019de3ee3057-fcfd2f9d-d0af-4eed-8709-0589e378f8da-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236203

--===============7840905709632564715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa-tools-native,mesa* to *26.0.6,26.0.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-tools-native-mesa-upgrade-26.0.5-26.0.6-26.0.5-.patch
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
From 774c43560e4e85b70edffe3b5de58d013816f08b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 06:10:36 +0000
Subject: [PATCH] mesa-tools-native,mesa: upgrade 26.0.5 -> 26.0.6,26.0.5 ->
 26.0.6

---
 ...01-freedreno-don-t-encode-build-path-into-binaries.patch | 6 +++---
 .../0001-gallivm-Fix-armhf-build-against-LLVM-22.patch      | 5 +----
 .../0001-meson-misdetects-64bit-atomics-on-mips-clang.patch | 2 +-
 meta/recipes-graphics/mesa/mesa-tools-native.bb             | 1 +
 meta/recipes-graphics/mesa/mesa.inc                         | 4 ++--
 5 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index 4d36e68a58..e976b3399f 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From 8299fe0615638dc88694f08b95a62e9dd3943a6f Mon Sep 17 00:00:00 2001
+From 4ef7487109f9acfa2baf1a2224da31a0ae0c74c6 Mon Sep 17 00:00:00 2001
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
index dfa2e86568..065dd373a7 100644
--- a/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
+++ b/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
@@ -1,4 +1,4 @@
-From 973dc32026c164d0c13f7f5bef36c8d1c2375973 Mon Sep 17 00:00:00 2001
+From 2a40c481affef4df729d794daf378ed2e0184895 Mon Sep 17 00:00:00 2001
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
index baa98a0d46..b039ac213e 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From 02cc21800fe29f566add525e63f619c0536d6e7b Mon Sep 17 00:00:00 2001
+From 8943b38a0c14b220e3e173c038c87ce9a697c173 Mon Sep 17 00:00:00 2001
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
index 01f7e3bcea..15dad6eedd 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,8 +20,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch \
 "
 
-SRC_URI[sha256sum] = "d229c9937d9a25ca0a8958c59f425174563d300ec42acbea2dbe84a055023368"
-PV = "26.0.5"
+SRC_URI[sha256sum] = "1d3c3b8a8363b8cc354175bb4a684ad8b035211cc1d6fa17aeb9b9623c513f89"
+PV = "26.0.6"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============7840905709632564715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.0.5.so", added "/usr/lib/libgallium-26.0.6.so"
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.0.5.so moved to /usr/lib/libgallium-26.0.6.so

--===============7840905709632564715==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-tools-native-mesa-upgrade-26.0.5-26.0.6-26.0.5-.patch"

RnJvbSA3NzRjNDM1NjBlNGU4NWI3MGVkZmZlM2I1ZGU1OGQwMTM4MTZmMDhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAwNjoxMDozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c2EtdG9vbHMtbmF0aXZlLG1lc2E6IHVwZ3JhZGUgMjYuMC41IC0+IDI2LjAuNiwyNi4wLjUgLT4K
IDI2LjAuNgoKLS0tCiAuLi4wMS1mcmVlZHJlbm8tZG9uLXQtZW5jb2RlLWJ1aWxkLXBhdGgtaW50
by1iaW5hcmllcy5wYXRjaCB8IDYgKysrLS0tCiAuLi4vMDAwMS1nYWxsaXZtLUZpeC1hcm1oZi1i
dWlsZC1hZ2FpbnN0LUxMVk0tMjIucGF0Y2ggICAgICB8IDUgKy0tLS0KIC4uLi8wMDAxLW1lc29u
LW1pc2RldGVjdHMtNjRiaXQtYXRvbWljcy1vbi1taXBzLWNsYW5nLnBhdGNoIHwgMiArLQogbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS10b29scy1uYXRpdmUuYmIgICAgICAgICAgICAg
fCAxICsKIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EuaW5jICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgNCArKy0tCiA1IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTAg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmls
ZXMvMDAwMS1mcmVlZHJlbm8tZG9uLXQtZW5jb2RlLWJ1aWxkLXBhdGgtaW50by1iaW5hcmllcy5w
YXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZnJlZWRyZW5vLWRv
bi10LWVuY29kZS1idWlsZC1wYXRoLWludG8tYmluYXJpZXMucGF0Y2gKaW5kZXggNGQzNmU2OGE1
OC4uZTk3NmIzMzk5ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmls
ZXMvMDAwMS1mcmVlZHJlbm8tZG9uLXQtZW5jb2RlLWJ1aWxkLXBhdGgtaW50by1iaW5hcmllcy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWZyZWVkcmVu
by1kb24tdC1lbmNvZGUtYnVpbGQtcGF0aC1pbnRvLWJpbmFyaWVzLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA4Mjk5ZmUwNjE1NjM4ZGM4ODY5NGYwOGI5NWE2MmU5ZGQzOTQzYTZmIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0ZWY3NDg3MTA5ZjlhY2ZhMmJhZjFhMjIyNGRhMzFh
MGFlMGM3NGM2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBvc3MucXVhbGNvbW0uY29tPgogRGF0ZTogV2VkLCAxMCBEZWMg
MjAyNSAwMjoyNzoxNiArMDIwMAogU3ViamVjdDogW1BBVENIXSBmcmVlZHJlbm86IGRvbid0IGVu
Y29kZSBidWlsZCBwYXRoIGludG8gYmluYXJpZXMKQEAgLTI1LDcgKzI1LDcgQEAgU2lnbmVkLW9m
Zi1ieTogUXVlbnRpbiBTY2h1bHogPHF1ZW50aW4uc2NodWx6QGNoZXJyeS5kZT4KICAyIGZpbGVz
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBh
L3NyYy9mcmVlZHJlbm8vbWVzb24uYnVpbGQgYi9zcmMvZnJlZWRyZW5vL21lc29uLmJ1aWxkCi1p
bmRleCBhNGJmZDMzNzE3OS4uMzMwYjY0NjhkMDEgMTAwNjQ0CitpbmRleCBhNGJmZDMzLi4zMzBi
NjQ2IDEwMDY0NAogLS0tIGEvc3JjL2ZyZWVkcmVuby9tZXNvbi5idWlsZAogKysrIGIvc3JjL2Zy
ZWVkcmVuby9tZXNvbi5idWlsZAogQEAgLTQsOSArNCwxMCBAQApAQCAtNDIsNyArNDIsNyBAQCBp
bmRleCBhNGJmZDMzNzE3OS4uMzMwYjY0NjhkMDEgMTAwNjQ0CiAgZGVwX2xpYmFyY2hpdmUgPSBk
ZXBlbmRlbmN5KCdsaWJhcmNoaXZlJywgYWxsb3dfZmFsbGJhY2s6IHRydWUsIHJlcXVpcmVkOiBm
YWxzZSwgZGlzYWJsZXIgOiB0cnVlKQogIGRlcF9saWJ4bWwyID0gZGVwZW5kZW5jeSgnbGlieG1s
LTIuMCcsIGFsbG93X2ZhbGxiYWNrOiB0cnVlLCByZXF1aXJlZDogZmFsc2UpCiBkaWZmIC0tZ2l0
IGEvc3JjL2ZyZWVkcmVuby9yZWdpc3RlcnMvbWVzb24uYnVpbGQgYi9zcmMvZnJlZWRyZW5vL3Jl
Z2lzdGVycy9tZXNvbi5idWlsZAotaW5kZXggZjRiZTY4MTE3YzMuLmNkMGNhYWZhNDMxIDEwMDY0
NAoraW5kZXggZjRiZTY4MS4uY2QwY2FhZiAxMDA2NDQKIC0tLSBhL3NyYy9mcmVlZHJlbm8vcmVn
aXN0ZXJzL21lc29uLmJ1aWxkCiArKysgYi9zcmMvZnJlZWRyZW5vL3JlZ2lzdGVycy9tZXNvbi5i
dWlsZAogQEAgLTQzLDQgKzQzLDYgQEAgaWYgaW5zdGFsbF9mZF9kZWNvZGVfdG9vbHMKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZ2FsbGl2bS1GaXgt
YXJtaGYtYnVpbGQtYWdhaW5zdC1MTFZNLTIyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L21lc2EvZmlsZXMvMDAwMS1nYWxsaXZtLUZpeC1hcm1oZi1idWlsZC1hZ2FpbnN0LUxMVk0tMjIu
cGF0Y2gKaW5kZXggZGZhMmU4NjU2OC4uMDY1ZGQzNzNhNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1nYWxsaXZtLUZpeC1hcm1oZi1idWlsZC1hZ2Fp
bnN0LUxMVk0tMjIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMv
MDAwMS1nYWxsaXZtLUZpeC1hcm1oZi1idWlsZC1hZ2FpbnN0LUxMVk0tMjIucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDk3M2RjMzIwMjZjMTY0ZDBjMTNmN2Y1YmVmMzZjOGQxYzIzNzU5NzMg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJhNDBjNDgxYWZmZWY0ZGY3MjlkNzk0ZGFm
Mzc4ZWQyZTAxODQ4OTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGVzc2FuZHJv
IEFzdG9uZSA8YWxlcy5hc3RvbmVAZ21haWwuY29tPgogRGF0ZTogU3VuLCAxIE1hciAyMDI2IDE4
OjE0OjA5ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGdhbGxpdm06IEZpeCBhcm1oZiBidWlsZCBh
Z2FpbnN0IExMVk0gMjIKQEAgLTI1LDYgKzI1LDMgQEAgaW5kZXggZDNhZDM0Mi4uYzk1ZDg2ZSAx
MDA2NDQKICAgICAgICAgIGYgIT0gZmVhdHVyZXMuZW5kKCk7CiAgICAgICAgICArK2YpIHsKICAg
ICAgICBNQXR0cnMucHVzaF9iYWNrKCgoKmYpLnNlY29uZCA/ICIrIiA6ICItIikgKyAoKmYpLmZp
cnN0KCkuc3RyKCkpOwotLS0gCi0yLjUzLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL21lc2EvZmlsZXMvMDAwMS1tZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24t
bWlwcy1jbGFuZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEt
bWVzb24tbWlzZGV0ZWN0cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xhbmcucGF0Y2gKaW5kZXgg
YmFhOThhMGQ0Ni4uYjAzOWFjMjEzZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L21lc2EvZmlsZXMvMDAwMS1tZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1j
bGFuZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1l
c29uLW1pc2RldGVjdHMtNjRiaXQtYXRvbWljcy1vbi1taXBzLWNsYW5nLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSAwMmNjMjE4MDBmZTI5ZjU2NmFkZDUyNWU2M2Y2MTljMDUzNmQ2ZTdiIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4OTQzYjM4YTBjMTRiMjIwZTNlMTczYzAzOGM4
N2NlOWE2OTdjMTczIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJh
ai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMTMgSmFuIDIwMjAgMTU6MjM6NDcgLTA4MDAK
IFN1YmplY3Q6IFtQQVRDSF0gbWVzb24gbWlzZGV0ZWN0cyA2NGJpdCBhdG9taWNzIG9uIG1pcHMv
Y2xhbmcKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EtdG9vbHMt
bmF0aXZlLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS10b29scy1uYXRpdmUu
YmIKaW5kZXggMGZmZjZlZjFkZC4uMjAyMDc0NTBiZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL21lc2EvbWVzYS10b29scy1uYXRpdmUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL21lc2EvbWVzYS10b29scy1uYXRpdmUuYmIKQEAgLTE3LDMgKzE3LDQgQEAgRVhUUkFf
T0VNRVNPTiArPSAiIFwKICAgICAtRG1lc2EtY2xjPWVuYWJsZWQgLURpbnN0YWxsLW1lc2EtY2xj
PXRydWUgLURtZXNhLWNsYy1idW5kbGUtaGVhZGVycz1lbmFibGVkIFwKICAgICAtRHByZWNvbXAt
Y29tcGlsZXI9ZW5hYmxlZCAtRGluc3RhbGwtcHJlY29tcC1jb21waWxlcj10cnVlIFwKICIKKwpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS5pbmMgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmluYwppbmRleCAwMWY3ZTNiY2VhLi4xNWRhZDZlZWRk
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmluYworKysgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmluYwpAQCAtMjAsOCArMjAsOCBAQCBTUkNf
VVJJID0gImh0dHBzOi8vYXJjaGl2ZS5tZXNhM2Qub3JnL21lc2EtJHtQVn0udGFyLnh6IFwKICAg
ICAgICAgICAgZmlsZTovLzAwMDEtZ2FsbGl2bS1GaXgtYXJtaGYtYnVpbGQtYWdhaW5zdC1MTFZN
LTIyLnBhdGNoIFwKICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImQyMjljOTkzN2Q5YTI1Y2Ew
YTg5NThjNTlmNDI1MTc0NTYzZDMwMGVjNDJhY2JlYTJkYmU4NGEwNTUwMjMzNjgiCi1QViA9ICIy
Ni4wLjUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWQzYzNiOGE4MzYzYjhjYzM1NDE3NWJiNGE2
ODRhZDhiMDM1MjExY2MxZDZmYTE3YWViOWI5NjIzYzUxM2Y4OSIKK1BWID0gIjI2LjAuNiIKIAog
VVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAibWVzYS0oP1A8cHZlcj5cZCsoXC5cZCspKyki
CiAKLS0gCjIuNDcuMQoK

--===============7840905709632564715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mesa: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa: SRC_URI changed from "https://archive.mesa3d.org/mesa-26.0.5.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch" to "https://archive.mesa3d.org/mesa-26.0.6.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch"
packages/x86-64-v3-poky-linux/mesa: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/libgallium: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGSIZE changed from 42886880 to 42890976 (+0%)
packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.0.5.so", added "/usr/lib/libgallium-26.0.6.so"
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/libgbm: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/libgbm: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/libglapi: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/libteflon: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/libteflon: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 717154288 to 717178168 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: FILELIST: removed "/usr/lib/.debug/libgallium-26.0.5.so", added "/usr/lib/.debug/libgallium-26.0.6.so"
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 212140 to 212338 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-src: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGSIZE changed from 198542428 to 198543473 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa-src: FILELIST: directory renamed /usr/src/debug/mesa/26.0.5/src/intel/compiler/brw -> /usr/src/debug/mesa/26.0.6/src/intel/compiler/brw, directory renamed /usr/src/debug/mesa/26.0.5/src/gallium/drivers/r600 -> /usr/src/debug/mesa/26.0.6/src/gallium/drivers/r600, directory renamed /usr/src/debug/mesa/26.0.5/src/compiler/spirv -> /usr/src/debug/mesa/26.0.6/src/compiler/spirv, directory renamed /usr/src/debug/mesa/26.0.5/src/amd/vulkan/layers -> /usr/src/debug/mesa/26.0.6/src/amd/vulkan/layers, directory renamed /usr/src/debug/mesa/26.0.5/src/intel/genxml -> /usr/src/debug/mesa/26.0.6/src/intel/genxml, directory renamed /usr/src/debug/mesa/26.0.5/src/util/format -> /usr/src/debug/mesa/26.0.6/src/util/format, directory renamed /usr/src/debug/mesa/26.0.5/src/compiler/glsl/glcpp -> /usr/src/debug/mesa/26.0.6/src/compiler/glsl/glcpp, directory renamed /usr/src/debug/mesa/26.0.5/src/intel/perf -> /usr/src/debug/mesa/26.0.6/src/intel/perf, directory ren
 amed /usr/src/debug/mesa/26.0.5/src/vulkan/wsi -> /usr/src/debug/mesa/26.0.6/src/vulkan/wsi, directory renamed /usr/src/debug/mesa/26.0.5/src/intel/blorp -> /usr/src/debug/mesa/26.0.6/src/intel/blorp, directory renamed /usr/src/debug/mesa/26.0.5/src/amd/compiler -> /usr/src/debug/mesa/26.0.6/src/amd/compiler, directory renamed /usr/src/debug/mesa/26.0.5/src/intel/compiler/elk -> /usr/src/debug/mesa/26.0.6/src/intel/compiler/elk, directory renamed /usr/src/debug/mesa/26.0.5/src/gallium/drivers/r300 -> /usr/src/debug/mesa/26.0.6/src/gallium/drivers/r300, directory renamed /usr/src/debug/mesa/26.0.5/src/gallium/auxiliary -> /usr/src/debug/mesa/26.0.6/src/gallium/auxiliary, directory renamed /usr/src/debug/mesa/26.0.5/src/mesa/glapi/glapi/gen -> /usr/src/debug/mesa/26.0.6/src/mesa/glapi/glapi/gen, directory renamed /usr/src/debug/mesa/26.0.5/src/virtio/vulkan -> /usr/src/debug/mesa/26.0.6/src/virtio/vulkan, directory renamed /usr/src/debug/mesa/26.0.5/src/vulkan/util -> /usr/src/debug/m
 esa/26.0.6/src/vulkan/util, directory renamed /usr/src/debug/mesa/26.0.5/src/compiler/nir -> /usr/src/debug/mesa/26.0.6/src/compiler/nir, directory renamed /usr/src/debug/mesa/26.0.5/src/gallium/frontends/lavapipe -> /usr/src/debug/mesa/26.0.6/src/gallium/frontends/lavapipe, directory renamed /usr/src/debug/mesa/26.0.5/src/mesa/program -> /usr/src/debug/mesa/26.0.6/src/mesa/program, directory renamed /usr/src/debug/mesa/26.0.5/src/intel/isl -> /usr/src/debug/mesa/26.0.6/src/intel/isl, directory renamed /usr/src/debug/mesa/26.0.5/src/compiler -> /usr/src/debug/mesa/26.0.6/src/compiler, directory renamed /usr/src/debug/mesa/26.0.5/src/gfxstream/guest/vulkan_enc -> /usr/src/debug/mesa/26.0.6/src/gfxstream/guest/vulkan_enc, directory renamed /usr/src/debug/mesa/26.0.5/src/intel/shaders -> /usr/src/debug/mesa/26.0.6/src/intel/shaders, directory renamed /usr/src/debug/mesa/26.0.5/src/gallium/drivers/radeonsi -> /usr/src/debug/mesa/26.0.6/src/gallium/drivers/radeonsi, directory renamed /us
 r/src/debug/mesa/26.0.5/src/intel/vulkan -> /usr/src/debug/mesa/26.0.6/src/intel/vulkan, directory renamed /usr/src/debug/mesa/26.0.5/src/mesa/glapi/shared-glapi -> /usr/src/debug/mesa/26.0.6/src/mesa/glapi/shared-glapi, directory renamed /usr/src/debug/mesa/26.0.5/src/loader -> /usr/src/debug/mesa/26.0.6/src/loader, directory renamed /usr/src/debug/mesa/26.0.5/src/mesa -> /usr/src/debug/mesa/26.0.6/src/mesa, directory renamed /usr/src/debug/mesa/26.0.5/src/amd/common -> /usr/src/debug/mesa/26.0.6/src/amd/common, directory renamed /usr/src/debug/mesa/26.0.5/src/amd/vulkan -> /usr/src/debug/mesa/26.0.6/src/amd/vulkan, directory renamed /usr/src/debug/mesa/26.0.5/src/gallium/drivers/zink -> /usr/src/debug/mesa/26.0.6/src/gallium/drivers/zink, directory renamed /usr/src/debug/mesa/26.0.5/src/intel/dev -> /usr/src/debug/mesa/26.0.6/src/intel/dev, directory renamed /usr/src/debug/mesa/26.0.5/src/nouveau/headers -> /usr/src/debug/mesa/26.0.6/src/nouveau/headers, directory renamed /usr/src
 /debug/mesa/26.0.5/src/vulkan/runtime -> /usr/src/debug/mesa/26.0.6/src/vulkan/runtime, directory renamed /usr/src/debug/mesa/26.0.5/src/intel/ds -> /usr/src/debug/mesa/26.0.6/src/intel/ds, directory renamed /usr/src/debug/mesa/26.0.5/src/intel/compiler -> /usr/src/debug/mesa/26.0.6/src/intel/compiler, directory renamed /usr/src/debug/mesa/26.0.5/src/compiler/glsl -> /usr/src/debug/mesa/26.0.6/src/compiler/glsl, directory renamed /usr/src/debug/mesa/26.0.5/src/util -> /usr/src/debug/mesa/26.0.6/src/util, directory renamed /usr/src/debug/mesa/26.0.5/src/intel/vulkan_hasvk -> /usr/src/debug/mesa/26.0.6/src/intel/vulkan_hasvk
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGSIZE changed from 76943832 to 76952024 (+0%)
packages/x86-64-v3-poky-linux/mesa/mesa: PV changed from "26.0.5" to "26.0.6"
packages/x86-64-v3-poky-linux/mesa/mesa: PKGV changed from 26.0.5 [default] to 26.0.6 [default]
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.0.5.so moved to /usr/lib/libgallium-26.0.6.so

--===============7840905709632564715==--

