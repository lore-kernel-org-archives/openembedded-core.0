Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Tv7aucQeCKxE1FLh0zYQpiK/zFVQBf1uyf62Wf4mGDbY2OIov+1Sr6PpPUvc3Bwf7yfs3hGDJx
 CLXqFFuaQgTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671114"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671114"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:43 -0800
IronPort-SDR: WiczyGy4qcPdtH2OiYScyadXozp7/2bkV6sUBN7ssX49b4nX4p2JislrkdCTqU+9nNVfHWGvEM
 rU3ffFiQsblw==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128991"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:42 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 33/52] asciidoc: Switch to using the main branch
Date: Fri,  5 Mar 2021 12:21:09 +0800
Message-Id: <799138a281fd72a98025b16313fcc229cc8a2be7.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Upstream has renamed the "master" branch to "main".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 05637733cf89a81fd5d787402f5a917f279a1a0d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/asciidoc/asciidoc_9.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_9.0.2.bb b/meta/recipes-extended/asciidoc/asciidoc_9.0.2.bb
index 711bfbfb9b..5fd3832ef9 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_9.0.2.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_9.0.2.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e5d1baf6f20559e3bec172226a47e4e \
                     file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 "
 
-SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https \
+SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https;branch=main \
            file://auto-catalogs.patch"
 SRCREV = "9a407dc9a497364c91421fd961954eddb565baf1"
 
-- 
2.29.2

