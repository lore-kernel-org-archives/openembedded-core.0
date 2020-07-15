Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.70.1594831378724495914
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 09:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 96CA1E01EA3; Wed, 15 Jul 2020 09:42:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2A2D9E01E8D
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 09:42:57 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libuv: upgrading to 1.38.1 SUCCEEDED
Message-Id: <20200715164258.96CA1E01EA3@yocto-www.yoctoproject.org>
Date: Wed, 15 Jul 2020 09:42:58 -0700 (PDT)
X-Groupsio-MsgNum: 140641
Content-Type: multipart/mixed; boundary="===============7550007933180245744=="

--===============7550007933180245744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libuv* to *1.38.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libuv-upgrade-1.38.0-1.38.1.patch
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

--===============7550007933180245744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libuv: PV changed from "1.38.0" to "1.38.1"
packages/core2-32-poky-linux/libuv: PKGV changed from 1.38.0 [default] to 1.38.1 [default]
packages/core2-32-poky-linux/libuv/libuv-dbg: PV changed from "1.38.0" to "1.38.1"
packages/core2-32-poky-linux/libuv/libuv-dbg: PKGV changed from 1.38.0 [default] to 1.38.1 [default]
packages/core2-32-poky-linux/libuv/libuv-dbg: PKGSIZE changed from 600456 to 598712 (-0%)
packages/core2-32-poky-linux/libuv/libuv-dev: PV changed from "1.38.0" to "1.38.1"
packages/core2-32-poky-linux/libuv/libuv-dev: PKGV changed from 1.38.0 [default] to 1.38.1 [default]
packages/core2-32-poky-linux/libuv/libuv-doc: PV changed from "1.38.0" to "1.38.1"
packages/core2-32-poky-linux/libuv/libuv-doc: PKGV changed from 1.38.0 [default] to 1.38.1 [default]
packages/core2-32-poky-linux/libuv/libuv-locale: PV changed from "1.38.0" to "1.38.1"
packages/core2-32-poky-linux/libuv/libuv-locale: PKGV changed from 1.38.0 [default] to 1.38.1 [default]
packages/core2-32-poky-linux/libuv/libuv-src: PV changed from "1.38.0" to "1.38.1"
packages/core2-32-poky-linux/libuv/libuv-src: PKGV changed from 1.38.0 [default] to 1.38.1 [default]
packages/core2-32-poky-linux/libuv/libuv-src: FILELIST: directory renamed /usr/src/debug/libuv/1.38.0-r0/git/src -> /usr/src/debug/libuv/1.38.1-r0/git/src, directory renamed /usr/src/debug/libuv/1.38.0-r0/git/include -> /usr/src/debug/libuv/1.38.1-r0/git/include, directory renamed /usr/src/debug/libuv/1.38.0-r0/git/include/uv -> /usr/src/debug/libuv/1.38.1-r0/git/include/uv, removed "/usr/src/debug/libuv/1.38.0-r0/git/src/unix/pipe.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/getaddrinfo.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/internal.h /usr/src/debug/libuv/1.38.0-r0/git/src/unix/signal.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/proctitle.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/thread.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/getnameinfo.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/poll.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/fs.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/dl.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/async.c /usr/src/debug/lib
 uv/1.38.0-r0/git/src/unix/procfs-exepath.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/udp.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/linux-inotify.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/random-devurandom.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/loop-watcher.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/stream.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/atomic-ops.h /usr/src/debug/libuv/1.38.0-r0/git/src/unix/random-sysctl-linux.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/loop.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/tcp.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/sysinfo-loadavg.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/core.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/random-getrandom.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/linux-core.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/spinlock.h /usr/src/debug/libuv/1.38.0-r0/git/src/unix/linux-syscalls.h /usr/src/debug/libuv/1.38.0-r0/git/src/unix/linux-syscalls.c /usr/src/debug/libuv/1.38.
 0-r0/git/src/unix/tty.c /usr/src/debug/libuv/1.38.0-r0/git/src/unix/process.c", added "/usr/src/debug/libuv/1.38.1-r0/git/src/unix/dl.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/async.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/internal.h /usr/src/debug/libuv/1.38.1-r0/git/src/unix/spinlock.h /usr/src/debug/libuv/1.38.1-r0/git/src/unix/core.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/linux-core.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/loop-watcher.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/linux-syscalls.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/linux-syscalls.h /usr/src/debug/libuv/1.38.1-r0/git/src/unix/tcp.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/random-sysctl-linux.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/getaddrinfo.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/udp.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/pipe.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/signal.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/process.c /usr/src/debug/libuv
 /1.38.1-r0/git/src/unix/stream.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/getnameinfo.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/atomic-ops.h /usr/src/debug/libuv/1.38.1-r0/git/src/unix/proctitle.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/poll.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/thread.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/loop.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/random-devurandom.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/random-getrandom.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/procfs-exepath.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/fs.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/linux-inotify.c /usr/src/debug/libuv/1.38.1-r0/git/src/unix/tty.c"
packages/core2-32-poky-linux/libuv/libuv-src: PKGSIZE changed from 533186 to 532420 (-0%)
packages/core2-32-poky-linux/libuv/libuv-staticdev: PV changed from "1.38.0" to "1.38.1"
packages/core2-32-poky-linux/libuv/libuv-staticdev: PKGV changed from 1.38.0 [default] to 1.38.1 [default]
packages/core2-32-poky-linux/libuv/libuv: PV changed from "1.38.0" to "1.38.1"
packages/core2-32-poky-linux/libuv/libuv: PKGV changed from 1.38.0 [default] to 1.38.1 [default]

--===============7550007933180245744==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libuv-upgrade-1.38.0-1.38.1.patch"

From ae922c8946f45609c94411b2ee92e1ab56fb79f1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Wed, 15 Jul 2020 02:22:10 +0000
Subject: [PATCH] libuv: upgrade 1.38.0 -> 1.38.1

---
 .../libuv/{libuv_1.38.0.bb => libuv_1.38.1.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.38.0.bb => libuv_1.38.1.bb} (90%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.38.0.bb b/meta/recipes-connectivity/libuv/libuv_1.38.1.bb
similarity index 90%
rename from meta/recipes-connectivity/libuv/libuv_1.38.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.38.1.bb
index afc9b2f2ea..874546373a 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.38.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.38.1.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
-SRCREV = "1ab9ea3790378f9f25c4e78e9e2b511c75f9c9ed"
+SRCREV = "e8b989ea1f7f9d4083511a2caec7791e9abd1871"
 SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


--===============7550007933180245744==--
