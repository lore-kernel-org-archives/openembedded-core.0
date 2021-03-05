Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:23:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: JsBKjt4z7VKrf1pBiJ4JSq5tG/wV+vjZxK/PsMUTEZ8lle3kecud+xsBUAOkKrspLIWPTIaj7V
 QvuBjlsdRAVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671259"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671259"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:23:04 -0800
IronPort-SDR: 3/TOkYOUJc69acsbNBbvfMkzNYXclkno3dA4eYBsi8S6sf+YjXGGz/IZzZfG3Zjb0GEtJpk2k6
 4HEYNV6/uDog==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408129185"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:23:02 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 48/52] yocto-uninative.inc: version 2.11 updates glibc to 2.33
Date: Fri,  5 Mar 2021 12:21:24 +0800
Message-Id: <4f79d6b91261a8467b02581e08d27052af6f0652.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
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

