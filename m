Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2624FC83F14
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:30:13 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.8356.1693449007014948429
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="118365078"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="118365078"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:30:03 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 49477C68E1
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:30:00 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D4EFCFAB7
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:29:59 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 92C272FC2743;
	Thu, 31 Aug 2023 11:29:58 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] createrepo-c: upgrade 0.21.1 -> 1.0.0
Date: Thu, 31 Aug 2023 10:29:52 +0800
Message-Id: <1693448992-27476-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27846.004
X-TMASE-Result: 10-0.228200-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/yaoXHZz/dXlxG3SoAWcU42V/iZ1aNsYG7v44
	pYPD16CL9376qnd+Dz51YH+ohjwCAOCnSW1s2x7bzYK5U+QI3O43l2plwgrtWDBwx50fHFECIUt
	KH5AJM9ki+t+0AiFaYsrbguuTTSDuTBhdFGvbKaeVUcz8XpiS9J79S44FQhjigCOzL6v7C+ffzt
	E5MKQZQ+x0k6sgGdG5MTqMsSzDIREt1HmDlgaHMm03YawHJvPCpfVcx39Kq+4wAYdq1VTXo/hTW
	E9k4RmGwai6ZcdQP8Pw/2iQIYd7OK7Kv+wYXRsgb056mCmF00ZV4BnlVId1nZsoi2XrUn/JmTDw
	p0zM3zoqtq5d3cxkNc8a24tZSZIcs3mLubgiLjJhDmlj0doqQUuyxvv48e3H6qkIVFbHTuLeFpM
	+2DTsHDDynfW4sWCnwVektEBLoa9FmDxa4caNInX9wO9nHXPBU/JCITmuhS7oZbNFHtbIdPl43i
	PWIJMPxwTT797Vag8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:30:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186929

From: Wang Mingyu <wangmy@fujitsu.com>

0001-src-cmd_parser.c-add-a-missing-parameter-name.patch
removed since it's included in 1.0.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...arser.c-add-a-missing-parameter-name.patch | 39 -------------------
 ...repo-c_0.21.1.bb => createrepo-c_1.0.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 41 deletions(-)
 delete mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-src-cmd_parser.c-add-a-missing-parameter-name.patch
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.21.1.bb => createrepo-c_1.0.0.bb} (92%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-src-cmd_parser.c-add-a-missing-parameter-name.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-src-cmd_parser.c-add-a-missing-parameter-name.patch
deleted file mode 100644
index 0d1c6b08fb..0000000000
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-src-cmd_parser.c-add-a-missing-parameter-name.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 970b901e1999f415da8bac205f526c808ddad0ba Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 8 May 2023 10:40:43 +0200
-Subject: [PATCH] src/cmd_parser.c: add a missing parameter name
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This resolves the following error with older versions of gcc:
-| /srv/storage/alex/yocto/build-32/tmp/work/x86_64-linux/createrepo-c-native/0.21.1-r0/git/src/cmd_parser.c: In function ‘duplicated_nevra_option_parser’:
-| /srv/storage/alex/yocto/build-32/tmp/work/x86_64-linux/createrepo-c-native/0.21.1-r0/git/src/cmd_parser.c:76:32: error: parameter name omitted
-|    76 | duplicated_nevra_option_parser(const gchar *,
-|       |                                ^~~~~~~~~~~~~
-| /srv/storage/alex/yocto/build-32/tmp/work/x86_64-linux/createrepo-c-native/0.21.1-r0/git/src/cmd_parser.c:78:32: error: parameter name omitted
-|    78 |                                gpointer,
-|       |                                ^~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/createrepo_c/pull/366]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/cmd_parser.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/cmd_parser.c b/src/cmd_parser.c
-index 97c9ea7..63af7ea 100644
---- a/src/cmd_parser.c
-+++ b/src/cmd_parser.c
-@@ -73,9 +73,9 @@ struct CmdOptions _cmd_options = {
- 
- 
- gboolean
--duplicated_nevra_option_parser(const gchar *,
-+duplicated_nevra_option_parser(const gchar *option_name,
-                                const gchar *value,
--                               gpointer,
-+                               gpointer data,
-                                GError **error)
- {
-     if (!g_strcmp0(value, "keep"))
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb
similarity index 92%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb
index 57f23b8dfd..9b109327c8 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb
@@ -7,11 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0001-include-rpm-rpmstring.h.patch \
-           file://0001-src-cmd_parser.c-add-a-missing-parameter-name.patch \
            file://time64fix.patch \
            "
 
-SRCREV = "0652d7303ce236e596c83c29ccc9bee7868fce6e"
+SRCREV = "0cc13920991b2fb8f87fb9d352bd3394c2983289"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


