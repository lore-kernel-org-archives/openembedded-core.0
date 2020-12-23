Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.10343.1608736768391429647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: a9fOZa0pwk5SHbVKOqjtFn/fQjshwQILfSLCjfVRApegaDX3cJoqL6QCfZR1/f2h8LsDneHvUb
 83lH9eJMA0Ew==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236107"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236107"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:28 -0800
IronPort-SDR: O7pTnIGKwCJ/GVyGeofHLNIRPjm+3AwsvL+PBTdkSw7+cYiazC2J/fDmBigIGf8RhwKdeifXZH
 nes9RyfYnNIA==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027660"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:26 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 25/35] timezone: upgrade to 2020d
Date: Wed, 23 Dec 2020 23:18:35 +0800
Message-Id: <6fd2bcfa56e30f8a48f5c81a3018d30c117ebafd.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 365787658cffc3b2dedb88db311a33012be9d70d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 8eb17c5eaf..5368464f30 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2020b"
+PV = "2020d"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,5 +14,5 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "47eff8944de4a64f7629b851e4a32338ab12c9b73edd62063795167ff1fe43da"
-SRC_URI[tzdata.sha256sum] = "9b053f951d245ce89d850b96ee4711d82d833559b1fc96ba19f90bc4d745e809"
+SRC_URI[tzcode.sha256sum] = "6cf050ba28e8053029d3f32d71341d11a794c6b5dd51a77fc769d6dae364fad5"
+SRC_URI[tzdata.sha256sum] = "8d813957de363387696f05af8a8889afa282ab5016a764c701a20758d39cbaf3"
-- 
2.29.2

