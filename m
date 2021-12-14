Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDB4C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 01:21:08 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.20093.1639444861529217620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 17:21:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=k1u7LHAg;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639444866; x=1670980866;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ho+NIgmmMBebeIXNlDu64W9p4PrOyWc2Ttj0B2tZdB0=;
  b=k1u7LHAgYMYUiTMP7IhpRt5f7yBsuEsfN+uw/XUg2sECZw219dIpJ8Ux
   JRM3GnDTHKV9F83+argI/Wm06VBRhCi22INkGJP49ewkI9+KNjhHsfzUm
   qCyDrpVpysVql+emBU64BYaxO9CnqNL81y9SfP3KhAcK/1HacJZGYXz8v
   b0TbMSDanfNNOLIYe3xllXXy6Yn47tOY5tt6JyWIqPUcpMzI8Y3R7v9wp
   EAh3BRvig+Kfpjsdjj/Ucu0/qA2zLi81py8ALzihNLieq/febL7id7m0D
   ZvfRI3sx4sacJxacJTh8+CDiHI4+xS//cqS8DpqBxRAHcz4ToU9+G7Sq6
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238682490"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="238682490"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="464869171"
Received: from zyteoh-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.31])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:05 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 04/17] python3: upgrade 3.9.7 -> 3.9.9
Date: Tue, 14 Dec 2021 09:20:39 +0800
Message-Id: 
 <6eedc8a3456a70d858e9f515f384b3ba54d00a63.1639444641.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639444641.git.anuj.mittal@intel.com>
References: <cover.1639444641.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 01:21:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159666

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
index 772dcb8d9d..5c6077a467 100644
--- a/meta/recipes-devtools/python/python3_3.9.7.bb
+++ b/meta/recipes-devtools/python/python3_3.9.9.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "f8145616e68c00041d1a6399b76387390388f8359581abc24432bb969b5e3c57"
+SRC_URI[sha256sum] = "06828c04a573c073a4e51c4292a27c1be4ae26621c3edc7cf9318418ce3b6d27"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.33.1


