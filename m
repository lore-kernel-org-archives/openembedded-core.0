Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34753D0D7B8
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:43 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.53300.1728588981179503807
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=AaTPoBDW;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=YM0bnc+t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019277eed3d1-2b5770a8-0cf8-4136-ad40-409bdc4a56ec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588993;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=D6C8LqwMKA1QEoS2j9E1IrwmIbNBUtJ0Jbbr/h6JebI=;
	b=AaTPoBDWCyRWLUnNVzuHYF7AN5694dF9tMyn1RQ2g+D4Wrh4qNWwRUjh1dsBSaPZ
	zTcy7Nch4WSo8pJZ0uQNeQY5m98X2YBwaIo6kNgPjRt4gsQ6iERhyztPMkIU/jElF0e
	HOgv3cXQFOZvjRHfV92RmhYTzBw8JIc3hXPD0kvM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588993;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=D6C8LqwMKA1QEoS2j9E1IrwmIbNBUtJ0Jbbr/h6JebI=;
	b=YM0bnc+tN3noJGNFOG1N0NRsulDJ9o8bockju9MjOVVSawWg+2XFPyh1oS4VtIu7
	VOIwiDmn9n+M8Lm7B1FpkkLJUCzaRTg9X/TZU5UQmJU+fQd8JnzXlonfH31HKatY3Jb
	gwWWMMRM9Ab+Oqqk7bQ4kdCVcWv8c4hZhi3ERu4U=
Content-Type: multipart/mixed; boundary="===============5149257098019744554=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xkeyboard-config: upgrading to 2.43 SUCCEEDED
Message-ID: <0101019277eed3d1-2b5770a8-0cf8-4136-ad40-409bdc4a56ec-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205601

--===============5149257098019744554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xkeyboard-config* to *2.43* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xkeyboard-config-upgrade-2.42-2.43.patch
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
From 8dfe72a226cef849ff16f50eeec8a912147336dc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 15:45:31 +0000
Subject: [PATCH] xkeyboard-config: upgrade 2.42 -> 2.43

---
 .../{xkeyboard-config_2.42.bb => xkeyboard-config_2.43.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.42.bb => xkeyboard-config_2.43.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb
index cdc6422d46..7378cf475e 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8fc8ae699974c360e2e2e883a63ce264"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a6b06ebfc1f01fc505f2f05f265f95f67cc8873a54dd247e3c2d754b8f7e0807"
+SRC_URI[sha256sum] = "c810f362c82a834ee89da81e34cd1452c99789339f46f6037f4b9e227dd06c01"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.44.1


--===============5149257098019744554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/xkeyboard-config: PACKAGES: added "xkeyboard-config-locale-fa"
Changes to packages/core2-64-poky-linux/xkeyboard-config (sysroot):
  /usr/share/X11/xkb/symbols/fkeys was added
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sl: PKGSIZE changed from 69913 to 91947 (+32%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config: FILELIST: added "/usr/share/X11/xkb/symbols/fkeys"

--===============5149257098019744554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xkeyboard-config: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config: PACKAGES: added "xkeyboard-config-locale-fa"
packages/core2-64-poky-linux/xkeyboard-config: SRC_URI changed from "https://www.x.org/releases//individual/data/xkeyboard-config/xkeyboard-config-2.42.tar.xz" to "https://www.x.org/releases//individual/data/xkeyboard-config/xkeyboard-config-2.43.tar.xz"
packages/core2-64-poky-linux/xkeyboard-config: PV changed from "2.42" to "2.43"
Changes to packages/core2-64-poky-linux/xkeyboard-config (sysroot):
  /usr/share/X11/xkb/symbols/fkeys was added
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-dbg: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-dbg: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-dev: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-dev: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-doc: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-doc: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-doc: PKGSIZE changed from 41308 to 41984 (+2%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-af: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-af: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ar: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ar: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ar: PKGSIZE changed from 107294 to 109285 (+2%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-az: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-az: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-bg: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-bg: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-bg: PKGSIZE changed from 111721 to 113509 (+2%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ca: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ca: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ca: PKGSIZE changed from 87297 to 88857 (+2%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-crh: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-crh: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-cs: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-cs: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-cs: PKGSIZE changed from 92198 to 93866 (+2%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-da: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-da: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-de: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-de: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-de: PKGSIZE changed from 90962 to 93942 (+3%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-el: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-el: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-en-gb: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-en-gb: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-eo: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-eo: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-es: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-es: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-fi: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-fi: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-fr: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-fr: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-fr: PKGSIZE changed from 88745 to 90361 (+2%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-fur: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-fur: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-gl: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-gl: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-he: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-he: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-he: PKGSIZE changed from 99154 to 100859 (+2%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-hr: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-hr: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-hu: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-hu: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-id: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-id: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-id: PKGSIZE changed from 86065 to 87583 (+2%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-it: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-it: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ja: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ja: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ka: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ka: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ko: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ko: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ko: PKGSIZE changed from 94059 to 95692 (+2%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ky: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ky: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-lt: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-lt: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-nb: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-nb: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-nl: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-nl: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-pl: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-pl: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-pl: PKGSIZE changed from 87987 to 90511 (+3%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-pt-br: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-pt-br: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-pt: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-pt: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ro: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ro: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ro: PKGSIZE changed from 90672 to 92251 (+2%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ru: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ru: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-rw: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-rw: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sk: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sk: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sl: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sl: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sl: PKGSIZE changed from 69913 to 91947 (+32%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sq: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sq: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sq: PKGSIZE changed from 86570 to 89195 (+3%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sr: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sr: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sv: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sv: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sv: PKGSIZE changed from 88562 to 90122 (+2%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-tr: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-tr: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-tr: PKGSIZE changed from 88442 to 90022 (+2%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-uk: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-uk: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-uk: PKGSIZE changed from 108744 to 110586 (+2%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-vi: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-vi: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-cn: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-cn: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-cn: PKGSIZE changed from 90030 to 91518 (+2%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-tw: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-tw: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-src: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-src: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-staticdev: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-staticdev: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config: PKGV changed from 2.42 [default] to 2.43 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config: FILELIST: added "/usr/share/X11/xkb/symbols/fkeys"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config: PV changed from "2.42" to "2.43"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config: PKGSIZE changed from 3252196 to 3275487 (+1%)

--===============5149257098019744554==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xkeyboard-config-upgrade-2.42-2.43.patch"

RnJvbSA4ZGZlNzJhMjI2Y2VmODQ5ZmYxNmY1MGVlZWM4YTkxMjE0NzMzNmRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTU6NDU6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
a2V5Ym9hcmQtY29uZmlnOiB1cGdyYWRlIDIuNDIgLT4gMi40MwoKLS0tCiAuLi4ve3hrZXlib2Fy
ZC1jb25maWdfMi40Mi5iYiA9PiB4a2V5Ym9hcmQtY29uZmlnXzIuNDMuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIve3hrZXlib2FyZC1jb25maWdfMi40Mi5iYiA9
PiB4a2V5Ym9hcmQtY29uZmlnXzIuNDMuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3hvcmctbGliL3hrZXlib2FyZC1jb25maWdfMi40Mi5iYiBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWxpYi94a2V5Ym9hcmQtY29uZmlnXzIuNDMuYmIKc2ltaWxhcml0
eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3hr
ZXlib2FyZC1jb25maWdfMi40Mi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hv
cmctbGliL3hrZXlib2FyZC1jb25maWdfMi40My5iYgppbmRleCBjZGM2NDIyZDQ2Li43Mzc4Y2Y0
NzVlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIveGtleWJvYXJk
LWNvbmZpZ18yLjQyLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi94a2V5
Ym9hcmQtY29uZmlnXzIuNDMuYmIKQEAgLTEzLDcgKzEzLDcgQEAgTElDRU5TRSA9ICJNSVQgJiBN
SVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT04ZmM4YWU2OTk5NzRj
MzYwZTJlMmU4ODNhNjNjZTI2NCIKIAogU1JDX1VSSSA9ICIke1hPUkdfTUlSUk9SfS9pbmRpdmlk
dWFsL2RhdGEveGtleWJvYXJkLWNvbmZpZy8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImE2YjA2ZWJmYzFmMDFmYzUwNWYyZjA1ZjI2NWY5NWY2N2NjODg3M2E1NGRk
MjQ3ZTNjMmQ3NTRiOGY3ZTA4MDciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzgxMGYzNjJjODJh
ODM0ZWU4OWRhODFlMzRjZDE0NTJjOTk3ODkzMzlmNDZmNjAzN2Y0YjllMjI3ZGQwNmMwMSIKIAog
U0VDVElPTiA9ICJ4MTEvbGlicyIKIERFUEVORFMgPSAidXRpbC1tYWNyb3MgbGlieHNsdC1uYXRp
dmUiCi0tIAoyLjQ0LjEKCg==

--===============5149257098019744554==--

