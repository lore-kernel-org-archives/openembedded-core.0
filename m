Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38468C27C5F
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:20 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.1267.1715794337107337817
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=aOynAU0I;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=UB6v3/tZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018f7d4fda54-ec733e1d-e362-4106-8e58-e98731f5dbf3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794336;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=L2L7XxrCkHlY+d1sw49q+qpaPJDvJKSgy3GYBwPNW+I=;
	b=aOynAU0IOzz0uvXlr4Pi4xoQoWlVTTrFvWLfvIkVjcJr+VLnBnZZCwzkqKQQr5KZ
	f/zfjb3pgVkHs6SkttaO6Hnj5eSTxx0Y2OaRIIq3weixbiHAAHLATESVdxeG77nkb28
	FYweLGn/ci03r/gHh+JW6MhbGR3ZzIASUkmV1C8E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794336;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=L2L7XxrCkHlY+d1sw49q+qpaPJDvJKSgy3GYBwPNW+I=;
	b=UB6v3/tZ7Zen4QVvxv/aYHJ0FI8U3akx3i17bo7ESCOnM6QrNGzZzxbg0P7er4A6
	5z6zMS8p+HuHOLLf0vHf2MjzYUY9e7T1NbsV43gVy2COYLCLOO+spMMuWXFOAA8WtNX
	11SYs1GL4Glw48QO1Wm9ZRoCvsAPr+MXGoR0FgBU=
Content-Type: multipart/mixed; boundary="===============1592842453149058814=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libslirp: upgrading to 4.8.0 SUCCEEDED
Message-ID: <0101018f7d4fda54-ec733e1d-e362-4106-8e58-e98731f5dbf3-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199298

--===============1592842453149058814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libslirp* to *4.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libslirp-upgrade-4.7.0-4.8.0.patch
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
From 4abbe9b77ac5e054a580a29c294868f0c20fba06 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 06:59:35 +0000
Subject: [PATCH] libslirp: upgrade 4.7.0 -> 4.8.0

---
 meta/recipes-connectivity/slirp/libslirp_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/slirp/libslirp_git.bb b/meta/recipes-connectivity/slirp/libslirp_git.bb
index 334b786b9b..05830ce833 100644
--- a/meta/recipes-connectivity/slirp/libslirp_git.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_git.bb
@@ -5,8 +5,8 @@ LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bca0186b14e6b05e338e729f106db727"
 
 SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
-SRCREV = "3ad1710a96678fe79066b1469cead4058713a1d9"
-PV = "4.7.0"
+SRCREV = "ce314e39458223c2c42245fe536fbe1bcd94e9b1"
+PV = "4.8.0"
 S = "${WORKDIR}/git"
 
 DEPENDS = " \
-- 
2.44.0


--===============1592842453149058814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libslirp: PKGV changed from 4.7.0 [default] to 4.8.0 [default]
packages/core2-64-poky-linux/libslirp: PV changed from "4.7.0" to "4.8.0"
packages/core2-64-poky-linux/libslirp/libslirp-dbg: PKGSIZE changed from 520320 to 534032 (+3%)
packages/core2-64-poky-linux/libslirp/libslirp-dbg: PKGV changed from 4.7.0 [default] to 4.8.0 [default]
packages/core2-64-poky-linux/libslirp/libslirp-dbg: PV changed from "4.7.0" to "4.8.0"
packages/core2-64-poky-linux/libslirp/libslirp-dev: PKGSIZE changed from 11300 to 13770 (+22%)
packages/core2-64-poky-linux/libslirp/libslirp-dev: PKGV changed from 4.7.0 [default] to 4.8.0 [default]
packages/core2-64-poky-linux/libslirp/libslirp-dev: PV changed from "4.7.0" to "4.8.0"
packages/core2-64-poky-linux/libslirp/libslirp-doc: PKGV changed from 4.7.0 [default] to 4.8.0 [default]
packages/core2-64-poky-linux/libslirp/libslirp-doc: PV changed from "4.7.0" to "4.8.0"
packages/core2-64-poky-linux/libslirp/libslirp-locale: PKGV changed from 4.7.0 [default] to 4.8.0 [default]
packages/core2-64-poky-linux/libslirp/libslirp-locale: PV changed from "4.7.0" to "4.8.0"
packages/core2-64-poky-linux/libslirp/libslirp-src: PKGSIZE changed from 537577 to 565458 (+5%)
packages/core2-64-poky-linux/libslirp/libslirp-src: PKGV changed from 4.7.0 [default] to 4.8.0 [default]
packages/core2-64-poky-linux/libslirp/libslirp-src: PV changed from "4.7.0" to "4.8.0"
packages/core2-64-poky-linux/libslirp/libslirp-staticdev: PKGV changed from 4.7.0 [default] to 4.8.0 [default]
packages/core2-64-poky-linux/libslirp/libslirp-staticdev: PV changed from "4.7.0" to "4.8.0"
packages/core2-64-poky-linux/libslirp/libslirp: PKGV changed from 4.7.0 [default] to 4.8.0 [default]
packages/core2-64-poky-linux/libslirp/libslirp: PV changed from "4.7.0" to "4.8.0"

--===============1592842453149058814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libslirp/libslirp-dev: PKGSIZE changed from 11300 to 13770 (+22%)

--===============1592842453149058814==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libslirp-upgrade-4.7.0-4.8.0.patch"

RnJvbSA0YWJiZTliNzdhYzVlMDU0YTU4MGEyOWMyOTQ4NjhmMGMyMGZiYTA2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMDY6NTk6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzbGlycDogdXBncmFkZSA0LjcuMCAtPiA0LjguMAoKLS0tCiBtZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L3NsaXJwL2xpYnNsaXJwX2dpdC5iYiB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L3NsaXJwL2xpYnNsaXJwX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvc2xpcnAvbGlic2xpcnBfZ2l0LmJiCmluZGV4IDMzNGI3ODZiOWIuLjA1ODMwY2U4MzMg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvc2xpcnAvbGlic2xpcnBfZ2l0
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvc2xpcnAvbGlic2xpcnBfZ2l0LmJi
CkBAIC01LDggKzUsOCBAQCBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSAmIE1JVCIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0NPUFlSSUdIVDttZDU9YmNhMDE4NmIxNGU2YjA1ZTMzOGU3Mjlm
MTA2ZGI3MjciCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9zbGly
cC9saWJzbGlycC5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciIKLVNSQ1JFViA9ICIz
YWQxNzEwYTk2Njc4ZmU3OTA2NmIxNDY5Y2VhZDQwNTg3MTNhMWQ5IgotUFYgPSAiNC43LjAiCitT
UkNSRVYgPSAiY2UzMTRlMzk0NTgyMjNjMmM0MjI0NWZlNTM2ZmJlMWJjZDk0ZTliMSIKK1BWID0g
IjQuOC4wIgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogREVQRU5EUyA9ICIgXAotLSAKMi40NC4w
Cgo=

--===============1592842453149058814==--

