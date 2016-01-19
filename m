Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DFC746FF23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 15:41:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2016 07:40:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,317,1449561600"; d="scan'208";a="893851772"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2016 07:40:24 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 17:37:33 +0200
Message-Id: <05132833acd389dbe36046e245665313ee574221.1453217744.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
References: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
References: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/12] bootchart2: update to 0.14.8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jan 2016 15:41:21 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../bootchart2/{bootchart2_0.14.7.bb => bootchart2_0.14.8.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/bootchart2/{bootchart2_0.14.7.bb => bootchart2_0.14.8.bb} (99%)

diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.7.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
similarity index 99%
rename from meta/recipes-devtools/bootchart2/bootchart2_0.14.7.bb
rename to meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
index 7586ff2..86c614a 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.7.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.8.bb
@@ -95,7 +95,7 @@ SRC_URI = "git://github.com/mmeeks/bootchart.git \
           "
 
 S = "${WORKDIR}/git"
-SRCREV = "6f050b65ae9f266645f04f0aecab9efb88375f1c"
+SRCREV = "48e0071048564c6af75ab969e842d6dec808da09"
 
 inherit systemd
 inherit update-rc.d
-- 
2.6.4


