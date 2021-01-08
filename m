Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3706.1610079500392423505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:18:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 8LQRB//UNkB/sqQxcLpxJXav1jGw9rcGQr0xyB1UQlhs/TE5PIpKoYGT6hZ0iKxvxbNwmu2JeJ
 IQdEoaTpb43A==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613650"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613650"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:27 -0800
IronPort-SDR: TyK2qtVzBzxq0x9K+WcrCTglqC/1iwhkXCl9AlJv0ZYcmEIxPGMNQ93Tkqm+XYfgOSoSdJGcfq
 miyKsefhzjlw==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209370"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:27 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 07/30] grub: fix "CVE:" line in one of the patches
Date: Fri,  8 Jan 2021 12:17:49 +0800
Message-Id: <f8aa7314f98748ecb7a9abc6702e795ae50b97a6.1610079279.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
References: <cover.1610079278.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Scott Murray <scott.murray@konsulko.com>

The "CVE:" line in the patch for CVEs 2020-14309, CVE-2020-14310, and
CVE-2020-14311 had commas between the CVE numbers, which resulted in
CVE-2020-14310 not being picked up as patched by cve-check.bbclass's
parsing.  Remove the commas to match cve-check.bbclass's expectations.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 396d5c0f9cffa4b54ae94738b1ef2b6fb545f082)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...1-malloc-Use-overflow-checking-primitives-where-we-do-.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch b/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
index 896a2145d4..7214ead9a7 100644
--- a/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
+++ b/meta/recipes-bsp/grub/files/CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch
@@ -30,7 +30,7 @@ Signed-off-by: Peter Jones <pjones@redhat.com>
 Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
 
 Upstream-Status: Backport
-CVE: CVE-2020-14309, CVE-2020-14310, CVE-2020-14311
+CVE: CVE-2020-14309 CVE-2020-14310 CVE-2020-14311
 
 Reference to upstream patch:
 https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3f05d693d1274965ffbe4ba99080dc2c570944c6
-- 
2.29.2

