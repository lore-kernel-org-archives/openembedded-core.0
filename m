Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2180C54F38
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:15 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.14639.1700059033858554483
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CNni3HpV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XbnNWfTI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018bd36a2e66-c86d1545-fa3b-4852-a882-717ea0acc81d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059033;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MQNwKeCrGVelqHRwfj6Qa5RSg/PksT5QO7sPYdMxukM=;
	b=CNni3HpVo2FNn9YvJVA9ae/BFfntasr6ZAL+hUxF2THM5njMtC3i4qURmdN4GAtJ
	EdCLMe/Rb6h1VN2UirWbbDm89QIlN0p9f8jXO1TLk4gb3lJa0DqkWC3Xf39LdOXdRpk
	bLifZpYBmv1W8yMu9FWQx7qTarMFZ1m+PprmPpS4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059033;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MQNwKeCrGVelqHRwfj6Qa5RSg/PksT5QO7sPYdMxukM=;
	b=XbnNWfTI3A9rKs8UHTMSbBknHI6qTxaYNDG3IXCZ2BuxnZzAnrhHYPBaSESFvK41
	LyjTx7T0n1MlQJILWRWXqtjhjnxkFFyiklYcEo2STcA0sGoiVyFHuQeXwMLZAzyZZJP
	RV5ZK+vXRHL/dSBYO54mLilwj0yxzBXo/5AIbmMc=
Content-Type: multipart/mixed; boundary="===============3868077589415430288=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 96d65e852cea8a95001fa70e3ec2996d4ea5e2b4
 SUCCEEDED
Message-ID: <0101018bd36a2e66-c86d1545-fa3b-4852-a882-717ea0acc81d-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190717

--===============3868077589415430288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *96d65e852cea8a95001fa70e3ec2996d4ea5e2b4* has Succeeded.

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
From 7da6132aa49433874c1bae7158f8112e69585e7f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 13:46:32 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index d7089ef95d..d0a9af7cb6 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "2d9e414ee316b37143954150016e8f4f18358497"
+SRCREV = "96d65e852cea8a95001fa70e3ec2996d4ea5e2b4"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.39.2


--===============3868077589415430288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+96d65e852c
packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 19532880 to 19533616 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+96d65e852c
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+96d65e852c
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+96d65e852c
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+96d65e852c
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3837742 to 3837866 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+96d65e852c
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+96d65e852c

--===============3868077589415430288==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSA3ZGE2MTMyYWE0OTQzMzg3NGMxYmFlNzE1OGY4MTEyZTY5NTg1ZTdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMTM6NDY6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0
by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6
emxlcy9wdXp6bGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19n
aXQuYmIKaW5kZXggZDcwODllZjk1ZC4uZDBhOWFmN2NiNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by9w
dXp6bGVzL3B1enpsZXNfZ2l0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFJFUVVJUkVEX0RJU1RST19G
RUFUVVJFUyA9ICJ4MTEiCiBTUkNfVVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24v
cHV6emxlcy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMiCiAKIFVQU1RSRUFNX0NIRUNL
X0NPTU1JVFMgPSAiMSIKLVNSQ1JFViA9ICIyZDllNDE0ZWUzMTZiMzcxNDM5NTQxNTAwMTZlOGY0
ZjE4MzU4NDk3IgorU1JDUkVWID0gIjk2ZDY1ZTg1MmNlYThhOTUwMDFmYTcwZTNlYzI5OTZkNGVh
NWUyYjQiCiBQRSA9ICIyIgogUFYgPSAiMC4wK2dpdCIKIAotLSAKMi4zOS4yCgo=

--===============3868077589415430288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+96d65e852c
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+96d65e852c
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+96d65e852c
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+96d65e852c
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+96d65e852c
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+96d65e852c
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+2d9e414ee3 to 0.0+git0+96d65e852c

--===============3868077589415430288==--

