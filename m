Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E06C3C77B75
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 01:28:16 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.27719.1681867692862797358
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 18:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=I9wmlu9a;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: qiutt@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681867690; i=@fujitsu.com;
	bh=kZcz+qJUfZAArnzgr/FFdNxaxEC/Y5U3VuZLJbrktfo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=I9wmlu9ang+ZT5oJ0Mkdf30+Bk9S+S/o1lYep0iLl/7aesfU3vG4vqxLnmSqLXDTF
	 KtKb78W3+OysUo0I8McVhRkMmqrmB9hu8f7/AhGaWwcxr78vaM6ZyY7lO/kBlEi6Mw
	 linwwB4LhZfNqo9gbWVHHekU8Rl1Nwlo8My8B71vD2eZz+N+j0MWuO4tFcbgqRscHb
	 a/MrXsd6dR5KdLcrB89an7tTn1f0bqqlBDckQ+vSYaqGFibcoEweQRdVSvjUReW+IC
	 ICU8V9I0yXJ1jmTII7gW3RZsYDxqv1N5j+/qBlxmzaM20xFHBUj85urPBfiTYpU7yu
	 FJsOjEkuZN3uw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORqLvS2T7
  FYMEcC4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeNFWxdTwRG+igcNzxgbGFfwdDFycQgJPGaU
  2NDxkQ3Cuc4k8a75BpSzl1HiTc86xi5GTg42AUmJ5c2rmEBsEQFniWuTToLZzALKEt1H5jCD2
  MICthKHZ18Fi7MIqEo0Lv0G1ssr4CDxcfleVhBbQkBOYsfqJ0wQcUGJkzOfsEDMkZA4+OIFM0
  SNosTUjqUsEHalROuHX1C2msTVc5uYJzDyz0LSPgtJ+wJGplWMpsWpRWWpRbrmeklFmekZJbm
  JmTl6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBwZhSzPRuB+Pyvr96hxgl
  OZiURHmbD9ulCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgnWlnnyIkWJSanlqRlpkDjAyYtAQHj
  5IIr4IVUJq3uCAxtzgzHSJ1ilFRSpzX3QkoIQCSyCjNg2uDReMlRlkpYV5GBgYGIZ6C1KLczB
  JU+VeM4hyMSsK8zyyBpvBk5pXATX8FtJgJaLGckg3I4pJEhJRUAxNnguXtzx0TflZ/Y25MLjb
  /x1DzwDPGQKDh/OPapROz71W+bthsUbZQ7ts17y08b92MNU8w8+T52/2Nn12v0SiYw22UcsHf
  5TOznt+MjHlNEqEiDLcO6+am2eXUWL+8HSm9Zma/Sf0LUxsJX8Wr/usXcDhPafaNW1bBGPP6y
  Yb7+xYo1u4MinwamzPlt1y0ZsUfBq+PW50r/18oyjjf/k9Xa9WCW/yRCQWLlgcrnBfXYc0M73
  j26P+OCcwCm+/PbfAtMVp6zNrn3MMu5YJiVyG2t98W8b/UFX+63KGUX/rxXoPLuSnLopvW/73
  NZ2zXvMJsGcuU1y4sAo98t7xye8Dvbm6kXyPX4z7RPjxKiaU4I9FQi7moOBEApCMUxkEDAAA=
X-Env-Sender: qiutt@fujitsu.com
X-Msg-Ref: server-12.tower-591.messagelabs.com!1681867689!109167!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7750 invoked from network); 19 Apr 2023 01:28:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Apr 2023 01:28:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 806531001A3
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 02:28:09 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 73E30100194
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 02:28:09 +0100 (BST)
Received: from localhost.localdomain (10.167.219.96) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 19 Apr 2023 02:28:07 +0100
From: <qiutt@fujitsu.com>
To: <qiutt@fujitsu.com>, <openembedded-core@lists.openembedded.org>
CC: <fnstml-fujitsuten@fujitsu.com>
Subject: [PATCH V2] coreutils: delete gcc parameter for ptest
Date: Wed, 19 Apr 2023 09:27:59 +0800
Message-ID: <1681867679-2913-1-git-send-email-qiutt@fujitsu.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.219.96]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 01:28:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180206

From: Qiu Tingting <qiutt@fujitsu.com>

If gcc is installed in image, ptest result has 4 ERROR.
  ERROR: tests/rm/r-root.sh
  ERROR: tests/rm/rm-readdir-fail.sh
  ERROR: tests/cp/nfs-removal-race.sh
  ERROR: tests/ls/getxattr-speedup.sh

r-root.log as an example:
  --------------------------
  k.c:1:10: fatal error: stdio.h: No such file or directory
  1 | #include <stdio.h>
    |  ^~~~~~~~~
  compilation terminated.
  r-root.sh: set-up failure: failed to build shared library
  ERROR tests/rm/r-root.sh (exit status: 99)
  --------------------------

reason:
  The run-ptest calls make cmd to run test cases.
  In these cases, k.c file is created and compiled by gcc before run.
  There is a stdio.h file in /usr/include/ directory.
  Normally, gcc has /usr/include as part of its default search path.
  But in Makefile, it has the "--sysroot=recipe-sysroot" parameter
  which makes it does not work.

solution:
  Delete "--sysroot=recipe-sysroot" from Makefile.

other:
  If gcc is not installed in image, these cases will be skipped.
---
 meta/recipes-core/coreutils/coreutils_9.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/coreutils/coreutils_9.1.bb b/meta/recipes-core/coreutils/coreutils_9.1.bb
index 4807eefd04..e12a6d6797 100644
--- a/meta/recipes-core/coreutils/coreutils_9.1.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.1.bb
@@ -193,6 +193,7 @@ do_install_ptest () {
     sed -i '/^abs_top_builddir/s/= .*$/= \$\{PWD\}/g' ${D}${PTEST_PATH}/Makefile
     sed -i '/^abs_top_srcdir/s/= .*$/= \$\{PWD\}/g' ${D}${PTEST_PATH}/Makefile
     sed -i '/^built_programs/s/ginstall/install/g' ${D}${PTEST_PATH}/Makefile
+    sed -i '/^CC =/s/ --sysroot=.*recipe-sysroot/ /g' ${D}${PTEST_PATH}/Makefile
     chmod -R 777 ${D}${PTEST_PATH}
 
     # Disable subcase stty-pairs.sh, it will cause test framework hang
-- 
2.25.1


