Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UGCdo-0003Ye-US
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 19:12:37 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Mar 2013 10:55:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,845,1355126400"; d="scan'208";a="214773910"
Received: from unknown (HELO dell-desktop.rb.intel.com) ([10.237.105.59])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Mar 2013 10:55:44 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2013 19:55:13 +0200
Message-Id: <7a0676a7bd0a34b1bc9018d32220fbee097120df.1363283478.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1363283478.git.radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
In-Reply-To: <cover.1363283478.git.radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
Subject: [PATCH 14/17] babeltrace: Upgrade to v1.0.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Mar 2013 18:12:38 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../{babeltrace_1.0.0.bb => babeltrace_1.0.3.bb}   |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{babeltrace_1.0.0.bb => babeltrace_1.0.3.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.0.0.bb b/meta/recipes-kernel/lttng/babeltrace_1.0.3.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/babeltrace_1.0.0.bb
rename to meta/recipes-kernel/lttng/babeltrace_1.0.3.bb
index 4223c54..dee900e 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.0.0.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.0.3.bb
@@ -10,7 +10,7 @@ inherit autotools
 
 DEPENDS = "glib-2.0 util-linux popt"
 
-SRCREV = "f6ed7fa4636ff22e08f57721dcd312828547aa66"
+SRCREV = "9eaf25433864cefc40242e0257a0177ef4515930"
 PV = "1.0+git${SRCPV}"
 PR = "r0"
 
-- 
1.7.9.5



