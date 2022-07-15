Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE42C2BBE6
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:54 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.903.1657900668358078622
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=idXo8nh/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 010101820294930c-033f0ee5-a96c-4e3c-a649-5e643e7816a5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=684F2fOLZbmil9GHJ6iMnv+xUWGgEvz5fZqE+XxD6MY=;
	b=idXo8nh/U0yPKz6PpAqYDadBTbos0qQIJBMOoShtGlMSkAb9igjfjLH7mG1d5b28
	5Xrr5VfLbhskDjY6JmTiCuwHjcCI61C60jZ3t4BMyHbXArnyf5sb2ZN55iy3pyzwXWg
	bC/GsKsMw2X8Cm2lWrR/VDW4a/QqcSDRXDZysnJE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=684F2fOLZbmil9GHJ6iMnv+xUWGgEvz5fZqE+XxD6MY=;
	b=TOTuXfhHyQYJJdtlEif2rF0XwjG4UpRliNLIR3iDtvuGb/U6X/nj5799jUm4hW2O
	ALA4ZJn2xgltd9qNxstqYAWiZFY9P2eyq3us4lCGGbfFULqj/kZiqwkOt7Z/RkJzqc+
	QEbGUqZqyRT+WbQFsWz0W+sZTn8SNPdlZCHrPaXo=
Content-Type: multipart/mixed; boundary="===============6909773538850342655=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vala: upgrading to 0.56.2 SUCCEEDED
Message-ID: 
 <010101820294930c-033f0ee5-a96c-4e3c-a649-5e643e7816a5-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168082

--===============6909773538850342655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vala* to *0.56.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vala-upgrade-0.56.1-0.56.2.patch
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
--===============6909773538850342655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vala: PKGV changed from 0.56.1 [default] to 0.56.2 [default]
packages/core2-32-poky-linux/vala: PV changed from "0.56.1" to "0.56.2"
packages/core2-32-poky-linux/vala: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.1.tar.xz" to "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.2.tar.xz"
Changes to packages/core2-32-poky-linux/vala (sysroot):
  /usr/share/vala-0.56/vapi/geocode-glib-2.0.deps was added
  /usr/share/vala-0.56/vapi/geocode-glib-2.0.vapi was added
  /usr/share/vala-0.56/vapi/rest-1.0.deps was added
  /usr/share/vala-0.56/vapi/rest-1.0.vapi was added
  /usr/share/vala-0.56/vapi/rest-extras-1.0.deps was added
  /usr/share/vala-0.56/vapi/rest-extras-1.0.vapi was added
  /usr/share/vala-0.56/vapi/wayland-client.vapi was added
packages/core2-32-poky-linux/vala/vala-dbg: PKGV changed from 0.56.1 [default] to 0.56.2 [default]
packages/core2-32-poky-linux/vala/vala-dbg: PV changed from "0.56.1" to "0.56.2"
packages/core2-32-poky-linux/vala/vala-dbg: PKGSIZE changed from 15442244 to 15447840 (+0%)
packages/core2-32-poky-linux/vala/vala-dev: PKGV changed from 0.56.1 [default] to 0.56.2 [default]
packages/core2-32-poky-linux/vala/vala-dev: PV changed from "0.56.1" to "0.56.2"
packages/core2-32-poky-linux/vala/vala-doc: PKGV changed from 0.56.1 [default] to 0.56.2 [default]
packages/core2-32-poky-linux/vala/vala-doc: PV changed from "0.56.1" to "0.56.2"
packages/core2-32-poky-linux/vala/vala-doc: PKGSIZE changed from 10307 to 10304 (-0%)
packages/core2-32-poky-linux/vala/vala-locale: PKGV changed from 0.56.1 [default] to 0.56.2 [default]
packages/core2-32-poky-linux/vala/vala-locale: PV changed from "0.56.1" to "0.56.2"
packages/core2-32-poky-linux/vala/vala-src: PKGV changed from 0.56.1 [default] to 0.56.2 [default]
packages/core2-32-poky-linux/vala/vala-src: PV changed from "0.56.1" to "0.56.2"
packages/core2-32-poky-linux/vala/vala-src: PKGSIZE changed from 15478348 to 15485258 (+0%)
packages/core2-32-poky-linux/vala/vala-staticdev: PKGV changed from 0.56.1 [default] to 0.56.2 [default]
packages/core2-32-poky-linux/vala/vala-staticdev: PV changed from "0.56.1" to "0.56.2"
packages/core2-32-poky-linux/vala/vala: PKGV changed from 0.56.1 [default] to 0.56.2 [default]
packages/core2-32-poky-linux/vala/vala: PV changed from "0.56.1" to "0.56.2"
packages/core2-32-poky-linux/vala/vala: PKGSIZE changed from 13028128 to 13073034 (+0%)
packages/core2-32-poky-linux/vala/vala: FILELIST: added "/usr/share/vala-0.56/vapi/rest-1.0.vapi /usr/share/vala-0.56/vapi/wayland-client.vapi /usr/share/vala-0.56/vapi/geocode-glib-2.0.deps /usr/share/vala-0.56/vapi/rest-1.0.deps /usr/share/vala-0.56/vapi/rest-extras-1.0.vapi /usr/share/vala-0.56/vapi/rest-extras-1.0.deps /usr/share/vala-0.56/vapi/geocode-glib-2.0.vapi"
Changes to packages/x86_64-linux/vala-native (sysroot):
  /usr/share/vala-0.56/vapi/geocode-glib-2.0.deps was added
  /usr/share/vala-0.56/vapi/geocode-glib-2.0.vapi was added
  /usr/share/vala-0.56/vapi/rest-1.0.deps was added
  /usr/share/vala-0.56/vapi/rest-1.0.vapi was added
  /usr/share/vala-0.56/vapi/rest-extras-1.0.deps was added
  /usr/share/vala-0.56/vapi/rest-extras-1.0.vapi was added
  /usr/share/vala-0.56/vapi/wayland-client.vapi was added

--===============6909773538850342655==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-vala-upgrade-0.56.1-0.56.2.patch"

From b01215959fcac7c4f358785e3d1783984038de5e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 08:51:36 +0000
Subject: [PATCH] vala: upgrade 0.56.1 -> 0.56.2

---
 meta/recipes-devtools/vala/{vala_0.56.1.bb => vala_0.56.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.56.1.bb => vala_0.56.2.bb} (18%)

diff --git a/meta/recipes-devtools/vala/vala_0.56.1.bb b/meta/recipes-devtools/vala/vala_0.56.2.bb
similarity index 18%
rename from meta/recipes-devtools/vala/vala_0.56.1.bb
rename to meta/recipes-devtools/vala/vala_0.56.2.bb
index 48d21685e8..08c8ccca1d 100644
--- a/meta/recipes-devtools/vala/vala_0.56.1.bb
+++ b/meta/recipes-devtools/vala/vala_0.56.2.bb
@@ -1,3 +1,3 @@
 require ${BPN}.inc
 
-SRC_URI[sha256sum] = "c518b81dfdda82d1cdf586b3f9b2323162cb96bd3cb5a2c03650cea025d91fb9"
+SRC_URI[sha256sum] = "66c9619bb17859fd1ac3aba0a57970613e38fd2a1ee30541174260c9fb90124c"
-- 
2.31.1


--===============6909773538850342655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/vala (sysroot):
  /usr/share/vala-0.56/vapi/geocode-glib-2.0.deps was added
  /usr/share/vala-0.56/vapi/geocode-glib-2.0.vapi was added
  /usr/share/vala-0.56/vapi/rest-1.0.deps was added
  /usr/share/vala-0.56/vapi/rest-1.0.vapi was added
  /usr/share/vala-0.56/vapi/rest-extras-1.0.deps was added
  /usr/share/vala-0.56/vapi/rest-extras-1.0.vapi was added
  /usr/share/vala-0.56/vapi/wayland-client.vapi was added
packages/core2-32-poky-linux/vala/vala: FILELIST: added "/usr/share/vala-0.56/vapi/wayland-client.vapi /usr/share/vala-0.56/vapi/rest-extras-1.0.vapi /usr/share/vala-0.56/vapi/geocode-glib-2.0.vapi /usr/share/vala-0.56/vapi/rest-1.0.deps /usr/share/vala-0.56/vapi/rest-1.0.vapi /usr/share/vala-0.56/vapi/rest-extras-1.0.deps /usr/share/vala-0.56/vapi/geocode-glib-2.0.deps"
Changes to packages/x86_64-linux/vala-native (sysroot):
  /usr/share/vala-0.56/vapi/geocode-glib-2.0.deps was added
  /usr/share/vala-0.56/vapi/geocode-glib-2.0.vapi was added
  /usr/share/vala-0.56/vapi/rest-1.0.deps was added
  /usr/share/vala-0.56/vapi/rest-1.0.vapi was added
  /usr/share/vala-0.56/vapi/rest-extras-1.0.deps was added
  /usr/share/vala-0.56/vapi/rest-extras-1.0.vapi was added
  /usr/share/vala-0.56/vapi/wayland-client.vapi was added

--===============6909773538850342655==--

