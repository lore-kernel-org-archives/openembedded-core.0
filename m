Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:23:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: AQ+hnnBub34GVy1A51rYoJ1B2D04pci3a82+ZJQjnAXWfLr3/im8fV2qVdqibmkshWmLpMc/mI
 LHU4zOET4ixA==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671274"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671274"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:23:05 -0800
IronPort-SDR: xANI58yJ7M2BSC8/fMSofX7yZws8GUn+yGbMsqaprj/qXV8Y9aGGnmffIC1F+eWZ5XuC7JTZSu
 Hivg7MPA7hDA==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408129200"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:23:04 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 49/52] yocto-uninative.inc: version 3.0 incorporate seccomp filter workaround
Date: Fri,  5 Mar 2021 12:21:25 +0800
Message-Id: <5a8e0442c8bb61d63070eb24e0956687c06ed1b0.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 317f8bf320383e81085f5740e202a7edb12932c7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index bc47083978..a2a2dd18ec 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,7 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.33"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.11/"
-UNINATIVE_CHECKSUM[aarch64] ?= "fa703e25c26eaebb1afd895337b92a24cc5077818e093af74912e53846a117fe"
-UNINATIVE_CHECKSUM[i686] ?= "638901c990ffbe716a34400134a2ad49a1c3104e3b48cdafd6fcd28e9b133294"
-UNINATIVE_CHECKSUM[x86_64] ?= "047ddd78d6b5cabd2a102120e27755a9eaa1d5724c6a8f4007daa3f10ecb6871"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.0/"
+UNINATIVE_CHECKSUM[aarch64] ?= "1c668909098c5b56132067adc69a249cb771f4560428e5822de903a12d97bf33"
+UNINATIVE_CHECKSUM[i686] ?= "e6cc2fc056234cffa6a2ff084cce27d544ea3f487a62b5e253351cefd4421900"
+UNINATIVE_CHECKSUM[x86_64] ?= "5ec5a9276046e7eceeac749a18b175667384e1f445cd4526300a41404d985a5b"
-- 
2.29.2

