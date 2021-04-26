Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ow7Bfetg9/g9pURdkFFWxKaE85k28ENAc7uJQSM2OiNSStj4VquwkTsPle2FP+LeYD4/+qT//3
 rwUlw4lI6Okw==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818147"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818147"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:30 -0700
IronPort-SDR: nQ28PV/XWksBlfGt1oRfcKp/bCCfE14ArrL3Fopbx2Pj67qkoSP4HQozw4Du4uVxBlL6894wrQ
 HCrsn5q4WCRQ==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067384"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:29 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 26/64] mesa: upgrade 21.0.1 -> 21.0.2
Date: Mon, 26 Apr 2021 08:52:57 +0800
Message-Id: <c94987889ccf82746221574a41d7d27464254467.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 58ad359da1b05820ea3dc4ae3f789ccb8991fc32)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../mesa/{mesa-gl_21.0.1.bb => mesa-gl_21.0.2.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.0.1.bb => mesa_21.0.2.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_21.0.1.bb => mesa-gl_21.0.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.0.1.bb => mesa_21.0.2.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.1.bb b/meta/recipes-graphics/mesa/mesa-gl_21.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.0.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.0.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index caf3c62ad8..5705ae0f08 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            "
 
-SRC_URI[sha256sum] = "379fc984459394f2ab2d84049efdc3a659869dc1328ce72ef0598506611712bb"
+SRC_URI[sha256sum] = "46c1dc5bb54a372dee43ec3c067229c299187d5bdadf1402756bbf66a6df5b88"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.0.1.bb b/meta/recipes-graphics/mesa/mesa_21.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.0.1.bb
rename to meta/recipes-graphics/mesa/mesa_21.0.2.bb
-- 
2.30.2

