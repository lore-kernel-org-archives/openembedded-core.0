Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web08.12225.1612885997186137068
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:53:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: XlEIetD0RScPp4iZFImQtnNPLCJVvKvcjFFy8EQtnQ6QGG/uZi+YPqy6pipfvJhOBdAXv5Yor/
 SvYnX/TtGOJg==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="245968669"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="245968669"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:03 -0800
IronPort-SDR: TChwrmIyN/sgAnkW5XjMw/lG1zmBob7+4rGt7JeGxeUM1a2GEN+gxwvqoKs5L4cCi3cRH5CxLC
 EO94K2OxXNqQ==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215508"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:02 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 18/35] qemu.inc: Should depend on qemu-system-native, not qemu-native
Date: Tue,  9 Feb 2021 23:52:03 +0800
Message-Id: <a5974d2bda8cddbc5e982f9b6378ad6c302be868.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This looks like it was from before the recipe was split, we'd expect
the system qemu mode for running the images so the dependency should be
updated.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3a4fed4ae0e8a0d1bd62ea5fa1ef12925e1f20f5)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/machine/include/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 8dedb1a42d..7d0a6fe458 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -21,7 +21,7 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base = ""
 # Use a common kernel recipe for all QEMU machines
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
 
-EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
+EXTRA_IMAGEDEPENDS += "qemu-system-native qemu-helper-native"
 
 # Provide the nfs server kernel module for all qemu images
 KERNEL_FEATURES_append_pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
-- 
2.29.2

