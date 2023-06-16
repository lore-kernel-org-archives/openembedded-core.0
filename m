Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059D9C27C41
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.829.1686887483527884075
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ICK/UFYM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010188c254452d-d385f5f6-3109-4777-ae33-37cfe7541518-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hT+x5E5Ccg9UACqHKdVbQiKL/vhJEV+qrRc1pO1AZ7c=;
	b=ICK/UFYMbrye5k64ZKkdsQFcduEVR+c/AZtLjNkZig8Mnk7QI2ydD+CagYhAx1Ft
	YVJBw34hR5sUWwgrntYdmnHlH0OimAu3oEkAxX4HNJOWyGAg1Q+Hr3vNu6FdWjCgchW
	2ljzL8AU0kMngB0Jhya2cRrnbPsq8QNlNir+80ug=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hT+x5E5Ccg9UACqHKdVbQiKL/vhJEV+qrRc1pO1AZ7c=;
	b=dN87Zhw7TG3nSsfcdVG3i64YzqHgmcGp6iiADCmfgO/kzBGyylmU5HBlLoaiPAPd
	oqwiMbMrAdMUN7z1mgPpplv384mdm8Tqo4A1W4cYb5MdxhNN72Nrze1bTcuX8Q1aV57
	jTAorrKD03976+1W2Bl1bgwCkJGrOROLcqgj2s4Q=
Content-Type: multipart/mixed; boundary="===============5463147238350112841=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.78.2 SUCCEEDED
Message-ID: <01010188c254452d-d385f5f6-3109-4777-ae33-37cfe7541518-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182927

--===============5463147238350112841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.78.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.75.7-6.78.2.patch
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
From dfc556280e04533bea068d734b0bd78cf55a667d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 13:17:26 +0000
Subject: [PATCH] python3-hypothesis: upgrade 6.75.7 -> 6.78.2

---
 ...ython3-hypothesis_6.75.7.bb => python3-hypothesis_6.78.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.75.7.bb => python3-hypothesis_6.78.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb b/meta/recipes-devtools/python/python3-hypothesis_6.78.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.78.2.bb
index dc21bc67c6..6e51b4db2c 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.78.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "a8ef2e0c7d5ebd90043a4ed8f6987de6a2b497b2caf6863364ff41db25971856"
+SRC_URI[sha256sum] = "117a46fb50f4a388eb43fedae1403ba495bcf92adc891422d4a7977357ae3bb2"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.39.2


--===============5463147238350112841==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.75.7-6.78.2.patch"

RnJvbSBkZmM1NTYyODBlMDQ1MzNiZWEwNjhkNzM0YjBiZDc4Y2Y1NWE2NjdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTM6MTc6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi43NS43IC0+IDYuNzguMgoKLS0tCiAuLi55dGhv
bjMtaHlwb3RoZXNpc182Ljc1LjcuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuNzguMi5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWh5cG90aGVzaXNfNi43
NS43LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182Ljc4LjIuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi43NS43
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi43
OC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuNzUuNy5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi43OC4yLmJiCmluZGV4
IGRjMjFiYzY3YzYuLjZlNTFiNGRiMmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuNzUuNy5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182Ljc4LjIuYmIKQEAgLTEzLDcgKzEz
LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vdGVzdF9ybGUucHkgXAogICAgICIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImE4ZWYyZTBjN2Q1ZWJkOTAwNDNhNGVkOGY2OTg3ZGU2YTJi
NDk3YjJjYWY2ODYzMzY0ZmY0MWRiMjU5NzE4NTYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTE3
YTQ2ZmI1MGY0YTM4OGViNDNmZWRhZTE0MDNiYTQ5NWJjZjkyYWRjODkxNDIyZDRhNzk3NzM1N2Fl
M2JiMiIKIAogUkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9uMy1hdHRycyBcCi0tIAoy
LjM5LjIKCg==

--===============5463147238350112841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.75.7" to "6.78.2"
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.75.7.tar.gz;downloadfilename=hypothesis-6.75.7.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.78.2.tar.gz;downloadfilename=hypothesis-6.78.2.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.75.7 [default] to 6.78.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.75.7" to "6.78.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.75.7 [default] to 6.78.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.75.7" to "6.78.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.75.7 [default] to 6.78.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.75.7" to "6.78.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.75.7 [default] to 6.78.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.75.7" to "6.78.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.75.7 [default] to 6.78.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.75.7" to "6.78.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.75.7 [default] to 6.78.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.75.7" to "6.78.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.75.7 [default] to 6.78.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.75.7" to "6.78.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.75.7 [default] to 6.78.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.75.7" to "6.78.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.75.7 [default] to 6.78.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2864008 to 2883588 (+1%)
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.75.7.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.78.2.dist-info

--===============5463147238350112841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.75.7.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.78.2.dist-info

--===============5463147238350112841==--

