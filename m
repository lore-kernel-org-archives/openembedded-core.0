Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87678C35276
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:55 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web08.10651.1647349734323153399
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=f6jsBcwG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 0101017f8db217d6-e17b4729-afc2-4758-9582-746258632538-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349733;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L2RH+JNwr0PeDxupE4cumjOst59uNFxM1KsdLgmO2hY=;
	b=f6jsBcwGLX9YceeM8LkLSQAaaMB3yXz+Zzn/SN9zVsULn5KCGTNK4/j5t2W+rn/C
	vrSblnzkpHOPogD+wGkPe+vwsCBLZ42lgKQU0gnjTUUExVFFmqQeZ0ec2G+CGh67gMv
	wbfVApkiY/tYNJoON588xWmZmWfCMXLZi0BZ5JU0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349733;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L2RH+JNwr0PeDxupE4cumjOst59uNFxM1KsdLgmO2hY=;
	b=TlhBdaOs3yNGqSNYZKVcRs+KiN873nsJubRh3Cf4Z1bJHdZprh5cNg+kHAOTlZme
	x/iSa+Wz09iE+f23aYlX1DLTZrxSkim+Ps8Dj+JQQmz9C6miJgkUZ9IeRDBJ5jlEGxI
	jzEs1P77f6A4idXmAtM0gyUg96epVw8+FAYddHVA=
Content-Type: multipart/mixed; boundary="===============2706685646773983936=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
 =?utf-8?b?QW7DrWJhbCBMaW3Ds24gPGxpbW9uLmFuaWJhbEBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] apt: upgrading to 2.4.1 SUCCEEDED
Message-ID: 
 <0101017f8db217d6-e17b4729-afc2-4758-9582-746258632538-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:53 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163244

--===============2706685646773983936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *apt* to *2.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-apt-upgrade-2.4.0-2.4.1.patch
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
--===============2706685646773983936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/apt/apt-bash-completion: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/apt/apt-bash-completion: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/apt/apt-dbg: PKGSIZE changed from 56136520 to 56134288 (-0%)
packages/core2-32-poky-linux/apt/apt-dbg: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/apt/apt-dbg: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/apt/apt-dev: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/apt/apt-dev: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/apt/apt-doc: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/apt/apt-doc: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/apt/apt-locale: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/apt/apt-locale: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/apt/apt-src: PKGSIZE changed from 2889247 to 2889446 (+0%)
packages/core2-32-poky-linux/apt/apt-src: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/apt/apt-src: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/apt/apt-staticdev: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/apt/apt-staticdev: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/apt/apt: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/apt/apt: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/apt: PKGV changed from 2.4.0 [default] to 2.4.1 [default]
packages/core2-32-poky-linux/apt: PV changed from "2.4.0" to "2.4.1"
packages/core2-32-poky-linux/apt: SRC_URI changed from "http://ftp.debian.org/debian/pool/main/a/apt/apt_2.4.0.tar.xz file://triehash file://0001-Disable-documentation-directory-altogether.patch file://0001-Fix-musl-build.patch file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch file://0001-cmake-Do-not-build-po-files.patch file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch file://0001-aptwebserver.cc-Include-array.patch" to "http://ftp.debian.org/debian/pool/main/a/apt/apt_2.4.1.tar.xz file://triehash file://0001-Disable-documentation-directory-altogether.patch file://0001-Fix-musl-build.patch file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch file://0001-cmake-Do-not-build-po-files.patch file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch file://0001-aptwebserver.cc-Include-array.patch"

--===============2706685646773983936==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-apt-upgrade-2.4.0-2.4.1.patch"

From 8c1fbc9262c59df3d6c1a928aa1106a627bbb691 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Mar 2022 06:38:33 +0000
Subject: [PATCH] apt: upgrade 2.4.0 -> 2.4.1

---
 .../apt/0001-Do-not-init-tables-from-dpkg-configuration.patch   | 2 +-
 ...1-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch | 2 +-
 meta/recipes-devtools/apt/{apt_2.4.0.bb => apt_2.4.1.bb}        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/apt/{apt_2.4.0.bb => apt_2.4.1.bb} (97%)

diff --git a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
index 59b9cd190f..49d4857b4c 100644
--- a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
@@ -1,4 +1,4 @@
-From 11ba49594ae9d11f0070198c146b5e437fa83022 Mon Sep 17 00:00:00 2001
+From 7b75b0b4b1339cb65f7a6164401dc7feb1792582 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 10 May 2019 16:47:38 +0200
 Subject: [PATCH] Do not init tables from dpkg configuration
diff --git a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
index 593ed7d096..42361c512b 100644
--- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
@@ -1,4 +1,4 @@
-From 47c2b42af60ceefd8ed52b32a3a365facf0e05b8 Mon Sep 17 00:00:00 2001
+From 0d9bcf6cd56cdafea5d7cf33d358ce07533f9963 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 21 May 2020 20:13:25 +0000
 Subject: [PATCH] Revert "always run 'dpkg --configure -a' at the end of our
diff --git a/meta/recipes-devtools/apt/apt_2.4.0.bb b/meta/recipes-devtools/apt/apt_2.4.1.bb
similarity index 97%
rename from meta/recipes-devtools/apt/apt_2.4.0.bb
rename to meta/recipes-devtools/apt/apt_2.4.1.bb
index c95e36e3d0..51426d0c52 100644
--- a/meta/recipes-devtools/apt/apt_2.4.0.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.1.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "728c69df369cbc4a55f91fc2817fe9832c1a2f39de4142e7ef222c5158f234af"
+SRC_URI[sha256sum] = "4a2bb326b6ab5ca35a7a6e7bee5fe3f41d32fe98e464b4ba32f93d3835aac7e7"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
-- 
2.27.0


--===============2706685646773983936==--

