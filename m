Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BD5C3DA50
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 17:33:44 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.42219.1717263218921841754
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 10:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Fs9UXSB4;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=kEcqsnQ0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018fd4dd3a24-cf76ae53-b225-493f-b1ed-f3530af80a4f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XfWrMfcN7Or+Rk/7eQ07V/dpLSmAVBfpyw3kj4MBBrc=;
	b=Fs9UXSB4pFRiQ5QyVs7QBjt2vH4uvsFfl5tFRN/UetYyHqeWEzGGr9cWeZLfusg1
	4w+8BunWZlECziiMvnIkIEr/liT4US/4tcoCEnNqFLpFiP0Qc8duf2Wp3cQJRpTI8rG
	QRpwQtqg9j9vQm3+a/iMIap8sG3qi9IKFmCyB28Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1717263219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XfWrMfcN7Or+Rk/7eQ07V/dpLSmAVBfpyw3kj4MBBrc=;
	b=kEcqsnQ0HeAln7dOgtrhPtGIpUmUcQAxIZEvqoojRhVgWC/fDUQOHpQvjVjs+3QJ
	9FA+3xKy2LXFMXf5PBcEstP+uALjhshcKP8E8grQuyP5xLRuDfuab3TGSgH/LZFw4Bi
	bl+ATu2CO68wh+ZyYrdLFDU1z++8mdlRtj4Sz7O8=
Content-Type: multipart/mixed; boundary="===============2080824145333793072=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 269 SUCCEEDED
Message-ID: <0101018fd4dd3a24-cf76ae53-b225-493f-b1ed-f3530af80a4f-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jun 2024 17:33:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 17:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200188

--===============2080824145333793072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *269* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-267-269.patch
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
From 40c404014db02853ddca1c6ba74045f2376d19a1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jun 2024 16:45:19 +0000
Subject: [PATCH] diffoscope: upgrade 267 -> 269

---
 .../diffoscope/{diffoscope_267.bb => diffoscope_269.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_267.bb => diffoscope_269.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_267.bb b/meta/recipes-support/diffoscope/diffoscope_269.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_267.bb
rename to meta/recipes-support/diffoscope/diffoscope_269.bb
index 69bad508cd..9b4743e588 100644
--- a/meta/recipes-support/diffoscope/diffoscope_267.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_269.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c0a807aa66e18eae88c1adca28988675c9749d3ad1a8db3d2eb7e2afb8763568"
+SRC_URI[sha256sum] = "16163310efbf97bfef9e72595349453449f2ad4ffc67c88134805300899ebe02"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.44.0


--===============2080824145333793072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1878 targets, 46 skipped, 0 masked, 0 errors.
Removing 115 recipes from the core2-64 sysroot...done.
Removing 128 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============2080824145333793072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 267 [default] to 269 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "267" to "269"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 267 [default] to 269 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "267" to "269"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 267 [default] to 269 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "267" to "269"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 267 [default] to 269 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "267" to "269"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 267 [default] to 269 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "267" to "269"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 267 [default] to 269 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "267" to "269"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 267 [default] to 269 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "267" to "269"
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-267.tar.gz;downloadfilename=diffoscope-267.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-269.tar.gz;downloadfilename=diffoscope-269.tar.gz"
packages/core2-64-poky-linux/diffoscope: PKGV changed from 267 [default] to 269 [default]
packages/core2-64-poky-linux/diffoscope: PV changed from "267" to "269"
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-267.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-269.dist-info

--===============2080824145333793072==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-267-269.patch"

RnJvbSA0MGM0MDQwMTRkYjAyODUzZGRjYTFjNmJhNzQwNDVmMjM3NmQxOWExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdW4gMjAyNCAxNjo0NToxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMjY3IC0+IDI2OQoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8yNjcuYmIgPT4gZGlmZm9zY29wZV8yNjkuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzI2Ny5iYiA9PiBkaWZmb3Njb3BlXzI2
OS5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMjY3LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzI2OS5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjY3LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjY5LmJiCmluZGV4IDY5YmFkNTA4
Y2QuLjliNDc0M2U1ODggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yNjcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI2OS5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJjMGE4MDdhYTY2ZTE4ZWFlODhjMWFkY2EyODk4ODY3NWM5NzQ5ZDNhZDFhOGRiM2QyZWI3
ZTJhZmI4NzYzNTY4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE2MTYzMzEwZWZiZjk3YmZlZjll
NzI1OTUzNDk0NTM0NDlmMmFkNGZmYzY3Yzg4MTM0ODA1MzAwODk5ZWJlMDIiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJcCiAgICAgICAgIGJpbnV0aWxzIFwKLS0gCjIuNDQuMAoK

--===============2080824145333793072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-267.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-269.dist-info

--===============2080824145333793072==--

