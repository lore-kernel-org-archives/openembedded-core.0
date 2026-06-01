Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54344CD6E57
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:39 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1553.1780328129208539660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WFO2cLK3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ihOKUTPb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019e83d38473-2c67a7e1-eb18-4cef-bcc1-4e2a3c07749b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328138;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QN9lHW4TR/KFR7KImauJPyVr8U/1rKdn0LRH7ysys+c=;
	b=WFO2cLK3ha9P+bxMX0WeCXWDwFiIMX/PvPX15ddj4JZkOn9NQcuSzEYqfs0vulbO
	9+ivY7cYS04EUFLIsdvbWFTSvyZpNyj78iQgKjBa49qNCaR0ZU4Xn+4fA3kphaSSNbB
	vy4j3YenkpmmdDFayiNjmrJvlHz9R0+6/ul9P4QI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328138;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QN9lHW4TR/KFR7KImauJPyVr8U/1rKdn0LRH7ysys+c=;
	b=ihOKUTPb0RDMegjX/HJr6meCVxpo126vV4a5nR+f4GaVtqb0TNXaj/5HxJ01n2Xe
	RwIhGpu1opjL7T2cNAc1Gw3b++OOkzt/6X+Iwd9W+BThiWx7CXtlWE8+tSXuK8jXy9x
	d3PpOH7n4h5pOWsySQWjZtzTZNVQ4ShpTomRhWIo=
Content-Type: multipart/mixed; boundary="===============8277798383739567246=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.155.1 SUCCEEDED
Message-ID: <0101019e83d38473-2c67a7e1-eb18-4cef-bcc1-4e2a3c07749b-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237881

--===============8277798383739567246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hypothesis* to *6.155.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.152.4-6.155.1.patch
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
From 203d8df30166447007b6f47576051b45f7fe7add Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 08:30:12 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.152.4 -> 6.155.1

---
 ...hon3-hypothesis_6.152.4.bb => python3-hypothesis_6.155.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.152.4.bb => python3-hypothesis_6.155.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb b/meta/recipes-devtools/python/python3-hypothesis_6.155.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.155.1.bb
index f08e0bad79..2728e6ba7c 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.152.4.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.155.1.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "31c8f9ce619716f543e2710b489b1633c833586641d9e6c94cee03f109a5afc4"
+SRC_URI[sha256sum] = "07c102031612b98d7c1be15ca3608c43e1234d9d07e3a190a53fa01536700196"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.47.1


--===============8277798383739567246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.152.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.155.1.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.152.4.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.155.1.dist-info, added "/usr/lib/python3.14/site-packages/hypothesis/internal/statistics.py /usr/lib/python3.14/site-packages/hypothesis/internal/__pycache__/statistics.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.152.4.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.155.1.dist-info
  /usr/lib/python3.14/site-packages/hypothesis/internal/__pycache__/statistics.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/hypothesis/internal/statistics.py was added

--===============8277798383739567246==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.152.4-6.155.1.patch"

RnJvbSAyMDNkOGRmMzAxNjY0NDcwMDdiNmY0NzU3NjA1MWI0NWY3ZmU3YWRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAwODozMDoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaHlwb3RoZXNpczogdXBncmFkZSA2LjE1Mi40IC0+IDYuMTU1LjEKCi0tLQogLi4uaG9u
My1oeXBvdGhlc2lzXzYuMTUyLjQuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTU1LjEuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oeXBvdGhlc2lzXzYu
MTUyLjQuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTU1LjEuYmJ9ICg5MSUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4x
NTIuNC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lz
XzYuMTU1LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNTIuNC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi4xNTUuMS5i
YgppbmRleCBmMDhlMGJhZDc5Li4yNzI4ZTZiYTdjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjE1Mi40LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuMTU1LjEuYmIKQEAg
LTEzLDcgKzEzLDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vdGVzdF9ybGUucHkgXAog
ICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjMxYzhmOWNlNjE5NzE2ZjU0M2UyNzEwYjQ4
OWIxNjMzYzgzMzU4NjY0MWQ5ZTZjOTRjZWUwM2YxMDlhNWFmYzQiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMDdjMTAyMDMxNjEyYjk4ZDdjMWJlMTVjYTM2MDhjNDNlMTIzNGQ5ZDA3ZTNhMTkwYTUz
ZmEwMTUzNjcwMDE5NiIKIAogUkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9uMy1hdHRy
cyBcCi0tIAoyLjQ3LjEKCg==

--===============8277798383739567246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.152.4.tar.gz;downloadfilename=hypothesis-6.152.4.tar.gz file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.155.1.tar.gz;downloadfilename=hypothesis-6.155.1.tar.gz file://test_binary_search.py file://test_rle.py"
packages/x86-64-v3-poky-linux/python3-hypothesis: PV changed from "6.152.4" to "6.155.1"
packages/x86-64-v3-poky-linux/python3-hypothesis: PKGV changed from 6.152.4 [default] to 6.155.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.152.4" to "6.155.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.152.4 [default] to 6.155.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.152.4" to "6.155.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.152.4 [default] to 6.155.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.152.4" to "6.155.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.152.4 [default] to 6.155.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.152.4" to "6.155.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.152.4 [default] to 6.155.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.152.4" to "6.155.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.152.4 [default] to 6.155.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.152.4" to "6.155.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.152.4 [default] to 6.155.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.152.4" to "6.155.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.152.4 [default] to 6.155.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.152.4" to "6.155.1"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.152.4 [default] to 6.155.1 [default]
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.152.4.dist-info -> /usr/lib/python3.14/site-packages/hypothesis-6.155.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/hypothesis-6.152.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/hypothesis-6.155.1.dist-info/licenses, added "/usr/lib/python3.14/site-packages/hypothesis/internal/__pycache__/statistics.cpython-314.pyc /usr/lib/python3.14/site-packages/hypothesis/internal/statistics.py"
packages/x86-64-v3-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 3855563 to 3942436 (+2%)
Changes to packages/x86-64-v3-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.14/site-packages/hypothesis-6.152.4.dist-info moved to /usr/lib/python3.14/site-packages/hypothesis-6.155.1.dist-info
  /usr/lib/python3.14/site-packages/hypothesis/internal/__pycache__/statistics.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/hypothesis/internal/statistics.py was added

--===============8277798383739567246==--

