Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D57C47080
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:11 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web12.2221.1651434543110113005
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=yTaN3z2w;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010180812b535a-a05c3eb3-5943-4cc2-a45b-25a566b1742f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=w4Z6EhCqQV1umFF1eYxDGDnOq8mJZzLxGg5anaHJ2wM=;
	b=yTaN3z2wFFGyYGlJAyWsLOvrne3s8upOZj7nD0aZyqly6k37YMXBf/r/riRdAgsU
	fjO7sZ1NqxUYi0+YYHtaAm/0Bln8G+L43XamIS+tDb0KHI3AZgcOcXtqodtDJHIBN3N
	0DP2hpz0eF/8zVGLzdT/DomXaBWa7S1y9OBfnZiM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=w4Z6EhCqQV1umFF1eYxDGDnOq8mJZzLxGg5anaHJ2wM=;
	b=GKjWaY1bSs3nr9rJcDdBAjAkHpgxiyFakLuIqJpd/Pi7qWXEyzGn6ZKz4dFF4Gv4
	SvwyGu9ZQkoO0s7hvEouNC168IG0XbUcrI7Um63LMkzF58eLWvrAW5mOgt1j1HdS3bT
	wmnlhndGUuFpxyXstQnKc7DoPcJ4FjiQl3IofG64=
Content-Type: multipart/mixed; boundary="===============8049245735327018847=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mmc-utils: upgrading to
 b7e4d5a6ae9942d26a11de9b05ae7d52c0802802 SUCCEEDED
Message-ID: 
 <01010180812b535a-a05c3eb3-5943-4cc2-a45b-25a566b1742f-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165109

--===============8049245735327018847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mmc-utils* to *b7e4d5a6ae9942d26a11de9b05ae7d52c0802802* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mmc-utils-upgrade-to-latest-revision.patch
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
--===============8049245735327018847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+4303889c8b to 0.1+git0+b7e4d5a6ae
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+4303889c8b to 0.1+git0+b7e4d5a6ae
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+4303889c8b to 0.1+git0+b7e4d5a6ae
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+4303889c8b to 0.1+git0+b7e4d5a6ae
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+4303889c8b to 0.1+git0+b7e4d5a6ae
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+4303889c8b to 0.1+git0+b7e4d5a6ae
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+4303889c8b to 0.1+git0+b7e4d5a6ae

--===============8049245735327018847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mmc-utils: PKGV changed from 0.1+gitAUTOINC+4303889c8b [default] to 0.1+gitAUTOINC+b7e4d5a6ae [default]
packages/core2-32-poky-linux/mmc-utils: PV changed from "0.1+gitAUTOINC+4303889c8b" to "0.1+gitAUTOINC+b7e4d5a6ae"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGSIZE changed from 233940 to 235920 (+1%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PV changed from "0.1+gitAUTOINC+4303889c8b" to "0.1+gitAUTOINC+b7e4d5a6ae"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+4303889c8b to 0.1+git0+b7e4d5a6ae
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PV changed from "0.1+gitAUTOINC+4303889c8b" to "0.1+gitAUTOINC+b7e4d5a6ae"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+4303889c8b to 0.1+git0+b7e4d5a6ae
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PV changed from "0.1+gitAUTOINC+4303889c8b" to "0.1+gitAUTOINC+b7e4d5a6ae"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+4303889c8b to 0.1+git0+b7e4d5a6ae
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PV changed from "0.1+gitAUTOINC+4303889c8b" to "0.1+gitAUTOINC+b7e4d5a6ae"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+4303889c8b to 0.1+git0+b7e4d5a6ae
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGSIZE changed from 208563 to 210092 (+1%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PV changed from "0.1+gitAUTOINC+4303889c8b" to "0.1+gitAUTOINC+b7e4d5a6ae"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+4303889c8b to 0.1+git0+b7e4d5a6ae
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PV changed from "0.1+gitAUTOINC+4303889c8b" to "0.1+gitAUTOINC+b7e4d5a6ae"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+4303889c8b to 0.1+git0+b7e4d5a6ae
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGSIZE changed from 130756 to 130788 (+0%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PV changed from "0.1+gitAUTOINC+4303889c8b" to "0.1+gitAUTOINC+b7e4d5a6ae"
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+4303889c8b to 0.1+git0+b7e4d5a6ae

--===============8049245735327018847==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-mmc-utils-upgrade-to-latest-revision.patch"

From 8cfdaa21c5f3294b01096605fea4a95fd614b5d3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 09:34:05 +0000
Subject: [PATCH] mmc-utils: upgrade to latest revision

---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index addefe9abf..3e611d1306 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "4303889c8bd9a2357587eb6ebacecb70098a264d"
+SRCREV = "b7e4d5a6ae9942d26a11de9b05ae7d52c0802802"
 
 PV = "0.1+git${SRCPV}"
 
-- 
2.27.0


--===============8049245735327018847==--

