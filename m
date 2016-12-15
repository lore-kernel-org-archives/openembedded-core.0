Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 9A8D9772BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 12:48:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 15 Dec 2016 04:48:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,351,1477983600"; d="scan'208";a="18480799"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 15 Dec 2016 04:48:32 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 14:47:57 +0200
Message-Id: <018cf853d28a1ba651b1482a30a4be94b7daf8db.1481805889.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
References: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/16] babeltrace: update to 1.5.0
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
X-List-Received-Date: Thu, 15 Dec 2016 12:48:31 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-kernel/lttng/{babeltrace_1.4.0.bb => babeltrace_1.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{babeltrace_1.4.0.bb => babeltrace_1.5.0.bb} (82%)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.4.0.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.0.bb
similarity index 82%
rename from meta/recipes-kernel/lttng/babeltrace_1.4.0.bb
rename to meta/recipes-kernel/lttng/babeltrace_1.5.0.bb
index 0fadeb0..695b61f 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.4.0.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.0.bb
@@ -15,6 +15,6 @@ SRC_URI = "http://www.efficios.com/files/babeltrace/babeltrace-${PV}.tar.bz2 \
 
 EXTRA_OECONF = "--disable-debug-info"
 
-SRC_URI[md5sum] = "fa99064048af5c9c6ff00e489ac809c2"
-SRC_URI[sha256sum] = "9469eeb22617cd12668683b04c27003e5337e9ac66ade914988df3642fc0d0e4"
+SRC_URI[md5sum] = "43696383e44d1b85173db7cbd0335f06"
+SRC_URI[sha256sum] = "354e75d74562f5228ab89e5fa16a3b4dffa95e7230c5086b74ffcf11fef60353"
 
-- 
2.10.2


