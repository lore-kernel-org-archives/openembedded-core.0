Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.2597.1613622265608276454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 20:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: vKfnCn55iC23sXxSoFxzLhBN9TdY483Ot++m4BFS2KuMle4fKdSBjhtrFLv7y/grh1u6fHrD1B
 e6votmZgEVeA==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="163177952"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="163177952"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:27 -0800
IronPort-SDR: LZ61lXEUPMq+oD+d/ZR2YRJofbArJfeAQFQtWEX6r79YUHDZYc76tKrI6WxCUOMdMNWh5nz+y7
 De7aWye+dwZA==
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="378269175"
Received: from zaizam-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.203])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:26 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/12] diffoscope: upgrade 164 -> 166
Date: Thu, 18 Feb 2021 12:24:09 +0800
Message-Id: <20210218042418.281245-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210218042418.281245-1-anuj.mittal@intel.com>
References: <20210218042418.281245-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../diffoscope/{diffoscope_164.bb => diffoscope_166.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_164.bb => diffoscope_166.bb} (83%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_164.bb b/meta/recipes-support/diffoscope/diffoscope_166.bb
similarity index 83%
rename from meta/recipes-support/diffoscope/diffoscope_164.bb
rename to meta/recipes-support/diffoscope/diffoscope_166.bb
index 7707c441ca..14c95fe5af 100644
--- a/meta/recipes-support/diffoscope/diffoscope_164.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_166.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "bc269a39ec72261d9fead55bd951f6cbbe3d2ccce1481f974665999a5b141fff"
+SRC_URI[sha256sum] = "20d0b4091ae535dc7d094bf5f366e0687e0b4337a268254b11925b8e7c9ea9c4"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.29.2

