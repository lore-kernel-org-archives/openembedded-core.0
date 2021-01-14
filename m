Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3701.1610640599644781266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 08:10:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: UzDoSuKI9mWwFwSffFfYnHLwTfBXyotz0QIpenI9m/1OrOWvgogz1s3v4pTptkatU/EAxXWt3H
 rcpLxTO2wykA==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="166062651"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="166062651"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:10:03 -0800
IronPort-SDR: qkFz/oiGO7UscVjqRCW+2VH7DZ/YPCKnJeNFPmbgDy8FDf6CjVEgzamrtJbImtnx5v5RwrFr3B
 ENQY1+ogk/6A==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="424986543"
Received: from ykoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.50])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:10:02 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 06/14] pseudo: Drop patches merged into upstream branch
Date: Fri, 15 Jan 2021 00:09:40 +0800
Message-Id: <ee6832529b53cf5b912d9cb8a40799a8eeb81f0b.1610639458.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610639458.git.anuj.mittal@intel.com>
References: <cover.1610639458.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7386a116222979e6de60c39d2c094d5f216fb101)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 600885b5c2..78c6b01f09 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "69f205c41902e17933b81b1450636848e8da2126"
+SRCREV = "6fd57da7b1de1a2b6cf530e336d58bb5f8bdd015"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.29.2

