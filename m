Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1UDlb2-0002nR-AZ
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 01:55:43 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Mar 2013 16:39:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,804,1355126400"; d="scan'208";a="273598375"
Received: from unknown (HELO localhost) ([10.255.13.90])
	by orsmga001.jf.intel.com with ESMTP; 07 Mar 2013 16:39:04 -0800
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org, bruce.ashfield@windriver.com,
	dvhart@linux.intel.com
Date: Thu,  7 Mar 2013 18:39:01 -0600
Message-Id: <957507c1d36185cf5c6a1ac9b5781c3344d5a40d.1362702690.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <4293cea264609a122b9cc05831fe598fcb3ff677.1362702690.git.tom.zanussi@linux.intel.com>
References: <4293cea264609a122b9cc05831fe598fcb3ff677.1362702690.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1362702690.git.tom.zanussi@linux.intel.com>
References: <cover.1362702690.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 2/2] perf: rename perf_3.4 to perf
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
X-List-Received-Date: Fri, 08 Mar 2013 00:55:55 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

There's nothing kernel-version-specific about the perf_3.4 recipe, so
it's actually misnamed and misleading now that it also gets used with
the 3.8 kernel.

Since the recipe isn't tied to a specific PV, and simply uses
whatever's in STAGING_KERNEL_DIR, there's no reason to add anything
else either to the bare PN, so just use that as the recipe name.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 meta/recipes-kernel/perf/{perf_3.4.bb => perf.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-kernel/perf/{perf_3.4.bb => perf.bb} (100%)

diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf.bb
similarity index 100%
rename from meta/recipes-kernel/perf/perf_3.4.bb
rename to meta/recipes-kernel/perf/perf.bb
-- 
1.7.11.4



