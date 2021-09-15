Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web08.3933.1631747749606685057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 16:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="220565572"
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; 
   d="scan'208";a="220565572"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 16:16:03 -0700
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; 
   d="scan'208";a="433597353"
Received: from chgan-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.238.104])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 16:16:02 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 11/17] go: Exclude CVE-2021-29923 from report list
Date: Thu, 16 Sep 2021 07:15:35 +0800
Message-Id: <573337b8432677fa3a7643e74045ae7d7b331b3f.1631747352.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631747352.git.anuj.mittal@intel.com>
References: <cover.1631747352.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Upstream don't believe it is a signifiant real world issue and will only
fix in 1.17 onwards. Therefore exclude it from our reports.

https://github.com/golang/go/issues/30999#issuecomment-910470358

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5bd5faf0c34b47b2443975d66b71482d2380a01a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/go/go-1.16.7.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/go/go-1.16.7.inc b/meta/recipes-devtools/go/go-1.16.7.inc
index ed2d94671b..9eca1caeeb 100644
--- a/meta/recipes-devtools/go/go-1.16.7.inc
+++ b/meta/recipes-devtools/go/go-1.16.7.inc
@@ -19,3 +19,8 @@ SRC_URI += "\
     file://0001-encoding-xml-handle-leading-trailing-or-double-colon.patch \
 "
 SRC_URI[main.sha256sum] = "1a9f2894d3d878729f7045072f30becebe243524cf2fce4e0a7b248b1e0654ac"
+
+# Upstream don't believe it is a signifiant real world issue and will only
+# fix in 1.17 onwards where we can drop this.
+# https://github.com/golang/go/issues/30999#issuecomment-910470358
+CVE_CHECK_WHITELIST += "CVE-2021-29923"
-- 
2.31.1

