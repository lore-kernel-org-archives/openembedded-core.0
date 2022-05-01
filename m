Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC23C47088
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:12 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web09.2254.1651434542642921362
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=7Y+DjGjd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010180812b56d5-193e0045-8120-46e0-9515-071483b590f4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XIO3a7RTL7gxvNiUjLj4PoCa1qGmJkMC3+2617WEUs4=;
	b=7Y+DjGjdbosfMr9M2IMPXXDyAlk6UpuyTcxshk85qMpdyTVFJROaZlnjBHGNC7cj
	Cd9sb+WWyPJuD0wOaEHbfTpmyDoxA5mkohRfEp1hRZgzBJ42o2jFF5gX7r5zj0+huIo
	jnQz6t6B4YOq2D+7erJgC0yTkRr+M7YaCyE2uqeE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XIO3a7RTL7gxvNiUjLj4PoCa1qGmJkMC3+2617WEUs4=;
	b=RwYT3/FdNqCrbORrTbbjhd3kRKPbR+War9VXEp0IghlBWxbLPiL7EgKjjZw6YuyG
	67woC7701T9r3seVHkvDlc+FzLeuT+iy8B/4+Zm4TbI5PH8A5XdbWEzIo4ms9QI9tEa
	rM60qEXnqeyIGxlf8O0EPiVs7+/BS8tIOkCF+0jI=
Content-Type: multipart/mixed; boundary="===============4047943659818160874=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vala: upgrading to 0.56.1 SUCCEEDED
Message-ID: 
 <01010180812b56d5-193e0045-8120-46e0-9515-071483b590f4-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165120

--===============4047943659818160874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vala* to *0.56.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vala-upgrade-0.56.0-0.56.1.patch
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
--===============4047943659818160874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/vala (sysroot):
  /usr/share/vala-0.56/vapi/gtk4-wayland.deps was added
  /usr/share/vala-0.56/vapi/gtk4-wayland.vapi was added
  /usr/share/vala-0.56/vapi/gtk4-x11.deps was added
  /usr/share/vala-0.56/vapi/gtk4-x11.vapi was added
packages/core2-32-poky-linux/vala/vala: FILELIST: added "/usr/share/vala-0.56/vapi/gtk4-x11.vapi /usr/share/vala-0.56/vapi/gtk4-wayland.deps /usr/share/vala-0.56/vapi/gtk4-x11.deps /usr/share/vala-0.56/vapi/gtk4-wayland.vapi"
Changes to packages/x86_64-linux/vala-native (sysroot):
  /usr/share/vala-0.56/vapi/gtk4-wayland.deps was added
  /usr/share/vala-0.56/vapi/gtk4-wayland.vapi was added
  /usr/share/vala-0.56/vapi/gtk4-x11.deps was added
  /usr/share/vala-0.56/vapi/gtk4-x11.vapi was added

--===============4047943659818160874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vala: PKGV changed from 0.56.0 [default] to 0.56.1 [default]
packages/core2-32-poky-linux/vala: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.0.tar.xz" to "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.1.tar.xz"
packages/core2-32-poky-linux/vala: PV changed from "0.56.0" to "0.56.1"
Changes to packages/core2-32-poky-linux/vala (sysroot):
  /usr/share/vala-0.56/vapi/gtk4-wayland.deps was added
  /usr/share/vala-0.56/vapi/gtk4-wayland.vapi was added
  /usr/share/vala-0.56/vapi/gtk4-x11.deps was added
  /usr/share/vala-0.56/vapi/gtk4-x11.vapi was added
packages/core2-32-poky-linux/vala/vala-dbg: PKGSIZE changed from 15845328 to 15852212 (+0%)
packages/core2-32-poky-linux/vala/vala-dbg: PKGV changed from 0.56.0 [default] to 0.56.1 [default]
packages/core2-32-poky-linux/vala/vala-dbg: PV changed from "0.56.0" to "0.56.1"
packages/core2-32-poky-linux/vala/vala-dev: PKGV changed from 0.56.0 [default] to 0.56.1 [default]
packages/core2-32-poky-linux/vala/vala-dev: PV changed from "0.56.0" to "0.56.1"
packages/core2-32-poky-linux/vala/vala-doc: PKGV changed from 0.56.0 [default] to 0.56.1 [default]
packages/core2-32-poky-linux/vala/vala-doc: PV changed from "0.56.0" to "0.56.1"
packages/core2-32-poky-linux/vala/vala-locale: PKGV changed from 0.56.0 [default] to 0.56.1 [default]
packages/core2-32-poky-linux/vala/vala-locale: PV changed from "0.56.0" to "0.56.1"
packages/core2-32-poky-linux/vala/vala-src: PKGSIZE changed from 15472586 to 15478348 (+0%)
packages/core2-32-poky-linux/vala/vala-src: PKGV changed from 0.56.0 [default] to 0.56.1 [default]
packages/core2-32-poky-linux/vala/vala-src: PV changed from "0.56.0" to "0.56.1"
packages/core2-32-poky-linux/vala/vala-staticdev: PKGV changed from 0.56.0 [default] to 0.56.1 [default]
packages/core2-32-poky-linux/vala/vala-staticdev: PV changed from "0.56.0" to "0.56.1"
packages/core2-32-poky-linux/vala/vala: PKGSIZE changed from 13040882 to 13052704 (+0%)
packages/core2-32-poky-linux/vala/vala: FILELIST: added "/usr/share/vala-0.56/vapi/gtk4-x11.deps /usr/share/vala-0.56/vapi/gtk4-x11.vapi /usr/share/vala-0.56/vapi/gtk4-wayland.vapi /usr/share/vala-0.56/vapi/gtk4-wayland.deps"
packages/core2-32-poky-linux/vala/vala: PKGV changed from 0.56.0 [default] to 0.56.1 [default]
packages/core2-32-poky-linux/vala/vala: PV changed from "0.56.0" to "0.56.1"
Changes to packages/x86_64-linux/vala-native (sysroot):
  /usr/share/vala-0.56/vapi/gtk4-wayland.deps was added
  /usr/share/vala-0.56/vapi/gtk4-wayland.vapi was added
  /usr/share/vala-0.56/vapi/gtk4-x11.deps was added
  /usr/share/vala-0.56/vapi/gtk4-x11.vapi was added

--===============4047943659818160874==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-vala-upgrade-0.56.0-0.56.1.patch"

From 5db0acedac90d06f10923585a0844c40e49c0b7e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 10:56:04 +0000
Subject: [PATCH] vala: upgrade 0.56.0 -> 0.56.1

---
 meta/recipes-devtools/vala/{vala_0.56.0.bb => vala_0.56.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.56.0.bb => vala_0.56.1.bb} (18%)

diff --git a/meta/recipes-devtools/vala/vala_0.56.0.bb b/meta/recipes-devtools/vala/vala_0.56.1.bb
similarity index 18%
rename from meta/recipes-devtools/vala/vala_0.56.0.bb
rename to meta/recipes-devtools/vala/vala_0.56.1.bb
index a4d6760f10..48d21685e8 100644
--- a/meta/recipes-devtools/vala/vala_0.56.0.bb
+++ b/meta/recipes-devtools/vala/vala_0.56.1.bb
@@ -1,3 +1,3 @@
 require ${BPN}.inc
 
-SRC_URI[sha256sum] = "d92bd13c5630905eeb6a983dcb702204da9731460c2a6e4e39f867996f371040"
+SRC_URI[sha256sum] = "c518b81dfdda82d1cdf586b3f9b2323162cb96bd3cb5a2c03650cea025d91fb9"
-- 
2.27.0


--===============4047943659818160874==--

