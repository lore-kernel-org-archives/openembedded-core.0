Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: LrTAuWVbe2G/zP1tOxZrJKyYG0hCQ2oOeiyY5okVYjnJXgEdSw93SwxIUW+FmxLl5ljtZUWU7h
 16xc4PNA/EoA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794691"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794691"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:02:56 -0700
IronPort-SDR: CpskMtQRYHpp3LzfYdX3emhvePqXlbFav66BNGyXoEawzhn0di55mN4lZTpGr7pBQBh8Gpe998
 I347KQnecvbA==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331545"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:02:55 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 04/31] mesa: upgrade 21.0.2 -> 21.0.3
Date: Fri,  7 May 2021 15:02:16 +0800
Message-Id: <c0ecb7a67de478b402e1e915d51ca9bbeb662d6c.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a89ed8ce30a5830a0ac90aa633ec466b4e3a0ba1)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../mesa/{mesa-gl_21.0.2.bb => mesa-gl_21.0.3.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.0.2.bb => mesa_21.0.3.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_21.0.2.bb => mesa-gl_21.0.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.0.2.bb => mesa_21.0.3.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.2.bb b/meta/recipes-graphics/mesa/mesa-gl_21.0.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.0.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.0.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 5705ae0f08..a85f94c75e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            "
 
-SRC_URI[sha256sum] = "46c1dc5bb54a372dee43ec3c067229c299187d5bdadf1402756bbf66a6df5b88"
+SRC_URI[sha256sum] = "565c6f4bd2d5747b919454fc1d439963024fc78ca56fd05158c3b2cde2f6912b"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.0.2.bb b/meta/recipes-graphics/mesa/mesa_21.0.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.0.2.bb
rename to meta/recipes-graphics/mesa/mesa_21.0.3.bb
-- 
2.30.2

