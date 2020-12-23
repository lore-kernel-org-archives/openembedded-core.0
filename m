Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web08.3271.1608686540143735667
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 17:22:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: t9afjLKK1mTpxKDS9X58uYgbib+FA0V6TA1lgu3mBdzun1VKoC9RshsETkAY7Ogd7mn9L5kSRo
 rB4oK8XSBlmg==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="260677289"
X-IronPort-AV: E=Sophos;i="5.78,440,1599548400"; 
   d="scan'208";a="260677289"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2020 17:22:15 -0800
IronPort-SDR: ammTncRj1MhVdqUKLbdrVyImHhdrZgaC8m8f17LYAmKa4CzC51DUyCsPTM5gURT1L53tppvqCK
 vUv+/k8LVT9g==
X-IronPort-AV: E=Sophos;i="5.78,440,1599548400"; 
   d="scan'208";a="564869399"
Received: from sinpeng-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.180.94])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2020 17:22:14 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH] weston: Fix PACKAGECONFIG for remoting
Date: Wed, 23 Dec 2020 09:22:09 +0800
Message-Id: <20201223012209.31130-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Robert Yang <liezhi.yang@windriver.com>

Fix a typo: gstreamer-1.0 -> gstreamer1.0.

(From OE-Core rev: d5b030dd9b9ada796f90919c97c887b00612cfc0)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0eebc82cc026ac03a44aad91c28904a2fb3095ba)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/wayland/weston_8.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_8.0.0.bb b/meta/recipes-graphics/wayland/weston_8.0.0.bb
index 8fef864827..0b383f25f3 100644
--- a/meta/recipes-graphics/wayland/weston_8.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_8.0.0.bb
@@ -70,7 +70,7 @@ PACKAGECONFIG[colord] = "-Dcolor-management-colord=true,-Dcolor-management-color
 # Clients support
 PACKAGECONFIG[clients] = "-Dsimple-clients=all -Ddemo-clients=true,-Dsimple-clients= -Ddemo-clients=false"
 # Virtual remote output with GStreamer on DRM backend
-PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer-1.0"
+PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer1.0"
 # Weston with PAM support
 PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam"
 # Weston with screen-share support
-- 
2.29.2

