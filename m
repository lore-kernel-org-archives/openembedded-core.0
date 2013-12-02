Return-Path: <cristiana.voicu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5E3696D27E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 09:06:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Dec 2013 01:02:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,809,1378882800"; d="scan'208";a="417818250"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.65])
	by orsmga001.jf.intel.com with ESMTP; 02 Dec 2013 01:06:07 -0800
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2013 11:12:05 +0200
Message-Id: <1385975525-29032-1-git-send-email-cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] babeltrace: correct PV variable
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
X-List-Received-Date: Mon, 02 Dec 2013 09:06:23 -0000

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 meta/recipes-kernel/lttng/babeltrace_1.1.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.1.1.bb b/meta/recipes-kernel/lttng/babeltrace_1.1.1.bb
index beb79be..a6b8a97 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.1.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.1.1.bb
@@ -11,7 +11,7 @@ inherit autotools
 DEPENDS = "glib-2.0 util-linux popt"
 
 SRCREV = "a386e24609752742b100120db6798d311fab512a"
-PV = "1.1+git${SRCPV}"
+PV = "1.1.1+git${SRCPV}"
 
 SRC_URI = "git://git.efficios.com/babeltrace.git"
 
-- 
1.7.9.5


