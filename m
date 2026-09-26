Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324B2C98318
	for <webhook@archiver.kernel.org>; Sat, 26 Sep 2026 05:25:22 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14527.1790400313784647751
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 22:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Cy/6+zQQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eRpq2sbQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a0dc2cb56f-32d3929e-12d5-4bf0-b70c-fc1afe356d01-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790400312;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/Zcetz9nsGWx2rKyGqT2e1XAKsTWy0VM4usJxrGqh+Q=;
	b=Cy/6+zQQc4fLhEn65lLfPi1LcjXryvXTDjUs1AZUwu6zjZQsXDwNO7GKdtpaI6zd
	y2u7MS0jr+IbrJM/gZdiAzrzCvXf3Zqbcd7YE2xotmA7oCQwDX1A5vHRUjvV878SEJX
	nju2+EaJHi47osWYyH0Ahg96kIIXw0SWs+DMSDbg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790400312;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/Zcetz9nsGWx2rKyGqT2e1XAKsTWy0VM4usJxrGqh+Q=;
	b=eRpq2sbQbe7JP7m25vD9EKXuq8QRfE2ujFk0cYCIZVUaXTwAtbkSpKHM0XuL3Et7
	p/B/Pov4k5SByBJURw0gYP+yKJ0AWE7gvLNHNbrgznJtRCWxF6xP8/Nkr2JYFE4+1vZ
	0gw2FescFW5gWQQK0imC/DxWwTH+mU6O6P7JF1r0=
Content-Type: multipart/mixed; boundary="===============1121096082630331380=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 331 SUCCEEDED
Message-ID: <010101a0dc2cb56f-32d3929e-12d5-4bf0-b70c-fc1afe356d01-000000@us-west-2.amazonses.com>
Date: Sat, 26 Sep 2026 05:25:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.26-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2026 05:25:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246631

--===============1121096082630331380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *331* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-330-331.patch
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
From 627de820264f62c98452c9579b2adf094a4bf944 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 26 Sep 2026 05:25:06 +0000
Subject: [PATCH] diffoscope: upgrade 330 -> 331

---
 .../diffoscope/{diffoscope_330.bb => diffoscope_331.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_330.bb => diffoscope_331.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_330.bb b/meta/recipes-support/diffoscope/diffoscope_331.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_330.bb
rename to meta/recipes-support/diffoscope/diffoscope_331.bb
index 87c20546d8..3c64e12318 100644
--- a/meta/recipes-support/diffoscope/diffoscope_330.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_331.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "92fb70b930077282ceaf104b4eb02c6368c860b0c89d6aab98f0a55682ee0361"
+SRC_URI[sha256sum] = "298a62c374f5d60dd3d3af38cdea21cbad7148c84dbfe9cc5a91fdb1b5af4e37"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============1121096082630331380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-330.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-331.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-330.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-331.dist-info/licenses, added "/usr/lib/python3.14/site-packages/diffoscope/comparators/__pycache__/nar.cpython-314.pyc /usr/lib/python3.14/site-packages/diffoscope/scripts/restore-nar.scm /usr/lib/python3.14/site-packages/diffoscope/comparators/nar.py"
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-330.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-331.dist-info
  /usr/lib/python3.14/site-packages/diffoscope/comparators/nar.py was added
  /usr/lib/python3.14/site-packages/diffoscope/comparators/__pycache__/nar.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/diffoscope/scripts/restore-nar.scm was added

--===============1121096082630331380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "330" to "331"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 330 [default] to 331 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "330" to "331"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 330 [default] to 331 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "330" to "331"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 330 [default] to 331 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "330" to "331"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 330 [default] to 331 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "330" to "331"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 330 [default] to 331 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "330" to "331"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 330 [default] to 331 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1413236 to 1433306 (+1%)
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "330" to "331"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 330 [default] to 331 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-330.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-331.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-330.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-331.dist-info/licenses, added "/usr/lib/python3.14/site-packages/diffoscope/scripts/restore-nar.scm /usr/lib/python3.14/site-packages/diffoscope/comparators/nar.py /usr/lib/python3.14/site-packages/diffoscope/comparators/__pycache__/nar.cpython-314.pyc"
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "330" to "331"
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-330.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-331.tar.gz"
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 330 [default] to 331 [default]
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-330.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-331.dist-info
  /usr/lib/python3.14/site-packages/diffoscope/comparators/nar.py was added
  /usr/lib/python3.14/site-packages/diffoscope/comparators/__pycache__/nar.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/diffoscope/scripts/restore-nar.scm was added

--===============1121096082630331380==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-330-331.patch"

RnJvbSA2MjdkZTgyMDI2NGY2MmM5ODQ1MmM5NTc5YjJhZGYwOTRhNGJmOTQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjYgU2VwIDIwMjYgMDU6MjU6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDMzMCAtPiAzMzEKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMzMwLmJiID0+IGRpZmZvc2NvcGVfMzMxLmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8zMzAuYmIgPT4gZGlmZm9zY29wZV8z
MzEuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMzMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8zMzEuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMzMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzMzMS5iYgppbmRleCA4N2MyMDU0
NmQ4Li4zYzY0ZTEyMzE4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMzMwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMzEuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9ZDMyMjM5YmNiNjczNDYzYWI4NzRlODBkNDdmYWU1MDQiCiAK
IGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTJmYjcw
YjkzMDA3NzI4MmNlYWYxMDRiNGViMDJjNjM2OGM4NjBiMGM4OWQ2YWFiOThmMGE1NTY4MmVlMDM2
MSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyOThhNjJjMzc0ZjVkNjBkZDNkM2FmMzhjZGVhMjFj
YmFkNzE0OGM4NGRiZmU5Y2M1YTkxZmRiMWI1YWY0ZTM3IgogCiBSREVQRU5EUzoke1BOfSArPSAi
XAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ3LjEKCg==

--===============1121096082630331380==--

