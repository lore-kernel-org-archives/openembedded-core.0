Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51333C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 08:19:46 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.26241.1698913177751769769
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 01:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="117219843"
X-IronPort-AV: E=Sophos;i="6.03,270,1694703600"; 
   d="scan'208";a="117219843"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 17:19:34 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B877BD9DA6
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Nov 2023 17:19:32 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 03351D9680
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Nov 2023 17:19:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A7D188899;
	Thu,  2 Nov 2023 17:19:25 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] createrepo-c: upgrade 1.0.1 -> 1.0.2
Date: Thu,  2 Nov 2023 16:17:51 +0800
Message-Id: <1698913076-22037-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1698913076-22037-1-git-send-email-wangmy@fujitsu.com>
References: <1698913076-22037-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27972.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27972.006
X-TMASE-Result: 10--6.224000-10.000000
X-TMASE-MatchedRID: h8nmbN2t+rqjz0nOeth/yTo39wOA02LhQRlUSJjs8Z/9wRnyxuPjhPIq
	VPlE8IwYkDxuPhjo/LQFrQTrR/R+6bMxctdgEdwyAD5jSg1rFtA7Cr2cnprobO55sqsU0mRF2d8
	mtRIRsUP/0XMJYfpi/aYppTu5ktrmx7fBXoDaFyHy3h9RQZ4StNXLiEcLf+DIwLkNMQzGl5AHV6
	CRl0Ild2xeoKLN1RJD2jucG9oaL0FUfypZw6S0pcb6dLbgzMd5VcSYmv+w7gihSG4odLP+NtgjE
	0ANqbLczztP0Tlh1/B8kvfy7VW07gsTH6q5zeP3OWUWxTQJdI9ULRRq00o2mSS30GKAkBxWonPf
	ENH9L/JbQBJtdPDWCOmawZ/PjwejGrqYtnBtVrTN+qWlu2ZxaJiQDIJsDspXoHmOTZNdeMUjL8W
	DWZGeou0B0MT8S0EkgDLqnrRlXrZ8nn9tnqel2DsAVzN+Ov/sl7DjYcv/EIJrWZSpvO5b2tjZmk
	29o1qMY5wE+xgc25wmdKS75O3Y8Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 08:19:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190061

From: Wang Mingyu <wangmy@fujitsu.com>

time64fix.patch
removed since it's included in 1.0.2

Changelog:
==========
Fix building on EL9
Don't allow building without zstd
Adjust printf formats for 64bit time_t on 32bit systems
Remove dependency on libmagic, hardcode magic number detection
Add automation for uploading prebuilt binary wheels to PyPI

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../createrepo-c/createrepo-c/time64fix.patch | 69 -------------------
 ...erepo-c_1.0.1.bb => createrepo-c_1.0.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 71 deletions(-)
 delete mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/time64fix.patch
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.0.1.bb => createrepo-c_1.0.2.bb} (94%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/time64fix.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/time64fix.patch
deleted file mode 100644
index a63801ce26..0000000000
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/time64fix.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 89e1c9415fb8438310036d5810cdb7da75ee3a7f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 26 Jul 2023 12:27:14 -0700
-Subject: [PATCH] Adjust printf formats for 64bit time_t on 32bit systems
-
-Fixes format specifier mismatch warnings as well while here
-
-e.g.
-warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'time_t'
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/createrepo_c/pull/376]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/createrepo_c.c    | 4 ++--
- src/misc.c            | 4 ++--
- src/xml_dump_repomd.c | 2 +-
- 3 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/createrepo_c.c b/src/createrepo_c.c
-index 8681419..0f9048a 100644
---- a/src/createrepo_c.c
-+++ b/src/createrepo_c.c
-@@ -582,9 +582,9 @@ duplicates_warning(const char *nevra, GArray *locations, CmdDupNevra option)
-   for (size_t i=0; i<locations->len; i++) {
-       struct DuplicateLocation location = g_array_index(locations, struct
-                                                         DuplicateLocation, i);
--      g_warning("    Sourced from location: \'%s\', build timestamp: %ld%s",
-+      g_warning("    Sourced from location: \'%s\', build timestamp: %jd%s",
-                 location.location,
--                location.pkg->time_build,
-+                (intmax_t) location.pkg->time_build,
-                 location.pkg->skip_dump ? skip_reason : "");
- 
-   }
-diff --git a/src/misc.c b/src/misc.c
-index 8511ca2..7866c7b 100644
---- a/src/misc.c
-+++ b/src/misc.c
-@@ -1512,11 +1512,11 @@ cr_append_pid_and_datetime(const char *str, const char *suffix)
-     gettimeofday(&tv, NULL);
-     timeinfo = localtime (&(tv.tv_sec));
-     strftime(datetime, 80, "%Y%m%d%H%M%S", timeinfo);
--    gchar *result = g_strdup_printf("%s%jd.%s.%ld%s",
-+    gchar *result = g_strdup_printf("%s%jd.%s.%jd%s",
-                                     str ? str : "",
-                                     (intmax_t) getpid(),
-                                     datetime,
--                                    tv.tv_usec,
-+                                    (intmax_t) tv.tv_usec,
-                                     suffix ? suffix : "");
-     return result;
- }
-diff --git a/src/xml_dump_repomd.c b/src/xml_dump_repomd.c
-index 33b0e09..9d24249 100644
---- a/src/xml_dump_repomd.c
-+++ b/src/xml_dump_repomd.c
-@@ -143,7 +143,7 @@ cr_xml_dump_repomd_body(xmlNodePtr root, cr_Repomd *repomd)
-                            BAD_CAST repomd->revision);
-     } else {
-         // Use the current time if no revision was explicitly specified
--        gchar *rev = g_strdup_printf("%ld", time(NULL));
-+        gchar *rev = g_strdup_printf("%jd", (intmax_t) time(NULL));
-         xmlNewChild(root, NULL, BAD_CAST "revision", BAD_CAST rev);
-         g_free(rev);
-     }
--- 
-2.41.0
-
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.2.bb
similarity index 94%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.0.2.bb
index 44d9213bd4..49d29bcfb4 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.1.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.2.bb
@@ -7,10 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0001-include-rpm-rpmstring.h.patch \
-           file://time64fix.patch \
            "
 
-SRCREV = "e7af838e04009cd2f848a00e1ea31cc42c8f3ae7"
+SRCREV = "e87636334a3bc5d6ddfdb6c0b34042e96987efb1"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


