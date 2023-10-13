Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A3BCDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 08:56:28 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.34284.1697187379688329227
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 01:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="137479555"
X-IronPort-AV: E=Sophos;i="6.03,221,1694703600"; 
   d="scan'208";a="137479555"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 17:56:17 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A88BCD424E
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 17:56:14 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id DA7E5D88DB
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 17:56:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2287020050184;
	Fri, 13 Oct 2023 17:56:13 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] createrepo-c: upgrade 1.0.0 -> 1.0.1
Date: Fri, 13 Oct 2023 16:56:07 +0800
Message-Id: <1697187367-3967-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.006
X-TMASE-Result: 10--2.334700-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yTo39wOA02LhGEfoClqBl87fUZT83lbkEJYv
	gWqjMEzaNYCBzzxsUnvZ5eN1eJMdpVpCIuRr0RxKP0HVIeixJdDBOVz0Jwcxl0fyM5VfgjG209D
	6Rw2zIrPxq3ixYTmGCxr4VwoL73EnxmNZL79yeAzl2CNM+DA49BtuGFXrmRpj3ymqV5Ai0QWPAo
	JPTeHzvD43wmCPhH4SfJL38u1VtO4LEx+quc3j9//ZkaPcFJPlnNnwm+XC73EPa94jf+HCb9ftC
	rF2sVs+4vM1YF6AJbairWjTJ+o3GQtuKBGekqUpnH7sbImOEBRBMQJEUm1i22cmjo/a5vFwTvyM
	Gpro88DppMQg5quHox6NrZzqNsejJ9e5gMnmxibz3mE7Mgvvbwt1qvPafcNOr6IPwTX6KCHsfZ9
	V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 08:56:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189032

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Move-cr_compress_groupfile-outside-WITH_LIBMODULEMD.patch
removed since it's included in 1.0.1.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...s_groupfile-outside-WITH_LIBMODULEMD.patch | 46 -------------------
 ...erepo-c_1.0.0.bb => createrepo-c_1.0.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 48 deletions(-)
 delete mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-Move-cr_compress_groupfile-outside-WITH_LIBMODULEMD.patch
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.0.0.bb => createrepo-c_1.0.1.bb} (92%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Move-cr_compress_groupfile-outside-WITH_LIBMODULEMD.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Move-cr_compress_groupfile-outside-WITH_LIBMODULEMD.patch
deleted file mode 100644
index ea768e06e6..0000000000
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Move-cr_compress_groupfile-outside-WITH_LIBMODULEMD.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 5326969acc0c7e9e3cabca202154e4120c0d2c2f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 26 Sep 2023 14:52:11 -0700
-Subject: [PATCH] Move cr_compress_groupfile outside WITH_LIBMODULEMD
-
-This function is used in code which is not conditional under WITH_LIBMODULEMD
-therefore the declaration should also match its definition scope
-
-Fixes build issues flagged by clang
-
-src/createrepo_c.c:850:16: error: incompatible integer to pointer conversion initializing 'gchar *' (aka 'char *') with an
- expression of type 'int' [-Wint-conversion]
-|   850 |         gchar *compressed_path = cr_compress_groupfile(cmd_options->groupfile_fullpath, tmp_out_repo, compression);
-|       |                ^                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/createrepo_c/pull/387]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/metadata_internal.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/metadata_internal.h b/src/metadata_internal.h
-index 8ba0576..ecfbac2 100644
---- a/src/metadata_internal.h
-+++ b/src/metadata_internal.h
-@@ -52,14 +52,14 @@ cr_metadata_load_modulemd(ModulemdModuleIndex **moduleindex,
-  * @param dest_dir      Path to directory where the compressed groupfile should be stored.
-  * @return              Path to the new compressed groupfile. Has to be freed by the caller.
-  */
-+
-+#endif /* WITH_LIBMODULEMD */
-+
- gchar *
- cr_compress_groupfile(const char *groupfile,
-                       const char *dest_dir,
-                       cr_CompressionType compression);
- 
--
--#endif /* WITH_LIBMODULEMD */
--
- #ifdef __cplusplus
- }
- #endif
--- 
-2.42.0
-
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb
similarity index 92%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb
index f4e65492f8..44d9213bd4 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb
@@ -8,10 +8,9 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0001-include-rpm-rpmstring.h.patch \
            file://time64fix.patch \
-           file://0001-Move-cr_compress_groupfile-outside-WITH_LIBMODULEMD.patch \
            "
 
-SRCREV = "0cc13920991b2fb8f87fb9d352bd3394c2983289"
+SRCREV = "e7af838e04009cd2f848a00e1ea31cc42c8f3ae7"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


