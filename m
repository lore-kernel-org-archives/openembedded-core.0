Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3B7CCA482
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:48 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web09.624.1654100324694249072
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=e5MyiIGY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010181200fec71-4b638386-8cce-47cc-acd8-5dfb9460ba4e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oMOT+ByFw5FX1YuK8OmtEkJvOLJPe7uFfD7r+e1m8+w=;
	b=e5MyiIGYAxEum2S3vT6dOSA7xj32aZ80mHBNJqiQK3pKH/wUC5zcNa5b5yhl1gzx
	XoF5lcEslVdVIAsobrlf5a6g7OardcYYCmUURdy81hAk+oddJA9sjoIC9pdZ9lTvpeX
	62T9a+61kVURwZ+QH+IJaRc8AP8P6nn1UtYs0zJY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oMOT+ByFw5FX1YuK8OmtEkJvOLJPe7uFfD7r+e1m8+w=;
	b=SEYrwLcjK9MWJb+aZXCpx2fV9/kYwVlAV8BjBXVzZf8AlpEmmPdVyGCUNI3mIsIS
	Lmwz0t2S+evpZZ77vpwxycg1kZfwPTK/6ZgjcQ7+XM2MI1qX2fDjRJqgAFvGLDtNc4t
	+NaR2Uct21gmSHfbOETW88zCfw2e6Dom/MiQM/po=
Content-Type: multipart/mixed; boundary="===============0298167005840053181=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysstat: upgrading to 12.6.0 SUCCEEDED
Message-ID: 
 <01010181200fec71-4b638386-8cce-47cc-acd8-5dfb9460ba4e-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:43 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166419

--===============0298167005840053181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sysstat* to *12.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysstat-upgrade-12.4.5-12.6.0.patch
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
--===============0298167005840053181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sysstat: SRC_URI changed from "http://pagesperso-orange.fr/sebastien.godard/sysstat-12.4.5.tar.xz file://99_sysstat file://sysstat.service file://0001-configure.in-remove-check-for-chkconfig.patch" to "http://pagesperso-orange.fr/sebastien.godard/sysstat-12.6.0.tar.xz file://99_sysstat file://sysstat.service file://0001-configure.in-remove-check-for-chkconfig.patch"
packages/core2-32-poky-linux/sysstat: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-dbg: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-dbg: PKGSIZE changed from 1822688 to 1832604 (+1%)
packages/core2-32-poky-linux/sysstat/sysstat-dbg: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-dev: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-dev: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-doc: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-doc: PKGSIZE changed from 248562 to 255443 (+3%)
packages/core2-32-poky-linux/sysstat/sysstat-doc: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-doc: FILELIST: removed "/usr/share/doc/sysstat/sysstat-12.4.5.lsm", added "/usr/share/doc/sysstat/sysstat-12.6.0.lsm"
packages/core2-32-poky-linux/sysstat/sysstat-locale-af: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-af: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-cs: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-cs: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-da: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-da: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-de: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-de: PKGSIZE changed from 14987 to 15444 (+3%)
packages/core2-32-poky-linux/sysstat/sysstat-locale-de: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-eo: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-eo: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-es: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-es: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-eu: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-eu: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-fi: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-fi: PKGSIZE changed from 14354 to 15138 (+5%)
packages/core2-32-poky-linux/sysstat/sysstat-locale-fi: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-fr: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-fr: PKGSIZE changed from 15488 to 16020 (+3%)
packages/core2-32-poky-linux/sysstat/sysstat-locale-fr: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-fur: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-fur: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-gl: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-gl: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-hr: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-hr: PKGSIZE changed from 14767 to 15191 (+3%)
packages/core2-32-poky-linux/sysstat/sysstat-locale-hr: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-hu: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-hu: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-id: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-id: PKGSIZE changed from 12383 to 15159 (+22%)
packages/core2-32-poky-linux/sysstat/sysstat-locale-id: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-it: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-it: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-ja: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-ja: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-ko: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-ko: PKGSIZE changed from 13910 to 14892 (+7%)
packages/core2-32-poky-linux/sysstat/sysstat-locale-ko: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-ky: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-ky: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-lv: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-lv: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-mt: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-mt: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-nb: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-nb: PKGSIZE changed from 14579 to 14999 (+3%)
packages/core2-32-poky-linux/sysstat/sysstat-locale-nb: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-nl: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-nl: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-nn: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-nn: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-pl: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-pl: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-pt-br: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-pt-br: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-pt: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-pt: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-ro: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-ro: PKGSIZE changed from 4855 to 16091 (+231%)
packages/core2-32-poky-linux/sysstat/sysstat-locale-ro: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-ru: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-ru: PKGSIZE changed from 17943 to 18508 (+3%)
packages/core2-32-poky-linux/sysstat/sysstat-locale-ru: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-sk: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-sk: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-sr: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-sr: PKGSIZE changed from 18133 to 18580 (+2%)
packages/core2-32-poky-linux/sysstat/sysstat-locale-sr: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-sv: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-sv: PKGSIZE changed from 14701 to 15127 (+3%)
packages/core2-32-poky-linux/sysstat/sysstat-locale-sv: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-tr: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-tr: PKGSIZE changed from 14884 to 15211 (+2%)
packages/core2-32-poky-linux/sysstat/sysstat-locale-tr: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-uk: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-uk: PKGSIZE changed from 18718 to 19276 (+3%)
packages/core2-32-poky-linux/sysstat/sysstat-locale-uk: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-vi: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-vi: PKGSIZE changed from 14867 to 17414 (+17%)
packages/core2-32-poky-linux/sysstat/sysstat-locale-vi: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-zh-cn: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-zh-cn: PKGSIZE changed from 13543 to 14772 (+9%)
packages/core2-32-poky-linux/sysstat/sysstat-locale-zh-cn: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-locale-zh-tw: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-zh-tw: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-src: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-src: PKGSIZE changed from 1786412 to 1796634 (+1%)
packages/core2-32-poky-linux/sysstat/sysstat-src: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat-staticdev: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat-staticdev: PV changed from "12.4.5" to "12.6.0"
packages/core2-32-poky-linux/sysstat/sysstat: PKGV changed from 12.4.5 [default] to 12.6.0 [default]
packages/core2-32-poky-linux/sysstat/sysstat: PKGSIZE changed from 1065456 to 1086147 (+2%)
packages/core2-32-poky-linux/sysstat/sysstat: PV changed from "12.4.5" to "12.6.0"

--===============0298167005840053181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/sysstat/sysstat-doc: FILELIST: removed "/usr/share/doc/sysstat/sysstat-12.4.5.lsm", added "/usr/share/doc/sysstat/sysstat-12.6.0.lsm"
packages/core2-32-poky-linux/sysstat/sysstat-locale-id: PKGSIZE changed from 12383 to 15159 (+22%)
packages/core2-32-poky-linux/sysstat/sysstat-locale-ro: PKGSIZE changed from 4855 to 16091 (+231%)
packages/core2-32-poky-linux/sysstat/sysstat-locale-vi: PKGSIZE changed from 14867 to 17414 (+17%)

--===============0298167005840053181==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-sysstat-upgrade-12.4.5-12.6.0.patch"

From 8e1f7b3fb9c47a41fed9c5fbb27a7e4ef96f69e3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jun 2022 10:27:48 +0000
Subject: [PATCH] sysstat: upgrade 12.4.5 -> 12.6.0

---
 .../sysstat/{sysstat_12.4.5.bb => sysstat_12.6.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.4.5.bb => sysstat_12.6.0.bb} (65%)

diff --git a/meta/recipes-extended/sysstat/sysstat_12.4.5.bb b/meta/recipes-extended/sysstat/sysstat_12.6.0.bb
similarity index 65%
rename from meta/recipes-extended/sysstat/sysstat_12.4.5.bb
rename to meta/recipes-extended/sysstat/sysstat_12.6.0.bb
index fe3db4d8a5..273c5c1815 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.4.5.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.6.0.bb
@@ -4,4 +4,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
 
-SRC_URI[sha256sum] = "ef445acea301bbb996e410842f6290a8d049e884d4868cfef7e85dc04b7eee5b"
+SRC_URI[sha256sum] = "699fd948836d77f9ad0541fd5dcf75cd2505f9da4ec14df669286ad047c23d97"
-- 
2.31.1


--===============0298167005840053181==--

