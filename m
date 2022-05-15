Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7428FC47087
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web09.19050.1652634914289905621
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TMRbnDUt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 01010180c8b78a57-2f1c69ec-8f27-4b92-8ca7-3047b5987639-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2gRPgzk1CfoxShs4oI7Xpz0UIbyp3r1Xau3QLCpcVAQ=;
	b=TMRbnDUtYt3u9vcOGPpoIRTrHSCi/VZovkAJ38iMWeH5mP9Ne8gHOrzhWf9dqe/n
	uShcDS64GP96m9YTMjzm0H+62CBigO3pX/cozX62D0vBBjLqwwTbiNexFXH2yjsyIVs
	RVJHgNnObT9NjnjtZ0vAuPWDJCPTnibWj52edxgE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2gRPgzk1CfoxShs4oI7Xpz0UIbyp3r1Xau3QLCpcVAQ=;
	b=eikkqQ6YEEZ+0JPq0NLD9sXFeS4V6ulJrlw4lZNflGTv4CYoncjCMVkZASZccKMf
	IjPYTALQQQQQehe6JagMUKiidxKRBW9XgbSXYul+1OEfFvOmKnIxxGy6ctLw3Trr4yu
	6P+mEVFswiqmted4Qi37sf1xpNNF9w5optXwVxhY=
Content-Type: multipart/mixed; boundary="===============3669326735855870541=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libnotify: upgrading to 0.7.12 SUCCEEDED
Message-ID: 
 <01010180c8b78a57-2f1c69ec-8f27-4b92-8ca7-3047b5987639-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:13 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165638

--===============3669326735855870541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libnotify* to *0.7.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libnotify-upgrade-0.7.11-0.7.12.patch
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
--===============3669326735855870541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libnotify: PKGV changed from 0.7.11 [default] to 0.7.12 [default]
packages/core2-32-poky-linux/libnotify: SRC_URI changed from "https://download.gnome.org/sources//libnotify/0.7/libnotify-0.7.11.tar.xz;name=archive" to "https://download.gnome.org/sources//libnotify/0.7/libnotify-0.7.12.tar.xz;name=archive"
packages/core2-32-poky-linux/libnotify: PV changed from "0.7.11" to "0.7.12"
packages/core2-32-poky-linux/libnotify/libnotify-dbg: PKGSIZE changed from 93572 to 94144 (+1%)
packages/core2-32-poky-linux/libnotify/libnotify-dbg: PKGV changed from 0.7.11 [default] to 0.7.12 [default]
packages/core2-32-poky-linux/libnotify/libnotify-dbg: PV changed from "0.7.11" to "0.7.12"
packages/core2-32-poky-linux/libnotify/libnotify-dev: PKGV changed from 0.7.11 [default] to 0.7.12 [default]
packages/core2-32-poky-linux/libnotify/libnotify-dev: PV changed from "0.7.11" to "0.7.12"
packages/core2-32-poky-linux/libnotify/libnotify-doc: PKGV changed from 0.7.11 [default] to 0.7.12 [default]
packages/core2-32-poky-linux/libnotify/libnotify-doc: PV changed from "0.7.11" to "0.7.12"
packages/core2-32-poky-linux/libnotify/libnotify-locale: PKGV changed from 0.7.11 [default] to 0.7.12 [default]
packages/core2-32-poky-linux/libnotify/libnotify-locale: PV changed from "0.7.11" to "0.7.12"
packages/core2-32-poky-linux/libnotify/libnotify-src: PKGSIZE changed from 100222 to 101234 (+1%)
packages/core2-32-poky-linux/libnotify/libnotify-src: PKGV changed from 0.7.11 [default] to 0.7.12 [default]
packages/core2-32-poky-linux/libnotify/libnotify-src: PV changed from "0.7.11" to "0.7.12"
packages/core2-32-poky-linux/libnotify/libnotify-staticdev: PKGV changed from 0.7.11 [default] to 0.7.12 [default]
packages/core2-32-poky-linux/libnotify/libnotify-staticdev: PV changed from "0.7.11" to "0.7.12"
packages/core2-32-poky-linux/libnotify/libnotify: PKGV changed from 0.7.11 [default] to 0.7.12 [default]
packages/core2-32-poky-linux/libnotify/libnotify: PV changed from "0.7.11" to "0.7.12"

--===============3669326735855870541==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libnotify-upgrade-0.7.11-0.7.12.patch"

From 9cb4c973d04b1e10a934861550a3db0cdd1f635f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 11:21:30 +0000
Subject: [PATCH] libnotify: upgrade 0.7.11 -> 0.7.12

---
 .../libnotify/{libnotify_0.7.11.bb => libnotify_0.7.12.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.7.11.bb => libnotify_0.7.12.bb} (93%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.11.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.12.bb
similarity index 93%
rename from meta/recipes-gnome/libnotify/libnotify_0.7.11.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.7.12.bb
index 54f3e2c9ba..21e737fd45 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.11.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.12.bb
@@ -22,7 +22,7 @@ inherit gnomebase gtk-doc features_check gobject-introspection
 # depends on gtk+3 if tests are enabled
 ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
 
-SRC_URI[archive.sha256sum] = "dd5682ec68220339e11c5159b7e012204a318dd1b3683a09c482ca421ab07375"
+SRC_URI[archive.sha256sum] = "744b2b37508135f8261b755a9debe6e09add421adc75bde930f6e198b70ab46e"
 
 EXTRA_OEMESON = "-Dman=false"
 
-- 
2.31.1


--===============3669326735855870541==--

