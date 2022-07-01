Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062EEC2BBED
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:10 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.39335.1656687062961208678
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RN6oWg3c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 01010181ba3e6947-bbf6e23d-1a49-487b-b5cb-82e6b6518329-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pMSQemt0Z95U1RVTk3y7SRE8R0Wnq3PWhHaeur8qis4=;
	b=RN6oWg3caVrUjRxv8CaWKrF+smlOOwiC1lQ7VigRxh+YAWMAbUix6Wzvk20qDD7b
	ZiO467j1v0XPbFPkn+DzHoqCJBHouMtVSbzJ4vjQsIrkdGStGKiANG+UJXo2V21fqrA
	LS4gZKkfKarIisxlnX5aLGTu2hwPU2SGEFkeceIg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pMSQemt0Z95U1RVTk3y7SRE8R0Wnq3PWhHaeur8qis4=;
	b=f12gYNtSM3j6202rzU2Jmq7rruw4z94zscwz53kh4TTLOfKhy6kdlBhkwPI/Wxq8
	g/jgj+7ZFVUJIEREbnZ1+jcwVSQd/TYgsCHDMLuAf7gc2RbDt4v/PPGPsbcWcSBsSgY
	mmiRzIgy/LAbMlAlynVA0VTsOBIFeUtQSlGrzoKQ=
Content-Type: multipart/mixed; boundary="===============3478286492968166084=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 0.20.1 SUCCEEDED
Message-ID: 
 <01010181ba3e6947-bbf6e23d-1a49-487b-b5cb-82e6b6518329-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:01 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167486

--===============3478286492968166084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *createrepo-c* to *0.20.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-createrepo-c-upgrade-0.20.0-0.20.1.patch
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
--===============3478286492968166084==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-0.20.0-0.20.1.patch"

From 8c9d05ece7a1c1b9e1915e5d8d9cd5aa5e513d68 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 07:40:18 +0000
Subject: [PATCH] createrepo-c: upgrade 0.20.0 -> 0.20.1

---
 .../{createrepo-c_0.20.0.bb => createrepo-c_0.20.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.20.0.bb => createrepo-c_0.20.1.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb
index bc61cac955..d309bb895f 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "e53188f86f4dfad46f5b81d6931cbaec19e44ea2"
+SRCREV = "af14e164a3e4ab9dfaef1212e852b9ecebc326a2"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1


--===============3478286492968166084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "0.20.0" to "0.20.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 0.20.0 [default] to 0.20.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1149760 to 1152784 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "0.20.0" to "0.20.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 0.20.0 [default] to 0.20.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: FILELIST: removed "/usr/lib/.debug/libcreaterepo_c.so.0.20.0", added "/usr/lib/.debug/libcreaterepo_c.so.0.20.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGSIZE changed from 138270 to 142602 (+3%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "0.20.0" to "0.20.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 0.20.0 [default] to 0.20.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: FILELIST: added "/usr/include/createrepo_c/createrepo_shared.h"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "0.20.0" to "0.20.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 0.20.0 [default] to 0.20.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "0.20.0" to "0.20.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 0.20.0 [default] to 0.20.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGSIZE changed from 1219452 to 1222440 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PV changed from "0.20.0" to "0.20.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 0.20.0 [default] to 0.20.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "0.20.0" to "0.20.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 0.20.0 [default] to 0.20.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGSIZE changed from 522119 to 526215 (+1%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PV changed from "0.20.0" to "0.20.1"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGV changed from 0.20.0 [default] to 0.20.1 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.0.20.0", added "/usr/lib/libcreaterepo_c.so.0.20.1"
packages/core2-32-poky-linux/createrepo-c: PV changed from "0.20.0" to "0.20.1"
packages/core2-32-poky-linux/createrepo-c: PKGV changed from 0.20.0 [default] to 0.20.1 [default]
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.20.0 to libcreaterepo_c.so.0.20.1
  /usr/lib/libcreaterepo_c.so.0.20.0 moved to /usr/lib/libcreaterepo_c.so.0.20.1
  /usr/include/createrepo_c/createrepo_shared.h was added

--===============3478286492968166084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: FILELIST: added "/usr/include/createrepo_c/createrepo_shared.h"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.0.20.0", added "/usr/lib/libcreaterepo_c.so.0.20.1"
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.20.0 to libcreaterepo_c.so.0.20.1
  /usr/lib/libcreaterepo_c.so.0.20.0 moved to /usr/lib/libcreaterepo_c.so.0.20.1
  /usr/include/createrepo_c/createrepo_shared.h was added

--===============3478286492968166084==--

