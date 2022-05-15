Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88599C3A5A3
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web09.19057.1652634914826576835
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=f2NWPe7Q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 01010180c8b78cd7-feef95dc-33b7-434b-ac73-472598aef2f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KUfDUac2Y/oc4wgGIznfeRyb9eSsXkwjcoOvaVyHdTg=;
	b=f2NWPe7Qx5ErDIAiRijJ6bYN76DmHS+/DYJ2lxIW9XmeXmvjfpNDJ4RwJadp0Y0P
	GI72nTr0JVhWQYCCsdVppoWzN/fFm5Re0pJB6WvQA8PIZ4UwIgqXqfFqLCFugASr56u
	KbjRgZMOeIGthTbot+3F8Rng11lwvgU1Ivl7WgwA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KUfDUac2Y/oc4wgGIznfeRyb9eSsXkwjcoOvaVyHdTg=;
	b=T3Lbd44LGAGTiqqEOTXH+n0HJr5KnK17P6UyYbNgj1RlMP6FjH3tPH3qSiDnZeH8
	y8Dibo3ZWbJJYRSYkw0uh4OzbDl2wsxRAawfoLhlaLqHFgvlBqbJfYzI/TYXtOvFckt
	djHtR8W/kLJiMJEgkfGjdgtTY+6MjRBujVH81FD0=
Content-Type: multipart/mixed; boundary="===============5748347777069398246=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-rtsp-server: upgrading to 1.20.2 SUCCEEDED
Message-ID: 
 <01010180c8b78cd7-feef95dc-33b7-434b-ac73-472598aef2f5-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:14 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165646

--===============5748347777069398246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-rtsp-server* to *1.20.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-rtsp-server-upgrade-1.20.1-1.20.2.patch
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
--===============5748347777069398246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: FILELIST: removed "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2001.0", added "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2002.0"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGSIZE changed from 1150796 to 1151428 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PKGSIZE changed from 984619 to 984620 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PKGSIZE changed from 1165872 to 1165956 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.20.1.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.20.2.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2001.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2002.0"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILES: removed "/usr/lib/libgstrtspserver-1.0.so.0.2001.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2002.0"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PV changed from "1.20.1" to "1.20.2"
Changes to packages/core2-32-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2001.0 to libgstrtspserver-1.0.so.0.2002.0
  /usr/lib/libgstrtspserver-1.0.so.0.2001.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2002.0

--===============5748347777069398246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2001.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2002.0"
Changes to packages/core2-32-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2001.0 to libgstrtspserver-1.0.so.0.2002.0
  /usr/lib/libgstrtspserver-1.0.so.0.2001.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2002.0

--===============5748347777069398246==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-rtsp-server-upgrade-1.20.1-1.20.2.patch"

From 0549530c7a3f3a7c488e85e28fdb1c6e776ac167 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 15:29:04 +0000
Subject: [PATCH] gstreamer1.0-rtsp-server: upgrade 1.20.1 -> 1.20.2

---
 ...rtsp-server_1.20.1.bb => gstreamer1.0-rtsp-server_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.1.bb => gstreamer1.0-rtsp-server_1.20.2.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.2.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.2.bb
index 90d788ab80..fd6e16c2bf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.2.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "4745bc528ad7de711a41d576ddce7412266e66d05c4cfcc636c9ba4da5521509"
+SRC_URI[sha256sum] = "6a8e9d136bbee4fc03858a0680dd5cbf91e2e989c43da115858eb21fb1adbcab"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.31.1


--===============5748347777069398246==--

