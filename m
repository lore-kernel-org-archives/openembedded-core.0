Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.433.1632243908053970875
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 10:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="210496455"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; 
   d="scan'208";a="210496455"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2021 10:03:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; 
   d="scan'208";a="549571177"
Received: from vanamadx-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.239.24])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2021 10:03:20 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 2/4] tar: ignore node-tar CVEs
Date: Wed, 22 Sep 2021 01:03:10 +0800
Message-Id: <a07d4c12ca1b7f5ef233fe3885339cdf5291afb0.1632216051.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632216051.git.anuj.mittal@intel.com>
References: <cover.1632216051.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster808@gmail.com>

These three CVEs are specific to the Node package node-tar.

exclude: CVE-2021-37701 CVE-2021-37712 CVE-2021-37713

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9f9317a02d73c1e5aea026683a037e52c996c7bb)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/tar/tar_1.34.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extended/tar/tar_1.34.bb
index 66c11cbfea..f41e5b33d4 100644
--- a/meta/recipes-extended/tar/tar_1.34.bb
+++ b/meta/recipes-extended/tar/tar_1.34.bb
@@ -64,3 +64,4 @@ BBCLASSEXTEND = "native nativesdk"
 
 # These are both specific to the NPM package node-tar
 CVE_CHECK_WHITELIST += "CVE-2021-32803 CVE-2021-32804"
+CVE_CHECK_WHITELIST += "CVE-2021-37701 CVE-2021-37712 CVE-2021-37713"
-- 
2.31.1

