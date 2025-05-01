Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76235C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:34:09 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.1801.1746113625872174560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dGck8AHo;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=VYAL8gmU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101968c7bb3ab-29d5f475-3b3b-40bb-97dd-20e2b758cf42-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113639;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=W5BYB1vztGOdAmxZDt33kqmkLu685aV+33BmhHuz9Kw=;
	b=dGck8AHogDfvMqsWdAVe+pMBXQVoK0fK53rEBPoyGwskXTAcXNUYvumzauH3UiHO
	Hq/86IUWXrB40UZtAIgd4lKjR6onnNMRgF/fkIagevlBucv1ULICNg4eG2XdzlO+pTC
	HBnk53o/S6D960eaqoaFNzkc+h0QjdJ5A1sfbQXI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113639;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=W5BYB1vztGOdAmxZDt33kqmkLu685aV+33BmhHuz9Kw=;
	b=VYAL8gmU65jhsV7wYwP5ggTs5dEpyGNsIcWM/tyzHZwqFBxaRK5CfXNS/XjsTPW0
	iYrnJ/f6c4fbT6398Ck4SeB5kGsjLLiGWInloe7xrNwgphI6YGheq736PZ4gthfuNCN
	IxUXIgq8swMVRUjRynNG+xasdPwceSaLJhGSAeN0=
Content-Type: multipart/mixed; boundary="===============6060333937063345696=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 294 SUCCEEDED
Message-ID: <010101968c7bb3ab-29d5f475-3b3b-40bb-97dd-20e2b758cf42-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215889

--===============6060333937063345696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *294* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-293-294.patch
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
From 6f8c1a492735a7cfa540281b41d345d0b84ddcd8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 14:36:30 +0000
Subject: [PATCH] diffoscope: upgrade 293 -> 294

---
 .../diffoscope/{diffoscope_293.bb => diffoscope_294.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_293.bb => diffoscope_294.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_293.bb b/meta/recipes-support/diffoscope/diffoscope_294.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_293.bb
rename to meta/recipes-support/diffoscope/diffoscope_294.bb
index 59e7cbe000..a7fa592707 100644
--- a/meta/recipes-support/diffoscope/diffoscope_293.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_294.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "15315d09babdee45449be7042ad1f57104a5f04853bd6951cdc0da171c13ac3b"
+SRC_URI[sha256sum] = "6833785359cade9930fa6d0699f646d62e937bebdb00182e499420f79084cb0d"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.47.1


--===============6060333937063345696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 928 .bb files complete (0 cached, 928 parsed). 1898 targets, 50 skipped, 0 masked, 0 errors.
Removing 118 recipes from the core2-64 sysroot...done.
Removing 134 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============6060333937063345696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "293" to "294"
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 293 [default] to 294 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "293" to "294"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 293 [default] to 294 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "293" to "294"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 293 [default] to 294 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "293" to "294"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 293 [default] to 294 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "293" to "294"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 293 [default] to 294 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "293" to "294"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 293 [default] to 294 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "293" to "294"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 293 [default] to 294 [default]
packages/core2-64-poky-linux/diffoscope: PV changed from "293" to "294"
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-293.tar.gz;downloadfilename=diffoscope-293.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-294.tar.gz;downloadfilename=diffoscope-294.tar.gz"
packages/core2-64-poky-linux/diffoscope: PKGV changed from 293 [default] to 294 [default]
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.13/site-packages/diffoscope-293.dist-info moved to /usr/lib/python3.13/site-packages/diffoscope-294.dist-info

--===============6060333937063345696==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-293-294.patch"

RnJvbSA2ZjhjMWE0OTI3MzVhN2NmYTU0MDI4MWI0MWQzNDVkMGI4NGRkY2Q4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxNDozNjozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMjkzIC0+IDI5NAoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8yOTMuYmIgPT4gZGlmZm9zY29wZV8yOTQuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzI5My5iYiA9PiBkaWZmb3Njb3BlXzI5
NC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMjkzLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzI5NC5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjkzLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjk0LmJiCmluZGV4IDU5ZTdjYmUw
MDAuLmE3ZmE1OTI3MDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yOTMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI5NC5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICIxNTMxNWQwOWJhYmRlZTQ1NDQ5YmU3MDQyYWQxZjU3MTA0YTVmMDQ4NTNiZDY5NTFjZGMw
ZGExNzFjMTNhYzNiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjY4MzM3ODUzNTljYWRlOTkzMGZh
NmQwNjk5ZjY0NmQ2MmU5MzdiZWJkYjAwMTgyZTQ5OTQyMGY3OTA4NGNiMGQiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJcCiAgICAgICAgIGJpbnV0aWxzIFwKLS0gCjIuNDcuMQoK

--===============6060333937063345696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.13/site-packages/diffoscope-293.dist-info moved to /usr/lib/python3.13/site-packages/diffoscope-294.dist-info

--===============6060333937063345696==--

