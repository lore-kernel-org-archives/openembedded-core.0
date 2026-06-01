Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB942CD6E76
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:41 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1552.1780328129481884145
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=kWX1epWt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kPzu1d+v;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019e83d363a2-e7518a57-2337-4b7b-bb1f-19d545f199d2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328129;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=py130nDovR44U3FCK/RwdbIzp1C8CxyYc1SOPveH+9A=;
	b=kWX1epWtFDe58+7y3knl1FgbQrZkBWK8Hdl+T+40GG7OTqRRbSWdBIb6bLJyLVb2
	9vR7w6HYgaCVuq8TpMxDm3wXEUMK+mBtCjKwyLSR3dZRkMCBPfXh+B7RfWmcx/KwusT
	HaAxMcZ3Hh3aFSz36vyyiVHR6238liH1qVYaQZZY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328129;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=py130nDovR44U3FCK/RwdbIzp1C8CxyYc1SOPveH+9A=;
	b=kPzu1d+vshbWCoJxV4bhXrEAqLP7+qrMeNTdRsA8cmJ7wvhWzyygo24y7L3SjKI+
	mXmiFOtaEKfpBeRc2Y61No+qyhzZY6xEFn8nyICUXEdYNmRaf57uH2aTsYwxwBAe5Vn
	8HUjk+VhOd2RIHz5CVT22kP6oGaaRDuK1oPQi3mQ=
Content-Type: multipart/mixed; boundary="===============7461497872344189596=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] mesa,mesa-tools-native: upgrading to 26.1.1,26.1.1 SUCCEEDED
Message-ID: <0101019e83d363a2-e7518a57-2337-4b7b-bb1f-19d545f199d2-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237847

--===============7461497872344189596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mesa,mesa-tools-native* to *26.1.1,26.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-mesa-tools-native-upgrade-26.0.6-26.1.1-26.0.6-.patch
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
From cee117ffec2bbbaefae50f25bed736d6ce923c21 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 06:37:10 +0000
Subject: [PATCH] mesa,mesa-tools-native: upgrade 26.0.6 -> 26.1.1,26.0.6 ->
 26.1.1

---
 ...0001-freedreno-don-t-encode-build-path-into-binaries.patch | 4 ++--
 .../files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch  | 4 ++--
 .../0001-meson-misdetects-64bit-atomics-on-mips-clang.patch   | 2 +-
 meta/recipes-graphics/mesa/mesa.inc                           | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index e976b3399f..d07e22223c 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From 4ef7487109f9acfa2baf1a2224da31a0ae0c74c6 Mon Sep 17 00:00:00 2001
+From 35cb971c25fca4332f0eca3afea3f71b66fd2b84 Mon Sep 17 00:00:00 2001
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
index 065dd373a7..8b6dfd62de 100644
--- a/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
+++ b/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
@@ -1,4 +1,4 @@
-From 2a40c481affef4df729d794daf378ed2e0184895 Mon Sep 17 00:00:00 2001
+From a453cca8d08482255db24933f5b6e8e0cdc0992c Mon Sep 17 00:00:00 2001
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
index b039ac213e..30570cfd74 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From 8943b38a0c14b220e3e173c038c87ce9a697c173 Mon Sep 17 00:00:00 2001
+From fdf91baf2b8c470695f50a3adab9f180a6242180 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 15dad6eedd..d9e4d511c0 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,8 +20,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch \
 "
 
-SRC_URI[sha256sum] = "1d3c3b8a8363b8cc354175bb4a684ad8b035211cc1d6fa17aeb9b9623c513f89"
-PV = "26.0.6"
+SRC_URI[sha256sum] = "8bd36c031cc6d0edfec04617527609454ee3a09ad53bdf983b45fc2c1e129b2e"
+PV = "26.1.1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============7461497872344189596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.0.6.so", added "/usr/lib/libgallium-26.1.1.so"
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.0.6.so moved to /usr/lib/libgallium-26.1.1.so

--===============7461497872344189596==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mesa-mesa-tools-native-upgrade-26.0.6-26.1.1-26.0.6-.patch"

RnJvbSBjZWUxMTdmZmVjMmJiYmFlZmFlNTBmMjViZWQ3MzZkNmNlOTIzYzIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwNjozNzoxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c2EsbWVzYS10b29scy1uYXRpdmU6IHVwZ3JhZGUgMjYuMC42IC0+IDI2LjEuMSwyNi4wLjYgLT4K
IDI2LjEuMQoKLS0tCiAuLi4wMDAxLWZyZWVkcmVuby1kb24tdC1lbmNvZGUtYnVpbGQtcGF0aC1p
bnRvLWJpbmFyaWVzLnBhdGNoIHwgNCArKy0tCiAuLi4vZmlsZXMvMDAwMS1nYWxsaXZtLUZpeC1h
cm1oZi1idWlsZC1hZ2FpbnN0LUxMVk0tMjIucGF0Y2ggIHwgNCArKy0tCiAuLi4vMDAwMS1tZXNv
bi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRjaCAgIHwgMiArLQog
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS5pbmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDQgKystLQogNCBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAw
MS1mcmVlZHJlbm8tZG9uLXQtZW5jb2RlLWJ1aWxkLXBhdGgtaW50by1iaW5hcmllcy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtZnJlZWRyZW5vLWRvbi10LWVu
Y29kZS1idWlsZC1wYXRoLWludG8tYmluYXJpZXMucGF0Y2gKaW5kZXggZTk3NmIzMzk5Zi4uZDA3
ZTIyMjIzYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAw
MS1mcmVlZHJlbm8tZG9uLXQtZW5jb2RlLWJ1aWxkLXBhdGgtaW50by1iaW5hcmllcy5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLWZyZWVkcmVuby1kb24t
dC1lbmNvZGUtYnVpbGQtcGF0aC1pbnRvLWJpbmFyaWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSA0ZWY3NDg3MTA5ZjlhY2ZhMmJhZjFhMjIyNGRhMzFhMGFlMGM3NGM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSAzNWNiOTcxYzI1ZmNhNDMzMmYwZWNhM2FmZWEzZjcxYjY2ZmQy
Yjg0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1p
dHJ5LmJhcnlzaGtvdkBvc3MucXVhbGNvbW0uY29tPgogRGF0ZTogV2VkLCAxMCBEZWMgMjAyNSAw
MjoyNzoxNiArMDIwMAogU3ViamVjdDogW1BBVENIXSBmcmVlZHJlbm86IGRvbid0IGVuY29kZSBi
dWlsZCBwYXRoIGludG8gYmluYXJpZXMKQEAgLTI1LDcgKzI1LDcgQEAgU2lnbmVkLW9mZi1ieTog
UXVlbnRpbiBTY2h1bHogPHF1ZW50aW4uc2NodWx6QGNoZXJyeS5kZT4KICAyIGZpbGVzIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9m
cmVlZHJlbm8vbWVzb24uYnVpbGQgYi9zcmMvZnJlZWRyZW5vL21lc29uLmJ1aWxkCi1pbmRleCBh
NGJmZDMzLi4zMzBiNjQ2IDEwMDY0NAoraW5kZXggZThmMDFiOC4uODE0NGE3NSAxMDA2NDQKIC0t
LSBhL3NyYy9mcmVlZHJlbm8vbWVzb24uYnVpbGQKICsrKyBiL3NyYy9mcmVlZHJlbm8vbWVzb24u
YnVpbGQKIEBAIC00LDkgKzQsMTAgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9tZXNhL2ZpbGVzLzAwMDEtZ2FsbGl2bS1GaXgtYXJtaGYtYnVpbGQtYWdhaW5zdC1MTFZNLTIy
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1nYWxsaXZtLUZp
eC1hcm1oZi1idWlsZC1hZ2FpbnN0LUxMVk0tMjIucGF0Y2gKaW5kZXggMDY1ZGQzNzNhNy4uOGI2
ZGZkNjJkZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAw
MS1nYWxsaXZtLUZpeC1hcm1oZi1idWlsZC1hZ2FpbnN0LUxMVk0tMjIucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAwMS1nYWxsaXZtLUZpeC1hcm1oZi1idWls
ZC1hZ2FpbnN0LUxMVk0tMjIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDJhNDBjNDgxYWZm
ZWY0ZGY3MjlkNzk0ZGFmMzc4ZWQyZTAxODQ4OTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIGE0NTNjY2E4ZDA4NDgyMjU1ZGIyNDkzM2Y1YjZlOGUwY2RjMDk5MmMgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBBbGVzc2FuZHJvIEFzdG9uZSA8YWxlcy5hc3RvbmVAZ21haWwu
Y29tPgogRGF0ZTogU3VuLCAxIE1hciAyMDI2IDE4OjE0OjA5ICswMTAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGdhbGxpdm06IEZpeCBhcm1oZiBidWlsZCBhZ2FpbnN0IExMVk0gMjIKQEAgLTEzLDcgKzEz
LDcgQEAgU2lnbmVkLW9mZi1ieTogSm9zZSBRdWFyZXNtYSA8am9zZS5xdWFyZXNtYUBvc3MucXVh
bGNvbW0uY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogCiBkaWZmIC0tZ2l0IGEvc3JjL2dhbGxpdW0vYXV4aWxpYXJ5L2dhbGxpdm0vbHBfYmxkX21p
c2MuY3BwIGIvc3JjL2dhbGxpdW0vYXV4aWxpYXJ5L2dhbGxpdm0vbHBfYmxkX21pc2MuY3BwCi1p
bmRleCBkM2FkMzQyLi5jOTVkODZlIDEwMDY0NAoraW5kZXggY2U4Y2EwMi4uODY3NzlmMCAxMDA2
NDQKIC0tLSBhL3NyYy9nYWxsaXVtL2F1eGlsaWFyeS9nYWxsaXZtL2xwX2JsZF9taXNjLmNwcAog
KysrIGIvc3JjL2dhbGxpdW0vYXV4aWxpYXJ5L2dhbGxpdm0vbHBfYmxkX21pc2MuY3BwCiBAQCAt
MzMxLDcgKzMzMSw3IEBAIGxwX2J1aWxkX2ZpbGxfbWF0dHJzKHN0ZDo6dmVjdG9yPHN0ZDo6c3Ry
aW5nPiAmTUF0dHJzKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmls
ZXMvMDAwMS1tZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL2ZpbGVzLzAwMDEtbWVzb24tbWlzZGV0ZWN0
cy02NGJpdC1hdG9taWNzLW9uLW1pcHMtY2xhbmcucGF0Y2gKaW5kZXggYjAzOWFjMjEzZS4uMzA1
NzBjZmQ3NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvZmlsZXMvMDAw
MS1tZXNvbi1taXNkZXRlY3RzLTY0Yml0LWF0b21pY3Mtb24tbWlwcy1jbGFuZy5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9maWxlcy8wMDAxLW1lc29uLW1pc2RldGVjdHMt
NjRiaXQtYXRvbWljcy1vbi1taXBzLWNsYW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4
OTQzYjM4YTBjMTRiMjIwZTNlMTczYzAzOGM4N2NlOWE2OTdjMTczIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBmZGY5MWJhZjJiOGM0NzA2OTVmNTBhM2FkYWI5ZjE4MGE2MjQyMTgwIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4KIERhdGU6IE1vbiwgMTMgSmFuIDIwMjAgMTU6MjM6NDcgLTA4MDAKIFN1YmplY3Q6IFtQQVRD
SF0gbWVzb24gbWlzZGV0ZWN0cyA2NGJpdCBhdG9taWNzIG9uIG1pcHMvY2xhbmcKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EuaW5jIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL21lc2EvbWVzYS5pbmMKaW5kZXggMTVkYWQ2ZWVkZC4uZDllNGQ1MTFjMCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS5pbmMKKysrIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL21lc2EvbWVzYS5pbmMKQEAgLTIwLDggKzIwLDggQEAgU1JDX1VSSSA9ICJo
dHRwczovL2FyY2hpdmUubWVzYTNkLm9yZy9tZXNhLSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLWdhbGxpdm0tRml4LWFybWhmLWJ1aWxkLWFnYWluc3QtTExWTS0yMi5wYXRj
aCBcCiAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxZDNjM2I4YTgzNjNiOGNjMzU0MTc1YmI0
YTY4NGFkOGIwMzUyMTFjYzFkNmZhMTdhZWI5Yjk2MjNjNTEzZjg5IgotUFYgPSAiMjYuMC42Igor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjhiZDM2YzAzMWNjNmQwZWRmZWMwNDYxNzUyNzYwOTQ1NGVl
M2EwOWFkNTNiZGY5ODNiNDVmYzJjMWUxMjliMmUiCitQViA9ICIyNi4xLjEiCiAKIFVQU1RSRUFN
X0NIRUNLX0dJVFRBR1JFR0VYID0gIm1lc2EtKD9QPHB2ZXI+XGQrKFwuXGQrKSspIgogCi0tIAoy
LjQ3LjEKCg==

--===============7461497872344189596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mesa: SRC_URI changed from "https://archive.mesa3d.org/mesa-26.0.6.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch" to "https://archive.mesa3d.org/mesa-26.1.1.tar.xz file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-freedreno-don-t-encode-build-path-into-binaries.patch file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch"
packages/x86-64-v3-poky-linux/mesa: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/libegl-mesa: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGSIZE changed from 43579104 to 44617440 (+2%)
packages/x86-64-v3-poky-linux/mesa/libgallium: FILELIST: removed "/usr/lib/libgallium-26.0.6.so", added "/usr/lib/libgallium-26.1.1.so"
packages/x86-64-v3-poky-linux/mesa/libgallium: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/libgallium: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/libgbm-dev: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/libgbm: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/libgbm: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/libgl-mesa: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/libglapi-dev: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/libglapi: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/libglapi: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/libgles1-mesa: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/libgles2-mesa: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa-dev: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/libglx-mesa: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/libopencl-mesa: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/libteflon: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/libteflon: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 729141280 to 750982344 (+3%)
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: FILELIST: removed "/usr/lib/.debug/libgallium-26.0.6.so", added "/usr/lib/.debug/libgallium-26.1.1.so"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/mesa-dbg: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/mesa-dev: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/mesa-doc: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/mesa-locale: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 212338 to 214471 (+1%)
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/mesa-megadriver: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGSIZE changed from 198543473 to 201058487 (+1%)
packages/x86-64-v3-poky-linux/mesa/mesa-src: FILELIST: directory renamed /usr/src/debug/mesa/26.0.6/src/gallium/drivers/zink -> /usr/src/debug/mesa/26.1.1/src/gallium/drivers/zink, directory renamed /usr/src/debug/mesa/26.0.6/src/virtio/vulkan -> /usr/src/debug/mesa/26.1.1/src/virtio/vulkan, directory renamed /usr/src/debug/mesa/26.0.6/src/amd/vulkan/layers -> /usr/src/debug/mesa/26.1.1/src/amd/vulkan/layers, directory renamed /usr/src/debug/mesa/26.0.6/src/compiler/nir -> /usr/src/debug/mesa/26.1.1/src/compiler/nir, directory renamed /usr/src/debug/mesa/26.0.6/src/gfxstream/guest/vulkan_enc -> /usr/src/debug/mesa/26.1.1/src/gfxstream/guest/vulkan_enc, directory renamed /usr/src/debug/mesa/26.0.6/src/intel/isl -> /usr/src/debug/mesa/26.1.1/src/intel/isl, directory renamed /usr/src/debug/mesa/26.0.6/src/intel/vulkan_hasvk -> /usr/src/debug/mesa/26.1.1/src/intel/vulkan_hasvk, directory renamed /usr/src/debug/mesa/26.0.6/src/amd/compiler -> /usr/src/debug/mesa/26.1.1/src/amd/compiler, d
 irectory renamed /usr/src/debug/mesa/26.0.6/src/compiler -> /usr/src/debug/mesa/26.1.1/src/compiler, directory renamed /usr/src/debug/mesa/26.0.6/src/mesa/program -> /usr/src/debug/mesa/26.1.1/src/mesa/program, directory renamed /usr/src/debug/mesa/26.0.6/src/gallium/drivers/r600 -> /usr/src/debug/mesa/26.1.1/src/gallium/drivers/r600, directory renamed /usr/src/debug/mesa/26.0.6/src/gallium/drivers/radeonsi -> /usr/src/debug/mesa/26.1.1/src/gallium/drivers/radeonsi, directory renamed /usr/src/debug/mesa/26.0.6/src/mesa -> /usr/src/debug/mesa/26.1.1/src/mesa, directory renamed /usr/src/debug/mesa/26.0.6/src/loader -> /usr/src/debug/mesa/26.1.1/src/loader, directory renamed /usr/src/debug/mesa/26.0.6/src/gallium/frontends/lavapipe -> /usr/src/debug/mesa/26.1.1/src/gallium/frontends/lavapipe, directory renamed /usr/src/debug/mesa/26.0.6/src/intel/blorp -> /usr/src/debug/mesa/26.1.1/src/intel/blorp, directory renamed /usr/src/debug/mesa/26.0.6/src/mesa/glapi/shared-glapi -> /usr/src/deb
 ug/mesa/26.1.1/src/mesa/glapi/shared-glapi, directory renamed /usr/src/debug/mesa/26.0.6/src/gallium/drivers/r300 -> /usr/src/debug/mesa/26.1.1/src/gallium/drivers/r300, directory renamed /usr/src/debug/mesa/26.0.6/src/compiler/spirv -> /usr/src/debug/mesa/26.1.1/src/compiler/spirv, directory renamed /usr/src/debug/mesa/26.0.6/src/intel/compiler/elk -> /usr/src/debug/mesa/26.1.1/src/intel/compiler/elk, directory renamed /usr/src/debug/mesa/26.0.6/src/intel/compiler/brw -> /usr/src/debug/mesa/26.1.1/src/intel/compiler/brw, directory renamed /usr/src/debug/mesa/26.0.6/src/intel/vulkan -> /usr/src/debug/mesa/26.1.1/src/intel/vulkan, directory renamed /usr/src/debug/mesa/26.0.6/src/vulkan/runtime -> /usr/src/debug/mesa/26.1.1/src/vulkan/runtime, directory renamed /usr/src/debug/mesa/26.0.6/src/vulkan/wsi -> /usr/src/debug/mesa/26.1.1/src/vulkan/wsi, directory renamed /usr/src/debug/mesa/26.0.6/src/intel/compiler -> /usr/src/debug/mesa/26.1.1/src/intel/compiler, directory renamed /usr/sr
 c/debug/mesa/26.0.6/src/compiler/glsl -> /usr/src/debug/mesa/26.1.1/src/compiler/glsl, directory renamed /usr/src/debug/mesa/26.0.6/src/amd/vulkan -> /usr/src/debug/mesa/26.1.1/src/amd/vulkan, directory renamed /usr/src/debug/mesa/26.0.6/src/util -> /usr/src/debug/mesa/26.1.1/src/util, directory renamed /usr/src/debug/mesa/26.0.6/src/gallium/auxiliary -> /usr/src/debug/mesa/26.1.1/src/gallium/auxiliary, directory renamed /usr/src/debug/mesa/26.0.6/src/vulkan/util -> /usr/src/debug/mesa/26.1.1/src/vulkan/util, directory renamed /usr/src/debug/mesa/26.0.6/src/intel/ds -> /usr/src/debug/mesa/26.1.1/src/intel/ds, directory renamed /usr/src/debug/mesa/26.0.6/src/intel/perf -> /usr/src/debug/mesa/26.1.1/src/intel/perf, directory renamed /usr/src/debug/mesa/26.0.6/src/util/format -> /usr/src/debug/mesa/26.1.1/src/util/format, directory renamed /usr/src/debug/mesa/26.0.6/src/mesa/glapi/glapi/gen -> /usr/src/debug/mesa/26.1.1/src/mesa/glapi/glapi/gen, directory renamed /usr/src/debug/mesa/26
 .0.6/src/intel/dev -> /usr/src/debug/mesa/26.1.1/src/intel/dev, directory renamed /usr/src/debug/mesa/26.0.6/src/nouveau/headers -> /usr/src/debug/mesa/26.1.1/src/nouveau/headers, directory renamed /usr/src/debug/mesa/26.0.6/src/compiler/glsl/glcpp -> /usr/src/debug/mesa/26.1.1/src/compiler/glsl/glcpp, removed "/usr/src/debug/mesa/26.0.6/src/intel/genxml/gen45_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen75_pack.h /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx125_shaders_binding.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen300_video_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen200_video_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen50_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen60_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen70_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen80_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen40_pack.h /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx120_shaders_binding.cpp /us
 r/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx200_shaders_binding.cpp /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx300_shaders_binding.cpp /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen90_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/genX_xml.h /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx110_shaders_binding.cpp /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen110_video_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen120_video_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen125_video_pack.h /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx80_shaders_binding.cpp /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx90_shaders_binding.cpp /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx80_shaders_binding.h /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx90_shaders_binding.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen200_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen300_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxm
 l/gen90_video_pack.h /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx125_shaders_binding.cpp /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen125_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen120_pack.h /usr/src/debug/mesa/26.0.6/src/amd/common/sid_tables.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/genX_bits.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen200_rt_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen300_rt_pack.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen125_rt_pack.h /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx110_shaders_binding.h /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx120_shaders_binding.h /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx200_shaders_binding.h /usr/src/debug/mesa/26.0.6/src/intel/shaders/intel_gfx300_shaders_binding.h /usr/src/debug/mesa/26.0.6/src/intel/genxml/gen110_pack.h /usr/src/debug/mesa/26.0.6/src/intel/shaders/float64_spv.h /usr/src/debug/mesa/26.0.6/src/amd/common/gfx10_format_table.c", ad
 ded "/usr/src/debug/mesa/26.1.1/src/intel/genxml/xe3p_rt_pack.h /usr/src/debug/mesa/26.1.1/src/intel/compiler/jay/jay_nir_algebraic.c /usr/src/debug/mesa/26.1.1/src/intel/genxml/gen45_pack.h /usr/src/debug/mesa/26.1.1/src/intel/genxml/gen75_pack.h /usr/src/debug/mesa/26.1.1/src/intel/genxml/xe3p_pack.h /usr/src/debug/mesa/26.1.1/src/intel/shaders/intel_gfx125_shaders_binding.h /usr/src/debug/mesa/26.1.1/src/intel/genxml/gen50_pack.h /usr/src/debug/mesa/26.1.1/src/intel/genxml/gen60_pack.h /usr/src/debug/mesa/26.1.1/src/intel/genxml/gen70_pack.h /usr/src/debug/mesa/26.1.1/src/intel/genxml/gen80_pack.h /usr/src/debug/mesa/26.1.1/src/intel/genxml/gen90_pack.h /usr/src/debug/mesa/26.1.1/src/intel/shaders/intel_gfx120_shaders_binding.cpp /usr/src/debug/mesa/26.1.1/src/intel/shaders/intel_gfx200_shaders_binding.cpp /usr/src/debug/mesa/26.1.1/src/intel/genxml/xe2_video_pack.h /usr/src/debug/mesa/26.1.1/src/intel/genxml/gen40_pack.h /usr/src/debug/mesa/26.1.1/src/intel/genxml/genX_xml.h /us
 r/src/debug/mesa/26.1.1/src/intel/shaders/intel_gfx110_shaders_binding.cpp /usr/src/debug/mesa/26.1.1/src/intel/genxml/xe3_video_pack.h /usr/src/debug/mesa/26.1.1/src/intel/genxml/gen110_video_pack.h /usr/src/debug/mesa/26.1.1/src/intel/shaders/intel_gfx300_shaders_binding.cpp /usr/src/debug/mesa/26.1.1/src/intel/shaders/intel_gfx350_shaders_binding.cpp /usr/src/debug/mesa/26.1.1/src/intel/genxml/gen120_video_pack.h /usr/src/debug/mesa/26.1.1/src/intel/genxml/gen125_video_pack.h /usr/src/debug/mesa/26.1.1/src/intel/genxml/xe2_rt_pack.h /usr/src/debug/mesa/26.1.1/src/intel/compiler/jay/jay_extra_info.h /usr/src/debug/mesa/26.1.1/src/intel/shaders/intel_gfx80_shaders_binding.cpp /usr/src/debug/mesa/26.1.1/src/intel/shaders/intel_gfx90_shaders_binding.cpp /usr/src/debug/mesa/26.1.1/src/intel/shaders/intel_gfx80_shaders_binding.h /usr/src/debug/mesa/26.1.1/src/intel/shaders/intel_gfx90_shaders_binding.h /usr/src/debug/mesa/26.1.1/src/intel/genxml/xe3p_video_pack.h /usr/src/debug/mesa/26
 .1.1/src/intel/shaders/intel_gfx125_shaders_binding.cpp /usr/src/debug/mesa/26.1.1/src/intel/genxml/gen90_video_pack.h /usr/src/debug/mesa/26.1.1/src/intel/genxml/xe2_pack.h /usr/src/debug/mesa/26.1.1/src/intel/genxml/xe3_pack.h /usr/src/debug/mesa/26.1.1/src/intel/genxml/gen120_pack.h /usr/src/debug/mesa/26.1.1/src/intel/genxml/gen125_pack.h /usr/src/debug/mesa/26.1.1/src/amd/common/sid_tables.h /usr/src/debug/mesa/26.1.1/src/intel/compiler/jay/jay_builder_opcodes.h /usr/src/debug/mesa/26.1.1/src/intel/genxml/genX_bits.h /usr/src/debug/mesa/26.1.1/src/amd/common/amd_cp_print_packet_gfx12.h /usr/src/debug/mesa/26.1.1/src/intel/compiler/jay/jay_opcodes.h /usr/src/debug/mesa/26.1.1/src/amd/common/amd_cp_print_packet_gfx12.c /usr/src/debug/mesa/26.1.1/src/intel/compiler/jay/jay_opcodes.c /usr/src/debug/mesa/26.1.1/src/intel/genxml/gen125_rt_pack.h /usr/src/debug/mesa/26.1.1/src/intel/shaders/intel_gfx110_shaders_binding.h /usr/src/debug/mesa/26.1.1/src/intel/shaders/intel_gfx120_shader
 s_binding.h /usr/src/debug/mesa/26.1.1/src/intel/shaders/intel_gfx200_shaders_binding.h /usr/src/debug/mesa/26.1.1/src/intel/shaders/intel_gfx300_shaders_binding.h /usr/src/debug/mesa/26.1.1/src/amd/common/amd_cp_print_packet_gfx11.h /usr/src/debug/mesa/26.1.1/src/intel/shaders/intel_gfx350_shaders_binding.h /usr/src/debug/mesa/26.1.1/src/intel/genxml/gen110_pack.h /usr/src/debug/mesa/26.1.1/src/intel/genxml/xe3_rt_pack.h /usr/src/debug/mesa/26.1.1/src/intel/shaders/float64_spv.h /usr/src/debug/mesa/26.1.1/src/amd/common/gfx10_format_table.c /usr/src/debug/mesa/26.1.1/src/amd/common/amd_cp_print_packet_gfx11.c"
packages/x86-64-v3-poky-linux/mesa/mesa-src: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/mesa-src: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/mesa-staticdev: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/mesa-tools: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGSIZE changed from 77369816 to 81458264 (+5%)
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
packages/x86-64-v3-poky-linux/mesa/mesa: PV changed from "26.0.6" to "26.1.1"
packages/x86-64-v3-poky-linux/mesa/mesa: PKGV changed from 26.0.6 [default] to 26.1.1 [default]
Changes to packages/x86-64-v3-poky-linux/mesa (sysroot):
  /usr/lib/libgallium-26.0.6.so moved to /usr/lib/libgallium-26.1.1.so

--===============7461497872344189596==--

