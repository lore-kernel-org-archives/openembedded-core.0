Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.8243.1611038795825494015
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: hrEliDKOQHxXNrIcaN6nL+itx5pJoUNAaS/oplbYGeXNfVHGFEkwIzxZDTIir+FDM9Q1KPVdMO
 9a/NP73S95PQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035623"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035623"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:14 -0800
IronPort-SDR: thFTDO6AqBpma9Dh7kIl1EiXpWCJ0KPqnOfHzkoqbI4vFvI76BBn7zBXZ3Vttpa2QdZm9kn2Jy
 BNl9IMN9jsXw==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441655"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:12 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/30] gstreamer1.0-plugins-ugly: upgrade 1.18.2 -> 1.18.3
Date: Tue, 19 Jan 2021 14:45:35 +0800
Message-Id: <20210119064552.115692-13-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ugins-ugly_1.18.2.bb => gstreamer1.0-plugins-ugly_1.18.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.18.2.bb => gstreamer1.0-plugins-ugly_1.18.3.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.3.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.3.bb
index e482aa10b2..fe737a9984 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.3.bb
@@ -9,7 +9,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "a337a022ed472209b38cab5918dc2f4e7a6adc1f4afacd226a6345e5cb668bdb"
+SRC_URI[sha256sum] = "70f7429b25dd2f714eb18e80af61b1363b1f63019e16cd28e086e3a619eaa992"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.29.2

