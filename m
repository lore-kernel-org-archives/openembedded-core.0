Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1UBU7D-00050t-2v
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 18:51:35 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Mar 2013 09:33:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,762,1355126400"; d="scan'208";a="269673266"
Received: from unknown (HELO localhost) ([10.255.12.240])
	by orsmga001.jf.intel.com with ESMTP; 01 Mar 2013 09:34:36 -0800
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Mar 2013 11:34:56 -0600
Message-Id: <4c6c5705aada50765653435bf008a6bc4a1e981d.1362158882.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <4e9a2c972a0e3254965fe12cdc8ede1f2acd6faa.1362158882.git.tom.zanussi@linux.intel.com>
References: <4e9a2c972a0e3254965fe12cdc8ede1f2acd6faa.1362158882.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1362158882.git.tom.zanussi@linux.intel.com>
References: <cover.1362158882.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 2/3] perf: add bash dependency
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
X-List-Received-Date: Fri, 01 Mar 2013 17:51:35 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

There are a number of scripts in the perf installation that use bash,
so we need to add a run-time dependency on bash for them. If not, we
can generate build errors like "no package provides /bin/bash".

Fixes [YOCTO #3951].

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 meta/recipes-kernel/perf/perf_3.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
index e89a7c3..be0f386 100644
--- a/meta/recipes-kernel/perf/perf_3.4.bb
+++ b/meta/recipes-kernel/perf/perf_3.4.bb
@@ -28,7 +28,7 @@ DEPENDS = "virtual/kernel \
           "
 
 SCRIPTING_RDEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl perl-modules python', '',d)}"
-RDEPENDS_${PN} += "elfutils ${SCRIPTING_RDEPENDS}"
+RDEPENDS_${PN} += "elfutils bash ${SCRIPTING_RDEPENDS}"
 
 PROVIDES = "virtual/perf"
 
-- 
1.7.11.4



