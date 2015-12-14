Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 62FFB73183
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:08:19 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 14 Dec 2015 07:08:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="707064253"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Dec 2015 07:08:20 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 17:05:30 +0200
Message-Id: <c1d3394a6ddaa472675ae5568717eb0cdc71b85a.1450104283.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 18/20] babeltrace: update to 1.3.1
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
X-List-Received-Date: Mon, 14 Dec 2015 15:08:19 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../lttng/{babeltrace_1.2.4.bb => babeltrace_1.3.1.bb}               | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/lttng/{babeltrace_1.2.4.bb => babeltrace_1.3.1.bb} (90%)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.2.4.bb b/meta/recipes-kernel/lttng/babeltrace_1.3.1.bb
similarity index 90%
rename from meta/recipes-kernel/lttng/babeltrace_1.2.4.bb
rename to meta/recipes-kernel/lttng/babeltrace_1.3.1.bb
index 536be41..36345e3 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.2.4.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.3.1.bb
@@ -10,10 +10,9 @@ inherit autotools pkgconfig
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
-SRCREV = "90395824efc007de88787a6b8e400a07c980be1c"
-PV = "1.2.4+git${SRCPV}"
+SRCREV = "6e2b9096c77138593097335b9b27202d98918089"
 
-SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.2 \
+SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.3 \
            file://0001-Fix-invalid-pointer-free-with-trace-collection.patch \
 "
 
-- 
2.6.2


