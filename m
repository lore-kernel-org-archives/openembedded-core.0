Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.8124.1611038764033174121
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 15QGJIzfcxISo6tBYnw9yfaHis7xHixF+EBbnKdnV/G3tgvtrL4saxcu5iO5NiAZqEJ7qmXre6
 RQx0qmXeAEQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035579"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035579"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:45:58 -0800
IronPort-SDR: za9j5edJl4jhNw3Bx/iGoijXajSzgcg9u+4FXUJLVkT0XGIqpa1ud5/9D3G+KaPjm7dtRhbT84
 Vxnkj2oIgSuQ==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441566"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:45:57 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/30] gstreamer1.0: upgrade 1.18.2 -> 1.18.3
Date: Tue, 19 Jan 2021 14:45:24 +0800
Message-Id: <20210119064552.115692-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gstreamer1.0_1.18.2.bb => gstreamer1.0_1.18.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.2.bb => gstreamer1.0_1.18.3.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.3.bb
index cce0f99226..7ad0248b7c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.3.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0002-Remove-unused-valgrind-detection.patch \
            file://0003-meson-Add-option-for-installed-tests.patch \
            "
-SRC_URI[sha256sum] = "66cdeb4f970c2e55932a2f427177d438fe2c55c0b6d29e80fda80263f2ae5446"
+SRC_URI[sha256sum] = "0c2e09e18f2df69a99b5cb3bd53c597b3cc2e35cf6c98043bb86a66f3d312100"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.29.2

