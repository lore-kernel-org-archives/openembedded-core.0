Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A06C5479D
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:07 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.20170.1672605966289699274
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fMuFknSU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101856f159bcd-5904aec9-60ea-4444-8e10-c20dc94c9424-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605965;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Uq7VBwofZKn6wrL/5g0pkRTJUuyh/tgzb/J69852d9A=;
	b=fMuFknSU4LxAfvc8DNJNyKHY6xoDHp9c9yHL7Wexzy3iRKrkzHgQROekDgxSo8qM
	lT3/9MIsEWyXnaMS/Izoa+xXKQVxdAFsbnwDWkuLiuuk0hhPC4M88Z1XH4sWjSK0adu
	ic78k9B37sbu7NpU/crLoQi7axqnmpsI11OOL4FQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605965;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Uq7VBwofZKn6wrL/5g0pkRTJUuyh/tgzb/J69852d9A=;
	b=C44lQUgO5wsDk7Z/uzSIv8Cqs5Mw3mxbcKXjw5fFLbXwVu0BM4X/TlK8PYZp84R5
	8lzHbj7PKO6W4+D38Ta+Alf5a93Ha/wcLRYURpEEyqYFw1pn81qX6roe/QZXMN8MVhm
	p/SYCjzpkrbeeS493qZV4bstpy+2cLJa+/2sv/q0=
Content-Type: multipart/mixed; boundary="===============8793012952674273564=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.1 SUCCEEDED
Message-ID: <010101856f159bcd-5904aec9-60ea-4444-8e10-c20dc94c9424-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175241

--===============8793012952674273564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.0.2-6.1.patch
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
--===============8793012952674273564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.1-py3.11.egg-info was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.1-py3.11.egg-info/dependency_links.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.1-py3.11.egg-info/PKG-INFO was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.1-py3.11.egg-info/SOURCES.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.1-py3.11.egg-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.0.2-py3.11.egg-info was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.0.2-py3.11.egg-info/dependency_links.txt was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.0.2-py3.11.egg-info/PKG-INFO was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.0.2-py3.11.egg-info/SOURCES.txt was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.0.2-py3.11.egg-info/top_level.txt was removed

--===============8793012952674273564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.0.2" to "6.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 17317648 to 17378400 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.0.2 [default] to 6.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.0.2" to "6.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 208575 to 207638 (-0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.0.2 [default] to 6.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.0.2" to "6.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.0.2 [default] to 6.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.0.2" to "6.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.0.2 [default] to 6.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.0.2" to "6.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 3662644 to 3735611 (+2%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: FILELIST: directory renamed /usr/src/debug/btrfs-tools/6.0.2-r0/libbtrfsutil -> /usr/src/debug/btrfs-tools/6.1-r0/libbtrfsutil, directory renamed /usr/src/debug/btrfs-tools/6.0.2-r0/image -> /usr/src/debug/btrfs-tools/6.1-r0/image, directory renamed /usr/src/debug/btrfs-tools/6.0.2-r0/mkfs -> /usr/src/debug/btrfs-tools/6.1-r0/mkfs, directory renamed /usr/src/debug/btrfs-tools/6.0.2-r0/convert -> /usr/src/debug/btrfs-tools/6.1-r0/convert, directory renamed /usr/src/debug/btrfs-tools/6.0.2-r0/crypto -> /usr/src/debug/btrfs-tools/6.1-r0/crypto, directory renamed /usr/src/debug/btrfs-tools/6.0.2-r0/check -> /usr/src/debug/btrfs-tools/6.1-r0/check, directory renamed /usr/src/debug/btrfs-tools/6.0.2-r0/common -> /usr/src/debug/btrfs-tools/6.1-r0/common, directory renamed /usr/src/debug/btrfs-tools/6.0.2-r0 -> /usr/src/debug/btrfs-tools/6.1-r0, directory renamed /usr/src/debug/btrfs-tools/6.0.2-r0/libbtrfsutil/python -> /usr/src/debu
 g/btrfs-tools/6.1-r0/libbtrfsutil/python, directory renamed /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-lib -> /usr/src/debug/btrfs-tools/6.1-r0/kernel-lib, removed "/usr/src/debug/btrfs-tools/6.0.2-r0/cmds/inspect-dump-super.c /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/send.c /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/inode-item.c /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/filesystem-usage.h /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/extent_io.c /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/file.c /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/qgroup.h /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/rescue.h /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/root-tree.c /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/uuid-tree.c /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/device.c /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/qgroup.c /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/extent_io.h /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/filesystem-usage.c /usr/src/debug/btrfs-tools/6.0.2-r
 0/cmds/rescue.c /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/send.h /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/ctree.c /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/inode.c /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/ulist.c /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/balance.c /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/inspect.c /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/quota.c /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/receive.c /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/replace.c /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/rescue-chunk-recover.c /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/restore.c /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/subvolume-list.c /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/subvolume.c /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/ctree.h /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/inspect-tree-stats.c /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/disk-io.h /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/ulist.h /usr/src/debug/btrfs-tools/6.0.2-
 r0/cmds/filesystem.c /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/zoned.h /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/transaction.h /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/filesystem-du.c /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/rescue-super-recover.c /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/dir-item.c /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/disk-io.c /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/transaction.c /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/commands.h /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/inspect-dump-tree.c /usr/src/debug/btrfs-tools/6.0.2-r0/libbtrfs/send-utils.c /usr/src/debug/btrfs-tools/6.0.2-r0/libbtrfs/send-utils.h /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/delayed-ref.c /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/free-space-tree.c /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/receive-dump.h /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/free-space-cache.h /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/volumes.h /u
 sr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/file-item.c /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/free-space-tree.h /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/delayed-ref.h /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/free-space-cache.c /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/receive-dump.c /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/volumes.c /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/property.c /usr/src/debug/btrfs-tools/6.0.2-r0/libbtrfs/send-stream.c /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/print-tree.c /usr/src/debug/btrfs-tools/6.0.2-r0/libbtrfs/send.h /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/backref.c /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/print-tree.h /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/extent-tree.c /usr/src/debug/btrfs-tools/6.0.2-r0/libbtrfs/ctree.h /usr/src/debug/btrfs-tools/6.0.2-r0/libbtrfs/send-stream.h /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/backref.h /usr/src/debug/btrfs-tools/6.0.2-r0
 /cmds/scrub.c /usr/src/debug/btrfs-tools/6.0.2-r0/kernel-shared/zoned.c /usr/src/debug/btrfs-tools/6.0.2-r0/cmds/props.h", added "/usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/free-space-tree.c /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/inode.c /usr/src/debug/btrfs-tools/6.1-r0/cmds/filesystem-usage.h /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/root-tree.c /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/backref.c /usr/src/debug/btrfs-tools/6.1-r0/libbtrfs/send-stream.c /usr/src/debug/btrfs-tools/6.1-r0/cmds/filesystem-usage.c /usr/src/debug/btrfs-tools/6.1-r0/cmds/props.h /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/free-space-tree.h /usr/src/debug/btrfs-tools/6.1-r0/libbtrfs/send-stream.h /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/backref.h /usr/src/debug/btrfs-tools/6.1-r0/cmds/inspect-dump-super.c /usr/src/debug/btrfs-tools/6.1-r0/cmds/rescue-chunk-recover.c /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/disk-io.c /usr/src/debug/btrfs-tools/6.1-r0/cmds/subvolu
 me-list.c /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/ulist.c /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/disk-io.h /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/ulist.h /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/dir-item.c /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/send.h /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/compression.h /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/delayed-ref.h /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/volumes.c /usr/src/debug/btrfs-tools/6.1-r0/cmds/replace.c /usr/src/debug/btrfs-tools/6.1-r0/cmds/inspect-dump-tree.c /usr/src/debug/btrfs-tools/6.1-r0/libbtrfs/ctree.h /usr/src/debug/btrfs-tools/6.1-r0/libbtrfs/ioctl.h /usr/src/debug/btrfs-tools/6.1-r0/cmds/subvolume.c /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/delayed-ref.c /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/file.c /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/volumes.h /usr/src/debug/btrfs-tools/6.1-r0/cmds/receive.c /usr/src/debug/btrfs-tools/6.1-r0/cm
 ds/restore.c /usr/src/debug/btrfs-tools/6.1-r0/cmds/inspect-tree-stats.c /usr/src/debug/btrfs-tools/6.1-r0/cmds/send.c /usr/src/debug/btrfs-tools/6.1-r0/cmds/balance.c /usr/src/debug/btrfs-tools/6.1-r0/cmds/commands.h /usr/src/debug/btrfs-tools/6.1-r0/libbtrfs/send.h /usr/src/debug/btrfs-tools/6.1-r0/libbtrfs/send-utils.h /usr/src/debug/btrfs-tools/6.1-r0/cmds/receive-dump.c /usr/src/debug/btrfs-tools/6.1-r0/cmds/rescue.c /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/ctree.h /usr/src/debug/btrfs-tools/6.1-r0/cmds/inspect.c /usr/src/debug/btrfs-tools/6.1-r0/cmds/receive-dump.h /usr/src/debug/btrfs-tools/6.1-r0/cmds/rescue.h /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/ctree.c /usr/src/debug/btrfs-tools/6.1-r0/libbtrfs/send-utils.c /usr/src/debug/btrfs-tools/6.1-r0/cmds/filesystem-du.c /usr/src/debug/btrfs-tools/6.1-r0/cmds/filesystem.c /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/uuid-tree.c /usr/src/debug/btrfs-tools/6.1-r0/cmds/qgroup.c /usr/src/debug/btrfs-tools/6.1-r0/cmd
 s/qgroup.h /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/file-item.c /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/inode-item.c /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/extent_io.h /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/transaction.h /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/extent-tree.c /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/free-space-cache.h /usr/src/debug/btrfs-tools/6.1-r0/cmds/property.c /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/zoned.h /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/extent_io.c /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/transaction.c /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/zoned.c /usr/src/debug/btrfs-tools/6.1-r0/cmds/rescue-super-recover.c /usr/src/debug/btrfs-tools/6.1-r0/cmds/scrub.c /usr/src/debug/btrfs-tools/6.1-r0/cmds/device.c /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/free-space-cache.c /usr/src/debug/btrfs-tools/6.1-r0/cmds/quota.c /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/print-tree.
 h /usr/src/debug/btrfs-tools/6.1-r0/cmds/reflink.c /usr/src/debug/btrfs-tools/6.1-r0/kernel-shared/print-tree.c"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.0.2 [default] to 6.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.0.2" to "6.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.0.2 [default] to 6.1 [default]
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.0.2" to "6.1"
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 6127698 to 6152272 (+0%)
packages/core2-32-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.0.2 [default] to 6.1 [default]
packages/core2-32-poky-linux/btrfs-tools: PV changed from "6.0.2" to "6.1"
packages/core2-32-poky-linux/btrfs-tools: PKGV changed from 6.0.2 [default] to 6.1 [default]
Changes to packages/core2-32-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.11/site-packages/btrfsutil-6.1-py3.11.egg-info was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.1-py3.11.egg-info/dependency_links.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.1-py3.11.egg-info/PKG-INFO was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.1-py3.11.egg-info/SOURCES.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.1-py3.11.egg-info/top_level.txt was added
  /usr/lib/python3.11/site-packages/btrfsutil-6.0.2-py3.11.egg-info was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.0.2-py3.11.egg-info/dependency_links.txt was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.0.2-py3.11.egg-info/PKG-INFO was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.0.2-py3.11.egg-info/SOURCES.txt was removed
  /usr/lib/python3.11/site-packages/btrfsutil-6.0.2-py3.11.egg-info/top_level.txt was removed

--===============8793012952674273564==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.0.2-6.1.patch"

RnJvbSAyN2I3ZTdmMTczYWU5OGJjZDA0N2I2YjY5NmRiMjQwYmU1YmRjMmY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAwNzowMDowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJ0
cmZzLXRvb2xzOiB1cGdyYWRlIDYuMC4yIC0+IDYuMQoKLS0tCiAuLi4vYnRyZnMtdG9vbHMve2J0
cmZzLXRvb2xzXzYuMC4yLmJiID0+IGJ0cmZzLXRvb2xzXzYuMS5iYn0gICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMve2J0cmZzLXRvb2xzXzYuMC4yLmJiID0+IGJ0cmZz
LXRvb2xzXzYuMS5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
YnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4wLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
YnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjAu
Mi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRv
b2xzXzYuMS5iYgppbmRleCBhYTQ4NDIyMDgwLi40NGVjMmUxZjE2IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi4wLjIuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzYuMS5iYgpAQCAt
MTksNyArMTksNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9rZGF2ZS9idHJmcy1wcm9ncy5naXQ7YgogICAgICAgICAgICBmaWxlOi8v
MDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFy
LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtVXNlLXByZWFkLXB3cml0ZS1mdHJ1bmNh
dGUtc3RhdC1pbnN0ZWFkLW9mLTY0Yml0LWVxdS5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ1JF
ViA9ICJmZjk2NGJhNmFlZjk4YmQxYmFmZThmZjliMDA4ODUwMWIzMGJkZDI3IgorU1JDUkVWID0g
ImNkZTVmYWE2Nzg3ZTZmYTcyMGM5OWQyZjEwY2FhMTg3YTQ5M2MxM2YiCiBTID0gIiR7V09SS0RJ
Un0vZ2l0IgogCiBQQUNLQUdFQ09ORklHID8/PSAiIFwKLS0gCjIuMzcuMwoK

--===============8793012952674273564==--

