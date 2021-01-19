Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web08.8244.1611038799087798389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: CN+Wsy9kEuJs7l+qVpYmpFvtw45jCxWn/2smt4lLLI+JLEqJ6VPW5jWg+RnB0KvalT2oFweBDO
 jQ76EF/xDIIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035651"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035651"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:24 -0800
IronPort-SDR: 851/vwoH57OxirSEV4gFE9vConILqsND7RMPzzKbMyR6XJZaiUfY3sLw8Wn5an1ehCamn85seV
 WlHlgk6l2UYw==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441789"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:23 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 21/30] vala: upgrade 0.50.2 -> 0.50.3
Date: Tue, 19 Jan 2021 14:45:43 +0800
Message-Id: <20210119064552.115692-21-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/vala/{vala_0.50.2.bb => vala_0.50.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.50.2.bb => vala_0.50.3.bb} (50%)

diff --git a/meta/recipes-devtools/vala/vala_0.50.2.bb b/meta/recipes-devtools/vala/vala_0.50.3.bb
similarity index 50%
rename from meta/recipes-devtools/vala/vala_0.50.2.bb
rename to meta/recipes-devtools/vala/vala_0.50.3.bb
index b5913fca8b..302f562549 100644
--- a/meta/recipes-devtools/vala/vala_0.50.2.bb
+++ b/meta/recipes-devtools/vala/vala_0.50.3.bb
@@ -2,4 +2,4 @@ require ${BPN}.inc
 
 SRC_URI += " file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch"
 
-SRC_URI[sha256sum] = "2c0d5dc6d65d070f724063075424c403765ab7935c9e6fbcb84981b94d07ceda"
+SRC_URI[sha256sum] = "6165c1b42beca4856e2fb9a31c5e81949d76fa670e2f0cfc8389ce9b95eca5db"
-- 
2.29.2

