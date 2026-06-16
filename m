Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 510A5CD98D2
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 05:27:20 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.147790.1781587635571750948
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 22:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=R7tiwPYX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SXyNW5pW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019ecee5ea1e-5fa75d4c-d260-4852-b69e-28847909424b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781587634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FfHrbxCOHI5HONPLMPuHvRwjKWrRoKx0MqMBwkz3cHQ=;
	b=R7tiwPYXs/q0KOvApWepfFMFkCT5ENYQXsVeaDSrxTLZptbuqV2JxgzPko4CiW6B
	pSdAymj9FeLGmaapEO0LeoVUoEh8L4i+NoVd/n6rlfgc852m6SCz83or4ZBI1F1xYjL
	wq/+IU9iZGQ0708QMkpq5YgL3D9pqxKiSmjbFMBM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781587634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FfHrbxCOHI5HONPLMPuHvRwjKWrRoKx0MqMBwkz3cHQ=;
	b=SXyNW5pW+hk71CgwZuT+QnF86bfeQ31bYOPxWuiBnX0pifumellF6nWsAhKk7Dwv
	9Ee/E7kpRNj2UXP1YHPrvRvuu/p4ab0b0DkNoRThOv5hPLt0Fg5373kH5RdAOmtlso/
	ZOfMbNc4iXzrN8oSiHamNM3gZplr9ZmFpmsmy44g=
Content-Type: multipart/mixed; boundary="===============4745235572948128972=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.155.3 SUCCEEDED
Message-ID: <0101019ecee5ea1e-5fa75d4c-d260-4852-b69e-28847909424b-000000@us-west-2.amazonses.com>
Date: Tue, 16 Jun 2026 05:27:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 05:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238863

--===============4745235572948128972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.155.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.155.2-6.155.3.patch
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
From 92fa55553afc8eca303fb51dbc66439ac4a27fd4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Jun 2026 05:18:49 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.155.2 -> 6.155.3

---
 ...hon3-hypothesis_6.155.2.bb => python3-hypothesis_6.155.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.155.2.bb => python3-hypothesis_6.155.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.155.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.155.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.155.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.155.3.bb
index c828671ac8..abb280a948 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.155.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.155.3.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "ae36880287c9c5defe9f199d3d2b67d9947a4da2a46e6c57373cbdf2345b20e1"
+SRC_URI[sha256sum] = "1e34b17ae9873515384312cb7640abd773eb096c7eef8c0d9c614fa2c306e9bb"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============4745235572948128972==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.155.2-6.155.3.patch"

RnJvbSA5MmZhNTU1NTNhZmM4ZWNhMzAzZmI1MWRiYzY2NDM5YWM0YTI3ZmQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgSnVuIDIwMjYgMDU6MTg6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNTUuMiAtPiA2LjE1NS4zCgotLS0KIC4uLmhv
bjMtaHlwb3RoZXNpc182LjE1NS4yLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE1NS4zLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182
LjE1NS4yLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE1NS4zLmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTU1LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjE1NS4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTU1LjIuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTU1LjMu
YmIKaW5kZXggYzgyODY3MWFjOC4uYWJiMjgwYTk0OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNTUuMi5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE1NS4zLmJiCkBA
IC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwK
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhZTM2ODgwMjg3YzljNWRlZmU5ZjE5OWQz
ZDJiNjdkOTk0N2E0ZGEyYTQ2ZTZjNTczNzNjYmRmMjM0NWIyMGUxIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjFlMzRiMTdhZTk4NzM1MTUzODQzMTJjYjc2NDBhYmQ3NzNlYjA5NmM3ZWVmOGMwZDlj
NjE0ZmEyYzMwNmU5YmIiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0
cnMgXAotLSAKMi40Ny4xCgo=

--===============4745235572948128972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.155.2 [default] to 6.155.3 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.155.2.tar.gz;downloadfilename=hypothesis-6.155.2.tar.gz file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.155.3.tar.gz;downloadfilename=hypothesis-6.155.3.tar.gz file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.155.2" to "6.155.3"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.155.2 [default] to 6.155.3 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.155.2" to "6.155.3"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.155.2 [default] to 6.155.3 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.155.2" to "6.155.3"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.155.2 [default] to 6.155.3 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.155.2" to "6.155.3"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.155.2 [default] to 6.155.3 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.155.2" to "6.155.3"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.155.2 [default] to 6.155.3 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.155.2" to "6.155.3"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.155.2 [default] to 6.155.3 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.155.2" to "6.155.3"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.155.2 [default] to 6.155.3 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.155.2" to "6.155.3"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 3944608 to 3945319 (+0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.155.2 [default] to 6.155.3 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.155.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.155.3.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.155.2" to "6.155.3"
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.155.3.dist-info

--===============4745235572948128972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.155.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.155.3.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.155.3.dist-info

--===============4745235572948128972==--

