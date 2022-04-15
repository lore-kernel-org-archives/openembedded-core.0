Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F146C4707F
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.11651.1650052687066460387
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Yes0ITOH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 010101802ecde10a-d7ce1096-e849-47b4-b558-d34a8b1c31f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vifYYPxMyfs6MzpmP4JyuCh+g04U5kkXy3YEEdUpxnU=;
	b=Yes0ITOHZgaA+KWU8BK5oDzZ4+Iiz71Ve9ihcUNj9Dn3SacrigLeZ2T+UeGtAP2z
	W03wjgAQYjY7pAAE1FpbYQ7rTXy67BNBhWcvIM7Ji0PHQe6wVBL5y6m45Z8fB0Vej4h
	oSAuO51KeFfclsPZ+jTxpsIt2C5zcK3C27Wjqyxk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vifYYPxMyfs6MzpmP4JyuCh+g04U5kkXy3YEEdUpxnU=;
	b=X9k0RZrUmWN+OzjGpXYRByd24EyOctpILpakt93w3JHxpdFi5pdYqHpw+dLrjxW9
	VG1vna98Qp0IV70w/gyWnIQiharX9XgWEMLZXaHP5bj8eDQO0RWyGJ5ZFEhEbUcXsH7
	wu8aj3ZRosdGv8t+tZSgMrT6qjgeivpLZ1Dy9HI0=
Content-Type: multipart/mixed; boundary="===============6444344377083292604=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
 =?utf-8?b?QW7DrWJhbCBMaW3Ds24gPGxpbW9uLmFuaWJhbEBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] apt: upgrading to 2.4.5 SUCCEEDED
Message-ID: 
 <010101802ecde10a-d7ce1096-e849-47b4-b558-d34a8b1c31f5-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:06 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164443

--===============6444344377083292604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *apt* to *2.4.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-apt-upgrade-2.4.3-2.4.5.patch
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
--===============6444344377083292604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/apt/apt-bash-completion: PKGV changed from 2.4.3 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/apt/apt-bash-completion: PV changed from "2.4.3" to "2.4.5"
packages/core2-32-poky-linux/apt/apt-dbg: PKGV changed from 2.4.3 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/apt/apt-dbg: PKGSIZE changed from 56134152 to 56121760 (-0%)
packages/core2-32-poky-linux/apt/apt-dbg: PV changed from "2.4.3" to "2.4.5"
packages/core2-32-poky-linux/apt/apt-dev: PKGV changed from 2.4.3 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/apt/apt-dev: PV changed from "2.4.3" to "2.4.5"
packages/core2-32-poky-linux/apt/apt-doc: PKGV changed from 2.4.3 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/apt/apt-doc: PV changed from "2.4.3" to "2.4.5"
packages/core2-32-poky-linux/apt/apt-locale: PKGV changed from 2.4.3 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/apt/apt-locale: PV changed from "2.4.3" to "2.4.5"
packages/core2-32-poky-linux/apt/apt-src: PKGV changed from 2.4.3 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/apt/apt-src: PKGSIZE changed from 2889438 to 2893279 (+0%)
packages/core2-32-poky-linux/apt/apt-src: PV changed from "2.4.3" to "2.4.5"
packages/core2-32-poky-linux/apt/apt-staticdev: PKGV changed from 2.4.3 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/apt/apt-staticdev: PV changed from "2.4.3" to "2.4.5"
packages/core2-32-poky-linux/apt/apt: PKGV changed from 2.4.3 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/apt/apt: PKGSIZE changed from 4101425 to 4097333 (-0%)
packages/core2-32-poky-linux/apt/apt: PV changed from "2.4.3" to "2.4.5"
packages/core2-32-poky-linux/apt: PKGV changed from 2.4.3 [default] to 2.4.5 [default]
packages/core2-32-poky-linux/apt: SRC_URI changed from "http://ftp.debian.org/debian/pool/main/a/apt/apt_2.4.3.tar.xz file://triehash file://0001-Disable-documentation-directory-altogether.patch file://0001-Fix-musl-build.patch file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch file://0001-cmake-Do-not-build-po-files.patch file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch file://0001-aptwebserver.cc-Include-array.patch" to "http://ftp.debian.org/debian/pool/main/a/apt/apt_2.4.5.tar.xz file://triehash file://0001-Disable-documentation-directory-altogether.patch file://0001-Fix-musl-build.patch file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch file://0001-cmake-Do-not-build-po-files.patch file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch file://0001-aptwebserver.cc-Include-array.patch"
packages/core2-32-poky-linux/apt: PV changed from "2.4.3" to "2.4.5"

--===============6444344377083292604==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-apt-upgrade-2.4.3-2.4.5.patch"

From ff4aad16556880ac3b7a3886bdbec47fd2c318dc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 07:13:41 +0000
Subject: [PATCH] apt: upgrade 2.4.3 -> 2.4.5

---
 .../apt/0001-Do-not-init-tables-from-dpkg-configuration.patch   | 2 +-
 ...1-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch | 2 +-
 meta/recipes-devtools/apt/{apt_2.4.3.bb => apt_2.4.5.bb}        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/apt/{apt_2.4.3.bb => apt_2.4.5.bb} (97%)

diff --git a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
index 59b9cd190f..bdf6644f91 100644
--- a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
@@ -1,4 +1,4 @@
-From 11ba49594ae9d11f0070198c146b5e437fa83022 Mon Sep 17 00:00:00 2001
+From e898622e6b7124c19c13e8d40e3984a3bef35355 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 10 May 2019 16:47:38 +0200
 Subject: [PATCH] Do not init tables from dpkg configuration
diff --git a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
index 593ed7d096..675889a85b 100644
--- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
@@ -1,4 +1,4 @@
-From 47c2b42af60ceefd8ed52b32a3a365facf0e05b8 Mon Sep 17 00:00:00 2001
+From bbfb788722a829a5c7a66d846af4a2451c137932 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 21 May 2020 20:13:25 +0000
 Subject: [PATCH] Revert "always run 'dpkg --configure -a' at the end of our
diff --git a/meta/recipes-devtools/apt/apt_2.4.3.bb b/meta/recipes-devtools/apt/apt_2.4.5.bb
similarity index 97%
rename from meta/recipes-devtools/apt/apt_2.4.3.bb
rename to meta/recipes-devtools/apt/apt_2.4.5.bb
index 27e455747f..95c25e3036 100644
--- a/meta/recipes-devtools/apt/apt_2.4.3.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "5a7215ca924302da0b2205862cd2d651326eea222a589184ec6ce663885729f7"
+SRC_URI[sha256sum] = "5552f175c3a3924f5cda0c079b821b30f68a2521959f2c30ab164d2ec7993ecf"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
-- 
2.27.0


--===============6444344377083292604==--

