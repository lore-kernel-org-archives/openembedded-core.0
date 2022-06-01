Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA97CCA48A
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:48 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web12.617.1654100324464266128
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=g8qMucWn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010181200fee30-8f39a951-8191-4879-b151-3bb555369890-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100324;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=9ToLPCcffyEP0CKb7VD+UqCUAk8li2B1nyrClEWx+nI=;
	b=g8qMucWnNyrsFpbKT3xOrS/oahqjB05pCZDeYz0gqn9EnuBlOkYdwRDXelir64tJ
	MqUwzwc8tSMGyN6S47eipftwc6l8sVKiYkMUr+U70v1CKkH1LM5lw01HlpS+hS2cF9F
	vAAxkkPiTxH4zJ7/MlaYHK6YRzsElMdRbv+EXMs0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100324;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=9ToLPCcffyEP0CKb7VD+UqCUAk8li2B1nyrClEWx+nI=;
	b=boBkH69ZM6eeP6ftev7D+/9qbIBGK9v2fK74hzgx6xZ7PhABklWkJYy0D1Lk1jZB
	vg9L2+3uRdvJOUuj23a4YyGAkpIQmzdoAcztphygWk3+DRXQJ81Q6xwVRRvOcFs0Q/i
	4S+TgL7Ivc2ohbjSpEoSwgB+GmvyubvZYyB2qErE=
Content-Type: multipart/mixed; boundary="===============5537571725300450249=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libxkbcommon: upgrading to 1.4.1 SUCCEEDED
Message-ID: 
 <01010181200fee30-8f39a951-8191-4879-b151-3bb555369890-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:43 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166412

--===============5537571725300450249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxkbcommon* to *1.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxkbcommon-upgrade-1.4.0-1.4.1.patch
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
--===============5537571725300450249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxkbcommon: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-32-poky-linux/libxkbcommon: SRC_URI changed from "http://xkbcommon.org/download/libxkbcommon-1.4.0.tar.xz" to "http://xkbcommon.org/download/libxkbcommon-1.4.1.tar.xz"
packages/core2-32-poky-linux/libxkbcommon: PV changed from "1.4.0" to "1.4.1"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dbg: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dbg: PV changed from "1.4.0" to "1.4.1"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dbg: PKGSIZE changed from 919148 to 919228 (+0%)
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dev: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dev: PV changed from "1.4.0" to "1.4.1"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-dev: PKGSIZE changed from 354865 to 354882 (+0%)
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-doc: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-doc: PV changed from "1.4.0" to "1.4.1"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-locale: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-locale: PV changed from "1.4.0" to "1.4.1"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-src: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-src: PV changed from "1.4.0" to "1.4.1"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-src: PKGSIZE changed from 1475990 to 1476588 (+0%)
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-staticdev: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-staticdev: PV changed from "1.4.0" to "1.4.1"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-x11: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon-x11: PV changed from "1.4.0" to "1.4.1"
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbcommon: PV changed from "1.4.0" to "1.4.1"
packages/core2-32-poky-linux/libxkbcommon/libxkbregistry: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-32-poky-linux/libxkbcommon/libxkbregistry: PV changed from "1.4.0" to "1.4.1"
packages/core2-32-poky-linux/libxkbcommon/xkbcli: PKGV changed from 1.4.0 [default] to 1.4.1 [default]
packages/core2-32-poky-linux/libxkbcommon/xkbcli: PV changed from "1.4.0" to "1.4.1"

--===============5537571725300450249==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libxkbcommon-upgrade-1.4.0-1.4.1.patch"

From 6843e45b2556d8a0c94a6ed0b99756c8590b8b2a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jun 2022 14:13:06 +0000
Subject: [PATCH] libxkbcommon: upgrade 1.4.0 -> 1.4.1

---
 .../xorg-lib/{libxkbcommon_1.4.0.bb => libxkbcommon_1.4.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.4.0.bb => libxkbcommon_1.4.1.bb} (94%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb
similarity index 94%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb
index 34652e9c4e..89093e6786 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb
@@ -9,7 +9,7 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "106cec5263f9100a7e79b5f7220f889bc78e7d7ffc55d2b6fdb1efefb8024031"
+SRC_URI[sha256sum] = "943c07a1e2198026d8102b17270a1f406e4d3d6bbc4ae105b9e1b82d7d136b39"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.31.1


--===============5537571725300450249==--

