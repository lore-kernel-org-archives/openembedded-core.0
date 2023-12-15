Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7909AC48260
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:52 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.63622.1702649867822907050
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=d60Ee9Zu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LLHbfRIW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018c6dd72f40-e5de3dab-6a7e-4318-b038-c004dcf99d40-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649868;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=53QR1tkzqEtX9fff3cwi4RnB9UBQZ3+Rb+iWzh0xuSQ=;
	b=d60Ee9Zuz37pGm2IhDi30UT1e1eQ5xdrMzRxU+L3f7/GdAeLCrjwzESuyMvRbsIn
	fHOMWNJsjy9ls+OrO+i4FMrEsCDIdYOLjzIsJo2VNuNk+WQjphPacWg0/p+lBueM2br
	v1HneYfPiCdtbn6hFfy945d8/l3fcWS9a10HCJxI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649868;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=53QR1tkzqEtX9fff3cwi4RnB9UBQZ3+Rb+iWzh0xuSQ=;
	b=LLHbfRIW2CE4j6oMl4hpxQsoiJwygksQpF3RndYVLjl6iw86xMd7SM1MAHuxuSWw
	8Bxe8K/rRKAjBoMTrclHBgexsKnMkWNxYKzA6ETcps8PuuKI3yz5Tj5IYirPzl8f6VX
	BaDRXZC4iFmMeU/sCES6d/fSWMnSsc1LD3OIUo+g=
Content-Type: multipart/mixed; boundary="===============3291948814482599525=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 08365fb260ae6e32442dd9f196e65d13facb4b33
 SUCCEEDED
Message-ID: <0101018c6dd72f40-e5de3dab-6a7e-4318-b038-c004dcf99d40-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192508

--===============3291948814482599525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *08365fb260ae6e32442dd9f196e65d13facb4b33* has Succeeded.

Next steps:
    - apply the patch: git am 0001-puzzles-upgrade-to-latest-revision.patch
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
From f97b3ec94d75b6346dba39dacbe454603b82416e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Dec 2023 11:38:03 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index d0a9af7cb6..ab4b2394b8 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "96d65e852cea8a95001fa70e3ec2996d4ea5e2b4"
+SRCREV = "08365fb260ae6e32442dd9f196e65d13facb4b33"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.42.0


--===============3291948814482599525==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSBmOTdiM2VjOTRkNzViNjM0NmRiYTM5ZGFjYmU0NTQ2MDNiODI0MTZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgRGVjIDIwMjMgMTE6Mzg6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0
by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6
emxlcy9wdXp6bGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19n
aXQuYmIKaW5kZXggZDBhOWFmN2NiNi4uYWI0YjIzOTRiOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by9w
dXp6bGVzL3B1enpsZXNfZ2l0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFJFUVVJUkVEX0RJU1RST19G
RUFUVVJFUyA9ICJ4MTEiCiBTUkNfVVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24v
cHV6emxlcy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMiCiAKIFVQU1RSRUFNX0NIRUNL
X0NPTU1JVFMgPSAiMSIKLVNSQ1JFViA9ICI5NmQ2NWU4NTJjZWE4YTk1MDAxZmE3MGUzZWMyOTk2
ZDRlYTVlMmI0IgorU1JDUkVWID0gIjA4MzY1ZmIyNjBhZTZlMzI0NDJkZDlmMTk2ZTY1ZDEzZmFj
YjRiMzMiCiBQRSA9ICIyIgogUFYgPSAiMC4wK2dpdCIKIAotLSAKMi40Mi4wCgo=

--===============3291948814482599525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+96d65e852c to 0.0+git0+08365fb260
packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 19529816 to 19530448 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+96d65e852c to 0.0+git0+08365fb260
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+96d65e852c to 0.0+git0+08365fb260
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+96d65e852c to 0.0+git0+08365fb260
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+96d65e852c to 0.0+git0+08365fb260
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3837866 to 3838531 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+96d65e852c to 0.0+git0+08365fb260
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+96d65e852c to 0.0+git0+08365fb260

--===============3291948814482599525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+96d65e852c to 0.0+git0+08365fb260
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+96d65e852c to 0.0+git0+08365fb260
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+96d65e852c to 0.0+git0+08365fb260
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+96d65e852c to 0.0+git0+08365fb260
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+96d65e852c to 0.0+git0+08365fb260
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+96d65e852c to 0.0+git0+08365fb260
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+96d65e852c to 0.0+git0+08365fb260

--===============3291948814482599525==--

