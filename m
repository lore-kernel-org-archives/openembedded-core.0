Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E60C4332F
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:41 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web09.10394.1648819419538283530
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=erdWc1TJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 0101017fe54bb636-fbec90be-85a8-43f3-98a3-11f04c5d5004-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819418;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NhWfpX1QyfSlck5sLk/GtANGJj9saShDxgDBU/xV8LM=;
	b=erdWc1TJ4gWliba/zEFS8i24qaJJ5I5TQERhNTatpcYTuvL5ye367h8mN/yZMtAc
	s7yeCllX4RRrYwdJeCcnbb5aA78uYtim5psWtZ8w0Gm3Rap7W3kjFJkOEg7F+AeIHHd
	xbLOl1S9qBDZ+Di+VgSSfhIJrRVyojBiYc8n0oDQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819418;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NhWfpX1QyfSlck5sLk/GtANGJj9saShDxgDBU/xV8LM=;
	b=bmrmdjWX85Kc1mCS6zBiY2P76xGDx4SqlISfjqmDL942FSRbtZxrvLgbhKMuJTTY
	qvnlauST/gAPX55XtwQodDs/EUmP05URdsuBl12/tmR0C7vDsD56ttJbWBhQbqHyQEM
	jFLdKPfn4F8nXCdyda0P89nGXvUQNhha/st+t1hw=
Content-Type: multipart/mixed; boundary="===============0322897313524692087=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] expat: upgrading to 2.4.8 SUCCEEDED
Message-ID: 
 <0101017fe54bb636-fbec90be-85a8-43f3-98a3-11f04c5d5004-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:38 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163886

--===============0322897313524692087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *expat* to *2.4.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-expat-upgrade-2.4.7-2.4.8.patch
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
--===============0322897313524692087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/expat/expat: FILELIST: removed "/usr/lib/libexpat.so.1.8.7", added "/usr/lib/libexpat.so.1.8.8"
Changes to packages/core2-32-poky-linux/expat (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.8.7 to libexpat.so.1.8.8
  /usr/lib/cmake/expat-2.4.7 moved to /usr/lib/cmake/expat-2.4.8
  /usr/lib/libexpat.so.1.8.7 moved to /usr/lib/libexpat.so.1.8.8

--===============0322897313524692087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/expat/expat-bin: PV changed from "2.4.7" to "2.4.8"
packages/core2-32-poky-linux/expat/expat-bin: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-32-poky-linux/expat/expat-dbg: PV changed from "2.4.7" to "2.4.8"
packages/core2-32-poky-linux/expat/expat-dbg: FILELIST: removed "/usr/lib/.debug/libexpat.so.1.8.7", added "/usr/lib/.debug/libexpat.so.1.8.8"
packages/core2-32-poky-linux/expat/expat-dbg: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-32-poky-linux/expat/expat-dev: PV changed from "2.4.7" to "2.4.8"
packages/core2-32-poky-linux/expat/expat-dev: PKGSIZE changed from 64489 to 64503 (+0%)
packages/core2-32-poky-linux/expat/expat-dev: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-32-poky-linux/expat/expat-doc: PV changed from "2.4.7" to "2.4.8"
packages/core2-32-poky-linux/expat/expat-doc: PKGSIZE changed from 69834 to 70539 (+1%)
packages/core2-32-poky-linux/expat/expat-doc: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-32-poky-linux/expat/expat-locale: PV changed from "2.4.7" to "2.4.8"
packages/core2-32-poky-linux/expat/expat-locale: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-32-poky-linux/expat/expat-ptest: PV changed from "2.4.7" to "2.4.8"
packages/core2-32-poky-linux/expat/expat-ptest: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-32-poky-linux/expat/expat-src: PV changed from "2.4.7" to "2.4.8"
packages/core2-32-poky-linux/expat/expat-src: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-32-poky-linux/expat/expat-staticdev: PV changed from "2.4.7" to "2.4.8"
packages/core2-32-poky-linux/expat/expat-staticdev: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-32-poky-linux/expat/expat: PV changed from "2.4.7" to "2.4.8"
packages/core2-32-poky-linux/expat/expat: FILELIST: removed "/usr/lib/libexpat.so.1.8.7", added "/usr/lib/libexpat.so.1.8.8"
packages/core2-32-poky-linux/expat/expat: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
packages/core2-32-poky-linux/expat: SRC_URI changed from "https://github.com/libexpat/libexpat/releases/download/R_2_4_7/expat-2.4.7.tar.bz2 file://run-ptest" to "https://github.com/libexpat/libexpat/releases/download/R_2_4_8/expat-2.4.8.tar.bz2 file://run-ptest"
packages/core2-32-poky-linux/expat: PV changed from "2.4.7" to "2.4.8"
packages/core2-32-poky-linux/expat: PKGV changed from 2.4.7 [default] to 2.4.8 [default]
Changes to packages/core2-32-poky-linux/expat (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.8.7 to libexpat.so.1.8.8
  /usr/lib/cmake/expat-2.4.7 moved to /usr/lib/cmake/expat-2.4.8
  /usr/lib/libexpat.so.1.8.7 moved to /usr/lib/libexpat.so.1.8.8

--===============0322897313524692087==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-expat-upgrade-2.4.7-2.4.8.patch"

From cdc33864d332fec43bdce5caeb7257d61369412c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 06:14:22 +0000
Subject: [PATCH] expat: upgrade 2.4.7 -> 2.4.8

---
 meta/recipes-core/expat/{expat_2.4.7.bb => expat_2.4.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.4.7.bb => expat_2.4.8.bb} (91%)

diff --git a/meta/recipes-core/expat/expat_2.4.7.bb b/meta/recipes-core/expat/expat_2.4.8.bb
similarity index 91%
rename from meta/recipes-core/expat/expat_2.4.7.bb
rename to meta/recipes-core/expat/expat_2.4.8.bb
index bf1ca8d56e..980c488640 100644
--- a/meta/recipes-core/expat/expat_2.4.7.bb
+++ b/meta/recipes-core/expat/expat_2.4.8.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
 
-SRC_URI[sha256sum] = "e149bdd8b90254c62b3d195da53a09bd531a4d63a963b0d8a5268d48dd2f6a65"
+SRC_URI[sha256sum] = "a247a7f6bbb21cf2ca81ea4cbb916bfb9717ca523631675f99b3d4a5678dcd16"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.27.0


--===============0322897313524692087==--

