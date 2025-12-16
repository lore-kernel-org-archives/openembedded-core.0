Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D572BD5C0CE
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:23 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17387.1765872133847192755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JwHIDlmF;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Miu+jwzO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019b262e82bb-cc81ed31-2431-45e4-9c86-90b492acee35-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872141;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IAhFn0vSh7sbCyZYgnf6hThFBIrv24KFi13SuqsY37g=;
	b=JwHIDlmFjVtIGT+O6UpxRuKq4TlSjcE/Ybkz8sYHqDhr7H2s2fUgEEIEH8yMQV4/
	sclq3dtVZQWBLI71NQd9vfwYyQUH4bGNkDMlHbjeUJyrHdAM/aKZRhnp7ZUjrA8pd8H
	JJoVJ6/MI4qKJSpfD0ikIkb2GXuz1EKeykxsBSbM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872141;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IAhFn0vSh7sbCyZYgnf6hThFBIrv24KFi13SuqsY37g=;
	b=Miu+jwzO5COaUh/zKDYJIYl1+bjNHzZ7etnDjcm5AXLXXU7jtTcUSN5xsqzYVkXO
	B8Q2gw/8GROXKC/aXrxoV7gOyp/lpXCUeut71IV83SIgGD45KRKLA19Gi4zOTDMDZbb
	wd+PrkHJAL56xdXgxwMqeTwJ/O1c26jRfw2lT5xM=
Content-Type: multipart/mixed; boundary="===============4108962615701113946=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.148.7 SUCCEEDED
Message-ID: <0101019b262e82bb-cc81ed31-2431-45e4-9c86-90b492acee35-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227803

--===============4108962615701113946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.148.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.148.5-6.148.7.patch
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
From 9986d32eaf0919e1c9baeb82049967520a9054f7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 23:48:03 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.148.5 -> 6.148.7

---
 ...hon3-hypothesis_6.148.5.bb => python3-hypothesis_6.148.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.148.5.bb => python3-hypothesis_6.148.7.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb b/meta/recipes-devtools/python/python3-hypothesis_6.148.7.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.148.7.bb
index b461e8f9b6..a8c0421025 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.148.5.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.148.7.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "bb0c67bff155b8d8cfe8fbc1f1218028f7e2f0ee7f24d8ccc89f4c14ee4e65c0"
+SRC_URI[sha256sum] = "b96e817e715c5b1a278411e3b9baf6d599d5b12207ba25e41a8f066929f6c2a6"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============4108962615701113946==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.148.5-6.148.7.patch"

RnJvbSA5OTg2ZDMyZWFmMDkxOWUxYzliYWViODIwNDk5Njc1MjBhOTA1NGY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMjM6NDg6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNDguNSAtPiA2LjE0OC43CgotLS0KIC4uLmhv
bjMtaHlwb3RoZXNpc182LjE0OC41LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE0OC43LmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182
LjE0OC41LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE0OC43LmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTQ4LjUuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjE0OC43LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTQ4LjUuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTQ4Ljcu
YmIKaW5kZXggYjQ2MWU4ZjliNi4uYThjMDQyMTAyNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNDguNS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE0OC43LmJiCkBA
IC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwK
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiYjBjNjdiZmYxNTViOGQ4Y2ZlOGZiYzFm
MTIxODAyOGY3ZTJmMGVlN2YyNGQ4Y2NjODlmNGMxNGVlNGU2NWMwIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImI5NmU4MTdlNzE1YzViMWEyNzg0MTFlM2I5YmFmNmQ1OTlkNWIxMjIwN2JhMjVlNDFh
OGYwNjY5MjlmNmMyYTYiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0
cnMgXAotLSAKMi40Ny4xCgo=

--===============4108962615701113946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.13/site-packages/hypothesis-6.148.5.dist-info -> /usr/lib/python3.13/site-packages/hypothesis-6.148.7.dist-info, directory renamed /usr/lib/python3.13/site-packages/hypothesis-6.148.5.dist-info/licenses -> /usr/lib/python3.13/site-packages/hypothesis-6.148.7.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.13/site-packages/hypothesis-6.148.5.dist-info moved to /usr/lib/python3.13/site-packages/hypothesis-6.148.7.dist-info

--===============4108962615701113946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.148.5.tar.gz;downloadfilename=hypothesis-6.148.5.tar.gz file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.148.7.tar.gz;downloadfilename=hypothesis-6.148.7.tar.gz file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.148.5" to "6.148.7"
packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.148.5 [default] to 6.148.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.148.5" to "6.148.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.148.5 [default] to 6.148.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.148.5" to "6.148.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.148.5 [default] to 6.148.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.148.5" to "6.148.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.148.5 [default] to 6.148.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.148.5" to "6.148.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.148.5 [default] to 6.148.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.148.5" to "6.148.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.148.5 [default] to 6.148.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.148.5" to "6.148.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.148.5 [default] to 6.148.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.148.5" to "6.148.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.148.5 [default] to 6.148.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.148.5" to "6.148.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 3585342 to 3590302 (+0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.13/site-packages/hypothesis-6.148.5.dist-info/licenses -> /usr/lib/python3.13/site-packages/hypothesis-6.148.7.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/hypothesis-6.148.5.dist-info -> /usr/lib/python3.13/site-packages/hypothesis-6.148.7.dist-info
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.148.5 [default] to 6.148.7 [default]
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.13/site-packages/hypothesis-6.148.5.dist-info moved to /usr/lib/python3.13/site-packages/hypothesis-6.148.7.dist-info

--===============4108962615701113946==--

