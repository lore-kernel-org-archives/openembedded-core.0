Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C325C05023
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:07 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.13584.1713248037835722367
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VVZsGugK;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=anvA8C4O;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018ee58a8214-56c8bdb3-d6cf-423b-8667-3c6ed631dd10-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=t9BotnyPPZgdnspO8/wKu+U03jelDbhrDREnJkSKJ3I=;
	b=VVZsGugKKDYNiU1lOGBNtfIYTW0K/cpr2uzjBQT6KHpySjFkckIWDfVrm0uHnUFt
	Kd/iNd+ohxQENaHGGsuTAuuFXrUjFq+0ksVtyo/+j+PfMOXzK1gQ7Vt78K/hMO35oh5
	1KkIzHlTtfpuiG0nPD7H0by/iqnqXREVq4o6sCFM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=t9BotnyPPZgdnspO8/wKu+U03jelDbhrDREnJkSKJ3I=;
	b=anvA8C4ONj9afAnEPBkOHwxjfXyXSNBO4Y7uIzS3jwhs9JKQdnolOQDmqE732VLm
	e/Tso3oULV1whhgMUmz+x44/3KTGxcPqsQXlFPVWyZuBMnyD4qo09AHZQeGzZeX/odP
	PLtS/7vsv6M0H2/AlC0n2nyMDsT5CBKI8OJz/mjg=
Content-Type: multipart/mixed; boundary="===============3436951238041503736=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.14.2 SUCCEEDED
Message-ID: <0101018ee58a8214-56c8bdb3-d6cf-423b-8667-3c6ed631dd10-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198345

--===============3436951238041503736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gtk4* to *4.14.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gtk4-upgrade-4.14.1-4.14.2.patch
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
From e9f9304025b74ff858704fad75a8e6f48c19f4c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 22:25:33 +0000
Subject: [PATCH] gtk4: upgrade 4.14.1 -> 4.14.2

---
 meta/recipes-gnome/gtk+/{gtk4_4.14.1.bb => gtk4_4.14.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.14.1.bb => gtk4_4.14.2.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb b/meta/recipes-gnome/gtk+/gtk4_4.14.2.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.14.1.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.14.2.bb
index ce733769a5..282e81f048 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.14.2.bb
@@ -37,7 +37,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "fcefb3f132f8cc4711a9efa5b353c9ae9bb5eeff0246fa74dbc2f2f839b9e308"
+SRC_URI[sha256sum] = "22604cef2898a79e5f2143bb7aee2b7d1fa2eb946989a9d1338ecf9c8ae0e072"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.42.0


--===============3436951238041503736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.1400.1", added "/usr/lib/libgtk-4.so.1.1400.2"
packages/core2-64-poky-linux/gtk4: PACKAGES: added "gtk4-locale-kab"
Changes to packages/core2-64-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.1400.1 to libgtk-4.so.1.1400.2
  /usr/lib/libgtk-4.so.1.1400.1 moved to /usr/lib/libgtk-4.so.1.1400.2

--===============3436951238041503736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gtk4/gtk4-dbg: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-dbg: FILELIST: removed "/usr/lib/.debug/libgtk-4.so.1.1400.1", added "/usr/lib/.debug/libgtk-4.so.1.1400.2"
packages/core2-64-poky-linux/gtk4/gtk4-dbg: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-dbg: PKGSIZE changed from 63908152 to 63977752 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-dev: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-dev: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-dev: PKGSIZE changed from 24320394 to 24332839 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-doc: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-doc: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ab: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ab: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-af: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-af: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-am: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-am: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-an: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-an: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ang: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ang: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ar: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ar: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-as: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-as: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ast: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ast: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-az-ir: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-az-ir: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-az: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-az: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-be+latin: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-be+latin: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-be: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-be: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-bg: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-bg: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-bn-in: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-bn-in: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-bn: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-bn: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-br: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-br: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-bs: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-bs: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca+valencia: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca+valencia: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca: PKGSIZE changed from 112638 to 113764 (+1%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-crh: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-crh: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-cs: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-cs: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-cs: PKGSIZE changed from 110721 to 112472 (+2%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-cy: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-cy: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-da: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-da: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-de: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-de: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-dz: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-dz: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-el: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-el: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-en+shaw: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-en+shaw: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-en-ca: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-en-ca: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-en-gb: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-en-gb: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-en: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-en: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-eo: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-eo: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-es: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-es: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-et: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-et: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-eu: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-eu: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-fa: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-fa: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-fa: PKGSIZE changed from 130078 to 130184 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-fi: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-fi: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-fr: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-fr: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-fr: PKGSIZE changed from 116141 to 115956 (-0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-fur: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-fur: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ga: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ga: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-gd: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-gd: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-gl: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-gl: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-gu: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-gu: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-he: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-he: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-he: PKGSIZE changed from 120299 to 120359 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-hi: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-hi: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-hr: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-hr: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-hu: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-hu: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-hy: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-hy: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ia: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ia: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-id: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-id: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ie: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ie: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-io: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-io: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-is: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-is: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-it: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-it: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ja: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ja: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ka: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ka: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ka: PKGSIZE changed from 163466 to 163535 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-kg: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-kg: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-kk: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-kk: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-km: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-km: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-kn: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-kn: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ko: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ko: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ku: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ku: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ky: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ky: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-lg: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-lg: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-li: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-li: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-lt: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-lt: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-lv: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-lv: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mai: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mai: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mi: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mi: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mjw: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mjw: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mk: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mk: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ml: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ml: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mn: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mn: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mr: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mr: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ms: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ms: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-my: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-my: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nb: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nb: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nds: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nds: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ne: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ne: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nl: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nl: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nn: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nn: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nso: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nso: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-oc: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-oc: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-or: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-or: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-pa: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-pa: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-pl: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-pl: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ps: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ps: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt-br: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt-br: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ro: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ro: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ru: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ru: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-rw: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-rw: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-si: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-si: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sk: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sk: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sl: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sl: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sl: PKGSIZE changed from 107275 to 111389 (+4%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-sq: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sq: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr+ije: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr+ije: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr+latin: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr+latin: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sv: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sv: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ta: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ta: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-te: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-te: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-tg: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-tg: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-th: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-th: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-tk: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-tk: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-tr: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-tr: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-tr: PKGSIZE changed from 110478 to 110310 (-0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-tt: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-tt: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ug: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ug: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-uk: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-uk: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-uk: PKGSIZE changed from 136543 to 136608 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-ur: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ur: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-uz: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-uz: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-vi: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-vi: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-wa: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-wa: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-xh: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-xh: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-yi: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-yi: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-cn: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-cn: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-hk: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-hk: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-tw: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-tw: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-printbackend-file: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-printbackend-file: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-src: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-src: FILELIST: directory renamed /usr/src/debug/gtk4/4.14.1/tools -> /usr/src/debug/gtk4/4.14.2/tools, directory renamed /usr/src/debug/gtk4/4.14.1/gsk/gpu/shaders -> /usr/src/debug/gtk4/4.14.2/gsk/gpu/shaders, directory renamed /usr/src/debug/gtk4/4.14.1/gdk/wayland/cursor -> /usr/src/debug/gtk4/4.14.2/gdk/wayland/cursor, directory renamed /usr/src/debug/gtk4/4.14.1/gtk -> /usr/src/debug/gtk4/4.14.2/gtk, directory renamed /usr/src/debug/gtk4/4.14.1/gtk/timsort -> /usr/src/debug/gtk4/4.14.2/gtk/timsort, directory renamed /usr/src/debug/gtk4/4.14.1/gtk/a11y/atspi -> /usr/src/debug/gtk4/4.14.2/gtk/a11y/atspi, directory renamed /usr/src/debug/gtk4/4.14.1/gdk -> /usr/src/debug/gtk4/4.14.2/gdk, directory renamed /usr/src/debug/gtk4/4.14.1/gsk/gpu -> /usr/src/debug/gtk4/4.14.2/gsk/gpu, directory renamed /usr/src/debug/gtk4/4.14.1/gsk/gl -> /usr/src/debug/gtk4/4.14.2/gsk/gl, directory renamed /usr/src/debug/gtk4/4.14.1/gtk/roaring -> /usr/src/debug/gtk
 4/4.14.2/gtk/roaring, directory renamed /usr/src/debug/gtk4/4.14.1/gtk/a11y -> /usr/src/debug/gtk4/4.14.2/gtk/a11y, directory renamed /usr/src/debug/gtk4/4.14.1/gdk/deprecated -> /usr/src/debug/gtk4/4.14.2/gdk/deprecated, directory renamed /usr/src/debug/gtk4/4.14.1/gtk/deprecated -> /usr/src/debug/gtk4/4.14.2/gtk/deprecated, directory renamed /usr/src/debug/gtk4/4.14.1/gtk/print -> /usr/src/debug/gtk4/4.14.2/gtk/print, directory renamed /usr/src/debug/gtk4/4.14.1/modules/media -> /usr/src/debug/gtk4/4.14.2/modules/media, directory renamed /usr/src/debug/gtk4/4.14.1/modules/printbackends -> /usr/src/debug/gtk4/4.14.2/modules/printbackends, directory renamed /usr/src/debug/gtk4/4.14.1/gtk/inspector -> /usr/src/debug/gtk4/4.14.2/gtk/inspector, directory renamed /usr/src/debug/gtk4/4.14.1/gsk -> /usr/src/debug/gtk4/4.14.2/gsk, directory renamed /usr/src/debug/gtk4/4.14.1/testsuite/reftests -> /usr/src/debug/gtk4/4.14.2/testsuite/reftests, directory renamed /usr/src/debug/gtk4/4.14.1/gd
 k/loaders -> /usr/src/debug/gtk4/4.14.2/gdk/loaders, directory renamed /usr/src/debug/gtk4/4.14.1/gdk/x11 -> /usr/src/debug/gtk4/4.14.2/gdk/x11, directory renamed /usr/src/debug/gtk4/4.14.1/gtk/css -> /usr/src/debug/gtk4/4.14.2/gtk/css, removed "/usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkwaylanddevice.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkwaylandmonitor.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkwaylandsurface.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/tablet-unstable-v2-client-protocol.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/linux-dmabuf-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkseat-wayland.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkprivate-wayland.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdksurface-wayland.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/xdg-activation-v1-protocol.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkseat-wayland.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkdrag-wayland.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkdrop-wayland.c /
 usr/src/debug/gtk4/4.14.1/gdk/wayland/gdksurface-wayland.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/xdg-shell-unstable-v6-protocol.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/fractional-scale-v1-protocol.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/xdg-output-unstable-v1-protocol.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/xdg-shell-client-protocol.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdktoplevel-wayland-private.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkeventsource.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdksubsurface-wayland-private.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkdevice-wayland-private.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkdisplay-wayland.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkglcontext-wayland.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkprimary-wayland.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkdisplay-wayland.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkprimary-wayland.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdksurface-wayland-private.h /usr/src/debug/gtk4/4.1
 4.1/gdk/wayland/gdkglcontext-wayland.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/primary-selection-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/idle-inhibit-unstable-v1-protocol.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkvulkancontext-wayland.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkvulkancontext-wayland.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/xdg-foreign-unstable-v1-protocol.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/xdg-foreign-unstable-v2-protocol.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkwaylandseat.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/fractional-scale-v1-client-protocol.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/tablet-unstable-v2-protocol.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkclipboard-wayland.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkclipboard-wayland.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/xdg-activation-v1-client-protocol.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkcursor-wayland.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkdevice-wayland
 .c /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkkeymap-wayland.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkdragsurface-wayland.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/xdg-shell-unstable-v6-client-protocol.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkpopup-wayland.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/pointer-gestures-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gtk-shell-client-protocol.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkwaylanddisplay.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/idle-inhibit-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/linux-dmabuf-unstable-v1-protocol.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/server-decoration-protocol.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkwaylandpopup.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkwaylandtoplevel.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gtk-shell-protocol.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/viewporter-protocol.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/viewporter-client-pr
 otocol.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/wm-button-layout-translation.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/wm-button-layout-translation.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/xdg-output-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkapplaunchcontext-wayland.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/pointer-gestures-unstable-v1-protocol.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkwaylandglcontext.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/keyboard-shortcuts-inhibit-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkdevicepad-wayland.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkcairocontext-wayland.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdksubsurface-wayland.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkcairocontext-wayland.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/primary-selection-unstable-v1-protocol.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkmonitor-wayland.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/server-decoration-client-prot
 ocol.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdkmonitor-wayland.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/gdktoplevel-wayland.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/keyboard-shortcuts-inhibit-unstable-v1-protocol.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/xdg-shell-protocol.c /usr/src/debug/gtk4/4.14.1/gdk/wayland/xdg-foreign-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.14.1/gdk/wayland/xdg-foreign-unstable-v2-client-protocol.h", added "/usr/src/debug/gtk4/4.14.2/gdk/wayland/pointer-gestures-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gtk-shell-client-protocol.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkwaylanddisplay.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/presentation-time-client-protocol.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/idle-inhibit-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/linux-dmabuf-unstable-v1-protocol.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/server-decoration-protocol.c /usr/src/debug/gtk4/4.14.2/gdk/waylan
 d/gdkwaylandpopup.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gtk-shell-protocol.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkwaylandtoplevel.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/viewporter-protocol.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/presentation-time-protocol.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkwaylandpresentationtime.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/viewporter-client-protocol.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/wm-button-layout-translation.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/wm-button-layout-translation.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/xdg-output-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkapplaunchcontext-wayland.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkwaylandglcontext.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/pointer-gestures-unstable-v1-protocol.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/keyboard-shortcuts-inhibit-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkdevicepad-wayland.c /usr/
 src/debug/gtk4/4.14.2/gdk/wayland/gdkcairocontext-wayland.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdksubsurface-wayland.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkcairocontext-wayland.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/primary-selection-unstable-v1-protocol.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkmonitor-wayland.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/server-decoration-client-protocol.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkmonitor-wayland.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdktoplevel-wayland.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/keyboard-shortcuts-inhibit-unstable-v1-protocol.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/xdg-shell-protocol.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/xdg-foreign-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/xdg-foreign-unstable-v2-client-protocol.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkwaylanddevice.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkwaylandmonitor.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkway
 landsurface.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/tablet-unstable-v2-client-protocol.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/linux-dmabuf-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkseat-wayland.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkprivate-wayland.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdksurface-wayland.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkdrop-wayland.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkdrag-wayland.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkseat-wayland.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/xdg-activation-v1-protocol.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdksurface-wayland.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/xdg-shell-unstable-v6-protocol.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/fractional-scale-v1-protocol.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/xdg-output-unstable-v1-protocol.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/xdg-shell-client-protocol.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdktoplevel-wayland-private.
 h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkeventsource.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdksubsurface-wayland-private.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkdevice-wayland-private.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkdisplay-wayland.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkglcontext-wayland.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkprimary-wayland.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkdisplay-wayland.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkprimary-wayland.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdksurface-wayland-private.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkglcontext-wayland.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkwaylandpresentationtime-private.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/primary-selection-unstable-v1-client-protocol.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/idle-inhibit-unstable-v1-protocol.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkvulkancontext-wayland.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkvulkancontext-wayland.c
  /usr/src/debug/gtk4/4.14.2/gdk/wayland/xdg-foreign-unstable-v1-protocol.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/xdg-foreign-unstable-v2-protocol.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkwaylandseat.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/fractional-scale-v1-client-protocol.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/tablet-unstable-v2-protocol.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkclipboard-wayland.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkclipboard-wayland.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/xdg-activation-v1-client-protocol.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkcursor-wayland.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkdevice-wayland.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkkeymap-wayland.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkdragsurface-wayland.c /usr/src/debug/gtk4/4.14.2/gdk/wayland/xdg-shell-unstable-v6-client-protocol.h /usr/src/debug/gtk4/4.14.2/gdk/wayland/gdkpopup-wayland.c"
packages/core2-64-poky-linux/gtk4/gtk4-src: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4-src: PKGSIZE changed from 54632315 to 54691089 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-staticdev: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4-staticdev: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.1400.1", added "/usr/lib/libgtk-4.so.1.1400.2"
packages/core2-64-poky-linux/gtk4/gtk4: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4/gtk4: PKGSIZE changed from 18250543 to 18258831 (+0%)
packages/core2-64-poky-linux/gtk4: PACKAGES: added "gtk4-locale-kab"
packages/core2-64-poky-linux/gtk4: PKGV changed from 4.14.1 [default] to 4.14.2 [default]
packages/core2-64-poky-linux/gtk4: PV changed from "4.14.1" to "4.14.2"
packages/core2-64-poky-linux/gtk4: SRC_URI changed from "http://ftp.gnome.org/pub/gnome/sources/gtk/4.14/gtk-4.14.1.tar.xz" to "http://ftp.gnome.org/pub/gnome/sources/gtk/4.14/gtk-4.14.2.tar.xz"
Changes to packages/core2-64-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.1400.1 to libgtk-4.so.1.1400.2
  /usr/lib/libgtk-4.so.1.1400.1 moved to /usr/lib/libgtk-4.so.1.1400.2

--===============3436951238041503736==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.14.1-4.14.2.patch"

RnJvbSBlOWY5MzA0MDI1Yjc0ZmY4NTg3MDRmYWQ3NWE4ZTZmNDhjMTlmNGMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMjI6MjU6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
dGs0OiB1cGdyYWRlIDQuMTQuMSAtPiA0LjE0LjIKCi0tLQogbWV0YS9yZWNpcGVzLWdub21lL2d0
aysve2d0azRfNC4xNC4xLmJiID0+IGd0azRfNC4xNC4yLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1n
bm9tZS9ndGsrL3tndGs0XzQuMTQuMS5iYiA9PiBndGs0XzQuMTQuMi5iYn0gKDk4JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTQuMS5iYiBiL21ldGEvcmVj
aXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xNC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xNC4xLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTQuMi5iYgppbmRleCBjZTczMzc2OWE1Li4y
ODJlODFmMDQ4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTQu
MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTQuMi5iYgpAQCAtMzcs
NyArMzcsNyBAQCBNQUpfVkVSID0gIiR7QG9lLnV0aWxzLnRyaW1fdmVyc2lvbigiJHtQVn0iLCAy
KX0iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJndGstKD9QPHB2ZXI+XGQrXC4oXGQqWzAyNDY4
XSkrKFwuXGQrKSspXC50YXIueHoiCiAKIFNSQ19VUkkgPSAiaHR0cDovL2Z0cC5nbm9tZS5vcmcv
cHViL2dub21lL3NvdXJjZXMvZ3RrLyR7TUFKX1ZFUn0vZ3RrLSR7UFZ9LnRhci54eiIKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJmY2VmYjNmMTMyZjhjYzQ3MTFhOWVmYTViMzUzYzlhZTliYjVlZWZm
MDI0NmZhNzRkYmMyZjJmODM5YjllMzA4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjIyNjA0Y2Vm
Mjg5OGE3OWU1ZjIxNDNiYjdhZWUyYjdkMWZhMmViOTQ2OTg5YTlkMTMzOGVjZjljOGFlMGUwNzIi
CiAKIFMgPSAiJHtXT1JLRElSfS9ndGstJHtQVn0iCiAKLS0gCjIuNDIuMAoK

--===============3436951238041503736==--

