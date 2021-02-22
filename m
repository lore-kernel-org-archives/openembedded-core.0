Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.36963.1614009640008517381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:01:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: yYLqzq7HyGm/l4ahw08DeVT6OZGW3MfPWrlV/ZLxYUnJDMFK9Kt7athU6HYeuzUuLT82+QChe7
 n35aJAARU6Wg==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="181049544"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="181049544"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:02 -0800
IronPort-SDR: IlTGHA7kkAKGgxsdFwzFXIWuulqyAcDHHsU/ASRRoBFoBlGTBPr0HJ2veA+kZyn+vOH7UsY0Gx
 XJDl7rY5ADTw==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430301918"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:00:59 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 13/30] opkg: Fix patch glitches
Date: Tue, 23 Feb 2021 00:00:16 +0800
Message-Id: <7ab4b11228d66811ff767e31fd3f024c790d4b68.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The original patch contained some text which shouldn't have been there
and used brackets in configure which isn't a great idea. Tweak the patch
to resolve this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 63cbf187fe189c99645fe3afee8a6361a9a32cdc)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch b/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
index 285d258c63..4578fa33be 100644
--- a/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
+++ b/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
@@ -9,13 +9,12 @@ Index: opkg-0.4.4/configure.ac
 ===================================================================
 --- opkg-0.4.4.orig/configure.ac
 +++ opkg-0.4.4/configure.ac
-@@ -281,7 +281,12 @@ AC_FUNC_UTIME_NULL
+@@ -281,7 +281,11 @@ AC_FUNC_UTIME_NULL
  AC_FUNC_VPRINTF
  AC_CHECK_FUNCS([memmove memset mkdir regcomp strchr strcspn strdup strerror strndup strrchr strstr strtol strtoul sysinfo utime])
  
 -CLEAN_DATE=`date +"%B %Y" | tr -d '\n'`
-+1607446883
-+if [ ! -z "$SOURCE_DATE_EPOCH" ]; then
++if ! test -z "$SOURCE_DATE_EPOCH" ; then
 +    CLEAN_DATE=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH +"%B %Y" | tr -d '\n'`
 +else
 +    CLEAN_DATE=`date +"%B %Y" | tr -d '\n'`
-- 
2.29.2

