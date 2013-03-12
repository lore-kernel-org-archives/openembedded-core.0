Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1UFXqx-0004TJ-6u
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 23:39:28 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Mar 2013 15:22:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,833,1355126400"; d="scan'208";a="301230861"
Received: from unknown (HELO localhost) ([10.255.12.139])
	by fmsmga001.fm.intel.com with ESMTP; 12 Mar 2013 15:22:46 -0700
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2013 17:22:45 -0500
Message-Id: <cc3b5135364578a0069a0437b8834724a655b235.1363126772.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1363126772.git.tom.zanussi@linux.intel.com>
References: <cover.1363126772.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/1] perf: bump PE
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
X-List-Received-Date: Tue, 12 Mar 2013 22:39:28 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

Renaming the perf recipe to remove the PV resulted in the default PV
of 1.0 being used instead, which precedes the previous version number,
3.4.  As mentioned in the previous patch, the version number was
essentially arbitrary, and happened to be set to 3.4.  There's nothing
to peg the perf recipe to any particular version of the kernel, so
we'll just keep the default version but bump the epoch.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 meta/recipes-kernel/perf/perf.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 3c49922..e3b19be 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -10,6 +10,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
 PR = "r8"
+PE = "1"
 
 require perf-features.inc
 
-- 
1.7.11.4



