Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF456FF9D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 13:27:11 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 22 Apr 2016 06:26:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,517,1455004800"; d="scan'208";a="89994840"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 22 Apr 2016 06:26:51 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Apr 2016 16:26:43 +0300
Message-Id: <b0e90c378280d55e73abbb3464b08c77bde64867.1461329608.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1461329608.git.jussi.kukkonen@intel.com>
References: <cover.1461329608.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/2] babeltrace: Let autotools.bbclass run autoreconf
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
X-List-Received-Date: Fri, 22 Apr 2016 13:27:12 -0000

When bootstrap calls autoreconf, it won't have AC_LOCAL set properly
so shared scripts may not be found: glib-2.0.m4 in this case.

Remove custom bootstrap code so autotools class handles this.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-kernel/lttng/babeltrace_1.3.1.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.3.1.bb b/meta/recipes-kernel/lttng/babeltrace_1.3.1.bb
index 1766026..6f4cb85 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.3.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.3.1.bb
@@ -18,7 +18,3 @@ SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.3 \
 "
 
 S = "${WORKDIR}/git"
-
-do_configure_prepend () {
-	( cd ${S}; ${S}/bootstrap )
-}
-- 
2.1.4


