Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.29384.1590731592716727128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 22:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: BliTNhruOf0qkf6gurMdiCIyl+ZRO9hYGCIa0oFV/WBXri6VUSyLplO4INPMYVwiS0Qkh3y0Hs
 FA1hdOGK8T7g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:28 -0700
IronPort-SDR: 3mH1vNiv64Ft3LkQLaNqJ3cJEP9wlC6gI/iwbDJVJyBQya7bPm9SaiI538QDtN92dO2EiXduql
 WJyDBHyLHr5Q==
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; 
   d="scan'208";a="414866172"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.136.157])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:27 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 08/25] wireless-regdb: Upgrade 2019.06.03 -> 2020.04.29
Date: Fri, 29 May 2020 13:52:44 +0800
Message-Id: <91686105f34f578458a5db1b8a40f15ca27a7944.1590731377.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1590731377.git.anuj.mittal@intel.com>
References: <cover.1590731377.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adrian Bunk <bunk@kernel.org>

(From OE-Core rev: 5b71a3f3d1bca6b52f53b97971131a6771618420)

Signed-off-by: Adrian Bunk <bunk@kernel.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...reless-regdb_2019.06.03.bb => wireless-regdb_2020.04.29.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2019.06.03.bb => wireless-regdb_2020.04.29.bb} (91%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2019.06.03.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.04.29.bb
similarity index 91%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2019.06.03.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.04.29.bb
index 9076d94601..a5827b9ef0 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2019.06.03.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2020.04.29.bb
@@ -5,8 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "4b5ba3f089db7fdb7b9daae6a7c1f2cb"
-SRC_URI[sha256sum] = "cd917ed86b63ce8d93947979f1f18948f03a4ac0ad89ec25227b36ac00dc54bf"
+SRC_URI[sha256sum] = "89fd031aed5977c219a71501e144375a10e7c90d1005d5d086ea7972886a2c7a"
 
 inherit bin_package allarch
 
-- 
2.25.4

