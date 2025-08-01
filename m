Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10794CA0EF4
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:02 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.88801.1754057268050553273
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gcyFUULi;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=MVvoWRFK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019865f608ed-037434bc-e8f7-4700-b2a0-93b5a8d11f35-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057279;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DAymy5NqvpBzKet9MeX82oRm4tz0bR9JPBEChlovw+E=;
	b=gcyFUULiPSv+z8/foKX9NhF5qIPTNw2DwCbo+FgXgkh5wCUrAaep027kMygWjoEw
	QEyUUoFVWJ+67nrpgIpoA0dFoyN2sefAT8M47OVyDiFrwtUfHJ3whg2GDvAiF/9Wqk2
	yhOOMOLsGFa6plKTVUvryVBugnO0nN3YwJLUFpew=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057279;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DAymy5NqvpBzKet9MeX82oRm4tz0bR9JPBEChlovw+E=;
	b=MVvoWRFKQhB3X6onrYXlxcHR+/6Tm2sg9KJqs2pYxH4kO/s2ScgouAQOsPZwdxjC
	KhrTfAZUOLw53ovde0fK9D3qTNSmoUHPMt5AQt/nznxi03dtbQozOtXW89LkTK1HSaP
	KJ6T7hPVmNthcT2ih2vuIL/JlkPh6YHaxd5zd4nA=
Content-Type: multipart/mixed; boundary="===============7712672602774150868=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysstat: upgrading to 12.7.8 SUCCEEDED
Message-ID: <0101019865f608ed-037434bc-e8f7-4700-b2a0-93b5a8d11f35-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221302

--===============7712672602774150868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sysstat* to *12.7.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysstat-upgrade-12.7.7-12.7.8.patch
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
From 8ac844a23159482d9640d7e73205c8b572359ea3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 10:45:15 +0000
Subject: [PATCH] sysstat: upgrade 12.7.7 -> 12.7.8

---
 .../0001-configure.in-remove-check-for-chkconfig.patch     | 7 ++-----
 .../sysstat/{sysstat_12.7.7.bb => sysstat_12.7.8.bb}       | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.7.7.bb => sysstat_12.7.8.bb} (98%)

diff --git a/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch b/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
index 84383f955f..c9a228fa90 100644
--- a/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
+++ b/meta/recipes-extended/sysstat/sysstat/0001-configure.in-remove-check-for-chkconfig.patch
@@ -1,4 +1,4 @@
-From 1590cc614aaf0fb81cd804414d6c9d5a9227352c Mon Sep 17 00:00:00 2001
+From ae18e7979a1adbc603095efeb96958a349692eaf Mon Sep 17 00:00:00 2001
 From: Wenlin Kang <wenlin.kang@windriver.com>
 Date: Tue, 5 Nov 2019 16:16:44 +0800
 Subject: [PATCH] configure.ac: remove check for chkconfig
@@ -13,7 +13,7 @@ Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 48b9a31..cedeb43 100644
+index 0bdd6d27..4855707d 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -42,7 +42,8 @@ AC_SUBST(VER_JSON)
@@ -26,6 +26,3 @@ index 48b9a31..cedeb43 100644
  
  # Check for systemd
  AC_CHECK_PROG(PKG_CONFIG, pkg-config, pkg-config)
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/sysstat/sysstat_12.7.7.bb b/meta/recipes-extended/sysstat/sysstat_12.7.8.bb
similarity index 98%
rename from meta/recipes-extended/sysstat/sysstat_12.7.7.bb
rename to meta/recipes-extended/sysstat/sysstat_12.7.8.bb
index 0fa4a3c950..05a6adcc2a 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.7.7.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.7.8.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/sysstat/sysstat.git;protocol=https;branch=master \
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRCREV = "dac10e13c70d1102aa3beea10135a3ed60520c36"
+SRCREV = "5841596edf7f5e53288cb56400e0c0c1da5f2415"
 
 DEPENDS += "base-passwd"
 
-- 
2.47.1


--===============7712672602774150868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/sysstat: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-dbg: PKGSIZE changed from 2757760 to 2762184 (+0%)
packages/core2-64-poky-linux/sysstat/sysstat-dbg: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-dbg: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-dev: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-dev: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-doc: PKGSIZE changed from 263189 to 264544 (+1%)
packages/core2-64-poky-linux/sysstat/sysstat-doc: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-doc: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-af: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-af: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-be: PKGSIZE changed from 18593 to 19181 (+3%)
packages/core2-64-poky-linux/sysstat/sysstat-locale-be: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-be: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-cs: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-cs: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-da: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-da: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-de: PKGSIZE changed from 15453 to 15921 (+3%)
packages/core2-64-poky-linux/sysstat/sysstat-locale-de: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-de: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-eo: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-eo: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-es: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-es: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-eu: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-eu: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-fi: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-fi: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-fr: PKGSIZE changed from 16024 to 16525 (+3%)
packages/core2-64-poky-linux/sysstat/sysstat-locale-fr: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-fr: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-fur: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-fur: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-gl: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-gl: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-hr: PKGSIZE changed from 15184 to 16116 (+6%)
packages/core2-64-poky-linux/sysstat/sysstat-locale-hr: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-hr: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-hu: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-hu: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-id: PKGSIZE changed from 15176 to 15663 (+3%)
packages/core2-64-poky-linux/sysstat/sysstat-locale-id: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-id: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-it: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-it: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-ja: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-ja: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-ka: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-ka: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-ko: PKGSIZE changed from 15651 to 16124 (+3%)
packages/core2-64-poky-linux/sysstat/sysstat-locale-ko: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-ko: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-ky: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-ky: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-lv: PKGSIZE changed from 15535 to 15989 (+3%)
packages/core2-64-poky-linux/sysstat/sysstat-locale-lv: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-lv: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-mt: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-mt: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-nb: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-nb: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-nl: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-nl: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-nn: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-nn: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-pl: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-pl: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-pt-br: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-pt-br: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-pt: PKGSIZE changed from 15310 to 16305 (+6%)
packages/core2-64-poky-linux/sysstat/sysstat-locale-pt: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-pt: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-ro: PKGSIZE changed from 16199 to 16671 (+3%)
packages/core2-64-poky-linux/sysstat/sysstat-locale-ro: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-ro: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-ru: PKGSIZE changed from 18519 to 19073 (+3%)
packages/core2-64-poky-linux/sysstat/sysstat-locale-ru: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-ru: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-sk: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-sk: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-sr: PKGSIZE changed from 18799 to 19185 (+2%)
packages/core2-64-poky-linux/sysstat/sysstat-locale-sr: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-sr: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-sv: PKGSIZE changed from 15130 to 15566 (+3%)
packages/core2-64-poky-linux/sysstat/sysstat-locale-sv: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-sv: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-tr: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-tr: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-uk: PKGSIZE changed from 19300 to 19865 (+3%)
packages/core2-64-poky-linux/sysstat/sysstat-locale-uk: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-uk: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-vi: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-vi: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-zh-cn: PKGSIZE changed from 14772 to 15221 (+3%)
packages/core2-64-poky-linux/sysstat/sysstat-locale-zh-cn: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-zh-cn: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-locale-zh-tw: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-locale-zh-tw: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-src: PKGSIZE changed from 1970420 to 1973874 (+0%)
packages/core2-64-poky-linux/sysstat/sysstat-src: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-src: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat-staticdev: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat-staticdev: PV changed from "12.7.7" to "12.7.8"
packages/core2-64-poky-linux/sysstat/sysstat: PKGSIZE changed from 1048939 to 1053035 (+0%)
packages/core2-64-poky-linux/sysstat/sysstat: PKGV changed from 12.7.7 [default] to 12.7.8 [default]
packages/core2-64-poky-linux/sysstat/sysstat: PV changed from "12.7.7" to "12.7.8"

--===============7712672602774150868==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysstat-upgrade-12.7.7-12.7.8.patch"

RnJvbSA4YWM4NDRhMjMxNTk0ODJkOTY0MGQ3ZTczMjA1YzhiNTcyMzU5ZWEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAxMDo0NToxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c3N0YXQ6IHVwZ3JhZGUgMTIuNy43IC0+IDEyLjcuOAoKLS0tCiAuLi4vMDAwMS1jb25maWd1cmUu
aW4tcmVtb3ZlLWNoZWNrLWZvci1jaGtjb25maWcucGF0Y2ggICAgIHwgNyArKy0tLS0tCiAuLi4v
c3lzc3RhdC97c3lzc3RhdF8xMi43LjcuYmIgPT4gc3lzc3RhdF8xMi43LjguYmJ9ICAgICAgIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c3N0YXQve3N5c3N0YXRfMTIuNy43LmJiID0+
IHN5c3N0YXRfMTIuNy44LmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9zeXNzdGF0L3N5c3N0YXQvMDAwMS1jb25maWd1cmUuaW4tcmVtb3ZlLWNoZWNrLWZvci1j
aGtjb25maWcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lzc3RhdC9zeXNzdGF0LzAw
MDEtY29uZmlndXJlLmluLXJlbW92ZS1jaGVjay1mb3ItY2hrY29uZmlnLnBhdGNoCmluZGV4IDg0
MzgzZjk1NWYuLmM5YTIyOGZhOTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9z
eXNzdGF0L3N5c3N0YXQvMDAwMS1jb25maWd1cmUuaW4tcmVtb3ZlLWNoZWNrLWZvci1jaGtjb25m
aWcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c3N0YXQvc3lzc3RhdC8wMDAx
LWNvbmZpZ3VyZS5pbi1yZW1vdmUtY2hlY2stZm9yLWNoa2NvbmZpZy5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gMTU5MGNjNjE0YWFmMGZiODFjZDgwNDQxNGQ2YzlkNWE5MjI3MzUyYyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWUxOGU3OTc5YTFhZGJjNjAzMDk1ZWZlYjk2OTU4
YTM0OTY5MmVhZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFdlbmxpbiBLYW5nIDx3
ZW5saW4ua2FuZ0B3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCA1IE5vdiAyMDE5IDE2OjE2OjQ0
ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZS5hYzogcmVtb3ZlIGNoZWNrIGZvciBj
aGtjb25maWcKQEAgLTEzLDcgKzEzLDcgQEAgU2lnbmVkLW9mZi1ieTogV2VubGluIEthbmcgPHdl
bmxpbi5rYW5nQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJl
LmFjCi1pbmRleCA0OGI5YTMxLi5jZWRlYjQzIDEwMDY0NAoraW5kZXggMGJkZDZkMjcuLjQ4NTU3
MDdkIDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC00
Miw3ICs0Miw4IEBAIEFDX1NVQlNUKFZFUl9KU09OKQpAQCAtMjYsNiArMjYsMyBAQCBpbmRleCA0
OGI5YTMxLi5jZWRlYjQzIDEwMDY0NAogIAogICMgQ2hlY2sgZm9yIHN5c3RlbWQKICBBQ19DSEVD
S19QUk9HKFBLR19DT05GSUcsIHBrZy1jb25maWcsIHBrZy1jb25maWcpCi0tLSAKLTEuOS4xCi0K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNzdGF0L3N5c3N0YXRfMTIuNy43
LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c3N0YXQvc3lzc3RhdF8xMi43LjguYmIKc2lt
aWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c3N0
YXQvc3lzc3RhdF8xMi43LjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNz
dGF0L3N5c3N0YXRfMTIuNy44LmJiCmluZGV4IDBmYTRhM2M5NTAuLjA1YTZhZGNjMmEgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNzdGF0L3N5c3N0YXRfMTIuNy43LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNzdGF0L3N5c3N0YXRfMTIuNy44LmJiCkBAIC0x
Miw3ICsxMiw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9zeXNzdGF0L3N5c3N0YXQu
Z2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIgXAogCiBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9DT1BZSU5HO21kNT1hMjNhNzRiM2Y0Y2FmOTYxNjIzMDc4OWQ5NDIxN2FjYiIKIAot
U1JDUkVWID0gImRhYzEwZTEzYzcwZDExMDJhYTNiZWVhMTAxMzVhM2VkNjA1MjBjMzYiCitTUkNS
RVYgPSAiNTg0MTU5NmVkZjdmNWU1MzI4OGNiNTY0MDBlMGMwYzFkYTVmMjQxNSIKIAogREVQRU5E
UyArPSAiYmFzZS1wYXNzd2QiCiAKLS0gCjIuNDcuMQoK

--===============7712672602774150868==--

