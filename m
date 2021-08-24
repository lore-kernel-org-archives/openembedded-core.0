Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.1073.1629822386914258777
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278360334"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278360334"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:26:00 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="455659008"
Received: from asmawa1x-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.13])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:59 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 18/28] uninative: Improve glob to handle glibc 2.34
Date: Wed, 25 Aug 2021 00:25:20 +0800
Message-Id: <181c3eb9338fc3050dfef24e38bbfac01ce77d1a.1629821028.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629821028.git.anuj.mittal@intel.com>
References: <cover.1629821028.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

With glibc 2.34, the libraries were renamed. Tweak the glob to support both
as this is needed for newer uninative versions.

[RP: tweak commit message]
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 98248306e4b5f023e96375293b60524574ebb686)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/uninative.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 1e19917a97..3c7ccd66f4 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -100,7 +100,7 @@ ${UNINATIVE_STAGING_DIR}-uninative/relocate_sdk.py \
   ${UNINATIVE_LOADER} \
   ${UNINATIVE_LOADER} \
   ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/${bindir_native}/patchelf-uninative \
-  ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux${base_libdir_native}/libc*.so" % chksum)
+  ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux${base_libdir_native}/libc*.so*" % chksum)
         subprocess.check_output(cmd, shell=True)
 
         with open(loaderchksum, "w") as f:
-- 
2.31.1

