Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.12227.1612886002393736054
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:53:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: cbtd45Lct4mdA87lf4gIvVJ4l9jyTEZGFaAAnQTBiqplUlINNA55PwSozerkZll5mh2JwCQS4t
 Jonh1UQ74vCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="182045254"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="182045254"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:23 -0800
IronPort-SDR: NFTuApzjRiM8166UD9yI+wWMB19cXuxmpn+SxujYFPNwFxNiSBDUULTf/ZZEj/Xv79o2RFISD7
 0LSs3Hmj10lg==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215625"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:21 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 31/35] python3-pycairo: use python3targetconfig
Date: Tue,  9 Feb 2021 23:52:16 +0800
Message-Id: <6e83ef4a2b0db6a505cb1b4a60f82b48c7184a7c.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 27d1dcf065ac2ccb57229eef54dd63b45d0fc5f9)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/python/python3-pycairo_1.19.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb b/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb
index 34c8543bce..1734610d12 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "2c143183280feb67f5beb4e543fd49990c28e7df427301ede04fc550d3
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-inherit meson pkgconfig
+inherit meson pkgconfig python3targetconfig
 
 CFLAGS += "-fPIC"
 
-- 
2.29.2

