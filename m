Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7C8C54755
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:56 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.1817.1746113629068861082
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=kA+B48SJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fI00jScu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101968c7b892e-dc0c2568-ebd0-4211-95b7-6af6993b1594-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113628;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eyRFH3vMkx6w4z2bl16C7EEgzA9sEsPdQQURscSn/k4=;
	b=kA+B48SJttdQirjhMl9UCnmo3tMLpbn1WpnhWh59MOT5R3EZ4odVIaI+piwmdw8l
	m6p/P3d8ZbJo/4ZDV4tn8krE/EKqJH3CpbrAF1zhUST5+JhQwcydobeQE0B9hl3o8uM
	wRmKld9BNMP7t/+czyIMFd+V8tI4XTNmxevyea/w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113628;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eyRFH3vMkx6w4z2bl16C7EEgzA9sEsPdQQURscSn/k4=;
	b=fI00jSculwjh2upcBoA1Xq1soHZBXwf+DZQKYag/0VkRbqoGNHh4BMYdQ4pvjWvh
	4/AWYqFDZJX7K+tEP5OKWjK5pAbdLc6VZxFe/zipsSeGunvpT5IOlx/dbN9w4WzRnJ/
	h6lHiV+hG2JlI+eXQvVa7lJEpuUZprZCxNODrYBk=
Content-Type: multipart/mixed; boundary="===============4839257079194278289=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] grep: upgrading to 3.12 SUCCEEDED
Message-ID: <010101968c7b892e-dc0c2568-ebd0-4211-95b7-6af6993b1594-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215850

--===============4839257079194278289==
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
From 15e486da63f44d36943e1fb62ae19f3a19619c8c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 10:47:24 +0000
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


--===============4839257079194278289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/grep/grep-dbg: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-dbg: PKGSIZE changed from 974232 to 978976 (+0%)
packages/core2-64-poky-linux/grep/grep-dbg: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-dev: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-dev: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-doc: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-doc: PKGSIZE changed from 169725 to 171876 (+1%)
packages/core2-64-poky-linux/grep/grep-doc: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-af: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-af: PKGSIZE changed from 1171 to 1168 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-af: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-be: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-be: PKGSIZE changed from 23291 to 22149 (-5%)
packages/core2-64-poky-linux/grep/grep-locale-be: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-bg: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-bg: PKGSIZE changed from 23915 to 23687 (-1%)
packages/core2-64-poky-linux/grep/grep-locale-bg: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-ca: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-ca: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-cs: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-cs: PKGSIZE changed from 18845 to 18813 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-cs: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-da: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-da: PKGSIZE changed from 15797 to 15153 (-4%)
packages/core2-64-poky-linux/grep/grep-locale-da: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-de: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-de: PKGSIZE changed from 19248 to 18447 (-4%)
packages/core2-64-poky-linux/grep/grep-locale-de: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-el: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-el: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-eo: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-eo: PKGSIZE changed from 17359 to 16608 (-4%)
packages/core2-64-poky-linux/grep/grep-locale-eo: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-es: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-es: PKGSIZE changed from 17100 to 16406 (-4%)
packages/core2-64-poky-linux/grep/grep-locale-es: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-et: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-et: PKGSIZE changed from 16997 to 16987 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-et: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-eu: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-eu: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-fi: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-fi: PKGSIZE changed from 17773 to 18146 (+2%)
packages/core2-64-poky-linux/grep/grep-locale-fi: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-fr: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-fr: PKGSIZE changed from 18057 to 17269 (-4%)
packages/core2-64-poky-linux/grep/grep-locale-fr: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-ga: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-ga: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-gl: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-gl: PKGSIZE changed from 15677 to 15060 (-4%)
packages/core2-64-poky-linux/grep/grep-locale-gl: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-he: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-he: PKGSIZE changed from 1138 to 1319 (+16%)
packages/core2-64-poky-linux/grep/grep-locale-he: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-hr: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-hr: PKGSIZE changed from 18223 to 18212 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-hr: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-hu: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-hu: PKGSIZE changed from 18874 to 18012 (-5%)
packages/core2-64-poky-linux/grep/grep-locale-hu: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-id: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-id: PKGSIZE changed from 17660 to 17658 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-id: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-it: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-it: PKGSIZE changed from 16614 to 15903 (-4%)
packages/core2-64-poky-linux/grep/grep-locale-it: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-ja: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-ja: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-ka: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-ka: PKGSIZE changed from 27898 to 26558 (-5%)
packages/core2-64-poky-linux/grep/grep-locale-ka: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-ko: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-ko: PKGSIZE changed from 19452 to 19364 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-ko: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-ky: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-ky: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-lt: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-lt: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-nb: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-nb: PKGSIZE changed from 17727 to 16958 (-4%)
packages/core2-64-poky-linux/grep/grep-locale-nb: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-nl: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-nl: PKGSIZE changed from 18595 to 18628 (+0%)
packages/core2-64-poky-linux/grep/grep-locale-nl: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-pa: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-pa: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-pl: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-pl: PKGSIZE changed from 18580 to 18532 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-pl: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-pt-br: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-pt-br: PKGSIZE changed from 18629 to 17882 (-4%)
packages/core2-64-poky-linux/grep/grep-locale-pt-br: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-pt: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-pt: PKGSIZE changed from 16154 to 17612 (+9%)
packages/core2-64-poky-linux/grep/grep-locale-pt: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-ro: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-ro: PKGSIZE changed from 18888 to 18850 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-ro: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-ru: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-ru: PKGSIZE changed from 23405 to 22248 (-5%)
packages/core2-64-poky-linux/grep/grep-locale-ru: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-sk: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-sk: PKGSIZE changed from 18143 to 18124 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-sk: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-sl: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-sl: PKGSIZE changed from 9965 to 17215 (+73%)
packages/core2-64-poky-linux/grep/grep-locale-sl: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-sr: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-sr: PKGSIZE changed from 21895 to 21467 (-2%)
packages/core2-64-poky-linux/grep/grep-locale-sr: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-sv: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-sv: PKGSIZE changed from 17578 to 17567 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-sv: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-ta: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-ta: PKGSIZE changed from 27372 to 26043 (-5%)
packages/core2-64-poky-linux/grep/grep-locale-ta: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-th: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-th: PKGSIZE changed from 16494 to 23904 (+45%)
packages/core2-64-poky-linux/grep/grep-locale-th: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-tr: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-tr: PKGSIZE changed from 17815 to 17094 (-4%)
packages/core2-64-poky-linux/grep/grep-locale-tr: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-uk: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-uk: PKGSIZE changed from 23948 to 23870 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-uk: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-vi: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-vi: PKGSIZE changed from 20096 to 19261 (-4%)
packages/core2-64-poky-linux/grep/grep-locale-vi: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-zh-cn: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-zh-cn: PKGSIZE changed from 17367 to 17328 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-zh-cn: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-locale-zh-tw: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-locale-zh-tw: PKGSIZE changed from 17053 to 17019 (-0%)
packages/core2-64-poky-linux/grep/grep-locale-zh-tw: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-src: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-src: PKGSIZE changed from 421024 to 585534 (+39%)
packages/core2-64-poky-linux/grep/grep-src: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep-src: FILELIST: removed "/usr/src/debug/grep/3.11/lib/wchar.h /usr/src/debug/grep/3.11/lib/stdio.h /usr/src/debug/grep/3.11/lib/string.h /usr/src/debug/grep/3.11/lib/fcntl.h /usr/src/debug/grep/3.11/lib/fnmatch.h /usr/src/debug/grep/3.11/lib/stdlib.h /usr/src/debug/grep/3.11/lib/dirent.h /usr/src/debug/grep/3.11/lib/sigsegv.h", added "/usr/src/debug/grep/3.12/lib/uchar.h /usr/src/debug/grep/3.12/lib/stdio.h /usr/src/debug/grep/3.12/lib/wchar.h /usr/src/debug/grep/3.12/lib/string.h /usr/src/debug/grep/3.12/lib/fcntl.h /usr/src/debug/grep/3.12/lib/obstack.h /usr/src/debug/grep/3.12/lib/fnmatch.h /usr/src/debug/grep/3.12/lib/langinfo.h /usr/src/debug/grep/3.12/lib/dirent.h /usr/src/debug/grep/3.12/lib/stdlib.h /usr/src/debug/grep/3.12/lib/sigsegv.h"
packages/core2-64-poky-linux/grep/grep-staticdev: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep-staticdev: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep/grep: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep/grep: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep: PV changed from "3.11" to "3.12"
packages/core2-64-poky-linux/grep: PKGV changed from 3.11 [default] to 3.12 [default]
packages/core2-64-poky-linux/grep: SRC_URI changed from "https://ftp.gnu.org/gnu/grep/grep-3.11.tar.xz" to "https://ftp.gnu.org/gnu/grep/grep-3.12.tar.xz"

--===============4839257079194278289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/grep/grep-locale-he: PKGSIZE changed from 1138 to 1319 (+16%)
packages/core2-64-poky-linux/grep/grep-locale-sl: PKGSIZE changed from 9965 to 17215 (+73%)
packages/core2-64-poky-linux/grep/grep-locale-th: PKGSIZE changed from 16494 to 23904 (+45%)
packages/core2-64-poky-linux/grep/grep-src: PKGSIZE changed from 421024 to 585534 (+39%)

--===============4839257079194278289==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-grep-upgrade-3.11-3.12.patch"

RnJvbSAxNWU0ODZkYTYzZjQ0ZDM2OTQzZTFmYjYyYWUxOWYzYTE5NjE5YzhjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxMDo0NzoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdy
ZXA6IHVwZ3JhZGUgMy4xMSAtPiAzLjEyCgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9ncmVw
L3tncmVwXzMuMTEuYmIgPT4gZ3JlcF8zLjEyLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRl
ZC9ncmVwL3tncmVwXzMuMTEuYmIgPT4gZ3JlcF8zLjEyLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9ncmVwL2dyZXBfMy4xMS5iYiBiL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9ncmVwL2dyZXBfMy4xMi5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ3JlcC9ncmVwXzMuMTEuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9ncmVwL2dyZXBfMy4xMi5iYgppbmRleCAwZDM2ZWJhM2IyLi4yNjc4
ZDJkNDFlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ3JlcC9ncmVwXzMuMTEu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dyZXAvZ3JlcF8zLjEyLmJiCkBAIC04LDcg
KzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0xZWJiZDNlMzQy
MzdhZjI2ZGE1ZGMwOGE0ZTQ0MDQ2NCIKIAogU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9L2dyZXAv
Z3JlcC0ke1BWfS50YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxZGIyYWVkZGU4OWQw
ZGVhNDJiMTZkOTUyOGY4OTRjOGQxNWRhZTRlMTkwYjU5YWVjYzc4ZjVhOTUxMjc2ZWFiIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjI2NDliMjdjMGU5MGU2MzJlYWRjZDc1N2JlMDZjNmU5YTRmNDhk
OTQxZGU1MWU3YzBmODNmZjc2NDA4YTA3YjkiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIGdldHRleHQg
dGV4aW5mbyBwa2djb25maWcKIAotLSAKMi40Ny4xCgo=

--===============4839257079194278289==--

