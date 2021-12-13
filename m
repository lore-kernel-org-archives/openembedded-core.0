Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFD1C433FE
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 04:17:30 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.7187.1639369049675889141
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 20:17:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=YP4Krpx2;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639369049; x=1670905049;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=NetpN+HLFstR329JEi3AuMDxf3L2MpFjdYKs2Iuk0R4=;
  b=YP4Krpx2TzAXJkVOtv6WwXwfeHGa5ECgV+uDCmQDvcZi+KlOdCZ4ltkT
   tI0xGetMCoBZ40RMz1wRMSLe6+mQcI/4DLWiX/MMktZirazyS4XHJXSPm
   Ki5GQVtGcw4UIDVB7lLRjAmYN/ExRy1yRcMbb3bDhQRPxjeNUgwe3s7u6
   GkQni4ODn8wDw0Nszz+U7zFeLq6kkdZU+Acp15528/sqgf4vkSAf7geux
   P8o6nsKt2EwyhZV5ykgNzyt1OLr+Ak7Eq1qbJhYYFjeJTSm/ODPz6kzbC
   awl0IxMd+qLw3NFvbZ3fHnPK166JLX20ddLLZBaiIT2UopaGwIO2cByi9
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238602199"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="238602199"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="517589247"
Received: from echan1-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.132.97])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:28 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 01/20] python3: upgrade 3.9.7 -> 3.9.9
Date: Mon, 13 Dec 2021 12:17:00 +0800
Message-Id: 
 <75510b97d965c72c77f5b4b6ad9fe55bf26b4cdb.1639365111.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639365111.git.anuj.mittal@intel.com>
References: <cover.1639365111.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 04:17:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159591

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...-detection-of-mips-architecture-for-.patch | 20 +++++++++----------
 .../{python3_3.9.7.bb => python3_3.9.9.bb}    |  2 +-
 2 files changed, 10 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.9.7.bb => python3_3.9.9.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
index c4fae09a5b..99968b81de 100644
--- a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
+++ b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
@@ -1,7 +1,8 @@
-From 1ad771d86728ee2ed30e202e9768d8d825f96467 Mon Sep 17 00:00:00 2001
+From d9eb634b3d2e6ba831e864c50f6a37c48edfc4f3 Mon Sep 17 00:00:00 2001
 From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
 Date: Fri, 31 May 2019 15:34:34 +0200
 Subject: [PATCH] bpo-36852: proper detection of mips architecture for soft
+
  float
 
 When (cross) compiling for softfloat mips, __mips_hard_float will not be
@@ -13,18 +14,18 @@ to do this in a more autoconf/autotools manner.
 Upstream-Status: Submitted [https://github.com/python/cpython/pull/13196]
 Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
 
-%% original patch: 0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
+
 ---
  configure.ac | 175 +++++++--------------------------------------------
  1 file changed, 21 insertions(+), 154 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index ede710e..bc81b0b 100644
+index e2979a8..337182d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -710,160 +710,27 @@ fi
- MULTIARCH=$($CC --print-multiarch 2>/dev/null)
- AC_SUBST(MULTIARCH)
+@@ -728,160 +728,27 @@ then
+ fi
+ 
  
 -AC_MSG_CHECKING([for the platform triplet based on compiler characteristics])
 -cat >> conftest.c <<EOF
@@ -202,8 +203,5 @@ index ede710e..bc81b0b 100644
 +	;;
 +esac	
  
- if test x$PLATFORM_TRIPLET != x && test x$MULTIARCH != x; then
-   if test x$PLATFORM_TRIPLET != x$MULTIARCH; then
--- 
-2.24.1
-
+ if test x$PLATFORM_TRIPLET != xdarwin; then
+   MULTIARCH=$($CC --print-multiarch 2>/dev/null)
diff --git a/meta/recipes-devtools/python/python3_3.9.7.bb b/meta/recipes-devtools/python/python3_3.9.9.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.9.7.bb
rename to meta/recipes-devtools/python/python3_3.9.9.bb
index 9d26528a96..f41529833c 100644
--- a/meta/recipes-devtools/python/python3_3.9.7.bb
+++ b/meta/recipes-devtools/python/python3_3.9.9.bb
@@ -38,7 +38,7 @@ SRC_URI_append_class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "f8145616e68c00041d1a6399b76387390388f8359581abc24432bb969b5e3c57"
+SRC_URI[sha256sum] = "06828c04a573c073a4e51c4292a27c1be4ae26621c3edc7cf9318418ce3b6d27"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.33.1


