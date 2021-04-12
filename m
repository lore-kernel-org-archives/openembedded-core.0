Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.29432.1618218515903981471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 02:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 0ehmY6T4G3NbfoMKKv72H1bVUdnjk3WN0Y+p1eq4IncUNdzQh51KXCwfAZy036uwESLFuhC/Tf
 zSBm6DwxCw+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="255467947"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="255467947"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:55 -0700
IronPort-SDR: Fn1qOExUKRWfgqM0vDn2XC/vNR+YMX/GApjw7//HoUCuhYS6Lz/CU+u5B4CpoBtJlsadiMg5oQ
 u1U7VK9PTl8g==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="531809137"
Received: from pchuang-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.174.143])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:54 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 14/18] documentation-audit.sh: Fix typo in specifying LICENSE_FLAGS_WHITELIST
Date: Mon, 12 Apr 2021 17:08:22 +0800
Message-Id: <23144a6d9ada878a9d3bc6f33439497a555bd014.1618210563.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618210563.git.anuj.mittal@intel.com>
References: <cover.1618210563.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 410a45639d84a3d69a65133593da32062196dd59)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/contrib/documentation-audit.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/documentation-audit.sh b/scripts/contrib/documentation-audit.sh
index 1191f57a8e..f436f9bae0 100755
--- a/scripts/contrib/documentation-audit.sh
+++ b/scripts/contrib/documentation-audit.sh
@@ -27,7 +27,7 @@ fi
 
 echo "REMINDER: you need to build for MACHINE=qemux86 or you won't get useful results"
 echo "REMINDER: you need to set LICENSE_FLAGS_WHITELIST appropriately in local.conf or "
-echo " you'll get false positives.  For example, LICENSE_FLAGS_WHITELIST = \"Commercial\""
+echo " you'll get false positives.  For example, LICENSE_FLAGS_WHITELIST = \"commercial\""
 
 for pkg in `bitbake -s | awk '{ print \$1 }'`; do
 	if [[ "$pkg" == "Loading" || "$pkg" == "Loaded" ||
-- 
2.30.2

