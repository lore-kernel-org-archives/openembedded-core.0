Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C2ECD98E2
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:49 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50615.1781195505093330079
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ifhqeDg1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dErcu5c8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019eb7867b00-c50fa23a-7adc-492a-a2d7-22c72a239aa7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195504;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=npjApkzDhZfhdSpHK7k8KbmFgJU23qmsTnVm7DmBElw=;
	b=ifhqeDg1+sxODS9Q/g7kaald9Ubz/7YG6iVP9mEJb5xcwtDuO1nq/RLaCx8vNR1B
	GLRcUgI+yqOz3sfmfqC9ngKTnOuQmZyyTbEpfK6lc5S+EDdnZGwaHXt4CqcECSY8bJ/
	kIs27vhfhvqpi6LzdSjZrwWey8D03vcUL+5haj/0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195504;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=npjApkzDhZfhdSpHK7k8KbmFgJU23qmsTnVm7DmBElw=;
	b=dErcu5c8u2rD/OY2TL/Lm39DcFDgvTjwOuUbDB88ZaD/m9FLEA0BG61/jym3ieJJ
	X5NXMiyr/5tTZapg2pcOxnjw7U9UrInpefVV1tGeYv9uHc8J8KCP/rpuv6PmJTpEtVZ
	PWsGDFFIkQa6FCzO/b1RG/TWbwau8HuoRZmKwA+w=
Content-Type: multipart/mixed; boundary="===============0558131454265549950=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.155.2 SUCCEEDED
Message-ID: <0101019eb7867b00-c50fa23a-7adc-492a-a2d7-22c72a239aa7-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238493

--===============0558131454265549950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.155.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.152.4-6.155.2.patch
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
From c8fcbaaeb56b232f6f37618c3c970dcc2d9420f2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 09:33:04 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.152.4 -> 6.155.2

---
 ...hon3-hypothesis_6.152.4.bb => python3-hypothesis_6.155.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.152.4.bb => python3-hypothesis_6.155.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb b/meta/recipes-devtools/python/python3-hypothesis_6.155.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.155.2.bb
index f08e0bad79..c828671ac8 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.155.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "31c8f9ce619716f543e2710b489b1633c833586641d9e6c94cee03f109a5afc4"
+SRC_URI[sha256sum] = "ae36880287c9c5defe9f199d3d2b67d9947a4da2a46e6c57373cbdf2345b20e1"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============0558131454265549950==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.152.4-6.155.2.patch"

RnJvbSBjOGZjYmFhZWI1NmIyMzJmNmYzNzYxOGMzYzk3MGRjYzJkOTQyMGYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMDk6MzM6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi4xNTIuNCAtPiA2LjE1NS4yCgotLS0KIC4uLmhv
bjMtaHlwb3RoZXNpc182LjE1Mi40LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE1NS4yLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182
LjE1Mi40LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjE1NS4yLmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTUyLjQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNp
c182LjE1NS4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTUyLjQuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTU1LjIu
YmIKaW5kZXggZjA4ZTBiYWQ3OS4uYzgyODY3MWFjOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNTIuNC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE1NS4yLmJiCkBA
IC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgZmlsZTovL3Rlc3RfcmxlLnB5IFwK
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzMWM4ZjljZTYxOTcxNmY1NDNlMjcxMGI0
ODliMTYzM2M4MzM1ODY2NDFkOWU2Yzk0Y2VlMDNmMTA5YTVhZmM0IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImFlMzY4ODAyODdjOWM1ZGVmZTlmMTk5ZDNkMmI2N2Q5OTQ3YTRkYTJhNDZlNmM1NzM3
M2NiZGYyMzQ1YjIwZTEiCiAKIFJERVBFTkRTOiR7UE59ICs9ICIgXAogICAgIHB5dGhvbjMtYXR0
cnMgXAotLSAKMi40Ny4xCgo=

--===============0558131454265549950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.152.4.tar.gz;downloadfilename=hypothesis-6.152.4.tar.gz file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.155.2.tar.gz;downloadfilename=hypothesis-6.155.2.tar.gz file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.152.4" to "6.155.2"
packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.152.4 [default] to 6.155.2 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.152.4" to "6.155.2"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.152.4 [default] to 6.155.2 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.152.4" to "6.155.2"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.152.4 [default] to 6.155.2 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.152.4" to "6.155.2"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.152.4 [default] to 6.155.2 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.152.4" to "6.155.2"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.152.4 [default] to 6.155.2 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.152.4" to "6.155.2"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.152.4 [default] to 6.155.2 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.152.4" to "6.155.2"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.152.4 [default] to 6.155.2 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.152.4" to "6.155.2"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.152.4 [default] to 6.155.2 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.152.4.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.152.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info/licenses, added "/usr/lib/python3.14/site-packages/hypothesis/internal/statistics.py /usr/lib/python3.14/site-packages/hypothesis/internal/__pycache__/statistics.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.152.4" to "6.155.2"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 3855563 to 3944608 (+2%)
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.152.4 [default] to 6.155.2 [default]
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.152.4.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info
  /usr/lib/python3.14/site-packages/hypothesis/internal/__pycache__/statistics.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/hypothesis/internal/statistics.py was added

--===============0558131454265549950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.152.4.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.152.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info/licenses, added "/usr/lib/python3.14/site-packages/hypothesis/internal/__pycache__/statistics.cpython-314.pyc /usr/lib/python3.14/site-packages/hypothesis/internal/statistics.py"
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.152.4.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.155.2.dist-info
  /usr/lib/python3.14/site-packages/hypothesis/internal/__pycache__/statistics.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/hypothesis/internal/statistics.py was added

--===============0558131454265549950==--

