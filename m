Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 68140724B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 05:55:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2014 21:55:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,550,1413270000"; d="scan'208";a="635378089"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.161])
	by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2014 21:55:22 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Dec 2014 21:55:14 -0800
Message-Id: <91a65d248a346c316cbd9346d0705d17e6350c49.1418190513.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1418190513.git.sgw@linux.intel.com>
References: <cover.1418190513.git.sgw@linux.intel.com>
In-Reply-To: <cover.1418190513.git.sgw@linux.intel.com>
References: <cover.1418190513.git.sgw@linux.intel.com>
Subject: [PATCH 2/6] babeltrace: Update to 1.2.4
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
X-List-Received-Date: Wed, 10 Dec 2014 05:55:30 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-kernel/lttng/{babeltrace_1.2.3.bb => babeltrace_1.2.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{babeltrace_1.2.3.bb => babeltrace_1.2.4.bb} (89%)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.2.3.bb b/meta/recipes-kernel/lttng/babeltrace_1.2.4.bb
similarity index 89%
rename from meta/recipes-kernel/lttng/babeltrace_1.2.3.bb
rename to meta/recipes-kernel/lttng/babeltrace_1.2.4.bb
index c62589c..f616146 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.2.3.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.2.4.bb
@@ -10,8 +10,8 @@ inherit autotools pkgconfig
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
-SRCREV = "753a40ead9fa4f6bd5e29d5765e2021122df9c1c"
-PV = "1.2.3+git${SRCPV}"
+SRCREV = "90395824efc007de88787a6b8e400a07c980be1c"
+PV = "1.2.4+git${SRCPV}"
 
 SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.2"
 
-- 
1.8.3.1


