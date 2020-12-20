Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.23885.1608473714120313526
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id A1B4F38C13B6
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:13 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux: upgrading to 2.36.1 SUCCEEDED
Message-ID: <MADEUP.1652725230C2A110.18165@lists.openembedded.org>
X-Groupsio-MsgNum: 145926
Content-Type: multipart/mixed; boundary="===============3963234043296073267=="

--===============3963234043296073267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *util-linux* to *2.36.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-util-linux-upgrade-2.36-2.36.1.patch
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

--===============3963234043296073267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/util-linux: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.36/util-linux-2.36.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.36/util-linux-2.36.1.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch"
packages/core2-32-poky-linux/util-linux: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-addpart: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-addpart: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-agetty: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-agetty: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-bash-completion: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-bash-completion: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-blkdiscard: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-blkdiscard: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-blkid: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-blkid: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-blkzone: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-blkzone: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-blockdev: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-blockdev: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-cal: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-cal: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-cfdisk: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-cfdisk: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-chcpu: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-chcpu: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-chmem: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-chmem: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-choom: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-choom: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-chrt: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-chrt: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-col: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-col: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-colcrt: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-colcrt: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-colrm: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-colrm: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-column: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-column: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-ctrlaltdel: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-ctrlaltdel: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-dbg: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-dbg: PKGSIZE changed from 17788544 to 17706748 (-0%)
packages/core2-32-poky-linux/util-linux/util-linux-dbg: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-delpart: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-delpart: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-dev: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-dev: PKGSIZE changed from 104698 to 104783 (+0%)
packages/core2-32-poky-linux/util-linux/util-linux-dev: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-dmesg: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-dmesg: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-doc: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-doc: PKGSIZE changed from 705652 to 707457 (+0%)
packages/core2-32-poky-linux/util-linux/util-linux-doc: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-eject: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-eject: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-fallocate: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-fallocate: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-fdformat: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-fdformat: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-fdisk: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-fdisk: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-fincore: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-fincore: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-findfs: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-findfs: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-findmnt: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-findmnt: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-flock: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-flock: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-fsck.cramfs: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-fsck.cramfs: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-fsck: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-fsck: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-fsfreeze: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-fsfreeze: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-fstrim: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-fstrim: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-getopt: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-getopt: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-hardlink: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-hardlink: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-hexdump: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-hexdump: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-hwclock: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-hwclock: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-ionice: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-ionice: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-ipcmk: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-ipcmk: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-ipcrm: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-ipcrm: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-ipcs: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-ipcs: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-irqtop: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-irqtop: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-isosize: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-isosize: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-kill: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-kill: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-last: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-last: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-ldattach: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-ldattach: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-libblkid: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-libblkid: PKGSIZE changed from 370541 to 366441 (-1%)
packages/core2-32-poky-linux/util-linux/util-linux-libblkid: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-libfdisk: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-libfdisk: PKGSIZE changed from 526777 to 522897 (-1%)
packages/core2-32-poky-linux/util-linux/util-linux-libfdisk: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-libmount: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-libmount: PKGSIZE changed from 435885 to 431785 (-1%)
packages/core2-32-poky-linux/util-linux/util-linux-libmount: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-libsmartcols: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-libsmartcols: PKGSIZE changed from 259505 to 251309 (-3%)
packages/core2-32-poky-linux/util-linux/util-linux-libsmartcols: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-libuuid: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-libuuid: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-ca: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-ca: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-cs: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-cs: PKGSIZE changed from 468702 to 488404 (+4%)
packages/core2-32-poky-linux/util-linux/util-linux-locale-cs: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-da: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-da: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-de: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-de: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-es: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-es: PKGSIZE changed from 489183 to 494683 (+1%)
packages/core2-32-poky-linux/util-linux/util-linux-locale-es: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-et: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-et: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-eu: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-eu: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-fi: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-fi: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-fr: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-fr: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-gl: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-gl: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-hr: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-hr: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-hu: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-hu: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-id: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-id: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-it: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-it: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-ja: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-ja: PKGSIZE changed from 413318 to 413316 (-0%)
packages/core2-32-poky-linux/util-linux/util-linux-locale-ja: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-nl: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-nl: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-pl: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-pl: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-pt-br: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-pt-br: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-pt: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-pt: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-ru: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-ru: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-sl: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-sl: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-sv: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-sv: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-tr: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-tr: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-uk: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-uk: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-vi: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-vi: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-zh-cn: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-zh-cn: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-locale-zh-tw: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-locale-zh-tw: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-logger: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-logger: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-look: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-look: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-losetup: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-losetup: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-lsblk: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-lsblk: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-lscpu: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-lscpu: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-lsipc: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-lsipc: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-lsirq: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-lsirq: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-lslocks: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-lslocks: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-lslogins: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-lslogins: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-lsmem: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-lsmem: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-lsns: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-lsns: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-mcookie: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-mcookie: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-mesg: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-mesg: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-mkfs.cramfs: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-mkfs.cramfs: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-mkfs: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-mkfs: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-mkswap: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-mkswap: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-more: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-more: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-mount: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-mount: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-mountpoint: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-mountpoint: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-namei: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-namei: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-nologin: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-nologin: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-nsenter: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-nsenter: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-partx: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-partx: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-pivot-root: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-pivot-root: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-prlimit: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-prlimit: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-ptest: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-ptest: PKGSIZE changed from 4742748 to 4739993 (-0%)
packages/core2-32-poky-linux/util-linux/util-linux-ptest: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-raw: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-raw: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-readprofile: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-readprofile: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-rename: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-rename: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-renice: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-renice: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-resizepart: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-resizepart: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-rev: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-rev: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-rfkill: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-rfkill: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-rtcwake: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-rtcwake: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-runuser: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-runuser: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-script: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-script: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-scriptlive: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-scriptlive: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-scriptreplay: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-scriptreplay: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-setarch: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-setarch: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-setpriv: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-setpriv: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-setsid: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-setsid: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-setterm: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-setterm: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-sfdisk: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-sfdisk: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-src: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-src: PKGSIZE changed from 4508511 to 4513464 (+0%)
packages/core2-32-poky-linux/util-linux/util-linux-src: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-staticdev: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-staticdev: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-su: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-su: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-sulogin: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-sulogin: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-swaplabel: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-swaplabel: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-swapoff: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-swapoff: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-swapon: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-swapon: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-swaponoff: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-swaponoff: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-switch-root: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-switch-root: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-taskset: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-taskset: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-ul: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-ul: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-umount: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-umount: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-unshare: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-unshare: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-utmpdump: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-utmpdump: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-uuidd: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-uuidd: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-uuidgen: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-uuidgen: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-uuidparse: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-uuidparse: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-wall: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-wall: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-wdctl: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-wdctl: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-whereis: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-whereis: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-wipefs: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-wipefs: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-write: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-write: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux-zramctl: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux-zramctl: PV changed from "2.36" to "2.36.1"
packages/core2-32-poky-linux/util-linux/util-linux: PKGV changed from 2.36 [default] to 2.36.1 [default]
packages/core2-32-poky-linux/util-linux/util-linux: PV changed from "2.36" to "2.36.1"

--===============3963234043296073267==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-util-linux-upgrade-2.36-2.36.1.patch"

From eba85a42f6f92b3aaa126e7d707c3092ec73462b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 19 Dec 2020 22:50:33 +0000
Subject: [PATCH] util-linux: upgrade 2.36 -> 2.36.1

---
 .../util-linux/{util-linux_2.36.bb => util-linux_2.36.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/util-linux/{util-linux_2.36.bb => util-linux_2.36.1.bb} (99%)

diff --git a/meta/recipes-core/util-linux/util-linux_2.36.bb b/meta/recipes-core/util-linux/util-linux_2.36.1.bb
similarity index 99%
rename from meta/recipes-core/util-linux/util-linux_2.36.bb
rename to meta/recipes-core/util-linux/util-linux_2.36.1.bb
index 474f1e188c..8ea0bac9b2 100644
--- a/meta/recipes-core/util-linux/util-linux_2.36.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.36.1.bb
@@ -40,7 +40,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
            "
-SRC_URI[sha256sum] = "9e4b1c67eb13b9b67feb32ae1dc0d50e08ce9e5d82e1cccd0ee771ad2fa9e0b1"
+SRC_URI[sha256sum] = "09fac242172cd8ec27f0739d8d192402c69417617091d8c6e974841568f37eed"
 
 PACKAGES =+ "${PN}-swaponoff"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', '${PN}-pylibmount', '', d)}"
-- 
2.20.1


--===============3963234043296073267==--
