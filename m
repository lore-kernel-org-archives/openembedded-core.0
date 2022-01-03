Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E12BC433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 06:54:25 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.24306.1641192864791966600
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jan 2022 22:54:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=G3yDjP8T;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641192862; i=@fujitsu.com;
	bh=hI1GfZUHmXAu+5a2TkbRb6sSE1ITiSp4neftjN0gIVo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=G3yDjP8TNIq1pCYTfV2XnWEoLT9T8LwC2W8SsxanS9NYnY+ep3UTu6HGCwC4/7ufD
	 /JquQ7GMSRKmKVoH3Chmhi/M9pAKhus0aC5RPgke+7uzrFq+h27AM0rsSfsdQC5M8m
	 Y09jA9Kt7Kf54KE+Wi1B7i1j6JsaBHhy5cLOI3tVxHvBEikMMZI6uxg9gcpLpP6F14
	 /Wq5hFc8ReEURknLAh2kR9hK8Gt3tdkP3SjdFXls2Jx2fuYNSmh4Whn6C4EucyRzYp
	 KEvh0lKeAQoPVNvM33EdgpYwqgLFGPZEnkth77wFEflc6k0T7k8sviR8rdxDc/Nb7w
	 sTQ2BbXhQ2AiA==
Received: from [100.115.6.48] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id 08/4D-10124-E9D92D16;
 Mon, 03 Jan 2022 06:54:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRWlGSWpSXmKPExsViZ8ORqDtv7qV
  Egwt3WSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oxZE0+wFHTYVOz7NZelgfG6YRcjF4eQwGNG
  iflTVrBBOOeZJLYc2MUI4RxnlNjc0cnaxcjJwSagJjH91g0gm4NDREBP4uo/UZAws4CKxIvfP
  ewgtrCAncSUbcuYQWwWoPiaOTOYQGxeASeJkx+mg9VICChITHn4HqyGU8BZ4sjVK2wgthBQzb
  nL8xgh6gUlTs58wgIxX0Li4IsXzBC9ihKzLzezQNgVErNmtTFB2GoSV89tYp7AKDgLSfssJO0
  LGJlWMVolFWWmZ5TkJmbm6BoaGOgaGprqmukaGRroJVbpJuqlluqWpxaX6BrqJZYX66UWF+sV
  V+Ym56To5aWWbGIEBnFKMdulHYxz+37qHWKU5GBSEuWtVLqYKMSXlJ9SmZFYnBFfVJqTWnyIU
  YaDQ0mC98OsS4lCgkWp6akVaZk5wIiCSUtw8CiJ8O6cApTmLS5IzC3OTIdInWI05th5evEiZo
  7mScu3Mwux5OXnpUqJ8wbPASoVACnNKM2DGwSL9EuMslLCvIwMDAxCPAWpRbmZJajyrxjFORi
  VhHmVZgNN4cnMK4Hb9wroFCagU3i1zoOcUpKIkJJqYGq7EFky+eEeDpEKxUXad24z9fw4HJL1
  +O+d4HXnlBctYZQwt7q/+rq6tFPG20ttLsFXM76di17970r6s6uPrK9+31S6gedrUVRY17oyu
  27PybkVHQdOmjmp3qrdd9702GPdqlPHF7ZW69vvzY470HdFS/iqvsREva7jm2+v3uDdVRDIMr
  HijLJI352vJgvYZgiH3X4Uk/9YozHDdfnGeL+D2z9ZTeH4ouhw/dii9WvX+66VmR8Q8XjZC3M
  m0/5pAg2yxvN9ti55Ecl1Sj/D5b90AVv8t71/L/8rdFmy2qNJpNXgapXTHdev9xg3bvOp2Onh
  7xhbrOAbVV0Xn1PyS8l82d5/+5jEXddq3Yhut1BiKc5INNRiLipOBACFDA/EbwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-587.messagelabs.com!1641192861!538020!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18096 invoked from network); 3 Jan 2022 06:54:22 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Jan 2022 06:54:22 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 96CFF10018C
	for <openembedded-core@lists.openembedded.org>;
 Mon,  3 Jan 2022 06:54:21 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8A209100181
	for <openembedded-core@lists.openembedded.org>;
 Mon,  3 Jan 2022 06:54:21 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 3 Jan 2022 06:53:59 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] e2fsprogs: upgrade 1.46.4 -> 1.46.5
Date: Mon, 3 Jan 2022 14:53:46 +0800
Message-ID: <1641192826-41876-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641192826-41876-1-git-send-email-wangmy@fujitsu.com>
References: <1641192826-41876-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 06:54:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160112

Remove 0001-tests-u_direct_io-expect-correct-expected-output.patch
since it is included in 1.46.5

Changelog:
=========
UI and Features
---------------
When resizing a file system and the inode count exceeds the 2**32 maximum, if
resize2fs can successfully perform the resize by dropping the last block group,
resize2fs will do that in order to allow the file system grow operation to
succeed. For example, using the default inode ratio size of 16k, this will
allow a successful resize to 64TB - 128MB when the storage device is 64TB.

Fixes
--------------
Avoid a potential infinite loop in resize2fs -P when the file system is
corrupted (introduced in e2fsprogs 1.45.5).
(Addresses github issue https://github.com/tytso/e2fsprogs/issues/94)

E2fsck now updates the bg_checksum after fixing problems in the block group
descriptor, which eliminates some unnecessary messages printed or asked of the
system administrator.

Fixed some potential deadlock problems in the unix_io handler in the case of I/O
errors. The fix should also improve the performance of parallel bitmap loading.

Fixed e2fsck's fast commit handling which could result it in crashing when
trying to merge extents when there were none available to be merged.

Fix e2fsck's support of quota limit data, which could sometimes get dropped when
the quota data needs to be regenerated, or when processing the orphan list.

Fix tune2fs to correctly transfer the quota limits when converting quota files
to the internal quota inodes. Also add support for tune2fs to properly handle
the older version 0 quota files.

Fix debugfs's get_quota and list_quota commands so that the header of the report
printed by these commands correctly reflect that the units of used space is in
bytes instead of blocks.

Performance, Internal Implementation, Development Support etc.
Add some additional packages to the setup-schroot script to account for the fact
that the script can be run on older Debian distributions and so the build
dependencies might omit some packages needed to build e2fsprogs on unstable
version of Debian.

Reduce resize2fs's CPU overhead when counting the number of blocks in use which
can reduce the wall clock time for very large file systems by substantial amount

Teach libuuid to use getrandom() or getentropy() if available in favor of
reading from /dev/[u]random.

Teach libss to use libreadline.so.8 if it is available.

Update some test expect files to fix some regression tests that were broken in
e2fsprogs 1.46.4.

If the PRINT_FAILED environment variable is set, failed tests will display the
diff output to make it easier to debug test failures on autobuilders.

Fix various compiler warnings.

Update tst_getsize to use ext2fs_get_size2() to support testing devices which
are larger than 2**32 sectors.

Fixed spelling mistakes in the mke2fs.conf man page.

Update Chinese, Malay, Serbian, Spanish, Swedish, and Ukrainian translations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ct_io-expect-correct-expected-output.patch | 69 -------------------
 ...2fsprogs_1.46.4.bb => e2fsprogs_1.46.5.bb} |  3 +-
 2 files changed, 1 insertion(+), 71 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.46.4.bb => e2fsprogs_1.46.5.bb} (97%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch
deleted file mode 100644
index f198df83eb..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From ea5adf259e01c790f9ba69d6fe88d691de410b6f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Sun, 22 Aug 2021 14:37:32 +0200
-Subject: [PATCH] tests/u_direct_io/expect: correct expected output
-
-This is likely the right fix, but upstream needs to confirm.
-
-Upstream-Status: Inappropriate [issue reported https://github.com/tytso/e2fsprogs/issues/80]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- tests/u_direct_io/expect | 16 +++++++++-------
- 1 file changed, 9 insertions(+), 7 deletions(-)
-
-diff --git a/tests/u_direct_io/expect b/tests/u_direct_io/expect
-index b0cdc730..830cbd75 100644
---- a/tests/u_direct_io/expect
-+++ b/tests/u_direct_io/expect
-@@ -19,8 +19,8 @@ Filesystem OS type:       Linux
- Inode count:              32768
- Block count:              32768
- Reserved block count:     1638
--Overhead clusters:        5131
--Free blocks:              27631
-+Overhead clusters:        6155
-+Free blocks:              26607
- Free inodes:              32757
- First block:              0
- Block size:               4096
-@@ -29,27 +29,29 @@ Reserved GDT blocks:      7
- Blocks per group:         32768
- Fragments per group:      32768
- Inodes per group:         32768
--Inode blocks per group:   1024
-+Inode blocks per group:   2048
- Flex block group size:    16
- Mount count:              0
- Check interval:           15552000 (6 months)
- Reserved blocks uid:      0
- Reserved blocks gid:      0
- First inode:              11
--Inode size:	          128
-+Inode size:	          256
-+Required extra isize:     32
-+Desired extra isize:      32
- Journal inode:            8
- Default directory hash:   half_md4
- Journal backup:           inode blocks
- Directories:              2
-  Group  0: block bitmap at 9, inode bitmap at 25, inode table at 41
--           27631 free blocks, 32757 free inodes, 2 used directories
-+           26607 free blocks, 32757 free inodes, 2 used directories
- e2fsck -fn -N test_filesys $LOOP
- Pass 1: Checking inodes, blocks, and sizes
- Pass 2: Checking directory structure
- Pass 3: Checking directory connectivity
- Pass 4: Checking reference counts
- Pass 5: Checking group summary information
--test_filesys: 11/32768 files (9.1% non-contiguous), 5137/32768 blocks
-+test_filesys: 11/32768 files (9.1% non-contiguous), 6161/32768 blocks
- Exit status is 0
- e2fsck -fn -N test_filesys $TMPFILE
- Pass 1: Checking inodes, blocks, and sizes
-@@ -57,5 +59,5 @@ Pass 2: Checking directory structure
- Pass 3: Checking directory connectivity
- Pass 4: Checking reference counts
- Pass 5: Checking group summary information
--test_filesys: 11/32768 files (9.1% non-contiguous), 5137/32768 blocks
-+test_filesys: 11/32768 files (9.1% non-contiguous), 6161/32768 blocks
- Exit status is 0
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.4.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
similarity index 97%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.4.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
index f42cefcaf9..aa015f1648 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.4.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb
@@ -4,14 +4,13 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
-           file://0001-tests-u_direct_io-expect-correct-expected-output.patch \
            "
 
 SRC_URI:append:class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
                                 file://quiet-debugfs.patch \
 "
 
-SRCREV = "849005eac51ea2097bd9e5f2b0adc16b53c5486d"
+SRCREV = "02540dedd3ddc52c6ae8aaa8a95ce75c3f8be1c0"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.25.1


