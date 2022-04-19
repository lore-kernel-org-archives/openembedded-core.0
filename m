Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F9AC47082
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.2584.1650364301798637913
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 03:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KSmLFsB2;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650364300; i=@fujitsu.com;
	bh=xSZHgiRtDtPVmWg2wzQgVkW7pV3mPTD9nSXnJHNMNtk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=KSmLFsB294jFtBVFX70d/gklOL6T/2F0Tc00CYJoTSTML9BVvMj1MxqeYMv6ZRiNK
	 +77nsQ2gGz6KY4KhMmMY75gLOdVV+91lhBt4ejRiLIC4o3cvCVkc/LKMRibtrE51ue
	 S8uyRqqDd9xnghaEP4xcPk1olyQo8oia5izfN4Ym2mcE46q3rlRmfNPrEvB0NOVHx3
	 hgYIhuaQ090K8JgwWRXTqt5R0iAp6zP9NJ4lMf92N27G0QrVKqIn/w5zfjkZrCufo8
	 CnH0cnZ/tK7jtBvWwJZ77rer8WXYVLhQXyE9kVNNQqZqOku0GgFc2/LSWkVBeJvKWK
	 Xmvw0rohvW7Eg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORqNvWH5d
  k8HSzucWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvFmnlDBZbOKS6u3szQwHtXpYuTiEBJ4zCix
  eNZSVgjnPJPEhRtLgBxOIGcPo8SNPfIgNpuAmsT0WzeA4hwcIgJ6Elf/iYKEmQVUJF787mEHC
  QsLWEv0HI0GCbMIqErM6djLAmLzCjhJ/D7SyQZiSwgoSEx5+J4ZxOYUcJY43NPEDrHJSWLz91
  5WiHpBiZMzn7BAjJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n7Aka
  mVYxWSUWZ6RkluYmZObqGBga6hoamusaWuqZGeolVuol6qaW65anFJbpAbnmxXmpxsV5xZW5y
  TopeXmrJJkZg+KYUq5vsYOxe+VPvEKMkB5OSKG99VFySEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
  Qne0E6gnGBRanpqRVpmDjCWYNISHDxKIryPuoDSvMUFibnFmekQqVOMuhxrGw7sZRZiycvPS5
  US5xVrASoSACnKKM2DGwGL60uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHkP9gJN4cnMK4H
  b9AroCCagI6qnxIIcUZKIkJJqYFKvepIW8OXmxN32b9h+Jq5IZt/tv0az/Zzw/dSk79tsGrXL
  Zh9f3Hr/0xmxox/Sfq20udr59NriYzHzVrxkdqj3D9qc91M74r5D/A3Fea+8+nvXHz/ZyM3nz
  aDEfPHKyUgewzOMduFyHlVRvstCJtel/bsRzugfrNW+VWr1sXVmP2xsenrr5E+f3RYx893+NL
  +Ld66LbI/wEA+fGnh6kuVBs+j963LWpR5PPs7eqim0uXzG867UUjb3aqEQM4/NWhciWPKS42v
  43dc+2Njpl7e6eP6iy7x8d6WqXPasSdya+yWhx77t7LqKjdYOWYUiTPEOhxqXd7zKnLuM+c3U
  CaHRE7eKvGq4rezTdS9koRJLcUaioRZzUXEiAPuKKZJmAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-571.messagelabs.com!1650364294!271155!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21875 invoked from network); 19 Apr 2022 10:31:34 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Apr 2022 10:31:34 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 5D1C1100196
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 11:31:34 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 36300100192
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 11:31:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Apr 2022 11:31:29 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gptfdisk: upgrade 1.0.8 -> 1.0.9
Date: Tue, 19 Apr 2022 18:31:19 +0800
Message-ID: <1650364280-23104-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650364280-23104-1-git-send-email-wangmy@fujitsu.com>
References: <1650364280-23104-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164621

0001-gptcurses-correct-ncurses-6.3-errors.patch
removed since it's included in 1.0.9.

Changelog:
===========
- Added support for aligning partitions' end points. This feature affects the
  default partition size when using n in gdisk; it affects the default
  partition size in cgdisk; and it's activated by the new -I option in sgdisk.
  See the programs' respective man pages for details. This feature is intended
  to help with LUKS2 encryption, which reacts badly to partitions that are not
  sized as exact multiples of the encryption block size.
- Added several new partition type codes:
      FreeBSD nandfs (0xa506)
      Apple APFS Pre-Boot (0xaf0b)
      Apple APFS Recovery (0xaf0c)
      ChromeOS firmware (0x7f03)
      ChromeOS mini-OS (0x7f04)
      ChromeOS hibernate (0x7f05)
      U-Boot boot loader (0xb000)
      27 (!) codes for Fuchsia (0xf100 to 0xf11a)
- Added the ability to build sgdisk and cgdisk for Windows.
- Added a check for too-small disks (most likely to be an issue when trying to
  use a too-small disk image); program now aborts if this happens.
- Removed stray debugging code that caused partNum is x to be printed when
  changing a partition's name with sgdisk.
- Fixed build problems with recent versions of ncurses.
- Fixed bug that caused cgdisk to report incorrect partition attributes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...gptcurses-correct-ncurses-6.3-errors.patch | 99 -------------------
 .../{gptfdisk_1.0.8.bb => gptfdisk_1.0.9.bb}  |  3 +-
 2 files changed, 1 insertion(+), 101 deletions(-)
 delete mode 100644 meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correct-ncurses-6.3-errors.patch
 rename meta/recipes-devtools/fdisk/{gptfdisk_1.0.8.bb => gptfdisk_1.0.9.bb} (88%)

diff --git a/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correct-ncurses-6.3-errors.patch b/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correct-ncurses-6.3-errors.patch
deleted file mode 100644
index cbd1365080..0000000000
--- a/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correct-ncurses-6.3-errors.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From e301f7dd650c9e56f954a7c49661d938079e1a9b Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 25 Oct 2021 17:27:51 +0200
-Subject: [PATCH] gptcurses: correct ncurses 6.3 errors
-
-Upstream-Status: Submitted [by email to rodsmith@rodsbooks.com]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- gptcurses.cc | 28 ++++++++++++++--------------
- 1 file changed, 14 insertions(+), 14 deletions(-)
-
-diff --git a/gptcurses.cc b/gptcurses.cc
-index d0de024..70be999 100644
---- a/gptcurses.cc
-+++ b/gptcurses.cc
-@@ -235,22 +235,22 @@ Space* GPTDataCurses::ShowSpace(int spaceNum, int lineNum) {
-       ClearLine(lineNum);
-       if (space->partNum == -1) { // space is empty
-          move(lineNum, 12);
--         printw(BytesToIeee((space->lastLBA - space->firstLBA + 1), blockSize).c_str());
-+         printw("%s",BytesToIeee((space->lastLBA - space->firstLBA + 1), blockSize).c_str());
-          move(lineNum, 24);
--         printw("free space");
-+         printw("%s","free space");
-       } else { // space holds a partition
-          move(lineNum, 3);
-          printw("%d", space->partNum + 1);
-          move(lineNum, 12);
--         printw(BytesToIeee((space->lastLBA - space->firstLBA + 1), blockSize).c_str());
-+         printw("%s",BytesToIeee((space->lastLBA - space->firstLBA + 1), blockSize).c_str());
-          move(lineNum, 24);
--         printw(space->origPart->GetTypeName().c_str());
-+         printw("%s",space->origPart->GetTypeName().c_str());
-          move(lineNum, 50);
-          #ifdef USE_UTF16
-          space->origPart->GetDescription().extract(0, 39, temp, 39);
--         printw(temp);
-+         printw("%s",temp);
-          #else
--         printw(space->origPart->GetDescription().c_str());
-+         printw("%s",space->origPart->GetDescription().c_str());
-          #endif
-       } // if/else
-    } // if
-@@ -267,10 +267,10 @@ int GPTDataCurses::DisplayParts(int selected) {
- 
-    move(lineNum++, 0);
-    theLine = "Part. #     Size        Partition Type            Partition Name";
--   printw(theLine.c_str());
-+   printw("%s",theLine.c_str());
-    move(lineNum++, 0);
-    theLine = "----------------------------------------------------------------";
--   printw(theLine.c_str());
-+   printw("%s",theLine.c_str());
-    numToShow = LINES - RESERVED_TOP - RESERVED_BOTTOM;
-    pageNum = selected / numToShow;
-    for (i = pageNum * numToShow; i <= (pageNum + 1) * numToShow - 1; i++) {
-@@ -284,7 +284,7 @@ int GPTDataCurses::DisplayParts(int selected) {
-             } else {
-                currentSpace = ShowSpace(i, lineNum);
-                move(lineNum++, 0);
--               printw(">");
-+               printw("%s",">");
-             }
-             DisplayOptions(i);
-             retval = selected;
-@@ -632,7 +632,7 @@ void GPTDataCurses::DisplayOptions(char selectedKey) {
-          } // if/else
-       } // for
-       move(LINES - 1, (COLS - optionDesc.length()) / 2);
--      printw(optionDesc.c_str());
-+      printw("%s",optionDesc.c_str());
-       currentKey = selectedKey;
-    } // if
- } // GPTDataCurses::DisplayOptions()
-@@ -744,11 +744,11 @@ void GPTDataCurses::DrawMenu(void) {
- 
-    clear();
-    move(0, (COLS - title.length()) / 2);
--   printw(title.c_str());
-+   printw("%s",title.c_str());
-    move(2, (COLS - drive.length()) / 2);
--   printw(drive.c_str());
-+   printw("%s",drive.c_str());
-    move(3, (COLS - size.str().length()) / 2);
--   printw(size.str().c_str());
-+   printw("%s",size.str().c_str());
-    DisplayParts(currentSpaceNum);
- } // DrawMenu
- 
-@@ -798,7 +798,7 @@ void PromptToContinue(void) {
- void Report(string theText) {
-    clear();
-    move(0, 0);
--   printw(theText.c_str());
-+   printw("%s", theText.c_str());
-    move(LINES - 2, (COLS - 29) / 2);
-    printw("Press any key to continue....");
-    cbreak();
diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.8.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
similarity index 88%
rename from meta/recipes-devtools/fdisk/gptfdisk_1.0.8.bb
rename to meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
index 67b83b6ead..e473b9cd55 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.8.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
@@ -9,9 +9,8 @@ DEPENDS = "util-linux"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-gptcurses-correctly-include-curses.h.patch \
-           file://0001-gptcurses-correct-ncurses-6.3-errors.patch \
            "
-SRC_URI[sha256sum] = "95d19856f004dabc4b8c342b2612e8d0a9eebdd52004297188369f152e9dc6df"
+SRC_URI[sha256sum] = "dafead2693faeb8e8b97832b23407f6ed5b3219bc1784f482dd855774e2d50c2"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/gptfdisk/files/gptfdisk/"
 UPSTREAM_CHECK_REGEX = "/gptfdisk/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.25.1


