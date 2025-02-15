Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD6CC282C9
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:34 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.8063.1739623339461751705
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=M822XiOB;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=DYlxg66P;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019509a1c4ca-48eeb0dd-cf2e-4a08-bbae-c01e5750d7b9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ch/Kf1Mj8ioqeI8akL22b+wtRNewAU9sizT/P9RS4TQ=;
	b=M822XiOBqgnGycXzVSi6f0YwWXhGPIzwyBiQ4p7ECQlsde/RtL6jirQiaYncWyG8
	egcJ4xUsdy43KhXr74dIT4eRHUMRG1OmAOTctQDhp+0ZQRarxjqy9FCm3MjnFQBuGRD
	mF5q8IuaD24SG2rjyZ2UAGC1octxJWcg3EVGLmYs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ch/Kf1Mj8ioqeI8akL22b+wtRNewAU9sizT/P9RS4TQ=;
	b=DYlxg66PnaEU5uqznf659EtIrFLwi9nXCbYLkDHkS0emhm33foZdOeOH4Ac1RW6e
	AuM+QjJrZz31m4NeDK67maxM3WRBDcxKquwtFdha2IBOcQBc0UDCBSYDDP23Q/0Hcyb
	dR8nRwnYSvSJ6sRb/d2keiLWwwygcVjRKEYMS/78=
Content-Type: multipart/mixed; boundary="===============5506830523211600186=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 288 SUCCEEDED
Message-ID: <0101019509a1c4ca-48eeb0dd-cf2e-4a08-bbae-c01e5750d7b9-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211474

--===============5506830523211600186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *288* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-287-288.patch
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
From ea0cf249f615dc41e956403e29ef0a0671a881de Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 12:17:49 +0000
Subject: [PATCH] diffoscope: upgrade 287 -> 288

---
 .../diffoscope/{diffoscope_287.bb => diffoscope_288.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_287.bb => diffoscope_288.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_287.bb b/meta/recipes-support/diffoscope/diffoscope_288.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_287.bb
rename to meta/recipes-support/diffoscope/diffoscope_288.bb
index 8f8f114054..396bda2cdb 100644
--- a/meta/recipes-support/diffoscope/diffoscope_287.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_288.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "51702676957edb4c16ad93bcfc25bfdbcdb0c39fa7d1d16f657db71cfaa58ceb"
+SRC_URI[sha256sum] = "5b39fde58d6fc4a4c05cb21eecb48b0b67167c2ad9e23d90ac749d891156abd2"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.44.1


--===============5506830523211600186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1870 targets, 49 skipped, 0 masked, 0 errors.
Removing 120 recipes from the core2-64 sysroot...done.
Removing 131 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============5506830523211600186==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-287-288.patch"

RnJvbSBlYTBjZjI0OWY2MTVkYzQxZTk1NjQwM2UyOWVmMGEwNjcxYTg4MWRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMTI6MTc6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDI4NyAtPiAyODgKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjg3LmJiID0+IGRpZmZvc2NvcGVfMjg4LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yODcuYmIgPT4gZGlmZm9zY29wZV8y
ODguYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI4Ny5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yODguYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI4Ny5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI4OC5iYgppbmRleCA4ZjhmMTE0
MDU0Li4zOTZiZGEyY2RiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjg3LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yODguYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNTE3MDI2NzY5NTdlZGI0YzE2YWQ5M2JjZmMyNWJmZGJjZGIwYzM5ZmE3ZDFkMTZmNjU3
ZGI3MWNmYWE1OGNlYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1YjM5ZmRlNThkNmZjNGE0YzA1
Y2IyMWVlY2I0OGIwYjY3MTY3YzJhZDllMjNkOTBhYzc0OWQ4OTExNTZhYmQyIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiXAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ0LjEKCg==

--===============5506830523211600186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 287 [default] to 288 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "287" to "288"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 287 [default] to 288 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "287" to "288"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 287 [default] to 288 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "287" to "288"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 287 [default] to 288 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "287" to "288"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 287 [default] to 288 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "287" to "288"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 287 [default] to 288 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "287" to "288"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 287 [default] to 288 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "287" to "288"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1376597 to 1376603 (+0%)
packages/core2-64-poky-linux/diffoscope: PKGV changed from 287 [default] to 288 [default]
packages/core2-64-poky-linux/diffoscope: PV changed from "287" to "288"
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-287.tar.gz;downloadfilename=diffoscope-287.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-288.tar.gz;downloadfilename=diffoscope-288.tar.gz"
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.13/site-packages/diffoscope-287.dist-info moved to /usr/lib/python3.13/site-packages/diffoscope-288.dist-info

--===============5506830523211600186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.13/site-packages/diffoscope-287.dist-info moved to /usr/lib/python3.13/site-packages/diffoscope-288.dist-info

--===============5506830523211600186==--

