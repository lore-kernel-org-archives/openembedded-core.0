Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760FEC3DA51
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:57:59 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.2181.1719853076346746181
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=B2+ataM3;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=H6OJR8dN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101906f3b4f18-08360799-a7e3-4621-9626-cf7955cf89b0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853076;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0gunAPjlH3OuiTd5qud//lPQYDQIw5z+YW6TCiZ5YZk=;
	b=B2+ataM3q8bjYflbAzMtfcEVNIDcjmxKKzHW2ZOP2XaG/pwhZsmIfSjcBtcxKKcQ
	3qfa/HoKT6SRZD7ZfO78tPKNV3yQhEgfYmDG4UgLJbynsHRXHUHUd5DMGVdYadE8fyf
	RfETc9X10Zsg42nfdzT+7Qv99e/JdpOEsawWBd80=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853076;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0gunAPjlH3OuiTd5qud//lPQYDQIw5z+YW6TCiZ5YZk=;
	b=H6OJR8dN5kA8xxuv/8G8Z8IvRTtSe992ww0Aw7NiZ4jbkSt+H3tm3TSPc3sdPVUz
	YwOsCPrJuywOXMoQZeE81H9nXwXp3AR/G0dNc3bvcPhxuwUqGt79sLyfaXfMFSlvyRK
	nfkC6ie8ofzAUwNwoQ/OIt2DybhcnHAcPr3uHhos=
Content-Type: multipart/mixed; boundary="===============1079626349227516213=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 46.2 SUCCEEDED
Message-ID: <010101906f3b4f18-08360799-a7e3-4621-9626-cf7955cf89b0-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201361

--===============1079626349227516213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *epiphany* to *46.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-46.0-46.2.patch
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
From 7f4c0c99a4b6605929f9015e37545fec9c8dc5cc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 12:50:43 +0000
Subject: [PATCH] epiphany: upgrade 46.0 -> 46.2

---
 .../epiphany/{epiphany_46.0.bb => epiphany_46.2.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_46.0.bb => epiphany_46.2.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_46.0.bb b/meta/recipes-gnome/epiphany/epiphany_46.2.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_46.0.bb
rename to meta/recipes-gnome/epiphany/epiphany_46.2.bb
index 9052fe170b..01382d0e2e 100644
--- a/meta/recipes-gnome/epiphany/epiphany_46.0.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_46.2.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "f4348f2cf51c07c0c106d130172d4d23f2cd4068771e1de007b758ca2ade5660"
+SRC_URI[archive.sha256sum] = "fb932da7a24e87f1edb900b5b94251b42b37080753864651c059dc6c93cb5049"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index e505466764..4be60ba056 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From bd45c75fe691e275d7a7d7e641ac66b153369a1c Mon Sep 17 00:00:00 2001
+From 077c7935e01b98ea8f03f200155e3c3e8adbfe2d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index a2800eb62d..87bc953124 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From c297f5b89d7c8e98ac98e1d9a7506df6db6fc025 Mon Sep 17 00:00:00 2001
+From 087a6d03d81a0c94a26778b3eaf89d18595a9b93 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index e416cc7..ee5f7b1 100644
+index ec658e0..d54ae3a 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index 1b4404c8ca..643a550ce8 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From b38a4ceaeec05efb1b822d52c43590e7fd518113 Mon Sep 17 00:00:00 2001
+From c8beb8f970257dd5b8ffba503e5c4f6738b7889a Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
-- 
2.44.0


--===============1079626349227516213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 5547424 to 5560000 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-dbg: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-dbg: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-dev: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-dev: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-doc: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-doc: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ab: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ab: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-af: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-af: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-am: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-am: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-an: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-an: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ar: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ar: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-as: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-as: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ast: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ast: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-az: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-az: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-be+latin: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-be+latin: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bg: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bg: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn-in: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn-in: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-br: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-br: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bs: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bs: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca+valencia: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca+valencia: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PKGSIZE changed from 88440 to 88598 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ckb: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ckb: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PKGSIZE changed from 88111 to 88263 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-cy: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-cy: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-da: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-da: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PKGSIZE changed from 88383 to 89102 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-dz: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-dz: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PKGSIZE changed from 122124 to 120333 (-1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en+shaw: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en+shaw: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-ca: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-ca: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PKGSIZE changed from 81039 to 81183 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-eo: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-eo: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-et: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-et: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-eu: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-eu: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PKGSIZE changed from 104308 to 104481 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fi: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fi: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fr: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fr: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PKGSIZE changed from 88128 to 87060 (-1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fy: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fy: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ga: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ga: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PKGSIZE changed from 86566 to 86717 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gu: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gu: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gv: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gv: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PKGSIZE changed from 90634 to 90795 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PKGSIZE changed from 68478 to 129737 (+89%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hr: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hr: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PKGSIZE changed from 89181 to 89343 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hy: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hy: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-id: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-id: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ie: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ie: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ig: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ig: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-is: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-is: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-it: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-it: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ja: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ja: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PKGSIZE changed from 135909 to 136127 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-kk: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kk: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-km: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-km: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-kn: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kn: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ko: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ko: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ku: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ku: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-li: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-li: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PKGSIZE changed from 85911 to 86066 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-lv: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-lv: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mai: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mai: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mg: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mg: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mi: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mi: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mk: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mk: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ml: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ml: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mn: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mn: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mr: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mr: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ms: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ms: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nb: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nb: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nds: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nds: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PKGSIZE changed from 70801 to 76497 (+8%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nl: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nl: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nn: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nn: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-oc: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-oc: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-or: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-or: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PKGSIZE changed from 79725 to 98935 (+24%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PKGSIZE changed from 87371 to 87539 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ps: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ps: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PKGSIZE changed from 88540 to 87740 (-1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PKGSIZE changed from 87939 to 87219 (-1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ro: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ro: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PKGSIZE changed from 112297 to 112434 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-rw: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-rw: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-si: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-si: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PKGSIZE changed from 85030 to 85168 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sq: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sq: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PKGSIZE changed from 76679 to 86421 (+13%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PKGSIZE changed from 112171 to 111273 (-1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PKGSIZE changed from 84664 to 84805 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ta: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ta: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-te: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-te: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tg: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tg: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-th: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-th: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tk: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tk: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PKGSIZE changed from 85733 to 85729 (-0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ug: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ug: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PKGSIZE changed from 109665 to 109813 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-vi: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-vi: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-wa: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-wa: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-yo: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-yo: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PKGSIZE changed from 79434 to 79576 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-hk: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-hk: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 4443502 to 4449019 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-src: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-src: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany-staticdev: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany-staticdev: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany/epiphany: PKGSIZE changed from 2053420 to 2056052 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany/epiphany: PKGV changed from 46.0 [default] to 46.2 [default]
packages/core2-64-poky-linux/epiphany: PV changed from "46.0" to "46.2"
packages/core2-64-poky-linux/epiphany: PACKAGES: added "epiphany-locale-kab"
packages/core2-64-poky-linux/epiphany: SRC_URI changed from "https://download.gnome.org/sources//epiphany/46/epiphany-46.0.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch" to "https://download.gnome.org/sources//epiphany/46/epiphany-46.2.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch"
packages/core2-64-poky-linux/epiphany: PKGV changed from 46.0 [default] to 46.2 [default]

--===============1079626349227516213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PKGSIZE changed from 68478 to 129737 (+89%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PKGSIZE changed from 79725 to 98935 (+24%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PKGSIZE changed from 76679 to 86421 (+13%)
packages/core2-64-poky-linux/epiphany: PACKAGES: added "epiphany-locale-kab"

--===============1079626349227516213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1879 targets, 46 skipped, 0 masked, 0 errors.
Removing 150 recipes from the core2-64 sysroot...done.
Removing 156 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-01d257e72222e54a68cac8939be6d98dd44a2dd2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:01d257e72222e54a68cac8939be6d98dd44a2dd2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1223 Local 1049 Mirrors 0 Missed 174 Current 481 (85% match, 89% complete)
Removing 4 stale sstate objects for arch allarch...done.
Removing 6 stale sstate objects for arch qemux86_64...done.
Removing 7 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 486 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 507 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 518 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 519 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 520 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_46.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 528 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 533 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 538 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 543 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 548 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 553 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-24.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe adwaita-icon-theme-46.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcr-4.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libhandy-1.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libportal-0.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-glib-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 554 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-packaging-24.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_recipe_qa_setscene)
NOTE: recipe adwaita-icon-theme-46.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libadwaita-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 560 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_46.0.bb:do_packagedata_setscene)
NOTE: recipe gcr-4.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 563 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 570 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 571 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 572 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 574 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_recipe_qa_setscene)
NOTE: recipe json-glib-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 579 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 580 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 581 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 584 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 585 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe adwaita-icon-theme-46.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libportal-0.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcr-4.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libhandy-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 589 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe json-glib-1.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 593 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: recipe libportal-0.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 596 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 599 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_create_spdx_setscene)
NOTE: recipe libadwaita-1.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gi-docgen-2023.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 603 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 605 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 607 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 608 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 609 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: recipe adwaita-icon-theme-46.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 619 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 620 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 624 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 629 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 637 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 638 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 645 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 654 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 665 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 666 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 667 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 668 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 669 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 674 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 676 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.42-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 677 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_recipe_qa_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe orc-0.4.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 686 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.14.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 688 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 694 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 697 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 700 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 708 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 710 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnotify-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk4-4.14.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 714 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsecret-0.21.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 716 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.72-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk4-4.14.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 719 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 721 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe libsecret-0.21.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 722 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 723 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.72-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 724 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 725 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe gtk4-4.14.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 728 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 729 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 733 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 736 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 737 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnotify-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 739 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_populate_sysroot_setscene)
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.72-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.57.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 741 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 744 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsecret-0.21.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 745 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 746 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 748 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe orc-0.4.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 750 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 751 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 752 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 754 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe librsvg-2.57.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 755 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 756 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_create_spdx_setscene)
NOTE: Running setscene task 759 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 761 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pango-1.52.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 762 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 763 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 764 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.52.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 765 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 766 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.57.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 769 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 770 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 772 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 773 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 777 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.52.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 778 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 780 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.57.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 781 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.38-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 783 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 785 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 786 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.52.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 788 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 789 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 794 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 795 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 796 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 799 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 800 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 801 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 802 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 803 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 809 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 811 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 812 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 814 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 816 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 818 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 821 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 822 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 824 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 825 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_create_spdx_setscene)
NOTE: Running setscene task 827 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 837 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 839 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 840 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 841 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 842 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 843 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 844 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 845 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 848 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 850 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 851 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 853 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_packagedata_setscene: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 856 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 859 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 860 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 861 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 862 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 864 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 866 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 868 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 869 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 871 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 872 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 874 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 876 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 878 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.36.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 879 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 880 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 881 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 882 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 884 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 886 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 887 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 890 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.283.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 892 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 894 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 896 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 898 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 899 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 901 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 905 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 907 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 909 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 911 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 914 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 915 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.283.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 916 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 917 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 919 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 922 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx_setscene)
NOTE: recipe libpng-1.6.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 930 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 931 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 932 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 934 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: recipe libwpe-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 936 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.283.0.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 937 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 939 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 940 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 942 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 944 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwpe-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 945 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe appstream-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 947 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 948 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 949 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 951 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 953 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libwpe-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.283.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 954 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxmlb-0.3.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 955 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 959 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 960 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 962 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 966 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 967 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 968 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libwpe-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 969 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 971 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 972 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe appstream-1.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 973 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 975 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 976 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe appstream-1.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 978 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 979 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 982 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 984 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 986 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 987 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxmlb-0.3.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 989 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 994 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 995 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 996 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 998 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe curl-8.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 999 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1001 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1002 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1003 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe enchant2-2.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1005 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1006 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1008 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1009 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1011 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe enchant2-2.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1012 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1013 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1014 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1016 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1017 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_create_spdx_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1019 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1020 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1021 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe enchant2-2.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1024 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1025 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1027 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1028 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1029 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe enchant2-2.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1030 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1032 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1033 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1034 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1042 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1046 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1048 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iso-codes-4.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1056 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1058 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1059 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1062 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1063 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1065 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1068 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1070 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 1071 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1073 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1074 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1076 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1079 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1083 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_recipe_qa_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1084 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1085 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1086 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1088 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1089 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1091 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1092 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1094 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1095 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1097 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1098 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1101 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1102 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1104 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1105 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1106 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1107 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe icu-75-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1108 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1110 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1111 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1113 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1115 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1116 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1121 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1122 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1123 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1126 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1128 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1129 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1130 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_create_spdx_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1132 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1133 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1134 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1136 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1137 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1138 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1139 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1140 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1142 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.49-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1143 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1144 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1145 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1146 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1147 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1151 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_recipe_qa_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1152 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1156 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1158 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1159 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1162 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1164 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1165 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1167 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1169 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1170 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1171 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1173 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1175 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1177 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1178 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1179 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1181 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1183 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1185 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1186 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1187 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1189 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1191 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1192 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1194 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1195 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1196 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1198 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_create_spdx_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1199 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1201 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_packagedata_setscene)
NOTE: recipe icu-75-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1203 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_75-1.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1205 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.1.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nghttp2-1.62.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1207 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1209 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_create_spdx_setscene)
NOTE: recipe nghttp2-1.62.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe p11-kit-0.25.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1210 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_create_spdx_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxslt-1.1.39-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1212 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe p11-kit-0.25.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1213 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1216 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_recipe_qa_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1219 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_recipe_qa_setscene)
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1222 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe nghttp2-1.62.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1223 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1224 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_packagedata_setscene)
NOTE: recipe p11-kit-0.25.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-75-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1225 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1226 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1230 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1231 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nghttp2-1.62.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1236 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1237 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1238 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.62.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxslt-1.1.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe p11-kit-0.25.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1239 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_packagedata_setscene)
NOTE: recipe p11-kit-0.25.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1240 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1241 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1242 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1243 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.12.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1245 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1246 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1248 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1249 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1250 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1253 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe nghttp2-1.62.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1254 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1255 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1258 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1259 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1264 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1274 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1275 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1277 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.12.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1280 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1281 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1284 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1287 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1289 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1292 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe p11-kit-0.25.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1293 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.62.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1294 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1297 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1298 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.12.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1300 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_32.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1302 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1305 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1306 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1307 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.62.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1397 of 1704 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.75.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1463 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe p11-kit-0.25.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1515 of 1704 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe kmod-32-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe p11-kit-0.25.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cargo-native-1.75.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1517 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1518 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_setscene)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cargo-native-1.75.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1519 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1522 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1525 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1526 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1528 of 1704 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.75.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1529 of 1704 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe rust-native-1.75.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1531 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe xmlto-native-0.0.28+0.0.29+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1532 of 1704 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-native-2.12.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1536 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-native-2.12.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 913 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 946 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_fetch)
NOTE: Running task 950 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_fetch)
NOTE: Running task 952 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_fetch)
NOTE: Running task 986 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 988 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running task 1085 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_write_config)
NOTE: Running task 1088 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_write_config)
NOTE: Running task 1092 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Started
NOTE: Running task 1104 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1105 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-8.5.0-r0: task do_fetch: Started
NOTE: recipe pango-1.52.2-r0: task do_fetch: Started
NOTE: Running task 1136 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: Running task 1139 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_write_config)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.52.2-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Started
NOTE: Running task 1161 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_unpack)
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1162 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_unpack)
NOTE: Running task 1163 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_fetch)
NOTE: Running task 1167 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_unpack)
NOTE: Running task 1197 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running task 1198 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_fetch: Started
NOTE: recipe pango-1.52.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe rust-native-1.75.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1199 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Started
NOTE: recipe vala-0.56.17-r0: task do_fetch: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.52.2-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-8.5.0-r0: task do_unpack: Started
NOTE: recipe pango-1.52.2-r0: task do_unpack: Started
NOTE: recipe vala-0.56.17-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_fetch: Started
NOTE: Running task 1235 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: Running task 1251 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_write_config: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_fetch: Succeeded
NOTE: Running task 1265 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_fetch)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1271 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_unpack)
NOTE: Running task 1276 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: Running task 1279 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Started
NOTE: Running task 1302 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_write_config)
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1344 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_patch)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_unpack: Started
NOTE: recipe vala-0.56.17-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libical-3.0.18-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe bluez5-5.72-r0: task do_fetch: Started
NOTE: Running task 1434 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_fetch)
NOTE: recipe mesa-2_24.0.7-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_write_config: Started
NOTE: recipe bluez5-5.72-r0: task do_fetch: Succeeded
NOTE: Running task 1460 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe mesa-2_24.0.7-r0: task do_fetch: Succeeded
NOTE: Running task 1461 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_unpack)
NOTE: Running task 1463 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_unpack)
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Started
NOTE: Running task 1482 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_write_config)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_unpack: Succeeded
NOTE: Running task 1524 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1525 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_patch)
NOTE: Running task 1531 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_fetch)
NOTE: recipe pango-1.52.2-r0: task do_unpack: Succeeded
NOTE: Running task 1553 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1573 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe bluez5-5.72-r0: task do_unpack: Started
NOTE: recipe librsvg-2.57.1-r0: task do_fetch: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_unpack: Succeeded
NOTE: Running task 1574 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_write_config: Started
NOTE: recipe libical-3.0.18-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_fetch: Started
NOTE: Running task 1575 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe pango-1.52.2-r0: task do_patch: Started
NOTE: Running task 1584 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_fetch)
NOTE: recipe mesa-2_24.0.7-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Succeeded
NOTE: Running task 1595 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_unpack)
NOTE: Running task 1601 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_patch)
NOTE: Running task 1606 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_patch: Started
NOTE: recipe pango-1.52.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1618 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1620 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: recipe libical-3.0.18-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_unpack: Started
NOTE: Running task 1621 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_generate_toolchain_file)
NOTE: recipe libxmlb-0.3.19-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_unpack: Succeeded
NOTE: Running task 1623 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_patch)
NOTE: Running task 1624 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_fetch: Succeeded
NOTE: Running task 1629 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: recipe bluez5-5.72-r0: task do_unpack: Succeeded
NOTE: Running task 1630 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_generate_toolchain_file: Started
NOTE: recipe vala-0.56.17-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: Running task 1631 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_unpack: Succeeded
NOTE: Running task 1632 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe libical-3.0.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_patch: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_patch: Succeeded
NOTE: Running task 1645 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_unpack)
NOTE: recipe bluez5-5.72-r0: task do_patch: Started
NOTE: Running task 1655 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_unpack)
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1668 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: Running task 1669 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 1672 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_fetch)
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: Running task 1684 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_fetch)
NOTE: Running task 1685 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_patch: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: Running task 1688 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_fetch: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 1694 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.42-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_fetch: Succeeded
NOTE: Running task 1699 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_fetch)
NOTE: Running task 1708 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: recipe gtk+3-3.24.42-r0: task do_fetch: Succeeded
NOTE: Running task 1713 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: Running task 1715 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 1716 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: Running task 1719 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_unpack)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_write_config: Started
NOTE: recipe bluez5-5.72-r0: task do_patch: Succeeded
NOTE: Running task 1722 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_write_config)
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: recipe json-glib-1.8.0-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1731 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 1733 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_fetch)
NOTE: Running task 1734 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe gtk4-4.14.4-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: Running task 1745 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_unpack)
NOTE: Running task 1749 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_write_config)
NOTE: recipe gtk4-4.14.4-r0: task do_fetch: Succeeded
NOTE: Running task 1751 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_unpack)
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: recipe librsvg-2.57.1-r0: task do_fetch: Succeeded
NOTE: Running task 1752 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_unpack: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_write_config: Started
NOTE: Running task 1753 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_unpack: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_write_config: Succeeded
NOTE: recipe libwpe-1.16.0-r0: task do_fetch: Started
NOTE: Running task 1754 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_write_config: Started
NOTE: recipe json-glib-1.8.0-r0: task do_unpack: Started
NOTE: recipe gtk4-4.14.4-r0: task do_unpack: Started
NOTE: recipe libwpe-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1759 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_unpack)
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 1771 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_write_config: Succeeded
NOTE: Running task 1772 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running task 1775 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_write_config)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 1781 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_write_config)
NOTE: recipe librsvg-2.57.1-r0: task do_unpack: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: Running task 1782 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_patch)
NOTE: recipe json-glib-1.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1783 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_patch)
NOTE: recipe libwpe-1.16.0-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: Running task 1786 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_fetch)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_patch: Started
NOTE: Running task 1799 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_write_config: Succeeded
NOTE: recipe libwpe-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_patch: Started
NOTE: Running task 1800 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_patch)
NOTE: recipe gtk+3-3.24.42-r0: task do_write_config: Succeeded
NOTE: Running task 1810 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_write_config)
NOTE: Running task 1813 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_write_config)
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Succeeded
NOTE: Running task 1865 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_unpack)
NOTE: Running task 1866 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_fetch)
NOTE: Running task 1867 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_fetch)
NOTE: Running task 1868 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_fetch)
NOTE: recipe harfbuzz-8.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_fetch: Started
NOTE: Running task 1869 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_patch)
NOTE: recipe libwpe-1.16.0-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_patch: Succeeded
NOTE: Running task 1870 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_unpack)
NOTE: Running task 1872 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_fetch)
NOTE: recipe gtk4-4.14.4-r0: task do_write_config: Started
NOTE: recipe json-glib-1.8.0-r0: task do_write_config: Started
NOTE: recipe libwpe-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1873 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_fetch)
NOTE: recipe enchant2-2.8.1-r0: task do_fetch: Started
NOTE: recipe appstream-1.0.3-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_fetch: Started
NOTE: recipe enchant2-2.8.1-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.14.4-r0: task do_write_config: Succeeded
NOTE: Running task 1875 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_fetch)
NOTE: recipe json-glib-1.8.0-r0: task do_write_config: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_fetch: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1881 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_generate_toolchain_file)
NOTE: recipe harfbuzz-8.5.0-r0: task do_patch: Started
NOTE: Running task 1896 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_fetch)
NOTE: Running task 1899 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_fetch)
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_unpack: Started
NOTE: Running task 1913 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_unpack)
NOTE: Running task 1914 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_patch)
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1915 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_unpack)
NOTE: recipe libsecret-0.21.4-r0: task do_fetch: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Succeeded
NOTE: Running task 1917 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_unpack)
NOTE: Running task 1918 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_patch)
NOTE: recipe libsecret-0.21.4-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_fetch: Started
NOTE: recipe libwpe-1.16.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1919 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_unpack)
NOTE: recipe webkitgtk-2.44.1-r0: task do_fetch: Started
NOTE: recipe libnotify-0.8.3-r0: task do_fetch: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_fetch: Started
NOTE: Running task 1920 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_unpack)
NOTE: recipe appstream-1.0.3-r0: task do_unpack: Started
NOTE: recipe libwpe-1.16.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.8.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_patch: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_fetch: Succeeded
NOTE: Running task 1922 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_unpack)
NOTE: Running task 1948 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_fetch)
NOTE: Running task 1949 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_fetch)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Started
NOTE: Running task 1950 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_patch)
NOTE: recipe enchant2-2.8.1-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1951 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_patch)
NOTE: Running task 1952 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_patch)
NOTE: recipe libsecret-0.21.4-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_unpack: Started
NOTE: Running task 1954 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_fetch)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_unpack: Succeeded
NOTE: Running task 1955 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_patch)
NOTE: recipe libhandy-1.8.3-r0: task do_fetch: Started
NOTE: recipe gcr-4.3.0-r0: task do_fetch: Started
NOTE: recipe enchant2-2.8.1-r0: task do_patch: Started
NOTE: recipe gcr-4.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1956 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_fetch)
NOTE: recipe libsoup-3.4.4-r0: task do_patch: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_patch: Started
NOTE: recipe libsecret-0.21.4-r0: task do_unpack: Succeeded
NOTE: Running task 1957 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_patch)
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_unpack: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1958 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_patch)
NOTE: Running task 1959 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_patch)
NOTE: Running task 1960 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_patch)
NOTE: recipe libadwaita-1.5.1-r0: task do_fetch: Started
NOTE: recipe libsoup-3.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1961 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_fetch)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_patch: Started
NOTE: recipe enchant2-2.8.1-r0: task do_patch: Succeeded
NOTE: recipe libadwaita-1.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1962 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_unpack)
NOTE: Running task 1965 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_write_config)
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_patch: Succeeded
NOTE: Running task 1967 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Started
NOTE: recipe libsecret-0.21.4-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_unpack: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 1981 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_patch)
NOTE: recipe libnotify-0.8.3-r0: task do_patch: Started
NOTE: Running task 1983 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_write_config)
NOTE: recipe appstream-1.0.3-r0: task do_patch: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Succeeded
NOTE: Running task 2005 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_unpack)
NOTE: Running task 2006 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_unpack)
NOTE: recipe libportal-0.7.1-r0: task do_fetch: Started
NOTE: recipe libsecret-0.21.4-r0: task do_patch: Succeeded
NOTE: Running task 2008 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.27-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.3-r0: task do_patch: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_unpack: Started
NOTE: Running task 2009 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_unpack)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_write_config: Started
NOTE: recipe appstream-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.42-r0: task do_patch: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_patch: Succeeded
NOTE: Running task 2045 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_write_config)
NOTE: Running task 2048 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_write_config)
NOTE: Running task 2051 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_write_config)
NOTE: recipe libhandy-1.8.3-r0: task do_unpack: Started
NOTE: Running task 2054 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_write_config)
NOTE: recipe gcr-4.3.0-r0: task do_unpack: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_unpack: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.4-r0: task do_write_config: Succeeded
NOTE: Running task 2063 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_recipe_qa)
NOTE: recipe libportal-0.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 2064 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_unpack)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_unpack: Succeeded
NOTE: Running task 2065 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_write_config: Started
NOTE: recipe appstream-1.0.3-r0: task do_write_config: Started
NOTE: recipe libsecret-0.21.4-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.3-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_patch: Succeeded
NOTE: Running task 2074 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_write_config)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_write_config: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_unpack: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_write_config: Succeeded
NOTE: Running task 2075 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_patch)
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Succeeded
NOTE: recipe epiphany-46.2-r0: task do_recipe_qa: Started
NOTE: Running task 2082 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_patch)
NOTE: recipe libnotify-0.8.3-r0: task do_write_config: Succeeded
NOTE: Running task 2110 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_write_config)
NOTE: Running task 2111 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_write_config)
NOTE: Running task 2113 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_write_config)
NOTE: Running task 2114 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_write_config)
NOTE: recipe libportal-0.7.1-r0: task do_unpack: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_patch: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_patch: Succeeded
NOTE: Running task 2116 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_write_config)
NOTE: recipe gcr-4.3.0-r0: task do_patch: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Started
NOTE: recipe libhandy-1.8.3-r0: task do_write_config: Started
NOTE: recipe gcr-4.3.0-r0: task do_write_config: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_write_config: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_write_config: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_patch: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Succeeded
NOTE: Running task 2147 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_write_config)
NOTE: recipe libadwaita-1.5.1-r0: task do_write_config: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_write_config: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_write_config: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_write_config: Started
NOTE: recipe epiphany-46.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2235 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_fetch)
NOTE: recipe libportal-0.7.1-r0: task do_write_config: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 2236 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_patch)
NOTE: recipe epiphany-46.2-r0: task do_write_config: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2237 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_patch)
NOTE: recipe epiphany-46.2-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-46.2-r0: task do_fetch: Started
NOTE: recipe epiphany-46.2-r0: task do_fetch: Succeeded
NOTE: Running task 2238 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_unpack)
NOTE: recipe libhandy-1.8.3-r0: task do_patch: Started
NOTE: recipe gtk4-4.14.4-r0: task do_unpack: Succeeded
NOTE: recipe libadwaita-1.5.1-r0: task do_patch: Started
NOTE: Running task 2239 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_patch)
NOTE: recipe libportal-0.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 2240 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_patch)
NOTE: recipe libadwaita-1.5.1-r0: task do_patch: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_patch: Succeeded
NOTE: recipe epiphany-46.2-r0: task do_unpack: Started
NOTE: recipe gtk4-4.14.4-r0: task do_patch: Started
NOTE: recipe libportal-0.7.1-r0: task do_patch: Started
NOTE: recipe gtk4-4.14.4-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 1543 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1544 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1545 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1546 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1547 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1548 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Started
NOTE: recipe epiphany-46.2-r0: task do_unpack: Succeeded
NOTE: Running task 2246 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_patch)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1549 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe epiphany-46.2-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.80.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1552 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1554 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1555 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1557 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.80.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1561 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe epiphany-46.2-r0: task do_patch: Succeeded
NOTE: Running task 2264 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2265 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_populate_lic)
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe epiphany-46.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-46.2-r0: task do_populate_lic: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1563 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe epiphany-46.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_populate_lic unihash changed to ceecbbcf3114892a9c3402057a67d7e6fac9d3e06eb6cc7d94b3a1db499dc8b5
NOTE: Running setscene task 1565 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1566 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1567 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1568 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1569 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1570 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1572 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1573 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1574 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1575 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1576 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1578 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe epiphany-46.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 1579 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1581 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1583 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1585 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1588 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1589 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1591 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1594 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1595 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1596 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1599 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1600 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1602 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1603 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1605 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1607 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1608 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1609 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1610 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1612 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1613 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1614 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1615 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1617 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1618 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1621 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1622 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1623 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/xz/5.4.6/temp/log.do_packagedata_setscene.929841
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1624 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_package_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1628 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1631 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1635 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1637 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_package_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1640 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1642 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1643 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1645 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_unpack: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2757 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running task 2811 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_patch)
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1647 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1648 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1650 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1653 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_patch: Succeeded
NOTE: Running task 3023 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_generate_toolchain_file)
NOTE: recipe xz-5.4.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1654 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1655 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1656 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1658 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1660 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1662 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1663 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1665 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.57.1-r0: task do_unpack: Succeeded
NOTE: Running task 3035 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_patch)
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.57.1-r0: task do_patch: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1667 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1669 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1670 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.57.1-r0: task do_patch: Succeeded
NOTE: Running task 3047 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_rust_gen_targets)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1672 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.57.1-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.57.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1673 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1675 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1677 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1678 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1679 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 3052 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1680 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1681 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1683 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1691 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1692 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1694 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c8afda1b9ad17f0a32fe2282140fb9fbfb6a58c64c5c1f9fe1f3c72112aae711
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash dbfae28d06bd0943a75eb0dc51618d5a41af150db7ee726b7081b71b704ef402 to wss://hashserv.yoctoproject.org/ws ({'taskhash': 'e076c89a7a600a371040e8c7e943aa3929e39be9d580de99f4cdb6cfc83e6f84', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'dbfae28d06bd0943a75eb0dc51618d5a41af150db7ee726b7081b71b704ef402'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed e076c89a7a600a371040e8c7e943aa3929e39be9d580de99f4cdb6cfc83e6f84 -> dbfae28d06bd0943a75eb0dc51618d5a41af150db7ee726b7081b71b704ef402 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1697 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1699 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1700 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1702 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1704 of 1704 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3492 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3503 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3511 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3518 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata)
NOTE: Running task 3529 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 3572 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3599 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata: Started
NOTE: Running task 3661 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3844 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3874 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_24.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3890 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3930 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3985 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmlb-0.3.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4005 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4023 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 84b5de9da03360a64d4498693efe2cfbc1fd74dd8432b0d807425ead25b5c926
NOTE: Running task 4032 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4038 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 4039 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4083 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe enchant2-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4084 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_configure)
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4085 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4086 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4087 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: recipe vala-0.56.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4088 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_configure)
NOTE: recipe harfbuzz-8.5.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4089 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_configure)
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_configure: Started
NOTE: Running task 4092 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4093 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe mesa-2_24.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4094 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_configure)
NOTE: recipe json-glib-1.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4095 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: Running task 4096 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_configure)
NOTE: Running task 4097 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_configure)
NOTE: recipe harfbuzz-8.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_configure: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Started
NOTE: Running task 4109 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_collect_spdx_deps)
NOTE: recipe enchant2-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4110 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: Running task 4115 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_configure: Started
NOTE: recipe json-glib-1.8.0-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe enchant2-2.8.1-r0: task do_configure: Started
NOTE: recipe vala-0.56.17-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4116 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4121 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_configure: Started
NOTE: Running task 4164 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_collect_spdx_deps)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4166 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4167 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4209 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4213 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4236 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4258 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_collect_spdx_deps)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Succeeded
NOTE: Running task 4259 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4273 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Succeeded
NOTE: Running task 4274 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: recipe libxmlb-0.3.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4281 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: Running task 4282 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe enchant2-2.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe enchant2-2.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4283 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe libxmlb-0.3.19-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4284 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.8.0-r0: task do_configure: Succeeded
NOTE: Running task 4285 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_configure_ptest_base)
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4293 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_collect_spdx_deps)
NOTE: recipe libxmlb-0.3.19-r0: task do_configure_ptest_base: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 4294 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_compile)
NOTE: recipe json-glib-1.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4295 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_compile)
NOTE: recipe json-glib-1.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Succeeded
NOTE: Running task 4296 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_configure: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_compile: Started
NOTE: Running task 4297 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_compile)
NOTE: recipe json-glib-1.8.0-r0: task do_compile: Started
NOTE: recipe json-glib-1.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 4300 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_install: Succeeded
NOTE: Running task 4301 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_populate_sysroot)
NOTE: Running task 4302 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_package)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_compile: Succeeded
NOTE: Running task 4303 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_install)
NOTE: recipe desktop-file-utils-0.27-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_configure: Succeeded
NOTE: Running task 4304 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 4305 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_compile)
NOTE: recipe desktop-file-utils-0.27-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-8.5.0-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_install: Succeeded
NOTE: Running task 4306 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_package)
NOTE: Running task 4307 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_populate_sysroot)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_populate_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package: Started
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: Running task 4308 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Succeeded
NOTE: Running task 4309 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: Running task 4310 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_configure_ptest_base)
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4311 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_compile)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_package: Succeeded
NOTE: Running task 4312 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.27-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_packagedata unihash changed to 8d42225cf16ea14c91d12bb7b4a579d9da7ce9c56b4d13e08a70c62dfd9ada0f
NOTE: Setscene tasks completed
NOTE: Running task 4313 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_create_spdx)
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 4314 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: Running task 4315 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: recipe desktop-file-utils-0.27-r0: task do_create_spdx: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Succeeded
NOTE: Running task 4316 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.27-r0: task do_create_spdx: Succeeded
NOTE: Running task 4317 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4318 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_compile: Succeeded
NOTE: Running task 4319 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_compile_ptest_base)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 4320 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Succeeded
NOTE: Running task 4321 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_compile)
NOTE: recipe libxmlb-0.3.19-r0: task do_compile_ptest_base: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4322 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_install)
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: Running task 4323 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_configure)
NOTE: Running task 4324 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure: Started
NOTE: recipe json-glib-1.8.0-r0: task do_compile: Succeeded
NOTE: Running task 4325 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_compile_ptest_base)
NOTE: recipe json-glib-1.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Running task 4326 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: recipe json-glib-1.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4327 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: Running task 4328 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 4329 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe json-glib-1.8.0-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package: Succeeded
NOTE: Running task 4330 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_install: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: Running task 4331 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_install_ptest_base)
NOTE: recipe mesa-2_24.0.7-r0: task do_configure: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_packagedata: Started
NOTE: Running task 4332 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_compile)
NOTE: recipe libxmlb-0.3.19-r0: task do_install_ptest_base: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Succeeded
NOTE: Running task 4333 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_install)
NOTE: recipe mesa-2_24.0.7-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4334 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_populate_sysroot)
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: Running task 4335 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_package)
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 4336 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_compile)
NOTE: recipe libxmlb-0.3.19-r0: task do_populate_sysroot: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_package: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_packagedata unihash changed to bf88fc637d9aaf793b7993fe7454bab7e89b8e6f1143577de980159353f6b745
NOTE: recipe json-glib-1.8.0-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4337 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_install_ptest_base)
NOTE: Running task 4338 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_create_spdx)
NOTE: Running task 4339 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_package_write_ipk)
NOTE: recipe json-glib-1.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_create_spdx: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package_write_ipk: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_compile: Succeeded
NOTE: Running task 4340 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_install)
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Succeeded
NOTE: recipe libxmlb-0.3.19-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4341 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot)
NOTE: recipe json-glib-1.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4342 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_package)
NOTE: Running task 4343 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_package)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Started
NOTE: recipe json-glib-1.8.0-r0: task do_package: Started
NOTE: recipe vala-0.56.17-r0: task do_configure: Succeeded
NOTE: Running task 4344 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_compile)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4345 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_populate_sysroot)
NOTE: recipe vala-0.56.17-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.52.0-r0: task do_install: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_populate_sysroot: Started
NOTE: Running task 4346 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 4347 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_package)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_package: Started
NOTE: recipe json-glib-1.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4348 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4349 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_configure_ptest_base)
NOTE: Running task 4350 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_package_write_deb)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Running task 4351 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_package_write_rpm)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata unihash changed to 0c96fbcecdb2fa28c70c0d2bc142c4aab0f5187cf17bf72a352db885b7a58d2a
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package_write_deb: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package_write_rpm: Started
NOTE: Setscene tasks completed
NOTE: Running task 4352 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_compile)
NOTE: Running task 4353 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe libxmlb-0.3.19-r0: task do_package: Succeeded
NOTE: Running task 4354 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_packagedata: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_packagedata unihash changed to 87f021e4ecaabcf131d682434920ed347a43ca9e565d902ece60e704ddd5c9bb
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4355 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata)
NOTE: Running task 4356 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.19.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_create_spdx: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_package_write_ipk unihash changed to ea265fa8c4a2f615113304b0f6459e1c16549b26920cf240eef949792016b312
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Succeeded
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package_write_deb: Succeeded
NOTE: Running task 4357 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_package_write_deb unihash changed to 4a53d19358037b2351cf557a980b21f23f70d274c6ac0fe5d438d11c540eca3e
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe libxmlb-0.3.19-r0: task do_create_spdx: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Succeeded
NOTE: Running task 4358 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.8.0-r0: task do_package: Succeeded
NOTE: Running task 4359 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_packagedata)
NOTE: recipe json-glib-1.8.0-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 4360 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: Running task 4361 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_ipk)
NOTE: recipe libxt-1_1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 4362 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_deb)
NOTE: Running task 4363 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_install)
NOTE: Running task 4364 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_ipk: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_deb: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_rpm: Started
NOTE: recipe json-glib-1.8.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_packagedata unihash changed to 78b79ac3443087ea75e71864e879e6541736eb3a7d72e0e93f1751bd856b272b
NOTE: Setscene tasks completed
NOTE: Running task 4365 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_create_spdx)
NOTE: recipe json-glib-1.8.0-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_install: Succeeded
NOTE: Running task 4366 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 4367 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_package)
NOTE: recipe libxt-1_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile: Succeeded
NOTE: Running task 4368 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_compile_ptest_base)
NOTE: recipe libxt-1_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4369 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_install)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_compile: Succeeded
NOTE: Running task 4370 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 4371 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_install)
NOTE: Running task 4372 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe json-glib-1.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_package: Succeeded
NOTE: Running task 4373 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install: Succeeded
NOTE: Running task 4374 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4375 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot)
NOTE: Running task 4376 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_package)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_install: Succeeded
NOTE: Running task 4377 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_install_ptest_base)
NOTE: recipe at-spi2-core-2.52.0-r0: task do_packagedata: Succeeded
NOTE: Running task 4378 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_create_spdx: Started
NOTE: Running task 4379 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_populate_sysroot)
NOTE: Running task 4380 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_package)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 4381 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_packagedata)
NOTE: recipe libxt-1_1.3.0-r0: task do_packagedata: Started
NOTE: recipe gsettings-desktop-schemas-46.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4382 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_prepare_recipe_sysroot)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.0.bb:do_package_write_rpm unihash changed to f0f864a72c2174fb93c46aa5e5433a34858782878094cd62c3869557afe85134
NOTE: recipe libnotify-0.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_ipk unihash changed to e9fce7b791f5eb499272fad934bfe269c28ba9f71da744bf30deb90c731e26bb
NOTE: recipe libxt-1_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 4383 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_create_spdx)
NOTE: recipe libxt-1_1.3.0-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4384 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_configure)
NOTE: recipe libnotify-0.8.3-r0: task do_configure: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.52.0-r0: task do_create_spdx: Succeeded
NOTE: recipe enchant2-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 4385 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_compile)
NOTE: recipe enchant2-2.8.1-r0: task do_compile: Started
NOTE: recipe libnotify-0.8.3-r0: task do_configure: Succeeded
NOTE: Running task 4386 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_compile)
NOTE: recipe libnotify-0.8.3-r0: task do_compile: Started
NOTE: recipe enchant2-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 4387 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_install)
NOTE: recipe enchant2-2.8.1-r0: task do_install: Started
NOTE: recipe enchant2-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 4388 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 4389 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_package)
NOTE: recipe enchant2-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.8.1-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package: Succeeded
NOTE: Running task 4390 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata)
NOTE: recipe enchant2-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.3-r0: task do_compile: Succeeded
NOTE: Running task 4391 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_install)
NOTE: recipe libnotify-0.8.3-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata: Succeeded
NOTE: Running task 4392 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx)
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_deb unihash changed to 2a0be1274ba51d4768bd431d7e15d73f7c9fc70a3b6f43502b2cbd71df5ad95f
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx: Started
NOTE: recipe libnotify-0.8.3-r0: task do_install: Succeeded
NOTE: Running task 4393 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_populate_sysroot)
NOTE: Running task 4394 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_package)
NOTE: recipe libnotify-0.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe libnotify-0.8.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_package: Succeeded
NOTE: Running task 4395 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 4396 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_packagedata)
NOTE: recipe libnotify-0.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe enchant2-2.8.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_packagedata unihash changed to 39fadbd480b6d0a97b9862e938b08ae09a091a024e6d30680bdc66fe39bb3d35
NOTE: recipe enchant2-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4397 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb:do_create_spdx)
NOTE: Running task 4398 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.1.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_create_spdx: Started
NOTE: recipe enchant2-2.8.1-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 4399 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_collect_spdx_deps)
NOTE: recipe enchant2-2.8.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnotify-0.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_package: Succeeded
NOTE: Running task 4400 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_packagedata)
NOTE: recipe libnotify-0.8.3-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_packagedata unihash changed to ed751fc70fde2edbd646eb84da73be891910049ac55945fe42d3c2440787fb03
NOTE: Setscene tasks completed
NOTE: Running task 4401 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_create_spdx)
NOTE: recipe libnotify-0.8.3-r0: task do_create_spdx: Started
NOTE: recipe libnotify-0.8.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.24.4-r0: task do_create_spdx: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_compile: Succeeded
NOTE: Running task 4402 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_install)
NOTE: recipe vala-0.56.17-r0: task do_install: Started
NOTE: recipe vala-0.56.17-r0: task do_install: Succeeded
NOTE: Running task 4403 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot)
NOTE: Running task 4404 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_package)
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.17-r0: task do_package: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4405 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4406 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4407 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4408 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-3.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe appstream-1.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.80.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb:do_package_write_rpm unihash changed to f98e7f2225deb70e76669ef51284ca1a9403307d059553c69dfab76deb1f06c5
NOTE: recipe libical-3.0.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4409 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_configure)
NOTE: Running task 4410 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_configure)
NOTE: recipe libsecret-0.21.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4411 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_configure)
NOTE: recipe libical-3.0.18-r0: task do_configure: Started
NOTE: recipe libsoup-3.4.4-r0: task do_configure: Started
NOTE: recipe libsecret-0.21.4-r0: task do_configure: Started
NOTE: recipe appstream-1.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4412 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_configure)
NOTE: recipe appstream-1.0.3-r0: task do_configure: Started
NOTE: recipe vala-0.56.17-r0: task do_package: Succeeded
NOTE: Running task 4413 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata)
NOTE: recipe vala-0.56.17-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.17-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata unihash changed to a251265b703b97c3ed22e4ef159b701a00c39e8cbcbd88810a5b6b1fc40841e3
NOTE: Setscene tasks completed
NOTE: Running task 4414 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_create_spdx)
NOTE: recipe vala-0.56.17-r0: task do_create_spdx: Started
NOTE: recipe libsecret-0.21.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4415 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_compile)
NOTE: recipe libsoup-3.4.4-r0: task do_configure: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4416 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_compile)
NOTE: Setscene tasks completed
NOTE: Running task 4417 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_compile)
NOTE: recipe libsecret-0.21.4-r0: task do_compile: Started
NOTE: recipe libsoup-3.4.4-r0: task do_compile: Started
NOTE: recipe appstream-1.0.3-r0: task do_compile: Started
NOTE: recipe vala-0.56.17-r0: task do_create_spdx: Succeeded
NOTE: Running task 4418 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_collect_spdx_deps)
NOTE: Running task 4419 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_collect_spdx_deps)
NOTE: Running task 4420 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_collect_spdx_deps)
NOTE: Running task 4421 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe appstream-1.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsecret-0.21.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4422 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_compile)
NOTE: recipe libical-3.0.18-r0: task do_compile: Started
NOTE: recipe libsecret-0.21.4-r0: task do_compile: Succeeded
NOTE: Running task 4423 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_install)
NOTE: recipe libsecret-0.21.4-r0: task do_install: Started
NOTE: recipe libsecret-0.21.4-r0: task do_install: Succeeded
NOTE: Running task 4424 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_populate_sysroot)
NOTE: Running task 4425 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_package)
NOTE: recipe libsecret-0.21.4-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.21.4-r0: task do_package: Started
NOTE: recipe libsecret-0.21.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_compile: Succeeded
NOTE: Running task 4426 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_install)
NOTE: recipe appstream-1.0.3-r0: task do_compile: Succeeded
NOTE: Running task 4427 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_install)
NOTE: recipe libsoup-3.4.4-r0: task do_install: Started
NOTE: recipe appstream-1.0.3-r0: task do_install: Started
NOTE: recipe libsoup-3.4.4-r0: task do_install: Succeeded
NOTE: Running task 4428 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_populate_sysroot)
NOTE: Running task 4429 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_package)
NOTE: recipe appstream-1.0.3-r0: task do_install: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_populate_sysroot: Started
NOTE: Running task 4430 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_populate_sysroot)
NOTE: Running task 4431 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_package)
NOTE: recipe libsoup-3.4.4-r0: task do_package: Started
NOTE: recipe appstream-1.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe appstream-1.0.3-r0: task do_package: Started
NOTE: recipe libsoup-3.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_compile: Succeeded
NOTE: Running task 4432 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_install)
NOTE: recipe libical-3.0.18-r0: task do_install: Started
NOTE: recipe libical-3.0.18-r0: task do_install: Succeeded
NOTE: Running task 4433 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_populate_sysroot)
NOTE: Running task 4434 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_package)
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.18-r0: task do_package: Started
NOTE: recipe libsecret-0.21.4-r0: task do_package: Succeeded
NOTE: Running task 4435 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_packagedata)
NOTE: recipe libsecret-0.21.4-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4436 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.72-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.21.4-r0: task do_packagedata: Succeeded
NOTE: Running task 4437 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_create_spdx)
NOTE: recipe libsecret-0.21.4-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.72-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4438 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_configure)
NOTE: recipe bluez5-5.72-r0: task do_configure: Started
NOTE: recipe libsecret-0.21.4-r0: task do_create_spdx: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_package: Succeeded
NOTE: recipe libical-3.0.18-r0: task do_package: Succeeded
NOTE: Running task 4439 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_packagedata)
NOTE: Running task 4440 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_packagedata)
NOTE: recipe libical-3.0.18-r0: task do_packagedata: Started
NOTE: recipe appstream-1.0.3-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.4-r0: task do_package: Succeeded
NOTE: Running task 4441 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_packagedata)
NOTE: recipe libical-3.0.18-r0: task do_packagedata: Succeeded
NOTE: Running task 4442 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.18.bb:do_create_spdx)
NOTE: recipe libsoup-3.4.4-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.18-r0: task do_create_spdx: Started
NOTE: recipe appstream-1.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_packagedata unihash changed to 8b14a1c366e05074a96e5132b767fad1351badafcc763d6dec658745b6861ad6
NOTE: Setscene tasks completed
NOTE: Running task 4443 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.3.bb:do_create_spdx)
NOTE: recipe appstream-1.0.3-r0: task do_create_spdx: Started
NOTE: recipe libsoup-3.4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 4444 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_create_spdx)
NOTE: recipe libical-3.0.18-r0: task do_create_spdx: Succeeded
NOTE: Running task 4445 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.4.4-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.72-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.72-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe appstream-1.0.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_create_spdx: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_configure: Succeeded
NOTE: Running task 4446 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.72-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.72-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4447 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_compile)
NOTE: recipe bluez5-5.72-r0: task do_compile: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 4448 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_install)
NOTE: recipe harfbuzz-8.5.0-r0: task do_install: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 4449 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_populate_sysroot)
NOTE: Running task 4450 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_package)
NOTE: recipe harfbuzz-8.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_package: Started
NOTE: recipe bluez5-5.72-r0: task do_compile: Succeeded
NOTE: Running task 4451 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.72-r0: task do_compile_ptest_base: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4452 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.52.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.52.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4453 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_configure)
NOTE: recipe pango-1.52.2-r0: task do_configure: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 4454 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_packagedata)
NOTE: recipe harfbuzz-8.5.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 4455 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.5.0.bb:do_create_spdx)
NOTE: recipe harfbuzz-8.5.0-r0: task do_create_spdx: Started
NOTE: recipe pango-1.52.2-r0: task do_configure: Succeeded
NOTE: Running task 4456 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_configure_ptest_base)
NOTE: recipe pango-1.52.2-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.52.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4457 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_compile)
NOTE: recipe pango-1.52.2-r0: task do_compile: Started
NOTE: recipe harfbuzz-8.5.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4458 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.52.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.52.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4459 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_install)
NOTE: recipe bluez5-5.72-r0: task do_install: Started
NOTE: recipe pango-1.52.2-r0: task do_compile: Succeeded
NOTE: Running task 4460 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_compile_ptest_base)
NOTE: recipe pango-1.52.2-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.52.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4461 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_install)
NOTE: recipe pango-1.52.2-r0: task do_install: Started
NOTE: recipe bluez5-5.72-r0: task do_install: Succeeded
NOTE: Running task 4462 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.72-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.72-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4463 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_populate_sysroot)
NOTE: Running task 4464 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_package)
NOTE: recipe bluez5-5.72-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.72-r0: task do_package: Started
NOTE: recipe pango-1.52.2-r0: task do_install: Succeeded
NOTE: Running task 4465 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_install_ptest_base)
NOTE: recipe pango-1.52.2-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.52.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4466 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_populate_sysroot)
NOTE: Running task 4467 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_package)
NOTE: recipe pango-1.52.2-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.52.2-r0: task do_package: Started
NOTE: recipe bluez5-5.72-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.52.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4468 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.57.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.57.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4469 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.57.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.57.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 4470 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_configure)
NOTE: recipe librsvg-2.57.1-r0: task do_configure: Started
NOTE: recipe pango-1.52.2-r0: task do_package: Succeeded
NOTE: Running task 4471 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_packagedata)
NOTE: recipe pango-1.52.2-r0: task do_packagedata: Started
NOTE: recipe pango-1.52.2-r0: task do_packagedata: Succeeded
NOTE: Running task 4472 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.2.bb:do_create_spdx)
NOTE: recipe pango-1.52.2-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.72-r0: task do_package: Succeeded
NOTE: Running task 4473 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_packagedata)
NOTE: recipe pango-1.52.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 4474 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.72-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.57.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.72-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_packagedata unihash changed to fc3d0b76f506926549f3777304a5e47a1b3f10f469c40612e288d9e9867fdf58
NOTE: recipe librsvg-2.57.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4475 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_create_spdx)
NOTE: recipe bluez5-5.72-r0: task do_create_spdx: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_compile: Succeeded
NOTE: Running task 4476 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_install)
NOTE: recipe mesa-2_24.0.7-r0: task do_install: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_install: Succeeded
NOTE: Running task 4477 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_populate_sysroot)
NOTE: Running task 4478 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_package)
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_package: Started
NOTE: recipe bluez5-5.72-r0: task do_create_spdx: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4479 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4480 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4481 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.57.1-r0: task do_configure: Succeeded
NOTE: Running task 4482 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_compile)
NOTE: recipe librsvg-2.57.1-r0: task do_compile: Started
NOTE: recipe libwpe-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4483 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4484 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: Running task 4485 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_configure)
NOTE: recipe libwpe-1.16.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Started
NOTE: recipe libwpe-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 4486 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_compile)
NOTE: recipe libwpe-1.16.0-r0: task do_compile: Started
NOTE: recipe libwpe-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 4487 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_install)
NOTE: recipe libwpe-1.16.0-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Succeeded
NOTE: Running task 4488 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_compile)
NOTE: recipe libwpe-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 4489 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 4490 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libwpe-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe libwpe-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Succeeded
NOTE: Running task 4491 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Succeeded
NOTE: Running task 4492 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4493 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4494 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_configure: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_package: Succeeded
NOTE: Running task 4495 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_packagedata)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 4496 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_package)
NOTE: Running task 4497 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.7.bb:do_create_spdx)
NOTE: Running task 4498 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_package)
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Started
NOTE: recipe libwpe-1.16.0-r0: task do_package: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx: Started
NOTE: recipe libwpe-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 4499 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_packagedata)
NOTE: recipe libwpe-1.16.0-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Succeeded
NOTE: Running task 4500 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 4501 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libwpe-1.16.0-r0: task do_packagedata: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata unihash changed to 492d23c5097252bc14cc226ece05ce72dc0b27a6046ac4433547ecf7b015c4f5
NOTE: Setscene tasks completed
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 4502 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 4503 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4504 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4505 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4506 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4507 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4508 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_configure)
NOTE: recipe gtk+3-3.24.42-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 4509 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 4510 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: Running task 4511 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_collect_spdx_deps)
NOTE: Running task 4512 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_collect_spdx_deps)
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwpe-1.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4513 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4514 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx)
NOTE: recipe libwpe-1.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4515 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.0.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Started
NOTE: recipe libwpe-1.16.0-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 4516 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_collect_spdx_deps)
NOTE: recipe libwpe-1.16.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4517 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 4518 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.42-r0: task do_collect_spdx_deps: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_configure: Succeeded
NOTE: Running task 4519 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk+3-3.24.42-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_compile: Succeeded
NOTE: Running task 4520 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_install)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_install: Succeeded
NOTE: Running task 4521 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_populate_sysroot)
NOTE: Running task 4522 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_package)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.42-r0: task do_configure: Succeeded
NOTE: Running task 4523 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_compile)
NOTE: recipe gtk+3-3.24.42-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_package: Succeeded
NOTE: Running task 4524 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_packagedata unihash changed to cddde9201287508cf1428e67cbc3d5ed5a3fa72f8126d09f22f6f5dabffe441c
NOTE: Setscene tasks completed
NOTE: Running task 4525 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_create_spdx)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_create_spdx: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_compile: Succeeded
NOTE: Running task 4526 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_install: Succeeded
NOTE: Running task 4527 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_populate_sysroot)
NOTE: Running task 4528 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_package: Succeeded
NOTE: Running task 4529 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_packagedata unihash changed to fa521a7906f0f15f5a10b546239388471c6dd535c35cecd4cd40b4eada4fc9ad
NOTE: Setscene tasks completed
NOTE: Running task 4530 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.4-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk+3-3.24.42-r0: task do_compile: Succeeded
NOTE: Running task 4531 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_install)
NOTE: recipe gtk+3-3.24.42-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_install: Succeeded
NOTE: Running task 4532 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_populate_sysroot)
NOTE: Running task 4533 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_package)
NOTE: recipe gtk+3-3.24.42-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4534 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4535 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libhandy-1.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libhandy-1.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4540 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_configure)
NOTE: Running task 4541 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_configure)
NOTE: recipe libhandy-1.8.3-r0: task do_configure: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Started
NOTE: recipe libhandy-1.8.3-r0: task do_configure: Succeeded
NOTE: Running task 4542 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_compile)
NOTE: recipe libhandy-1.8.3-r0: task do_compile: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Succeeded
NOTE: Running task 4543 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_compile)
NOTE: recipe libdazzle-3.44.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_package: Succeeded
NOTE: Running task 4544 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.42-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.42-r0: task do_packagedata: Succeeded
NOTE: Running task 4545 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb:do_create_spdx)
NOTE: recipe gtk+3-3.24.42-r0: task do_create_spdx: Started
NOTE: recipe libhandy-1.8.3-r0: task do_compile: Succeeded
NOTE: Running task 4551 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_install)
NOTE: recipe libhandy-1.8.3-r0: task do_install: Started
NOTE: recipe libhandy-1.8.3-r0: task do_install: Succeeded
NOTE: Running task 4552 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_package)
NOTE: recipe gtk+3-3.24.42-r0: task do_create_spdx: Succeeded
NOTE: Running task 4553 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_populate_sysroot)
NOTE: Running task 4554 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_collect_spdx_deps)
NOTE: Running task 4555 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_collect_spdx_deps)
NOTE: recipe libhandy-1.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe libhandy-1.8.3-r0: task do_package: Started
NOTE: recipe libhandy-1.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libhandy-1.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_compile: Succeeded
NOTE: Running task 4558 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_install)
NOTE: recipe libdazzle-3.44.0-r0: task do_install: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_install: Succeeded
NOTE: Running task 4559 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_package)
NOTE: Running task 4560 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot)
NOTE: recipe libdazzle-3.44.0-r0: task do_package: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_populate_sysroot: Started
NOTE: recipe libhandy-1.8.3-r0: task do_package: Succeeded
NOTE: Running task 4561 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_packagedata)
NOTE: recipe libdazzle-3.44.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_packagedata: Started
NOTE: recipe libhandy-1.8.3-r0: task do_packagedata: Succeeded
NOTE: Running task 4562 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_create_spdx)
NOTE: recipe libhandy-1.8.3-r0: task do_create_spdx: Started
NOTE: recipe libhandy-1.8.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_package: Succeeded
NOTE: Running task 4563 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_packagedata)
NOTE: recipe libdazzle-3.44.0-r0: task do_packagedata: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_packagedata unihash changed to 3f0b3a8eb995b32e55d4f90abe83df16341456ea19c06900b58b746953cf97ec
NOTE: Setscene tasks completed
NOTE: Running task 4564 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_create_spdx)
NOTE: recipe libdazzle-3.44.0-r0: task do_create_spdx: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.57.1-r0: task do_compile: Succeeded
NOTE: Running task 4565 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_install)
NOTE: recipe librsvg-2.57.1-r0: task do_install: Started
NOTE: recipe librsvg-2.57.1-r0: task do_install: Succeeded
NOTE: Running task 4566 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_populate_sysroot)
NOTE: Running task 4567 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_package)
NOTE: recipe librsvg-2.57.1-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.57.1-r0: task do_package: Started
NOTE: recipe librsvg-2.57.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4568 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4569 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_configure: Started
NOTE: recipe librsvg-2.57.1-r0: task do_package: Succeeded
NOTE: Running task 4570 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_packagedata)
NOTE: recipe librsvg-2.57.1-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.57.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_packagedata unihash changed to fb064e00d7da778751a3ebe0f343480b68f8f57cf868d4476768b20792de53c2
NOTE: Setscene tasks completed
NOTE: Running task 4571 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_create_spdx)
NOTE: recipe librsvg-2.57.1-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.57.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 4572 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4573 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_compile: Succeeded
NOTE: Running task 4574 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_install: Succeeded
NOTE: Running task 4575 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_populate_sysroot)
NOTE: Running task 4576 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4577 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.14.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.14.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4578 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_configure)
NOTE: recipe gtk4-4.14.4-r0: task do_configure: Started
NOTE: recipe gtk4-4.14.4-r0: task do_configure: Succeeded
NOTE: Running task 4579 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_compile)
NOTE: recipe gtk4-4.14.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_package: Succeeded
NOTE: Running task 4580 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_packagedata unihash changed to 8a12db727185941752d5755c1cf53f2ff60c3e1dda249294971e2fde5b66a08c
NOTE: Setscene tasks completed
NOTE: Running task 4581 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.24.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 4582 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.14.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.14.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.14.4-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4583 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_install)
NOTE: recipe gtk4-4.14.4-r0: task do_install: Started
NOTE: recipe gtk4-4.14.4-r0: task do_install: Succeeded
NOTE: Running task 4584 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_populate_sysroot)
NOTE: Running task 4585 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_package)
NOTE: recipe gtk4-4.14.4-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.14.4-r0: task do_package: Started
NOTE: recipe gtk4-4.14.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4586 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4587 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4588 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4589 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcr-4.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libportal-0.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4590 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_configure)
NOTE: recipe libportal-0.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4591 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_configure)
NOTE: recipe webkitgtk-2.44.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4592 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_configure)
NOTE: recipe libadwaita-1.5.1-r0: task do_configure: Started
NOTE: recipe gcr-4.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4593 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_configure)
NOTE: recipe libportal-0.7.1-r0: task do_configure: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_configure: Started
NOTE: recipe gcr-4.3.0-r0: task do_configure: Started
NOTE: recipe libportal-0.7.1-r0: task do_configure: Succeeded
NOTE: Running task 4594 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_compile)
NOTE: recipe libportal-0.7.1-r0: task do_compile: Started
NOTE: recipe gcr-4.3.0-r0: task do_configure: Succeeded
NOTE: Running task 4595 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_compile)
NOTE: recipe libadwaita-1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 4596 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_compile)
NOTE: recipe gcr-4.3.0-r0: task do_compile: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_compile: Started
NOTE: recipe gcr-4.3.0-r0: task do_compile: Succeeded
NOTE: Running task 4597 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_install)
NOTE: recipe gcr-4.3.0-r0: task do_install: Started
NOTE: recipe gtk4-4.14.4-r0: task do_package: Succeeded
NOTE: Running task 4598 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_packagedata)
NOTE: recipe gtk4-4.14.4-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.14.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_packagedata unihash changed to 4b855f3ee3ec69c56f4232dcced845c6d2441a044956261771df7f99757ede0e
NOTE: recipe libportal-0.7.1-r0: task do_compile: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4599 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_install)
NOTE: Running task 4600 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_package)
NOTE: Running task 4601 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_populate_sysroot)
NOTE: Running task 4602 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.4.bb:do_create_spdx)
NOTE: recipe libportal-0.7.1-r0: task do_install: Started
NOTE: recipe gcr-4.3.0-r0: task do_package: Started
NOTE: recipe gcr-4.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.14.4-r0: task do_create_spdx: Started
NOTE: recipe libportal-0.7.1-r0: task do_install: Succeeded
NOTE: Running task 4603 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_package)
NOTE: Running task 4604 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_populate_sysroot)
NOTE: recipe gcr-4.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_package: Started
NOTE: recipe libportal-0.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe libportal-0.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.14.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 4605 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_collect_spdx_deps)
NOTE: Running task 4606 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_collect_spdx_deps)
NOTE: Running task 4607 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_collect_spdx_deps)
NOTE: recipe gcr-4.3.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4608 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_collect_spdx_deps)
NOTE: recipe libadwaita-1.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libportal-0.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_compile: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4609 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_install)
NOTE: Running task 4610 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_packagedata)
NOTE: recipe libadwaita-1.5.1-r0: task do_install: Started
NOTE: recipe libportal-0.7.1-r0: task do_packagedata: Started
NOTE: recipe gcr-4.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libadwaita-1.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_packagedata unihash changed to 3fa38e3b5d9fceeb4799775cf21b2da81fbeefb2672a8bee1e5907f6ec48e6f9
NOTE: Setscene tasks completed
NOTE: Running task 4611 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_create_spdx)
NOTE: recipe libportal-0.7.1-r0: task do_create_spdx: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_install: Succeeded
NOTE: Running task 4612 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_package)
NOTE: Running task 4613 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_populate_sysroot)
NOTE: recipe libadwaita-1.5.1-r0: task do_package: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe libportal-0.7.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_package: Succeeded
NOTE: Running task 4614 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_packagedata)
NOTE: recipe gcr-4.3.0-r0: task do_packagedata: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gcr-4.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_packagedata unihash changed to d21b843b72a8518b602df831e4dea2df60ae5c5ffdbaa042b4e5c53f787f6c09
NOTE: Setscene tasks completed
NOTE: Running task 4615 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_create_spdx)
NOTE: recipe gcr-4.3.0-r0: task do_create_spdx: Started
NOTE: recipe gcr-4.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libadwaita-1.5.1-r0: task do_package: Succeeded
NOTE: Running task 4616 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_packagedata)
NOTE: recipe libadwaita-1.5.1-r0: task do_packagedata: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_packagedata unihash changed to a62d91e06fa77697c270d8e58b0ed51a26139974ecb4d2c06b901243e9c88789
NOTE: Setscene tasks completed
NOTE: Running task 4617 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.1.bb:do_create_spdx)
NOTE: recipe libadwaita-1.5.1-r0: task do_create_spdx: Started
NOTE: recipe libadwaita-1.5.1-r0: task do_create_spdx: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4618 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_compile)
NOTE: recipe webkitgtk-2.44.1-r0: task do_compile: Started
Bitbake still alive (no events for 600s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_compile
Bitbake still alive (no events for 1200s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_compile
NOTE: recipe webkitgtk-2.44.1-r0: task do_compile: Succeeded
NOTE: Running task 4619 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_install)
NOTE: recipe webkitgtk-2.44.1-r0: task do_install: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_install: Succeeded
NOTE: Running task 4620 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_package)
NOTE: Running task 4621 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.44.1-r0: task do_package: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4622 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-46.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-46.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4623 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_configure)
NOTE: recipe epiphany-46.2-r0: task do_configure: Started
NOTE: recipe epiphany-46.2-r0: task do_configure: Succeeded
NOTE: Running task 4624 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_compile)
NOTE: recipe epiphany-46.2-r0: task do_compile: Started
NOTE: recipe epiphany-46.2-r0: task do_compile: Succeeded
NOTE: Running task 4625 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_install)
NOTE: recipe epiphany-46.2-r0: task do_install: Started
NOTE: recipe epiphany-46.2-r0: task do_install: Succeeded
NOTE: Running task 4626 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_populate_sysroot)
NOTE: recipe epiphany-46.2-r0: task do_populate_sysroot: Started
NOTE: recipe epiphany-46.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_package: Succeeded
NOTE: Running task 4627 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_packagedata)
NOTE: recipe webkitgtk-2.44.1-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_packagedata unihash changed to 9643c150b2050f7658a4af1e3da3fa7cc5585cd8b71b213109be125e7045b4ef
NOTE: Setscene tasks completed
NOTE: Running task 4628 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_package)
NOTE: Running task 4629 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_create_spdx)
NOTE: recipe epiphany-46.2-r0: task do_package: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_create_spdx: Started
NOTE: recipe epiphany-46.2-r0: task do_package: Succeeded
NOTE: Running task 4630 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_packagedata)
NOTE: recipe epiphany-46.2-r0: task do_packagedata: Started
NOTE: recipe epiphany-46.2-r0: task do_packagedata: Succeeded
NOTE: Running task 4631 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_package_write_ipk)
NOTE: Running task 4632 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_package_write_deb)
NOTE: Running task 4633 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_package_write_rpm)
NOTE: recipe epiphany-46.2-r0: task do_package_write_ipk: Started
NOTE: Running task 4634 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_package_qa)
NOTE: recipe epiphany-46.2-r0: task do_package_write_deb: Started
NOTE: recipe epiphany-46.2-r0: task do_package_write_rpm: Started
NOTE: recipe epiphany-46.2-r0: task do_package_qa: Started
NOTE: recipe epiphany-46.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe epiphany-46.2-r0: task do_package_qa: Succeeded
NOTE: recipe epiphany-46.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 4635 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_collect_spdx_deps)
NOTE: recipe epiphany-46.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe epiphany-46.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe epiphany-46.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4636 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_create_spdx)
NOTE: recipe epiphany-46.2-r0: task do_create_spdx: Started
NOTE: recipe epiphany-46.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 4637 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_create_runtime_spdx)
NOTE: recipe epiphany-46.2-r0: task do_create_runtime_spdx: Started
NOTE: recipe epiphany-46.2-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 4638 of 4638 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_46.2.bb:do_build)
NOTE: Tasks Summary: Attempted 4638 tasks of which 4091 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There were 32 ERROR messages, returning a non-zero exit code.
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-ptest went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.6.2-r0 to 0:5.4.6-r0) [version-going-backwards]
ERROR: xz-5.4.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1079626349227516213==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-46.0-46.2.patch"

RnJvbSA3ZjRjMGM5OWE0YjY2MDU5MjlmOTAxNWUzNzU0NWZlYzljOGRjNWNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAxMjo1MDo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVw
aXBoYW55OiB1cGdyYWRlIDQ2LjAgLT4gNDYuMgoKLS0tCiAuLi4vZXBpcGhhbnkve2VwaXBoYW55
XzQ2LjAuYmIgPT4gZXBpcGhhbnlfNDYuMi5iYn0gICAgICAgICAgIHwgMiArLQogLi4uL2ZpbGVz
LzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaCB8IDIg
Ky0KIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaCAg
ICAgICAgICAgfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdy
YXRvci5wYXRjaCAgICAgICAgICAgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhh
bnkve2VwaXBoYW55XzQ2LjAuYmIgPT4gZXBpcGhhbnlfNDYuMi5iYn0gKDk0JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDYuMC5iYiBiL21ldGEv
cmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV80Ni4yLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV80Ni4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDYuMi5i
YgppbmRleCA5MDUyZmUxNzBiLi4wMTM4MmQwZTJlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Z25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDYuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUv
ZXBpcGhhbnkvZXBpcGhhbnlfNDYuMi5iYgpAQCAtMzEsNyArMzEsNyBAQCBTUkNfVVJJID0gIiR7
R05PTUVfTUlSUk9SfS8ke0dOT01FQk59LyR7QG9lLnV0aWxzLnRyaW1fdmVyc2lvbigiJHtQVn0i
LCAxKX0vJHtHTgogICAgICAgICAgICBmaWxlOi8vbWlncmF0b3IucGF0Y2ggXAogICAgICAgICAg
ICBmaWxlOi8vZGlzdHJpYnV0b3IucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW2FyY2hp
dmUuc2hhMjU2c3VtXSA9ICJmNDM0OGYyY2Y1MWMwN2MwYzEwNmQxMzAxNzJkNGQyM2YyY2Q0MDY4
NzcxZTFkZTAwN2I3NThjYTJhZGU1NjYwIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAi
ZmI5MzJkYTdhMjRlODdmMWVkYjkwMGI1Yjk0MjUxYjQyYjM3MDgwNzUzODY0NjUxYzA1OWRjNmM5
M2NiNTA0OSIKIAogIyBEZXZlbG9wZXIgbW9kZSBlbmFibGVzIGRlYnVnZ2luZwogUEFDS0FHRUNP
TkZJR1tkZXZlbG9wZXItbW9kZV0gPSAiLURkZXZlbG9wZXJfbW9kZT10cnVlLC1EZGV2ZWxvcGVy
X21vZGU9ZmFsc2UiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmls
ZXMvMDAwMi1oZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1k
aXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaAppbmRleCBlNTA1NDY2NzY0Li40YmU2MGJhMDU2
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxw
LW1lc29uLmJ1aWxkLWRpc2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10
aGUtdXNlLW9mLXllbHAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGJkNDVjNzVmZTY5MWUy
NzVkN2E3ZDdlNjQxYWM2NmIxNTMzNjlhMWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDA3N2M3OTM1ZTAxYjk4ZWE4ZjAzZjIwMDE1NWUzYzNlOGFkYmZlMmQgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4KIERhdGU6IFdlZCwgMzEgSmFuIDIwMTggMTU6NTA6MzggKzAyMDAKIFN1YmplY3Q6IFtQQVRD
SF0gaGVscC9tZXNvbi5idWlsZDogZGlzYWJsZSB0aGUgdXNlIG9mIHllbHAKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaCBiL21l
dGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaAppbmRleCBh
MjgwMGViNjJkLi44N2JjOTUzMTI0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBp
cGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2Vw
aXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjMjk3
ZjViODlkN2M4ZTk4YWM5OGUxZDlhNzUwNmRmNmRiNmZjMDI1IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSAwODdhNmQwM2Q4MWEwYzk0YTI2Nzc4YjNlYWY4OWQxODU5NWE5YjkzIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGll
QGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBGcmksIDI2IEZlYiAyMDIxIDEwOjE3OjUyICsw
MDAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvbid0IGVuY29kZSB0aGUgZGlzdHJvIGZyb20gL2V0Yy9v
cy1yZWxlYXNlIGludG8gdGhlCkBAIC0xMSw3ICsxMSw3IEBAIFJQIDIwMjEvMi8yNgogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9t
ZXNvbi5idWlsZAotaW5kZXggZTQxNmNjNy4uZWU1ZjdiMSAxMDA2NDQKK2luZGV4IGVjNjU4ZTAu
LmQ1NGFlM2EgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKIEBA
IC0xNSw2ICsxNSw3IEBAIGlmIHIucmV0dXJuY29kZSgpID09IDAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdyYXRvci5wYXRjaCBiL21ldGEvcmVjaXBl
cy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdyYXRvci5wYXRjaAppbmRleCAxYjQ0MDRjOGNhLi42
NDNhNTUwY2U4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMv
bWlncmF0b3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL21p
Z3JhdG9yLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiMzhhNGNlYWVlYzA1ZWZiMWI4MjJk
NTJjNDM1OTBlN2ZkNTE4MTEzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjOGJlYjhm
OTcwMjU3ZGQ1YjhmZmJhNTAzZTVjNGY2NzM4Yjc4ODlhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5v
cmc+CiBEYXRlOiBUaHUsIDI1IEZlYiAyMDIxIDE0OjUyOjMyICswMDAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGVwaXBoYW55OiBGaXggcmVwcm9kdWNpYmlsaXR5IGlzc3VlCi0tIAoyLjQ0LjAKCg==

--===============1079626349227516213==--

