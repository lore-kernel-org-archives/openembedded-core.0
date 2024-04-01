Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75191CD12B7
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:28 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.44635.1711994601049017979
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bmYHQ2zk;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Ow0njk4f;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018e9ad47b4d-87be1c68-e94f-41b0-a102-f76c67bfa2c0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xUroY8jbQgZOrNpAkMX0flgdEuKqJrJBQVG3s9+2A7c=;
	b=bmYHQ2zkSPsX0K/gusG6BZ/epq3cmi60wXRCLmH+F+lyHL4yDYQsJC3aJc8cvWYZ
	T5Yz2lceIgaoSm7z6CiUe98p5+bw66f3PTclTKIV5FV3i0szgvFBUz+GQ0Xyxgi+dKt
	ZUHOJUd/77jcNx6LxbXtZ45khtWejNH/jPQ5DCZE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xUroY8jbQgZOrNpAkMX0flgdEuKqJrJBQVG3s9+2A7c=;
	b=Ow0njk4faW3kRD6+3sKmDb756uQVsH9matn9WPEeBe9svrraYy32/gzRhFIglKif
	3/F/xRUgcjXoOPD+DduoHHw2Y3izDzgI17/8EoAeGvFlI+r00M5i4tnnHU8N6dRjpj/
	P/1arV0fPN2Dh/CDoMKngCHvW+iU2qgHGaORrwjc=
Content-Type: multipart/mixed; boundary="===============6722969172300781774=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ofono: upgrading to 2.5 SUCCEEDED
Message-ID: <0101018e9ad47b4d-87be1c68-e94f-41b0-a102-f76c67bfa2c0-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197696

--===============6722969172300781774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ofono* to *2.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ofono-upgrade-2.4-2.5.patch
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
From a8b99d83196cf39c914598e2510f87e01bf8aa3f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 05:56:30 +0000
Subject: [PATCH] ofono: upgrade 2.4 -> 2.5

---
 ...-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch | 5 +----
 ...bim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch | 4 ++--
 .../ofono/{ofono_2.4.bb => ofono_2.5.bb}                     | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.4.bb => ofono_2.5.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch b/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch
index 8a5a300adc..bb3ac6d8ea 100644
--- a/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch
+++ b/meta/recipes-connectivity/ofono/ofono/0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch
@@ -1,4 +1,4 @@
-From 22b52db4842611ac31a356f023fc09595384e2ad Mon Sep 17 00:00:00 2001
+From 2904457cb6cb91fe14a138f7e97e7437568e3133 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 23 May 2019 18:11:22 -0700
 Subject: [PATCH] mbim: add an optional TEMP_FAILURE_RETRY macro copy
@@ -31,6 +31,3 @@ index e159235..51693ea 100644
  enum mbim_control_message {
  	MBIM_OPEN_MSG = 0x1,
  	MBIM_CLOSE_MSG = 0x2,
--- 
-2.21.0
-
diff --git a/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch b/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch
index 3655b3fd66..9a7710b39b 100644
--- a/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch
+++ b/meta/recipes-connectivity/ofono/ofono/0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch
@@ -1,4 +1,4 @@
-From 76e4054801350ebd4a44057379431a33d460ad0f Mon Sep 17 00:00:00 2001
+From 090c45320a8eacf24e3b4d7cb2af513fbcf23f82 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 21 Apr 2021 11:01:34 +0000
 Subject: [PATCH] mbim: Fix build with ell-0.39 by restoring unlikely macro
@@ -12,7 +12,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/drivers/mbimmodem/mbim-private.h b/drivers/mbimmodem/mbim-private.h
-index 51693eae..d917312c 100644
+index 51693ea..d917312 100644
 --- a/drivers/mbimmodem/mbim-private.h
 +++ b/drivers/mbimmodem/mbim-private.h
 @@ -30,6 +30,10 @@
diff --git a/meta/recipes-connectivity/ofono/ofono_2.4.bb b/meta/recipes-connectivity/ofono/ofono_2.5.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.4.bb
rename to meta/recipes-connectivity/ofono/ofono_2.5.bb
index dae5cc3c25..b68eb99fa5 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.4.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.5.bb
@@ -13,7 +13,7 @@ SRC_URI = "\
     file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
     file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch \
 "
-SRC_URI[sha256sum] = "93580adc1afd1890dc516efb069de0c5cdfef014415256ddfb28ab172df2d11d"
+SRC_URI[sha256sum] = "0f4e0386318adba6a6a6135143fb5821ad3dfda4ffb7fa3786c7433f005b273f"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.42.0


--===============6722969172300781774==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ofono-upgrade-2.4-2.5.patch"

RnJvbSBhOGI5OWQ4MzE5NmNmMzljOTE0NTk4ZTI1MTBmODdlMDFiZjhhYTNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwNTo1NjozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9m
b25vOiB1cGdyYWRlIDIuNCAtPiAyLjUKCi0tLQogLi4uLW1iaW0tYWRkLWFuLW9wdGlvbmFsLVRF
TVBfRkFJTFVSRV9SRVRSWS1tYWNyby1jb3B5LnBhdGNoIHwgNSArLS0tLQogLi4uYmltLUZpeC1i
dWlsZC13aXRoLWVsbC0wLjM5LWJ5LXJlc3RvcmluZy11bmxpa2VseS1tLnBhdGNoIHwgNCArKy0t
CiAuLi4vb2Zvbm8ve29mb25vXzIuNC5iYiA9PiBvZm9ub18yLjUuYmJ9ICAgICAgICAgICAgICAg
ICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL3tvZm9ub18yLjQu
YmIgPT4gb2Zvbm9fMi41LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvb2Zvbm8vb2Zvbm8vMDAwMS1tYmltLWFkZC1hbi1vcHRpb25hbC1URU1QX0ZBSUxV
UkVfUkVUUlktbWFjcm8tY29weS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zv
bm8vb2Zvbm8vMDAwMS1tYmltLWFkZC1hbi1vcHRpb25hbC1URU1QX0ZBSUxVUkVfUkVUUlktbWFj
cm8tY29weS5wYXRjaAppbmRleCA4YTVhMzAwYWRjLi5iYjNhYzZkOGVhIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vLzAwMDEtbWJpbS1hZGQtYW4tb3B0
aW9uYWwtVEVNUF9GQUlMVVJFX1JFVFJZLW1hY3JvLWNvcHkucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9uby8wMDAxLW1iaW0tYWRkLWFuLW9wdGlvbmFsLVRF
TVBfRkFJTFVSRV9SRVRSWS1tYWNyby1jb3B5LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAy
MmI1MmRiNDg0MjYxMWFjMzFhMzU2ZjAyM2ZjMDk1OTUzODRlMmFkIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSAyOTA0NDU3Y2I2Y2I5MWZlMTRhMTM4ZjdlOTdlNzQzNzU2OGUzMTMzIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4KIERhdGU6IFRodSwgMjMgTWF5IDIwMTkgMTg6MTE6MjIgLTA3MDAKIFN1YmplY3Q6IFtQQVRD
SF0gbWJpbTogYWRkIGFuIG9wdGlvbmFsIFRFTVBfRkFJTFVSRV9SRVRSWSBtYWNybyBjb3B5CkBA
IC0zMSw2ICszMSwzIEBAIGluZGV4IGUxNTkyMzUuLjUxNjkzZWEgMTAwNjQ0CiAgZW51bSBtYmlt
X2NvbnRyb2xfbWVzc2FnZSB7CiAgCU1CSU1fT1BFTl9NU0cgPSAweDEsCiAgCU1CSU1fQ0xPU0Vf
TVNHID0gMHgyLAotLS0gCi0yLjIxLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9vZm9uby9vZm9uby8wMDAyLW1iaW0tRml4LWJ1aWxkLXdpdGgtZWxsLTAuMzktYnkt
cmVzdG9yaW5nLXVubGlrZWx5LW0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29m
b25vL29mb25vLzAwMDItbWJpbS1GaXgtYnVpbGQtd2l0aC1lbGwtMC4zOS1ieS1yZXN0b3Jpbmct
dW5saWtlbHktbS5wYXRjaAppbmRleCAzNjU1YjNmZDY2Li45YTc3MTBiMzliIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vLzAwMDItbWJpbS1GaXgtYnVp
bGQtd2l0aC1lbGwtMC4zOS1ieS1yZXN0b3JpbmctdW5saWtlbHktbS5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vLzAwMDItbWJpbS1GaXgtYnVpbGQtd2l0
aC1lbGwtMC4zOS1ieS1yZXN0b3JpbmctdW5saWtlbHktbS5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gNzZlNDA1NDgwMTM1MGViZDRhNDQwNTczNzk0MzFhMzNkNDYwYWQwZiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDkwYzQ1MzIwYThlYWNmMjRlM2I0ZDdjYjJhZjUxM2ZiY2Yy
M2Y4MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1hcnRpbiBKYW5zYSA8TWFydGlu
LkphbnNhQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMjEgQXByIDIwMjEgMTE6MDE6MzQgKzAwMDAK
IFN1YmplY3Q6IFtQQVRDSF0gbWJpbTogRml4IGJ1aWxkIHdpdGggZWxsLTAuMzkgYnkgcmVzdG9y
aW5nIHVubGlrZWx5IG1hY3JvCkBAIC0xMiw3ICsxMiw3IEBAIFNpZ25lZC1vZmYtYnk6IE1hcnRp
biBKYW5zYSA8TWFydGluLkphbnNhQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9kcml2ZXJzL21iaW1tb2RlbS9tYmltLXByaXZhdGUu
aCBiL2RyaXZlcnMvbWJpbW1vZGVtL21iaW0tcHJpdmF0ZS5oCi1pbmRleCA1MTY5M2VhZS4uZDkx
NzMxMmMgMTAwNjQ0CitpbmRleCA1MTY5M2VhLi5kOTE3MzEyIDEwMDY0NAogLS0tIGEvZHJpdmVy
cy9tYmltbW9kZW0vbWJpbS1wcml2YXRlLmgKICsrKyBiL2RyaXZlcnMvbWJpbW1vZGVtL21iaW0t
cHJpdmF0ZS5oCiBAQCAtMzAsNiArMzAsMTAgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi40LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9vZm9uby9vZm9ub18yLjUuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9vZm9ub18yLjQuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi41LmJiCmluZGV4IGRhZTVjYzNjMjUu
LmI2OGViOTlmYTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8v
b2Zvbm9fMi40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9f
Mi41LmJiCkBAIC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgPSAiXAogICAgIGZpbGU6Ly8wMDAxLW1i
aW0tYWRkLWFuLW9wdGlvbmFsLVRFTVBfRkFJTFVSRV9SRVRSWS1tYWNyby1jb3B5LnBhdGNoIFwK
ICAgICBmaWxlOi8vMDAwMi1tYmltLUZpeC1idWlsZC13aXRoLWVsbC0wLjM5LWJ5LXJlc3Rvcmlu
Zy11bmxpa2VseS1tLnBhdGNoIFwKICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5MzU4MGFkYzFh
ZmQxODkwZGM1MTZlZmIwNjlkZTBjNWNkZmVmMDE0NDE1MjU2ZGRmYjI4YWIxNzJkZjJkMTFkIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjBmNGUwMzg2MzE4YWRiYTZhNmE2MTM1MTQzZmI1ODIxYWQz
ZGZkYTRmZmI3ZmEzNzg2Yzc0MzNmMDA1YjI3M2YiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2Nv
bmZpZyB1cGRhdGUtcmMuZCBzeXN0ZW1kIGdvYmplY3QtaW50cm9zcGVjdGlvbi1kYXRhCiAKLS0g
CjIuNDIuMAoK

--===============6722969172300781774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ofono: PV changed from "2.4" to "2.5"
packages/core2-64-poky-linux/ofono: SRC_URI changed from "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.4.tar.xz file://ofono file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch" to "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.5.tar.xz file://ofono file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch"
packages/core2-64-poky-linux/ofono: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-64-poky-linux/ofono/ofono-dbg: PV changed from "2.4" to "2.5"
packages/core2-64-poky-linux/ofono/ofono-dbg: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-64-poky-linux/ofono/ofono-dbg: PKGSIZE changed from 6531120 to 6578840 (+1%)
packages/core2-64-poky-linux/ofono/ofono-dev: PV changed from "2.4" to "2.5"
packages/core2-64-poky-linux/ofono/ofono-dev: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-64-poky-linux/ofono/ofono-dev: PKGSIZE changed from 115920 to 116127 (+0%)
packages/core2-64-poky-linux/ofono/ofono-doc: PV changed from "2.4" to "2.5"
packages/core2-64-poky-linux/ofono/ofono-doc: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-64-poky-linux/ofono/ofono-locale: PV changed from "2.4" to "2.5"
packages/core2-64-poky-linux/ofono/ofono-locale: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-64-poky-linux/ofono/ofono-src: PV changed from "2.4" to "2.5"
packages/core2-64-poky-linux/ofono/ofono-src: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-64-poky-linux/ofono/ofono-src: FILELIST: directory renamed /usr/src/debug/ofono/2.4/drivers/iceramodem -> /usr/src/debug/ofono/2.5/drivers/iceramodem, directory renamed /usr/src/debug/ofono/2.4/drivers/telitmodem -> /usr/src/debug/ofono/2.5/drivers/telitmodem, directory renamed /usr/src/debug/ofono/2.4/drivers/ubloxmodem -> /usr/src/debug/ofono/2.5/drivers/ubloxmodem, directory renamed /usr/src/debug/ofono/2.4/drivers/atmodem -> /usr/src/debug/ofono/2.5/drivers/atmodem, directory renamed /usr/src/debug/ofono/2.4/gril -> /usr/src/debug/ofono/2.5/gril, directory renamed /usr/src/debug/ofono/2.4/drivers/dunmodem -> /usr/src/debug/ofono/2.5/drivers/dunmodem, directory renamed /usr/src/debug/ofono/2.4/drivers/huaweimodem -> /usr/src/debug/ofono/2.5/drivers/huaweimodem, directory renamed /usr/src/debug/ofono/2.4/drivers/hfpmodem -> /usr/src/debug/ofono/2.5/drivers/hfpmodem, directory renamed /usr/src/debug/ofono/2.4/drivers/hsomodem -> /usr/src/debug/ofono/2.5/drivers/hsomod
 em, directory renamed /usr/src/debug/ofono/2.4/drivers/ifxmodem -> /usr/src/debug/ofono/2.5/drivers/ifxmodem, directory renamed /usr/src/debug/ofono/2.4/drivers/nwmodem -> /usr/src/debug/ofono/2.5/drivers/nwmodem, directory renamed /usr/src/debug/ofono/2.4/drivers/isimodem -> /usr/src/debug/ofono/2.5/drivers/isimodem, directory renamed /usr/src/debug/ofono/2.4/drivers/mbmmodem -> /usr/src/debug/ofono/2.5/drivers/mbmmodem, directory renamed /usr/src/debug/ofono/2.4/drivers/rilmodem -> /usr/src/debug/ofono/2.5/drivers/rilmodem, directory renamed /usr/src/debug/ofono/2.4/linux -> /usr/src/debug/ofono/2.5/linux, directory renamed /usr/src/debug/ofono/2.4/drivers/swmodem -> /usr/src/debug/ofono/2.5/drivers/swmodem, directory renamed /usr/src/debug/ofono/2.4/gisi -> /usr/src/debug/ofono/2.5/gisi, directory renamed /usr/src/debug/ofono/2.4/gdbus -> /usr/src/debug/ofono/2.5/gdbus, directory renamed /usr/src/debug/ofono/2.4/drivers/gemaltomodem -> /usr/src/debug/ofono/2.5/drivers/gemaltomode
 m, directory renamed /usr/src/debug/ofono/2.4/drivers/calypsomodem -> /usr/src/debug/ofono/2.5/drivers/calypsomodem, directory renamed /usr/src/debug/ofono/2.4/drivers/quectelmodem -> /usr/src/debug/ofono/2.5/drivers/quectelmodem, directory renamed /usr/src/debug/ofono/2.4/drivers/speedupmodem -> /usr/src/debug/ofono/2.5/drivers/speedupmodem, directory renamed /usr/src/debug/ofono/2.4/drivers/stemodem -> /usr/src/debug/ofono/2.5/drivers/stemodem, directory renamed /usr/src/debug/ofono/2.4/src -> /usr/src/debug/ofono/2.5/src, directory renamed /usr/src/debug/ofono/2.4/gatchat -> /usr/src/debug/ofono/2.5/gatchat, directory renamed /usr/src/debug/ofono/2.4/drivers/ztemodem -> /usr/src/debug/ofono/2.5/drivers/ztemodem, directory renamed /usr/src/debug/ofono/2.4/drivers/mbimmodem -> /usr/src/debug/ofono/2.5/drivers/mbimmodem, directory renamed /usr/src/debug/ofono/2.4/drivers/xmm7modem -> /usr/src/debug/ofono/2.5/drivers/xmm7modem, directory renamed /usr/src/debug/ofono/2.4/include -> /u
 sr/src/debug/ofono/2.5/include, removed "/usr/src/debug/ofono/2.4/plugins/nokia-gpio.c /usr/src/debug/ofono/2.4/plugins/nokia-gpio.h /usr/src/debug/ofono/2.4/plugins/bluez5.h /usr/src/debug/ofono/2.4/plugins/telit.c /usr/src/debug/ofono/2.4/plugins/huawei.c /usr/src/debug/ofono/2.4/plugins/bluez5.c /usr/src/debug/ofono/2.4/plugins/rildev.c /usr/src/debug/ofono/2.4/drivers/qmimodem/location-reporting.c /usr/src/debug/ofono/2.4/drivers/qmimodem/wms.h /usr/src/debug/ofono/2.4/drivers/qmimodem/netmon.c /usr/src/debug/ofono/2.4/plugins/g1.c /usr/src/debug/ofono/2.4/plugins/phonesim.c /usr/src/debug/ofono/2.4/plugins/smart-messaging.c /usr/src/debug/ofono/2.4/drivers/qmimodem/voice.h /usr/src/debug/ofono/2.4/drivers/qmimodem/nas.h /usr/src/debug/ofono/2.4/drivers/qmimodem/nas.c /usr/src/debug/ofono/2.4/drivers/qmimodem/voicecall.c /usr/src/debug/ofono/2.4/plugins/allowed-apns.c /usr/src/debug/ofono/2.4/drivers/qmimodem/dms.h /usr/src/debug/ofono/2.4/plugins/n900.c /usr/src/debug/ofono/2.4
 /plugins/ublox.c /usr/src/debug/ofono/2.4/drivers/qmimodem/sms.c /usr/src/debug/ofono/2.4/plugins/dun_gw_bluez5.c /usr/src/debug/ofono/2.4/plugins/hfp_ag_bluez5.c /usr/src/debug/ofono/2.4/plugins/hfp_hf_bluez5.c /usr/src/debug/ofono/2.4/plugins/quectel.c /usr/src/debug/ofono/2.4/plugins/samsung.c /usr/src/debug/ofono/2.4/plugins/sim7100.c /usr/src/debug/ofono/2.4/plugins/speedup.c /usr/src/debug/ofono/2.4/plugins/alcatel.c /usr/src/debug/ofono/2.4/plugins/calypso.c /usr/src/debug/ofono/2.4/plugins/connman.c /usr/src/debug/ofono/2.4/plugins/gemalto.c /usr/src/debug/ofono/2.4/drivers/qmimodem/uim.h /usr/src/debug/ofono/2.4/plugins/wavecom.c /usr/src/debug/ofono/2.4/plugins/gobi.c /usr/src/debug/ofono/2.4/plugins/ril.c /usr/src/debug/ofono/2.4/plugins/hso.c /usr/src/debug/ofono/2.4/plugins/ril.h /usr/src/debug/ofono/2.4/plugins/cinterion.c /usr/src/debug/ofono/2.4/plugins/ste.c /usr/src/debug/ofono/2.4/plugins/udevng.c /usr/src/debug/ofono/2.4/plugins/upower.c /usr/src/debug/ofono/2.4/
 plugins/isiusb.c /usr/src/debug/ofono/2.4/plugins/sierra.c /usr/src/debug/ofono/2.4/plugins/sim900.c /usr/src/debug/ofono/2.4/plugins/stemgr.c /usr/src/debug/ofono/2.4/drivers/qmimodem/radio-settings.c /usr/src/debug/ofono/2.4/drivers/qmimodem/gprs-context.c /usr/src/debug/ofono/2.4/drivers/qmimodem/sim-legacy.c /usr/src/debug/ofono/2.4/plugins/ifx.c /usr/src/debug/ofono/2.4/plugins/infineon.c /usr/src/debug/ofono/2.4/plugins/droid.c /usr/src/debug/ofono/2.4/plugins/push-notification.c /usr/src/debug/ofono/2.4/plugins/mbim.c /usr/src/debug/ofono/2.4/plugins/nokia.c /usr/src/debug/ofono/2.4/drivers/qmimodem/ctl.h /usr/src/debug/ofono/2.4/drivers/qmimodem/ussd.c /usr/src/debug/ofono/2.4/drivers/qmimodem/sim.c /usr/src/debug/ofono/2.4/drivers/qmimodem/devinfo.c /usr/src/debug/ofono/2.4/plugins/mbm.c /usr/src/debug/ofono/2.4/drivers/qmimodem/network-registration.c /usr/src/debug/ofono/2.4/drivers/qmimodem/qmi.h /usr/src/debug/ofono/2.4/drivers/qmimodem/wds.h /usr/src/debug/ofono/2.4/dri
 vers/qmimodem/qmi.c /usr/src/debug/ofono/2.4/plugins/zte.c /usr/src/debug/ofono/2.4/plugins/ril_intel.c /usr/src/debug/ofono/2.4/plugins/icera.c /usr/src/debug/ofono/2.4/plugins/u8500.c /usr/src/debug/ofono/2.4/drivers/qmimodem/gprs.c /usr/src/debug/ofono/2.4/plugins/caif.c /usr/src/debug/ofono/2.4/drivers/qmimodem/util.h /usr/src/debug/ofono/2.4/plugins/xmm7xxx.c /usr/src/debug/ofono/2.4/plugins/linktop.c /usr/src/debug/ofono/2.4/plugins/novatel.c /usr/src/debug/ofono/2.4/plugins/palmpre.c /usr/src/debug/ofono/2.4/drivers/qmimodem/lte.c", added "/usr/src/debug/ofono/2.5/plugins/nokia-gpio.c /usr/src/debug/ofono/2.5/plugins/nokia-gpio.h /usr/src/debug/ofono/2.5/plugins/bluez5.h /usr/src/debug/ofono/2.5/plugins/telit.c /usr/src/debug/ofono/2.5/plugins/huawei.c /usr/src/debug/ofono/2.5/plugins/bluez5.c /usr/src/debug/ofono/2.5/plugins/rildev.c /usr/src/debug/ofono/2.5/drivers/qmimodem/location-reporting.c /usr/src/debug/ofono/2.5/drivers/qmimodem/wms.h /usr/src/debug/ofono/2.5/drivers
 /qmimodem/netmon.c /usr/src/debug/ofono/2.5/plugins/g1.c /usr/src/debug/ofono/2.5/plugins/phonesim.c /usr/src/debug/ofono/2.5/plugins/smart-messaging.c /usr/src/debug/ofono/2.5/drivers/qmimodem/voice.h /usr/src/debug/ofono/2.5/drivers/qmimodem/nas.h /usr/src/debug/ofono/2.5/drivers/qmimodem/nas.c /usr/src/debug/ofono/2.5/drivers/qmimodem/voicecall.c /usr/src/debug/ofono/2.5/plugins/allowed-apns.c /usr/src/debug/ofono/2.5/drivers/qmimodem/dms.h /usr/src/debug/ofono/2.5/plugins/n900.c /usr/src/debug/ofono/2.5/plugins/ublox.c /usr/src/debug/ofono/2.5/drivers/qmimodem/sms.c /usr/src/debug/ofono/2.5/plugins/dun_gw_bluez5.c /usr/src/debug/ofono/2.5/plugins/hfp_ag_bluez5.c /usr/src/debug/ofono/2.5/plugins/hfp_hf_bluez5.c /usr/src/debug/ofono/2.5/drivers/qmimodem/call-settings.c /usr/src/debug/ofono/2.5/plugins/quectel.c /usr/src/debug/ofono/2.5/plugins/samsung.c /usr/src/debug/ofono/2.5/plugins/sim7100.c /usr/src/debug/ofono/2.5/plugins/speedup.c /usr/src/debug/ofono/2.5/plugins/alcatel.c 
 /usr/src/debug/ofono/2.5/plugins/calypso.c /usr/src/debug/ofono/2.5/plugins/connman.c /usr/src/debug/ofono/2.5/plugins/gemalto.c /usr/src/debug/ofono/2.5/drivers/qmimodem/uim.h /usr/src/debug/ofono/2.5/plugins/wavecom.c /usr/src/debug/ofono/2.5/plugins/gobi.c /usr/src/debug/ofono/2.5/plugins/ril.c /usr/src/debug/ofono/2.5/plugins/hso.c /usr/src/debug/ofono/2.5/plugins/ril.h /usr/src/debug/ofono/2.5/plugins/cinterion.c /usr/src/debug/ofono/2.5/plugins/ste.c /usr/src/debug/ofono/2.5/plugins/udevng.c /usr/src/debug/ofono/2.5/plugins/upower.c /usr/src/debug/ofono/2.5/plugins/isiusb.c /usr/src/debug/ofono/2.5/plugins/sierra.c /usr/src/debug/ofono/2.5/plugins/sim900.c /usr/src/debug/ofono/2.5/plugins/stemgr.c /usr/src/debug/ofono/2.5/drivers/qmimodem/radio-settings.c /usr/src/debug/ofono/2.5/drivers/qmimodem/gprs-context.c /usr/src/debug/ofono/2.5/drivers/qmimodem/sim-legacy.c /usr/src/debug/ofono/2.5/plugins/ifx.c /usr/src/debug/ofono/2.5/plugins/infineon.c /usr/src/debug/ofono/2.5/drive
 rs/qmimodem/call-forwarding.c /usr/src/debug/ofono/2.5/plugins/droid.c /usr/src/debug/ofono/2.5/plugins/push-notification.c /usr/src/debug/ofono/2.5/plugins/mbim.c /usr/src/debug/ofono/2.5/plugins/nokia.c /usr/src/debug/ofono/2.5/drivers/qmimodem/ctl.h /usr/src/debug/ofono/2.5/drivers/qmimodem/ussd.c /usr/src/debug/ofono/2.5/drivers/qmimodem/call-barring.c /usr/src/debug/ofono/2.5/drivers/qmimodem/sim.c /usr/src/debug/ofono/2.5/drivers/qmimodem/devinfo.c /usr/src/debug/ofono/2.5/plugins/mbm.c /usr/src/debug/ofono/2.5/drivers/qmimodem/network-registration.c /usr/src/debug/ofono/2.5/drivers/qmimodem/qmi.h /usr/src/debug/ofono/2.5/drivers/qmimodem/wds.h /usr/src/debug/ofono/2.5/drivers/qmimodem/qmi.c /usr/src/debug/ofono/2.5/plugins/zte.c /usr/src/debug/ofono/2.5/plugins/ril_intel.c /usr/src/debug/ofono/2.5/plugins/icera.c /usr/src/debug/ofono/2.5/plugins/u8500.c /usr/src/debug/ofono/2.5/drivers/qmimodem/gprs.c /usr/src/debug/ofono/2.5/drivers/qmimodem/util.h /usr/src/debug/ofono/2.5/p
 lugins/linktop.c /usr/src/debug/ofono/2.5/plugins/novatel.c /usr/src/debug/ofono/2.5/plugins/palmpre.c /usr/src/debug/ofono/2.5/plugins/xmm7xxx.c /usr/src/debug/ofono/2.5/drivers/qmimodem/lte.c"
packages/core2-64-poky-linux/ofono/ofono-src: PKGSIZE changed from 4737332 to 4759394 (+0%)
packages/core2-64-poky-linux/ofono/ofono-staticdev: PV changed from "2.4" to "2.5"
packages/core2-64-poky-linux/ofono/ofono-staticdev: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-64-poky-linux/ofono/ofono-tests: PV changed from "2.4" to "2.5"
packages/core2-64-poky-linux/ofono/ofono-tests: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-64-poky-linux/ofono/ofono: PV changed from "2.4" to "2.5"
packages/core2-64-poky-linux/ofono/ofono: PKGV changed from 2.4 [default] to 2.5 [default]
packages/core2-64-poky-linux/ofono/ofono: PKGSIZE changed from 2195132 to 2206756 (+1%)

--===============6722969172300781774==--

