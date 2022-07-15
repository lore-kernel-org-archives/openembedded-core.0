Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6DBCCA48D
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:53 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web09.969.1657900669506457066
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YznIGfB8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 0101018202949704-f86c603b-83e3-4133-91ef-5155d0f2ce2c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900668;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=4ojwMSCC5oCns6xTx2hYpOnWCCWpI77jU0YLJ7Ze4qo=;
	b=YznIGfB8mJfsNp5cVfVibqo17YbquENwdeKrP2MQsHreCE7wq2tnGwrsoSCvXstb
	eXEk8d+Mys96bdUQuaevNQ962ThIxTSxHL9WvuOCaOUF6LEnLHcK4CAcfj81pI/75ZZ
	JwMJgwGExz/6UACGndso/fMIlz/oBUoZ0sjwYTyw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900668;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=4ojwMSCC5oCns6xTx2hYpOnWCCWpI77jU0YLJ7Ze4qo=;
	b=CizLeM3BIZAAz4W9As0usIFkiP/K6anpGCzHUbnLiaWb4gL9+NG+osFs3x6IJQEj
	BHHONi+hGNFReBdbFbyHJ4X7fv5DYk5t6iZ0EPjgnNlhPqhT7ESSTqSBAkEbw2UJYQB
	ACGeoj+T39XN8UJuijUMBiOD8XKo0L0KHk+Qfo9U=
Content-Type: multipart/mixed; boundary="===============4660773701012244902=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xwayland: upgrading to 22.1.3 SUCCEEDED
Message-ID: 
 <0101018202949704-f86c603b-83e3-4133-91ef-5155d0f2ce2c-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:48 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168106

--===============4660773701012244902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xwayland* to *22.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-22.1.2-22.1.3.patch
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
--===============4660773701012244902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xwayland: PKGV changed from 22.1.2 [default] to 22.1.3 [default]
packages/core2-32-poky-linux/xwayland: PV changed from "22.1.2" to "22.1.3"
packages/core2-32-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-22.1.2.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-22.1.3.tar.xz"
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PKGV changed from 22.1.2 [default] to 22.1.3 [default]
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PV changed from "22.1.2" to "22.1.3"
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 10262652 to 10267572 (+0%)
packages/core2-32-poky-linux/xwayland/xwayland-dev: PKGV changed from 22.1.2 [default] to 22.1.3 [default]
packages/core2-32-poky-linux/xwayland/xwayland-dev: PV changed from "22.1.2" to "22.1.3"
packages/core2-32-poky-linux/xwayland/xwayland-doc: PKGV changed from 22.1.2 [default] to 22.1.3 [default]
packages/core2-32-poky-linux/xwayland/xwayland-doc: PV changed from "22.1.2" to "22.1.3"
packages/core2-32-poky-linux/xwayland/xwayland-locale: PKGV changed from 22.1.2 [default] to 22.1.3 [default]
packages/core2-32-poky-linux/xwayland/xwayland-locale: PV changed from "22.1.2" to "22.1.3"
packages/core2-32-poky-linux/xwayland/xwayland-src: PKGV changed from 22.1.2 [default] to 22.1.3 [default]
packages/core2-32-poky-linux/xwayland/xwayland-src: PV changed from "22.1.2" to "22.1.3"
packages/core2-32-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8590421 to 8593951 (+0%)
packages/core2-32-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 22.1.2 [default] to 22.1.3 [default]
packages/core2-32-poky-linux/xwayland/xwayland-staticdev: PV changed from "22.1.2" to "22.1.3"
packages/core2-32-poky-linux/xwayland/xwayland: PKGV changed from 22.1.2 [default] to 22.1.3 [default]
packages/core2-32-poky-linux/xwayland/xwayland: PV changed from "22.1.2" to "22.1.3"

--===============4660773701012244902==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-22.1.2-22.1.3.patch"

From 6d162bab542a9b6c66cd7bcd5e76a30210918067 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 13:40:09 +0000
Subject: [PATCH] xwayland: upgrade 22.1.2 -> 22.1.3

---
 .../xwayland/{xwayland_22.1.2.bb => xwayland_22.1.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.2.bb => xwayland_22.1.3.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.2.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.3.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.2.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.3.bb
index 8c52613109..da1b27525d 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.2.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.3.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "743c4d56cfc0818755e2281d625d51860b41a473c641e179649a4f41776d1fca"
+SRC_URI[sha256sum] = "a712eb7bce32cd934df36814b5dd046aa670899c16fe98f2afb003578f86a1c5"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.31.1


--===============4660773701012244902==--

