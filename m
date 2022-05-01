Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B341C38A05
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:12 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web08.2326.1651434543822654137
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=1bWJJBri;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010180812b5752-692836f5-f061-42f8-8423-065796462a18-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=itje9ZC6C3rn+dMy5QPYEKn07EEWr/sAc+Rq0rJNZrM=;
	b=1bWJJBriBG7nxS7eldZbApNqE4U7PU+8hvolcrQcwLXoex4LEx1HSg2+GaHkgji4
	9BTiGNsWn2f8IpXnzMA19wPqtfRFzcIZ0Gog3UMp1QCJtS7DDoSmXerePrDBV0fjDE8
	viHCmWVK3qzYBwU5s/USLfybmhEc90kB8DtUWr1Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=itje9ZC6C3rn+dMy5QPYEKn07EEWr/sAc+Rq0rJNZrM=;
	b=kr1ki0+He1UrPQ98vi09UrpO/XlyzYv95mgdsmu/3Fl9gBBF1q/ybpLe1KHJ5hyD
	qTYpEKG7g8CAVpCLcX+n/1q2xWujtgTIs5Jd1r4ZTLOSoFpJTUc0hCxbQLA9G4lg+x7
	OOLcbWxbjiYdoFO42d8/0KkRRyh0+ZeO0lx929I4=
Content-Type: multipart/mixed; boundary="===============3631081626295095152=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cronie: upgrading to 1.6.1 SUCCEEDED
Message-ID: 
 <01010180812b5752-692836f5-f061-42f8-8423-065796462a18-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165124

--===============3631081626295095152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cronie* to *1.6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cronie-upgrade-1.6.0-1.6.1.patch
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
--===============3631081626295095152==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-cronie-upgrade-1.6.0-1.6.1.patch"

From 2894882ba0240ac42be504a559df907417fb0880 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 10:59:07 +0000
Subject: [PATCH] cronie: upgrade 1.6.0 -> 1.6.1

---
 .../cronie/{cronie_1.6.0.bb => cronie_1.6.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cronie/{cronie_1.6.0.bb => cronie_1.6.1.bb} (97%)

diff --git a/meta/recipes-extended/cronie/cronie_1.6.0.bb b/meta/recipes-extended/cronie/cronie_1.6.1.bb
similarity index 97%
rename from meta/recipes-extended/cronie/cronie_1.6.0.bb
rename to meta/recipes-extended/cronie/cronie_1.6.1.bb
index d2f08c9af0..6d150dd3c7 100644
--- a/meta/recipes-extended/cronie/cronie_1.6.0.bb
+++ b/meta/recipes-extended/cronie/cronie_1.6.1.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}
 PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-SRC_URI[sha256sum] = "3f7cc263d21838b53a9943eb2a26b862059e2ae36c3f11789ac33cd6818e3628"
+SRC_URI[sha256sum] = "2cd0f0dd1680e6b9c39bf1e3a5e7ad6df76aa940de1ee90a453633aa59984e62"
 
 inherit autotools update-rc.d useradd systemd
 
-- 
2.27.0


--===============3631081626295095152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/cronie/cronie-dbg: PKGSIZE changed from 347168 to 347336 (+0%)
packages/core2-32-poky-linux/cronie/cronie-dbg: PV changed from "1.6.0" to "1.6.1"
packages/core2-32-poky-linux/cronie/cronie-dbg: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/cronie/cronie-dev: PV changed from "1.6.0" to "1.6.1"
packages/core2-32-poky-linux/cronie/cronie-dev: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/cronie/cronie-doc: PV changed from "1.6.0" to "1.6.1"
packages/core2-32-poky-linux/cronie/cronie-doc: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/cronie/cronie-locale: PV changed from "1.6.0" to "1.6.1"
packages/core2-32-poky-linux/cronie/cronie-locale: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/cronie/cronie-src: PKGSIZE changed from 183067 to 183093 (+0%)
packages/core2-32-poky-linux/cronie/cronie-src: PV changed from "1.6.0" to "1.6.1"
packages/core2-32-poky-linux/cronie/cronie-src: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/cronie/cronie-staticdev: PV changed from "1.6.0" to "1.6.1"
packages/core2-32-poky-linux/cronie/cronie-staticdev: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/cronie/cronie: PV changed from "1.6.0" to "1.6.1"
packages/core2-32-poky-linux/cronie/cronie: PKGV changed from 1.6.0 [default] to 1.6.1 [default]
packages/core2-32-poky-linux/cronie: SRC_URI changed from "https://github.com/cronie-crond/cronie/releases/download/cronie-1.6.0/cronie-1.6.0.tar.gz file://crond.init file://crontab file://crond.service file://crond_pam_config.patch" to "https://github.com/cronie-crond/cronie/releases/download/cronie-1.6.1/cronie-1.6.1.tar.gz file://crond.init file://crontab file://crond.service file://crond_pam_config.patch"
packages/core2-32-poky-linux/cronie: PV changed from "1.6.0" to "1.6.1"
packages/core2-32-poky-linux/cronie: PKGV changed from 1.6.0 [default] to 1.6.1 [default]

--===============3631081626295095152==--

