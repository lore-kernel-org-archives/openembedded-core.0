Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QpHoj-0001bH-FD
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 12:39:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Aug 2011 03:35:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,322,1309762800"; d="scan'208";a="35679489"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2011 03:35:23 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 18:37:13 +0800
Message-Id: <a514208c6a630b48d3fa710d2e5abb87743aac5b.1312540193.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <8f296f721bbda3e9df8a80422cd876b9d52712f8.1312540193.git.lianhao.lu@intel.com>
References: <8f296f721bbda3e9df8a80422cd876b9d52712f8.1312540193.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1312540193.git.lianhao.lu@intel.com>
References: <cover.1312540193.git.lianhao.lu@intel.com>
Subject: [PATCH 3/6] qt4x11.bbclass: Using BPN instead of PN.
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
X-List-Received-Date: Fri, 05 Aug 2011 10:39:49 -0000

[YOCTO #1335] Using BPN instead of BP to decide the DEPENDS content for
multilib cases.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/qt4x11.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/qt4x11.bbclass b/meta/classes/qt4x11.bbclass
index abb1d9d..ee2cdca 100644
--- a/meta/classes/qt4x11.bbclass
+++ b/meta/classes/qt4x11.bbclass
@@ -1,4 +1,4 @@
-DEPENDS_prepend = "${@["qt4-x11-free ", ""][(bb.data.getVar('PN', d, 1)[:12] == 'qt4-x11-free')]}"
+DEPENDS_prepend = "${@["qt4-x11-free ", ""][(bb.data.getVar('BPN', d, True)[:12] == 'qt4-x11-free')]}"
 
 inherit qmake2
 
-- 
1.7.0.4



