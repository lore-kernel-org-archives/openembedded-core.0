Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4541EED602
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:37:59 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.103053.1767267471985687349
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=tr6ptiJh;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=MBZpbi65;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019b79599b9e-c269da71-a325-47d4-8c50-f71ed5059549-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267474;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=h3/WUUE1yo8EqZvrdRTVUYwyKqIeaJfdq6bS/UbERNI=;
	b=tr6ptiJhivWqij122dXOnfTcQ5DGzdtBicfeCSkwjTGO7Fc7iY+XdpA0njBFJs5I
	wyka2pGTwTlWUZfAOVqZXWtBdd8kRwZApwex0g8mFOJdvYS762sKEvBmhHw9GJNj7E8
	xsqqhgYL29EB6RvyrSkaI8DeojxlkIXcuIGzN+1Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267474;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=h3/WUUE1yo8EqZvrdRTVUYwyKqIeaJfdq6bS/UbERNI=;
	b=MBZpbi65JSQ8W6auSP46FI11V1HHW3cG6PRcH18nMhsgBimJe4jeXy/XbCmalyvW
	tjLmKaiql4ey3anrOMBfSoKKH74rHujxsnJtn+9rOD5aLtAWhJIpAULiQNN/lhHXvgN
	kRPW6PN67L5mXyAcFZab1rweY96/Xmy1DDuAx9lo=
Content-Type: multipart/mixed; boundary="===============4173231287450521780=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyparsing: upgrading to 3.3.1 SUCCEEDED
Message-ID: <0101019b79599b9e-c269da71-a325-47d4-8c50-f71ed5059549-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228776

--===============4173231287450521780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyparsing* to *3.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyparsing-upgrade-3.2.5-3.3.1.patch
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
From 5cb178a44a574748fe35a655416f26ca85c6f6fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 08:03:05 +0000
Subject: [PATCH] python3-pyparsing: upgrade 3.2.5 -> 3.3.1

---
 ...ng_3.2.5.bb => python3-pyparsing_3.3.1.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.2.5.bb => python3-pyparsing_3.3.1.bb} (47%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.2.5.bb b/meta/recipes-devtools/python/python3-pyparsing_3.3.1.bb
similarity index 47%
rename from meta/recipes-devtools/python/python3-pyparsing_3.2.5.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.3.1.bb
index e94bebae38..476f789eda 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.2.5.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.3.1.bb
@@ -1,3 +1,22 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,3 +1,5 @@
+# +Copyright (c) 2003-2025  Paul McGuire
+# +
+#  Permission is hereby granted, free of charge, to any person obtaining
+#  a copy of this software and associated documentation files (the
+#  "Software"), to deal in the Software without restriction, including
+# 
+#
+
 SUMMARY = "Python parsing module"
 DESCRIPTION = "The pyparsing module is an alternative approach to creating \
 and executing simple grammars, vs. the traditional lex/yacc approach, or \
@@ -8,9 +27,9 @@ HOMEPAGE = "https://github.com/pyparsing/pyparsing/"
 BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9c8a9625037eff2407f8456010875183"
 
-SRC_URI[sha256sum] = "2df8d5b7b2802ef88e8d016a2eb9c7aeaa923529cd251ed0fe4608275d4105b6"
+SRC_URI[sha256sum] = "47fad0f17ac1e2cad3de3b458570fbc9b03560aa029ed5e16ee5554da9a2251c"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============4173231287450521780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyparsing: PKGV changed from 3.2.5 [default] to 3.3.1 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing: PV changed from "3.2.5" to "3.3.1"
packages/x86-64-v3-poky-linux/python3-pyparsing: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyparsing/pyparsing-3.2.5.tar.gz;downloadfilename=pyparsing-3.2.5.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyparsing/pyparsing-3.3.1.tar.gz;downloadfilename=pyparsing-3.3.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-dbg: PV changed from "3.2.5" to "3.3.1"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-dbg: PKGV changed from 3.2.5 [default] to 3.3.1 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-dev: PV changed from "3.2.5" to "3.3.1"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-dev: PKGV changed from 3.2.5 [default] to 3.3.1 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-doc: PV changed from "3.2.5" to "3.3.1"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-doc: PKGV changed from 3.2.5 [default] to 3.3.1 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-locale: PV changed from "3.2.5" to "3.3.1"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-locale: PKGV changed from 3.2.5 [default] to 3.3.1 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-src: PV changed from "3.2.5" to "3.3.1"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-src: PKGV changed from 3.2.5 [default] to 3.3.1 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-staticdev: PV changed from "3.2.5" to "3.3.1"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing-staticdev: PKGV changed from 3.2.5 [default] to 3.3.1 [default]
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing: PV changed from "3.2.5" to "3.3.1"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing: PKGSIZE changed from 929285 to 972028 (+5%)
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pyparsing-3.2.5.dist-info -> /usr/lib/python3.13/site-packages/pyparsing-3.3.1.dist-info, directory renamed /usr/lib/python3.13/site-packages/pyparsing-3.2.5.dist-info/licenses -> /usr/lib/python3.13/site-packages/pyparsing-3.3.1.dist-info/licenses, added "/usr/lib/python3.13/site-packages/pyparsing/ai/show_best_practices/__init__.py /usr/lib/python3.13/site-packages/pyparsing/ai/__init__.py /usr/lib/python3.13/site-packages/pyparsing/ai/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/pyparsing/ai/best_practices.md /usr/lib/python3.13/site-packages/pyparsing/ai/show_best_practices/__pycache__/__main__.cpython-313.pyc /usr/lib/python3.13/site-packages/pyparsing/ai/show_best_practices/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/pyparsing/ai/show_best_practices/__main__.py"
packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing: PKGV changed from 3.2.5 [default] to 3.3.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pyparsing (sysroot):
  /usr/lib/python3.13/site-packages/pyparsing-3.2.5.dist-info moved to /usr/lib/python3.13/site-packages/pyparsing-3.3.1.dist-info
  /usr/lib/python3.13/site-packages/pyparsing/ai was added
  /usr/lib/python3.13/site-packages/pyparsing/ai/best_practices.md was added
  /usr/lib/python3.13/site-packages/pyparsing/ai/__init__.py was added
  /usr/lib/python3.13/site-packages/pyparsing/ai/__pycache__ was added
  /usr/lib/python3.13/site-packages/pyparsing/ai/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pyparsing/ai/show_best_practices was added
  /usr/lib/python3.13/site-packages/pyparsing/ai/show_best_practices/__init__.py was added
  /usr/lib/python3.13/site-packages/pyparsing/ai/show_best_practices/__main__.py was added
  /usr/lib/python3.13/site-packages/pyparsing/ai/show_best_practices/__pycache__ was added
  /usr/lib/python3.13/site-packages/pyparsing/ai/show_best_practices/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pyparsing/ai/show_best_practices/__pycache__/__main__.cpython-313.pyc was added

--===============4173231287450521780==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyparsing-upgrade-3.2.5-3.3.1.patch"

RnJvbSA1Y2IxNzhhNDRhNTc0NzQ4ZmUzNWE2NTU0MTZmMjZjYTg1YzZmNmZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAwODowMzowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlwYXJzaW5nOiB1cGdyYWRlIDMuMi41IC0+IDMuMy4xCgotLS0KIC4uLm5nXzMuMi41
LmJiID0+IHB5dGhvbjMtcHlwYXJzaW5nXzMuMy4xLmJifSB8IDIzICsrKysrKysrKysrKysrKysr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlwYXJzaW5nXzMuMi41
LmJiID0+IHB5dGhvbjMtcHlwYXJzaW5nXzMuMy4xLmJifSAoNDclKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXBhcnNpbmdfMy4yLjUuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlwYXJzaW5nXzMuMy4xLmJiCnNp
bWlsYXJpdHkgaW5kZXggNDclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1weXBhcnNpbmdfMy4yLjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1weXBhcnNpbmdfMy4zLjEuYmIKaW5kZXggZTk0YmViYWUzOC4u
NDc2Zjc4OWVkYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXB5cGFyc2luZ18zLjIuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHlwYXJzaW5nXzMuMy4xLmJiCkBAIC0xLDMgKzEsMjIgQEAKKyMgRklYTUU6IHRo
ZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1
cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBv
bGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNF
IHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29t
bWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNl
bnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6
CisjCisjIC0tLSBMSUNFTlNFCisjICsrKyBMSUNFTlNFCisjIEBAIC0xLDMgKzEsNSBAQAorIyAr
Q29weXJpZ2h0IChjKSAyMDAzLTIwMjUgIFBhdWwgTWNHdWlyZQorIyArCisjICBQZXJtaXNzaW9u
IGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5p
bmcKKyMgIGEgY29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRp
b24gZmlsZXMgKHRoZQorIyAgIlNvZnR3YXJlIiksIHRvIGRlYWwgaW4gdGhlIFNvZnR3YXJlIHdp
dGhvdXQgcmVzdHJpY3Rpb24sIGluY2x1ZGluZworIyAKKyMKKwogU1VNTUFSWSA9ICJQeXRob24g
cGFyc2luZyBtb2R1bGUiCiBERVNDUklQVElPTiA9ICJUaGUgcHlwYXJzaW5nIG1vZHVsZSBpcyBh
biBhbHRlcm5hdGl2ZSBhcHByb2FjaCB0byBjcmVhdGluZyBcCiBhbmQgZXhlY3V0aW5nIHNpbXBs
ZSBncmFtbWFycywgdnMuIHRoZSB0cmFkaXRpb25hbCBsZXgveWFjYyBhcHByb2FjaCwgb3IgXApA
QCAtOCw5ICsyNyw5IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9weXBhcnNpbmcv
cHlwYXJzaW5nLyIKIEJVR1RSQUNLRVIgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5cGFyc2luZy9w
eXBhcnNpbmcvaXNzdWVzIgogCiBMSUNFTlNFID0gIk1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PTY1N2E1NjYyMzM4ODg1MTNlMWYwN2JhMTNlMmY0N2YxIgorTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9OWM4YTk2MjUwMzdlZmYyNDA3Zjg0
NTYwMTA4NzUxODMiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyZGY4ZDViN2IyODAyZWY4OGU4
ZDAxNmEyZWI5YzdhZWFhOTIzNTI5Y2QyNTFlZDBmZTQ2MDgyNzVkNDEwNWI2IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjQ3ZmFkMGYxN2FjMWUyY2FkM2RlM2I0NTg1NzBmYmM5YjAzNTYwYWEwMjll
ZDVlMTZlZTU1NTRkYTlhMjI1MWMiCiAKIGluaGVyaXQgcHlwaSBweXRob25fZmxpdF9jb3JlCiAK
LS0gCjIuNDcuMQoK

--===============4173231287450521780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pyparsing/python3-pyparsing: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pyparsing-3.2.5.dist-info -> /usr/lib/python3.13/site-packages/pyparsing-3.3.1.dist-info, directory renamed /usr/lib/python3.13/site-packages/pyparsing-3.2.5.dist-info/licenses -> /usr/lib/python3.13/site-packages/pyparsing-3.3.1.dist-info/licenses, added "/usr/lib/python3.13/site-packages/pyparsing/ai/best_practices.md /usr/lib/python3.13/site-packages/pyparsing/ai/show_best_practices/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/pyparsing/ai/__init__.py /usr/lib/python3.13/site-packages/pyparsing/ai/show_best_practices/__pycache__/__main__.cpython-313.pyc /usr/lib/python3.13/site-packages/pyparsing/ai/show_best_practices/__main__.py /usr/lib/python3.13/site-packages/pyparsing/ai/show_best_practices/__init__.py /usr/lib/python3.13/site-packages/pyparsing/ai/__pycache__/__init__.cpython-313.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-pyparsing (sysroot):
  /usr/lib/python3.13/site-packages/pyparsing-3.2.5.dist-info moved to /usr/lib/python3.13/site-packages/pyparsing-3.3.1.dist-info
  /usr/lib/python3.13/site-packages/pyparsing/ai was added
  /usr/lib/python3.13/site-packages/pyparsing/ai/best_practices.md was added
  /usr/lib/python3.13/site-packages/pyparsing/ai/__init__.py was added
  /usr/lib/python3.13/site-packages/pyparsing/ai/__pycache__ was added
  /usr/lib/python3.13/site-packages/pyparsing/ai/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pyparsing/ai/show_best_practices was added
  /usr/lib/python3.13/site-packages/pyparsing/ai/show_best_practices/__init__.py was added
  /usr/lib/python3.13/site-packages/pyparsing/ai/show_best_practices/__main__.py was added
  /usr/lib/python3.13/site-packages/pyparsing/ai/show_best_practices/__pycache__ was added
  /usr/lib/python3.13/site-packages/pyparsing/ai/show_best_practices/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pyparsing/ai/show_best_practices/__pycache__/__main__.cpython-313.pyc was added

--===============4173231287450521780==--

