Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.6935.1622200976348709543
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 04:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id DABE538C13CB
	for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 11:22:55 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpcre2: upgrading to 10.37 SUCCEEDED
Message-ID: <MADEUP.16833731961EF72D.30906@lists.openembedded.org>
X-Groupsio-MsgNum: 152363
Content-Type: multipart/mixed; boundary="===============5473452790642103270=="

--===============5473452790642103270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpcre2* to *10.37* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpcre2-upgrade-10.36-10.37.patch
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

--===============5473452790642103270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libpcre2: SRC_URI changed from "https://ftp.pcre.org/pub/pcre/pcre2-10.36.tar.bz2" to "https://ftp.pcre.org/pub/pcre/pcre2-10.37.tar.bz2"
packages/core2-32-poky-linux/libpcre2: PV changed from "10.36" to "10.37"
packages/core2-32-poky-linux/libpcre2: PKGV changed from 10.36 [default] to 10.37 [default]
packages/core2-32-poky-linux/libpcre2/libpcre2-16: FILELIST: removed "/usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2 /usr/lib/libpcre2-posix.so.3.0.0"
packages/core2-32-poky-linux/libpcre2/libpcre2-16: PV changed from "10.36" to "10.37"
packages/core2-32-poky-linux/libpcre2/libpcre2-16: PKGV changed from 10.36 [default] to 10.37 [default]
packages/core2-32-poky-linux/libpcre2/libpcre2-32: FILELIST: removed "/usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2 /usr/lib/libpcre2-posix.so.3.0.0"
packages/core2-32-poky-linux/libpcre2/libpcre2-32: PV changed from "10.36" to "10.37"
packages/core2-32-poky-linux/libpcre2/libpcre2-32: PKGV changed from 10.36 [default] to 10.37 [default]
packages/core2-32-poky-linux/libpcre2/libpcre2-dbg: FILELIST: removed "/usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2 /usr/lib/libpcre2-posix.so.3.0.0"
packages/core2-32-poky-linux/libpcre2/libpcre2-dbg: PV changed from "10.36" to "10.37"
packages/core2-32-poky-linux/libpcre2/libpcre2-dbg: PKGSIZE changed from 2063628 to 2063608 (-0%)
packages/core2-32-poky-linux/libpcre2/libpcre2-dbg: PKGV changed from 10.36 [default] to 10.37 [default]
packages/core2-32-poky-linux/libpcre2/libpcre2-dev: FILELIST: removed "/usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2 /usr/lib/libpcre2-posix.so.3.0.0"
packages/core2-32-poky-linux/libpcre2/libpcre2-dev: PV changed from "10.36" to "10.37"
packages/core2-32-poky-linux/libpcre2/libpcre2-dev: PKGV changed from 10.36 [default] to 10.37 [default]
packages/core2-32-poky-linux/libpcre2/libpcre2-doc: FILELIST: removed "/usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2 /usr/lib/libpcre2-posix.so.3.0.0"
packages/core2-32-poky-linux/libpcre2/libpcre2-doc: PV changed from "10.36" to "10.37"
packages/core2-32-poky-linux/libpcre2/libpcre2-doc: PKGSIZE changed from 2489753 to 2495479 (+0%)
packages/core2-32-poky-linux/libpcre2/libpcre2-doc: PKGV changed from 10.36 [default] to 10.37 [default]
packages/core2-32-poky-linux/libpcre2/libpcre2-locale: FILELIST: removed "/usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2 /usr/lib/libpcre2-posix.so.3.0.0"
packages/core2-32-poky-linux/libpcre2/libpcre2-locale: PV changed from "10.36" to "10.37"
packages/core2-32-poky-linux/libpcre2/libpcre2-locale: PKGV changed from 10.36 [default] to 10.37 [default]
packages/core2-32-poky-linux/libpcre2/libpcre2-src: FILELIST: removed "/usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2 /usr/lib/libpcre2-posix.so.3.0.0"
packages/core2-32-poky-linux/libpcre2/libpcre2-src: PV changed from "10.36" to "10.37"
packages/core2-32-poky-linux/libpcre2/libpcre2-src: PKGSIZE changed from 2445304 to 2446824 (+0%)
packages/core2-32-poky-linux/libpcre2/libpcre2-src: PKGV changed from 10.36 [default] to 10.37 [default]
packages/core2-32-poky-linux/libpcre2/libpcre2-staticdev: FILELIST: removed "/usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2 /usr/lib/libpcre2-posix.so.3.0.0"
packages/core2-32-poky-linux/libpcre2/libpcre2-staticdev: PV changed from "10.36" to "10.37"
packages/core2-32-poky-linux/libpcre2/libpcre2-staticdev: PKGV changed from 10.36 [default] to 10.37 [default]
packages/core2-32-poky-linux/libpcre2/libpcre2: FILELIST: removed "/usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2 /usr/lib/libpcre2-posix.so.3.0.0"
packages/core2-32-poky-linux/libpcre2/libpcre2: PV changed from "10.36" to "10.37"
packages/core2-32-poky-linux/libpcre2/libpcre2: PKGV changed from 10.36 [default] to 10.37 [default]
packages/core2-32-poky-linux/libpcre2/pcre2grep-doc: FILELIST: removed "/usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2 /usr/lib/libpcre2-posix.so.3.0.0"
packages/core2-32-poky-linux/libpcre2/pcre2grep-doc: PV changed from "10.36" to "10.37"
packages/core2-32-poky-linux/libpcre2/pcre2grep-doc: PKGV changed from 10.36 [default] to 10.37 [default]
packages/core2-32-poky-linux/libpcre2/pcre2grep: FILELIST: removed "/usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2 /usr/lib/libpcre2-posix.so.3.0.0"
packages/core2-32-poky-linux/libpcre2/pcre2grep: PV changed from "10.36" to "10.37"
packages/core2-32-poky-linux/libpcre2/pcre2grep: PKGV changed from 10.36 [default] to 10.37 [default]
packages/core2-32-poky-linux/libpcre2/pcre2test-doc: FILELIST: removed "/usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2 /usr/lib/libpcre2-posix.so.3.0.0"
packages/core2-32-poky-linux/libpcre2/pcre2test-doc: PV changed from "10.36" to "10.37"
packages/core2-32-poky-linux/libpcre2/pcre2test-doc: PKGSIZE changed from 88657 to 88918 (+0%)
packages/core2-32-poky-linux/libpcre2/pcre2test-doc: PKGV changed from 10.36 [default] to 10.37 [default]
packages/core2-32-poky-linux/libpcre2/pcre2test: FILELIST: removed "/usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2 /usr/lib/libpcre2-posix.so.3.0.0"
packages/core2-32-poky-linux/libpcre2/pcre2test: PV changed from "10.36" to "10.37"
packages/core2-32-poky-linux/libpcre2/pcre2test: PKGV changed from 10.36 [default] to 10.37 [default]
Changes to packages/core2-32-poky-linux/libpcre2 (sysroot):
  /usr/lib/libpcre2-16.so.0 changed symlink target from libpcre2-16.so.0.10.1 to libpcre2-16.so.0.10.2
  /usr/lib/libpcre2-16.so changed symlink target from libpcre2-16.so.0.10.1 to libpcre2-16.so.0.10.2
  /usr/lib/libpcre2-32.so.0 changed symlink target from libpcre2-32.so.0.10.1 to libpcre2-32.so.0.10.2
  /usr/lib/libpcre2-32.so changed symlink target from libpcre2-32.so.0.10.1 to libpcre2-32.so.0.10.2
  /usr/lib/libpcre2-8.so.0 changed symlink target from libpcre2-8.so.0.10.1 to libpcre2-8.so.0.10.2
  /usr/lib/libpcre2-8.so changed symlink target from libpcre2-8.so.0.10.1 to libpcre2-8.so.0.10.2
  /usr/lib/libpcre2-posix.so changed symlink target from libpcre2-posix.so.2.0.3 to libpcre2-posix.so.3.0.0
  /usr/lib/libpcre2-8.so.0.10.1 moved to /usr/lib/libpcre2-8.so.0.10.2
  /usr/lib/libpcre2-posix.so.2.0.3 moved to /usr/lib/libpcre2-posix.so.3.0.0
  /usr/lib/libpcre2-posix.so.2 moved to /usr/lib/libpcre2-posix.so.3
  /usr/lib/libpcre2-16.so.0.10.2 was added
  /usr/lib/libpcre2-32.so.0.10.2 was added
  /usr/lib/libpcre2-16.so.0.10.1 was removed
  /usr/lib/libpcre2-32.so.0.10.1 was removed
Changes to packages/x86_64-linux/libpcre2-native (sysroot):
  /usr/lib/libpcre2-16.so.0 changed symlink target from libpcre2-16.so.0.10.1 to libpcre2-16.so.0.10.2
  /usr/lib/libpcre2-16.so changed symlink target from libpcre2-16.so.0.10.1 to libpcre2-16.so.0.10.2
  /usr/lib/libpcre2-32.so.0 changed symlink target from libpcre2-32.so.0.10.1 to libpcre2-32.so.0.10.2
  /usr/lib/libpcre2-32.so changed symlink target from libpcre2-32.so.0.10.1 to libpcre2-32.so.0.10.2
  /usr/lib/libpcre2-8.so.0 changed symlink target from libpcre2-8.so.0.10.1 to libpcre2-8.so.0.10.2
  /usr/lib/libpcre2-8.so changed symlink target from libpcre2-8.so.0.10.1 to libpcre2-8.so.0.10.2
  /usr/lib/libpcre2-posix.so changed symlink target from libpcre2-posix.so.2.0.3 to libpcre2-posix.so.3.0.0
  /usr/lib/libpcre2-8.so.0.10.1 moved to /usr/lib/libpcre2-8.so.0.10.2
  /usr/lib/libpcre2-posix.so.2.0.3 moved to /usr/lib/libpcre2-posix.so.3.0.0
  /usr/lib/libpcre2-posix.so.2 moved to /usr/lib/libpcre2-posix.so.3
  /usr/lib/libpcre2-16.so.0.10.2 was added
  /usr/lib/libpcre2-32.so.0.10.2 was added
  /usr/lib/libpcre2-16.so.0.10.1 was removed
  /usr/lib/libpcre2-32.so.0.10.1 was removed

--===============5473452790642103270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libpcre2/libpcre2-16: FILELIST: removed "/usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3.0.0 /usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2"
packages/core2-32-poky-linux/libpcre2/libpcre2-32: FILELIST: removed "/usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3.0.0 /usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2"
packages/core2-32-poky-linux/libpcre2/libpcre2-dev: FILELIST: removed "/usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3.0.0 /usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2"
packages/core2-32-poky-linux/libpcre2/libpcre2-doc: FILELIST: removed "/usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3.0.0 /usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2"
packages/core2-32-poky-linux/libpcre2/libpcre2-locale: FILELIST: removed "/usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3.0.0 /usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2"
packages/core2-32-poky-linux/libpcre2/libpcre2-staticdev: FILELIST: removed "/usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3.0.0 /usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2"
packages/core2-32-poky-linux/libpcre2/libpcre2: FILELIST: removed "/usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3.0.0 /usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2"
packages/core2-32-poky-linux/libpcre2/pcre2grep-doc: FILELIST: removed "/usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3.0.0 /usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2"
packages/core2-32-poky-linux/libpcre2/pcre2grep: FILELIST: removed "/usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3.0.0 /usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2"
packages/core2-32-poky-linux/libpcre2/pcre2test-doc: FILELIST: removed "/usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3.0.0 /usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2"
packages/core2-32-poky-linux/libpcre2/pcre2test: FILELIST: removed "/usr/lib/libpcre2-posix.so.2 /usr/lib/libpcre2-8.so.0.10.1 /usr/lib/libpcre2-posix.so.2.0.3", added "/usr/lib/libpcre2-posix.so.3.0.0 /usr/lib/libpcre2-posix.so.3 /usr/lib/libpcre2-8.so.0.10.2"
Changes to packages/core2-32-poky-linux/libpcre2 (sysroot):
  /usr/lib/libpcre2-16.so.0 changed symlink target from libpcre2-16.so.0.10.1 to libpcre2-16.so.0.10.2
  /usr/lib/libpcre2-16.so changed symlink target from libpcre2-16.so.0.10.1 to libpcre2-16.so.0.10.2
  /usr/lib/libpcre2-32.so.0 changed symlink target from libpcre2-32.so.0.10.1 to libpcre2-32.so.0.10.2
  /usr/lib/libpcre2-32.so changed symlink target from libpcre2-32.so.0.10.1 to libpcre2-32.so.0.10.2
  /usr/lib/libpcre2-8.so.0 changed symlink target from libpcre2-8.so.0.10.1 to libpcre2-8.so.0.10.2
  /usr/lib/libpcre2-8.so changed symlink target from libpcre2-8.so.0.10.1 to libpcre2-8.so.0.10.2
  /usr/lib/libpcre2-posix.so changed symlink target from libpcre2-posix.so.2.0.3 to libpcre2-posix.so.3.0.0
  /usr/lib/libpcre2-8.so.0.10.1 moved to /usr/lib/libpcre2-8.so.0.10.2
  /usr/lib/libpcre2-posix.so.2.0.3 moved to /usr/lib/libpcre2-posix.so.3.0.0
  /usr/lib/libpcre2-posix.so.2 moved to /usr/lib/libpcre2-posix.so.3
  /usr/lib/libpcre2-16.so.0.10.2 was added
  /usr/lib/libpcre2-32.so.0.10.2 was added
  /usr/lib/libpcre2-16.so.0.10.1 was removed
  /usr/lib/libpcre2-32.so.0.10.1 was removed
Changes to packages/x86_64-linux/libpcre2-native (sysroot):
  /usr/lib/libpcre2-16.so.0 changed symlink target from libpcre2-16.so.0.10.1 to libpcre2-16.so.0.10.2
  /usr/lib/libpcre2-16.so changed symlink target from libpcre2-16.so.0.10.1 to libpcre2-16.so.0.10.2
  /usr/lib/libpcre2-32.so.0 changed symlink target from libpcre2-32.so.0.10.1 to libpcre2-32.so.0.10.2
  /usr/lib/libpcre2-32.so changed symlink target from libpcre2-32.so.0.10.1 to libpcre2-32.so.0.10.2
  /usr/lib/libpcre2-8.so.0 changed symlink target from libpcre2-8.so.0.10.1 to libpcre2-8.so.0.10.2
  /usr/lib/libpcre2-8.so changed symlink target from libpcre2-8.so.0.10.1 to libpcre2-8.so.0.10.2
  /usr/lib/libpcre2-posix.so changed symlink target from libpcre2-posix.so.2.0.3 to libpcre2-posix.so.3.0.0
  /usr/lib/libpcre2-8.so.0.10.1 moved to /usr/lib/libpcre2-8.so.0.10.2
  /usr/lib/libpcre2-posix.so.2.0.3 moved to /usr/lib/libpcre2-posix.so.3.0.0
  /usr/lib/libpcre2-posix.so.2 moved to /usr/lib/libpcre2-posix.so.3
  /usr/lib/libpcre2-16.so.0.10.2 was added
  /usr/lib/libpcre2-32.so.0.10.2 was added
  /usr/lib/libpcre2-16.so.0.10.1 was removed
  /usr/lib/libpcre2-32.so.0.10.1 was removed

--===============5473452790642103270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1458 entries from dependency cache.
Parsing recipes...done.
Parsing of 822 .bb files complete (821 cached, 1 parsed). 1456 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-31bace61fe328aaaf6fd34c5f22ce373f4577ce9"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:31bace61fe328aaaf6fd34c5f22ce373f4577ce9"
workspace            = "master:40d3366bea8d2417e89a37c6f2d38e1542160342"

Initialising tasks...done.
Sstate summary: Wanted 56 Local 45 Network 0 Missed 11 Current 686 (80% match, 98% complete)
Removing 8 stale sstate objects for arch core2-64...done.
Removing 6 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 687 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 693 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 694 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 702 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 713 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 716 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-7.76.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1081 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe curl-7.76.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 727 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1619 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_fetch)
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 728 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.37-r0: task do_fetch: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 729 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.37-r0: task do_fetch: Succeeded
NOTE: Running task 1870 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_unpack)
NOTE: Running task 1871 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_unpack: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libpcre2-10.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_unpack: Succeeded
NOTE: Running task 2160 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_patch)
NOTE: recipe libpcre2-10.37-r0: task do_patch: Started
NOTE: recipe libpcre2-10.37-r0: task do_patch: Succeeded
NOTE: Running task 2161 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_deploy_source_date_epoch)
NOTE: Running task 2162 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2163 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2164 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libpcre2-10.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.37-r0: task do_populate_lic: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libpcre2-10.37-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_populate_lic unihash changed to 302846c54380ac5135a5f9c71cd93c39907868f10bb4975b36e6a436cd58dec0
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2169 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_configure)
NOTE: recipe libpcre2-10.37-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 62f6431f19fede238466e190955b5b9d556d5896ebde028532bf0150e9f43d12
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2229 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 736 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 4536779b7dca0a5c3d8e03313918f0c89e1a8005eaa6177b0bfb304d882f478c
NOTE: Running task 2269 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 740 of 742 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_packagedata_setscene)
NOTE: recipe curl-7.76.1-r0: task do_packagedata_setscene: Started
ERROR: curl-7.76.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-src went backwards which would break package feeds (from 0:7.77.0-r0 to 0:7.76.1-r0) [version-going-backwards]
ERROR: curl-7.76.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dbg went backwards which would break package feeds (from 0:7.77.0-r0 to 0:7.76.1-r0) [version-going-backwards]
ERROR: curl-7.76.1-r0 do_packagedata_setscene: QA Issue: Package version for package libcurl went backwards which would break package feeds (from 0:7.77.0-r0 to 0:7.76.1-r0) [version-going-backwards]
ERROR: curl-7.76.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-staticdev went backwards which would break package feeds (from 0:7.77.0-r0 to 0:7.76.1-r0) [version-going-backwards]
ERROR: curl-7.76.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dev went backwards which would break package feeds (from 0:7.77.0-r0 to 0:7.76.1-r0) [version-going-backwards]
ERROR: curl-7.76.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-doc went backwards which would break package feeds (from 0:7.77.0-r0 to 0:7.76.1-r0) [version-going-backwards]
ERROR: curl-7.76.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl-locale went backwards which would break package feeds (from 0:7.77.0-r0 to 0:7.76.1-r0) [version-going-backwards]
ERROR: curl-7.76.1-r0 do_packagedata_setscene: QA Issue: Package version for package curl went backwards which would break package feeds (from 0:7.77.0-r0 to 0:7.76.1-r0) [version-going-backwards]
NOTE: recipe curl-7.76.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_configure: Succeeded
NOTE: Running task 2322 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_compile)
NOTE: recipe libpcre2-10.37-r0: task do_compile: Started
NOTE: recipe libpcre2-10.37-r0: task do_compile: Succeeded
NOTE: Running task 2323 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_install)
NOTE: recipe libpcre2-10.37-r0: task do_install: Started
NOTE: recipe libpcre2-10.37-r0: task do_install: Succeeded
NOTE: Running task 2324 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package)
NOTE: Running task 2325 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_populate_sysroot)
NOTE: recipe libpcre2-10.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.37-r0: task do_package: Started
NOTE: recipe libpcre2-10.37-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_package: Succeeded
NOTE: Running task 2326 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_packagedata)
NOTE: recipe libpcre2-10.37-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.37-r0: task do_packagedata: Succeeded
NOTE: Running task 2327 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package_write_rpm)
NOTE: Running task 2328 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_package_qa)
NOTE: recipe libpcre2-10.37-r0: task do_package_write_rpm: Started
NOTE: recipe libpcre2-10.37-r0: task do_package_qa: Started
NOTE: recipe libpcre2-10.37-r0: task do_package_qa: Succeeded
NOTE: recipe libpcre2-10.37-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2329 of 2329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.37.bb:do_build)
NOTE: Tasks Summary: Attempted 2329 tasks of which 2309 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============5473452790642103270==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libpcre2-upgrade-10.36-10.37.patch"

From 9328dc7e36e1339ae44de096f4d38b814b0f0d22 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 28 May 2021 11:14:57 +0000
Subject: [PATCH] libpcre2: upgrade 10.36 -> 10.37

---
 .../{libpcre2_10.36.bb => libpcre2_10.37.bb}  | 44 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.36.bb => libpcre2_10.37.bb} (59%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.36.bb b/meta/recipes-support/libpcre/libpcre2_10.37.bb
similarity index 59%
rename from meta/recipes-support/libpcre/libpcre2_10.36.bb
rename to meta/recipes-support/libpcre/libpcre2_10.37.bb
index d8077a1224..129d621eb5 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.36.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.37.bb
@@ -1,3 +1,43 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENCE
+# +++ LICENCE
+# @@ -26,7 +26,7 @@
+#  University of Cambridge Computing Service,
+#  Cambridge, England.
+#  
+# -Copyright (c) 1997-2020 University of Cambridge
+# +Copyright (c) 1997-2021 University of Cambridge
+#  All rights reserved.
+#  
+#  
+# @@ -37,7 +37,7 @@
+#  Email local part: hzmester
+#  Email domain:     freemail.hu
+#  
+# -Copyright(c) 2010-2020 Zoltan Herczeg
+# +Copyright(c) 2010-2021 Zoltan Herczeg
+#  All rights reserved.
+#  
+#  
+# @@ -48,7 +48,7 @@
+#  Email local part: hzmester
+#  Email domain:     freemail.hu
+#  
+# -Copyright(c) 2009-2020 Zoltan Herczeg
+# +Copyright(c) 2009-2021 Zoltan Herczeg
+#  All rights reserved.
+#  
+#  
+# 
+#
+
 DESCRIPTION = "There are two major versions of the PCRE library. The \
 newest version is PCRE2, which is a re-working of the original PCRE \
 library to provide an entirely new API. The original, very widely \
@@ -8,11 +48,11 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=60c08fab1357bfe9084b333bc33362d6"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=6b3022283c9a79238d521848ea9dcb4d"
 
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "a9ef39278113542968c7c73a31cfcb81aca1faa64690f400b907e8ab6b4a665c"
+SRC_URI[sha256sum] = "4d95a96e8b80529893b4562be12648d798b957b1ba1aae39606bbc2ab956d270"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.27.0


--===============5473452790642103270==--
