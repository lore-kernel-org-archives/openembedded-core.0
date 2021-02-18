Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.2597.1613622265608276454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 20:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 9bu6S298gkiiOEvEJ6iO3NfWNhs6yzIcFeLBDmd3SXlOZID66Y4kscfxAf3VnzqIl+WJyauiHW
 vZvv+nYJvLZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="163177988"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="163177988"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:34 -0800
IronPort-SDR: zVgqjPDt1+Xskf7jwyZJ5lO8D/Nr5787CxRCfnaybnQYyNvig5vhAFjf7knwftxnf/19G+yS9q
 ypTe0OJYvgeA==
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="378269199"
Received: from zaizam-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.203])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:33 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/12] mesa: upgrade 20.3.2 -> 20.3.4
Date: Thu, 18 Feb 2021 12:24:14 +0800
Message-Id: <20210218042418.281245-8-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210218042418.281245-1-anuj.mittal@intel.com>
References: <20210218042418.281245-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../mesa/{mesa-gl_20.3.2.bb => mesa-gl_20.3.4.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_20.3.2.bb => mesa_20.3.4.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_20.3.2.bb => mesa-gl_20.3.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_20.3.2.bb => mesa_20.3.4.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.3.2.bb b/meta/recipes-graphics/mesa/mesa-gl_20.3.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_20.3.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_20.3.4.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index cb075a8b89..9f8ec112cf 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-anv-fix-a-build-race-between-generating-a-header-and.patch \
            "
 
-SRC_URI[sha256sum] = "cce001b685d23afb976b04138714906abcf7e7f996da6355e6a43e5ca486533d"
+SRC_URI[sha256sum] = "dc21a987ec1ff45b278fe4b1419b1719f1968debbb80221480e44180849b4084"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_20.3.2.bb b/meta/recipes-graphics/mesa/mesa_20.3.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_20.3.2.bb
rename to meta/recipes-graphics/mesa/mesa_20.3.4.bb
-- 
2.29.2

