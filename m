Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FD1C35FFA
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:19 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.10361.1742048296446677813
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=RdCmA8rs;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Hztat5ow;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101959a2b79be-d5995893-ede7-4e13-be22-fc16d0793cc1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qUd8y5rFv40UMPT1dlvX4LHT3ynWdEBPdykGdBwKuYM=;
	b=RdCmA8rsb1/DK4tFXbeqQZu0pZI/s8UoNyKvVrY5AKK/6uLYY2gGjK3zV11mHbEY
	D75rrtXAB0JyM6/+KsMcmdMDeKA7VVIhwJ8LqKtiJxn50XC6/1JVdHChKv6/jEpND6d
	ubElzdVNvO1cjGK3tPHglQ+B6shdDl6nifjS1EGo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qUd8y5rFv40UMPT1dlvX4LHT3ynWdEBPdykGdBwKuYM=;
	b=Hztat5owYO8PQ+Abk1IXWcwyLiXfcI4KIxKAMxCdhq55Nn4CmmAz20GZ6pqyXRbp
	dIfjHa7hbAqidvAUm54teCJHCUYbty9bLAbbIyIjll26gVLGQhRQHCYF2mL6EJkw8om
	38TPEZcqR9Ush+jvJdqcJ0oO3EEQKOJhuCmdYtGM=
Content-Type: multipart/mixed; boundary="===============7785320370661156735=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.11 SUCCEEDED
Message-ID: <010101959a2b79be-d5995893-ede7-4e13-be22-fc16d0793cc1-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212899

--===============7785320370661156735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ccache* to *4.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.10.2-4.11.patch
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

-- >8 --
From 3f9ed87019af545ef62b109180eb487a60063866 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 07:54:04 +0000
Subject: [PATCH] ccache: upgrade 4.10.2 -> 4.11

---
 .../{ccache_4.10.2.bb => ccache_4.11.bb}      | 78 ++++++++++++++++++-
 1 file changed, 75 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.10.2.bb => ccache_4.11.bb} (31%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.10.2.bb b/meta/recipes-devtools/ccache/ccache_4.11.bb
similarity index 31%
rename from meta/recipes-devtools/ccache/ccache_4.10.2.bb
rename to meta/recipes-devtools/ccache/ccache_4.11.bb
index 361c1643f9..3d392e3a1f 100644
--- a/meta/recipes-devtools/ccache/ccache_4.10.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.11.bb
@@ -1,3 +1,75 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.adoc
+# +++ LICENSE.adoc
+# @@ -35,7 +35,7 @@
+#  
+#  ----
+#  Copyright (C) 2002-2007 Andrew Tridgell
+# -Copyright (C) 2009-2024 Joel Rosdahl and other contributors
+# +Copyright (C) 2009-2025 Joel Rosdahl and other contributors
+#  ----
+#  
+#  
+# @@ -50,7 +50,7 @@
+#  
+#  === src/third_party/blake3/blake3/*
+#  
+# -This is a subset of https://github.com/BLAKE3-team/BLAKE3[BLAKE3] 1.5.1 with the
+# +This is a subset of https://github.com/BLAKE3-team/BLAKE3[BLAKE3] 1.6.1 with the
+#  following license:
+#  
+#  ----
+# @@ -390,13 +390,13 @@
+#  === src/third_party/cpp-httplib/httplib.h
+#  
+#  cpp-httplib - A C++11 cross-platform HTTP/HTTPS library. Copied from cpp-httplib
+# -v0.15.3 downloaded from https://github.com/yhirose/cpp-httplib[cpp-httplib]. The
+# +v0.19.0 downloaded from https://github.com/yhirose/cpp-httplib[cpp-httplib]. The
+#  library has the following license:
+#  
+#  ----
+#  The MIT License (MIT)
+#  
+# -Copyright (c) 2024 yhirose
+# +Copyright (c) 2025 yhirose
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy
+#  of this software and associated documentation files (the "Software"), to deal
+# @@ -450,12 +450,12 @@
+#  
+#  === src/third_party/fmt/fmt/*.h and src/third_party/fmt/fmt/format.cc
+#  
+# -This is a subset of https://fmt.dev[fmt] 10.2.1 with the following license:
+# +This is a subset of https://fmt.dev[fmt] 11.1.4 with the following license:
+#  
+#  ----
+#  Formatting library for C++
+#  
+# -Copyright (c) 2012 - present, Victor Zverovich
+# +Copyright (c) 2012 - present, Victor Zverovich and {fmt} contributors
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy
+#  of this software and associated documentation files (the "Software"), to deal
+# --- src/third_party/cpp-httplib/httplib.h
+# +++ src/third_party/cpp-httplib/httplib.h
+# @@ -1,6 +1,6 @@
+#  //
+#  //  httplib.h
+#  //
+# -//  Copyright (c) 2024 Yuji Hirose. All rights reserved.
+# +//  Copyright (c) 2025 Yuji Hirose. All rights reserved.
+#  //  MIT License
+#  //
+# 
+#
+
 SUMMARY = "a fast C/C++ compiler cache"
 DESCRIPTION = "ccache is a compiler cache. It speeds up recompilation \
 by caching the result of previous compilations and detecting when the \
@@ -7,8 +79,8 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later & MIT & BSL-1.0 & ISC"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=73b86311eaf2b66b0d093ec1a15fa60d \
-                    file://src/third_party/cpp-httplib/httplib.h;endline=6;md5=5389d9f5a88a138e42ba58894bbceeac \
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=b98c3470e22877fefa43a01a2dd0669c \
+                    file://src/third_party/cpp-httplib/httplib.h;endline=6;md5=663aca6f84e7d67ade228aad32afc0ea \
                     file://src/third_party/nonstd-span/nonstd/span.hpp;endline=9;md5=b4af92a7f068b38c5b3410dceb30c186 \
                     file://src/third_party/win32-compat/win32/mktemp.c;endline=17;md5=d287e9c1f1cd2bb2bd164490e1cf449a \
                     "
@@ -17,7 +89,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "108100960bb7e64573ea925af2ee7611701241abb36ce0aae3354528403a7d87"
+SRC_URI[sha256sum] = "7dba208540dc61cedd5c93df8c960055a35f06e29a0a3cf766962251d4a5c766"
 
 inherit cmake github-releases
 
-- 
2.44.1


--===============7785320370661156735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ccache/ccache-dbg: PKGV changed from 4.10.2 [default] to 4.11 [default]
packages/core2-64-poky-linux/ccache/ccache-dbg: PV changed from "4.10.2" to "4.11"
packages/core2-64-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 31974848 to 33721192 (+5%)
packages/core2-64-poky-linux/ccache/ccache-dev: PKGV changed from 4.10.2 [default] to 4.11 [default]
packages/core2-64-poky-linux/ccache/ccache-dev: PV changed from "4.10.2" to "4.11"
packages/core2-64-poky-linux/ccache/ccache-doc: PKGV changed from 4.10.2 [default] to 4.11 [default]
packages/core2-64-poky-linux/ccache/ccache-doc: PV changed from "4.10.2" to "4.11"
packages/core2-64-poky-linux/ccache/ccache-locale: PKGV changed from 4.10.2 [default] to 4.11 [default]
packages/core2-64-poky-linux/ccache/ccache-locale: PV changed from "4.10.2" to "4.11"
packages/core2-64-poky-linux/ccache/ccache-src: PKGV changed from 4.10.2 [default] to 4.11 [default]
packages/core2-64-poky-linux/ccache/ccache-src: PV changed from "4.10.2" to "4.11"
packages/core2-64-poky-linux/ccache/ccache-src: FILELIST: directory renamed /usr/src/debug/ccache/4.10.2/src/third_party/tl-expected/tl -> /usr/src/debug/ccache/4.11/src/third_party/tl-expected/tl, directory renamed /usr/src/debug/ccache/4.10.2/src/third_party/cxxurl/cxxurl -> /usr/src/debug/ccache/4.11/src/third_party/cxxurl/cxxurl, directory renamed /usr/src/debug/ccache/4.10.2/src/third_party/cpp-httplib -> /usr/src/debug/ccache/4.11/src/third_party/cpp-httplib, directory renamed /usr/src/debug/ccache/4.10.2/src/third_party/nonstd-span/nonstd -> /usr/src/debug/ccache/4.11/src/third_party/nonstd-span/nonstd, directory renamed /usr/src/debug/ccache/4.10.2/src/third_party/blake3/blake3 -> /usr/src/debug/ccache/4.11/src/third_party/blake3/blake3, removed "/usr/src/debug/ccache/4.10.2/src/ccache/core/Statistic.hpp /usr/src/debug/ccache/4.10.2/src/ccache/language.hpp /usr/src/debug/ccache/4.10.2/src/ccache/storage/remote/HttpStorage.cpp /usr/src/debug/ccache/4.10.2/src/ccache/util/Durat
 ion.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/path.cpp /usr/src/debug/ccache/4.10.2/src/ccache/util/FileStream.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/ThreadPool.hpp /usr/src/debug/ccache/4.10.2/src/ccache/core/Statistics.cpp /usr/src/debug/ccache/4.10.2/src/ccache/util/filesystem.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/expected.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/format.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/BitSet.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/XXH3_128.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/zstd.cpp /usr/src/debug/ccache/4.10.2/src/ccache/storage/remote/HttpStorage.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/file.cpp /usr/src/debug/ccache/4.10.2/src/ccache/util/time.cpp /usr/src/debug/ccache/4.10.2/src/ccache/Hash.cpp /usr/src/debug/ccache/4.10.2/src/ccache/version.cpp /usr/src/debug/ccache/4.10.2/src/ccache/core/exceptions.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/UmaskScope.cpp /usr/src/debu
 g/ccache/4.10.2/src/ccache/util/environment.cpp /usr/src/debug/ccache/4.10.2/src/ccache/util/PathString.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/zstd.hpp /usr/src/debug/ccache/4.10.2/src/ccache/core/common.cpp /usr/src/debug/ccache/4.10.2/src/ccache/storage/remote/RemoteStorage.cpp /usr/src/debug/ccache/4.10.2/src/ccache/core/Manifest.cpp /usr/src/debug/ccache/4.10.2/src/ccache/core/Manifest.hpp /usr/src/debug/ccache/4.10.2/src/ccache/core/types.hpp /usr/src/debug/ccache/4.10.2/src/ccache/Context.cpp /usr/src/debug/ccache/4.10.2/src/ccache/util/assertions.cpp /usr/src/debug/ccache/4.10.2/src/ccache/util/LongLivedLockFileManager.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/LongLivedLockFileManager.cpp /usr/src/debug/ccache/4.10.2/src/ccache/InodeCache.hpp /usr/src/debug/ccache/4.10.2/src/ccache/storage/remote/RemoteStorage.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/string.cpp /usr/src/debug/ccache/4.10.2/src/ccache/core/MsvcShowIncludesOutput.cpp /usr/src/debug/ccac
 he/4.10.2/src/ccache/core/CacheEntryDataReader.hpp /usr/src/debug/ccache/4.10.2/src/ccache/core/CacheEntryDataWriter.hpp /usr/src/debug/ccache/4.10.2/src/ccache/core/StatisticsCounters.cpp /usr/src/debug/ccache/4.10.2/src/ccache/util/file.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/time.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/UmaskScope.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/environment.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/LockFile.cpp /usr/src/debug/ccache/4.10.2/src/ccache/util/LockFile.hpp /usr/src/debug/ccache/4.10.2/src/ccache/core/Serializer.hpp /usr/src/debug/ccache/4.10.2/src/ccache/hashutil.cpp /usr/src/debug/ccache/4.10.2/src/ccache/SignalHandler.cpp /usr/src/debug/ccache/4.10.2/src/ccache/SignalHandler.hpp /usr/src/debug/ccache/4.10.2/src/ccache/Config.cpp /usr/src/debug/ccache/4.10.2/src/ccache/Config.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/TemporaryFile.cpp /usr/src/debug/ccache/4.10.2/src/ccache/macroskip.hpp /usr/src/debug/
 ccache/4.10.2/src/ccache/core/ResultExtractor.hpp /usr/src/debug/ccache/4.10.2/src/ccache/ProgressBar.cpp /usr/src/debug/ccache/4.10.2/src/ccache/core/ResultInspector.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/Tokenizer.cpp /usr/src/debug/ccache/4.10.2/src/ccache/util/Tokenizer.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/TimePoint.cpp /usr/src/debug/ccache/4.10.2/src/ccache/util/TimePoint.hpp /usr/src/debug/ccache/4.10.2/src/ccache/core/StatsLog.cpp /usr/src/debug/ccache/4.10.2/src/ccache/core/StatsLog.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/DirEntry.cpp /usr/src/debug/ccache/4.10.2/src/ccache/util/DirEntry.hpp /usr/src/debug/ccache/4.10.2/src/ccache/ccache.cpp /usr/src/debug/ccache/4.10.2/src/ccache/ccache.hpp /usr/src/debug/ccache/4.10.2/src/ccache/core/MsvcShowIncludesOutput.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/logging.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/Fd.hpp /usr/src/debug/ccache/4.10.2/src/ccache/core/types.cpp /usr/src/debug/ccach
 e/4.10.2/src/ccache/util/assertions.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/XXH3_64.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/Bytes.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/types.hpp /usr/src/debug/ccache/4.10.2/src/ccache/core/FileRecompressor.cpp /usr/src/debug/ccache/4.10.2/src/ccache/core/FileRecompressor.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/Finalizer.hpp /usr/src/debug/ccache/4.10.2/src/ccache/core/Statistics.hpp /usr/src/debug/ccache/4.10.2/src/ccache/Depfile.cpp /usr/src/debug/ccache/4.10.2/src/ccache/util/Timer.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/TextTable.cpp /usr/src/debug/ccache/4.10.2/src/ccache/ProgressBar.hpp /usr/src/debug/ccache/4.10.2/src/ccache/core/StatisticsCounters.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/TextTable.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/cpu.cpp /usr/src/debug/ccache/4.10.2/src/ccache/core/mainoptions.hpp /usr/src/debug/ccache/4.10.2/src/ccache/ArgsInfo.hpp /usr/src/debug/ccache/4
 .10.2/src/ccache/storage/local/StatsFile.cpp /usr/src/debug/ccache/4.10.2/src/ccache/util/cpu.hpp /usr/src/debug/ccache/4.10.2/src/ccache/core/ResultRetriever.cpp /usr/src/debug/ccache/4.10.2/src/ccache/core/Sloppiness.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/process.cpp /usr/src/debug/ccache/4.10.2/src/ccache/language.cpp /usr/src/debug/ccache/4.10.2/src/ccache/Args.cpp /usr/src/debug/ccache/4.10.2/src/ccache/util/Bytes.cpp /usr/src/debug/ccache/4.10.2/src/ccache/util/ThreadPool.cpp /usr/src/debug/ccache/4.10.2/src/ccache/core/AtomicFile.cpp /usr/src/debug/ccache/4.10.2/src/ccache/util/filesystem.cpp /usr/src/debug/ccache/4.10.2/src/ccache/storage/local/util.cpp /usr/src/debug/ccache/4.10.2/src/ccache/Depfile.hpp /usr/src/debug/ccache/4.10.2/src/ccache/core/CacheEntry.cpp /usr/src/debug/ccache/4.10.2/src/ccache/compopt.cpp /usr/src/debug/ccache/4.10.2/src/ccache/storage/Storage.hpp /usr/src/debug/ccache/4.10.2/src/ccache/execute.cpp /usr/src/debug/ccache/4.10.2/src/ccache/C
 ontext.hpp /usr/src/debug/ccache/4.10.2/src/ccache/execute.hpp /usr/src/debug/ccache/4.10.2/src/ccache/core/CacheEntry.hpp /usr/src/debug/ccache/4.10.2/src/ccache/storage/local/LocalStorage.hpp /usr/src/debug/ccache/4.10.2/src/ccache/core/Result.cpp /usr/src/debug/ccache/4.10.2/src/ccache/storage/remote/FileStorage.hpp /usr/src/debug/ccache/4.10.2/src/ccache/compopt.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/TemporaryFile.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/string.hpp /usr/src/debug/ccache/4.10.2/src/ccache/core/ResultRetriever.hpp /usr/src/debug/ccache/4.10.2/src/ccache/core/ResultExtractor.cpp /usr/src/debug/ccache/4.10.2/src/ccache/core/ResultInspector.cpp /usr/src/debug/ccache/4.10.2/src/ccache/storage/local/StatsFile.hpp /usr/src/debug/ccache/4.10.2/src/ccache/core/common.hpp /usr/src/debug/ccache/4.10.2/src/ccache/core/AtomicFile.hpp /usr/src/debug/ccache/4.10.2/src/ccache/main.cpp /usr/src/debug/ccache/4.10.2/src/ccache/storage/Storage.cpp /usr/src/debug/cc
 ache/4.10.2/src/ccache/util/process.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/MemoryMap.cpp /usr/src/debug/ccache/4.10.2/src/ccache/util/MemoryMap.hpp /usr/src/debug/ccache/4.10.2/src/ccache/hashutil.hpp /usr/src/debug/ccache/4.10.2/src/ccache/storage/local/LocalStorage.cpp /usr/src/debug/ccache/4.10.2/src/ccache/Args.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/NonCopyable.hpp /usr/src/debug/ccache/4.10.2/src/ccache/storage/remote/FileStorage.cpp /usr/src/debug/ccache/4.10.2/src/ccache/core/Result.hpp /usr/src/debug/ccache/4.10.2/src/ccache/storage/local/util.hpp /usr/src/debug/ccache/4.10.2/src/ccache/util/logging.cpp /usr/src/debug/ccache/4.10.2/src/ccache/util/path.hpp /usr/src/debug/ccache/4.10.2/src/ccache/Hash.hpp /usr/src/debug/ccache/4.10.2/src/ccache/core/mainoptions.cpp /usr/src/debug/ccache/4.10.2/src/ccache/argprocessing.cpp /usr/src/debug/ccache/4.10.2/src/ccache/argprocessing.hpp /usr/src/debug/ccache/4.10.2/src/ccache/InodeCache.cpp /usr/src/debug/ccache/4
 .10.2/src/ccache/util/conversion.hpp", added "/usr/src/debug/ccache/4.11/src/ccache/util/direntry.cpp /usr/src/debug/ccache/4.11/src/ccache/util/cpu.cpp /usr/src/debug/ccache/4.11/src/ccache/util/cpu.hpp /usr/src/debug/ccache/4.11/src/ccache/main.cpp /usr/src/debug/ccache/4.11/src/ccache/util/tokenizer.cpp /usr/src/debug/ccache/4.11/src/ccache/core/statistic.hpp /usr/src/debug/ccache/4.11/src/ccache/core/result.cpp /usr/src/debug/ccache/4.11/src/ccache/core/statistics.cpp /usr/src/debug/ccache/4.11/src/ccache/core/resultretriever.hpp /usr/src/debug/ccache/4.11/src/ccache/core/statistics.hpp /usr/src/debug/ccache/4.11/src/ccache/util/filelock.hpp /usr/src/debug/ccache/4.11/src/ccache/util/assertions.cpp /usr/src/debug/ccache/4.11/src/ccache/util/assertions.hpp /usr/src/debug/ccache/4.11/src/ccache/util/lockfile.hpp /usr/src/debug/ccache/4.11/src/ccache/util/process.cpp /usr/src/debug/ccache/4.11/src/ccache/storage/remote/remotestorage.cpp /usr/src/debug/ccache/4.11/src/ccache/util/te
 xttable.hpp /usr/src/debug/ccache/4.11/src/ccache/inodecache.hpp /usr/src/debug/ccache/4.11/src/ccache/core/atomicfile.cpp /usr/src/debug/ccache/4.11/src/ccache/core/atomicfile.hpp /usr/src/debug/ccache/4.11/src/ccache/core/cacheentrydatawriter.hpp /usr/src/debug/ccache/4.11/src/ccache/version.cpp /usr/src/debug/ccache/4.11/src/ccache/storage/local/localstorage.cpp /usr/src/debug/ccache/4.11/src/ccache/progressbar.hpp /usr/src/debug/ccache/4.11/src/ccache/storage/remote/httpstorage.hpp /usr/src/debug/ccache/4.11/src/ccache/util/file.cpp /usr/src/debug/ccache/4.11/src/ccache/util/path.cpp /usr/src/debug/ccache/4.11/src/ccache/util/time.cpp /usr/src/debug/ccache/4.11/src/ccache/util/zstd.cpp /usr/src/debug/ccache/4.11/src/ccache/macroskip.hpp /usr/src/debug/ccache/4.11/src/ccache/util/xxh3_64.hpp /usr/src/debug/ccache/4.11/src/ccache/args.cpp /usr/src/debug/ccache/4.11/src/ccache/hashutil.cpp /usr/src/debug/ccache/4.11/src/ccache/hashutil.hpp /usr/src/debug/ccache/4.11/src/ccache/util
 /environment.cpp /usr/src/debug/ccache/4.11/src/ccache/core/types.cpp /usr/src/debug/ccache/4.11/src/ccache/util/environment.hpp /usr/src/debug/ccache/4.11/src/ccache/signalhandler.cpp /usr/src/debug/ccache/4.11/src/ccache/storage/remote/filestorage.hpp /usr/src/debug/ccache/4.11/src/ccache/core/result.hpp /usr/src/debug/ccache/4.11/src/ccache/argprocessing.hpp /usr/src/debug/ccache/4.11/src/ccache/util/logging.cpp /usr/src/debug/ccache/4.11/src/ccache/core/statisticscounters.cpp /usr/src/debug/ccache/4.11/src/ccache/core/statisticscounters.hpp /usr/src/debug/ccache/4.11/src/ccache/signalhandler.hpp /usr/src/debug/ccache/4.11/src/ccache/storage/local/util.cpp /usr/src/debug/ccache/4.11/src/ccache/util/memorymap.cpp /usr/src/debug/ccache/4.11/src/ccache/util/bytes.hpp /usr/src/debug/ccache/4.11/src/ccache/util/defer.hpp /usr/src/debug/ccache/4.11/src/ccache/util/longlivedlockfilemanager.cpp /usr/src/debug/ccache/4.11/src/ccache/util/timer.hpp /usr/src/debug/ccache/4.11/src/ccache/uti
 l/types.hpp /usr/src/debug/ccache/4.11/src/ccache/util/logging.hpp /usr/src/debug/ccache/4.11/src/ccache/core/cacheentry.cpp /usr/src/debug/ccache/4.11/src/ccache/core/cacheentry.hpp /usr/src/debug/ccache/4.11/src/ccache/util/bitset.hpp /usr/src/debug/ccache/4.11/src/ccache/util/format.hpp /usr/src/debug/ccache/4.11/src/ccache/config.cpp /usr/src/debug/ccache/4.11/src/ccache/core/resultretriever.cpp /usr/src/debug/ccache/4.11/src/ccache/storage/remote/remotestorage.hpp /usr/src/debug/ccache/4.11/src/ccache/core/filerecompressor.hpp /usr/src/debug/ccache/4.11/src/ccache/util/lockfile.cpp /usr/src/debug/ccache/4.11/src/ccache/compopt.hpp /usr/src/debug/ccache/4.11/src/ccache/compopt.cpp /usr/src/debug/ccache/4.11/src/ccache/inodecache.cpp /usr/src/debug/ccache/4.11/src/ccache/util/longlivedlockfilemanager.hpp /usr/src/debug/ccache/4.11/src/ccache/hash.cpp /usr/src/debug/ccache/4.11/src/ccache/argprocessing.cpp /usr/src/debug/ccache/4.11/src/ccache/util/temporaryfile.cpp /usr/src/debug
 /ccache/4.11/src/ccache/core/manifest.hpp /usr/src/debug/ccache/4.11/src/ccache/args.hpp /usr/src/debug/ccache/4.11/src/ccache/config.hpp /usr/src/debug/ccache/4.11/src/ccache/util/direntry.hpp /usr/src/debug/ccache/4.11/src/ccache/core/common.hpp /usr/src/debug/ccache/4.11/src/ccache/util/filesystem.cpp /usr/src/debug/ccache/4.11/src/ccache/util/filesystem.hpp /usr/src/debug/ccache/4.11/src/ccache/util/noncopyable.hpp /usr/src/debug/ccache/4.11/src/ccache/progressbar.cpp /usr/src/debug/ccache/4.11/src/ccache/core/statslog.cpp /usr/src/debug/ccache/4.11/src/ccache/util/string.cpp /usr/src/debug/ccache/4.11/src/ccache/storage/storage.cpp /usr/src/debug/ccache/4.11/src/ccache/storage/storage.hpp /usr/src/debug/ccache/4.11/src/ccache/core/filerecompressor.cpp /usr/src/debug/ccache/4.11/src/ccache/storage/remote/filestorage.cpp /usr/src/debug/ccache/4.11/src/ccache/core/serializer.hpp /usr/src/debug/ccache/4.11/src/ccache/core/resultextractor.cpp /usr/src/debug/ccache/4.11/src/ccache/co
 re/resultinspector.cpp /usr/src/debug/ccache/4.11/src/ccache/storage/remote/httpstorage.cpp /usr/src/debug/ccache/4.11/src/ccache/core/types.hpp /usr/src/debug/ccache/4.11/src/ccache/util/filestream.hpp /usr/src/debug/ccache/4.11/src/ccache/util/pathstring.hpp /usr/src/debug/ccache/4.11/src/ccache/util/string.hpp /usr/src/debug/ccache/4.11/src/ccache/core/statslog.hpp /usr/src/debug/ccache/4.11/src/ccache/language.cpp /usr/src/debug/ccache/4.11/src/ccache/language.hpp /usr/src/debug/ccache/4.11/src/ccache/util/timepoint.hpp /usr/src/debug/ccache/4.11/src/ccache/core/cacheentrydatareader.hpp /usr/src/debug/ccache/4.11/src/ccache/util/tokenizer.hpp /usr/src/debug/ccache/4.11/src/ccache/util/threadpool.cpp /usr/src/debug/ccache/4.11/src/ccache/util/threadpool.hpp /usr/src/debug/ccache/4.11/src/ccache/util/temporaryfile.hpp /usr/src/debug/ccache/4.11/src/ccache/util/timepoint.cpp /usr/src/debug/ccache/4.11/src/ccache/util/memorymap.hpp /usr/src/debug/ccache/4.11/src/ccache/core/resultex
 tractor.hpp /usr/src/debug/ccache/4.11/src/ccache/core/resultinspector.hpp /usr/src/debug/ccache/4.11/src/ccache/storage/local/localstorage.hpp /usr/src/debug/ccache/4.11/src/ccache/storage/local/statsfile.cpp /usr/src/debug/ccache/4.11/src/ccache/storage/local/statsfile.hpp /usr/src/debug/ccache/4.11/src/ccache/core/sloppiness.hpp /usr/src/debug/ccache/4.11/src/ccache/util/process.hpp /usr/src/debug/ccache/4.11/src/ccache/util/umaskscope.cpp /usr/src/debug/ccache/4.11/src/ccache/util/umaskscope.hpp /usr/src/debug/ccache/4.11/src/ccache/util/file.hpp /usr/src/debug/ccache/4.11/src/ccache/util/path.hpp /usr/src/debug/ccache/4.11/src/ccache/util/time.hpp /usr/src/debug/ccache/4.11/src/ccache/core/exceptions.hpp /usr/src/debug/ccache/4.11/src/ccache/util/xxh3_128.hpp /usr/src/debug/ccache/4.11/src/ccache/util/zstd.hpp /usr/src/debug/ccache/4.11/src/ccache/util/filelock.cpp /usr/src/debug/ccache/4.11/src/ccache/core/mainoptions.cpp /usr/src/debug/ccache/4.11/src/ccache/core/mainoptions.
 hpp /usr/src/debug/ccache/4.11/src/ccache/util/texttable.cpp /usr/src/debug/ccache/4.11/src/ccache/execute.cpp /usr/src/debug/ccache/4.11/src/ccache/execute.hpp /usr/src/debug/ccache/4.11/src/ccache/core/msvcshowincludesoutput.hpp /usr/src/debug/ccache/4.11/src/ccache/util/conversion.hpp /usr/src/debug/ccache/4.11/src/ccache/util/duration.hpp /usr/src/debug/ccache/4.11/src/ccache/util/expected.hpp /usr/src/debug/ccache/4.11/src/ccache/util/fd.hpp /usr/src/debug/ccache/4.11/src/ccache/ccache.cpp /usr/src/debug/ccache/4.11/src/ccache/depfile.cpp /usr/src/debug/ccache/4.11/src/ccache/depfile.hpp /usr/src/debug/ccache/4.11/src/ccache/ccache.hpp /usr/src/debug/ccache/4.11/src/ccache/core/msvcshowincludesoutput.cpp /usr/src/debug/ccache/4.11/src/ccache/core/common.cpp /usr/src/debug/ccache/4.11/src/ccache/core/manifest.cpp /usr/src/debug/ccache/4.11/src/ccache/hash.hpp /usr/src/debug/ccache/4.11/src/ccache/context.cpp /usr/src/debug/ccache/4.11/src/ccache/context.hpp /usr/src/debug/ccache
 /4.11/src/ccache/argsinfo.hpp /usr/src/debug/ccache/4.11/src/ccache/storage/local/util.hpp /usr/src/debug/ccache/4.11/src/ccache/util/bytes.cpp"
packages/core2-64-poky-linux/ccache/ccache-src: PKGSIZE changed from 1637075 to 1774933 (+8%)
packages/core2-64-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.10.2 [default] to 4.11 [default]
packages/core2-64-poky-linux/ccache/ccache-staticdev: PV changed from "4.10.2" to "4.11"
packages/core2-64-poky-linux/ccache/ccache: PKGV changed from 4.10.2 [default] to 4.11 [default]
packages/core2-64-poky-linux/ccache/ccache: PV changed from "4.10.2" to "4.11"
packages/core2-64-poky-linux/ccache/ccache: PKGSIZE changed from 1465688 to 1523096 (+4%)
packages/core2-64-poky-linux/ccache: PKGV changed from 4.10.2 [default] to 4.11 [default]
packages/core2-64-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.10.2/ccache-4.10.2.tar.gz" to "https://github.com/ccache/ccache/releases//download/v4.11/ccache-4.11.tar.gz"
packages/core2-64-poky-linux/ccache: PV changed from "4.10.2" to "4.11"

--===============7785320370661156735==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.10.2-4.11.patch"

RnJvbSAzZjllZDg3MDE5YWY1NDVlZjYyYjEwOTE4MGViNDg3YTYwMDYzODY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMDc6NTQ6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
Y2FjaGU6IHVwZ3JhZGUgNC4xMC4yIC0+IDQuMTEKCi0tLQogLi4uL3tjY2FjaGVfNC4xMC4yLmJi
ID0+IGNjYWNoZV80LjExLmJifSAgICAgIHwgNzggKysrKysrKysrKysrKysrKysrLQogMSBmaWxl
IGNoYW5nZWQsIDc1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NjYWNoZS97Y2NhY2hlXzQuMTAuMi5iYiA9PiBjY2FjaGVfNC4xMS5i
Yn0gKDMxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNo
ZV80LjEwLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjExLmJi
CnNpbWlsYXJpdHkgaW5kZXggMzElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9j
Y2FjaGUvY2NhY2hlXzQuMTAuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Nj
YWNoZS9jY2FjaGVfNC4xMS5iYgppbmRleCAzNjFjMTY0M2Y5Li4zZDM5MmUzYTFmIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjEwLjIuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC4xMS5iYgpAQCAtMSwzICsxLDc1
IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0
ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVu
Y2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVw
ZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5n
ZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisj
IChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisj
CisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRS5hZG9jCisjICsrKyBMSUNFTlNFLmFk
b2MKKyMgQEAgLTM1LDcgKzM1LDcgQEAKKyMgIAorIyAgLS0tLQorIyAgQ29weXJpZ2h0IChDKSAy
MDAyLTIwMDcgQW5kcmV3IFRyaWRnZWxsCisjIC1Db3B5cmlnaHQgKEMpIDIwMDktMjAyNCBKb2Vs
IFJvc2RhaGwgYW5kIG90aGVyIGNvbnRyaWJ1dG9ycworIyArQ29weXJpZ2h0IChDKSAyMDA5LTIw
MjUgSm9lbCBSb3NkYWhsIGFuZCBvdGhlciBjb250cmlidXRvcnMKKyMgIC0tLS0KKyMgIAorIyAg
CisjIEBAIC01MCw3ICs1MCw3IEBACisjICAKKyMgID09PSBzcmMvdGhpcmRfcGFydHkvYmxha2Uz
L2JsYWtlMy8qCisjICAKKyMgLVRoaXMgaXMgYSBzdWJzZXQgb2YgaHR0cHM6Ly9naXRodWIuY29t
L0JMQUtFMy10ZWFtL0JMQUtFM1tCTEFLRTNdIDEuNS4xIHdpdGggdGhlCisjICtUaGlzIGlzIGEg
c3Vic2V0IG9mIGh0dHBzOi8vZ2l0aHViLmNvbS9CTEFLRTMtdGVhbS9CTEFLRTNbQkxBS0UzXSAx
LjYuMSB3aXRoIHRoZQorIyAgZm9sbG93aW5nIGxpY2Vuc2U6CisjICAKKyMgIC0tLS0KKyMgQEAg
LTM5MCwxMyArMzkwLDEzIEBACisjICA9PT0gc3JjL3RoaXJkX3BhcnR5L2NwcC1odHRwbGliL2h0
dHBsaWIuaAorIyAgCisjICBjcHAtaHR0cGxpYiAtIEEgQysrMTEgY3Jvc3MtcGxhdGZvcm0gSFRU
UC9IVFRQUyBsaWJyYXJ5LiBDb3BpZWQgZnJvbSBjcHAtaHR0cGxpYgorIyAtdjAuMTUuMyBkb3du
bG9hZGVkIGZyb20gaHR0cHM6Ly9naXRodWIuY29tL3loaXJvc2UvY3BwLWh0dHBsaWJbY3BwLWh0
dHBsaWJdLiBUaGUKKyMgK3YwLjE5LjAgZG93bmxvYWRlZCBmcm9tIGh0dHBzOi8vZ2l0aHViLmNv
bS95aGlyb3NlL2NwcC1odHRwbGliW2NwcC1odHRwbGliXS4gVGhlCisjICBsaWJyYXJ5IGhhcyB0
aGUgZm9sbG93aW5nIGxpY2Vuc2U6CisjICAKKyMgIC0tLS0KKyMgIFRoZSBNSVQgTGljZW5zZSAo
TUlUKQorIyAgCisjIC1Db3B5cmlnaHQgKGMpIDIwMjQgeWhpcm9zZQorIyArQ29weXJpZ2h0IChj
KSAyMDI1IHloaXJvc2UKKyMgIAorIyAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJl
ZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weQorIyAgb2YgdGhpcyBz
b2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJl
IiksIHRvIGRlYWwKKyMgQEAgLTQ1MCwxMiArNDUwLDEyIEBACisjICAKKyMgID09PSBzcmMvdGhp
cmRfcGFydHkvZm10L2ZtdC8qLmggYW5kIHNyYy90aGlyZF9wYXJ0eS9mbXQvZm10L2Zvcm1hdC5j
YworIyAgCisjIC1UaGlzIGlzIGEgc3Vic2V0IG9mIGh0dHBzOi8vZm10LmRldltmbXRdIDEwLjIu
MSB3aXRoIHRoZSBmb2xsb3dpbmcgbGljZW5zZToKKyMgK1RoaXMgaXMgYSBzdWJzZXQgb2YgaHR0
cHM6Ly9mbXQuZGV2W2ZtdF0gMTEuMS40IHdpdGggdGhlIGZvbGxvd2luZyBsaWNlbnNlOgorIyAg
CisjICAtLS0tCisjICBGb3JtYXR0aW5nIGxpYnJhcnkgZm9yIEMrKworIyAgCisjIC1Db3B5cmln
aHQgKGMpIDIwMTIgLSBwcmVzZW50LCBWaWN0b3IgWnZlcm92aWNoCisjICtDb3B5cmlnaHQgKGMp
IDIwMTIgLSBwcmVzZW50LCBWaWN0b3IgWnZlcm92aWNoIGFuZCB7Zm10fSBjb250cmlidXRvcnMK
KyMgIAorIyAgUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRv
IGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weQorIyAgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNz
b2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwKKyMg
LS0tIHNyYy90aGlyZF9wYXJ0eS9jcHAtaHR0cGxpYi9odHRwbGliLmgKKyMgKysrIHNyYy90aGly
ZF9wYXJ0eS9jcHAtaHR0cGxpYi9odHRwbGliLmgKKyMgQEAgLTEsNiArMSw2IEBACisjICAvLwor
IyAgLy8gIGh0dHBsaWIuaAorIyAgLy8KKyMgLS8vICBDb3B5cmlnaHQgKGMpIDIwMjQgWXVqaSBI
aXJvc2UuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisjICsvLyAgQ29weXJpZ2h0IChjKSAyMDI1IFl1
amkgSGlyb3NlLiBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyAgLy8gIE1JVCBMaWNlbnNlCisjICAv
LworIyAKKyMKKwogU1VNTUFSWSA9ICJhIGZhc3QgQy9DKysgY29tcGlsZXIgY2FjaGUiCiBERVND
UklQVElPTiA9ICJjY2FjaGUgaXMgYSBjb21waWxlciBjYWNoZS4gSXQgc3BlZWRzIHVwIHJlY29t
cGlsYXRpb24gXAogYnkgY2FjaGluZyB0aGUgcmVzdWx0IG9mIHByZXZpb3VzIGNvbXBpbGF0aW9u
cyBhbmQgZGV0ZWN0aW5nIHdoZW4gdGhlIFwKQEAgLTcsOCArNzksOCBAQCBIT01FUEFHRSA9ICJo
dHRwOi8vY2NhY2hlLnNhbWJhLm9yZyIKIFNFQ1RJT04gPSAiZGV2ZWwiCiAKIExJQ0VOU0UgPSAi
R1BMLTMuMC1vci1sYXRlciAmIE1JVCAmIEJTTC0xLjAgJiBJU0MiCi1MSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFLmFkb2M7bWQ1PTczYjg2MzExZWFmMmI2NmIwZDA5M2VjMWExNWZh
NjBkIFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy90aGlyZF9wYXJ0eS9jcHAtaHR0
cGxpYi9odHRwbGliLmg7ZW5kbGluZT02O21kNT01Mzg5ZDlmNWE4OGExMzhlNDJiYTU4ODk0YmJj
ZWVhYyBcCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLmFkb2M7bWQ1PWI5OGMz
NDcwZTIyODc3ZmVmYTQzYTAxYTJkZDA2NjljIFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTov
L3NyYy90aGlyZF9wYXJ0eS9jcHAtaHR0cGxpYi9odHRwbGliLmg7ZW5kbGluZT02O21kNT02NjNh
Y2E2Zjg0ZTdkNjdhZGUyMjhhYWQzMmFmYzBlYSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6
Ly9zcmMvdGhpcmRfcGFydHkvbm9uc3RkLXNwYW4vbm9uc3RkL3NwYW4uaHBwO2VuZGxpbmU9OTtt
ZDU9YjRhZjkyYTdmMDY4YjM4YzViMzQxMGRjZWIzMGMxODYgXAogICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vc3JjL3RoaXJkX3BhcnR5L3dpbjMyLWNvbXBhdC93aW4zMi9ta3RlbXAuYztlbmRs
aW5lPTE3O21kNT1kMjg3ZTljMWYxY2QyYmIyYmQxNjQ0OTBlMWNmNDQ5YSBcCiAgICAgICAgICAg
ICAgICAgICAgICIKQEAgLTE3LDcgKzg5LDcgQEAgREVQRU5EUyA9ICJ6c3RkIGZtdCB4eGhhc2gi
CiAKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS8ke0JQfS50
YXIuZ3oiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxMDgxMDA5NjBiYjdlNjQ1NzNlYTkyNWFm
MmVlNzYxMTcwMTI0MWFiYjM2Y2UwYWFlMzM1NDUyODQwM2E3ZDg3IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjdkYmEyMDg1NDBkYzYxY2VkZDVjOTNkZjhjOTYwMDU1YTM1ZjA2ZTI5YTBhM2NmNzY2
OTYyMjUxZDRhNWM3NjYiCiAKIGluaGVyaXQgY21ha2UgZ2l0aHViLXJlbGVhc2VzCiAKLS0gCjIu
NDQuMQoK

--===============7785320370661156735==--

