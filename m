Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.29432.1618218515903981471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 02:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: n/E/JphCVPj+htyrusFtNFHbqFv7JrX5h61YApCBg9DAmYOx5MJoRhwKrD17w2NBj75gDyXErd
 2wbn+1WuMbbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="255467867"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="255467867"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:36 -0700
IronPort-SDR: D/Lx/pClpXqSPcanEthTED9kK1aHfuY1mt6NHGuEft2PSHBaxch0369uqLk58SfwlsfsHllyVZ
 k7ZxSrBwbiPQ==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="531809024"
Received: from pchuang-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.174.143])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:34 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 01/18] glibc: Pull latest 2.32 HEAD
Date: Mon, 12 Apr 2021 17:08:09 +0800
Message-Id: <c11a17a4fc5697216e26d7b39fd873d655e3a586.1618210563.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618210563.git.anuj.mittal@intel.com>
References: <cover.1618210563.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anatol Belski <anbelski@linux.microsoft.com>

New commits:

$ git log --format="%h %s" df31c7ca927242d5d4eee97f93a01e23ff47e332..f84949f1c4bbf20e6a1d9a5859cf012cde060ede
f84949f1c4 powerpc64: Workaround sigtramp vdso return call
5e43566f0f nscd: Fix double free in netgroupcache [BZ #27462]

Note also that additionally CVE-2021-3326 has been whitelisted as it was
already present in the previous state.

Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.32.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 586b2e207e..84d199bb1d 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.32/master"
 PV = "2.32"
-SRCREV_glibc ?= "760e1d287825fa91d4d5a0cc921340c740d803e2"
+SRCREV_glibc ?= "44b395932961a29825da4ad025124a6760858d9c"
 SRCREV_localedef ?= "bd644c9e6f3e20c5504da1488448173c69c56c28"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc_2.32.bb b/meta/recipes-core/glibc/glibc_2.32.bb
index e4fe9b87b5..03aea52508 100644
--- a/meta/recipes-core/glibc/glibc_2.32.bb
+++ b/meta/recipes-core/glibc/glibc_2.32.bb
@@ -2,7 +2,7 @@ require glibc.inc
 require glibc-version.inc
 
 # whitelist CVE's with fixes in latest release/2.32/master branch
-CVE_CHECK_WHITELIST += "CVE-2019-25013 CVE-2020-10029 CVE-2020-27618"
+CVE_CHECK_WHITELIST += "CVE-2019-25013 CVE-2020-10029 CVE-2020-27618 CVE-2021-27645 CVE-2021-3326"
 
 DEPENDS += "gperf-native bison-native make-native"
 
-- 
2.30.2

