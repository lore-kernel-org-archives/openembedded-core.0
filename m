Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SAbaI-0008Ag-Kx
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 07:33:19 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Mar 2012 23:24:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="123722498"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by orsmga002.jf.intel.com with ESMTP; 21 Mar 2012 23:24:22 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 14:22:26 +0800
Message-Id: <72b58aa5265b91b42b4b7313c466ee66926f6d15.1332397079.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1332397079.git.lianhao.lu@intel.com>
References: <cover.1332397079.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] tcf-agent: Using git repository instead of svn.
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
X-List-Received-Date: Thu, 22 Mar 2012 06:33:19 -0000

Fixed bug [YOCTO #2152].

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 .../{tcf-agent_svn.bb => tcf-agent_git.bb}         |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/tcf-agent/{tcf-agent_svn.bb => tcf-agent_git.bb} (83%)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
similarity index 83%
rename from meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
rename to meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 55bed76..8ac8022 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -6,12 +6,12 @@ LICENSE = "EPL-1.0 | EDL-1.0"
 LIC_FILES_CHKSUM = "file://../epl-v10.html;md5=7aa4215a330a0a4f6a1cbf8da1a0879f \
                     file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
 
-SRCREV = "1855"
-PV = "0.0+svnr${SRCPV}"
-PR = "r3"
+SRCREV = "4ef94ecb927a8912c3d79ce137182247786cff8f"
+PV = "0.4.0+git${SRCPV}"
+PR = "r0"
 
-SRC_URI = "svn://dev.eclipse.org/svnroot/dsdp/org.eclipse.tm.tcf/trunk;module=agent;proto=http \
-           http://dev.eclipse.org/svnroot/dsdp/org.eclipse.tm.tcf/trunk/epl-v10.html;name=epl \
+SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git;proto=git \
+           http://www.eclipse.org/legal/epl-v10.html;name=epl \
            file://fix_ranlib.patch \
            file://fix_tcf-agent.init.patch \
           "
@@ -22,7 +22,7 @@ SRC_URI[epl.sha256sum] = "4fd64aeed340d62a64a8da4b371efe0f6d0d745f4d2dbefacba86c
 DEPENDS = "util-linux openssl"
 RDEPENDS_${PN} = "bash"
 
-S = "${WORKDIR}/agent"
+S = "${WORKDIR}/git"
 
 inherit update-rc.d
 
-- 
1.7.0.4



