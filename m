Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DC88A6FFD4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 14:01:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 May 2016 07:01:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,367,1459839600"; d="scan'208";a="975020320"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2016 07:01:14 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2016 17:00:49 +0300
Message-Id: <8497d8e250c4f0170dc1c03d67498b072de28586.1464271067.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
References: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
References: <cover.1464271067.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/6] babeltrace: upgrade to 1.3.2
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
X-List-Received-Date: Thu, 26 May 2016 14:01:14 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/lttng/{babeltrace_1.3.1.bb => babeltrace_1.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{babeltrace_1.3.1.bb => babeltrace_1.3.2.bb} (93%)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.3.1.bb b/meta/recipes-kernel/lttng/babeltrace_1.3.2.bb
similarity index 93%
rename from meta/recipes-kernel/lttng/babeltrace_1.3.1.bb
rename to meta/recipes-kernel/lttng/babeltrace_1.3.2.bb
index 6f4cb85..a7df630 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.3.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.3.2.bb
@@ -10,7 +10,7 @@ DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
 inherit autotools pkgconfig
 
-SRCREV = "6e2b9096c77138593097335b9b27202d98918089"
+SRCREV = "c551f7a1ed635138b083b4e9e0c445ef63d0a562"
 
 SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.3 \
            file://0001-Fix-invalid-pointer-free-with-trace-collection.patch \
-- 
2.8.1


