Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E02E0C55174
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 06:06:43 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.867.1786169199621878074
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 23:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZkMtwGV+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=2B6Uug5R;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019fdffb0691-000a3064-5ec0-470a-868b-9656e2b68178-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786169198;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=g1Xby4JmpWa5Y7e5aOZHyaPX2yd6cTufJ2ZnRatEbxc=;
	b=ZkMtwGV+rAG0KzzJGVZCJ9FeACb88a+BGQdydvzT4XlbZCGvcIue9RDav296Z+VG
	+c8c8qAzDWHPLogXojWSL7AcUm5T8//6ZfH99ZSZRL0jaVtGDiJK/6y9OL01DiV0HcV
	CODragfexlGwMY2KNdFh59UJ//HEp77wUv5c2r+Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786169198;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=g1Xby4JmpWa5Y7e5aOZHyaPX2yd6cTufJ2ZnRatEbxc=;
	b=2B6Uug5R5t8NGfg0+J6uxE0jkXD4W0eGr9nuok3KtYPfNjLSaAXhLJGyNUNGc3AW
	G24lVD6nTXWcbb/l5S/ddMuWp6dMDjJuDlDE4bmQ/5a19rmDzIO2w/pkS1MT+aO06sf
	Km7oP3m+kTX8h/SXVDo4V79zMhydxqUYOPp8bG9g=
Content-Type: multipart/mixed; boundary="===============7623905821957314516=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 327 SUCCEEDED
Message-ID: <0101019fdffb0691-000a3064-5ec0-470a-868b-9656e2b68178-000000@us-west-2.amazonses.com>
Date: Sat, 8 Aug 2026 06:06:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.08-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 06:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243034

--===============7623905821957314516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *327* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-326-327.patch
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
From 63258df7805cd214bcd0c853023028937949e65b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 8 Aug 2026 06:06:31 +0000
Subject: [PATCH] diffoscope: upgrade 326 -> 327

---
 .../diffoscope/{diffoscope_326.bb => diffoscope_327.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_326.bb => diffoscope_327.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_326.bb b/meta/recipes-support/diffoscope/diffoscope_327.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_326.bb
rename to meta/recipes-support/diffoscope/diffoscope_327.bb
index 3ab679f34f..30d33732f6 100644
--- a/meta/recipes-support/diffoscope/diffoscope_326.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_327.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "21aaa977a9fbdf6e2b70b675a700ad1f80e878ac1dac59cf6fb0ba5f319616c7"
+SRC_URI[sha256sum] = "b5a398de17b180637cf091ba5c3c9fecde9dc8f5c2c80204ff8dd78e1b9d5358"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============7623905821957314516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-326.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-327.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-326.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-327.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-326.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-327.dist-info

--===============7623905821957314516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 326 [default] to 327 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "326" to "327"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 326 [default] to 327 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "326" to "327"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 326 [default] to 327 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "326" to "327"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 326 [default] to 327 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "326" to "327"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 326 [default] to 327 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "326" to "327"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 326 [default] to 327 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "326" to "327"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-326.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-327.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/diffoscope-326.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-327.dist-info
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 326 [default] to 327 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "326" to "327"
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-326.tar.gz;downloadfilename=diffoscope-326.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-327.tar.gz;downloadfilename=diffoscope-327.tar.gz"
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 326 [default] to 327 [default]
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "326" to "327"
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-326.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-327.dist-info

--===============7623905821957314516==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-326-327.patch"

RnJvbSA2MzI1OGRmNzgwNWNkMjE0YmNkMGM4NTMwMjMwMjg5Mzc5NDllNjViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgOCBBdWcgMjAyNiAwNjowNjozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMzI2IC0+IDMyNwoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8zMjYuYmIgPT4gZGlmZm9zY29wZV8zMjcuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzMyNi5iYiA9PiBkaWZmb3Njb3BlXzMy
Ny5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMzI2LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzMyNy5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMzI2LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMzI3LmJiCmluZGV4IDNhYjY3OWYz
NGYuLjMwZDMzNzMyZjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMyNy5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9DT1BZSU5HO21kNT1kMzIyMzliY2I2NzM0NjNhYjg3NGU4MGQ0N2ZhZTUwNCIKIAog
aW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyMWFhYTk3
N2E5ZmJkZjZlMmI3MGI2NzVhNzAwYWQxZjgwZTg3OGFjMWRhYzU5Y2Y2ZmIwYmE1ZjMxOTYxNmM3
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImI1YTM5OGRlMTdiMTgwNjM3Y2YwOTFiYTVjM2M5ZmVj
ZGU5ZGM4ZjVjMmM4MDIwNGZmOGRkNzhlMWI5ZDUzNTgiCiAKIFJERVBFTkRTOiR7UE59ICs9ICJc
CiAgICAgICAgIGJpbnV0aWxzIFwKLS0gCjIuNDcuMQoK

--===============7623905821957314516==--

