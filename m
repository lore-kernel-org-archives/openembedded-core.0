Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F127AC4707A
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:21 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web08.18884.1652634913109378347
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SuRu5vP7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010180c8b7849b-21887f7f-1687-425b-af48-2a9849d0b750-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=05MjRSy6m4fi6vTrZx7FRixAz8sW6YSjxMsVO3UmNq8=;
	b=SuRu5vP7YI2U7TMxQtOqncbDsidRtK4kSJHkIUr4klb2ngI50HQVScFaNM6oXrJU
	ho2XsQLrD7ghJIBetJzdKd+rClvSAgDy4Qk+DYbGrwFtG3SxEadQqIXhCTzVuaZ70V5
	MGVgqvqC4BhzfOEbDq2jZ7AezEf8+NqZZJ/2fg2E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=05MjRSy6m4fi6vTrZx7FRixAz8sW6YSjxMsVO3UmNq8=;
	b=ZmJV4YKr7Lr/AZltoTIkZxciZ2PM4z3b6MIG2CQY4bXE6fTYQpp1ZWnUUtqIej/y
	9UmU43Uu96Ir7HS+8uFLfmASLKZIztK2nhjQ6Wz/0O7TX/VWmdcLaNdPuZRXnXRZCxu
	uf8UE/KpQ4hntpEBRL+9I12ECcIzelZDcu74e+cE=
Content-Type: multipart/mixed; boundary="===============8576639945401308670=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcgroup: upgrading to 2.0.2 SUCCEEDED
Message-ID: 
 <01010180c8b7849b-21887f7f-1687-425b-af48-2a9849d0b750-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:12 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165614

--===============8576639945401308670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libcgroup* to *2.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcgroup-upgrade-2.0.1-2.0.2.patch
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
--===============8576639945401308670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libcgroup/cgroups-pam-plugin: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/libcgroup/cgroups-pam-plugin: PV changed from "2.0.1" to "2.0.2"
packages/core2-32-poky-linux/libcgroup: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/libcgroup: PV changed from "2.0.1" to "2.0.2"
packages/core2-32-poky-linux/libcgroup: SRC_URI changed from "https://github.com/libcgroup/libcgroup/releases/download/v2.0.1/libcgroup-2.0.1.tar.gz" to "https://github.com/libcgroup/libcgroup/releases/download/v2.0.2/libcgroup-2.0.2.tar.gz"
packages/core2-32-poky-linux/libcgroup/libcgroup-dbg: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/libcgroup/libcgroup-dbg: PKGSIZE changed from 630356 to 631708 (+0%)
packages/core2-32-poky-linux/libcgroup/libcgroup-dbg: FILELIST: removed "/usr/lib/.debug/libcgroup.so.2.0.1", added "/usr/lib/.debug/libcgroup.so.2.0.2"
packages/core2-32-poky-linux/libcgroup/libcgroup-dbg: PV changed from "2.0.1" to "2.0.2"
packages/core2-32-poky-linux/libcgroup/libcgroup-dev: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/libcgroup/libcgroup-dev: PV changed from "2.0.1" to "2.0.2"
packages/core2-32-poky-linux/libcgroup/libcgroup-doc: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/libcgroup/libcgroup-doc: PV changed from "2.0.1" to "2.0.2"
packages/core2-32-poky-linux/libcgroup/libcgroup-locale: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/libcgroup/libcgroup-locale: PV changed from "2.0.1" to "2.0.2"
packages/core2-32-poky-linux/libcgroup/libcgroup-src: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/libcgroup/libcgroup-src: PKGSIZE changed from 403960 to 404350 (+0%)
packages/core2-32-poky-linux/libcgroup/libcgroup-src: PV changed from "2.0.1" to "2.0.2"
packages/core2-32-poky-linux/libcgroup/libcgroup-staticdev: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/libcgroup/libcgroup-staticdev: PV changed from "2.0.1" to "2.0.2"
packages/core2-32-poky-linux/libcgroup/libcgroup: PKGV changed from 2.0.1 [default] to 2.0.2 [default]
packages/core2-32-poky-linux/libcgroup/libcgroup: PKGSIZE changed from 335050 to 339146 (+1%)
packages/core2-32-poky-linux/libcgroup/libcgroup: FILELIST: removed "/usr/lib/libcgroup.so.2.0.1", added "/usr/lib/libcgroup.so.2.0.2"
packages/core2-32-poky-linux/libcgroup/libcgroup: PV changed from "2.0.1" to "2.0.2"
Changes to packages/core2-32-poky-linux/libcgroup (sysroot):
  /usr/lib/libcgroup.so.2 changed symlink target from libcgroup.so.2.0.1 to libcgroup.so.2.0.2
  /usr/lib/libcgroup.so changed symlink target from libcgroup.so.2.0.1 to libcgroup.so.2.0.2
  /usr/lib/libcgroup.so.2.0.1 moved to /usr/lib/libcgroup.so.2.0.2

--===============8576639945401308670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libcgroup/libcgroup: FILELIST: removed "/usr/lib/libcgroup.so.2.0.1", added "/usr/lib/libcgroup.so.2.0.2"
Changes to packages/core2-32-poky-linux/libcgroup (sysroot):
  /usr/lib/libcgroup.so.2 changed symlink target from libcgroup.so.2.0.1 to libcgroup.so.2.0.2
  /usr/lib/libcgroup.so changed symlink target from libcgroup.so.2.0.1 to libcgroup.so.2.0.2
  /usr/lib/libcgroup.so.2.0.1 moved to /usr/lib/libcgroup.so.2.0.2

--===============8576639945401308670==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libcgroup-upgrade-2.0.1-2.0.2.patch"

From 743e455da0b0028ced3f14cfae5fad209b1ba469 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 06:53:34 +0000
Subject: [PATCH] libcgroup: upgrade 2.0.1 -> 2.0.2

---
 .../libcgroup/{libcgroup_2.0.1.bb => libcgroup_2.0.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libcgroup/{libcgroup_2.0.1.bb => libcgroup_2.0.2.bb} (93%)

diff --git a/meta/recipes-core/libcgroup/libcgroup_2.0.1.bb b/meta/recipes-core/libcgroup/libcgroup_2.0.2.bb
similarity index 93%
rename from meta/recipes-core/libcgroup/libcgroup_2.0.1.bb
rename to meta/recipes-core/libcgroup/libcgroup_2.0.2.bb
index 857a4e86fd..7ade372cae 100644
--- a/meta/recipes-core/libcgroup/libcgroup_2.0.1.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_2.0.2.bb
@@ -13,7 +13,7 @@ DEPENDS = "bison-native flex-native"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "2dd9c566a90a053e7a5f47607e225648ba7aa9bb7763514dd4778e2ed530fe90"
+SRC_URI[sha256sum] = "8ef63b32e0aff619547dbb8a25e1f6bab152d7c4864795cf915571a5994d0cf8"
 UPSTREAM_CHECK_URI = "https://github.com/libcgroup/libcgroup/releases/"
 
 DEPENDS:append:libc-musl = " fts "
-- 
2.31.1


--===============8576639945401308670==--

