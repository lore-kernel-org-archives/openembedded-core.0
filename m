Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCA4C3A589
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web09.19047.1652634914090086362
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=feTQOkXJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010180c8b788ef-d0d2a261-eddf-4e8d-ad70-30978ead4e0e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iinvPZFQeE+x0OCnOn37NOohHi7jexZRvyhJyNUvlBY=;
	b=feTQOkXJvseK6QeB9knXQSyG7yXcMaPAmrvQqXDDEputg1pzl6XeJ8GyRXmM5B0p
	TlZLIujUVcw7H6gdu9p1uojR1OBpcpPMjk1MgQEIEENbD3A0b2ls8vLXIIiImg4Mg6q
	Hq71xZjr7sKylDQLBIqkq2wmUq+Fg07YwdCTLKBo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iinvPZFQeE+x0OCnOn37NOohHi7jexZRvyhJyNUvlBY=;
	b=i6D/l0+yaiEm5Ecm4kf1eGIPeHu07xdJe0bgSVhSwoXXnym3JQVUJ4+wA88daR3E
	aNZXNV5FuXHQfockjTsmCR7OlWd81m2Lb3uIhfdaOcVcUVpnLXP06IcGnjz/oy+Pipu
	ZLc3NBpLuFgAhwoNwfe2emCphIjTDEWZCnk/5x9Y=
Content-Type: multipart/mixed; boundary="===============4862673188362976385=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] psmisc: upgrading to 23.5 SUCCEEDED
Message-ID: 
 <01010180c8b788ef-d0d2a261-eddf-4e8d-ad70-30978ead4e0e-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:13 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165632

--===============4862673188362976385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *psmisc* to *23.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-psmisc-upgrade-23.4-23.5.patch
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
--===============4862673188362976385==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-psmisc-upgrade-23.4-23.5.patch"

From b3325b8b4b9ed1ffe9219a15492c001ab8907b6d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 09:37:42 +0000
Subject: [PATCH] psmisc: upgrade 23.4 -> 23.5

---
 meta/recipes-extended/psmisc/{psmisc_23.4.bb => psmisc_23.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/psmisc/{psmisc_23.4.bb => psmisc_23.5.bb} (85%)

diff --git a/meta/recipes-extended/psmisc/psmisc_23.4.bb b/meta/recipes-extended/psmisc/psmisc_23.5.bb
similarity index 85%
rename from meta/recipes-extended/psmisc/psmisc_23.4.bb
rename to meta/recipes-extended/psmisc/psmisc_23.5.bb
index 94caa2ddb7..1c390f3615 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.4.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.5.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https;branch=master \
            file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
            "
-SRCREV = "5fab6b7ab385080f1db725d6803136ec1841a15f"
+SRCREV = "17353f3fddef6b360bc47f7834f2cd011bea2b87"
 S = "${WORKDIR}/git"
-- 
2.31.1


--===============4862673188362976385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/psmisc/fuser-doc: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/fuser-doc: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/fuser: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/fuser: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/killall-doc: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/killall-doc: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/killall: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/killall: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-dbg: PKGSIZE changed from 264056 to 266368 (+1%)
packages/core2-32-poky-linux/psmisc/psmisc-dbg: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-dbg: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-dev: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-dev: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-doc: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-doc: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-extras: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-extras: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-bg: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-bg: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-ca: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-ca: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-cs: PKGSIZE changed from 18826 to 18794 (-0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-cs: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-cs: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-da: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-da: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-de: PKGSIZE changed from 19005 to 18984 (-0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-de: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-de: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-el: PKGSIZE changed from 19828 to 20749 (+5%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-el: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-el: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-eo: PKGSIZE changed from 17187 to 18017 (+5%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-eo: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-eo: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-es: PKGSIZE changed from 18103 to 19163 (+6%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-es: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-es: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-eu: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-eu: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-fi: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-fi: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-fr: PKGSIZE changed from 19140 to 19113 (-0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-fr: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-fr: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-hr: PKGSIZE changed from 18565 to 18534 (-0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-hr: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-hr: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-hu: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-hu: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-id: PKGSIZE changed from 8320 to 18457 (+122%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-id: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-id: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-it: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-it: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-ja: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-ja: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-nb: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-nb: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-nl: PKGSIZE changed from 17575 to 18406 (+5%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-nl: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-nl: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-pl: PKGSIZE changed from 18768 to 18743 (-0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-pl: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-pl: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-pt-br: PKGSIZE changed from 18750 to 18520 (-1%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-pt-br: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-pt-br: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-pt: PKGSIZE changed from 18604 to 18376 (-1%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-pt: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-pt: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-ro: PKGSIZE changed from 1850 to 19636 (+961%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-ro: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-ro: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-ru: PKGSIZE changed from 23834 to 23819 (-0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-ru: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-ru: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-sr: PKGSIZE changed from 21664 to 22619 (+4%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-sr: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-sr: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-sv: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-sv: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-uk: PKGSIZE changed from 23965 to 23959 (-0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-uk: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-uk: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-vi: PKGSIZE changed from 16449 to 20467 (+24%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-vi: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-vi: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-zh-cn: PKGSIZE changed from 16680 to 17730 (+6%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-zh-cn: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-zh-cn: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-locale-zh-tw: PKGSIZE changed from 18124 to 18089 (-0%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-zh-tw: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-locale-zh-tw: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-src: PKGSIZE changed from 159578 to 174061 (+9%)
packages/core2-32-poky-linux/psmisc/psmisc-src: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-src: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc-staticdev: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc-staticdev: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/psmisc: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/psmisc: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/pstree-doc: PKGSIZE changed from 5322 to 5282 (-1%)
packages/core2-32-poky-linux/psmisc/pstree-doc: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/pstree-doc: PKGV changed from 23.4 [default] to 23.5 [default]
packages/core2-32-poky-linux/psmisc/pstree: PV changed from "23.4" to "23.5"
packages/core2-32-poky-linux/psmisc/pstree: PKGV changed from 23.4 [default] to 23.5 [default]

--===============4862673188362976385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/psmisc/psmisc-locale-id: PKGSIZE changed from 8320 to 18457 (+122%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-ro: PKGSIZE changed from 1850 to 19636 (+961%)
packages/core2-32-poky-linux/psmisc/psmisc-locale-vi: PKGSIZE changed from 16449 to 20467 (+24%)

--===============4862673188362976385==--

