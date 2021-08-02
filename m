Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.17006.1627890765018628590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193002101"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193002101"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:23 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478654481"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:22 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 23/37] oeqa/manual/toaster: fix small typo
Date: Mon,  2 Aug 2021 15:52:10 +0800
Message-Id: <7fb657741af2549e4123dd210ada0884727cf541.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ralph Siemsen <ralph.siemsen@linaro.org>

PACKAGE_CLASES should be PACKAGE_CLASSES.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7a96f3bceb2c857f841b1dbeb4587a8aaace529e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/manual/toaster-managed-mode.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/manual/toaster-managed-mode.json b/meta/lib/oeqa/manual/toaster-managed-mode.json
index 12374c7c64..9566d9d10e 100644
--- a/meta/lib/oeqa/manual/toaster-managed-mode.json
+++ b/meta/lib/oeqa/manual/toaster-managed-mode.json
@@ -136,7 +136,7 @@
           "expected_results": ""
         },
         "3": {
-          "action": "Check that default values are as follows: \n\tDISTRO - poky \n\tIMAGE_FSTYPES - ext3 jffs2 tar.bz2 \n\tIMAGE_INSTALL_append - \"Not set\" \n\tPACKAGE_CLASES - package_rpm \n        SSTATE_DIR  - /homeDirectory/poky/sstate-cache \n\n",
+          "action": "Check that default values are as follows: \n\tDISTRO - poky \n\tIMAGE_FSTYPES - ext3 jffs2 tar.bz2 \n\tIMAGE_INSTALL_append - \"Not set\" \n\tPACKAGE_CLASSES - package_rpm \n        SSTATE_DIR  - /homeDirectory/poky/sstate-cache \n\n",
           "expected_results": ""
         },
         "4": {
-- 
2.31.1

