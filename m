Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 33B8C60939
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 11:48:32 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2017 04:48:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,337,1498546800"; d="scan'208";a="136607119"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 07 Aug 2017 04:48:33 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Aug 2017 14:45:02 +0300
Message-Id: <20170807114504.28410-5-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170807114504.28410-1-alexander.kanavin@linux.intel.com>
References: <20170807114504.28410-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/7] babeltrace: update to 1.5.3
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
X-List-Received-Date: Mon, 07 Aug 2017 11:48:32 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-kernel/lttng/{babeltrace_1.5.2.bb => babeltrace_1.5.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{babeltrace_1.5.2.bb => babeltrace_1.5.3.bb} (82%)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.2.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.3.bb
similarity index 82%
rename from meta/recipes-kernel/lttng/babeltrace_1.5.2.bb
rename to meta/recipes-kernel/lttng/babeltrace_1.5.3.bb
index c7ea5c1ba41..4d81da0160d 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.2.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.3.bb
@@ -15,5 +15,5 @@ SRC_URI = "http://www.efficios.com/files/babeltrace/babeltrace-${PV}.tar.bz2 \
 
 EXTRA_OECONF = "--disable-debug-info"
 
-SRC_URI[md5sum] = "1176e7f69e128112d5f29fefec39c6ce"
-SRC_URI[sha256sum] = "696ee46e5750ab57a258663e73915d2901b7cd4fc53b06eb3f7a0d7b1012fa56"
+SRC_URI[md5sum] = "0cec2745ac316649791c43f416d71ea1"
+SRC_URI[sha256sum] = "2249fee5beba657731f5d6a84c5296c6517f544bfbe7571bd1fd7af23726137c"
-- 
2.13.2


