Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B133C41535
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:55 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web09.10486.1647349734701737647
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=U0E/hEnV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 0101017f8db21931-30cf16a7-30ab-46c7-92a4-b036a00069c8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349733;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=udzQ8GRUmOVScI6CctDaMpmVHg/1BoUgpiuutDle6Dc=;
	b=U0E/hEnV3DUxsCVJuq4Y0CIvZOqbCIL02JQlgQm8Z3o/099IIEjvn7r1NRE1QkI8
	yE/zajvfEDXPcg9WkG9PNHl+UYibscFSIWrTLEoBEuaD0Hp14SLgkGB9/TDsQphhavr
	r4lCMgrnUBvOnxyg1aP7ZKqt68xEDn2za1rscF58=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349733;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=udzQ8GRUmOVScI6CctDaMpmVHg/1BoUgpiuutDle6Dc=;
	b=d2+cfuR+sW+9z/ypaIXPONv6vCPs3+HsKtobjicMphPnKUa37wk8v741I7L63V5A
	HzkZIxZTPlKIG8GUANt93xEx947UScFLwVOvkik5RTiuCrVT/V4aMrBLse8H9HLL5y4
	PqFRAgfcWW2/B0nHeQBtSUTBlF0vHGVZ6B3u19G8=
Content-Type: multipart/mixed; boundary="===============7633555048336084885=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 0.19.0 SUCCEEDED
Message-ID: 
 <0101017f8db21931-30cf16a7-30ab-46c7-92a4-b036a00069c8-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:53 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163247

--===============7633555048336084885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *createrepo-c* to *0.19.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-createrepo-c-upgrade-0.18.0-0.19.0.patch
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
--===============7633555048336084885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 0.18.0 [default] to 0.19.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "0.18.0" to "0.19.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: FILELIST: removed "/usr/lib/.debug/libcreaterepo_c.so.0.18.0", added "/usr/lib/.debug/libcreaterepo_c.so.0.19.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1144244 to 1143720 (-0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 0.18.0 [default] to 0.19.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "0.18.0" to "0.19.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGSIZE changed from 140030 to 139947 (-0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 0.18.0 [default] to 0.19.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "0.18.0" to "0.19.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PKGSIZE changed from 16102 to 16137 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 0.18.0 [default] to 0.19.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "0.18.0" to "0.19.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 0.18.0 [default] to 0.19.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "0.18.0" to "0.19.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGSIZE changed from 1214739 to 1214231 (-0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 0.18.0 [default] to 0.19.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PV changed from "0.18.0" to "0.19.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 0.18.0 [default] to 0.19.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "0.18.0" to "0.19.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.0.18.0", added "/usr/lib/libcreaterepo_c.so.0.19.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGSIZE changed from 521158 to 525633 (+1%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGV changed from 0.18.0 [default] to 0.19.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PV changed from "0.18.0" to "0.19.0"
packages/core2-32-poky-linux/createrepo-c: PKGV changed from 0.18.0 [default] to 0.19.0 [default]
packages/core2-32-poky-linux/createrepo-c: PV changed from "0.18.0" to "0.19.0"
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.18.0 to libcreaterepo_c.so.0.19.0
  /usr/lib/libcreaterepo_c.so.0.18.0 moved to /usr/lib/libcreaterepo_c.so.0.19.0

--===============7633555048336084885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.0.18.0", added "/usr/lib/libcreaterepo_c.so.0.19.0"
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.18.0 to libcreaterepo_c.so.0.19.0
  /usr/lib/libcreaterepo_c.so.0.18.0 moved to /usr/lib/libcreaterepo_c.so.0.19.0

--===============7633555048336084885==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-0.18.0-0.19.0.patch"

From 7e327caca573fbaa9976e7a86413da6365be23b6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Mar 2022 07:09:05 +0000
Subject: [PATCH] createrepo-c: upgrade 0.18.0 -> 0.19.0

---
 .../{createrepo-c_0.18.0.bb => createrepo-c_0.19.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.18.0.bb => createrepo-c_0.19.0.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.18.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.19.0.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.18.0.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.19.0.bb
index 1122114031..82351252e5 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.18.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.19.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "09ea861c8ef11927de5a276116ecb83ab8e93462"
+SRCREV = "a531ee881a8f1d9273b4383fb9fa604c56fff138"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============7633555048336084885==--

