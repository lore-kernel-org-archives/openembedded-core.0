Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA38C2BBEE
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:54 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web12.981.1657900667956046784
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=enUdYCWU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 0101018202948fd4-79847273-d5b7-4d90-9803-af484ffc17c2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7G+Qnrja40vasRRFk2gkw8VJScNTog32GZpNOcPn1F8=;
	b=enUdYCWUCklMzcZDxFI6466bBdkdzirP83PN/G/b5VwG5GYAdvkzEuIWsGqMlxUO
	VYFjRTpVB4OX8R4Z5iyoCiUUllkQUS4IEefcEe78AMA2S7QvhU51ObyZSjTCfvuEU1z
	Eu+Sr3kofK1RerthL72fxx9dtKLSz4TmIMww62RM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7G+Qnrja40vasRRFk2gkw8VJScNTog32GZpNOcPn1F8=;
	b=JHhMrWoAXYjZZkDKqDDmmbtuBHAfKet6n8D2WtCqYBJiiMhmTF9zJPEiBAj/cabx
	wbCjqMl+8R5SnXo6PChWXe5GIVaREyIkatYPRg8TqkhLKK/tyRsY3xJ3ZwTNj8wTMNQ
	gIyzzvatg9mkpjgFz4dxeVjK2n1sylnh0Xw4BMuQ=
Content-Type: multipart/mixed; boundary="===============8408901625390177153=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.37.1 SUCCEEDED
Message-ID: 
 <0101018202948fd4-79847273-d5b7-4d90-9803-af484ffc17c2-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168073

--===============8408901625390177153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *git* to *2.37.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.37.0-2.37.1.patch
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
--===============8408901625390177153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/git/git-bash-completion: PV changed from "2.37.0" to "2.37.1"
packages/core2-32-poky-linux/git/git-bash-completion: PKGV changed from 2.37.0 [default] to 2.37.1 [default]
packages/core2-32-poky-linux/git/git-dbg: PKGSIZE changed from 69612908 to 69638992 (+0%)
packages/core2-32-poky-linux/git/git-dbg: PV changed from "2.37.0" to "2.37.1"
packages/core2-32-poky-linux/git/git-dbg: PKGV changed from 2.37.0 [default] to 2.37.1 [default]
packages/core2-32-poky-linux/git/git-dev: PV changed from "2.37.0" to "2.37.1"
packages/core2-32-poky-linux/git/git-dev: PKGV changed from 2.37.0 [default] to 2.37.1 [default]
packages/core2-32-poky-linux/git/git-doc: PV changed from "2.37.0" to "2.37.1"
packages/core2-32-poky-linux/git/git-doc: PKGV changed from 2.37.0 [default] to 2.37.1 [default]
packages/core2-32-poky-linux/git/git-locale: PV changed from "2.37.0" to "2.37.1"
packages/core2-32-poky-linux/git/git-locale: PKGV changed from 2.37.0 [default] to 2.37.1 [default]
packages/core2-32-poky-linux/git/git-perltools: PV changed from "2.37.0" to "2.37.1"
packages/core2-32-poky-linux/git/git-perltools: PKGV changed from 2.37.0 [default] to 2.37.1 [default]
packages/core2-32-poky-linux/git/git-src: PKGSIZE changed from 8729715 to 8731618 (+0%)
packages/core2-32-poky-linux/git/git-src: PV changed from "2.37.0" to "2.37.1"
packages/core2-32-poky-linux/git/git-src: PKGV changed from 2.37.0 [default] to 2.37.1 [default]
packages/core2-32-poky-linux/git/git-staticdev: PV changed from "2.37.0" to "2.37.1"
packages/core2-32-poky-linux/git/git-staticdev: PKGV changed from 2.37.0 [default] to 2.37.1 [default]
packages/core2-32-poky-linux/git/git-tk: PV changed from "2.37.0" to "2.37.1"
packages/core2-32-poky-linux/git/git-tk: PKGV changed from 2.37.0 [default] to 2.37.1 [default]
packages/core2-32-poky-linux/git/git: PKGSIZE changed from 24195466 to 24203658 (+0%)
packages/core2-32-poky-linux/git/git: PV changed from "2.37.0" to "2.37.1"
packages/core2-32-poky-linux/git/git: PKGV changed from 2.37.0 [default] to 2.37.1 [default]
packages/core2-32-poky-linux/git/gitweb: PV changed from "2.37.0" to "2.37.1"
packages/core2-32-poky-linux/git/gitweb: PKGV changed from 2.37.0 [default] to 2.37.1 [default]
packages/core2-32-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.37.0.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.37.1.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"
packages/core2-32-poky-linux/git: PV changed from "2.37.0" to "2.37.1"
packages/core2-32-poky-linux/git: PKGV changed from 2.37.0 [default] to 2.37.1 [default]

--===============8408901625390177153==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.37.0-2.37.1.patch"

From c8e61687acd2e643b17331004de67d2f543bd76b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 06:51:57 +0000
Subject: [PATCH] git: upgrade 2.37.0 -> 2.37.1

---
 meta/recipes-devtools/git/{git_2.37.0.bb => git_2.37.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.37.0.bb => git_2.37.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.37.0.bb b/meta/recipes-devtools/git/git_2.37.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.37.0.bb
rename to meta/recipes-devtools/git/git_2.37.1.bb
index d3bd0619af..5d2524a1da 100644
--- a/meta/recipes-devtools/git/git_2.37.0.bb
+++ b/meta/recipes-devtools/git/git_2.37.1.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "fc3ffe6c65c1f7c681a1ce6bb91703866e432c762731d4b57c566d696f6d62c3"
+SRC_URI[tarball.sha256sum] = "7dded96a52e7996ce90dd74a187aec175737f680dc063f3f33c8932cf5c8d809"
-- 
2.31.1


--===============8408901625390177153==--

