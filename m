Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.12352.1612886001963207096
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:53:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: TVnI3dVavP8fIeaS5aaukam8NCHwXIKQj/AjXsaCWD+FH/gcDo33GtT+h5Ioa7uAwF0fbA5G7K
 oU8A5SmzKRuQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="243394705"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="243394705"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:21 -0800
IronPort-SDR: RmrDrp9pcecX580ASrvTwgM/YMM7N/R/XwcvO6ae6iCRnhIp2hJGlVc7msYSwtoh5OTzf/HOTx
 nHbcy3XsqToQ==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215595"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:17 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 28/35] uninative: Upgrade to 2.10
Date: Tue,  9 Feb 2021 23:52:13 +0800
Message-Id: <2b0577ae97366bd8c90387406e4a23fd15672518.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Halstead <mhalstead@linuxfoundation.org>

Final glibc 2.32 based uninative.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8b5d932a42ce9e3e801837bea9cf319c455d9ae5)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 69b6edee5f..85336014b1 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,7 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.32"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.9/"
-UNINATIVE_CHECKSUM[aarch64] ?= "9f25a667aee225b1dd65c4aea73e01983e825b1cb9b56937932a1ee328b45f81"
-UNINATIVE_CHECKSUM[i686] ?= "cae5d73245d95b07cf133b780ba3f6c8d0adca3ffc4e7e7fab999961d5e24d36"
-UNINATIVE_CHECKSUM[x86_64] ?= "d07916b95c419c81541a19c8ef0ed8cbd78ae18437ff28a4c8a60ef40518e423"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.10/"
+UNINATIVE_CHECKSUM[aarch64] ?= "645e5c50b2b48aabb8b10f783a9f94b4b7c5ddc7cfceb5386d43b86d30253202"
+UNINATIVE_CHECKSUM[i686] ?= "233e09b5ff30e15341232a0c16fa8448ff31dccb8f3f3e2ad3948cdac8c4a598"
+UNINATIVE_CHECKSUM[x86_64] ?= "04333677f81990ce2cf55c3bc256cd84a66085d18fc95ccddfab8581e4aec014"
-- 
2.29.2

