Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB7DCCA47F
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:48 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.675.1654100324730325327
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nmU+sKuo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010181200feeb4-43175eab-5ec4-4a6f-96ce-bf6795b2c166-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100324;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=BvsaFk1El0Bkk7O1Eqo3/6qo5K4lL+8TEK809lI4EVk=;
	b=nmU+sKuoSGEVB7Oo2vXsasdapZZw5B5+/9WAgxxge8+J2mTpZAROKnDshN4XrX7W
	U51+w+rBioPlpgMlA8aaZqyyKJWbBLCBf8y/YUvdRDSPUKHtemtZkr0PegAfk4KrQvn
	GlZ3hym6aV/jAZws7+Xa+gGnn7lngi8AnIHvjfU4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100324;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=BvsaFk1El0Bkk7O1Eqo3/6qo5K4lL+8TEK809lI4EVk=;
	b=EBjGsC1uoB4eEYLJb0Sv2GEWqLwSFaqV3mFhVxRdyE+7ysmpfpYsZB4CiEYj19go
	ydKnIeM/KBxdTvpQx/1Q8SIgBih7NuJ2l2vI6N6OVAhfsHnRHPKrW1oifpMw0FlNsgG
	v1soOFkTp1036cJMIaDdgHzYP30nqEE4C7b4ZVDA=
Content-Type: multipart/mixed; boundary="===============6251910403494656588=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xwayland: upgrading to 22.1.2 SUCCEEDED
Message-ID: 
 <01010181200feeb4-43175eab-5ec4-4a6f-96ce-bf6795b2c166-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:44 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166420

--===============6251910403494656588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xwayland* to *22.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-22.1.1-22.1.2.patch
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
--===============6251910403494656588==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-22.1.1-22.1.2.patch"

From ac0e83127e6ab847f2cb7d5fbccb647dcc7e9369 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jun 2022 14:20:53 +0000
Subject: [PATCH] xwayland: upgrade 22.1.1 -> 22.1.2

---
 .../xwayland/{xwayland_22.1.1.bb => xwayland_22.1.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.1.bb => xwayland_22.1.2.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.2.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.1.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.2.bb
index b512b9932d..8c52613109 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.1.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.2.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f5d0e0ba37e19bb87c62f61da5970bd204939f2120620964bed4cc8495baa657"
+SRC_URI[sha256sum] = "743c4d56cfc0818755e2281d625d51860b41a473c641e179649a4f41776d1fca"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.31.1


--===============6251910403494656588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-22.1.1.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-22.1.2.tar.xz"
packages/core2-32-poky-linux/xwayland: PV changed from "22.1.1" to "22.1.2"
packages/core2-32-poky-linux/xwayland: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PV changed from "22.1.1" to "22.1.2"
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 10261796 to 10262620 (+0%)
packages/core2-32-poky-linux/xwayland/xwayland-dev: PV changed from "22.1.1" to "22.1.2"
packages/core2-32-poky-linux/xwayland/xwayland-dev: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/core2-32-poky-linux/xwayland/xwayland-doc: PV changed from "22.1.1" to "22.1.2"
packages/core2-32-poky-linux/xwayland/xwayland-doc: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/core2-32-poky-linux/xwayland/xwayland-locale: PV changed from "22.1.1" to "22.1.2"
packages/core2-32-poky-linux/xwayland/xwayland-locale: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/core2-32-poky-linux/xwayland/xwayland-src: PV changed from "22.1.1" to "22.1.2"
packages/core2-32-poky-linux/xwayland/xwayland-src: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/core2-32-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8589131 to 8590421 (+0%)
packages/core2-32-poky-linux/xwayland/xwayland-staticdev: PV changed from "22.1.1" to "22.1.2"
packages/core2-32-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/core2-32-poky-linux/xwayland/xwayland: PV changed from "22.1.1" to "22.1.2"
packages/core2-32-poky-linux/xwayland/xwayland: PKGV changed from 22.1.1 [default] to 22.1.2 [default]

--===============6251910403494656588==--

