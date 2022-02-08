Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A73C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 08:26:40 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.8731.1644308798675540222
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 00:26:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nxkdjxqj;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644308796; i=@fujitsu.com;
	bh=I1BZc9wtCjnKDx75BBoJ8C6LEAxQwsqCOKw1VWvPWs8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=nxkdjxqjOpdNhOPWFpFJXufzRPLXSG5bBTkniiw9/bUS7V4Zx1TFNo6WTd22gxu/I
	 iqVjIKK2h9FnLQuxG0rLA/ngKMUMaessQYQ44mS6t+1+xJBqpZA7BSWrsARLwMK7XT
	 x50yT/lJsvcgYXedTRERULHBJom4BYQ2hU9urLagNqkoMHqBa6JPfc0+W7DOB5KP2L
	 y3mtVEW7CKJhA0wrd/DBrUZrkCVC1aQzszQ/XXgTtzpRs0GOaf8zpvDBlO9qWztdxv
	 sYmShIyboVFfBtuWnwXjmoT+x9qV4SuJbr6Uz1cn2Uycolm8aO007hhW5J8xbSpDrC
	 sSi02E7uH9S8w==
Received: from [100.115.69.41] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 CD/23-23802-C3922026; Tue, 08 Feb 2022 08:26:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJIsWRWlGSWpSXmKPExsViZ8MxSddGkyn
  JYMs7Nos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeNR70uWgjdCFYsfdbA1MN4W6GLk5BASeMwo
  sf9KVhcjF5B9nkli383TbBDOcUaJ9vlNbCBVbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHid
  w87iC0s4CDx98o7FpASFpD4VSeQMK+Ao8TJg1PASiQEFCSmPHzPDBEXlDg58wkLxBgJiYMvXj
  BD1ChKzL7czAJhV0jMmtXGBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVom1SUmZ5RkpuYmaNraGC
  ga2hoqmtmqWtuopdYpZuol1qqm5yaV1KUCJTVSywv1kstLtYrrsxNzknRy0st2cQIDMuUYlev
  HYxH+n7qHWKU5GBSEuVNUmVKEuJLyk+pzEgszogvKs1JLT7EKMPBoSTBe0YcKCdYlJqeWpGWm
  QOMEZi0BAePkgjvNw2gNG9xQWJucWY6ROoUYzjHm7VLFjFzvAWTbffuAsl2MDlzwcHVzByzwO
  T99kNA8gGIFGLJy89LlRLnFQYZJwAyLqM0D24ZLAVcYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7
  BqCQMMYUnM68E7qZXQOcyAZ37ddG/RKBzSxIRUlINTKY/9rfNNz6+dfmbmZxTDgRx9r/KFXCO
  m5ApX/98qaxzXPEcpzNnuJrmFWfuE1Cpufo9uW+pSGt028djhZ99EjZqv3/NnX/p/BVj7Z55J
  3YY596c9Ptl9yqLYmkDs4+vjQ2mVLh1xueFRN9L5vz/yeD69+AYo819niITDaTEpk4rzZH+er
  e7UGpZSJFu6u72atkz4hY1GUtqbDpXLbI1F6ibp3vCrk2l4cEvq/iQTQ/3PjL9PrP7xj7Ovst
  nbDz5NT6uW9U+42vvriOiF9+Z5PqlqjNv5kp72slgv/bD45kvtH64z3n4VKPZIfPwXqFJk+42
  dZV2zBHmPsG9ftvxSbF7OG7r+8nvniZQ3tu+WImlOCPRUIu5qDgRABAUXG98AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-545.messagelabs.com!1644308795!1528!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3248 invoked from network); 8 Feb 2022 08:26:36 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 08:26:36 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9C72010044A
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 08:26:35 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8FD5210033A
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 08:26:35 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 08:26:14 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libmodulemd: upgrade 2.13.0 -> 2.14.0
Date: Tue, 8 Feb 2022 16:26:04 +0800
Message-ID: <1644308767-5300-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 08:26:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161480

Changelog:
=========
Enhancements:
-------------
New functions for stripping XMD from an index
(modulemd_module_index_clear_xmds()), from a module
(modulemd_module_clear_xmds()), and from a version 2 module stream
(modulemd_module_stream_v2_clear_xmd()). This enables you to prevent from leaking
private build options to output modulemd-v2 documents.
Interpret an invalid buildorder 18446744073709551615 as -1 if the library
is built with a new build boolean accept_overflowed_buildorder set to true.
Document module version, buildorder, and epoch limits in the specifications.
Also clarify that an epoch number at RPM artifacts is mandatory.
Document that modulemd_module_get_defaults can return NULL
Improve a documentation for modulemd_module_set_defaults() and
modulemd_module_index_upgrade_defaults() functions.
Improve modulemd-validator(1) manual page.
Drop a build dependency on help2man tool.

Fixes:
------
Fix a crash when updating an index with an invalid subdocument and a NULL
error parameter.
Fix clobbering module defaults on a modulemd_module_set_defaults() error.
Fix modulemd_module_index_upgrade_defaults() to actually use the requested
version.
Reject duplicate contexts in modulemd-packager-v3 documents.
Report an error if modulemd-validator tool is invoked with both --version
option and an unknown option.
Fix an undefined behaviour when comparing integers of different signs.
Fix DNF examples in a documentation.
Actually execute modulemd-obsoletes Python tests.
Fix deprecation warnings in tests with glib2-2.69.0.
Fix deprecation warnings in Python tests and make the test compatible with

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index ee8ce4d6a6..9e32134628 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25a3927bff3ee4f5b21bcb0ed3fcd6bb"
 
 SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=main"
 
-PV = "2.13.0"
-SRCREV = "1a032da198333ee77bdbe4be65e60eb4115ea73f"
+PV = "2.14.0"
+SRCREV = "ee80309bc766d781a144e6879419b29f444d94eb"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


