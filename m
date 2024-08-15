Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CB2C54E91
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:05 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.131099.1723748334325233063
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ANZIUZGm;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=dWWx5vQb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019157683e17-993bc701-a54d-4fbe-8551-d4895d8eaa01-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BmcpxEImfjbPzV3cbFCRuMj94fcx53Nu6wtVL9vtgZQ=;
	b=ANZIUZGmE0xlXlhz5aHRSvS8z4s6nxige6iBtZvOMWRUHtycU6cXTlKMdCTTyoVH
	BEAWObxfPBEkXE4oCPoYGGGggUWucg3Doots526Nbht3uWPyG2to58jUWvaFUTxjZ9Z
	FLNT/PGeRsqTfxiX+6hOIm2yk8x3eoUU4iy9ZVkI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BmcpxEImfjbPzV3cbFCRuMj94fcx53Nu6wtVL9vtgZQ=;
	b=dWWx5vQbmQozkxshodwOjZjWHDc28kwwmRAp1HLk8uiZ1F4d/rxeFDWsx/S05b6j
	IYXDL1B1TGB4MlVVYVPZ4k1sLIV/OwRmfBbjWNAgKme9prLGQaadfkzp/IH6xKUHZXd
	tUQG4qfK/i0RxYZomhsfMLudvcI4I8KlYrDgcQpQ=
Content-Type: multipart/mixed; boundary="===============3610682024874003479=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xkeyboard-config: upgrading to 2.42 SUCCEEDED
Message-ID: <0101019157683e17-993bc701-a54d-4fbe-8551-d4895d8eaa01-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203428

--===============3610682024874003479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xkeyboard-config* to *2.42* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xkeyboard-config-upgrade-2.41-2.42.patch
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
From 2189c979421e3b255b7303622f539016bc9c26cb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 15:46:54 +0000
Subject: [PATCH] xkeyboard-config: upgrade 2.41 -> 2.42

---
 .../{xkeyboard-config_2.41.bb => xkeyboard-config_2.42.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.41.bb => xkeyboard-config_2.42.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb
index 79ce7dea35..cdc6422d46 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.42.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8fc8ae699974c360e2e2e883a63ce264"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f02cd6b957295e0d50236a3db15825256c92f67ef1f73bf1c77a4b179edf728f"
+SRC_URI[sha256sum] = "a6b06ebfc1f01fc505f2f05f265f95f67cc8873a54dd247e3c2d754b8f7e0807"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.44.0


--===============3610682024874003479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/xkeyboard-config (sysroot):
  /usr/share/X11/xkb/compat/grab was added
  /usr/share/X11/xkb/compat/grp_led was added
  /usr/share/X11/xkb/compat/mod_led was added
  /usr/share/X11/xkb/symbols/grab was added
  /usr/share/X11/xkb/symbols/scrolllock was added
  /usr/share/X11/xkb/symbols/srvrkeys was added
  /usr/share/X11/xkb/geometry/nokia was removed
  /usr/share/X11/xkb/symbols/nokia_vndr was removed
  /usr/share/X11/xkb/symbols/nokia_vndr/rx-44 was removed
  /usr/share/X11/xkb/symbols/nokia_vndr/rx-51 was removed
  /usr/share/X11/xkb/symbols/nokia_vndr/su-8w was removed
  /usr/share/X11/xkb/types/nokia was removed
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config: FILELIST: removed "/usr/share/X11/xkb/geometry/nokia /usr/share/X11/xkb/types/nokia /usr/share/X11/xkb/symbols/nokia_vndr/rx-44 /usr/share/X11/xkb/symbols/nokia_vndr/su-8w /usr/share/X11/xkb/symbols/nokia_vndr/rx-51", added "/usr/share/X11/xkb/symbols/srvrkeys /usr/share/X11/xkb/compat/grp_led /usr/share/X11/xkb/compat/mod_led /usr/share/X11/xkb/symbols/scrolllock /usr/share/X11/xkb/compat/grab /usr/share/X11/xkb/symbols/grab"

--===============3610682024874003479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xkeyboard-config: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config: SRC_URI changed from "https://www.x.org/releases//individual/data/xkeyboard-config/xkeyboard-config-2.41.tar.xz" to "https://www.x.org/releases//individual/data/xkeyboard-config/xkeyboard-config-2.42.tar.xz"
packages/core2-64-poky-linux/xkeyboard-config: PKGV changed from 2.41 [default] to 2.42 [default]
Changes to packages/core2-64-poky-linux/xkeyboard-config (sysroot):
  /usr/share/X11/xkb/compat/grab was added
  /usr/share/X11/xkb/compat/grp_led was added
  /usr/share/X11/xkb/compat/mod_led was added
  /usr/share/X11/xkb/symbols/grab was added
  /usr/share/X11/xkb/symbols/scrolllock was added
  /usr/share/X11/xkb/symbols/srvrkeys was added
  /usr/share/X11/xkb/geometry/nokia was removed
  /usr/share/X11/xkb/symbols/nokia_vndr was removed
  /usr/share/X11/xkb/symbols/nokia_vndr/rx-44 was removed
  /usr/share/X11/xkb/symbols/nokia_vndr/rx-51 was removed
  /usr/share/X11/xkb/symbols/nokia_vndr/su-8w was removed
  /usr/share/X11/xkb/types/nokia was removed
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-dbg: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-dbg: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-dev: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-dev: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-doc: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-doc: PKGSIZE changed from 40573 to 41308 (+2%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-doc: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-af: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-af: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ar: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ar: PKGSIZE changed from 105926 to 107294 (+1%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ar: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-az: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-az: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-bg: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-bg: PKGSIZE changed from 110228 to 111721 (+1%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-bg: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ca: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ca: PKGSIZE changed from 85937 to 87297 (+2%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ca: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-crh: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-crh: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-cs: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-cs: PKGSIZE changed from 90917 to 92198 (+1%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-cs: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-da: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-da: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-de: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-de: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-el: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-el: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-en-gb: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-en-gb: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-eo: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-eo: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-es: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-es: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-fi: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-fi: PKGSIZE changed from 91445 to 92716 (+1%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-fi: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-fr: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-fr: PKGSIZE changed from 87646 to 88745 (+1%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-fr: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-fur: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-fur: PKGSIZE changed from 87149 to 88100 (+1%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-fur: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-gl: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-gl: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-he: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-he: PKGSIZE changed from 97666 to 99154 (+2%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-he: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-hr: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-hr: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-hu: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-hu: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-id: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-id: PKGSIZE changed from 84939 to 86065 (+1%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-id: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-it: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-it: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ja: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ja: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ka: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ka: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ko: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ko: PKGSIZE changed from 92661 to 94059 (+2%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ko: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ky: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ky: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-lt: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-lt: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-nb: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-nb: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-nl: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-nl: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-pl: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-pl: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-pt-br: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-pt-br: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-pt: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-pt: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ro: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ro: PKGSIZE changed from 89263 to 90672 (+2%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ro: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ru: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-ru: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-rw: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-rw: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sk: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sk: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sl: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sl: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sq: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sq: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sr: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sr: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sv: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sv: PKGSIZE changed from 87466 to 88562 (+1%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-sv: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-tr: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-tr: PKGSIZE changed from 87216 to 88442 (+1%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-tr: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-uk: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-uk: PKGSIZE changed from 107500 to 108744 (+1%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-uk: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-vi: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-vi: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-cn: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-cn: PKGSIZE changed from 89035 to 90030 (+1%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-cn: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-tw: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-locale-zh-tw: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-src: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-src: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-staticdev: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config-staticdev: PKGV changed from 2.41 [default] to 2.42 [default]
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config: FILELIST: removed "/usr/share/X11/xkb/geometry/nokia /usr/share/X11/xkb/types/nokia /usr/share/X11/xkb/symbols/nokia_vndr/rx-44 /usr/share/X11/xkb/symbols/nokia_vndr/su-8w /usr/share/X11/xkb/symbols/nokia_vndr/rx-51", added "/usr/share/X11/xkb/symbols/srvrkeys /usr/share/X11/xkb/compat/grp_led /usr/share/X11/xkb/compat/mod_led /usr/share/X11/xkb/symbols/scrolllock /usr/share/X11/xkb/compat/grab /usr/share/X11/xkb/symbols/grab"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config: PV changed from "2.41" to "2.42"
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config: PKGSIZE changed from 3366124 to 3252196 (-3%)
packages/core2-64-poky-linux/xkeyboard-config/xkeyboard-config: PKGV changed from 2.41 [default] to 2.42 [default]

--===============3610682024874003479==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xkeyboard-config-upgrade-2.41-2.42.patch"

RnJvbSAyMTg5Yzk3OTQyMWUzYjI1NWI3MzAzNjIyZjUzOTAxNmJjOWMyNmNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTU6NDY6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
a2V5Ym9hcmQtY29uZmlnOiB1cGdyYWRlIDIuNDEgLT4gMi40MgoKLS0tCiAuLi4ve3hrZXlib2Fy
ZC1jb25maWdfMi40MS5iYiA9PiB4a2V5Ym9hcmQtY29uZmlnXzIuNDIuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIve3hrZXlib2FyZC1jb25maWdfMi40MS5iYiA9
PiB4a2V5Ym9hcmQtY29uZmlnXzIuNDIuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3hvcmctbGliL3hrZXlib2FyZC1jb25maWdfMi40MS5iYiBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWxpYi94a2V5Ym9hcmQtY29uZmlnXzIuNDIuYmIKc2ltaWxhcml0
eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3hr
ZXlib2FyZC1jb25maWdfMi40MS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hv
cmctbGliL3hrZXlib2FyZC1jb25maWdfMi40Mi5iYgppbmRleCA3OWNlN2RlYTM1Li5jZGM2NDIy
ZDQ2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIveGtleWJvYXJk
LWNvbmZpZ18yLjQxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi94a2V5
Ym9hcmQtY29uZmlnXzIuNDIuYmIKQEAgLTEzLDcgKzEzLDcgQEAgTElDRU5TRSA9ICJNSVQgJiBN
SVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT04ZmM4YWU2OTk5NzRj
MzYwZTJlMmU4ODNhNjNjZTI2NCIKIAogU1JDX1VSSSA9ICIke1hPUkdfTUlSUk9SfS9pbmRpdmlk
dWFsL2RhdGEveGtleWJvYXJkLWNvbmZpZy8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImYwMmNkNmI5NTcyOTVlMGQ1MDIzNmEzZGIxNTgyNTI1NmM5MmY2N2VmMWY3
M2JmMWM3N2E0YjE3OWVkZjcyOGYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTZiMDZlYmZjMWYw
MWZjNTA1ZjJmMDVmMjY1Zjk1ZjY3Y2M4ODczYTU0ZGQyNDdlM2MyZDc1NGI4ZjdlMDgwNyIKIAog
U0VDVElPTiA9ICJ4MTEvbGlicyIKIERFUEVORFMgPSAidXRpbC1tYWNyb3MgbGlieHNsdC1uYXRp
dmUiCi0tIAoyLjQ0LjAKCg==

--===============3610682024874003479==--

