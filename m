Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836DFCD98E4
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 05:56:46 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1562.1781935002686079801
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 22:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PSN/FMTc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=vdNMGljf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019ee39a5d9f-efc97ca9-06c5-48d7-803e-22b2fc734884-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781935005;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VNAzeV3FFEC1iY4HUG35M0PMuJj74N69HXMpz0iQMX8=;
	b=PSN/FMTcQVMGunaNBw20fRiVAP0EWkKfWA+abJCHAm+VeAjzcw/mMKQMihyqbIDQ
	6VC9tRO/Hd+6mbwSnxWAeKD91Yidco2fHyvxI6zZQe5ATwKpxQlbFNjlQPA2KxHGc/F
	oWl8lkosnbCfM52bC6YvMmjxVdqDfauxT7kVLDDA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781935005;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VNAzeV3FFEC1iY4HUG35M0PMuJj74N69HXMpz0iQMX8=;
	b=vdNMGljfCgEkdQoP5DaK0o9nDMFmyO5XS+aXJlhk/xiA0BCRS7yyRwMl/lak2mNn
	lPIHtM+AW6tz70CTrcA64V/qX1NajbbA8FpQ/L50u7TjPFqQ7u2QF0g+S7oWCOGtryf
	pW4pqoHLMxS0DQpLPGl+Ffpxxg2N7jhzmdzHdHos=
Content-Type: multipart/mixed; boundary="===============3084182505329473432=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.155.6 SUCCEEDED
Message-ID: <0101019ee39a5d9f-efc97ca9-06c5-48d7-803e-22b2fc734884-000000@us-west-2.amazonses.com>
Date: Sat, 20 Jun 2026 05:56:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.20-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 05:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239197

--===============3084182505329473432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.155.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.155.2-6.155.6.patch
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
From 664ea3e4548f78491614b7e62b9ebc0e03698c57 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 20 Jun 2026 05:14:48 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.155.2 -> 6.155.6

---
 ...hon3-hypothesis_6.155.2.bb => python3-hypothesis_6.155.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.155.2.bb => python3-hypothesis_6.155.6.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.155.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.155.6.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.155.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.155.6.bb
index c828671ac8..23eff48932 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.155.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.155.6.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "ae36880287c9c5defe9f199d3d2b67d9947a4da2a46e6c57373cbdf2345b20e1"
+SRC_URI[sha256sum] = "7569e1897690336c85d49d8391b49ec6ab83d951009515bfc29faebbac286cf5"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============3084182505329473432==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.155.2-6.155.6.patch"

RnJvbSA2NjRlYTNlNDU0OGY3ODQ5MTYxNGI3ZTYyYjllYmMwZTAzNjk4YzU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjAgSnVuIDIwMjYgMDU6MTQ6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNTUuMiAtPiA2LjE1NS42CgotLS0KIC4uLmhv
bjMtaHlwb3RoZXNpc182LjE1NS4yLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE1NS42LmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182
LjE1NS4yLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE1NS42LmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTU1LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjE1NS42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTU1LjIuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTU1LjYu
YmIKaW5kZXggYzgyODY3MWFjOC4uMjNlZmY0ODkzMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNTUuMi5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE1NS42LmJiCkBA
IC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwK
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhZTM2ODgwMjg3YzljNWRlZmU5ZjE5OWQz
ZDJiNjdkOTk0N2E0ZGEyYTQ2ZTZjNTczNzNjYmRmMjM0NWIyMGUxIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjc1NjllMTg5NzY5MDMzNmM4NWQ0OWQ4MzkxYjQ5ZWM2YWI4M2Q5NTEwMDk1MTViZmMy
OWZhZWJiYWMyODZjZjUiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0
cnMgXAotLSAKMi40Ny4xCgo=

--===============3084182505329473432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.155.2" to "6.155.6"
packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.155.2 [default] to 6.155.6 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.155.2.tar.gz;downloadfilename=hypothesis-6.155.2.tar.gz file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.155.6.tar.gz;downloadfilename=hypothesis-6.155.6.tar.gz file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.155.2" to "6.155.6"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.155.2 [default] to 6.155.6 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.155.2" to "6.155.6"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.155.2 [default] to 6.155.6 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.155.2" to "6.155.6"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.155.2 [default] to 6.155.6 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.155.2" to "6.155.6"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.155.2 [default] to 6.155.6 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.155.2" to "6.155.6"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.155.2 [default] to 6.155.6 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.155.2" to "6.155.6"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.155.2 [default] to 6.155.6 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.155.2" to "6.155.6"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.155.2 [default] to 6.155.6 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.155.2" to "6.155.6"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.155.2 [default] to 6.155.6 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 3944608 to 3946034 (+0%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.155.6.dist-info, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.155.6.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.155.6.dist-info

--===============3084182505329473432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.155.6.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.155.6.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.155.6.dist-info

--===============3084182505329473432==--

