Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAFDC369BC
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:04 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.20180.1744723981544850522
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Sy3TIncR;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=pAKwHOun;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019639a73ccc-daaa335c-7e94-416e-ab09-d1b73b5b62ab-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723983;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fQgIe4D+h9U0vYDJ2eI4+T2vs56e1BMsNR29zU1buw8=;
	b=Sy3TIncRy+5OyvsmVqBD6Y/V9RT7X61YSAHGBO/q3lMywzl65mIVAEG4wxggfz+Q
	9XoOa5TID8NMr1rthmsmfE6qakYomVZ0SajVsmUq1vinAN3WxZHMbeekOwfjBAUW1Ze
	6U1zkHOuMxy6d5sXnCq6o+qz+CTn0OMS0fRG74wc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723983;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fQgIe4D+h9U0vYDJ2eI4+T2vs56e1BMsNR29zU1buw8=;
	b=pAKwHOun4FY4/rGwVPZ+hEksTqqpyM7nA32nrApc76Uzkon/8OUhn9iM/H7xQ2c7
	VuwoGUQh9vQykPHR1Ef+clZs3zciSy99r7WkAlEhHciP67Zqp1oTNFUNxHQRRUDT9qv
	s6bGjVSOzSh3iHDufwQs/BODivdjqzWM9ZUIydqE=
Content-Type: multipart/mixed; boundary="===============5250551890631285385=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] grep: upgrading to 3.12 SUCCEEDED
Message-ID: <0101019639a73ccc-daaa335c-7e94-416e-ab09-d1b73b5b62ab-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214903

--===============5250551890631285385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *grep* to *3.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-grep-upgrade-3.11-3.12.patch
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

-- >8 --
From 6a8909e3ad7fbe6ab9ca62887a8a79d0c47cbdb3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 08:54:40 +0000
Subject: [PATCH] grep: upgrade 3.11 -> 3.12

---
 meta/recipes-extended/grep/{grep_3.11.bb => grep_3.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/grep/{grep_3.11.bb => grep_3.12.bb} (93%)

diff --git a/meta/recipes-extended/grep/grep_3.11.bb b/meta/recipes-extended/grep/grep_3.12.bb
similarity index 93%
rename from meta/recipes-extended/grep/grep_3.11.bb
rename to meta/recipes-extended/grep/grep_3.12.bb
index 0d36eba3b2..2678d2d41e 100644
--- a/meta/recipes-extended/grep/grep_3.11.bb
+++ b/meta/recipes-extended/grep/grep_3.12.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "1db2aedde89d0dea42b16d9528f894c8d15dae4e190b59aecc78f5a951276eab"
+SRC_URI[sha256sum] = "2649b27c0e90e632eadcd757be06c6e9a4f48d941de51e7c0f83ff76408a07b9"
 
 inherit autotools gettext texinfo pkgconfig
 
-- 
2.47.1


--===============5250551890631285385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/grep/grep-dbg: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-dbg: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-dbg: PKGSIZE changed from 974808 to 979528 (+0%)
packages/core2-64-poky-linux/grep/grep-dev: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-dev: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-doc: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-doc: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-doc: PKGSIZE changed from 169725 to 171876 (+1%)
packages/core2-64-poky-linux/grep/grep-locale-af: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-af: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-af: PKGSIZE changed from 1171 to 1168 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-be: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-be: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-be: PKGSIZE changed from 23291 to 22149 (-5%)
packages/core2-64-poky-linux/grep/grep-locale-bg: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-bg: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-bg: PKGSIZE changed from 23915 to 23687 (-1%)
packages/core2-64-poky-linux/grep/grep-locale-ca: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-ca: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-cs: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-cs: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-cs: PKGSIZE changed from 18845 to 18813 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-da: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-da: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-da: PKGSIZE changed from 15797 to 15153 (-4%)
packages/core2-64-poky-linux/grep/grep-locale-de: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-de: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-de: PKGSIZE changed from 19248 to 18447 (-4%)
packages/core2-64-poky-linux/grep/grep-locale-el: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-el: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-eo: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-eo: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-eo: PKGSIZE changed from 17359 to 16608 (-4%)
packages/core2-64-poky-linux/grep/grep-locale-es: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-es: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-es: PKGSIZE changed from 17100 to 16406 (-4%)
packages/core2-64-poky-linux/grep/grep-locale-et: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-et: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-et: PKGSIZE changed from 16997 to 16987 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-eu: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-eu: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-fi: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-fi: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-fi: PKGSIZE changed from 17773 to 18146 (+2%)
packages/core2-64-poky-linux/grep/grep-locale-fr: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-fr: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-fr: PKGSIZE changed from 18057 to 17269 (-4%)
packages/core2-64-poky-linux/grep/grep-locale-ga: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-ga: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-gl: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-gl: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-gl: PKGSIZE changed from 15677 to 15060 (-4%)
packages/core2-64-poky-linux/grep/grep-locale-he: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-he: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-he: PKGSIZE changed from 1138 to 1319 (+16%)
packages/core2-64-poky-linux/grep/grep-locale-hr: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-hr: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-hr: PKGSIZE changed from 18223 to 18212 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-hu: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-hu: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-hu: PKGSIZE changed from 18874 to 18012 (-5%)
packages/core2-64-poky-linux/grep/grep-locale-id: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-id: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-id: PKGSIZE changed from 17660 to 17658 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-it: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-it: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-it: PKGSIZE changed from 16614 to 15903 (-4%)
packages/core2-64-poky-linux/grep/grep-locale-ja: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-ja: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-ka: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-ka: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-ka: PKGSIZE changed from 27898 to 26558 (-5%)
packages/core2-64-poky-linux/grep/grep-locale-ko: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-ko: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-ko: PKGSIZE changed from 19452 to 19364 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-ky: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-ky: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-lt: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-lt: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-nb: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-nb: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-nb: PKGSIZE changed from 17727 to 16958 (-4%)
packages/core2-64-poky-linux/grep/grep-locale-nl: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-nl: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-nl: PKGSIZE changed from 18595 to 18628 (+0%)
packages/core2-64-poky-linux/grep/grep-locale-pa: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-pa: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-pl: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-pl: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-pl: PKGSIZE changed from 18580 to 18532 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-pt-br: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-pt-br: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-pt-br: PKGSIZE changed from 18629 to 17882 (-4%)
packages/core2-64-poky-linux/grep/grep-locale-pt: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-pt: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-pt: PKGSIZE changed from 16154 to 17612 (+9%)
packages/core2-64-poky-linux/grep/grep-locale-ro: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-ro: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-ro: PKGSIZE changed from 18888 to 18850 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-ru: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-ru: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-ru: PKGSIZE changed from 23405 to 22248 (-5%)
packages/core2-64-poky-linux/grep/grep-locale-sk: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-sk: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-sk: PKGSIZE changed from 18143 to 18124 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-sl: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-sl: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-sl: PKGSIZE changed from 9965 to 17215 (+73%)
packages/core2-64-poky-linux/grep/grep-locale-sr: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-sr: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-sr: PKGSIZE changed from 21895 to 21467 (-2%)
packages/core2-64-poky-linux/grep/grep-locale-sv: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-sv: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-sv: PKGSIZE changed from 17578 to 17567 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-ta: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-ta: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-ta: PKGSIZE changed from 27372 to 26043 (-5%)
packages/core2-64-poky-linux/grep/grep-locale-th: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-th: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-th: PKGSIZE changed from 16494 to 23904 (+45%)
packages/core2-64-poky-linux/grep/grep-locale-tr: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-tr: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-tr: PKGSIZE changed from 17815 to 17094 (-4%)
packages/core2-64-poky-linux/grep/grep-locale-uk: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-uk: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-uk: PKGSIZE changed from 23948 to 23870 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-vi: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-vi: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-vi: PKGSIZE changed from 20096 to 19261 (-4%)
packages/core2-64-poky-linux/grep/grep-locale-zh-cn: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-zh-cn: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-zh-cn: PKGSIZE changed from 17367 to 17328 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-zh-tw: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-zh-tw: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-zh-tw: PKGSIZE changed from 17053 to 17019 (-0%)
packages/core2-64-poky-linux/grep/grep-src: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-src: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-src: FILELIST: directory renamed /usr/src/debug/grep/3.11/lib/malloc -> /usr/src/debug/grep/3.12/lib/malloc, directory renamed /usr/src/debug/grep/3.11/src -> /usr/src/debug/grep/3.12/src, removed "/usr/src/debug/grep/3.11/lib/xstrtol.h /usr/src/debug/grep/3.11/lib/xalloc-die.c /usr/src/debug/grep/3.11/lib/xstrtol.c /usr/src/debug/grep/3.11/lib/xmalloc.c /usr/src/debug/grep/3.11/lib/mbsrtowcs.c /usr/src/debug/grep/3.11/lib/dirent.h /usr/src/debug/grep/3.11/lib/safe-read.c /usr/src/debug/grep/3.11/lib/hash.h /usr/src/debug/grep/3.11/lib/ialloc.h /usr/src/debug/grep/3.11/lib/xalloc.h /usr/src/debug/grep/3.11/lib/fts_.h /usr/src/debug/grep/3.11/lib/safe-read.h /usr/src/debug/grep/3.11/lib/str-two-way.h /usr/src/debug/grep/3.11/lib/hash.c /usr/src/debug/grep/3.11/lib/strnlen1.h /usr/src/debug/grep/3.11/lib/dfa.h /usr/src/debug/grep/3.11/lib/idx.h /usr/src/debug/grep/3.11/lib/close-stream.c /usr/src/debug/grep/3.11/lib/close-stream.h /usr/src/debug/g
 rep/3.11/lib/dfa.c /usr/src/debug/grep/3.11/lib/fts.c /usr/src/debug/grep/3.11/lib/dirname.h /usr/src/debug/grep/3.11/lib/strnlen1.c /usr/src/debug/grep/3.11/lib/fcntl.c /usr/src/debug/grep/3.11/lib/memchr.c /usr/src/debug/grep/3.11/lib/binary-io.h /usr/src/debug/grep/3.11/lib/wchar.h /usr/src/debug/grep/3.11/lib/fcntl.h /usr/src/debug/grep/3.11/lib/memchr2.c /usr/src/debug/grep/3.11/lib/fnmatch_loop.c /usr/src/debug/grep/3.11/lib/memchr2.h /usr/src/debug/grep/3.11/lib/stackvma.c /usr/src/debug/grep/3.11/lib/stackvma.h /usr/src/debug/grep/3.11/lib/colorize-posix.c /usr/src/debug/grep/3.11/lib/sys-limits.h /usr/src/debug/grep/3.11/lib/unistd-safer.h /usr/src/debug/grep/3.11/lib/getopt-core.h /usr/src/debug/grep/3.11/lib/quotearg.h /usr/src/debug/grep/3.11/lib/quotearg.c /usr/src/debug/grep/3.11/lib/regcomp.c /usr/src/debug/grep/3.11/lib/regex.h /usr/src/debug/grep/3.11/lib/c-strcaseeq.h /usr/src/debug/grep/3.11/lib/fcntl-safer.h /usr/src/debug/grep/3.11/lib/stdlib.h /usr/src/debug/gr
 ep/3.11/lib/mbrlen.c /usr/src/debug/grep/3.11/lib/c-strcasecmp.c /usr/src/debug/grep/3.11/lib/i-ring.h /usr/src/debug/grep/3.11/lib/string.h /usr/src/debug/grep/3.11/lib/i-ring.c /usr/src/debug/grep/3.11/lib/stripslash.c /usr/src/debug/grep/3.11/lib/setlocale_null.c /usr/src/debug/grep/3.11/lib/version-etc.h /usr/src/debug/grep/3.11/lib/dev-ino.h /usr/src/debug/grep/3.11/lib/localeinfo.h /usr/src/debug/grep/3.11/lib/regex_internal.c /usr/src/debug/grep/3.11/lib/version-etc.c /usr/src/debug/grep/3.11/lib/getopt1.c /usr/src/debug/grep/3.11/lib/setlocale_null.h /usr/src/debug/grep/3.11/lib/localeinfo.c /usr/src/debug/grep/3.11/lib/regex_internal.h /usr/src/debug/grep/3.11/lib/strstr.c /usr/src/debug/grep/3.11/lib/argmatch.c /usr/src/debug/grep/3.11/lib/exclude.c /usr/src/debug/grep/3.11/lib/mbsrtowcs-state.c /usr/src/debug/grep/3.11/lib/exclude.h /usr/src/debug/grep/3.11/lib/argmatch.h /usr/src/debug/grep/3.11/lib/hard-locale.c /usr/src/debug/grep/3.11/lib/fnmatch.c /usr/src/debug/grep
 /3.11/lib/hard-locale.h /usr/src/debug/grep/3.11/lib/fnmatch.h /usr/src/debug/grep/3.11/lib/c-ctype.h /usr/src/debug/grep/3.11/lib/colorize.h /usr/src/debug/grep/3.11/lib/mbchar.c /usr/src/debug/grep/3.11/lib/getopt-ext.h /usr/src/debug/grep/3.11/lib/getopt_int.h /usr/src/debug/grep/3.11/lib/mbchar.h /usr/src/debug/grep/3.11/lib/bitrotate.h /usr/src/debug/grep/3.11/lib/exitfail.h /usr/src/debug/grep/3.11/lib/basename-lgpl.h /usr/src/debug/grep/3.11/lib/mbrtowc.c /usr/src/debug/grep/3.11/lib/c-strcase.h /usr/src/debug/grep/3.11/lib/basename-lgpl.c /usr/src/debug/grep/3.11/lib/getprogname.c /usr/src/debug/grep/3.11/lib/exitfail.c /usr/src/debug/grep/3.11/lib/mbscasecmp.c /usr/src/debug/grep/3.11/lib/openat-safer.c /usr/src/debug/grep/3.11/lib/cycle-check.h /usr/src/debug/grep/3.11/lib/getopt.c /usr/src/debug/grep/3.11/lib/cycle-check.c /usr/src/debug/grep/3.11/lib/dup-safer.c /usr/src/debug/grep/3.11/lib/open-safer.c /usr/src/debug/grep/3.11/lib/dirfd.c /usr/src/debug/grep/3.11/lib/fo
 pen.c /usr/src/debug/grep/3.11/lib/mbsrtowcs-impl.h /usr/src/debug/grep/3.11/lib/stdio.h /usr/src/debug/grep/3.11/lib/quote.h /usr/src/debug/grep/3.11/lib/xbinary-io.h /usr/src/debug/grep/3.11/lib/fd-safer.c /usr/src/debug/grep/3.11/lib/version-etc-fsf.c /usr/src/debug/grep/3.11/lib/c-stack.h /usr/src/debug/grep/3.11/lib/obstack.h /usr/src/debug/grep/3.11/lib/localcharset.h /usr/src/debug/grep/3.11/lib/c-stack.c /usr/src/debug/grep/3.11/lib/obstack.c /usr/src/debug/grep/3.11/lib/localcharset.c /usr/src/debug/grep/3.11/lib/sigsegv.h /usr/src/debug/grep/3.11/lib/fts-cycle.c /usr/src/debug/grep/3.11/lib/sigsegv.c /usr/src/debug/grep/3.11/lib/btowc.c /usr/src/debug/grep/3.11/lib/closeout.c /usr/src/debug/grep/3.11/lib/opendirat.c /usr/src/debug/grep/3.11/lib/closeout.h /usr/src/debug/grep/3.11/lib/mbuiter.h /usr/src/debug/grep/3.11/lib/opendirat.h /usr/src/debug/grep/3.11/lib/regexec.c", added "/usr/src/debug/grep/3.12/lib/xstrtol.h /usr/src/debug/grep/3.12/lib/xalloc-die.c /usr/src/deb
 ug/grep/3.12/lib/xstrtol.c /usr/src/debug/grep/3.12/lib/xmalloc.c /usr/src/debug/grep/3.12/lib/mbsrtowcs.c /usr/src/debug/grep/3.12/lib/langinfo.h /usr/src/debug/grep/3.12/lib/dirent.h /usr/src/debug/grep/3.12/lib/safe-read.c /usr/src/debug/grep/3.12/lib/hash.h /usr/src/debug/grep/3.12/lib/ialloc.h /usr/src/debug/grep/3.12/lib/xalloc.h /usr/src/debug/grep/3.12/lib/fts_.h /usr/src/debug/grep/3.12/lib/safe-read.h /usr/src/debug/grep/3.12/lib/str-two-way.h /usr/src/debug/grep/3.12/lib/setlocale_null-unlocked.c /usr/src/debug/grep/3.12/lib/hash.c /usr/src/debug/grep/3.12/lib/strnlen1.h /usr/src/debug/grep/3.12/lib/dfa.h /usr/src/debug/grep/3.12/lib/idx.h /usr/src/debug/grep/3.12/lib/close-stream.c /usr/src/debug/grep/3.12/lib/close-stream.h /usr/src/debug/grep/3.12/lib/dfa.c /usr/src/debug/grep/3.12/lib/fts.c /usr/src/debug/grep/3.12/lib/dirname.h /usr/src/debug/grep/3.12/lib/strnlen1.c /usr/src/debug/grep/3.12/lib/fcntl.c /usr/src/debug/grep/3.12/lib/memchr.c /usr/src/debug/grep/3.12/l
 ib/binary-io.h /usr/src/debug/grep/3.12/lib/uchar.h /usr/src/debug/grep/3.12/lib/fcntl.h /usr/src/debug/grep/3.12/lib/wchar.h /usr/src/debug/grep/3.12/lib/memchr2.c /usr/src/debug/grep/3.12/lib/fnmatch_loop.c /usr/src/debug/grep/3.12/lib/memchr2.h /usr/src/debug/grep/3.12/lib/stackvma.c /usr/src/debug/grep/3.12/lib/mcel.h /usr/src/debug/grep/3.12/lib/stackvma.h /usr/src/debug/grep/3.12/lib/colorize-posix.c /usr/src/debug/grep/3.12/lib/mbrtoc32.c /usr/src/debug/grep/3.12/lib/sys-limits.h /usr/src/debug/grep/3.12/lib/unistd-safer.h /usr/src/debug/grep/3.12/lib/getopt-core.h /usr/src/debug/grep/3.12/lib/quotearg.h /usr/src/debug/grep/3.12/lib/quotearg.c /usr/src/debug/grep/3.12/lib/regcomp.c /usr/src/debug/grep/3.12/lib/regex.h /usr/src/debug/grep/3.12/lib/c-strcaseeq.h /usr/src/debug/grep/3.12/lib/fcntl-safer.h /usr/src/debug/grep/3.12/lib/stdlib.h /usr/src/debug/grep/3.12/lib/mbrlen.c /usr/src/debug/grep/3.12/lib/c-strcasecmp.c /usr/src/debug/grep/3.12/lib/i-ring.h /usr/src/debug/gre
 p/3.12/lib/string.h /usr/src/debug/grep/3.12/lib/i-ring.c /usr/src/debug/grep/3.12/lib/stripslash.c /usr/src/debug/grep/3.12/lib/setlocale_null.c /usr/src/debug/grep/3.12/lib/version-etc.h /usr/src/debug/grep/3.12/lib/dev-ino.h /usr/src/debug/grep/3.12/lib/localeinfo.h /usr/src/debug/grep/3.12/lib/regex_internal.c /usr/src/debug/grep/3.12/lib/version-etc.c /usr/src/debug/grep/3.12/lib/getopt1.c /usr/src/debug/grep/3.12/lib/setlocale_null.h /usr/src/debug/grep/3.12/lib/localeinfo.c /usr/src/debug/grep/3.12/lib/regex_internal.h /usr/src/debug/grep/3.12/lib/strstr.c /usr/src/debug/grep/3.12/lib/reallocarray.c /usr/src/debug/grep/3.12/lib/argmatch.c /usr/src/debug/grep/3.12/lib/exclude.c /usr/src/debug/grep/3.12/lib/mbsrtowcs-state.c /usr/src/debug/grep/3.12/lib/exclude.h /usr/src/debug/grep/3.12/lib/argmatch.h /usr/src/debug/grep/3.12/lib/hard-locale.c /usr/src/debug/grep/3.12/lib/fnmatch.c /usr/src/debug/grep/3.12/lib/hard-locale.h /usr/src/debug/grep/3.12/lib/fnmatch.h /usr/src/debug
 /grep/3.12/lib/c-ctype.h /usr/src/debug/grep/3.12/lib/colorize.h /usr/src/debug/grep/3.12/lib/getopt-ext.h /usr/src/debug/grep/3.12/lib/getopt_int.h /usr/src/debug/grep/3.12/lib/bitrotate.h /usr/src/debug/grep/3.12/lib/exitfail.h /usr/src/debug/grep/3.12/lib/basename-lgpl.h /usr/src/debug/grep/3.12/lib/mbrtowc.c /usr/src/debug/grep/3.12/lib/c-strcase.h /usr/src/debug/grep/3.12/lib/basename-lgpl.c /usr/src/debug/grep/3.12/lib/getprogname.c /usr/src/debug/grep/3.12/lib/exitfail.c /usr/src/debug/grep/3.12/lib/mbscasecmp.c /usr/src/debug/grep/3.12/lib/openat-safer.c /usr/src/debug/grep/3.12/lib/cycle-check.h /usr/src/debug/grep/3.12/lib/getopt.c /usr/src/debug/grep/3.12/lib/nl_langinfo.c /usr/src/debug/grep/3.12/lib/cycle-check.c /usr/src/debug/grep/3.12/lib/dup-safer.c /usr/src/debug/grep/3.12/lib/open-safer.c /usr/src/debug/grep/3.12/lib/fopen.c /usr/src/debug/grep/3.12/lib/mbsrtowcs-impl.h /usr/src/debug/grep/3.12/lib/stdio.h /usr/src/debug/grep/3.12/lib/quote.h /usr/src/debug/grep/3
 .12/lib/xbinary-io.h /usr/src/debug/grep/3.12/lib/fd-safer.c /usr/src/debug/grep/3.12/lib/version-etc-fsf.c /usr/src/debug/grep/3.12/lib/c-stack.h /usr/src/debug/grep/3.12/lib/obstack.h /usr/src/debug/grep/3.12/lib/localcharset.h /usr/src/debug/grep/3.12/lib/c-stack.c /usr/src/debug/grep/3.12/lib/obstack.c /usr/src/debug/grep/3.12/lib/localcharset.c /usr/src/debug/grep/3.12/lib/sigsegv.h /usr/src/debug/grep/3.12/lib/fts-cycle.c /usr/src/debug/grep/3.12/lib/sigsegv.c /usr/src/debug/grep/3.12/lib/btowc.c /usr/src/debug/grep/3.12/lib/closeout.c /usr/src/debug/grep/3.12/lib/opendirat.c /usr/src/debug/grep/3.12/lib/closeout.h /usr/src/debug/grep/3.12/lib/opendirat.h /usr/src/debug/grep/3.12/lib/regexec.c"
packages/core2-64-poky-linux/grep/grep-src: PKGSIZE changed from 1916007 to 2080887 (+9%)
packages/core2-64-poky-linux/grep/grep-staticdev: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-staticdev: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep: SRC_URI changed from "https://ftp.gnu.org/gnu/grep/grep-3.11.tar.xz" to "https://ftp.gnu.org/gnu/grep/grep-3.12.tar.xz"

--===============5250551890631285385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/grep/grep-locale-he: PKGSIZE changed from 1138 to 1319 (+16%)
packages/core2-64-poky-linux/grep/grep-locale-sl: PKGSIZE changed from 9965 to 17215 (+73%)
packages/core2-64-poky-linux/grep/grep-locale-th: PKGSIZE changed from 16494 to 23904 (+45%)

--===============5250551890631285385==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-grep-upgrade-3.11-3.12.patch"

RnJvbSA2YTg5MDllM2FkN2ZiZTZhYjljYTYyODg3YThhNzlkMGM0N2NiZGIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMDg6NTQ6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
cmVwOiB1cGdyYWRlIDMuMTEgLT4gMy4xMgoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ3Jl
cC97Z3JlcF8zLjExLmJiID0+IGdyZXBfMy4xMi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvZ3JlcC97Z3JlcF8zLjExLmJiID0+IGdyZXBfMy4xMi5iYn0gKDkzJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ3JlcC9ncmVwXzMuMTEuYmIgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvZ3JlcC9ncmVwXzMuMTIuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dyZXAvZ3JlcF8zLjExLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvZ3JlcC9ncmVwXzMuMTIuYmIKaW5kZXggMGQzNmViYTNiMi4uMjY3
OGQyZDQxZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dyZXAvZ3JlcF8zLjEx
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ncmVwL2dyZXBfMy4xMi5iYgpAQCAtOCw3
ICs4LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MWViYmQzZTM0
MjM3YWYyNmRhNWRjMDhhNGU0NDA0NjQiCiAKIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9ncmVw
L2dyZXAtJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWRiMmFlZGRlODlk
MGRlYTQyYjE2ZDk1MjhmODk0YzhkMTVkYWU0ZTE5MGI1OWFlY2M3OGY1YTk1MTI3NmVhYiIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICIyNjQ5YjI3YzBlOTBlNjMyZWFkY2Q3NTdiZTA2YzZlOWE0ZjQ4
ZDk0MWRlNTFlN2MwZjgzZmY3NjQwOGEwN2I5IgogCiBpbmhlcml0IGF1dG90b29scyBnZXR0ZXh0
IHRleGluZm8gcGtnY29uZmlnCiAKLS0gCjIuNDcuMQoK

--===============5250551890631285385==--

