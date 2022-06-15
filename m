Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 651E6CCA47E
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:45 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.4414.1655298220237833708
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WNS7eaNg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 0101018167765c80-0fc1d287-fc3c-465e-9afa-73f18e915fc5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2kQyBlJN5ldKSUX1PjQcL9Hp/FbL/QHDI0lw4apoQFA=;
	b=WNS7eaNgBL+6gUeOCdye+ErVMt5UgqgVAfpvYH94L+TjPbx6N+3uJ23qe3EUd/8x
	Yvs7JJNGpTX4HYhgu37L2wqe8/jeKdPXNvqdrGFJqcFbonqWfMwe32xNGOklu5zN66K
	bM/EGJZwXiLVFl4+0giTXZ6L6v+k/3AfqkFseJi4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298219;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2kQyBlJN5ldKSUX1PjQcL9Hp/FbL/QHDI0lw4apoQFA=;
	b=iZ8+EYlX3yZfZrutihFTv1pr24ZapOy6Ao7bzJ17k+zhVKbJJvmnGu9BziYlg2ZR
	WrI4AoQBQo2+G9rkGyJVG7RQk5Bq3MicoahG/FgaAvogQJl4gkUu1hrQf0yXB2hRmBf
	AlxlnHxt9HgrNwmjZaLvSktmvL8mxX3aKnJorKT0=
Content-Type: multipart/mixed; boundary="===============6690827511343120061=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 5.18.1 SUCCEEDED
Message-ID: 
 <0101018167765c80-0fc1d287-fc3c-465e-9afa-73f18e915fc5-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:39 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166937

--===============6690827511343120061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *5.18.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-5.18-5.18.1.patch
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
--===============6690827511343120061==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-5.18-5.18.1.patch"

From 4a98523f5d1219292a0fc0bf894910d2d6008b22 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 06:45:14 +0000
Subject: [PATCH] btrfs-tools: upgrade 5.18 -> 5.18.1

---
 .../btrfs-tools/{btrfs-tools_5.18.bb => btrfs-tools_5.18.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.18.bb => btrfs-tools_5.18.1.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.1.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.1.bb
index f5120d3980..816fc17ae1 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.18.1.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "f9e303584272b81b05b926a0cc9010f43af12a03"
+SRCREV = "47b5cf867fc37411ef51eb5c09893a95f7f6c3b7"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.31.1


--===============6690827511343120061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 5.18 [default] to 5.18.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 17223112 to 17196768 (-0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "5.18" to "5.18.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 5.18 [default] to 5.18.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 227688 to 217676 (-4%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: FILELIST: removed "/usr/include/btrfs/extent-cache.h /usr/include/btrfs/extent_io.h"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "5.18" to "5.18.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 5.18 [default] to 5.18.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "5.18" to "5.18.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 5.18 [default] to 5.18.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "5.18" to "5.18.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 5.18 [default] to 5.18.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 3513822 to 3614355 (+3%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: FILELIST: directory renamed /usr/src/debug/btrfs-tools/5.18-r0/git/kernel-lib -> /usr/src/debug/btrfs-tools/5.18.1-r0/git/kernel-lib, directory renamed /usr/src/debug/btrfs-tools/5.18-r0/git/kernel-shared -> /usr/src/debug/btrfs-tools/5.18.1-r0/git/kernel-shared, directory renamed /usr/src/debug/btrfs-tools/5.18-r0/git/convert -> /usr/src/debug/btrfs-tools/5.18.1-r0/git/convert, directory renamed /usr/src/debug/btrfs-tools/5.18-r0/git/check -> /usr/src/debug/btrfs-tools/5.18.1-r0/git/check, directory renamed /usr/src/debug/btrfs-tools/5.18-r0/git/crypto -> /usr/src/debug/btrfs-tools/5.18.1-r0/git/crypto, directory renamed /usr/src/debug/btrfs-tools/5.18-r0/git/image -> /usr/src/debug/btrfs-tools/5.18.1-r0/git/image, directory renamed /usr/src/debug/btrfs-tools/5.18-r0/git/libbtrfsutil/python -> /usr/src/debug/btrfs-tools/5.18.1-r0/git/libbtrfsutil/python, directory renamed /usr/src/debug/btrfs-tools/5.18-r0/git -> /usr/src/deb
 ug/btrfs-tools/5.18.1-r0/git, directory renamed /usr/src/debug/btrfs-tools/5.18-r0/git/libbtrfsutil -> /usr/src/debug/btrfs-tools/5.18.1-r0/git/libbtrfsutil, directory renamed /usr/src/debug/btrfs-tools/5.18-r0/git/common -> /usr/src/debug/btrfs-tools/5.18.1-r0/git/common, directory renamed /usr/src/debug/btrfs-tools/5.18-r0/git/cmds -> /usr/src/debug/btrfs-tools/5.18.1-r0/git/cmds, directory renamed /usr/src/debug/btrfs-tools/5.18-r0/git/mkfs -> /usr/src/debug/btrfs-tools/5.18.1-r0/git/mkfs, removed "/usr/src/debug/btrfs-tools/5.18-r0/git/libbtrfs/send-utils.c /usr/src/debug/btrfs-tools/5.18-r0/git/libbtrfs/send-utils.h /usr/src/debug/btrfs-tools/5.18-r0/git/libbtrfs/send-stream.c /usr/src/debug/btrfs-tools/5.18-r0/git/libbtrfs/send-stream.h", added "/usr/src/debug/btrfs-tools/5.18.1-r0/git/libbtrfs/ctree.h /usr/src/debug/btrfs-tools/5.18.1-r0/git/libbtrfs/send-stream.c /usr/src/debug/btrfs-tools/5.18.1-r0/git/libbtrfs/send.h /usr/src/debug/btrfs-tools/5.18.1-r0/git/libbtrfs/send-s
 tream.h /usr/src/debug/btrfs-tools/5.18.1-r0/git/libbtrfs/send-utils.c /usr/src/debug/btrfs-tools/5.18.1-r0/git/libbtrfs/send-utils.h"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "5.18" to "5.18.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 5.18 [default] to 5.18.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "5.18" to "5.18.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 5.18 [default] to 5.18.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 6057325 to 6057327 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PV changed from "5.18" to "5.18.1"
packages/core2-32-poky-linux/btrfs-tools: PKGV changed from 5.18 [default] to 5.18.1 [default]
packages/core2-32-poky-linux/btrfs-tools: PV changed from "5.18" to "5.18.1"
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.10/site-packages/btrfsutil-5.18.1-py3.10.egg-info was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.18.1-py3.10.egg-info/dependency_links.txt was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.18.1-py3.10.egg-info/PKG-INFO was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.18.1-py3.10.egg-info/SOURCES.txt was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.18.1-py3.10.egg-info/top_level.txt was added
  /usr/include/btrfs/extent-cache.h was removed
  /usr/include/btrfs/extent_io.h was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.18-py3.10.egg-info was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.18-py3.10.egg-info/dependency_links.txt was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.18-py3.10.egg-info/PKG-INFO was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.18-py3.10.egg-info/SOURCES.txt was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.18-py3.10.egg-info/top_level.txt was removed

--===============6690827511343120061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: FILELIST: removed "/usr/include/btrfs/extent-cache.h /usr/include/btrfs/extent_io.h"
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.10/site-packages/btrfsutil-5.18.1-py3.10.egg-info was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.18.1-py3.10.egg-info/dependency_links.txt was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.18.1-py3.10.egg-info/PKG-INFO was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.18.1-py3.10.egg-info/SOURCES.txt was added
  /usr/lib/python3.10/site-packages/btrfsutil-5.18.1-py3.10.egg-info/top_level.txt was added
  /usr/include/btrfs/extent-cache.h was removed
  /usr/include/btrfs/extent_io.h was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.18-py3.10.egg-info was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.18-py3.10.egg-info/dependency_links.txt was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.18-py3.10.egg-info/PKG-INFO was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.18-py3.10.egg-info/SOURCES.txt was removed
  /usr/lib/python3.10/site-packages/btrfsutil-5.18-py3.10.egg-info/top_level.txt was removed

--===============6690827511343120061==--

