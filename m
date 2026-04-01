Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6669310F6FC5
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:22 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14669.1775054175724564274
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=oqZ9lijt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JgGH1vZa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019d49793b8e-ff05f590-8ff7-4f0c-841e-f3c02c5fc93c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054175;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Bo07IRs8aLl6e6HDWNfCsFY+EbaqebCcNKYq63ACS64=;
	b=oqZ9lijtuJpaF1bAU/bHWs2V2aVz2k880oBw80S4MbnreVBlRPw5lqcvKX0Sekuk
	ixdFXIma6DjfZOabKldGmqMtsdO44kXc+6Ruji0JalsmvaLF6kZFV7oT1pPWTUAyT+i
	WsHamOOX6kGnOEO4lY80+UJ4suFkyLNc38L6xO/s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054175;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Bo07IRs8aLl6e6HDWNfCsFY+EbaqebCcNKYq63ACS64=;
	b=JgGH1vZaoQqWclwVRyTvri0SRlfIer2+Ng6Y1vIBM3Gs2DBkwyPduxLJzEDdjRkU
	GJK4i9LydJV0gX48eh9GEYZ4BVqut6dHg7pzm46YJfKvniKX9EnxTJuaoKtqcVEUg4f
	eVN0V4PXWlbSjwJBMXdWjk94avaCTCwX4w6vbeqE=
Content-Type: multipart/mixed; boundary="===============9118398409351497169=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 315 SUCCEEDED
Message-ID: <0101019d49793b8e-ff05f590-8ff7-4f0c-841e-f3c02c5fc93c-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234432

--===============9118398409351497169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *315* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-314-315.patch
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
From 376d79f11209b3948a21f8360eba2dc11b11d5fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 14:11:47 +0000
Subject: [PATCH] diffoscope: upgrade 314 -> 315

---
 .../diffoscope/{diffoscope_314.bb => diffoscope_315.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_314.bb => diffoscope_315.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_314.bb b/meta/recipes-support/diffoscope/diffoscope_315.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_314.bb
rename to meta/recipes-support/diffoscope/diffoscope_315.bb
index 11868dc8db..e214cdacad 100644
--- a/meta/recipes-support/diffoscope/diffoscope_314.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_315.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b347d6ebcadd913a5839555b89ea1026422a1cdf7b8b3be21bb2f112133c3ff8"
+SRC_URI[sha256sum] = "935cbf81f205d1de49dc3ba273d5169916d0081bc6c4db20d15913b30c82b9aa"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============9118398409351497169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-314.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-315.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/diffoscope-314.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-315.dist-info
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-314.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-315.dist-info

--===============9118398409351497169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 314 [default] to 315 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dbg: PV changed from "314" to "315"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 314 [default] to 315 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-dev: PV changed from "314" to "315"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 314 [default] to 315 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-doc: PV changed from "314" to "315"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 314 [default] to 315 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-locale: PV changed from "314" to "315"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PKGV changed from 314 [default] to 315 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-src: PV changed from "314" to "315"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 314 [default] to 315 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "314" to "315"
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGV changed from 314 [default] to 315 [default]
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: FILELIST: directory renamed /usr/lib/python3.14/site-packages/diffoscope-314.dist-info -> /usr/lib/python3.14/site-packages/diffoscope-315.dist-info, directory renamed /usr/lib/python3.14/site-packages/diffoscope-314.dist-info/licenses -> /usr/lib/python3.14/site-packages/diffoscope-315.dist-info/licenses
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1411658 to 1411702 (+0%)
packages/x86-64-v3-poky-linux/diffoscope/diffoscope: PV changed from "314" to "315"
packages/x86-64-v3-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-314.tar.gz;downloadfilename=diffoscope-314.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-315.tar.gz;downloadfilename=diffoscope-315.tar.gz"
packages/x86-64-v3-poky-linux/diffoscope: PKGV changed from 314 [default] to 315 [default]
packages/x86-64-v3-poky-linux/diffoscope: PV changed from "314" to "315"
Changes to packages/x86-64-v3-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.14/site-packages/diffoscope-314.dist-info moved to /usr/lib/python3.14/site-packages/diffoscope-315.dist-info

--===============9118398409351497169==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-314-315.patch"

RnJvbSAzNzZkNzlmMTEyMDliMzk0OGEyMWY4MzYwZWJhMmRjMTFiMTFkNWZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxNDoxMTo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMzE0IC0+IDMxNQoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8zMTQuYmIgPT4gZGlmZm9zY29wZV8zMTUuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzMxNC5iYiA9PiBkaWZmb3Njb3BlXzMx
NS5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMzE0LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzMxNS5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMzE0LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMzE1LmJiCmluZGV4IDExODY4ZGM4
ZGIuLmUyMTRjZGFjYWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8zMTQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzMxNS5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJiMzQ3ZDZlYmNhZGQ5MTNhNTgzOTU1NWI4OWVhMTAyNjQyMmExY2RmN2I4YjNiZTIxYmIy
ZjExMjEzM2MzZmY4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjkzNWNiZjgxZjIwNWQxZGU0OWRj
M2JhMjczZDUxNjk5MTZkMDA4MWJjNmM0ZGIyMGQxNTkxM2IzMGM4MmI5YWEiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJcCiAgICAgICAgIGJpbnV0aWxzIFwKLS0gCjIuNDcuMQoK

--===============9118398409351497169==--

