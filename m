Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: +GnE0T5gDWwMDo/NVswU7VlkuC6k/tvuTjXUFiL/A6/Y+59Ve9x420dvNSijs+VtL96JCtg6qs
 syJeTR96Xdpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247079"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247079"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:23 -0800
IronPort-SDR: MIUZ6ZdR+9m7zYKOGbHE9OXpgMmAkrdPnJJtzfdyCjPF+kU0oN+AM4ROgI9gtNMSLvwiha+Wai
 6ADovLjFUzgw==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825394"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:22 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/27] vte: upgrade 0.62.1 -> 0.62.2
Date: Wed, 17 Feb 2021 13:51:49 +0800
Message-Id: <20210217055210.22019-6-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/vte/{vte_0.62.1.bb => vte_0.62.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.62.1.bb => vte_0.62.2.bb} (95%)

diff --git a/meta/recipes-support/vte/vte_0.62.1.bb b/meta/recipes-support/vte/vte_0.62.2.bb
similarity index 95%
rename from meta/recipes-support/vte/vte_0.62.1.bb
rename to meta/recipes-support/vte/vte_0.62.2.bb
index 1a8e21dec4..b7e6f0bd8f 100644
--- a/meta/recipes-support/vte/vte_0.62.1.bb
+++ b/meta/recipes-support/vte/vte_0.62.2.bb
@@ -18,7 +18,7 @@ inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-intros
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "c369e87c0c8284e09109d0a9aac821f543558f51c0cb9c7acfff3df64153308d"
+SRC_URI[archive.sha256sum] = "b0300bbcf0c02df5812a10a3cb8e4fff723bab92c08c97a0a90c167cf543aff0"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.29.2

