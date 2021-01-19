Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.8470.1611038797016909098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: gu6Tu7Xa2rtQRpgKLnNxjfiisF9f+uhxLs0SDZJZ3YwzyXcVYUl5X5WaRpQnBjQuaVE6+oHcB2
 8jTFQdpr2E6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035636"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035636"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:17 -0800
IronPort-SDR: d+pdwfv99e4PXp4MlX3yiZpre4UwDNK89KBSRQEyEHoruw7xhYuUmIpUPJyNMVmU0YxSiBRuZ1
 9rTZ+WdGJrWA==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441676"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:16 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/30] stress-ng: upgrade 0.12.00 -> 0.12.01
Date: Tue, 19 Jan 2021 14:45:38 +0800
Message-Id: <20210119064552.115692-16-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../stress-ng/{stress-ng_0.12.00.bb => stress-ng_0.12.01.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.12.00.bb => stress-ng_0.12.01.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.01.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.01.bb
index 3b38b39893..79157c738b 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.01.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "b2b738f574671926654b1623103a7aa58ee6911894ac78760ee188c4bfa96fe2"
+SRC_URI[sha256sum] = "d354bbbb1500cfe043c761014dc9c3f62779747fafea8a19af94402327f6d3fc"
 
 DEPENDS = "coreutils-native"
 
-- 
2.29.2

