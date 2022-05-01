Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC51C4332F
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:11 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.2283.1651434542082268542
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=P8brQdBZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010180812b4fa4-7085f8ad-5473-46cb-b5ba-a47843f97519-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434541;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nGdBTBng7mE2dMt9as1cZBp4eP0qX95bRAbxYd0vmIU=;
	b=P8brQdBZVZsvQRScdeXbln0AtVIUEYfokjkdpbWEL2FxjnXlGxz8ppNJtnBygFez
	sztsJUfrH/+47SZhQf+xWmwjtT5KZ79ywHW1nZykbgZOEWsO4yM8nvh3zXx0GL/rgJO
	CqVRzCeG2yMXX2srXzOdGJYn0/999Xz2xq4kVFiA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434541;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nGdBTBng7mE2dMt9as1cZBp4eP0qX95bRAbxYd0vmIU=;
	b=NZAWGhc5SoLmi42DvAAgjmDdIakeeKuZ5g6z7smURbytVCYcEk6K9JrS+3NOyswb
	4OayqnOGNrpdZ+O9Ai7iLXQgVgRHaoDxTpsYsPeHOusnYxoIbR1gFzmVgLpPiRCfCx7
	hgF0QDgN6k9dVfwvwfwBm2a/fGYz4wDw6M0R1t7M=
Content-Type: multipart/mixed; boundary="===============6547578254291957017=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] neard: upgrading to 0.18 SUCCEEDED
Message-ID: 
 <01010180812b4fa4-7085f8ad-5473-46cb-b5ba-a47843f97519-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:01 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165091

--===============6547578254291957017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *neard* to *0.18* has Succeeded.

Next steps:
    - apply the patch: git am 0001-neard-upgrade-0.16-0.18.patch
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
--===============6547578254291957017==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-neard-upgrade-0.16-0.18.patch"

From a61190e23226d1a574b6c3b3d964c9857623d7e1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 07:49:32 +0000
Subject: [PATCH] neard: upgrade 0.16 -> 0.18

---
 .../recipes-connectivity/neard/{neard_0.16.bb => neard_0.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/neard/{neard_0.16.bb => neard_0.18.bb} (97%)

diff --git a/meta/recipes-connectivity/neard/neard_0.16.bb b/meta/recipes-connectivity/neard/neard_0.18.bb
similarity index 97%
rename from meta/recipes-connectivity/neard/neard_0.16.bb
rename to meta/recipes-connectivity/neard/neard_0.18.bb
index bc9ce07d79..23e999acc4 100644
--- a/meta/recipes-connectivity/neard/neard_0.16.bb
+++ b/meta/recipes-connectivity/neard/neard_0.18.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=git;branc
            file://0001-Add-header-dependency-to-nciattach.o.patch \
           "
 
-SRCREV = "949795024f7625420e93e288c56e194cb9a3e74a"
+SRCREV = "c781008d3786e03173f0a0f5dfcc0545c787d7fc"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============6547578254291957017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/neard: PV changed from "0.16" to "0.18"
packages/core2-32-poky-linux/neard: PKGV changed from 0.16 [default] to 0.18 [default]
packages/core2-32-poky-linux/neard/neard-dbg: PV changed from "0.16" to "0.18"
packages/core2-32-poky-linux/neard/neard-dbg: PKGSIZE changed from 842136 to 847332 (+1%)
packages/core2-32-poky-linux/neard/neard-dbg: PKGV changed from 0.16 [default] to 0.18 [default]
packages/core2-32-poky-linux/neard/neard-dev: PV changed from "0.16" to "0.18"
packages/core2-32-poky-linux/neard/neard-dev: PKGSIZE changed from 35713 to 36740 (+3%)
packages/core2-32-poky-linux/neard/neard-dev: PKGV changed from 0.16 [default] to 0.18 [default]
packages/core2-32-poky-linux/neard/neard-doc: PV changed from "0.16" to "0.18"
packages/core2-32-poky-linux/neard/neard-doc: PKGV changed from 0.16 [default] to 0.18 [default]
packages/core2-32-poky-linux/neard/neard-locale: PV changed from "0.16" to "0.18"
packages/core2-32-poky-linux/neard/neard-locale: PKGV changed from 0.16 [default] to 0.18 [default]
packages/core2-32-poky-linux/neard/neard-src: PV changed from "0.16" to "0.18"
packages/core2-32-poky-linux/neard/neard-src: FILELIST: directory renamed /usr/src/debug/neard/0.16-r0/build/include/near -> /usr/src/debug/neard/0.18-r0/build/include/near, directory renamed /usr/src/debug/neard/0.16-r0/git/tools/nfctool -> /usr/src/debug/neard/0.18-r0/git/tools/nfctool, directory renamed /usr/src/debug/neard/0.16-r0/git/tools -> /usr/src/debug/neard/0.18-r0/git/tools, directory renamed /usr/src/debug/neard/0.16-r0/build/src -> /usr/src/debug/neard/0.18-r0/build/src, directory renamed /usr/src/debug/neard/0.16-r0/git/plugins -> /usr/src/debug/neard/0.18-r0/git/plugins, directory renamed /usr/src/debug/neard/0.16-r0/git/gdbus -> /usr/src/debug/neard/0.18-r0/git/gdbus, removed "/usr/src/debug/neard/0.16-r0/git/src/ndef.c /usr/src/debug/neard/0.16-r0/git/src/tlv.c /usr/src/debug/neard/0.16-r0/git/src/tag.c /usr/src/debug/neard/0.16-r0/git/src/netlink.c /usr/src/debug/neard/0.16-r0/git/src/dbus.c /usr/src/debug/neard/0.16-r0/git/src/near.h /usr/src/debug/neard/0.16-r0/g
 it/src/device.c /usr/src/debug/neard/0.16-r0/git/src/snep.c /usr/src/debug/neard/0.16-r0/git/src/plugin.c /usr/src/debug/neard/0.16-r0/git/src/manager.c /usr/src/debug/neard/0.16-r0/git/src/adapter.c /usr/src/debug/neard/0.16-r0/git/src/error.c /usr/src/debug/neard/0.16-r0/git/src/main.c /usr/src/debug/neard/0.16-r0/git/src/agent.c /usr/src/debug/neard/0.16-r0/git/src/log.c /usr/src/debug/neard/0.16-r0/git/src/bluetooth.c", added "/usr/src/debug/neard/0.18-r0/git/src/dbus.c /usr/src/debug/neard/0.18-r0/git/src/snep.c /usr/src/debug/neard/0.18-r0/git/src/ndef.c /usr/src/debug/neard/0.18-r0/git/src/device.c /usr/src/debug/neard/0.18-r0/git/src/manager.c /usr/src/debug/neard/0.18-r0/git/src/bluetooth.c /usr/src/debug/neard/0.18-r0/git/src/adapter.c /usr/src/debug/neard/0.18-r0/git/src/error.c /usr/src/debug/neard/0.18-r0/git/src/netlink.c /usr/src/debug/neard/0.18-r0/git/src/tag.c /usr/src/debug/neard/0.18-r0/git/src/log.c /usr/src/debug/neard/0.18-r0/git/src/tlv.c /usr/src/debug/neard
 /0.18-r0/git/src/agent.c /usr/src/debug/neard/0.18-r0/git/src/near.h /usr/src/debug/neard/0.18-r0/git/src/ndef-private.h /usr/src/debug/neard/0.18-r0/git/src/plugin.c /usr/src/debug/neard/0.18-r0/git/src/main.c"
packages/core2-32-poky-linux/neard/neard-src: PKGSIZE changed from 757530 to 763565 (+1%)
packages/core2-32-poky-linux/neard/neard-src: PKGV changed from 0.16 [default] to 0.18 [default]
packages/core2-32-poky-linux/neard/neard-staticdev: PV changed from "0.16" to "0.18"
packages/core2-32-poky-linux/neard/neard-staticdev: PKGV changed from 0.16 [default] to 0.18 [default]
packages/core2-32-poky-linux/neard/neard: PV changed from "0.16" to "0.18"
packages/core2-32-poky-linux/neard/neard: PKGSIZE changed from 422223 to 426383 (+1%)
packages/core2-32-poky-linux/neard/neard: PKGV changed from 0.16 [default] to 0.18 [default]

--===============6547578254291957017==--

