Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB2BC761AF
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:46 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.10285.1676508396073967185
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kMR5y0/d;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018657aff5cd-202a54bd-26d8-4142-ab6e-770f9a2d7dd9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WkNa6iHDr1TAA8nxTyFaMpA+b1N50BAITTq1t7ymUkQ=;
	b=kMR5y0/dCeCtnna32KiLn/X3nmkaYlZ06OLIYg6KRt7ebciez73Avml4PeRcdSwg
	3fr5rgJq1fATiOKN2f78BU4yHt7VIBgVJy45nga7cOHC0f4XVNBFd2NiPEPJj1H6Guz
	8hTw1qZon1sYGxSPqg9D+E6IsHoCiXgxsNXmJ1d4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WkNa6iHDr1TAA8nxTyFaMpA+b1N50BAITTq1t7ymUkQ=;
	b=h8Rio57JbyXj3WVO4YlfBBxGXN3wDFGOfIZ0HGt1d8oat9TRv89pKvpTED/W+2u3
	653TQwzXkmb8W/JP+wNRBSksBCDrCfPJYJ0D0h2XA5blP974xkLrVpVnW7409zeSs1i
	qsmi4OHYBgN8lnQcb8wFSCStXCggjBBvHEM6GkJw=
Content-Type: multipart/mixed; boundary="===============8167904118567938034=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] e2fsprogs: upgrading to 1.47.0 SUCCEEDED
Message-ID: <0101018657aff5cd-202a54bd-26d8-4142-ab6e-770f9a2d7dd9-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177230

--===============8167904118567938034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *e2fsprogs* to *1.47.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-e2fsprogs-upgrade-1.46.5-1.47.0.patch
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
--===============8167904118567938034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-badblocks: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-badblocks: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-dbg: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-dbg: PKGSIZE changed from 4804616 to 4810340 (+0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-dbg: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-dev: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-dev: PKGSIZE changed from 210779 to 211287 (+0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-dev: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-doc: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-doc: PKGSIZE changed from 227894 to 229602 (+1%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-doc: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-dumpe2fs: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-dumpe2fs: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-e2fsck: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-e2fsck: PKGSIZE changed from 402764 to 407340 (+1%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-e2fsck: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-e2scrub: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-e2scrub: PKGSIZE changed from 12691 to 12688 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-e2scrub: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-ca: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-ca: PKGSIZE changed from 138307 to 138233 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-ca: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-cs: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-cs: PKGSIZE changed from 188256 to 187318 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-cs: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-da: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-da: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-de: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-de: PKGSIZE changed from 174982 to 174877 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-de: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-eo: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-eo: PKGSIZE changed from 87698 to 87621 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-eo: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-es: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-es: PKGSIZE changed from 193472 to 192760 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-es: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-fi: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-fi: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-fr: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-fr: PKGSIZE changed from 189140 to 188381 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-fr: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-hu: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-hu: PKGSIZE changed from 172346 to 172240 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-hu: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-id: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-id: PKGSIZE changed from 79670 to 79596 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-id: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-it: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-it: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-ms: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-ms: PKGSIZE changed from 28148 to 34318 (+22%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-ms: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-nl: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-nl: PKGSIZE changed from 181865 to 181862 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-nl: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-pl: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-pl: PKGSIZE changed from 184657 to 183887 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-pl: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-pt: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-pt: PKGSIZE changed from 183118 to 181221 (-1%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-pt: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-sr: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-sr: PKGSIZE changed from 244557 to 243724 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-sr: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-sv: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-sv: PKGSIZE changed from 179892 to 179148 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-sv: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-tr: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-tr: PKGSIZE changed from 69401 to 69317 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-tr: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-uk: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-uk: PKGSIZE changed from 249088 to 248181 (-0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-uk: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-vi: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-vi: PKGSIZE changed from 185561 to 183915 (-1%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-vi: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-zh-cn: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-zh-cn: PKGSIZE changed from 168519 to 167075 (-1%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-zh-cn: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-mke2fs: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-mke2fs: PKGSIZE changed from 153958 to 153989 (+0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-mke2fs: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-ptest: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-ptest: PKGSIZE changed from 16687046 to 16702529 (+0%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-ptest: FILELIST: added "/usr/lib/e2fsprogs/ptest/test/m_assume_storage_prezeroed/expect /usr/lib/e2fsprogs/ptest/test/fuzz/ext2fs_check_directory_fuzzer.cc /usr/lib/e2fsprogs/ptest/test/fuzz/.gitignore /usr/lib/e2fsprogs/ptest/test/f_ea_signed_hash/image.gz /usr/lib/e2fsprogs/ptest/test/f_ea_unsigned_hash/expect.1 /usr/lib/e2fsprogs/ptest/test/fuzz/ext2fs_read_bitmap_fuzzer.cc /usr/lib/e2fsprogs/ptest/test/f_badjour_encrypted/expect.1 /usr/lib/e2fsprogs/ptest/test/f_ea_unsigned_hash/image.gz /usr/lib/e2fsprogs/ptest/test/f_badjour_encrypted/expect.2 /usr/lib/e2fsprogs/ptest/test/f_ea_signed_hash/expect.1 /usr/lib/e2fsprogs/ptest/test/f_badjour_encrypted/name /usr/lib/e2fsprogs/ptest/test/m_assume_storage_prezeroed/script /usr/lib/e2fsprogs/ptest/test/fuzz/ext2fs_image_read_write_fuzzer.cc /usr/lib/e2fsprogs/ptest/test/f_ea_signed_hash/script /usr/lib/e2fsprogs/ptest/test/f_badjour_encrypted/script /usr/lib/e2fsprogs/ptest/test/f_ea_uns
 igned_hash/script"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-ptest: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-resize2fs: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-resize2fs: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-src: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-src: PKGSIZE changed from 3668594 to 3711516 (+1%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-src: FILELIST: directory renamed /usr/src/debug/e2fsprogs/1.46.5-r0/resize -> /usr/src/debug/e2fsprogs/1.47.0-r0/resize, directory renamed /usr/src/debug/e2fsprogs/1.46.5-r0/e2fsck -> /usr/src/debug/e2fsprogs/1.47.0-r0/e2fsck, directory renamed /usr/src/debug/e2fsprogs/1.46.5-r0/lib/e2p -> /usr/src/debug/e2fsprogs/1.47.0-r0/lib/e2p, directory renamed /usr/src/debug/e2fsprogs/1.46.5-r0/debugfs -> /usr/src/debug/e2fsprogs/1.47.0-r0/debugfs, directory renamed /usr/src/debug/e2fsprogs/1.46.5-r0/misc -> /usr/src/debug/e2fsprogs/1.47.0-r0/misc, directory renamed /usr/src/debug/e2fsprogs/1.46.5-r0/lib/et -> /usr/src/debug/e2fsprogs/1.47.0-r0/lib/et, directory renamed /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ss -> /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ss, directory renamed /usr/src/debug/e2fsprogs/1.46.5-r0/tests/progs -> /usr/src/debug/e2fsprogs/1.47.0-r0/tests/progs, removed "/usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/alloc_tables.c /usr/s
 rc/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/qcow2.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/gen_bitmap64.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/get_pathname.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/qcow2.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/unix_io.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/closefs.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/test_io.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/bitmaps.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/unlink.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/mmp.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/get_num_dirs.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/ext_attr.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/support/prof_err.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/rw_bitmaps.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/csum.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/support/quotaio.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/support/prof_err.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/
 ext2fs/dir_iterate.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/support/quotaio.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/inline.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/link.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/support/dqblk_v2.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/alloc_stats.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/block.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/gen_bitmap.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/kernel-jbd.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/inline_data.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/e2image.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/atexit.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/check_desc.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/ind_block.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/valid_blk.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/swapfs.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/support/dict.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/support/quotaio_tree.h /usr
 /src/debug/e2fsprogs/1.46.5-r0/lib/support/parse_qtype.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/finddev.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/support/dict.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/support/quotaio_tree.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/blknum.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/freefs.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/utf8data.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/fileio.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/sparse_io.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/support/mkquota.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/rbtree.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/nls_utf8.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/rbtree.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/ismounted.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/tdb.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/ext3_extents.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/mkjournal.c /usr/src/debug/e2fsprogs/1.46.5-r0/
 lib/ext2fs/tdb.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/i_block.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/llseek.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/inode.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/ext2fsP.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/bb_inode.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/ext2fs.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/blkmap64_ba.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/dupfs.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/hashmap.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/hashmap.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/support/quotaio_v2.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/support/sort_r.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/support/quotaio_v2.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/dblist.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/symlink.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/expanddir.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/imager.c /usr/src/debug/e2fspr
 ogs/1.46.5-r0/lib/ext2fs/io_manager.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/ext2_types.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/read_bb_file.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/kernel-list.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/getsize.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/bmap.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/bmap64.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/fiemap.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/blkmap64_rb.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/crc32c_table.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/badblocks.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/flushb.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/bitops.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/fallocate.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/newdir.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/ext2_io.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/bitops.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/w
 rite_bb_file.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/crc32c.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/undo_io.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/native.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/progress.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/fast_commit.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/ext2_fs.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/support/cstring.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/bb_compat.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/support/cstring.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/jfs_compat.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/punch.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/ext2_ext_attr.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/version.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/mkdir.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/support/profile.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/extent.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/ext4_acl.h /usr/src/debug/e2
 fsprogs/1.46.5-r0/lib/ext2fs/sha512.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/res_gdt.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/support/profile.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/crc16.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/crc16.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/ext2_err.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/read_bb.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/alloc_sb.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/dirhash.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/ext2_err.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/namei.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/support/plausible.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/dirblock.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/support/plausible.h /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/openfs.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/lookup.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/dblist_dir.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/initialize.
 c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/getsectsize.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/alloc.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/icount.c /usr/src/debug/e2fsprogs/1.46.5-r0/lib/ext2fs/inode_io.c", added "/usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/alloc_tables.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/qcow2.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/gen_bitmap64.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/get_pathname.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/qcow2.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/unix_io.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/closefs.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/test_io.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/bitmaps.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/unlink.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/mmp.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/get_num_dirs.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/ext_attr.c /usr/src/debug/e2fsp
 rogs/1.47.0-r0/lib/support/prof_err.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/rw_bitmaps.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/csum.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/support/quotaio.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/support/prof_err.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/dir_iterate.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/support/quotaio.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/inline.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/link.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/support/dqblk_v2.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/alloc_stats.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/block.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/gen_bitmap.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/kernel-jbd.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/inline_data.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/e2image.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/atexit.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/
 check_desc.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/ind_block.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/valid_blk.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/swapfs.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/support/dict.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/support/quotaio_tree.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/support/parse_qtype.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/finddev.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/support/dict.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/support/quotaio_tree.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/blknum.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/freefs.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/utf8data.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/fileio.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/sparse_io.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/support/mkquota.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/rbtree.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/nls_utf8.c /usr/src/debug/
 e2fsprogs/1.47.0-r0/lib/ext2fs/rbtree.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/ismounted.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/tdb.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/ext3_extents.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/mkjournal.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/tdb.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/i_block.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/llseek.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/inode.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/ext2fsP.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/bb_inode.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/ext2fs.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/blkmap64_ba.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/dupfs.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/hashmap.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/hashmap.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/support/quotaio_v2.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/support/sort_r.h /
 usr/src/debug/e2fsprogs/1.47.0-r0/lib/support/quotaio_v2.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/dblist.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/symlink.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/expanddir.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/imager.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/io_manager.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/ext2_types.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/read_bb_file.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/kernel-list.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/getsize.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/bmap.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/bmap64.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/fiemap.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/blkmap64_rb.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/crc32c_table.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/badblocks.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/flushb.c /usr/src/debug/e2fspro
 gs/1.47.0-r0/lib/ext2fs/bitops.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/fallocate.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/support/devname.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/newdir.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/support/devname.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/ext2_io.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/bitops.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/write_bb_file.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/crc32c.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/undo_io.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/native.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/progress.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/fast_commit.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/ext2_fs.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/support/cstring.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/bb_compat.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/support/cstring.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/jfs_com
 pat.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/punch.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/orphan.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/ext2_ext_attr.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/version.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/mkdir.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/support/profile.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/extent.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/ext4_acl.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/sha512.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/res_gdt.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/support/profile.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/crc16.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/crc16.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/ext2_err.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/read_bb.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/alloc_sb.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/dirhash.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/
 ext2fs/ext2_err.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/namei.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/support/plausible.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/dirblock.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/support/plausible.h /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/openfs.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/lookup.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/dblist_dir.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/initialize.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/getsectsize.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/alloc.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/icount.c /usr/src/debug/e2fsprogs/1.47.0-r0/lib/ext2fs/inode_io.c"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-src: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-staticdev: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-staticdev: PKGSIZE changed from 2306990 to 2327924 (+1%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-staticdev: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-tune2fs: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-tune2fs: PKGSIZE changed from 124460 to 132652 (+7%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-tune2fs: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs: PKGSIZE changed from 520417 to 516353 (-1%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs: PACKAGES: added "e2fsprogs-locale-fur"
packages/core2-32-poky-linux/e2fsprogs: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs: SRC_URI changed from "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=master file://remove.ldconfig.call.patch file://run-ptest file://ptest.patch file://mkdir_p.patch file://extents.patch file://0001-Add-option-to-enable-disable-largefile-support.patch file://0001-ext2fs-Use-64bit-lseek-when-_FILE_OFFSET_BITS-is-64.patch" to "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=master file://remove.ldconfig.call.patch file://run-ptest file://ptest.patch file://mkdir_p.patch file://e2fsprogs-fix-missing-check-for-permission-denied.patch file://quiet-debugfs.patch"
packages/core2-32-poky-linux/e2fsprogs/libcomerr: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/libcomerr: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/libe2p: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/libe2p: PKGSIZE changed from 43517 to 43549 (+0%)
packages/core2-32-poky-linux/e2fsprogs/libe2p: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/libext2fs: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/libext2fs: PKGSIZE changed from 532536 to 540728 (+2%)
packages/core2-32-poky-linux/e2fsprogs/libext2fs: PKGV changed from 1.46.5 [default] to 1.47.0 [default]
packages/core2-32-poky-linux/e2fsprogs/libss: PV changed from "1.46.5" to "1.47.0"
packages/core2-32-poky-linux/e2fsprogs/libss: PKGV changed from 1.46.5 [default] to 1.47.0 [default]

--===============8167904118567938034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-locale-ms: PKGSIZE changed from 28148 to 34318 (+22%)
packages/core2-32-poky-linux/e2fsprogs/e2fsprogs-ptest: FILELIST: added "/usr/lib/e2fsprogs/ptest/test/fuzz/ext2fs_check_directory_fuzzer.cc /usr/lib/e2fsprogs/ptest/test/f_ea_signed_hash/expect.1 /usr/lib/e2fsprogs/ptest/test/f_badjour_encrypted/name /usr/lib/e2fsprogs/ptest/test/f_badjour_encrypted/expect.2 /usr/lib/e2fsprogs/ptest/test/m_assume_storage_prezeroed/script /usr/lib/e2fsprogs/ptest/test/f_badjour_encrypted/expect.1 /usr/lib/e2fsprogs/ptest/test/f_ea_signed_hash/image.gz /usr/lib/e2fsprogs/ptest/test/fuzz/ext2fs_read_bitmap_fuzzer.cc /usr/lib/e2fsprogs/ptest/test/fuzz/.gitignore /usr/lib/e2fsprogs/ptest/test/f_ea_unsigned_hash/expect.1 /usr/lib/e2fsprogs/ptest/test/f_ea_signed_hash/script /usr/lib/e2fsprogs/ptest/test/f_ea_unsigned_hash/script /usr/lib/e2fsprogs/ptest/test/f_badjour_encrypted/script /usr/lib/e2fsprogs/ptest/test/m_assume_storage_prezeroed/expect /usr/lib/e2fsprogs/ptest/test/f_ea_unsigned_hash/image.gz /usr/lib/e2fsprogs/ptest/test/fuzz/ext2fs_image_rea
 d_write_fuzzer.cc"
packages/core2-32-poky-linux/e2fsprogs: PACKAGES: added "e2fsprogs-locale-fur"

--===============8167904118567938034==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-e2fsprogs-upgrade-1.46.5-1.47.0.patch"

RnJvbSA2MDlhOTc1ZGI3ZTljNzBmZjdkMDZmOTE4M2MzZDk4YTYyNDk4NTMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMTQ6Mzk6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
MmZzcHJvZ3M6IHVwZ3JhZGUgMS40Ni41IC0+IDEuNDcuMAoKLS0tCiAuLi4tdG8tZW5hYmxlLWRp
c2FibGUtbGFyZ2VmaWxlLXN1cHBvcnQucGF0Y2ggfCA1NyAtLS0tLS0tLS0tLS0tLS0tLS0tCiAu
Li50LWxzZWVrLXdoZW4tX0ZJTEVfT0ZGU0VUX0JJVFMtaXMtNjQucGF0Y2ggfCAzNyAtLS0tLS0t
LS0tLS0KIC4uLi1taXNzaW5nLWNoZWNrLWZvci1wZXJtaXNzaW9uLWRlbmllZC5wYXRjaCB8ICA0
ICstCiAuLi4vZTJmc3Byb2dzL2UyZnNwcm9ncy9leHRlbnRzLnBhdGNoICAgICAgICAgfCA1NiAt
LS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9lMmZzcHJvZ3MvZTJmc3Byb2dzL3F1aWV0LWRlYnVnZnMu
cGF0Y2ggICB8ICA2ICstCiAuLi4yZnNwcm9nc18xLjQ2LjUuYmIgPT4gZTJmc3Byb2dzXzEuNDcu
MC5iYn0gfCAgNyArLS0KIDYgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxNjEgZGVs
ZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNw
cm9ncy9lMmZzcHJvZ3MvMDAwMS1BZGQtb3B0aW9uLXRvLWVuYWJsZS1kaXNhYmxlLWxhcmdlZmls
ZS1zdXBwb3J0LnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2UyZnNwcm9ncy9lMmZzcHJvZ3MvMDAwMS1leHQyZnMtVXNlLTY0Yml0LWxzZWVrLXdoZW4tX0ZJ
TEVfT0ZGU0VUX0JJVFMtaXMtNjQucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy9leHRlbnRzLnBhdGNoCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy97ZTJmc3Byb2dzXzEuNDYuNS5iYiA9PiBlMmZz
cHJvZ3NfMS40Ny4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9lMmZzcHJvZ3MvZTJmc3Byb2dzLzAwMDEtQWRkLW9wdGlvbi10by1lbmFibGUtZGlzYWJsZS1s
YXJnZWZpbGUtc3VwcG9ydC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3Mv
ZTJmc3Byb2dzLzAwMDEtQWRkLW9wdGlvbi10by1lbmFibGUtZGlzYWJsZS1sYXJnZWZpbGUtc3Vw
cG9ydC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYTc3MGQwY2Y4OS4uMDAw
MDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy8w
MDAxLUFkZC1vcHRpb24tdG8tZW5hYmxlLWRpc2FibGUtbGFyZ2VmaWxlLXN1cHBvcnQucGF0Y2gK
KysrIC9kZXYvbnVsbApAQCAtMSw1NyArMCwwIEBACi1Gcm9tIDZmYWIzMzQ2ZDQ0ODI5OGEyNGNl
ZTFmYWViNWZjODUwN2EzYjk3MTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotRGF0ZTogVGh1LCAxMCBOb3YgMjAyMiAyMDozNDo1
NCAtMDgwMAotU3ViamVjdDogW1BBVENIXSBBZGQgb3B0aW9uIHRvIGVuYWJsZS9kaXNhYmxlIGxh
cmdlZmlsZSBzdXBwb3J0Ci0KLWZhbGxvY2F0ZSBjYW4gYmUgdXNlZCB0byBoYXZlIDY0Yml0IG9m
Zl90IHByb3ZpZGVkIGl0cyBjb21waWxlZCB3aXRoCi1fRklMRV9PRkZTRVRfQklUUz02NCB3aGlj
aCB3aWxsIGJlIGFkZGVkIGF1dG9tYXRpY2FsbHkgd2hlbgotLS1lbmFibGUtbGFyZ2VmaWxlIGlz
IHVzZWQuCi0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGh1Yi5jb20v
dHl0c28vZTJmc3Byb2dzL3B1bGwvMTI5XQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KLS0tLQotIGNvbmZpZ3VyZS5hYyAgICB8IDMgKysrCi0gbWlzYy9lNGRl
ZnJhZy5jIHwgNiArLS0tLS0KLSAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwot
aW5kZXggZGZmM2QxY2EuLmVjMWM1YjY0IDEwMDY0NAotLS0tIGEvY29uZmlndXJlLmFjCi0rKysg
Yi9jb25maWd1cmUuYWMKLUBAIC0xODAwLDYgKzE4MDAsOSBAQCBPU19JT19GSUxFPSIiCi0gICA7
OwotIGVzYWNdCi0gQUNfU1VCU1QoT1NfSU9fRklMRSkKLSsKLStBQ19TWVNfTEFSR0VGSUxFCi0r
Ci0gZG5sCi0gZG5sIE1ha2Ugb3VyIG91dHB1dCBmaWxlcywgYmVpbmcgc3VyZSB0aGF0IHdlIGNy
ZWF0ZSB0aGUgc29tZSBtaXNjZWxsYW5lb3VzIAotIGRubCBkaXJlY3RvcmllcwotZGlmZiAtLWdp
dCBhL21pc2MvZTRkZWZyYWcuYyBiL21pc2MvZTRkZWZyYWcuYwotaW5kZXggODZlOTdlZTMuLmU3
MTc1YzM3IDEwMDY0NAotLS0tIGEvbWlzYy9lNGRlZnJhZy5jCi0rKysgYi9taXNjL2U0ZGVmcmFn
LmMKLUBAIC0xOTUsMTAgKzE5NSw2IEBAIHN0YXRpYyBzdHJ1Y3QgZnJhZ19zdGF0aXN0aWNfaW5v
CWZyYWdfcmFua1tTSE9XX0ZSQUdfRklMRVNdOwotICNlcnJvciBwb3NpeF9mYWR2aXNlIG5vdCBh
dmFpbGFibGUhCi0gI2VuZGlmCi0gCi0tI2lmbmRlZiBIQVZFX0ZBTExPQ0FURTY0Ci0tI2Vycm9y
IGZhbGxvY2F0ZTY0IG5vdCBhdmFpbGFibGUhCi0tI2VuZGlmIC8qICEgSEFWRV9GQUxMT0NBVEU2
NCAqLwotLQotIC8qCi0gICogZ2V0X21vdW50X3BvaW50KCkgLQlHZXQgZGV2aWNlJ3MgbW91bnQg
cG9pbnQuCi0gICoKLUBAIC0xNTY4LDcgKzE1NjQsNyBAQCBzdGF0aWMgaW50IGZpbGVfZGVmcmFn
KGNvbnN0IGNoYXIgKmZpbGUsIGNvbnN0IHN0cnVjdCBzdGF0NjQgKmJ1ZiwKLSAJLyogQWxsb2Nh
dGUgc3BhY2UgZm9yIGRvbm9yIGlub2RlICovCi0gCW9yaWdfZ3JvdXBfdG1wID0gb3JpZ19ncm91
cF9oZWFkOwotIAlkbyB7Ci0tCQlyZXQgPSBmYWxsb2NhdGU2NChkb25vcl9mZCwgMCwKLSsJCXJl
dCA9IGZhbGxvY2F0ZShkb25vcl9mZCwgMCwKLSAJCSAgKGV4dDJfbG9mZl90KW9yaWdfZ3JvdXBf
dG1wLT5zdGFydC0+ZGF0YS5sb2dpY2FsICogYmxvY2tfc2l6ZSwKLSAJCSAgKGV4dDJfbG9mZl90
KW9yaWdfZ3JvdXBfdG1wLT5sZW4gKiBibG9ja19zaXplKTsKLSAJCWlmIChyZXQgPCAwKSB7Ci0t
LSAKLTIuMzguMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dz
L2UyZnNwcm9ncy8wMDAxLWV4dDJmcy1Vc2UtNjRiaXQtbHNlZWstd2hlbi1fRklMRV9PRkZTRVRf
QklUUy1pcy02NC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3By
b2dzLzAwMDEtZXh0MmZzLVVzZS02NGJpdC1sc2Vlay13aGVuLV9GSUxFX09GRlNFVF9CSVRTLWlz
LTY0LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAyMGVkNmVjYjNiLi4wMDAw
MDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzLzAw
MDEtZXh0MmZzLVVzZS02NGJpdC1sc2Vlay13aGVuLV9GSUxFX09GRlNFVF9CSVRTLWlzLTY0LnBh
dGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzcgKzAsMCBAQAotRnJvbSAxYThhYWE4ZmY3ZjRhY2E2
OGI1YWU5NjQ0NThlNDlhYjE2YjQzMTVmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLURhdGU6IFdlZCwgMTQgRGVjIDIwMjIgMjA6
NTY6NDQgLTA4MDAKLVN1YmplY3Q6IFtQQVRDSF0gZXh0MmZzOiBVc2UgNjRiaXQgbHNlZWsgd2hl
biBfRklMRV9PRkZTRVRfQklUUyBpcyA2NAotCi1Vc2UgbHNlZWsoKSB3aXRoIDY0Yml0IG9mZl90
IHdoZW4gX0ZJTEVfT0ZGU0VUX0JJVFMgaXMgNjQKLXRoaXMgZml4ZXMgYnVpbGQgd2l0aCBtdXNs
IHdoZXJlIHRoZXJlIGlzIG5vIF9sbHNlZWsgYnV0IGxzZWVrCi1pcyB1c2luZyBvZmZfdCB3aGlj
aCBpcyA2NGJpdCBvbiBtdXNsCi0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczov
L2dpdGh1Yi5jb20vdHl0c28vZTJmc3Byb2dzL3B1bGwvMTI5XQotU2lnbmUtb2ZmLWJ5OiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0gbGliL2V4dDJmcy9sbHNlZWsuYyB8IDQg
KystLQotIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCi0K
LWRpZmYgLS1naXQgYS9saWIvZXh0MmZzL2xsc2Vlay5jIGIvbGliL2V4dDJmcy9sbHNlZWsuYwot
aW5kZXggOTIyYTBkNTYuLjQ1ZjIxZDA5IDEwMDY0NAotLS0tIGEvbGliL2V4dDJmcy9sbHNlZWsu
YwotKysrIGIvbGliL2V4dDJmcy9sbHNlZWsuYwotQEAgLTUxLDcgKzUxLDcgQEAgZXh0ZXJuIGxv
bmcgbG9uZyBsbHNlZWsgKGludCBmZCwgbG9uZyBsb25nIG9mZnNldCwgaW50IG9yaWdpbik7Ci0g
Ci0gI2Vsc2UJLyogISBIQVZFX0xMU0VFSyAqLwotIAotLSNpZiBTSVpFT0ZfTE9ORyA9PSBTSVpF
T0ZfTE9OR19MT05HCi0rI2lmIFNJWkVPRl9MT05HID09IFNJWkVPRl9MT05HX0xPTkcgfHwgX0ZJ
TEVfT0ZGU0VUX0JJVFMrMCA9PSA2NAotIAotICNkZWZpbmUgbXlfbGxzZWVrIGxzZWVrCi0gCi1A
QCAtNjksNyArNjksNyBAQCBzdGF0aWMgaW50IF9sbHNlZWsgKHVuc2lnbmVkIGludCwgdW5zaWdu
ZWQgbG9uZywKLSAKLSBzdGF0aWMgX3N5c2NhbGw1KGludCxfbGxzZWVrLHVuc2lnbmVkIGludCxm
ZCx1bnNpZ25lZCBsb25nLG9mZnNldF9oaWdoLAotIAkJIHVuc2lnbmVkIGxvbmcsIG9mZnNldF9s
b3csZXh0Ml9sb2ZmX3QgKixyZXN1bHQsCi0tCQkgdW5zaWduZWQgaW50LCBvcmlnaW4pCi0rCQkg
dW5zaWduZWQgaW50LCBvcmlnaW4pOwotICNlbmRpZgotIAotIHN0YXRpYyBleHQyX2xvZmZfdCBt
eV9sbHNlZWsgKGludCBmZCwgZXh0Ml9sb2ZmX3Qgb2Zmc2V0LCBpbnQgb3JpZ2luKQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3MvZTJmc3Byb2dz
LWZpeC1taXNzaW5nLWNoZWNrLWZvci1wZXJtaXNzaW9uLWRlbmllZC5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzL2UyZnNwcm9ncy1maXgtbWlzc2luZy1j
aGVjay1mb3ItcGVybWlzc2lvbi1kZW5pZWQucGF0Y2gKaW5kZXggOTJiZDBkMGMxZi4uYjAzOGU2
MWViNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJv
Z3MvZTJmc3Byb2dzLWZpeC1taXNzaW5nLWNoZWNrLWZvci1wZXJtaXNzaW9uLWRlbmllZC5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy9lMmZzcHJv
Z3MtZml4LW1pc3NpbmctY2hlY2stZm9yLXBlcm1pc3Npb24tZGVuaWVkLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBjY2U0ODljOTZhYTNmNDI3MmExOWQyMTM3YzJhNDZiNDM5NjM2NzEyIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1YmM3NTY1NDY5MGEyZDkxNjE5MDE2OGI4NjU3
NzBhN2M5M2U2NWRkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSmFja2llIEh1YW5n
IDxqYWNraWUuaHVhbmdAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMTAgQXVnIDIwMTYgMTE6
MTk6NDQgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gRml4IG1pc3NpbmcgY2hlY2sgZm9yIHBlcm1p
c3Npb24gZGVuaWVkLgpAQCAtMTksNyArMTksNyBAQCBTaWduZWQtb2ZmLWJ5OiBKYWNraWUgSHVh
bmcgPGphY2tpZS5odWFuZ0B3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbGliL3N1cHBvcnQvcHJvZmls
ZS5jIGIvbGliL3N1cHBvcnQvcHJvZmlsZS5jCi1pbmRleCBmNTQ3MzllNy4uNTNlYTY4ZjEgMTAw
NjQ0CitpbmRleCBiZGIxNGIxNy4uMWJkNjI0MDYgMTAwNjQ0CiAtLS0gYS9saWIvc3VwcG9ydC9w
cm9maWxlLmMKICsrKyBiL2xpYi9zdXBwb3J0L3Byb2ZpbGUuYwogQEAgLTMzNSw3ICszMzUsNyBA
QCBwcm9maWxlX2luaXQoY29uc3QgY2hhciAqIGNvbnN0ICpmaWxlcywgcHJvZmlsZV90ICpyZXRf
cHJvZmlsZSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJm
c3Byb2dzL2V4dGVudHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2Uy
ZnNwcm9ncy9leHRlbnRzLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAyYzA5
YmIyNzZkLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3Mv
ZTJmc3Byb2dzL2V4dGVudHMucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw1NiArMCwwIEBACi1D
VkU6IENWRS0yMDIyLTEzMDQKLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgWyBhYjUxZDU4N2Ji
OWIyMjliMWZhZGUxYWZkMDJlMTU3NGMxYmE1Yzc2IF0KLVNpZ25lZC1vZmYtYnk6IFJvc3MgQnVy
dG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgotCi1Gcm9tIDM0NzA4NGM5YzFhZDIwZjQ3ZGFlMTZm
NWEzZGNkODYyOGQ1ZmM3YjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBMdWthcyBD
emVybmVyIDxsY3plcm5lckByZWRoYXQuY29tPgotRGF0ZTogVGh1LCAyMSBBcHIgMjAyMiAxOToz
MTo0OCArMDIwMAotU3ViamVjdDogW1BBVENIXSBlMmZzcHJvZ3M6IGFkZCBzYW5pdHkgY2hlY2sg
dG8gZXh0ZW50IG1hbmlwdWxhdGlvbgotCi1JdCBpcyBwb3NzaWJsZSB0byBoYXZlIGEgY29ycnVw
dGVkIGV4dGVudCB0cmVlIGluIHN1Y2ggYSB3YXkgdGhhdCBhIGxlYWYKLW5vZGUgY29udGFpbnMg
emVybyBleHRlbnRzIGluIGl0LiBDdXJyZW50bHkgaWYgdGhhdCBoYXBwZW5zIGFuZCB3ZSB0cnkK
LXRvIHRyYXZlcnNlIHRoZSB0cmVlIHdlIGNhbiBlbmQgdXAgYWNjZXNzaW5nIHdyb25nIGRhdGEs
IG9yIHBvc3NpYmx5Ci1ldmVuIHVuaW5pdGlhbGl6ZWQgbWVtb3J5LiBNYWtlIHN1cmUgd2UgZG9u
J3QgZG8gdGhhdC4KLQotQWRkaXRpb25hbGx5IG1ha2Ugc3VyZSB0aGF0IHdlIGhhdmUgYSBzYW5l
IG51bWJlciBvZiBieXRlcyBwYXNzZWQgdG8KLW1lbW1vdmUoKSBpbiBleHQyZnNfZXh0ZW50X2Rl
bGV0ZSgpLgotCi1Ob3RlIHRoYXQgZTJmc2NrIGlzIGN1cnJlbnRseSB1bmFibGUgdG8gc3BvdCBh
bmQgZml4IHN1Y2ggY29ycnVwdGlvbiBpbgotcGFzczEuCi0KLVNpZ25lZC1vZmYtYnk6IEx1a2Fz
IEN6ZXJuZXIgPGxjemVybmVyQHJlZGhhdC5jb20+Ci1SZXBvcnRlZC1ieTogTmlscyBCYXJzIDxu
aWxzX2JhcnNAdC1vbmxpbmUuZGU+Ci1BZGRyZXNzZXNzOiBodHRwczovL2J1Z3ppbGxhLnJlZGhh
dC5jb20vc2hvd19idWcuY2dpP2lkPTIwNjgxMTMKLS0tLQotIGxpYi9leHQyZnMvZXh0ZW50LmMg
fCA4ICsrKysrKysrCi0gMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQotCi1kaWZmIC0t
Z2l0IGEvbGliL2V4dDJmcy9leHRlbnQuYyBiL2xpYi9leHQyZnMvZXh0ZW50LmMKLWluZGV4IGIz
MjRjN2IwLi4xYTIwNmExNiAxMDA2NDQKLS0tLSBhL2xpYi9leHQyZnMvZXh0ZW50LmMKLSsrKyBi
L2xpYi9leHQyZnMvZXh0ZW50LmMKLUBAIC00OTUsNiArNDk1LDEwIEBAIHJldHJ5OgotIAkJCWV4
dDJmc19sZTE2X3RvX2NwdShlaC0+ZWhfZW50cmllcyk7Ci0gCQluZXdwYXRoLT5tYXhfZW50cmll
cyA9IGV4dDJmc19sZTE2X3RvX2NwdShlaC0+ZWhfbWF4KTsKLSAKLSsJCS8qIE1ha2Ugc3VyZSB0
aGVyZSBpcyBhdCBsZWFzdCBvbmUgZXh0ZW50IHByZXNlbnQgKi8KLSsJCWlmIChuZXdwYXRoLT5s
ZWZ0IDw9IDApCi0rCQkJcmV0dXJuIEVYVDJfRVRfRVhURU5UX05PX0RPV047Ci0rCi0gCQlpZiAo
cGF0aC0+bGVmdCA+IDApIHsKLSAJCQlpeCsrOwotIAkJCW5ld3BhdGgtPmVuZF9ibGsgPSBleHQy
ZnNfbGUzMl90b19jcHUoaXgtPmVpX2Jsb2NrKTsKLUBAIC0xNjMwLDYgKzE2MzQsMTAgQEAgZXJy
Y29kZV90IGV4dDJmc19leHRlbnRfZGVsZXRlKGV4dDJfZXh0ZW50X2hhbmRsZV90IGhhbmRsZSwg
aW50IGZsYWdzKQotIAotIAljcCA9IHBhdGgtPmN1cnI7Ci0gCi0rCS8qIFNhbml0eSBjaGVjayBi
ZWZvcmUgbWVtbW92ZSgpICovCi0rCWlmIChwYXRoLT5sZWZ0IDwgMCkKLSsJCXJldHVybiBFWFQy
X0VUX0VYVEVOVF9MRUFGX0JBRDsKLSsKLSAJaWYgKHBhdGgtPmxlZnQpIHsKLSAJCW1lbW1vdmUo
Y3AsIGNwICsgc2l6ZW9mKHN0cnVjdCBleHQzX2V4dGVudF9pZHgpLAotIAkJCXBhdGgtPmxlZnQg
KiBzaXplb2Yoc3RydWN0IGV4dDNfZXh0ZW50X2lkeCkpOwotLS0gCi0yLjI1LjEKLQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3MvcXVpZXQtZGVi
dWdmcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzL3F1
aWV0LWRlYnVnZnMucGF0Y2gKaW5kZXggZDY5NTU4MGM5Mi4uMGE2OTA0MjA4ZCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3MvcXVpZXQtZGVidWdm
cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZTJmc3Byb2dzL2UyZnNwcm9ncy9x
dWlldC1kZWJ1Z2ZzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyMGJmNTkzNjU2NDZhZjA0
NjZjMTkxMGU4NzYzYjM1MjM4MGIyNmQ2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1
ODBlZjZjYWUyZDM1M2YzYWE1ZDVjNTJkNjYxNGJkYzFkZjUwZjA4IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6
IE1vbiwgMjMgRGVjIDIwMTMgMTM6Mzg6MzQgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gZTJmc3By
b2dzOiBzaWxlbmNlIGRlYnVnZnMKQEAgLTE0LDEwICsxNCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBS
b3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZGVidWdmcy9kZWJ1Z2Zz
LmMgYi9kZWJ1Z2ZzL2RlYnVnZnMuYwotaW5kZXggYjY3YTg4YmMuLjc2ZGQ1NTU2IDEwMDY0NAor
aW5kZXggOWI2MzIxZGMuLjhlYmYzZGRiIDEwMDY0NAogLS0tIGEvZGVidWdmcy9kZWJ1Z2ZzLmMK
ICsrKyBiL2RlYnVnZnMvZGVidWdmcy5jCi1AQCAtMjUxOCw3ICsyNTE4LDcgQEAgc3RhdGljIGlu
dCBzb3VyY2VfZmlsZShjb25zdCBjaGFyICpjbWRfZmlsZSwgaW50IHNzX2lkeCkKK0BAIC0yNTE2
LDcgKzI1MTYsNyBAQCBzdGF0aWMgaW50IHNvdXJjZV9maWxlKGNvbnN0IGNoYXIgKmNtZF9maWxl
LCBpbnQgc3NfaWR4KQogIAkJY3AgPSBzdHJjaHIoYnVmLCAnXHInKTsKICAJCWlmIChjcCkKICAJ
CQkqY3AgPSAwOwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9l
MmZzcHJvZ3NfMS40Ni41LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZz
cHJvZ3NfMS40Ny4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9lMmZzcHJvZ3MvZTJmc3Byb2dzXzEuNDYuNS5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2UyZnNwcm9ncy9lMmZzcHJvZ3NfMS40Ny4wLmJiCmluZGV4IGNl
Y2ViN2VkY2MuLmQ0MmI5NjQzNDMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9l
MmZzcHJvZ3MvZTJmc3Byb2dzXzEuNDYuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZTJmc3Byb2dzL2UyZnNwcm9nc18xLjQ3LjAuYmIKQEAgLTQsMTYgKzQsMTEgQEAgU1JDX1VSSSAr
PSAiZmlsZTovL3JlbW92ZS5sZGNvbmZpZy5jYWxsLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTov
L3J1bi1wdGVzdCBcCiAgICAgICAgICAgIGZpbGU6Ly9wdGVzdC5wYXRjaCBcCiAgICAgICAgICAg
IGZpbGU6Ly9ta2Rpcl9wLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovL2V4dGVudHMucGF0Y2gg
XAotICAgICAgICAgICBmaWxlOi8vMDAwMS1BZGQtb3B0aW9uLXRvLWVuYWJsZS1kaXNhYmxlLWxh
cmdlZmlsZS1zdXBwb3J0LnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtZXh0MmZzLVVz
ZS02NGJpdC1sc2Vlay13aGVuLV9GSUxFX09GRlNFVF9CSVRTLWlzLTY0LnBhdGNoIFwKLSAgICAg
ICAgICAgIgotU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBcCiAgICAgICAgICAgIGZp
bGU6Ly9lMmZzcHJvZ3MtZml4LW1pc3NpbmctY2hlY2stZm9yLXBlcm1pc3Npb24tZGVuaWVkLnBh
dGNoIFwKICAgICAgICAgICAgZmlsZTovL3F1aWV0LWRlYnVnZnMucGF0Y2ggXAogICAgICAgICAg
ICAiCiAKLVNSQ1JFViA9ICIwMjU0MGRlZGQzZGRjNTJjNmFlOGFhYThhOTVjZTc1YzNmOGJlMWMw
IgorU1JDUkVWID0gImY0YzljYzRiZWRhY2RlODQwOGVkZGEzNTIwYTMyZDM4NDIyOTAxMTIiCiBV
UFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJ2KD9QPHB2ZXI+XGQrXC5cZCsoXC5cZCspKikk
IgogCiBFWFRSQV9PRUNPTkYgKz0gIi0tbGliZGlyPSR7YmFzZV9saWJkaXJ9IC0tc2JpbmRpcj0k
e2Jhc2Vfc2JpbmRpcn0gXAotLSAKMi4zNy4zCgo=

--===============8167904118567938034==--

