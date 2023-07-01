Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DEB3C001E0
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 16:02:06 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.10511.1688227324604495620
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 09:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gJIUnP2x;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101891230a047-3f7c7359-3e88-412e-b235-5876f82489d6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1688227324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=deVJgtRlwYjF7lc6HBDXhEoCtssh1DPQLRQq9TR44us=;
	b=gJIUnP2xkx3IU6BJesPSIioY+3HDSe+yAg1YKIg/9bpmVt0/r+w/Pb9iPm/inmBj
	tK/sgr4NyP4Ct0kIswHAD+GTfRuCOjmFtRGI7D5ow4S6WRTVT1TMeJ5e0qPlZHP6kz2
	z7Rt2gTfrQYSEc6RmXLnt21At5SA74TFmY6SMegA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1688227324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=deVJgtRlwYjF7lc6HBDXhEoCtssh1DPQLRQq9TR44us=;
	b=Eyq51LgwsiPmGQmoHDIiTtb8aMUyg0QXP23kHfYjfFSS3FDBFbGxCFSPlbQce8tg
	sGJPv2xAgUpreNqc/c9A5829nQV/Lwe45KaRgli9BfS9GJvEusCDSjIxeZQYsVZlE4a
	lhhfdimhTdIK7SStmIIiPFa7eNGDHhY/mMh2K8Lw=
Content-Type: multipart/mixed; boundary="===============4593851614735163238=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 243 SUCCEEDED
Message-ID: <010101891230a047-3f7c7359-3e88-412e-b235-5876f82489d6-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jul 2023 16:02:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183764

--===============4593851614735163238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *243* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-242-243.patch
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
From 3772fccb571c3007550992ff60c6b9c35cb5f679 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jul 2023 15:12:53 +0000
Subject: [PATCH] diffoscope: upgrade 242 -> 243

---
 .../diffoscope/{diffoscope_242.bb => diffoscope_243.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_242.bb => diffoscope_243.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_242.bb b/meta/recipes-support/diffoscope/diffoscope_243.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_242.bb
rename to meta/recipes-support/diffoscope/diffoscope_243.bb
index 4b0d518edc..a73ad6da9e 100644
--- a/meta/recipes-support/diffoscope/diffoscope_242.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_243.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "d858c591d2c8d42b2b29eb6d229408607b1cd8a4e7ade72d0cd002db6d1c2a6e"
+SRC_URI[sha256sum] = "3ce7ff00d72ffd9c904d1d93a4a147208878f56e8f0286073533615689d840b1"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.39.2


--===============4593851614735163238==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-242-243.patch"

RnJvbSAzNzcyZmNjYjU3MWMzMDA3NTUwOTkyZmY2MGM2YjljMzVjYjVmNjc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdWwgMjAyMyAxNToxMjo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMjQyIC0+IDI0MwoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8yNDIuYmIgPT4gZGlmZm9zY29wZV8yNDMuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzI0Mi5iYiA9PiBkaWZmb3Njb3BlXzI0
My5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMjQyLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzI0My5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjQyLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjQzLmJiCmluZGV4IDRiMGQ1MThl
ZGMuLmE3M2FkNmRhOWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yNDIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI0My5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJkODU4YzU5MWQyYzhkNDJiMmIyOWViNmQyMjk0MDg2MDdiMWNkOGE0ZTdhZGU3MmQwY2Qw
MDJkYjZkMWMyYTZlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNjZTdmZjAwZDcyZmZkOWM5MDRk
MWQ5M2E0YTE0NzIwODg3OGY1NmU4ZjAyODYwNzM1MzM2MTU2ODlkODQwYjEiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJiaW51dGlscyB2aW0gc3F1YXNoZnMtdG9vbHMgcHl0aG9uMy1saWJhcmNoaXZl
LWMgcHl0aG9uMy1tYWdpYyBweXRob24zLXJwbSIKIAotLSAKMi4zOS4yCgo=

--===============4593851614735163238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-242.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-243.dist-info

--===============4593851614735163238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 242 [default] to 243 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "242" to "243"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 242 [default] to 243 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "242" to "243"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 242 [default] to 243 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "242" to "243"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 242 [default] to 243 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "242" to "243"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 242 [default] to 243 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "242" to "243"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 242 [default] to 243 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "242" to "243"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1408047 to 1408182 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 242 [default] to 243 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "242" to "243"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 242 [default] to 243 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "242" to "243"
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-242.tar.gz;downloadfilename=diffoscope-242.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-243.tar.gz;downloadfilename=diffoscope-243.tar.gz"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-242.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-243.dist-info

--===============4593851614735163238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1799 targets, 45 skipped, 0 masked, 0 errors.
Removing 117 recipes from the core2-32 sysroot...done.
Removing 123 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============4593851614735163238==--

