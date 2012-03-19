Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1S9Rvd-00063e-Oj
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 03:02:34 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Mar 2012 18:53:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130366815"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.62])
	by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2012 18:53:38 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Mar 2012 09:52:04 +0800
Message-Id: <14ba30517e7ece9590e5ea76a963ed9b6720df09.1332121842.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1332121842.git.lianhao.lu@intel.com>
References: <cover.1332121842.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] sysvinit-inittab: Fixed license warning.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Mar 2012 02:02:34 -0000

WARNING: .../sysvinit-inittab-2.88dsf-r6/sysvinit-2.88dsf/COPYING could
not be copied for some reason. It may not exist. WARN for now.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 3a716d7..85e34c8 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -11,7 +11,11 @@ S = "${WORKDIR}/sysvinit-${PV}"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-do_configure() {
+do_unpack_append() {
+	bb.build.exec_func('do_copy_lic', d)
+}
+
+do_copy_lic () {
 	cp ${WORKDIR}/COPYING ${S}/
 }
 
-- 
1.7.0.4



