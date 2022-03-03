Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BABDC47080
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:42:26 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.13921.1646329345130448045
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Q8Lfhe3a;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 0101017f50e0316b-6ea0004b-8d04-45f7-a0fa-d030092d8d19-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1646329344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AE2g3upd2cz67o2JrZ0MfayOZgkRW0QNJqYux82MACM=;
	b=Q8Lfhe3a9XivEm/v2McE5hiIHkeMIHK27AP78/8sWeQmpaqNMazs1LWmMm9B0R+U
	8Qv5f9y6Jwzbbt6TiJXysoihOwPl+J/EGumhnN24Y9TpquwOfJrKydjviVokly2038D
	W+wKZwu260wKkOJeYoeBEzO0CUXBmZihp2SimyCM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646329344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AE2g3upd2cz67o2JrZ0MfayOZgkRW0QNJqYux82MACM=;
	b=EVEjr/Tpb164RG30GT0p7boj2iEl4QUBmdizVNr5femw24OzLCgS6f5GmGe+bmAV
	EjeoS6wRPs79W64ol39P0v9M7p1QIik822PolOreJIx2M+lOFwCMHlDJhiPzErap1Rq
	B1cZs14fbtyDHCTkyuayP9wdcApyzYwrwmvAzi00=
Content-Type: multipart/mixed; boundary="===============0716729995294071948=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 96180e4850d10ae41ace32c5c0deca25f9a89b1f
 SUCCEEDED
Message-ID: 
 <0101017f50e0316b-6ea0004b-8d04-45f7-a0fa-d030092d8d19-000000@us-west-2.amazonses.com>
Date: Thu, 3 Mar 2022 17:42:24 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.03-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:42:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162687

--===============0716729995294071948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *96180e4850d10ae41ace32c5c0deca25f9a89b1f* has Succeeded.

Next steps:
    - apply the patch: git am 0001-piglit-upgrade-to-latest-revision.patch
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
--===============0716729995294071948==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

From 85e5d4156af5f57bafcbd17fcab64bc3c0c18032 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 3 Mar 2022 16:24:39 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 865eb4c272..0814b69c64 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "2f80c7cc9c02d37574dc8ba3140b7dd8eb3cbf82"
+SRCREV = "96180e4850d10ae41ace32c5c0deca25f9a89b1f"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.27.0


--===============0716729995294071948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+2f80c7cc9c [default] to 1.0+gitrAUTOINC+96180e4850 [default]
packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+2f80c7cc9c" to "1.0+gitrAUTOINC+96180e4850"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+2f80c7cc9c to 1.0+gitr0+96180e4850
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+2f80c7cc9c" to "1.0+gitrAUTOINC+96180e4850"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+2f80c7cc9c to 1.0+gitr0+96180e4850
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+2f80c7cc9c" to "1.0+gitrAUTOINC+96180e4850"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+2f80c7cc9c to 1.0+gitr0+96180e4850
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+2f80c7cc9c" to "1.0+gitrAUTOINC+96180e4850"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+2f80c7cc9c to 1.0+gitr0+96180e4850
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+2f80c7cc9c" to "1.0+gitrAUTOINC+96180e4850"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+2f80c7cc9c to 1.0+gitr0+96180e4850
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+2f80c7cc9c" to "1.0+gitrAUTOINC+96180e4850"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+2f80c7cc9c to 1.0+gitr0+96180e4850
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+2f80c7cc9c" to "1.0+gitrAUTOINC+96180e4850"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+2f80c7cc9c to 1.0+gitr0+96180e4850
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+2f80c7cc9c" to "1.0+gitrAUTOINC+96180e4850"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+2f80c7cc9c to 1.0+gitr0+96180e4850
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+2f80c7cc9c" to "1.0+gitrAUTOINC+96180e4850"
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2042257178 to 2042257370 (+0%)

--===============0716729995294071948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+2f80c7cc9c to 1.0+gitr0+96180e4850
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+2f80c7cc9c to 1.0+gitr0+96180e4850
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+2f80c7cc9c to 1.0+gitr0+96180e4850
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+2f80c7cc9c to 1.0+gitr0+96180e4850
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+2f80c7cc9c to 1.0+gitr0+96180e4850
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+2f80c7cc9c to 1.0+gitr0+96180e4850
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+2f80c7cc9c to 1.0+gitr0+96180e4850
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+2f80c7cc9c to 1.0+gitr0+96180e4850

--===============0716729995294071948==--

