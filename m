Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED18E65293
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:13:10 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29048.1769951560882154712
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IUi+lL3R;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jDagk9mJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c1955ccd5-8cca019e-358c-4ae0-b3e8-f1f5e8d59391-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951579;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6x5cZcoXItBTn/dDTjbfVfEhn98LLJ6SAwCu3p4fzVw=;
	b=IUi+lL3RfG3P1afgDTcx2F+t1ddex46xoiWPhOQPwTFlaFV5rlFJ2Elg8jsPyPF1
	cCoyn6AdwGKKFsnb44ofYwgYwV7Lfm41G1uVwmqxwiR+FhT4rLuIL7Cp+il76UEZa3b
	l8aBcaGuI3GzTuaBLhC6MLzV+yupWLoDk+2wQjvI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951579;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6x5cZcoXItBTn/dDTjbfVfEhn98LLJ6SAwCu3p4fzVw=;
	b=jDagk9mJEcw4rd3nM8VgFOmM/eGFg1NZrri6+RslNhBn44QTb2BjVbA/CC4EgC06
	zMqgt+0Q+f/n5ZoaWHuJcbeYxzCHWSHzgd73tVj91IRN7iMh/Y43+3lo7/YygNaOq8p
	QZuU+xCawVJciFztae7D4br6mUQdBcDRFh25lH4s=
Content-Type: multipart/mixed; boundary="===============4032049017174830451=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 311 SUCCEEDED
Message-ID: <0101019c1955ccd5-8cca019e-358c-4ae0-b3e8-f1f5e8d59391-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230321

--===============4032049017174830451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *311* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-306-311.patch
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
From f7b12f71ef5f74d8e01c4eca9495ac1e05dbd60d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 12:55:52 +0000
Subject: [PATCH] diffoscope: upgrade 306 -> 311

---
 .../diffoscope/{diffoscope_306.bb => diffoscope_311.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_306.bb => diffoscope_311.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_306.bb b/meta/recipes-support/diffoscope/diffoscope_311.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_306.bb
rename to meta/recipes-support/diffoscope/diffoscope_311.bb
index 624e1ee3f1..e947bc0219 100644
--- a/meta/recipes-support/diffoscope/diffoscope_306.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_311.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "2c489aba7334ab0d4a9946ac51fe1b17085621a5476b89950e9c4f1e612cbab3"
+SRC_URI[sha256sum] = "9316493c0ba14d6f7537dd4e4ade7d4cd5cfef86b63fe687f0e7073861c5ba8b"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============4032049017174830451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-306.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-311.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-306.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-311.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-306.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-311.dist-info

--===============4032049017174830451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "306" to "311"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 306 [default] to 311 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "306" to "311"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 306 [default] to 311 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "306" to "311"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 306 [default] to 311 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "306" to "311"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 306 [default] to 311 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "306" to "311"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 306 [default] to 311 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "306" to "311"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 306 [default] to 311 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "306" to "311"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 306 [default] to 311 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-306.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-311.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-306.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-311.dist-info/licenses
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1411723 to 1411708 (-0%)
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 306 [default] to 311 [default]
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-306.tar.gz;downloadfilename=diffoscope-306.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-311.tar.gz;downloadfilename=diffoscope-311.tar.gz"
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "306" to "311"
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-306.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-311.dist-info

--===============4032049017174830451==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-306-311.patch"

RnJvbSBmN2IxMmY3MWVmNWY3NGQ4ZTAxYzRlY2E5NDk1YWMxZTA1ZGJkNjBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAxMjo1NTo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMzA2IC0+IDMxMQoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8zMDYuYmIgPT4gZGlmZm9zY29wZV8zMTEuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzMwNi5iYiA9PiBkaWZmb3Njb3BlXzMx
MS5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMzA2LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzMxMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMzA2LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMzExLmJiCmluZGV4IDYyNGUxZWUz
ZjEuLmU5NDdiYzAyMTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMDYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMxMS5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICIyYzQ4OWFiYTczMzRhYjBkNGE5OTQ2YWM1MWZlMWIxNzA4NTYyMWE1NDc2Yjg5OTUwZTlj
NGYxZTYxMmNiYWIzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjkzMTY0OTNjMGJhMTRkNmY3NTM3
ZGQ0ZTRhZGU3ZDRjZDVjZmVmODZiNjNmZTY4N2YwZTcwNzM4NjFjNWJhOGIiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJcCiAgICAgICAgIGJpbnV0aWxzIFwKLS0gCjIuNDcuMQoK

--===============4032049017174830451==--

