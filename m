Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.24792.1611128477823315504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 23:41:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 2X0WmA/GB5FI3M0GXxUV9OXu2OWsxbIvvcxVLL5kfi4qfk+coLc9ysbRL9OwZtguVlKjnv89IG
 /SUi7X/C2BMg==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="158240443"
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="158240443"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:41:16 -0800
IronPort-SDR: lkErUAh/opLdZpXkmRgrdMh+Q59Ob5kNbGy/eaI+XqGCcOn5BIw3C++QSCEc0kMCoybkhico0a
 ew3LYZdcsOLA==
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="350958500"
Received: from mrengasa-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.144.190])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:41:15 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/10] acpica: upgrade 20201217 -> 20210105
Date: Wed, 20 Jan 2021 15:40:49 +0800
Message-Id: <20210120074058.252462-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years changed

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../acpica/{acpica_20201217.bb => acpica_20210105.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20201217.bb => acpica_20210105.bb} (91%)

diff --git a/meta/recipes-extended/acpica/acpica_20201217.bb b/meta/recipes-extended/acpica/acpica_20210105.bb
similarity index 91%
rename from meta/recipes-extended/acpica/acpica_20201217.bb
rename to meta/recipes-extended/acpica/acpica_20210105.bb
index 91bcd8a46d..48b560db53 100644
--- a/meta/recipes-extended/acpica/acpica_20201217.bb
+++ b/meta/recipes-extended/acpica/acpica_20210105.bb
@@ -10,14 +10,14 @@ HOMEPAGE = "http://www.acpica.org/"
 SECTION = "console/tools"
 
 LICENSE = "Intel | BSD | GPLv2"
-LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=6adbcb81e9ee6ae50c569b94fe12f7c5"
+LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=c33ce358fdcd142684e41e336b7992e8"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-SRC_URI[sha256sum] = "df6bb667c60577c89df5abe3270539c1b9716b69409d1074d6a7fc5c2fea087b"
+SRC_URI[sha256sum] = "a9be7b749025e60f93fde2fe531bfe0d84a33641d3e0c9b0f6049f996dbb1ff8"
 
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
-- 
2.29.2

