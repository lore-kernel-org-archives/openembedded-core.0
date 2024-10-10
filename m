Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08974CFD34F
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:18 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.53349.1728588940440488457
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=EcY9TTPg;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=bNs435bD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019277ee7558-3ad85f88-6c52-4526-8b65-9172a3410804-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588969;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VkcyY+OS28Cu5S4THylmcIvXGGmvIqLoQlHSlnsex7E=;
	b=EcY9TTPgq9RjXU8HYNi0trCbk8HEKo2d8no/3ncbvksz5PJbL66seX1fjiduHKU1
	7AmGMduYJiyC6uBabCX0I4sZaSltlrciaISUq9wLSAa7XfvUFILoeARWlunFLD8VBif
	i9sSx1rEpqKhOXwJWx5iMrSohJUMIkDLMb+A4HIQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588969;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VkcyY+OS28Cu5S4THylmcIvXGGmvIqLoQlHSlnsex7E=;
	b=bNs435bDUKy1tq0hjkgnOrw1wrHwkO9+YFgjaxWcDF1sPBeoZLMr78m/9YEFMQ1F
	fa3YuHP2fZjEtxZY7af9t0MYBqurNOT3y9iIcqZjeGb+Nb9aaZwcgxpQ40kMxCTitUy
	ACzijNaSkG7uIcaZ8E/C1ay7qsF0VcP//Je4k6kg=
Content-Type: multipart/mixed; boundary="===============6609243687281387585=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 182b3d9e27981c03df07cc86d8f794ad218dc350
 SUCCEEDED
Message-ID: <0101019277ee7558-3ad85f88-6c52-4526-8b65-9172a3410804-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205522

--===============6609243687281387585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *puzzles* to *182b3d9e27981c03df07cc86d8f794ad218dc350* has Succeeded.

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
From 6f4f499d3456c6796f884275c85c40169625787f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 16:13:15 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index b47d3d3f30..f07ad934c4 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "1c1899ee1c4e0a83808998359addb1efb66322f8"
+SRCREV = "182b3d9e27981c03df07cc86d8f794ad218dc350"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.44.1


--===============6609243687281387585==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSA2ZjRmNDk5ZDM0NTZjNjc5NmY4ODQyNzVjODVjNDAxNjk2MjU3ODdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTY6MTM6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0
by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6
emxlcy9wdXp6bGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19n
aXQuYmIKaW5kZXggYjQ3ZDNkM2YzMC4uZjA3YWQ5MzRjNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by9w
dXp6bGVzL3B1enpsZXNfZ2l0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFJFUVVJUkVEX0RJU1RST19G
RUFUVVJFUyA9ICJ4MTEiCiBTUkNfVVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24v
cHV6emxlcy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMiCiAKIFVQU1RSRUFNX0NIRUNL
X0NPTU1JVFMgPSAiMSIKLVNSQ1JFViA9ICIxYzE4OTllZTFjNGUwYTgzODA4OTk4MzU5YWRkYjFl
ZmI2NjMyMmY4IgorU1JDUkVWID0gIjE4MmIzZDllMjc5ODFjMDNkZjA3Y2M4NmQ4Zjc5NGFkMjE4
ZGMzNTAiCiBQRSA9ICIyIgogUFYgPSAiMC4wK2dpdCIKIAotLSAKMi40NC4xCgo=

--===============6609243687281387585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+182b3d9e27
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+182b3d9e27
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+182b3d9e27
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+182b3d9e27
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+182b3d9e27
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+182b3d9e27
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+182b3d9e27

--===============6609243687281387585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+182b3d9e27
packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 19630424 to 19791704 (+1%)
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+182b3d9e27
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+182b3d9e27
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+182b3d9e27
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+182b3d9e27
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3853044 to 3848635 (-0%)
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+182b3d9e27
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+182b3d9e27

--===============6609243687281387585==--

