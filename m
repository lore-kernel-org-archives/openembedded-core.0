Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51312C35FF1
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:28 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.7168.1740828323633416534
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=er6p7JV6;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=t1QtSbhE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019551743bed-69cdf7ac-0489-405e-abcd-0408d958a7ab-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828327;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ekw7w05OiDyapCuFAhmbYnwJQ99KonWkOC+BC5g7HBY=;
	b=er6p7JV6j2CuCITxjTZCYcf4iojnEYaYTf3eHK+bLPvqWB9dsDfO4i7Xb0wcFrLn
	mi7ZU5inPEY9JbyQZT9cxywhaVc2KyNikliAVYDHj81owuiYk5riVfxX0EJO1oLAGSV
	A9UhTG3mfDyM/mqa13pi9hwdwfxqSQPUOmCS/8WU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828327;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ekw7w05OiDyapCuFAhmbYnwJQ99KonWkOC+BC5g7HBY=;
	b=t1QtSbhElSkUq6EWF1v4BkZ0uP/LsEEHza7ZnkNeLjHtPhoKbJMX28ZEvDTho1CX
	jISpIiGuGzi3zwZyveBoXpLW4EiSadPmDt1fHEirOEDzMwrD3r1XM59Ck2P0Saobvy/
	ZjwYFU0W0nm0cLqBCPQ9XE2tNsT/o0b8NNpPhDjw=
Content-Type: multipart/mixed; boundary="===============0045588943729846673=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyelftools: upgrading to 0.32 SUCCEEDED
Message-ID: <0101019551743bed-69cdf7ac-0489-405e-abcd-0408d958a7ab-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212128

--===============0045588943729846673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyelftools* to *0.32* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyelftools-upgrade-0.31-0.32.patch
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
From 8f109c0daa93966f716f9ef740b47ca3d4f6a0c8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 08:04:34 +0000
Subject: [PATCH] python3-pyelftools: upgrade 0.31 -> 0.32

---
 .../{python3-pyelftools_0.31.bb => python3-pyelftools_0.32.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyelftools_0.31.bb => python3-pyelftools_0.32.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.31.bb b/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pyelftools_0.31.bb
rename to meta/recipes-devtools/python/python3-pyelftools_0.32.bb
index 0774caafdb..13e9efff8d 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.31.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
 
-SRC_URI[sha256sum] = "c774416b10310156879443b81187d182d8d9ee499660380e645918b50bc88f99"
+SRC_URI[sha256sum] = "6de90ee7b8263e740c8715a925382d4099b354f29ac48ea40d840cf7aa14ace5"
 
 PYPI_PACKAGE = "pyelftools"
 
-- 
2.44.1


--===============0045588943729846673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pyelftools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyelftools/pyelftools-0.31.tar.gz;downloadfilename=pyelftools-0.31.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyelftools/pyelftools-0.32.tar.gz;downloadfilename=pyelftools-0.32.tar.gz"
packages/core2-64-poky-linux/python3-pyelftools: PV changed from "0.31" to "0.32"
packages/core2-64-poky-linux/python3-pyelftools: PKGV changed from 0.31 [default] to 0.32 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-dbg: PV changed from "0.31" to "0.32"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-dbg: PKGV changed from 0.31 [default] to 0.32 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-dev: PV changed from "0.31" to "0.32"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-dev: PKGV changed from 0.31 [default] to 0.32 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-doc: PV changed from "0.31" to "0.32"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-doc: PKGV changed from 0.31 [default] to 0.32 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-locale: PV changed from "0.31" to "0.32"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-locale: PKGV changed from 0.31 [default] to 0.32 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-src: PV changed from "0.31" to "0.32"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-src: PKGV changed from 0.31 [default] to 0.32 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-staticdev: PV changed from "0.31" to "0.32"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools-staticdev: PKGV changed from 0.31 [default] to 0.32 [default]
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools: PKGSIZE changed from 1377881 to 1440394 (+5%)
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools: PV changed from "0.31" to "0.32"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pyelftools-0.31.dist-info -> /usr/lib/python3.13/site-packages/pyelftools-0.32.dist-info, added "/usr/lib/python3.13/site-packages/elftools/dwarf/__pycache__/typeunit.cpython-313.pyc /usr/lib/python3.13/site-packages/elftools/dwarf/typeunit.py"
packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools: PKGV changed from 0.31 [default] to 0.32 [default]
Changes to packages/core2-64-poky-linux/python3-pyelftools (sysroot):
  /usr/lib/python3.13/site-packages/pyelftools-0.31.dist-info moved to /usr/lib/python3.13/site-packages/pyelftools-0.32.dist-info
  /usr/lib/python3.13/site-packages/elftools/dwarf/__pycache__/typeunit.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/elftools/dwarf/typeunit.py was added

--===============0045588943729846673==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyelftools-upgrade-0.31-0.32.patch"

RnJvbSA4ZjEwOWMwZGFhOTM5NjZmNzE2ZjllZjc0MGI0N2NhM2Q0ZjZhMGM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwODowNDozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHllbGZ0b29sczogdXBncmFkZSAwLjMxIC0+IDAuMzIKCi0tLQogLi4uL3tweXRob24z
LXB5ZWxmdG9vbHNfMC4zMS5iYiA9PiBweXRob24zLXB5ZWxmdG9vbHNfMC4zMi5iYn0gIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWVsZnRvb2xzXzAuMzEuYmIg
PT4gcHl0aG9uMy1weWVsZnRvb2xzXzAuMzIuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5ZWxmdG9vbHNfMC4zMS5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWVsZnRvb2xzXzAuMzIuYmIKc2ltaWxh
cml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXB5ZWxmdG9vbHNfMC4zMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5ZWxmdG9vbHNfMC4zMi5iYgppbmRleCAwNzc0Y2FhZmRiLi4xM2U5
ZWZmZjhkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHllbGZ0b29sc18wLjMxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1weWVsZnRvb2xzXzAuMzIuYmIKQEAgLTQsNyArNCw3IEBAIFNFQ1RJT04gPSAiZGV2ZWwv
cHl0aG9uIgogTElDRU5TRSA9ICJQRCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0U7bWQ1PTVjZTJhMmIwN2ZjYTMyNmJjN2MxNDZkMTAxMDVjY2ZjIgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiYzc3NDQxNmIxMDMxMDE1Njg3OTQ0M2I4MTE4N2QxODJkOGQ5ZWU0OTk2NjAzODBl
NjQ1OTE4YjUwYmM4OGY5OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2ZGU5MGVlN2I4MjYzZTc0
MGM4NzE1YTkyNTM4MmQ0MDk5YjM1NGYyOWFjNDhlYTQwZDg0MGNmN2FhMTRhY2U1IgogCiBQWVBJ
X1BBQ0tBR0UgPSAicHllbGZ0b29scyIKIAotLSAKMi40NC4xCgo=

--===============0045588943729846673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pyelftools/python3-pyelftools: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pyelftools-0.31.dist-info -> /usr/lib/python3.13/site-packages/pyelftools-0.32.dist-info, added "/usr/lib/python3.13/site-packages/elftools/dwarf/typeunit.py /usr/lib/python3.13/site-packages/elftools/dwarf/__pycache__/typeunit.cpython-313.pyc"
Changes to packages/core2-64-poky-linux/python3-pyelftools (sysroot):
  /usr/lib/python3.13/site-packages/pyelftools-0.31.dist-info moved to /usr/lib/python3.13/site-packages/pyelftools-0.32.dist-info
  /usr/lib/python3.13/site-packages/elftools/dwarf/__pycache__/typeunit.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/elftools/dwarf/typeunit.py was added

--===============0045588943729846673==--

