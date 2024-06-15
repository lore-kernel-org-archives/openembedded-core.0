Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774E8C2BD05
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:24 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.18611.1718475799703250644
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LzUOU9RJ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=pm/VHnCB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101901d23bf42-b0e045d6-131c-40d3-b704-3d63cc202688-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7KaSQYFhNYhq45uxDWJw1iD5Fewy0bx6vCJb5gLbF7g=;
	b=LzUOU9RJckf0CaSHpO1p3RdCPk5z5X8poOszVU1zfmv0lHryFo8ZFL/VSaVL4Qn7
	ZgRXkkxCqpsvfxY2C39YlQz9DM48hfzuyLWmkxkfdqCIb6ejvE8pV+jopEfVvofypns
	xJDgtQPeCiTB+uqzWod4rc3z4wncHdI6CrlbMiQ0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7KaSQYFhNYhq45uxDWJw1iD5Fewy0bx6vCJb5gLbF7g=;
	b=pm/VHnCBhZoR9Xt76QahNIfK1xSINFdrFL4yy1yvrfQ3KaVKFAUUJM905EaUJEnf
	hgXKW1FbGAgrk01DOPE0NFaJWDC8lyR7APmSAF55E+41Vqg/BSimGdYeQrryNcLhU1W
	rD2gEqWXfRMPBXdB8m0n3xvfuLl3EvEBgOkuq/Yc=
Content-Type: multipart/mixed; boundary="===============6221061759912558673=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 271 SUCCEEDED
Message-ID: <010101901d23bf42-b0e045d6-131c-40d3-b704-3d63cc202688-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200754

--===============6221061759912558673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *271* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-267-271.patch
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
From 24cebb779fc6ad50f5d54c2bac78d34873032bf7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 17:28:53 +0000
Subject: [PATCH] diffoscope: upgrade 267 -> 271

---
 .../diffoscope/{diffoscope_267.bb => diffoscope_271.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_267.bb => diffoscope_271.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_267.bb b/meta/recipes-support/diffoscope/diffoscope_271.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_267.bb
rename to meta/recipes-support/diffoscope/diffoscope_271.bb
index 69bad508cd..a8443183ec 100644
--- a/meta/recipes-support/diffoscope/diffoscope_267.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_271.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c0a807aa66e18eae88c1adca28988675c9749d3ad1a8db3d2eb7e2afb8763568"
+SRC_URI[sha256sum] = "7690f284a84a866c6f89fa5bb33a867574417ee1c5f2c6d49655cd3761d0fe2c"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.44.0


--===============6221061759912558673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1882 targets, 46 skipped, 0 masked, 0 errors.
Removing 115 recipes from the core2-64 sysroot...done.
Removing 128 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============6221061759912558673==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-267-271.patch"

RnJvbSAyNGNlYmI3NzlmYzZhZDUwZjVkNTRjMmJhYzc4ZDM0ODczMDMyYmY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMTc6Mjg6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDI2NyAtPiAyNzEKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjY3LmJiID0+IGRpZmZvc2NvcGVfMjcxLmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yNjcuYmIgPT4gZGlmZm9zY29wZV8y
NzEuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI2Ny5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yNzEuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI2Ny5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI3MS5iYgppbmRleCA2OWJhZDUw
OGNkLi5hODQ0MzE4M2VjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjY3LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yNzEuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYzBhODA3YWE2NmUxOGVhZTg4YzFhZGNhMjg5ODg2NzVjOTc0OWQzYWQxYThkYjNkMmVi
N2UyYWZiODc2MzU2OCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3NjkwZjI4NGE4NGE4NjZjNmY4
OWZhNWJiMzNhODY3NTc0NDE3ZWUxYzVmMmM2ZDQ5NjU1Y2QzNzYxZDBmZTJjIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiXAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ0LjAKCg==

--===============6221061759912558673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-267.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-271.dist-info

--===============6221061759912558673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "267" to "271"
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 267 [default] to 271 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "267" to "271"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 267 [default] to 271 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "267" to "271"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 267 [default] to 271 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "267" to "271"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 267 [default] to 271 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "267" to "271"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 267 [default] to 271 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "267" to "271"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 267 [default] to 271 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "267" to "271"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1357812 to 1357778 (-0%)
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 267 [default] to 271 [default]
packages/core2-64-poky-linux/diffoscope: PV changed from "267" to "271"
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-267.tar.gz;downloadfilename=diffoscope-267.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-271.tar.gz;downloadfilename=diffoscope-271.tar.gz"
packages/core2-64-poky-linux/diffoscope: PKGV changed from 267 [default] to 271 [default]
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-267.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-271.dist-info

--===============6221061759912558673==--

