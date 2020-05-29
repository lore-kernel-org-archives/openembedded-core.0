Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.29408.1590731652212875688
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 22:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Ys7yvzjYw5mZnuk/jQSUCAbsDx5iyFU3dGP+yAua/LhKaYmL4vJCJ2xKlFBQOTeOR3exuIKoPY
 fCf8wai6Awow==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:54:11 -0700
IronPort-SDR: qjoUg0DEDlK2Fxw3IjBG4P1/DP0OfxTCBpqY+uKK7jlKGK3Azp9zVf58tMFX01CFo+k3VCwzLp
 UOXYdIjYLp9g==
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; 
   d="scan'208";a="414866321"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.136.157])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:54:10 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 25/25] mesa: fix meson configure fix when 'dri' is excluded from PACKAGECONFIG
Date: Fri, 29 May 2020 13:53:01 +0800
Message-Id: <ee95a399285abbde84e0148ca957b59d65bcad0a.1590731377.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1590731377.git.anuj.mittal@intel.com>
References: <cover.1590731377.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Signed-off-by: Yann Dirson <yann@blade-group.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 78efff8741f869647790810a3dd41459b9d9d8a6)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
index 3458c19199..346b217585 100644
--- a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
+++ b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
@@ -23,7 +23,7 @@ index 0e50bb26c0a..de065c290d6 100644
  with_dri_swrast = dri_drivers.contains('swrast')
  
 -with_dri = dri_drivers.length() != 0 and dri_drivers != ['']
-+with_dri = get_option('dri') or (_drivers.length() != 0 and _drivers != [''])
++with_dri = get_option('dri') or (dri_drivers.length() != 0 and dri_drivers != [''])
  
  gallium_drivers = get_option('gallium-drivers')
  if gallium_drivers.contains('auto')
-- 
2.25.4

