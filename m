Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: eRhkB3mFj64/9OQRThz/jAwrSUyI3jhpQhlsJBH7GAIv4FoosoDMt1J3lCNDYwK2I4p7RDvOoJ
 sRPuonKO8TZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671189"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671189"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:54 -0800
IronPort-SDR: eQxJXyFJBrLtpFKRA/lAYndh1VuKmQYi+r2bbW0rAmlcaRAi4xLUtYuyUgXZRVJ7nSzZUH2zJy
 B6R3kHlo9uCg==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408129116"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:52 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 41/52] image: Add directories to PSEUDO_IGNORE_PATHS
Date: Fri,  5 Mar 2021 12:21:17 +0800
Message-Id: <5f40d80bad9d997e59d2a78f18114043740f054d.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Some paths used in image construction shouldn't be tracked under pseudo
so list these.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9463be2292b942a1072eea88881b9644e55aadb9)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/image.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 045f4494c8..6d3d5692da 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -180,6 +180,8 @@ IMAGE_LOCALES_ARCHIVE ?= '1'
 # aren't yet available.
 PSEUDO_PASSWD = "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}"
 
+PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/intercept_scripts,${WORKDIR}/oe-rootfs-repo"
+
 PACKAGE_EXCLUDE ??= ""
 PACKAGE_EXCLUDE[type] = "list"
 
-- 
2.29.2

