Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16738CD6E6F
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:04 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1553.1780328129208539660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Sc2utjMt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XAuDQWJ+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019e83d3c5dc-983175b0-16d6-4413-8252-46cb3e9d1756-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328154;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kJ50JdMM22M0Z7EQbJu0vOVi7M7jt38t6MeJ6Rmf7vc=;
	b=Sc2utjMtN4p89hLalBCa7KZ6ogVU4xxZrmnu52X0w1uOuOop0GWJEOLkHZ7YdjrE
	Pcc6bG5X30X04y2BVTwR8Ujffqq2jS8m2olw2lO+1MLleiH7ygGWId7FyaRDH2BkfCD
	rShYxZQndjQygEnDVK2uddelrUE6qcngoux1tT9E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328154;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kJ50JdMM22M0Z7EQbJu0vOVi7M7jt38t6MeJ6Rmf7vc=;
	b=XAuDQWJ+/YrE4Zb8IvfKjRc0ajJ6YLkc/4vX1R7yP8qg9ioYizw3AFm7zzqcMYzO
	Ua8dMmRGIxLaeWMdwNGy+Hoyws3O0WR040vmY628vENgJx0ASvcQ/13R6VqNLOagwI/
	BnJY/CJJ++i3xkICPAGaFKlgnh/US7jEVzgxZgac=
Content-Type: multipart/mixed; boundary="===============0324115182799207053=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 318 SUCCEEDED
Message-ID: <0101019e83d3c5dc-983175b0-16d6-4413-8252-46cb3e9d1756-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237946

--===============0324115182799207053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *318* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-317-318.patch
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
From ceb59efb6dbceb8d68ccd73cce43d5f1ad7fc928 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 14:12:30 +0000
Subject: [PATCH] diffoscope: upgrade 317 -> 318

---
 .../diffoscope/{diffoscope_317.bb => diffoscope_318.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_317.bb => diffoscope_318.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_317.bb b/meta/recipes-support/diffoscope/diffoscope_318.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_317.bb
rename to meta/recipes-support/diffoscope/diffoscope_318.bb
index 06c3ee1a30..7a4562cfce 100644
--- a/meta/recipes-support/diffoscope/diffoscope_317.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_318.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9c8741f76bcbd1faec59227da31981a524abca63e19d03f3a594c19f326de542"
+SRC_URI[sha256sum] = "313261c0da6b6c02e525a6b8a898a00aaba32cb7c5511364d5939fc0394295d9"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============0324115182799207053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-317.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-318.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-317.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-318.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-317.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-318.dist-info

--===============0324115182799207053==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-317-318.patch"

RnJvbSBjZWI1OWVmYjZkYmNlYjhkNjhjY2Q3M2NjZTQzZDVmMWFkN2ZjOTI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxNDoxMjozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMzE3IC0+IDMxOAoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8zMTcuYmIgPT4gZGlmZm9zY29wZV8zMTguYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzMxNy5iYiA9PiBkaWZmb3Njb3BlXzMx
OC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMzE3LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzMxOC5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMzE3LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMzE4LmJiCmluZGV4IDA2YzNlZTFh
MzAuLjdhNDU2MmNmY2UgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMTcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMxOC5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICI5Yzg3NDFmNzZiY2JkMWZhZWM1OTIyN2RhMzE5ODFhNTI0YWJjYTYzZTE5ZDAzZjNhNTk0
YzE5ZjMyNmRlNTQyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjMxMzI2MWMwZGE2YjZjMDJlNTI1
YTZiOGE4OThhMDBhYWJhMzJjYjdjNTUxMTM2NGQ1OTM5ZmMwMzk0Mjk1ZDkiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJcCiAgICAgICAgIGJpbnV0aWxzIFwKLS0gCjIuNDcuMQoK

--===============0324115182799207053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "317" to "318"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 317 [default] to 318 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "317" to "318"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 317 [default] to 318 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "317" to "318"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 317 [default] to 318 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "317" to "318"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 317 [default] to 318 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "317" to "318"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 317 [default] to 318 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "317" to "318"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 317 [default] to 318 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "317" to "318"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 317 [default] to 318 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-317.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-318.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-317.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-318.dist-info/licenses
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1411702 to 1411641 (-0%)
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "317" to "318"
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 317 [default] to 318 [default]
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-317.tar.gz;downloadfilename=diffoscope-317.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-318.tar.gz;downloadfilename=diffoscope-318.tar.gz"
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-317.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-318.dist-info

--===============0324115182799207053==--

