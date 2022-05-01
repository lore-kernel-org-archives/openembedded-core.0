Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB91FC38161
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:11 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.2286.1651434543229087128
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OYlRqfhN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010180812b5566-1e919af3-6bb0-4244-9928-8a2f3a92b980-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tYRXLOBJOSTo3eeVPp+qjUCk4O8CLTf4IxPBzMET8xo=;
	b=OYlRqfhNFbAoX4xXLAOwBgKtWPIXXOEZbyw+sDAi7NM4himMIm8niDEqGJyCIOW7
	0GQMYcLmIOHTj7BvVUqgKtyiYdQzfC0wueBXazVjTusN7yQh2YBYXKTxSwKkBnAteNK
	3AGuxXxi984wnxYcM3w8XOqgQxzgOpgmWgdqF94E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tYRXLOBJOSTo3eeVPp+qjUCk4O8CLTf4IxPBzMET8xo=;
	b=DC336YMiiJqpgTQjopFNmGAzHfpc91NjcnDOrnMj8eTMnJgv/gRjioC9NhkiNwEE
	Nlw/vFHUc/Y4OlD9vpq5w+6pGkpUfyEWb6SKQ6i8KLxXbWIGXhPlz2M803BfbPjZSbE
	h3DIo1BZFArYlcjqquGjGkVGmzKXNZ1ShoypevAQ=
Content-Type: multipart/mixed; boundary="===============2261145743205287703=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangrc.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygobject: upgrading to 3.42.1 SUCCEEDED
Message-ID: 
 <01010180812b5566-1e919af3-6bb0-4244-9928-8a2f3a92b980-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165114

--===============2261145743205287703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pygobject* to *3.42.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygobject-upgrade-3.42.0-3.42.1.patch
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
--===============2261145743205287703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pygobject/python3-pygobject: FILELIST: removed "/usr/lib/python3.10/site-packages/PyGObject-3.42.0.egg-info", added "/usr/lib/python3.10/site-packages/PyGObject-3.42.1.egg-info"
Changes to packages/core2-32-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.10/site-packages/PyGObject-3.42.0.egg-info moved to /usr/lib/python3.10/site-packages/PyGObject-3.42.1.egg-info

--===============2261145743205287703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pygobject: PKGV changed from 3.42.0 [default] to 3.42.1 [default]
packages/core2-32-poky-linux/python3-pygobject: PV changed from "3.42.0" to "3.42.1"
packages/core2-32-poky-linux/python3-pygobject: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.42/pygobject-3.42.0.tar.xz file://0001-Do-not-build-tests.patch" to "http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.42/pygobject-3.42.1.tar.xz file://0001-Do-not-build-tests.patch"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGV changed from 3.42.0 [default] to 3.42.1 [default]
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-dbg: PV changed from "3.42.0" to "3.42.1"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-dbg: PKGSIZE changed from 1018252 to 1018372 (+0%)
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-dev: PKGV changed from 3.42.0 [default] to 3.42.1 [default]
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-dev: PV changed from "3.42.0" to "3.42.1"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-doc: PKGV changed from 3.42.0 [default] to 3.42.1 [default]
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-doc: PV changed from "3.42.0" to "3.42.1"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-locale: PKGV changed from 3.42.0 [default] to 3.42.1 [default]
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-locale: PV changed from "3.42.0" to "3.42.1"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-src: PKGV changed from 3.42.0 [default] to 3.42.1 [default]
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-src: PV changed from "3.42.0" to "3.42.1"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-src: PKGSIZE changed from 921588 to 921736 (+0%)
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-staticdev: PKGV changed from 3.42.0 [default] to 3.42.1 [default]
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject-staticdev: PV changed from "3.42.0" to "3.42.1"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject: PKGV changed from 3.42.0 [default] to 3.42.1 [default]
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject: PV changed from "3.42.0" to "3.42.1"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject: FILELIST: removed "/usr/lib/python3.10/site-packages/PyGObject-3.42.0.egg-info", added "/usr/lib/python3.10/site-packages/PyGObject-3.42.1.egg-info"
packages/core2-32-poky-linux/python3-pygobject/python3-pygobject: PKGSIZE changed from 703075 to 703859 (+0%)
Changes to packages/core2-32-poky-linux/python3-pygobject (sysroot):
  /usr/lib/python3.10/site-packages/PyGObject-3.42.0.egg-info moved to /usr/lib/python3.10/site-packages/PyGObject-3.42.1.egg-info

--===============2261145743205287703==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-pygobject-upgrade-3.42.0-3.42.1.patch"

From b18e3c9d8737d8b233e09565ef28b4baf69fadc0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 10:29:58 +0000
Subject: [PATCH] python3-pygobject: upgrade 3.42.0 -> 3.42.1

---
 ...{python3-pygobject_3.42.0.bb => python3-pygobject_3.42.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.42.0.bb => python3-pygobject_3.42.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.42.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.42.1.bb
index 360996dbb7..443605ae26 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.42.1.bb
@@ -18,7 +18,7 @@ SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
     file://0001-Do-not-build-tests.patch \
 "
-SRC_URI[sha256sum] = "9b12616e32cfc792f9dc841d9c472a41a35b85ba67d3a6eb427e307a6fe4367b"
+SRC_URI[sha256sum] = "1f34b5f7624de35e44eb5a7eb428353285bd03004d55131a5f7f7fa9b90f3cc9"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.27.0


--===============2261145743205287703==--

