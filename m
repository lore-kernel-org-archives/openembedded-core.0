Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60A0C48291
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:07 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.4621.1704114718669803253
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XM7XESKo;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nEUhu5mq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018cc5270be7-bd05f4a9-b410-4a1d-86b1-d28194836fc3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114719;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tj7LFFAJesf+JNfFDLemrZ7FOPUKm5BQigHyD8amr0U=;
	b=XM7XESKoEOPCa8JO7ltAhhCMcFyeMqETLfbT/Eio8vlnb9FZdRVWuk5pd7fowMF3
	ZYiWu5W3NNS8OCOYHDlcI1tgecan7y7rBohMhEHWWecVvltp7OkSyJ7uy+90BhookxS
	1sblbacA5OSCKGZ0RKCR6Ttb2rNbu9Fza8k21eGc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114719;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tj7LFFAJesf+JNfFDLemrZ7FOPUKm5BQigHyD8amr0U=;
	b=nEUhu5mqKsZMr30PGGsA1OYGMsrOj5D85NPcAtXhJOkkBXbR/hxLYsT+auMHy+22
	9/KwmwaOSTzN2CYZykujRpJOBJkBIB9Nhi2tN9VgicDHkkyDHAUQ08f4IbQ4RGnyalp
	uqZ/pKApsTjNJy+dZGSvpxX+i89sS2LsCeAbGmXw=
Content-Type: multipart/mixed; boundary="===============0005592009061173912=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] subversion: upgrading to 1.14.3 SUCCEEDED
Message-ID: <0101018cc5270be7-bd05f4a9-b410-4a1d-86b1-d28194836fc3-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193137

--===============0005592009061173912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *subversion* to *1.14.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-subversion-upgrade-1.14.2-1.14.3.patch
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
From da712a37f7b925e47f5e0932f5c5cbbee7d71b50 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 08:23:28 +0000
Subject: [PATCH] subversion: upgrade 1.14.2 -> 1.14.3

---
 .../subversion/subversion/serfmacro.patch                | 9 ++++++---
 .../{subversion_1.14.2.bb => subversion_1.14.3.bb}       | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion_1.14.2.bb => subversion_1.14.3.bb} (97%)

diff --git a/meta/recipes-devtools/subversion/subversion/serfmacro.patch b/meta/recipes-devtools/subversion/subversion/serfmacro.patch
index 507de0f08b..a52b8565ff 100644
--- a/meta/recipes-devtools/subversion/subversion/serfmacro.patch
+++ b/meta/recipes-devtools/subversion/subversion/serfmacro.patch
@@ -1,3 +1,8 @@
+From 1ad0c5a76d6f67a7643c0edc506e1df108362417 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 7 Dec 2016 13:54:18 +0000
+Subject: [PATCH] subversion: Fix issues in LDFLAGS sed manipulation
+
 The existing sed expression can match expressions like
 --sysroot=/some/path/xxx-linux/ which clearly isn't intended and injects
 incorrect paths into LDFLAGS.
@@ -9,6 +14,7 @@ Upstream-Status: Pending
 
 Rebase 1.12.0
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  build/ac-macros/serf.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -26,6 +32,3 @@ index 0a549b3..3a069ac 100644
            break
          else
            AC_MSG_RESULT([no])
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/subversion/subversion_1.14.2.bb b/meta/recipes-devtools/subversion/subversion_1.14.3.bb
similarity index 97%
rename from meta/recipes-devtools/subversion/subversion_1.14.2.bb
rename to meta/recipes-devtools/subversion/subversion_1.14.3.bb
index ba208d922f..1cf4e1734b 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.2.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://serfmacro.patch \
            "
 
-SRC_URI[sha256sum] = "c9130e8d0b75728a66f0e7038fc77052e671830d785b5616aad53b4810d3cc28"
+SRC_URI[sha256sum] = "949efd451a09435f7e8573574c71c7b71b194d844890fa49cd61d2262ea1a440"
 
 inherit autotools pkgconfig gettext python3native
 
-- 
2.42.0


--===============0005592009061173912==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-subversion-upgrade-1.14.2-1.14.3.patch"

RnJvbSBkYTcxMmEzN2Y3YjkyNWU0N2Y1ZTA5MzJmNWM1Y2JiZWU3ZDcxYjUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAwODoyMzoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN1
YnZlcnNpb246IHVwZ3JhZGUgMS4xNC4yIC0+IDEuMTQuMwoKLS0tCiAuLi4vc3VidmVyc2lvbi9z
dWJ2ZXJzaW9uL3NlcmZtYWNyby5wYXRjaCAgICAgICAgICAgICAgICB8IDkgKysrKysrLS0tCiAu
Li4ve3N1YnZlcnNpb25fMS4xNC4yLmJiID0+IHN1YnZlcnNpb25fMS4xNC4zLmJifSAgICAgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9zdWJ2ZXJzaW9uL3tzdWJ2ZXJzaW9uXzEuMTQu
Mi5iYiA9PiBzdWJ2ZXJzaW9uXzEuMTQuMy5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvc3VidmVyc2lvbi9zdWJ2ZXJzaW9uL3NlcmZtYWNyby5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9zdWJ2ZXJzaW9uL3N1YnZlcnNpb24vc2VyZm1hY3JvLnBhdGNo
CmluZGV4IDUwN2RlMGYwOGIuLmE1MmI4NTY1ZmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9zdWJ2ZXJzaW9uL3N1YnZlcnNpb24vc2VyZm1hY3JvLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9zdWJ2ZXJzaW9uL3N1YnZlcnNpb24vc2VyZm1hY3JvLnBhdGNoCkBA
IC0xLDMgKzEsOCBAQAorRnJvbSAxYWQwYzVhNzZkNmY2N2E3NjQzYzBlZGM1MDZlMWRmMTA4MzYy
NDE3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1Lmpp
YUB3aW5kcml2ZXIuY29tPgorRGF0ZTogV2VkLCA3IERlYyAyMDE2IDEzOjU0OjE4ICswMDAwCitT
dWJqZWN0OiBbUEFUQ0hdIHN1YnZlcnNpb246IEZpeCBpc3N1ZXMgaW4gTERGTEFHUyBzZWQgbWFu
aXB1bGF0aW9uCisKIFRoZSBleGlzdGluZyBzZWQgZXhwcmVzc2lvbiBjYW4gbWF0Y2ggZXhwcmVz
c2lvbnMgbGlrZQogLS1zeXNyb290PS9zb21lL3BhdGgveHh4LWxpbnV4LyB3aGljaCBjbGVhcmx5
IGlzbid0IGludGVuZGVkIGFuZCBpbmplY3RzCiBpbmNvcnJlY3QgcGF0aHMgaW50byBMREZMQUdT
LgpAQCAtOSw2ICsxNCw3IEBAIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwogCiBSZWJhc2UgMS4x
Mi4wCiBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+
CisKIC0tLQogIGJ1aWxkL2FjLW1hY3Jvcy9zZXJmLm00IHwgMiArLQogIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQpAQCAtMjYsNiArMzIsMyBAQCBpbmRleCAw
YTU0OWIzLi4zYTA2OWFjIDEwMDY0NAogICAgICAgICAgICBicmVhawogICAgICAgICAgZWxzZQog
ICAgICAgICAgICBBQ19NU0dfUkVTVUxUKFtub10pCi0tLSAKLTIuNy40Ci0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdWJ2ZXJzaW9uL3N1YnZlcnNpb25fMS4xNC4yLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3N1YnZlcnNpb24vc3VidmVyc2lvbl8xLjE0LjMuYmIKc2lt
aWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N1YnZl
cnNpb24vc3VidmVyc2lvbl8xLjE0LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9zdWJ2ZXJzaW9uL3N1YnZlcnNpb25fMS4xNC4zLmJiCmluZGV4IGJhMjA4ZDkyMmYuLjFjZjRl
MTczNGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdWJ2ZXJzaW9uL3N1YnZl
cnNpb25fMS4xNC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdWJ2ZXJzaW9uL3N1
YnZlcnNpb25fMS4xNC4zLmJiCkBAIC0xMiw3ICsxMiw3IEBAIFNSQ19VUkkgPSAiJHtBUEFDSEVf
TUlSUk9SfS8ke0JQTn0vJHtCUE59LSR7UFZ9LnRhci5iejIgXAogICAgICAgICAgICBmaWxlOi8v
c2VyZm1hY3JvLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
YzkxMzBlOGQwYjc1NzI4YTY2ZjBlNzAzOGZjNzcwNTJlNjcxODMwZDc4NWI1NjE2YWFkNTNiNDgx
MGQzY2MyOCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5NDllZmQ0NTFhMDk0MzVmN2U4NTczNTc0
YzcxYzdiNzFiMTk0ZDg0NDg5MGZhNDljZDYxZDIyNjJlYTFhNDQwIgogCiBpbmhlcml0IGF1dG90
b29scyBwa2djb25maWcgZ2V0dGV4dCBweXRob24zbmF0aXZlCiAKLS0gCjIuNDIuMAoK

--===============0005592009061173912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/subversion: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-64-poky-linux/subversion: SRC_URI changed from "https://archive.apache.org/dist/subversion/subversion-1.14.2.tar.bz2 file://serfmacro.patch" to "https://archive.apache.org/dist/subversion/subversion-1.14.3.tar.bz2 file://serfmacro.patch"
packages/core2-64-poky-linux/subversion: PV changed from "1.14.2" to "1.14.3"
packages/core2-64-poky-linux/subversion/subversion-dbg: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-64-poky-linux/subversion/subversion-dbg: PV changed from "1.14.2" to "1.14.3"
packages/core2-64-poky-linux/subversion/subversion-dbg: PKGSIZE changed from 14761416 to 14761744 (+0%)
packages/core2-64-poky-linux/subversion/subversion-dev: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-64-poky-linux/subversion/subversion-dev: PV changed from "1.14.2" to "1.14.3"
packages/core2-64-poky-linux/subversion/subversion-doc: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-64-poky-linux/subversion/subversion-doc: PV changed from "1.14.2" to "1.14.3"
packages/core2-64-poky-linux/subversion/subversion-locale-de: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-de: PV changed from "1.14.2" to "1.14.3"
packages/core2-64-poky-linux/subversion/subversion-locale-es: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-es: PV changed from "1.14.2" to "1.14.3"
packages/core2-64-poky-linux/subversion/subversion-locale-fr: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-fr: PV changed from "1.14.2" to "1.14.3"
packages/core2-64-poky-linux/subversion/subversion-locale-it: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-it: PV changed from "1.14.2" to "1.14.3"
packages/core2-64-poky-linux/subversion/subversion-locale-ja: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-ja: PV changed from "1.14.2" to "1.14.3"
packages/core2-64-poky-linux/subversion/subversion-locale-ko: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-ko: PV changed from "1.14.2" to "1.14.3"
packages/core2-64-poky-linux/subversion/subversion-locale-nb: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-nb: PV changed from "1.14.2" to "1.14.3"
packages/core2-64-poky-linux/subversion/subversion-locale-pl: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-pl: PV changed from "1.14.2" to "1.14.3"
packages/core2-64-poky-linux/subversion/subversion-locale-pt-br: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-pt-br: PV changed from "1.14.2" to "1.14.3"
packages/core2-64-poky-linux/subversion/subversion-locale-sv: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-sv: PV changed from "1.14.2" to "1.14.3"
packages/core2-64-poky-linux/subversion/subversion-locale-zh-cn: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-zh-cn: PV changed from "1.14.2" to "1.14.3"
packages/core2-64-poky-linux/subversion/subversion-locale-zh-tw: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-64-poky-linux/subversion/subversion-locale-zh-tw: PV changed from "1.14.2" to "1.14.3"
packages/core2-64-poky-linux/subversion/subversion-src: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-64-poky-linux/subversion/subversion-src: PV changed from "1.14.2" to "1.14.3"
packages/core2-64-poky-linux/subversion/subversion-src: PKGSIZE changed from 19958486 to 19958533 (+0%)
packages/core2-64-poky-linux/subversion/subversion-staticdev: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-64-poky-linux/subversion/subversion-staticdev: PV changed from "1.14.2" to "1.14.3"
packages/core2-64-poky-linux/subversion/subversion: PKGV changed from 1.14.2 [default] to 1.14.3 [default]
packages/core2-64-poky-linux/subversion/subversion: PV changed from "1.14.2" to "1.14.3"

--===============0005592009061173912==--

