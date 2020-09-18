Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.9137.1600421824581542933
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2020 02:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: Yb61X37Nr3aA8DWI0QgNsMbsNVWCSYto8s6KEGGfoyrEmIKBj67X5zDsKX8g2BalsFxCY1xkDw
 guWvV9SeDO1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="159953944"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="159953944"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 02:37:04 -0700
IronPort-SDR: A7ss1dJD7N7luLBpjEuB0sJwRi73/Egoz/proOCF0tSF+3m2mocoYPz3v5Hg2ETqag/ckhBatp
 NAW88lzQdX6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
   d="scan'208";a="484135153"
Received: from andromeda01.png.intel.com (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.10])
  by orsmga005.jf.intel.com with ESMTP; 18 Sep 2020 02:37:03 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 2/2] bash : inlcude patch 17 & 18
Date: Fri, 18 Sep 2020 17:37:02 +0800
Message-Id: <20200918093702.30262-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200918093702.30262-1-chee.yang.lee@intel.com>
References: <20200918093702.30262-1-chee.yang.lee@intel.com>

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/recipes-extended/bash/bash_5.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-extended/bash/bash_5.0.bb b/meta/recipes-extended/bash/bash_5.0.bb
index 8ff9e6edaf..12d472be57 100644
--- a/meta/recipes-extended/bash/bash_5.0.bb
+++ b/meta/recipes-extended/bash/bash_5.0.bb
@@ -21,6 +21,8 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-014;apply=yes;striplevel=0;name=patch014 \
            ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-015;apply=yes;striplevel=0;name=patch015 \
            ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-016;apply=yes;striplevel=0;name=patch016 \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-017;apply=yes;striplevel=0;name=patch017 \
+           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-018;apply=yes;striplevel=0;name=patch018 \
            file://execute_cmd.patch \
            file://mkbuiltins_have_stringize.patch \
            file://build-tests.patch \
@@ -65,6 +67,11 @@ SRC_URI[patch015.md5sum] = "c4c6ea23d09a74eaa9385438e48fdf02"
 SRC_URI[patch015.sha256sum] = "a517df2dda93b26d5cbf00effefea93e3a4ccd6652f152f4109170544ebfa05e"
 SRC_URI[patch016.md5sum] = "a682ed6fa2c2e7a7c3ba6bdeada07fb5"
 SRC_URI[patch016.sha256sum] = "ffd1d7a54a99fa7f5b1825e4f7e95d8c8876bc2ca151f150e751d429c650b06d"
+SRC_URI[patch017.md5sum] = "d9dcaa1d8e7a24850449a1aac43a12a9"
+SRC_URI[patch017.sha256sum] = "4cf3b9fafb8a66d411dd5fc9120032533a4012df1dc6ee024c7833373e2ddc31"
+SRC_URI[patch018.md5sum] = "a64d950d5de72ae590455b13e6afefcb"
+SRC_URI[patch018.sha256sum] = "7c314e375a105a6642e8ed44f3808b9def89d15f7492fe2029a21ba9c0de81d3"
+
 
 DEBUG_OPTIMIZATION_append_armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION_append_armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-- 
2.17.1

