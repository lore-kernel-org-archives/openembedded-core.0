Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B88C54F30
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:26 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.75484.1722536823231731521
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LjrOO1QM;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=uD0xsdhv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101910f323f76-7dbaad21-a15e-42c3-a91f-8bda38ab7f56-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536837;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nSK0QKVwl5q6UfoeKp9YkiZYh/hYx7qyNmDoFJ2/pWQ=;
	b=LjrOO1QMhTSGWDeckJbH0J8TZkf+hfiEnu3cYstCLNdCx3LfQkM1PKqi+of8LRAR
	zuVorKbWyv306yc8lrsICGWipuRNeFS69RJiheZ/fCGUPzvp6b49nTunStfCwZUcr+k
	qq+bfdcKwdNBi8vmuDot7BXK7qNVy0fsbUVm7eDc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536837;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nSK0QKVwl5q6UfoeKp9YkiZYh/hYx7qyNmDoFJ2/pWQ=;
	b=uD0xsdhvIdYpDaOBexr0cQvyAiA2NtTQ+jybQNhnO63tqy9XPFwTGv26rDrkMIeJ
	DYgdYhPCKrPhoXWl/28lv4fSja4Oy9EyKZSwGwfx5BeF32AKRSctsYgQ0ZwzcQenq1L
	1YNI30TpC4rED8BwFI1oGZoZO5L2YGg+yIsI3xOc=
Content-Type: multipart/mixed; boundary="===============0365021346899306324=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 273 SUCCEEDED
Message-ID: <010101910f323f76-7dbaad21-a15e-42c3-a91f-8bda38ab7f56-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202872

--===============0365021346899306324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *273* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-272-273.patch
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
From 3a092ac3368f58ad66c7da5fb728e9d009e763e3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 17:18:20 +0000
Subject: [PATCH] diffoscope: upgrade 272 -> 273

---
 .../diffoscope/{diffoscope_272.bb => diffoscope_273.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_272.bb => diffoscope_273.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_272.bb b/meta/recipes-support/diffoscope/diffoscope_273.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_272.bb
rename to meta/recipes-support/diffoscope/diffoscope_273.bb
index 55e4cc7832..1f88e90472 100644
--- a/meta/recipes-support/diffoscope/diffoscope_272.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_273.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "f8983580efb8f4644719705590a43817d1159d4136836d7ce6dd4fec754c3943"
+SRC_URI[sha256sum] = "2555c7688c8a0e09a152381bbe1b09bbf4c63b55445fb775af810c0af32e6983"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.44.0


--===============0365021346899306324==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-272-273.patch"

RnJvbSAzYTA5MmFjMzM2OGY1OGFkNjZjN2RhNWZiNzI4ZTlkMDA5ZTc2M2UzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxNzoxODoyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMjcyIC0+IDI3MwoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8yNzIuYmIgPT4gZGlmZm9zY29wZV8yNzMuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzI3Mi5iYiA9PiBkaWZmb3Njb3BlXzI3
My5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMjcyLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzI3My5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjcyLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjczLmJiCmluZGV4IDU1ZTRjYzc4
MzIuLjFmODhlOTA0NzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yNzIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI3My5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJmODk4MzU4MGVmYjhmNDY0NDcxOTcwNTU5MGE0MzgxN2QxMTU5ZDQxMzY4MzZkN2NlNmRk
NGZlYzc1NGMzOTQzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI1NTVjNzY4OGM4YTBlMDlhMTUy
MzgxYmJlMWIwOWJiZjRjNjNiNTU0NDVmYjc3NWFmODEwYzBhZjMyZTY5ODMiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJcCiAgICAgICAgIGJpbnV0aWxzIFwKLS0gCjIuNDQuMAoK

--===============0365021346899306324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-272.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-273.dist-info

--===============0365021346899306324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1884 targets, 48 skipped, 0 masked, 0 errors.
Removing 116 recipes from the core2-64 sysroot...done.
Removing 129 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============0365021346899306324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "272" to "273"
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 272 [default] to 273 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "272" to "273"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 272 [default] to 273 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "272" to "273"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 272 [default] to 273 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "272" to "273"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 272 [default] to 273 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "272" to "273"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 272 [default] to 273 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "272" to "273"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 272 [default] to 273 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "272" to "273"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 272 [default] to 273 [default]
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-272.tar.gz;downloadfilename=diffoscope-272.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-273.tar.gz;downloadfilename=diffoscope-273.tar.gz"
packages/core2-64-poky-linux/diffoscope: PV changed from "272" to "273"
packages/core2-64-poky-linux/diffoscope: PKGV changed from 272 [default] to 273 [default]
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-272.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-273.dist-info

--===============0365021346899306324==--

