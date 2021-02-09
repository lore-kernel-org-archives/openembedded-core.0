Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.12238.1612885998528261394
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:53:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: /0bl6ZTXqJiv7vxCItVNt6fVTvnfFQOwE2cWxTXVaHUb0Ftp2GZWxl3b9f4tk9mSjNVphR+Fle
 5282yCvkQhsw==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="161650500"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="161650500"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:21 -0800
IronPort-SDR: BqFBNyExlW0tyw1sRWJpn/RwMp1Z4zYDs3vmKTPSYh8gXmQohi/cT8h2woM7LY9OhWSJvJN70a
 V7Geaik63dYQ==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215606"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:18 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 29/35] yocto-uninative.inc: version 2.11 updates glibc to 2.33
Date: Tue,  9 Feb 2021 23:52:14 +0800
Message-Id: <f4cf73644bc5b8d90191ee223cb89cab16eb9447.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Halstead <mhalstead@linuxfoundation.org>

Support glibc 2.33.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5c7f963d395aa4a94d78c37883488baac471ea43)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 85336014b1..bc47083978 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,9 +6,9 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.32"
+UNINATIVE_MAXGLIBCVERSION = "2.33"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.10/"
-UNINATIVE_CHECKSUM[aarch64] ?= "645e5c50b2b48aabb8b10f783a9f94b4b7c5ddc7cfceb5386d43b86d30253202"
-UNINATIVE_CHECKSUM[i686] ?= "233e09b5ff30e15341232a0c16fa8448ff31dccb8f3f3e2ad3948cdac8c4a598"
-UNINATIVE_CHECKSUM[x86_64] ?= "04333677f81990ce2cf55c3bc256cd84a66085d18fc95ccddfab8581e4aec014"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.11/"
+UNINATIVE_CHECKSUM[aarch64] ?= "fa703e25c26eaebb1afd895337b92a24cc5077818e093af74912e53846a117fe"
+UNINATIVE_CHECKSUM[i686] ?= "638901c990ffbe716a34400134a2ad49a1c3104e3b48cdafd6fcd28e9b133294"
+UNINATIVE_CHECKSUM[x86_64] ?= "047ddd78d6b5cabd2a102120e27755a9eaa1d5724c6a8f4007daa3f10ecb6871"
-- 
2.29.2

