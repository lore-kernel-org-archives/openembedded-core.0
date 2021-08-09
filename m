Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.24726.1628523364931716435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 08:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="278466804"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="278466804"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:08 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="483462876"
Received: from abinzahx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.229.181])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:07 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 04/23] zstd: fix CVE_PRODUCT
Date: Mon,  9 Aug 2021 23:35:36 +0800
Message-Id: <e158fce14fb6596344c67ead61e8326a69bfa5f8.1628522214.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1628522214.git.anuj.mittal@intel.com>
References: <cover.1628522214.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Qi <Qi.Chen@windriver.com>

zstd uses 'zstandard' in NVD database. e.g. CVE-2021-24031

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 304eb663e414171d38faeebb3c72e49e6e4e1112)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/zstd/zstd_1.4.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/zstd/zstd_1.4.9.bb b/meta/recipes-extended/zstd/zstd_1.4.9.bb
index b86fdf8b2d..44224ec627 100644
--- a/meta/recipes-extended/zstd/zstd_1.4.9.bb
+++ b/meta/recipes-extended/zstd/zstd_1.4.9.bb
@@ -16,6 +16,8 @@ SRC_URI = "git://github.com/facebook/zstd.git;branch=release \
 SRCREV = "e4558ffd1dc49399faf4ee5d85abed4386b4dcf5"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
+CVE_PRODUCT = "zstandard"
+
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
-- 
2.31.1

