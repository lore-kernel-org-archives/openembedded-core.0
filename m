Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11759C38A04
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:12 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.2282.1651434543049557411
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=TRJt5AcN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010180812b5766-b1990c54-fda0-4bb8-be8d-47a9f26f4071-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vvy8OTihQME90/dJh7ySxfeaAjtX4wX3Evp+MrwvFo4=;
	b=TRJt5AcNVsGocGHllqtd9H6LGGK81FbCT884u/T1rWrwnikTUMuqly+g88AUucGi
	fgKI19w1No51w3ESV0GRP9eWP6v5Co/Z7bopjBpXivAywOEC24LsDXHiEpsBeFzapeZ
	Zh+csCGIDHBbZhbWZ/B3c7Z4MWyCzuT4U13QNdq8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434543;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vvy8OTihQME90/dJh7ySxfeaAjtX4wX3Evp+MrwvFo4=;
	b=Yak/EkBSd2N1+tkSHcAD5lEwj6Kb5ZYUmuNT7spwOBuAEshsTBVYHyjh3L2H/syX
	sO82wpRtJka9pNsKB/PvxsgF9ekQiQWb/oE3QfOkLLnCG0vg2f9zVFQ6Jp1aB8M2xn5
	kHl2xz3tB4TiK2MjccxWVjE0obeMT0zisL0O9hUo=
Content-Type: multipart/mixed; boundary="===============1016344284187863254=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpipeline: upgrading to 1.5.6 SUCCEEDED
Message-ID: 
 <01010180812b5766-b1990c54-fda0-4bb8-be8d-47a9f26f4071-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165121

--===============1016344284187863254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpipeline* to *1.5.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpipeline-upgrade-1.5.5-1.5.6.patch
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
--===============1016344284187863254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libpipeline/libpipeline: FILELIST: removed "/usr/lib/libpipeline.so.1.5.5", added "/usr/lib/libpipeline.so.1.5.6"
Changes to packages/core2-32-poky-linux/libpipeline (sysroot):
  /usr/lib/libpipeline.so.1 changed symlink target from libpipeline.so.1.5.5 to libpipeline.so.1.5.6
  /usr/lib/libpipeline.so changed symlink target from libpipeline.so.1.5.5 to libpipeline.so.1.5.6
  /usr/lib/libpipeline.so.1.5.5 moved to /usr/lib/libpipeline.so.1.5.6

--===============1016344284187863254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libpipeline: SRC_URI changed from "https://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.5.5.tar.gz" to "https://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.5.6.tar.gz"
packages/core2-32-poky-linux/libpipeline: PV changed from "1.5.5" to "1.5.6"
packages/core2-32-poky-linux/libpipeline: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-32-poky-linux/libpipeline/libpipeline-dbg: PV changed from "1.5.5" to "1.5.6"
packages/core2-32-poky-linux/libpipeline/libpipeline-dbg: FILELIST: removed "/usr/lib/.debug/libpipeline.so.1.5.5", added "/usr/lib/.debug/libpipeline.so.1.5.6"
packages/core2-32-poky-linux/libpipeline/libpipeline-dbg: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-32-poky-linux/libpipeline/libpipeline-dbg: PKGSIZE changed from 139648 to 141672 (+1%)
packages/core2-32-poky-linux/libpipeline/libpipeline-dev: PV changed from "1.5.5" to "1.5.6"
packages/core2-32-poky-linux/libpipeline/libpipeline-dev: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-32-poky-linux/libpipeline/libpipeline-doc: PV changed from "1.5.5" to "1.5.6"
packages/core2-32-poky-linux/libpipeline/libpipeline-doc: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-32-poky-linux/libpipeline/libpipeline-locale: PV changed from "1.5.5" to "1.5.6"
packages/core2-32-poky-linux/libpipeline/libpipeline-locale: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-32-poky-linux/libpipeline/libpipeline-src: PV changed from "1.5.5" to "1.5.6"
packages/core2-32-poky-linux/libpipeline/libpipeline-src: FILELIST: directory renamed /usr/src/debug/libpipeline/1.5.5-r0/build/gl/lib -> /usr/src/debug/libpipeline/1.5.6-r0/build/gl/lib, directory renamed /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/glthread -> /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/glthread, removed "/usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/sig-handler.h /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/dirname.h /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/fcntl.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/lib/debug.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/malloca.h /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/safe-read.h /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/asnprintf.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/memchr.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/ialloc.h /
 usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/xmalloc.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/exitfail.h /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/dirname-lgpl.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/stat-time.h /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/printf-args.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/xalloc.h /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/basename.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/safe-read.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/getprogname.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/basename-lgpl.h /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/exitfail.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/xalloc-die.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/basename-lgpl.c /usr/src/debug/libpipeline/1.5.5-r0/libpi
 peline-1.5.5/gl/lib/sys-limits.h /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/lib/pipeline-private.h /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/lib/pipeline.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/full-write.h /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/xstrndup.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/idx.h /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/printf-args.h /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/malloca.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/xvasprintf.h /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/xsize.h /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/xasprintf.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/error.h /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/xvasprintf.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/safe-write.h /usr/src/debug/libpipeline
 /1.5.5-r0/libpipeline-1.5.5/gl/lib/vasnprintf.h /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/printf-parse.h /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/dirname.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/tempname.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/printf-parse.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/vasnprintf.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/xstrndup.h /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/lib/appendstr.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/lib/pipeline.h /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/stripslash.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/cloexec.c /usr/src/debug/libpipeline/1.5.5-r0/libpipeline-1.5.5/gl/lib/full-write.c", added "/usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/dirname.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/lib/fatal.h /usr
 /src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/fcntl.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/dirname-lgpl.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/asnprintf.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/sig-handler.h /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/xasprintf.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/xmalloc.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/exitfail.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/printf-parse.h /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/lib/pipeline-private.h /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/full-write.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/xvasprintf.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/printf-args.h /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/basename.c /usr/src/debug/libpipeline/1.5.6-r0/libpipel
 ine-1.5.6/lib/fatal.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/xsize.h /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/basename-lgpl.h /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/safe-read.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/vasnprintf.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/ialloc.h /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/xvasprintf.h /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/safe-write.h /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/verror.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/verror.h /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/error.h /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/stat-time.h /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/xstrndup.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/getprogname.c /usr/src/debug/libpipeline/1.5.6-r0
 /libpipeline-1.5.6/gl/lib/exitfail.h /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/malloca.h /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/full-write.h /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/lib/appendstr.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/printf-parse.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/safe-read.h /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/memchr.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/tempname.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/xalloc-die.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/xalloc.h /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/xstrndup.h /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/malloca.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/printf-args.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/vasnprintf.h /usr/src/debug/lib
 pipeline/1.5.6-r0/libpipeline-1.5.6/lib/pipeline.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/dirname.h /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/sys-limits.h /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/basename-lgpl.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/cloexec.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/lib/debug.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/lib/pipeline.h /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/stripslash.c /usr/src/debug/libpipeline/1.5.6-r0/libpipeline-1.5.6/gl/lib/idx.h"
packages/core2-32-poky-linux/libpipeline/libpipeline-src: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-32-poky-linux/libpipeline/libpipeline-src: PKGSIZE changed from 783274 to 791035 (+1%)
packages/core2-32-poky-linux/libpipeline/libpipeline-staticdev: PV changed from "1.5.5" to "1.5.6"
packages/core2-32-poky-linux/libpipeline/libpipeline-staticdev: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
packages/core2-32-poky-linux/libpipeline/libpipeline: PV changed from "1.5.5" to "1.5.6"
packages/core2-32-poky-linux/libpipeline/libpipeline: FILELIST: removed "/usr/lib/libpipeline.so.1.5.5", added "/usr/lib/libpipeline.so.1.5.6"
packages/core2-32-poky-linux/libpipeline/libpipeline: PKGV changed from 1.5.5 [default] to 1.5.6 [default]
Changes to packages/core2-32-poky-linux/libpipeline (sysroot):
  /usr/lib/libpipeline.so.1 changed symlink target from libpipeline.so.1.5.5 to libpipeline.so.1.5.6
  /usr/lib/libpipeline.so changed symlink target from libpipeline.so.1.5.5 to libpipeline.so.1.5.6
  /usr/lib/libpipeline.so.1.5.5 moved to /usr/lib/libpipeline.so.1.5.6

--===============1016344284187863254==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libpipeline-upgrade-1.5.5-1.5.6.patch"

From ce6128421d5aa51a864ec59eaf431ed5da56d709 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 11:06:30 +0000
Subject: [PATCH] libpipeline: upgrade 1.5.5 -> 1.5.6

---
 .../libpipeline/{libpipeline_1.5.5.bb => libpipeline_1.5.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libpipeline/{libpipeline_1.5.5.bb => libpipeline_1.5.6.bb} (85%)

diff --git a/meta/recipes-extended/libpipeline/libpipeline_1.5.5.bb b/meta/recipes-extended/libpipeline/libpipeline_1.5.6.bb
similarity index 85%
rename from meta/recipes-extended/libpipeline/libpipeline_1.5.5.bb
rename to meta/recipes-extended/libpipeline/libpipeline_1.5.6.bb
index 67072e8c99..7007608a39 100644
--- a/meta/recipes-extended/libpipeline/libpipeline_1.5.5.bb
+++ b/meta/recipes-extended/libpipeline/libpipeline_1.5.6.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/libpipeline/libpipeline-${PV}.tar.gz"
-SRC_URI[sha256sum] = "0c8367f8b82bb721b50647a647115b6e62a37e3b2e954a9685e4d933f30c00cc"
+SRC_URI[sha256sum] = "60fbb9e7dc398528e5f3a776af57bb28ca3fe5d9f0cd8a961ac6cebfe6e9b797"
 
 inherit pkgconfig autotools
 
-- 
2.27.0


--===============1016344284187863254==--

