Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F157C3601C
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:35 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.18047.1743511393838442158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=PloeHXQ4;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=pGhcm2yz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010195f160e001-0157f53c-3c74-4b7e-bb3f-45c918d94d0d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511412;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3qE3ebNTSdTuzc60ckG936NcaxVGGfgo35TYXCa0tPg=;
	b=PloeHXQ4s6IJOeaFxHStAjhgSljeZl4QEfdkleU0TadZcV4GczIt/XHrb7qYccju
	IH2SE7/TB8Tod1Wxm6PQBhg/a1Ul+agESLVi+pzHr/pLY/+2mpsT5HOLtMJ3VOumFrq
	gDtzPuCv8F6QIA2aunwcAT00ZRPxpx2YN8FxZrMo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511412;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3qE3ebNTSdTuzc60ckG936NcaxVGGfgo35TYXCa0tPg=;
	b=pGhcm2yzolXyN26uoOH5s9sreqxMgCXrzSXl2hU9Rda8S2GlOSlnRf+yc6qkx8NG
	3z3e9dczX+LI4m897uc+8A9lKxhBv53kxS5dD/aXUaTnj6zjmW1HVjDmjDZgDey5ukA
	F9fekExMcoj6IXqZ8twUFeHFJg3iRVoXmf6z1QUg=
Content-Type: multipart/mixed; boundary="===============8066342825187303095=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 293 SUCCEEDED
Message-ID: <01010195f160e001-0157f53c-3c74-4b7e-bb3f-45c918d94d0d-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214117

--===============8066342825187303095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *293* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-289-293.patch
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
From 1fae32ed7606e392e3d79a8bff81b8d52f5d95a8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 12:13:56 +0000
Subject: [PATCH] diffoscope: upgrade 289 -> 293

---
 .../diffoscope/{diffoscope_289.bb => diffoscope_293.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_289.bb => diffoscope_293.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_289.bb b/meta/recipes-support/diffoscope/diffoscope_293.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_289.bb
rename to meta/recipes-support/diffoscope/diffoscope_293.bb
index af7d6b5d73..59e7cbe000 100644
--- a/meta/recipes-support/diffoscope/diffoscope_289.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_293.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b9b2e598e62eb2220376e252692ac534d8d921d4314ec288d8c7415d3041dd9d"
+SRC_URI[sha256sum] = "15315d09babdee45449be7042ad1f57104a5f04853bd6951cdc0da171c13ac3b"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============8066342825187303095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.13/site-packages/diffoscope-289.dist-info moved to /usr/lib/python3.13/site-packages/diffoscope-293.dist-info

--===============8066342825187303095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 924 .bb files complete (0 cached, 924 parsed). 1887 targets, 50 skipped, 0 masked, 0 errors.
Removing 103 recipes from the core2-64 sysroot...done.
Removing 135 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============8066342825187303095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "289" to "293"
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 289 [default] to 293 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "289" to "293"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 289 [default] to 293 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "289" to "293"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 289 [default] to 293 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "289" to "293"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 289 [default] to 293 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "289" to "293"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 289 [default] to 293 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "289" to "293"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 289 [default] to 293 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1376815 to 1378886 (+0%)
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "289" to "293"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 289 [default] to 293 [default]
packages/core2-64-poky-linux/diffoscope: PV changed from "289" to "293"
packages/core2-64-poky-linux/diffoscope: PKGV changed from 289 [default] to 293 [default]
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-289.tar.gz;downloadfilename=diffoscope-289.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-293.tar.gz;downloadfilename=diffoscope-293.tar.gz"
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.13/site-packages/diffoscope-289.dist-info moved to /usr/lib/python3.13/site-packages/diffoscope-293.dist-info

--===============8066342825187303095==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-289-293.patch"

RnJvbSAxZmFlMzJlZDc2MDZlMzkyZTNkNzlhOGJmZjgxYjhkNTJmNWQ5NWE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAxMjoxMzo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMjg5IC0+IDI5MwoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8yODkuYmIgPT4gZGlmZm9zY29wZV8yOTMuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzI4OS5iYiA9PiBkaWZmb3Njb3BlXzI5
My5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMjg5LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzI5My5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjg5LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjkzLmJiCmluZGV4IGFmN2Q2YjVk
NzMuLjU5ZTdjYmUwMDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yODkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI5My5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJiOWIyZTU5OGU2MmViMjIyMDM3NmUyNTI2OTJhYzUzNGQ4ZDkyMWQ0MzE0ZWMyODhkOGM3
NDE1ZDMwNDFkZDlkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE1MzE1ZDA5YmFiZGVlNDU0NDli
ZTcwNDJhZDFmNTcxMDRhNWYwNDg1M2JkNjk1MWNkYzBkYTE3MWMxM2FjM2IiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJcCiAgICAgICAgIGJpbnV0aWxzIFwKLS0gCjIuNDcuMQoK

--===============8066342825187303095==--

