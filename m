Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8645CDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 05:09:17 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36453.1782104955220011939
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jun 2026 22:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Fp1ol4Y/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GFvpu7X2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019eedbb9493-d3b3855d-6f60-45d9-827b-b1934f341696-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782104954;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Y3E0SzPHLtXHlfg5ehoxsAXtCnKW/ph6SeJ2Br5qkv4=;
	b=Fp1ol4Y/olaGgDaYsQO/0GDCw/VfTlSrOr/F+w56/4x2lNmPCr1bDavkHnz/J2P4
	rjLTO+8AE4sS0s+Ts4IR5DoASsv8wmnTBTyrwWGE+SUz+b3y149k9xJLmRu9ht9sxKW
	xHk/c0jiWL2DNO9v1jXxQCkfPoRdq5txL0qdhElU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782104954;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Y3E0SzPHLtXHlfg5ehoxsAXtCnKW/ph6SeJ2Br5qkv4=;
	b=GFvpu7X24Hr6PyYwlhEFJBabORSw4rH7kDQz0vRSHC6vNfsq5TDhCsBVxeGh0Vq5
	UJvdr+CKJXp6jXax+/wIZdahJm9MtB7OTq/5Rv5QMwwAsy/EopHav1gK7jQYc0WGOaM
	0Gpp/RJMP06NNPA7aJnGSbLMOmNG78NEuXT/O/So=
Content-Type: multipart/mixed; boundary="===============8316884477692044730=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.155.7 SUCCEEDED
Message-ID: <0101019eedbb9493-d3b3855d-6f60-45d9-827b-b1934f341696-000000@us-west-2.amazonses.com>
Date: Mon, 22 Jun 2026 05:09:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.22-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 05:09:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239264

--===============8316884477692044730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.155.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.155.2-6.155.7.patch
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
From 7002498e190cbd4def597b1049ae8d0330e796f9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 22 Jun 2026 05:07:03 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.155.2 -> 6.155.7

---
 ...hon3-hypothesis_6.155.2.bb => python3-hypothesis_6.155.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.155.2.bb => python3-hypothesis_6.155.7.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.155.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.155.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb
index c828671ac8..70ae7877a1 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.155.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.155.7.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "ae36880287c9c5defe9f199d3d2b67d9947a4da2a46e6c57373cbdf2345b20e1"
+SRC_URI[sha256sum] = "d8d6091753d0669db3c90c5e5b346cb37c72f3dd9378c8413acb1fd5da63f7ea"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============8316884477692044730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.155.2" to "6.155.7"
packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.155.2.tar.gz;downloadfilename=hypothesis-6.155.2.tar.gz file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.155.7.tar.gz;downloadfilename=hypothesis-6.155.7.tar.gz file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.155.2 [default] to 6.155.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.155.2" to "6.155.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.155.2 [default] to 6.155.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.155.2" to "6.155.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.155.2 [default] to 6.155.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.155.2" to "6.155.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.155.2 [default] to 6.155.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.155.2" to "6.155.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.155.2 [default] to 6.155.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.155.2" to "6.155.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.155.2 [default] to 6.155.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.155.2" to "6.155.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.155.2 [default] to 6.155.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.155.2" to "6.155.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.155.2 [default] to 6.155.7 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.155.2" to "6.155.7"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 3944608 to 3946788 (+0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.155.7.dist-info, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.155.7.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.155.2 [default] to 6.155.7 [default]
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.155.7.dist-info

--===============8316884477692044730==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.155.2-6.155.7.patch"

RnJvbSA3MDAyNDk4ZTE5MGNiZDRkZWY1OTdiMTA0OWFlOGQwMzMwZTc5NmY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMjIgSnVuIDIwMjYgMDU6MDc6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNTUuMiAtPiA2LjE1NS43CgotLS0KIC4uLmhv
bjMtaHlwb3RoZXNpc182LjE1NS4yLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE1NS43LmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182
LjE1NS4yLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE1NS43LmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTU1LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjE1NS43LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTU1LjIuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTU1Ljcu
YmIKaW5kZXggYzgyODY3MWFjOC4uNzBhZTc4NzdhMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNTUuMi5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE1NS43LmJiCkBA
IC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwK
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhZTM2ODgwMjg3YzljNWRlZmU5ZjE5OWQz
ZDJiNjdkOTk0N2E0ZGEyYTQ2ZTZjNTczNzNjYmRmMjM0NWIyMGUxIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImQ4ZDYwOTE3NTNkMDY2OWRiM2M5MGM1ZTViMzQ2Y2IzN2M3MmYzZGQ5Mzc4Yzg0MTNh
Y2IxZmQ1ZGE2M2Y3ZWEiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0
cnMgXAotLSAKMi40Ny4xCgo=

--===============8316884477692044730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.155.7.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.155.7.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.155.7.dist-info

--===============8316884477692044730==--

