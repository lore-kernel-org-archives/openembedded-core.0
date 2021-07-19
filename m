Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.25500.1626685195821608287
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jul 2021 01:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IsK0Afpj;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626685193; i=@fujitsu.com;
	bh=7VAdpppsVTVKhNOUAj2Yr9YPpCjBB/su1yoeXJXrdsY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=IsK0AfpjL2a8NrXXMzCDdWnfFDo/YA8NSZYgqTmR2nkFSbAyAwZJGdWht5ZNeKdXu
	 kwAYgaFLa8cDoX0iJe5nPv4/NEBRQ9QwQvcUxuUTdyqK4m0EFq+utwiQU4/vPE5xET
	 2YlPRljt0zRDzliF4/oKpBO2MbQlJRqjUdqXd/p8fq/HYfXTCVJoq8pRsjM3fxtrOS
	 6bjnpAyjZcmNNxeeuorVkLL4kZ9ri+kIEJjQaIGag9O3nD/xA392EooU/1nfse8Sg+
	 bXngvuu95CEOl1tUKZ7ClYhSi+8Oj+NDvlicsRXKpHA6LHgcLVWuH0Z3z5jKsE0uSK
	 bv/2yEuwFAASg==
Received: from [100.112.192.148] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 08/5F-31114-80F35F06; Mon, 19 Jul 2021 08:59:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MRosth/zX
  B4OZVOYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaNh6nzGgqMyFVubWlgaGLdLdDFycQgJbGWS
  uLbxMjuEc5JRYk/3TtYuRk4ONgE1iem3bgDZHBwiAnoSV/+JgoSZBVQkXvzuYQexhQXsJDrbZ
  oOVswioSmxrfQwW5xVwkng17T4LiC0hoCAx5eF7Zoi4oMTJmU9YIOZISBx88YIZokZRYvblZh
  aQVRIClRI3HqdOYOSdhaRjFpKOBYxMqxgtkooy0zNKchMzc3QNDQx0DQ2NdA0tgdjERC+xSjd
  RL7VUtzy1uETXUC+xvFivuDI3OSdFLy+1ZBMjMLhSCg5M2MG4//UHvUOMkhxMSqK8DRJfE4T4
  kvJTKjMSizPii0pzUosPMcpwcChJ8D6xBcoJFqWmp1akZeYAAx0mLcHBoyTC+8AYKM1bXJCYW
  5yZDpE6xagoJc6rZQeUEABJZJTmwbXBousSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeRZ
  DtPJl5JXDTXwEtZgJazLrwI8jikkSElFQD04ztnh/tQ/4qvQhXbufPc9/2/Xpi98aTS9lmpJk
  G/7EKNWYKuMd0ZyXD5BJpPR/tI8kebmfX5DGH6LH/z4nmjjpm5892e4e+s4LXA17fgwrHkzQc
  dA/+llDbMl/D39Op6t7FDw+4faS3yLCpSy8xZb/qc+3yprUHQiTsrJi25rovTX1dO2XSqZpn0
  xmSHb+5Lo2y88idYuvl937dI/cLkzNY5851L89WUHjoMftUysTtcdNKf29VbGbYxVL3guvG4w
  1/FR7+ZHyx2WmOsbOV/aJ5i/Jv37qs6O7g/e8m57QQ7agKrq6dnYJ/9mfrim8I1C3NOJSfu+7
  C0Q1m1qJXU//JbOuKmPxdUblt0W9DJZbijERDLeai4kQAkvQCgCkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-271.messagelabs.com!1626685192!308547!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23279 invoked from network); 19 Jul 2021 08:59:52 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-13.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Jul 2021 08:59:52 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16J8xkcw031317
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jul 2021 09:59:52 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 19 Jul 2021 09:59:44 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] btrfs-tools: upgrade 5.12.1 -> 5.13
Date: Mon, 19 Jul 2021 16:59:28 +0800
Message-ID: <1626685168-36521-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

    Add patch to fix bug for undeclared macro on musl.

    btrfs-progs-5.13 (2021-07-13)
    * restore: remove loop checks for extent count and directory scan
    * inspect dump-tree: new options to print node (--csum-headers) and data
      checksums (--csum-items)
    * fi usage:
      * print stripe count for striped profiles
      * print zoned information: size, total unusable
    * mkfs: print note about sha256 accelerated module loading issue
    * check: ability to reset dev_item::bytes_used
    * fixes
      * detect zoned kernel support at run time too
      * exclusive op running check return value
    * fi resize: support cancel (kernel 5.14)
    * device remove: support cancel (kernel 5.14)
    * documentation about general topics
      * compression
      * zoned mode
      * storage model
      * hardware considerations
    * other
      * libbtrfsutil API overview
      * help text fixes and updates
      * hash speedtest measure time, cycles using perf and print throughput

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...x-error-for-undeclared-macro-on-musl.patch | 28 +++++++++++++++++++
 ...fs-tools_5.12.1.bb => btrfs-tools_5.13.bb} |  3 +-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-fix-error-for-undeclared-macro-on-musl.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.12.1.bb => btrfs-tools_5.13.bb} (95%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-fix-error-for-undeclared-macro-on-musl.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-fix-error-for-undeclared-macro-on-musl.patch
new file mode 100644
index 0000000000..251f5d2b0e
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-fix-error-for-undeclared-macro-on-musl.patch
@@ -0,0 +1,28 @@
+From a9802902d37b83c2c992cfe34179312f7209a962 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Mon, 19 Jul 2021 10:12:12 +0900
+Subject: [PATCH] fix error for undeclared macro on musl 
+
+Fixes the following compilation errors with musl that does not have
+NAME_MAX declared:
+'NAME_MAX' undeclared (first use in this function)
+
+Upstream-Status: Pending
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ cmds/filesystem-usage.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cmds/filesystem-usage.c b/cmds/filesystem-usage.c
+index 50d8995e..856e9d7b 100644
+--- a/cmds/filesystem-usage.c
++++ b/cmds/filesystem-usage.c
+@@ -24,6 +24,7 @@
+ #include <stdarg.h>
+ #include <getopt.h>
+ #include <fcntl.h>
++#include <limits.h>
+ 
+ #include "common/utils.h"
+ #include "kerncompat.h"
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.13.bb
similarity index 95%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.13.bb
index d0c9cf2a99..fa33cad7b9 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.13.bb
@@ -19,8 +19,9 @@ DEPENDS_append_class-target = " udev"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            file://0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch \
+           file://0001-fix-error-for-undeclared-macro-on-musl.patch \
            "
-SRCREV = "96d77fcefdd3b9fd297b5aabbce6dc43e2315ee2"
+SRCREV = "de4914dbfd7e419d1c534b3d2ec8728e702114bf"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.25.1

