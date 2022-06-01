Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0AECCA473
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:47 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.677.1654100325134452157
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OA/oLCDa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010181200fefbb-552e4231-f371-4d16-9650-a03c6bb169df-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100324;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=LmbXOV1jUWPIr+RB8DX9AU+B3JV1RCDoRxp6WqRZh7Y=;
	b=OA/oLCDarjLjLcyEAKfoFL/brUlE4wRQzwvXUO9+N9eB+11Nd//U/eUyF7WvwG7s
	E8C7WFDdpu21Ac9M94JAtZ5uFZoTQtbEdrDm67glpfhxgntiAwlEOylkwBVURJ9faNK
	Iz6bsdk7lE5do9k1Gow0LOELza12WKhYFWx15DeY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100324;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=LmbXOV1jUWPIr+RB8DX9AU+B3JV1RCDoRxp6WqRZh7Y=;
	b=jeitUNvPbz8NuZV3XZE3w2eQSdZnBvtztXAaIMkt7nX76aePY3iWFSXLuGlwtJ0d
	x01c5vJAifErPXgF2Er0XetUBtDJZtrp6nt0PRx6yru9W2PcKuQeFuWk+HF1tn7eaX7
	/uQsdF8BY/pLfY9t/Swqc21PF2JyxV+h6xbnnNFM=
Content-Type: multipart/mixed; boundary="===============8504139124181450589=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] gnutls: upgrading to 3.7.6 SUCCEEDED
Message-ID: 
 <01010181200fefbb-552e4231-f371-4d16-9650-a03c6bb169df-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:44 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166432

--===============8504139124181450589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnutls* to *3.7.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnutls-upgrade-3.7.5-3.7.6.patch
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
--===============8504139124181450589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gnutls/gnutls-bin: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-bin: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-dbg: PKGSIZE changed from 7541748 to 7541608 (-0%)
packages/core2-32-poky-linux/gnutls/gnutls-dbg: FILELIST: removed "/usr/lib/.debug/libgnutls.so.30.33.0", added "/usr/lib/.debug/libgnutls.so.30.33.1"
packages/core2-32-poky-linux/gnutls/gnutls-dbg: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-dbg: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-dev: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-dev: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-doc: PKGSIZE changed from 4381794 to 4410932 (+1%)
packages/core2-32-poky-linux/gnutls/gnutls-doc: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-doc: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-fips: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-fips: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-cs: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-locale-cs: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-de: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-locale-de: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-eo: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-locale-eo: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-es: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-locale-es: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-fi: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-locale-fi: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-fr: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-locale-fr: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-it: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-locale-it: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-ms: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-locale-ms: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-nl: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-locale-nl: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-pl: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-locale-pl: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-pt-br: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-locale-pt-br: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-sr: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-locale-sr: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-sv: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-locale-sv: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-uk: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-locale-uk: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-vi: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-locale-vi: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-locale-zh-cn: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-locale-zh-cn: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-openssl: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-openssl: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-src: PKGSIZE changed from 8412844 to 8412615 (-0%)
packages/core2-32-poky-linux/gnutls/gnutls-src: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-src: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-staticdev: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-staticdev: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls-xx: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls-xx: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls/gnutls: FILELIST: removed "/usr/lib/libgnutls.so.30.33.0", added "/usr/lib/libgnutls.so.30.33.1"
packages/core2-32-poky-linux/gnutls/gnutls: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls/gnutls: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
packages/core2-32-poky-linux/gnutls: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.5.tar.xz file://arm_eabi.patch file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch" to "https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.6.tar.xz file://arm_eabi.patch file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch"
packages/core2-32-poky-linux/gnutls: PV changed from "3.7.5" to "3.7.6"
packages/core2-32-poky-linux/gnutls: PKGV changed from 3.7.5 [default] to 3.7.6 [default]
Changes to packages/core2-32-poky-linux/gnutls (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.33.0 to libgnutls.so.30.33.1
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.33.0 to libgnutls.so.30.33.1
  /usr/lib/libgnutls.so.30.33.0 moved to /usr/lib/libgnutls.so.30.33.1
Changes to packages/x86_64-linux/gnutls-native (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.33.0 to libgnutls.so.30.33.1
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.33.0 to libgnutls.so.30.33.1
  /usr/lib/libgnutls.so.30.33.0 moved to /usr/lib/libgnutls.so.30.33.1

--===============8504139124181450589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gnutls/gnutls: FILELIST: removed "/usr/lib/libgnutls.so.30.33.0", added "/usr/lib/libgnutls.so.30.33.1"
Changes to packages/core2-32-poky-linux/gnutls (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.33.0 to libgnutls.so.30.33.1
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.33.0 to libgnutls.so.30.33.1
  /usr/lib/libgnutls.so.30.33.0 moved to /usr/lib/libgnutls.so.30.33.1
Changes to packages/x86_64-linux/gnutls-native (sysroot):
  /usr/lib/libgnutls.so.30 changed symlink target from libgnutls.so.30.33.0 to libgnutls.so.30.33.1
  /usr/lib/libgnutls.so changed symlink target from libgnutls.so.30.33.0 to libgnutls.so.30.33.1
  /usr/lib/libgnutls.so.30.33.0 moved to /usr/lib/libgnutls.so.30.33.1

--===============8504139124181450589==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gnutls-upgrade-3.7.5-3.7.6.patch"

From 925702645a0822c456b2fffe4c8c6cd5469546e9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jun 2022 16:18:40 +0000
Subject: [PATCH] gnutls: upgrade 3.7.5 -> 3.7.6

---
 .../recipes-support/gnutls/{gnutls_3.7.5.bb => gnutls_3.7.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.7.5.bb => gnutls_3.7.6.bb} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.5.bb b/meta/recipes-support/gnutls/gnutls_3.7.6.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.7.5.bb
rename to meta/recipes-support/gnutls/gnutls_3.7.6.bb
index 63157eac97..6a0eb974dd 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.5.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.6.bb
@@ -24,7 +24,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
            "
 
-SRC_URI[sha256sum] = "1f85028475b4f255cc5b480af0c37e61eab43024c1507c8b75d6be506c0553ad"
+SRC_URI[sha256sum] = "77065719a345bfb18faa250134be4c53bef70c1bd61f6c0c23ceb8b44f0262ff"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.31.1


--===============8504139124181450589==--

