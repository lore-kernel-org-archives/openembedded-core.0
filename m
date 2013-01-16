Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TvVIO-0005Ul-HE
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 16:53:04 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 Jan 2013 07:37:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,479,1355126400"; d="scan'208";a="277640314"
Received: from unknown (HELO localhost) ([10.255.14.217])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jan 2013 07:37:23 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org,
	martin.jansa@gmail.com
Date: Wed, 16 Jan 2013 09:37:22 -0600
Message-Id: <9c37b12484a30237b8f2e20a02527476e240f9ba.1358350412.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1358350412.git.tom.zanussi@intel.com>
References: <cover.1358350412.git.tom.zanussi@intel.com>
Subject: [PATCH 1/1] lttng-ust: bump PE
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
X-List-Received-Date: Wed, 16 Jan 2013 15:53:04 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

The previous lttng-ust had a PE of "1" - that recipe was removed and
replaced with the lttng2-ust recipe, which was renamed back to
lttng-ust.  The new recipe had didn't define a PE so got the default
PE of 0 - this adds the PE back and gives it a value of "2", which
reflects the history and fixes the following error:

ERROR: Package version for package lttng-ust went backwards which
would break package feeds from (1:0.16-r1 to 0:2.1.0-r0)

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-kernel/lttng/lttng-ust_2.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.1.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.1.0.bb
index 1076bde..20c8b3d 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.1.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.1.0.bb
@@ -20,6 +20,7 @@ RCONFLICTS_${PN} = "lttng2-ust"
 SRCREV = "0c9ad44b7604040dfcd1e67b18afc3dc5d025b19"
 PV = "2.1.0"
 PR = "r0"
+PE = "2"
 
 SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git"
 
-- 
1.7.11.4



