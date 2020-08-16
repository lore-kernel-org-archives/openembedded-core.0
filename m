Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.19853.1597558871111538639
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF031E02022; Sat, 15 Aug 2020 23:21:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D48A9E02042
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:38 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rsync: upgrading to 3.2.3 SUCCEEDED
Message-Id: <20200816062110.EF031E02022@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:21:10 -0700 (PDT)
X-Groupsio-MsgNum: 141487
Content-Type: multipart/mixed; boundary="===============4423131063269129063=="

--===============4423131063269129063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rsync* to *3.2.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rsync-upgrade-3.2.2-3.2.3.patch
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

--===============4423131063269129063==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-rsync-upgrade-3.2.2-3.2.3.patch"

From 97f644677719dbcc16d6497ab2a7918e0918cfd8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 Aug 2020 17:50:39 +0000
Subject: [PATCH] rsync: upgrade 3.2.2 -> 3.2.3

---
 meta/recipes-devtools/rsync/{rsync_3.2.2.bb => rsync_3.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/rsync/{rsync_3.2.2.bb => rsync_3.2.3.bb} (95%)

diff --git a/meta/recipes-devtools/rsync/rsync_3.2.2.bb b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
similarity index 95%
rename from meta/recipes-devtools/rsync/rsync_3.2.2.bb
rename to meta/recipes-devtools/rsync/rsync_3.2.3.bb
index 182628f4b4..375efa0dea 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.2.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://makefile-no-rebuild.patch \
            "
 
-SRC_URI[sha256sum] = "644bd3841779507665211fd7db8359c8a10670c57e305b4aab61b4e40037afa8"
+SRC_URI[sha256sum] = "becc3c504ceea499f4167a260040ccf4d9f2ef9499ad5683c179a697146ce50e"
 
 # -16548 required for v3.1.3pre1. Already in v3.1.3.
 CVE_CHECK_WHITELIST += " CVE-2017-16548 "
-- 
2.17.1


--===============4423131063269129063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/rsync: PKGV changed from 3.2.2 [default] to 3.2.3 [default]
packages/core2-32-poky-linux/rsync: PV changed from "3.2.2" to "3.2.3"
packages/core2-32-poky-linux/rsync/rsync-dbg: PKGV changed from 3.2.2 [default] to 3.2.3 [default]
packages/core2-32-poky-linux/rsync/rsync-dbg: PKGSIZE changed from 1252888 to 1274088 (+2%)
packages/core2-32-poky-linux/rsync/rsync-dbg: PV changed from "3.2.2" to "3.2.3"
packages/core2-32-poky-linux/rsync/rsync-dev: PKGV changed from 3.2.2 [default] to 3.2.3 [default]
packages/core2-32-poky-linux/rsync/rsync-dev: PV changed from "3.2.2" to "3.2.3"
packages/core2-32-poky-linux/rsync/rsync-doc: PKGV changed from 3.2.2 [default] to 3.2.3 [default]
packages/core2-32-poky-linux/rsync/rsync-doc: PKGSIZE changed from 260696 to 266534 (+2%)
packages/core2-32-poky-linux/rsync/rsync-doc: PV changed from "3.2.2" to "3.2.3"
packages/core2-32-poky-linux/rsync/rsync-locale: PKGV changed from 3.2.2 [default] to 3.2.3 [default]
packages/core2-32-poky-linux/rsync/rsync-locale: PV changed from "3.2.2" to "3.2.3"
packages/core2-32-poky-linux/rsync/rsync-src: PKGV changed from 3.2.2 [default] to 3.2.3 [default]
packages/core2-32-poky-linux/rsync/rsync-src: PKGSIZE changed from 1575777 to 1595040 (+1%)
packages/core2-32-poky-linux/rsync/rsync-src: FILELIST: directory renamed /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/zlib -> /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/zlib, directory renamed /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/lib -> /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/lib, removed "/usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/generator.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/socket.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/inums.h /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/delete.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/xattrs.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/batch.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/sender.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/util.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/clientserver.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/access.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/daemon-parm.h /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/compat.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/pipe.c /usr/src/debug/rsync/3.2
 .2-r0/rsync-3.2.2/receiver.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/byteorder.h /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/token.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/progress.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/backup.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/hlink.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/ifuncs.h /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/loadparm.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/flist.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/match.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/cleanup.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/rsync.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/help-rsyncd.h /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/syscall.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/acls.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/clientname.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/authenticate.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/rsync.h /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/help-rsync.h /usr/src/debug/rsync/3
 .2.2-r0/rsync-3.2.2/fileio.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/chmod.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/checksum.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/itypes.h /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/options.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/log.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/proto.h /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/connection.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/io.h /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/main.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/exclude.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/hashtable.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/util2.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/params.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/uidlist.c /usr/src/debug/rsync/3.2.2-r0/rsync-3.2.2/io.c", added "/usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/syscall.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/flist.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/log.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.
 3/acls.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/ifuncs.h /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/pipe.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/fileio.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/itypes.h /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/delete.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/exclude.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/io.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/connection.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/clientserver.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/options.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/checksum.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/clientname.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/hashtable.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/loadparm.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/backup.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/daemon-parm.h /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/authenticate.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/uidlist.c /usr/src/debug/rsync/3.2.3-r0/rsy
 nc-3.2.3/proto.h /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/help-rsync.h /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/help-rsyncd.h /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/token.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/progress.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/socket.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/usage.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/chmod.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/main.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/byteorder.h /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/access.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/batch.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/hlink.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/util.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/rsync.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/params.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/compat.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/util2.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/io.h /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/cleanup.c /us
 r/src/debug/rsync/3.2.3-r0/rsync-3.2.3/rsync.h /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/xattrs.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/inums.h /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/sender.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/match.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/generator.c /usr/src/debug/rsync/3.2.3-r0/rsync-3.2.3/receiver.c"
packages/core2-32-poky-linux/rsync/rsync-src: PV changed from "3.2.2" to "3.2.3"
packages/core2-32-poky-linux/rsync/rsync-staticdev: PKGV changed from 3.2.2 [default] to 3.2.3 [default]
packages/core2-32-poky-linux/rsync/rsync-staticdev: PV changed from "3.2.2" to "3.2.3"
packages/core2-32-poky-linux/rsync/rsync: PKGV changed from 3.2.2 [default] to 3.2.3 [default]
packages/core2-32-poky-linux/rsync/rsync: PKGSIZE changed from 605580 to 614124 (+1%)
packages/core2-32-poky-linux/rsync/rsync: PV changed from "3.2.2" to "3.2.3"

--===============4423131063269129063==--
