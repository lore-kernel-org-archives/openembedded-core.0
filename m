Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE84C3064D
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:25 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.18377.1718475799429290348
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=UwFBeosI;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=1V7ADiq5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101901d23bf11-46aea164-5c66-4582-b288-c475f0007a37-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Xn29pVJ0g1kVJVcLeUAsEa5JaDksJEJVlm8XEA9lckw=;
	b=UwFBeosI2+9r/6spLxeSnwBapmUS/R3u30rOkk1/8fvIUKKQ+nRCUmd03eibcBjp
	TePESGwdDESCq2gQukjvqDbRuP+yrGPvRmfoql4jn6RiCL/J2R/8Hj/1NtKyPZfYVl6
	dD3e7FCCGE3/C0lJJ9Wu/kxCDOHSoqRsr2aaTu78=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Xn29pVJ0g1kVJVcLeUAsEa5JaDksJEJVlm8XEA9lckw=;
	b=1V7ADiq5ig5Ad9bQNZpQ/yzXxbzDQu0IFU2ZqHrT/cmR3s3QUl0R8pMeI1o2nMT3
	MWjEA8AboWBZOXu/tDhKQ7MH/+/Bq/YVmR5f7lhzRwTSuI9JM34VKTDMw7vor+tusk5
	p91lOmd9OivmC2t907jV9ii53q1AMJzLH72qRo4w=
Content-Type: multipart/mixed; boundary="===============7636068683389807530=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to fd304c53cc45dc05b3f95c20a466e20a7e1c9194
 SUCCEEDED
Message-ID: <010101901d23bf11-46aea164-5c66-4582-b288-c475f0007a37-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200744

--===============7636068683389807530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *fd304c53cc45dc05b3f95c20a466e20a7e1c9194* has Succeeded.

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
From 9dcd5ee9e1a92767d025317bc62e95ccb20175fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 16:10:19 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index e9403ee130..0ed066a5b5 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "80aac3104096aee4057b675c53ece8e60793aa90"
+SRCREV = "fd304c53cc45dc05b3f95c20a466e20a7e1c9194"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.44.0


--===============7636068683389807530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc

--===============7636068683389807530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 19609384 to 19609416 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3838603 to 3839116 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+80aac31040 to 0.0+git0+fd304c53cc

--===============7636068683389807530==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSA5ZGNkNWVlOWUxYTkyNzY3ZDAyNTMxN2JjNjJlOTVjY2IyMDE3NWZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMTY6MTA6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0
by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6
emxlcy9wdXp6bGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19n
aXQuYmIKaW5kZXggZTk0MDNlZTEzMC4uMGVkMDY2YTViNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by9w
dXp6bGVzL3B1enpsZXNfZ2l0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFJFUVVJUkVEX0RJU1RST19G
RUFUVVJFUyA9ICJ4MTEiCiBTUkNfVVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24v
cHV6emxlcy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMiCiAKIFVQU1RSRUFNX0NIRUNL
X0NPTU1JVFMgPSAiMSIKLVNSQ1JFViA9ICI4MGFhYzMxMDQwOTZhZWU0MDU3YjY3NWM1M2VjZThl
NjA3OTNhYTkwIgorU1JDUkVWID0gImZkMzA0YzUzY2M0NWRjMDViM2Y5NWMyMGE0NjZlMjBhN2Ux
YzkxOTQiCiBQRSA9ICIyIgogUFYgPSAiMC4wK2dpdCIKIAotLSAKMi40NC4wCgo=

--===============7636068683389807530==--

