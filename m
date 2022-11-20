Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55580C43219
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 13:31:50 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.12312.1668951100174541724
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 05:31:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AXJxnkia;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id b12so2423103wrn.2
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 05:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbc5EgRhoEOFPeluWYncnUodtfg5htTlhV5WsNpt6Wc=;
        b=AXJxnkiadp7XUxMyYrBQPeoUOV1q54i0CLxR69iTcWk2rTu2amhB7qZ940d7yz2K/h
         rvgB5ud8DMIuvUSvHH3/ZF+NA675Dk7nsz74laThWPS9NwydeBtJiQOFl005NGmWOer+
         tOFqV1Yh+5b9p+LlqjTj8f5t8tCtSdnJPq5qnH4xZWUfcqVJImvw3E6yOK150zdLO4hY
         DHd61mErYcQmjCC8n882k8ylXImwwKp2bpqx0yK3yxDRelsa0p7LHjDRFG4eyPkZOjBJ
         W905eWQdGlbRynMTsAzu2ztQvK4fAyz74Aycgi760EHerYgPj/g1ZSg8Iyasm+iJNaFs
         lEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbc5EgRhoEOFPeluWYncnUodtfg5htTlhV5WsNpt6Wc=;
        b=5J1rI/6KX2ulr0f1vdSFSWhBxk0EzXWdRQi/xJ3D/AHuE4tQ062vSpiHGCTgm2sVwr
         YgXzWXaAmCdOsSt/uvPxfSF6HNphXNGP7AIe1UvWGhIBiZZRjkDJOCXRJHRCqwNdeOSC
         A5t68FUGNoDSZe6gCWUB0cyDLibl4QziORmr6cFNeY+KgBBIIMTPRaeJBHHUOfc/dhCZ
         YI7IHmM80hvEitIBbqto0loPhXloQXE3xA/NvGX0yc+JIDtHDA/snsQLTX47Xh6nNiPn
         YPCswyt6X8Ppd6WuRgN8tU24nqu24zxSyAhfgrk0pqQYySpDN8PGCMlOROHLtcEnfg45
         qmXQ==
X-Gm-Message-State: ANoB5pmmBCkNCwESia+j8xLjUaxw6ZWu31W/mAJGB9I6wLTrtDCLOYEI
	CofA0GLnpFRbIrI3FngGLOJgqgYygX8=
X-Google-Smtp-Source: AA0mqf5uG7g824YnWDf764cnSzXRjQd1TMSD+3/B1mvCQYOIll0t5tR7PVy73rhE6tP+GR3+Wd1MfQ==
X-Received: by 2002:a5d:65ca:0:b0:236:8322:4be9 with SMTP id e10-20020a5d65ca000000b0023683224be9mr8584365wrw.171.1668951100759;
        Sun, 20 Nov 2022 05:31:40 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c1c9200b003b47b80cec3sm16295551wms.42.2022.11.20.05.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 05:31:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/17] popt: update 1.18 -> 1.19
Date: Sun, 20 Nov 2022 14:31:21 +0100
Message-Id: <20221120133122.2464634-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221120133122.2464634-1-alex@linutronix.de>
References: <20221120133122.2464634-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 13:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173597

Patch is merged upstream.

License-update: clarification
https://github.com/rpm-software-management/popt/commit/dcec86df3cfc96d3dd3a3e9f7f1086b768d2d88f

Backport a regression fix for gptfdisk.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...h-of-sgdisk-when-compiled-with-lates.patch | 59 ++++++++++++++++
 meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb |  1 +
 ...01-popt-test-output-format-for-ptest.patch | 68 -------------------
 .../popt/{popt_1.18.bb => popt_1.19.bb}       | 12 ++--
 4 files changed, 65 insertions(+), 75 deletions(-)
 create mode 100644 meta/recipes-devtools/fdisk/gptfdisk/0001-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch
 delete mode 100644 meta/recipes-support/popt/popt/0001-popt-test-output-format-for-ptest.patch
 rename meta/recipes-support/popt/{popt_1.18.bb => popt_1.19.bb} (74%)

diff --git a/meta/recipes-devtools/fdisk/gptfdisk/0001-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch b/meta/recipes-devtools/fdisk/gptfdisk/0001-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch
new file mode 100644
index 0000000000..218d9d6713
--- /dev/null
+++ b/meta/recipes-devtools/fdisk/gptfdisk/0001-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch
@@ -0,0 +1,59 @@
+From 5d5e76d369a412bfb3d2cebb5fc0a7509cef878d Mon Sep 17 00:00:00 2001
+From: Rod Smith <rodsmith@rodsbooks.com>
+Date: Fri, 15 Apr 2022 18:10:14 -0400
+Subject: [PATCH] Fix failure & crash of sgdisk when compiled with latest popt
+ (commit 740; presumably eventually release 1.19)
+
+Upstream-Status: Backport [https://sourceforge.net/p/gptfdisk/code/ci/5d5e76d369a412bfb3d2cebb5fc0a7509cef878d/]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ NEWS      | 8 ++++++++
+ gptcl.cc  | 2 +-
+ support.h | 2 +-
+ 3 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index c7add56..9e153fd 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,3 +1,11 @@
++1.0.10 (?/??/2022):
++-------------------
++
++- Fixed problem that caused sgdisk to crash with errors about being unable
++  to read the disk's partition table when compiled with the latest popt
++  (commit 740, which is pre-release as I type; presumably version 1.19 and
++  later once released).
++
+ 1.0.9 (4/14/2022):
+ ------------------
+ 
+diff --git a/gptcl.cc b/gptcl.cc
+index 34c9421..0d578eb 100644
+--- a/gptcl.cc
++++ b/gptcl.cc
+@@ -155,7 +155,7 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
+    } // while
+ 
+    // Assume first non-option argument is the device filename....
+-   device = (char*) poptGetArg(poptCon);
++   device = strdup((char*) poptGetArg(poptCon));
+    poptResetContext(poptCon);
+ 
+    if (device != NULL) {
+diff --git a/support.h b/support.h
+index 8ba9ad1..f91f1bc 100644
+--- a/support.h
++++ b/support.h
+@@ -8,7 +8,7 @@
+ #include <stdlib.h>
+ #include <string>
+ 
+-#define GPTFDISK_VERSION "1.0.9"
++#define GPTFDISK_VERSION "1.0.9.1"
+ 
+ #if defined (__FreeBSD__) || defined (__FreeBSD_kernel__) || defined (__APPLE__)
+ // Darwin (Mac OS) & FreeBSD: disk IOCTLs are different, and there is no lseek64
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
index 2c093c20ae..4a25945363 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
@@ -10,6 +10,7 @@ DEPENDS = "util-linux"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-gptcurses-correctly-include-curses.h.patch \
            file://0001-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch \
+           file://0001-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch \
            "
 SRC_URI[sha256sum] = "dafead2693faeb8e8b97832b23407f6ed5b3219bc1784f482dd855774e2d50c2"
 
diff --git a/meta/recipes-support/popt/popt/0001-popt-test-output-format-for-ptest.patch b/meta/recipes-support/popt/popt/0001-popt-test-output-format-for-ptest.patch
deleted file mode 100644
index 020949cc34..0000000000
--- a/meta/recipes-support/popt/popt/0001-popt-test-output-format-for-ptest.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 330b77081c3a4c7ae76cb08602db385b40fa7ff7 Mon Sep 17 00:00:00 2001
-From: Simone Weiss <simone.weiss@elektrobit.com>
-Date: Mon, 13 Dec 2021 09:29:53 +0000
-Subject: [PATCH] popt test output format for ptest
-
-patch test output format to match simple-test as it is used in ptests.
-
-Upstream-Status: Pending
-    
-Signed-off-by: Simone Weiss <simone.weiss@elektrobit.com>
-Signed-off-by: David Niederpruem <david.niederpruem@elektrobit.com>
----
- tests/testit.sh | 20 ++++++++------------
- 1 file changed, 8 insertions(+), 12 deletions(-)
-
-diff --git a/tests/testit.sh b/tests/testit.sh
-index 2a7b4aa..50b42e2 100755
---- a/tests/testit.sh
-+++ b/tests/testit.sh
-@@ -5,12 +5,11 @@ run() {
-     name=$1; shift
-     answer=$1; shift
- 
--    echo Running test $name.
--
-     result=`HOME=$builddir $builddir/$prog $*`
-     if [ "$answer" != "$result" ]; then
--	echo "Test \"$prog $*\" failed with: \"$result\" != \"$answer\" "
--	exit 2
-+        echo "FAIL: $name"
-+    else
-+        echo "PASS: $name"
-     fi
- }
- 
-@@ -23,17 +22,17 @@ run_diff() {
-     out=$builddir/tmp.out
-     diff_file=$builddir/tmp.diff
- 
--    echo Running test $name.
--
-     $builddir/$prog $in_file > $out
-     ret=$?
-     diff $out $answer_file > $diff_file
-     diff_ret=$?
- 
-     if [ "$diff_ret" != "0" ]; then
--       echo "Test \"$name\" failed output is in $out, diff is:"
--       cat $diff_file
--       exit 2
-+        echo "FAIL: $name"
-+        echo "diff is:"
-+        cat $diff_file
-+    else
-+        echo "PASS: $name"
-     fi
-     rm $out $diff_file
- }
-@@ -174,6 +173,3 @@ Help options:
- #run_diff test3 "test3 - 51" test3-data/01.input test3-data/01.answer
- #run_diff test3 "test3 - 52" test3-data/02.input test3-data/02.answer
- #run_diff test3 "test3 - 53" test3-data/03.input test3-data/03.answer
--
--echo ""
--echo "Passed."
--- 
-2.17.1
-
diff --git a/meta/recipes-support/popt/popt_1.18.bb b/meta/recipes-support/popt/popt_1.19.bb
similarity index 74%
rename from meta/recipes-support/popt/popt_1.18.bb
rename to meta/recipes-support/popt/popt_1.19.bb
index b465f8817d..b1d8bea790 100644
--- a/meta/recipes-support/popt/popt_1.18.bb
+++ b/meta/recipes-support/popt/popt_1.19.bb
@@ -4,16 +4,14 @@ HOMEPAGE = "https://www.rpm.org/"
 SECTION = "libs"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=cb0613c30af2a8249b8dcc67d3edb06d"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e0206ac9471d06667e076212db20c5f4"
 
 DEPENDS = "virtual/libiconv"
 
-SRC_URI = "\
-    http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \
-    file://0001-popt-test-output-format-for-ptest.patch \
-    file://run-ptest \
-"
-SRC_URI[sha256sum] = "5159bc03a20b28ce363aa96765f37df99ea4d8850b1ece17d1e6ad5c24fdc5d1"
+SRC_URI = "http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \
+           file://run-ptest \
+           "
+SRC_URI[sha256sum] = "c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987fdad3ca2758c63240f9"
 
 inherit autotools gettext ptest
 
-- 
2.30.2


