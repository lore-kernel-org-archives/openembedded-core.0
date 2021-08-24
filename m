Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.1073.1629822386914258777
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278360355"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278360355"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:26:05 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="455659081"
Received: from asmawa1x-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.13])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:26:04 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 22/28] lzo: add CVE_PRODUCT
Date: Wed, 25 Aug 2021 00:25:24 +0800
Message-Id: <00e54d32a93991e73e1409baa6f038ae32b94dfe.1629821028.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629821028.git.anuj.mittal@intel.com>
References: <cover.1629821028.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marta Rybczynska <rybczynska@gmail.com>

lzo was missing CVE_PRODUCT and related CVEs (at least CVE-2014-4607) were
not reported.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 366cf8201e36df1ac836e49de04ccda1f763ca9e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/lzo/lzo_2.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/lzo/lzo_2.10.bb b/meta/recipes-support/lzo/lzo_2.10.bb
index 85b14b3c5c..f0c8631aea 100644
--- a/meta/recipes-support/lzo/lzo_2.10.bb
+++ b/meta/recipes-support/lzo/lzo_2.10.bb
@@ -18,6 +18,8 @@ SRC_URI[sha256sum] = "c0f892943208266f9b6543b3ae308fab6284c5c90e627931446fb49b42
 
 inherit autotools ptest
 
+CVE_PRODUCT = "lzo oberhumer:lzo2"
+
 EXTRA_OECONF = "--enable-shared"
 
 do_install_ptest() {
-- 
2.31.1

