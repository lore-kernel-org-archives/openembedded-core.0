Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3659060746
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 16:53:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jul 2016 09:53:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,430,1464678000"; d="scan'208";a="1025011139"
Received: from timo-fedora.jf.intel.com ([10.7.201.162])
	by orsmga002.jf.intel.com with ESMTP; 27 Jul 2016 09:53:02 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 09:53:45 -0700
Message-Id: <1469638425-3123-1-git-send-email-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] tcf-agent: update to 1.4_neon_bugfix branch
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
X-List-Received-Date: Wed, 27 Jul 2016 16:53:14 -0000

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index ab2fcd7..e5e41f1 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -5,11 +5,11 @@ BUGTRACKER = "https://bugs.eclipse.org/bugs/"
 LICENSE = "EPL-1.0 | EDL-1.0"
 LIC_FILES_CHKSUM = "file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
 
-SRCREV = "b9a735e9c7cf82f80d412b7ab15d08b89d5a4ccc"
-PV = "1.3.0+git${SRCPV}"
+SRCREV = "2dddd5f440a15d5406032fac20f206484513646f"
+PV = "1.4.0+git${SRCPV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git;branch=1.3_mars_bugfix \
+SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent;branch=1.4_neon_bugfix \
            file://fix_ranlib.patch \
            file://ldflags.patch \
            file://0001-canonicalize_file_name-is-specific-to-glibc.patch;striplevel=2 \
-- 
2.7.4


