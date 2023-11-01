Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BB2C07EBA
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:13 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.8665.1698848705501962233
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RxaMc/FV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ayKXA45D;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.30, mailfrom: 0101018b8b460955-7a9814fc-bcaa-4689-8b1c-6d8e1729b22b-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=t1VMS+5fReN6T8wOiX9d89KRZEAXpQd8L43pOMgS6Po=;
	b=RxaMc/FVAGsmYRpO/m+vbHPMyGf+oFD+cF/Z2EhQNptUO86WOr2cfOyNg7drX8oM
	eVju33sZ2jI+8iWx9SK+9gDilC8C6LRcJy8hHbU8qYcqMo9Pq40nisuvQ7kZsG53sq6
	OeeSFA9vpJohvEpud5szDIG7yRT8IEWD6OPN1bFI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=t1VMS+5fReN6T8wOiX9d89KRZEAXpQd8L43pOMgS6Po=;
	b=ayKXA45DsVZqQ8i/IPIAC18AtOVDK48oTIKY24DpqPwZf0gkj/z0rgC+D9oyAJwo
	ysTxR0VHMjeUImnQMB55k7ulv/ldSR0RTBXOldY8ARdpJ/0SppcyoMvwnPaOsw7AdqR
	WXCC1kHCdq3bDC4WxFKzOl/48JPVXVs1ji2TSMOE=
Content-Type: multipart/mixed; boundary="===============6844840975620899204=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libnsl2: upgrading to 2.0.1 SUCCEEDED
Message-ID: <0101018b8b460955-7a9814fc-bcaa-4689-8b1c-6d8e1729b22b-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189990

--===============6844840975620899204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libnsl2* to *2.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libnsl2-upgrade-2.0.0-2.0.1.patch
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
From 413e960e6f81409ad2b6fdf0146716071a55e781 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 11:19:18 +0000
Subject: [PATCH] libnsl2: upgrade 2.0.0 -> 2.0.1

---
 meta/recipes-extended/libnsl/libnsl2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb b/meta/recipes-extended/libnsl/libnsl2_git.bb
index 7919ef9b24..8cc1f7cec3 100644
--- a/meta/recipes-extended/libnsl/libnsl2_git.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "libtirpc"
 
-PV = "2.0.0"
+PV = "2.0.1"
 
-SRCREV = "82245c0c58add79a8e34ab0917358217a70e5100"
+SRCREV = "d4b22e54b5e6637a69b26eab5faad2a326c9b182"
 
 SRC_URI = "git://github.com/thkukuk/libnsl;branch=master;protocol=https \
           "
-- 
2.39.2


--===============6844840975620899204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libnsl2: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/libnsl2: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/libnsl2/libnsl2-dbg: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/libnsl2/libnsl2-dbg: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/libnsl2/libnsl2-dbg: PKGSIZE changed from 100880 to 100840 (-0%)
packages/core2-64-poky-linux/libnsl2/libnsl2-dev: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/libnsl2/libnsl2-dev: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/libnsl2/libnsl2-doc: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/libnsl2/libnsl2-doc: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/libnsl2/libnsl2-locale: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/libnsl2/libnsl2-locale: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/libnsl2/libnsl2-src: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/libnsl2/libnsl2-src: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/libnsl2/libnsl2-staticdev: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/libnsl2/libnsl2-staticdev: PV changed from "2.0.0" to "2.0.1"
packages/core2-64-poky-linux/libnsl2/libnsl2: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-64-poky-linux/libnsl2/libnsl2: PV changed from "2.0.0" to "2.0.1"

--===============6844840975620899204==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libnsl2-upgrade-2.0.0-2.0.1.patch"

RnJvbSA0MTNlOTYwZTZmODE0MDlhZDJiNmZkZjAxNDY3MTYwNzFhNTVlNzgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMToxOToxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Ym5zbDI6IHVwZ3JhZGUgMi4wLjAgLT4gMi4wLjEKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2xpYm5zbC9saWJuc2wyX2dpdC5iYiB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvbGlibnNsL2xpYm5zbDJfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYm5zbC9s
aWJuc2wyX2dpdC5iYgppbmRleCA3OTE5ZWY5YjI0Li44Y2MxZjdjZWMzIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlibnNsL2xpYm5zbDJfZ2l0LmJiCisrKyBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9saWJuc2wvbGlibnNsMl9naXQuYmIKQEAgLTEwLDkgKzEwLDkgQEAgTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5
MDA4YjM2NDUxNmMiCiBTRUNUSU9OID0gImxpYnMiCiBERVBFTkRTID0gImxpYnRpcnBjIgogCi1Q
ViA9ICIyLjAuMCIKK1BWID0gIjIuMC4xIgogCi1TUkNSRVYgPSAiODIyNDVjMGM1OGFkZDc5YThl
MzRhYjA5MTczNTgyMTdhNzBlNTEwMCIKK1NSQ1JFViA9ICJkNGIyMmU1NGI1ZTY2MzdhNjliMjZl
YWI1ZmFhZDJhMzI2YzliMTgyIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vdGhrdWt1
ay9saWJuc2w7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIgotLSAK
Mi4zOS4yCgo=

--===============6844840975620899204==--

