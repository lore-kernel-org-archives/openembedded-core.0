Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE67CCCA493
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:53 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web09.966.1657900669168092839
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=L3vi7uWd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010182029495a5-a06e3dcd-3ae9-4732-99c3-e06fe15a0dc4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900668;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sLGMMiBmJ+EMMbbDVWCmR9lTmXQhwm53SP7AwLZHarU=;
	b=L3vi7uWdSogCAgFU8jnVZ9K1jXN8uUkiWgTGgDC9fwEE1pdG863vR4e4oQcBqbcV
	CuWQ+pwL9PRp1lqjEsazgcvqtOsqcIfvfoNu30DqnmEgVckJ0loXnQJY2xMetOHdq3o
	ZldNGAI9p/jgKWJLrj/Rrv53DF1DT+3exJi8zuCo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900668;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sLGMMiBmJ+EMMbbDVWCmR9lTmXQhwm53SP7AwLZHarU=;
	b=UvxWSl6xA+xlbigSszKMiruCGGmUVv1jaEydDnWToAd+q0BWNjtbOE9T48oSpneg
	KoHXuZPsWQvUjzA420Ccps5knD1hCBUog2rW0k32OB5Dt3fxVEu8pjLQWatoOJItiEC
	W0ahHNaYO+AxOArUEEgHwS56MVO+gOsaV6Y+L+A8=
Content-Type: multipart/mixed; boundary="===============8636867029479863130=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to c107462e4e429fa1cf6daac39168674c1c0c9fd4
 SUCCEEDED
Message-ID: 
 <01010182029495a5-a06e3dcd-3ae9-4732-99c3-e06fe15a0dc4-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:48 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168100

--===============8636867029479863130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *c107462e4e429fa1cf6daac39168674c1c0c9fd4* has Succeeded.

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
--===============8636867029479863130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+479b0002d0 [default] to 1.0+gitrAUTOINC+c107462e4e [default]
packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+479b0002d0" to "1.0+gitrAUTOINC+c107462e4e"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+479b0002d0 to 1.0+gitr0+c107462e4e
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+479b0002d0" to "1.0+gitrAUTOINC+c107462e4e"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+479b0002d0 to 1.0+gitr0+c107462e4e
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+479b0002d0" to "1.0+gitrAUTOINC+c107462e4e"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+479b0002d0 to 1.0+gitr0+c107462e4e
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+479b0002d0" to "1.0+gitrAUTOINC+c107462e4e"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+479b0002d0 to 1.0+gitr0+c107462e4e
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+479b0002d0" to "1.0+gitrAUTOINC+c107462e4e"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+479b0002d0 to 1.0+gitr0+c107462e4e
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+479b0002d0" to "1.0+gitrAUTOINC+c107462e4e"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+479b0002d0 to 1.0+gitr0+c107462e4e
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+479b0002d0" to "1.0+gitrAUTOINC+c107462e4e"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+479b0002d0 to 1.0+gitr0+c107462e4e
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+479b0002d0" to "1.0+gitrAUTOINC+c107462e4e"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+479b0002d0 to 1.0+gitr0+c107462e4e
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+479b0002d0" to "1.0+gitrAUTOINC+c107462e4e"
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/arm_shader_framebuffer_fetch_depth_stencil /usr/lib/piglit/bin/arm_shader_framebuffer_fetch_depth_stencil_gles3"
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2042567695 to 2042597292 (+0%)

--===============8636867029479863130==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

From f821880b0572ecb504f6ca067530cc6edea7938c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 13:16:28 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 38ededfcf8..932f2928a0 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "479b0002d004bc99514d186724b5a4fbfe543370"
+SRCREV = "c107462e4e429fa1cf6daac39168674c1c0c9fd4"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.31.1


--===============8636867029479863130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+479b0002d0 to 1.0+gitr0+c107462e4e
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+479b0002d0 to 1.0+gitr0+c107462e4e
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+479b0002d0 to 1.0+gitr0+c107462e4e
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+479b0002d0 to 1.0+gitr0+c107462e4e
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+479b0002d0 to 1.0+gitr0+c107462e4e
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+479b0002d0 to 1.0+gitr0+c107462e4e
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+479b0002d0 to 1.0+gitr0+c107462e4e
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/arm_shader_framebuffer_fetch_depth_stencil /usr/lib/piglit/bin/arm_shader_framebuffer_fetch_depth_stencil_gles3"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+479b0002d0 to 1.0+gitr0+c107462e4e

--===============8636867029479863130==--

