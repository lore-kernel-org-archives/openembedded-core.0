Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0197CC369CB
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:45 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.10326.1742048290056029441
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OuJkCfXf;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=tIuPlziP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101959a2bd0b3-4a47d0f0-b691-4372-9eb7-9377c4a0dc02-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048317;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DryevwMW/NZAG5hCjXiDLIDWBE7ihPxIb7J4tf+nXOM=;
	b=OuJkCfXfiwvXRi996Z2wcQzilYEMLxpji+ofICiRBTkopC5FjoHjHEfyarzGXkbn
	6Uu84U2x9mWZbixy91WoLisqs8dFpceZMQ8Z8fIEoeL0ljunWmpddnfaSRXewilOfu2
	wHOPnMnNuKpGG80NgT46tW2ONKjU1vHp/SckmCQQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048317;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DryevwMW/NZAG5hCjXiDLIDWBE7ihPxIb7J4tf+nXOM=;
	b=tIuPlziPMSBfZOMLh5VYnOlENeXfZmiCyWPnLbPV7yKYqSgcy5OMjXKKhhoihM/V
	qfmAIJicV4guDxbjfl2UrXYuyLhdRbqMe9aqP7RnVvKmC/5T9uOYtLd3GgiBQy+OW07
	d1TS0qukVtfSIU62h93e8dPj2XQFISGDc3hb6Qfs=
Content-Type: multipart/mixed; boundary="===============4918215438804801451=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 289 SUCCEEDED
Message-ID: <010101959a2bd0b3-4a47d0f0-b691-4372-9eb7-9377c4a0dc02-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212971

--===============4918215438804801451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *289* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-287-289.patch
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
From 46186d683952519e9026e9f3f8c0aefe4f31acce Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 13:55:48 +0000
Subject: [PATCH] diffoscope: upgrade 287 -> 289

---
 .../diffoscope/{diffoscope_287.bb => diffoscope_289.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_287.bb => diffoscope_289.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_287.bb b/meta/recipes-support/diffoscope/diffoscope_289.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_287.bb
rename to meta/recipes-support/diffoscope/diffoscope_289.bb
index 8f8f114054..af7d6b5d73 100644
--- a/meta/recipes-support/diffoscope/diffoscope_287.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_289.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "51702676957edb4c16ad93bcfc25bfdbcdb0c39fa7d1d16f657db71cfaa58ceb"
+SRC_URI[sha256sum] = "b9b2e598e62eb2220376e252692ac534d8d921d4314ec288d8c7415d3041dd9d"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.44.1


--===============4918215438804801451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 923 .bb files complete (0 cached, 923 parsed). 1885 targets, 50 skipped, 0 masked, 0 errors.
Removing 101 recipes from the core2-64 sysroot...done.
Removing 131 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============4918215438804801451==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-287-289.patch"

RnJvbSA0NjE4NmQ2ODM5NTI1MTllOTAyNmU5ZjNmOGMwYWVmZTRmMzFhY2NlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMTM6NTU6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDI4NyAtPiAyODkKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjg3LmJiID0+IGRpZmZvc2NvcGVfMjg5LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yODcuYmIgPT4gZGlmZm9zY29wZV8y
ODkuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI4Ny5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yODkuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI4Ny5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI4OS5iYgppbmRleCA4ZjhmMTE0
MDU0Li5hZjdkNmI1ZDczIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjg3LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yODkuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNTE3MDI2NzY5NTdlZGI0YzE2YWQ5M2JjZmMyNWJmZGJjZGIwYzM5ZmE3ZDFkMTZmNjU3
ZGI3MWNmYWE1OGNlYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiOWIyZTU5OGU2MmViMjIyMDM3
NmUyNTI2OTJhYzUzNGQ4ZDkyMWQ0MzE0ZWMyODhkOGM3NDE1ZDMwNDFkZDlkIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiXAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ0LjEKCg==

--===============4918215438804801451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "287" to "289"
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 287 [default] to 289 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "287" to "289"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 287 [default] to 289 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "287" to "289"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 287 [default] to 289 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "287" to "289"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 287 [default] to 289 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "287" to "289"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 287 [default] to 289 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "287" to "289"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 287 [default] to 289 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "287" to "289"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 287 [default] to 289 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1376597 to 1376815 (+0%)
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-287.tar.gz;downloadfilename=diffoscope-287.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-289.tar.gz;downloadfilename=diffoscope-289.tar.gz"
packages/core2-64-poky-linux/diffoscope: PV changed from "287" to "289"
packages/core2-64-poky-linux/diffoscope: PKGV changed from 287 [default] to 289 [default]
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.13/site-packages/diffoscope-287.dist-info moved to /usr/lib/python3.13/site-packages/diffoscope-289.dist-info

--===============4918215438804801451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.13/site-packages/diffoscope-287.dist-info moved to /usr/lib/python3.13/site-packages/diffoscope-289.dist-info

--===============4918215438804801451==--

