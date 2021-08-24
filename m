Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.1051.1629822357303292137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278360268"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278360268"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="455658976"
Received: from asmawa1x-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.13])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:51 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 13/28] tar: ignore node-tar CVEs
Date: Wed, 25 Aug 2021 00:25:15 +0800
Message-Id: <79945a0fb947bc2c127314d8cb3e93b80cfe6308.1629821028.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629821028.git.anuj.mittal@intel.com>
References: <cover.1629821028.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

These two CVEs are specific to the Node package node-tar.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bc7216e8148d0dee7b56e6851da6615e93647a0a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/tar/tar_1.34.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extended/tar/tar_1.34.bb
index af04919c41..66c11cbfea 100644
--- a/meta/recipes-extended/tar/tar_1.34.bb
+++ b/meta/recipes-extended/tar/tar_1.34.bb
@@ -61,3 +61,6 @@ PROVIDES_append_class-native = " tar-replacement-native"
 NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# These are both specific to the NPM package node-tar
+CVE_CHECK_WHITELIST += "CVE-2021-32803 CVE-2021-32804"
-- 
2.31.1

