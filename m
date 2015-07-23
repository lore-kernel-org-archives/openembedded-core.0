Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 60B8D73217
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 23:02:19 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 23 Jul 2015 16:02:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,534,1432623600"; d="scan'208";a="611806516"
Received: from bitbang.jf.intel.com ([10.7.201.51])
	by orsmga003.jf.intel.com with ESMTP; 23 Jul 2015 16:02:20 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 16:02:17 -0700
Message-Id: <1437692537-20167-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1437691897-10440-1-git-send-email-randy.e.witt@linux.intel.com>
References: <1437691897-10440-1-git-send-email-randy.e.witt@linux.intel.com>
Subject: [PATCH v3] tcf-agent: Update to version 1.3
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
X-List-Received-Date: Thu, 23 Jul 2015 23:02:23 -0000

According to the Eclipse tcf team, 1.3 tcf is required for the newest
Eclipse release "mars".

[YOCTO #7886]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 616a6a7..f8fd390 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -5,11 +5,10 @@ BUGTRACKER = "https://bugs.eclipse.org/bugs/"
 LICENSE = "EPL-1.0 | EDL-1.0"
 LIC_FILES_CHKSUM = "file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
 
-SRCREV = "4ef94ecb927a8912c3d79ce137182247786cff8f"
-PV = "0.4.0+git${SRCPV}"
-PR = "r2"
+SRCREV = "b9a735e9c7cf82f80d412b7ab15d08b89d5a4ccc"
+PV = "1.3.0+git${SRCPV}"
 
-SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git \
+SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git;branch=1.3_mars_bugfix \
            file://fix_ranlib.patch \
            file://tcf-agent.init \
            file://tcf-agent.service \
@@ -18,7 +17,7 @@ SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git \
 DEPENDS = "util-linux openssl"
 RDEPENDS_${PN} = "bash"
 
-S = "${WORKDIR}/git"
+S = "${WORKDIR}/git/agent"
 
 inherit update-rc.d systemd
 
@@ -39,10 +38,6 @@ CFLAGS += "-DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
     -DSERVICE_StackTrace=0 -DSERVICE_Symbols=0 -DSERVICE_LineNumbers=0 \
     -DSERVICE_Expressions=0"
 
-do_compile() {
-	oe_runmake
-}
-
 do_install() {
 	oe_runmake install INSTALLROOT=${D}
 	install -d ${D}${sysconfdir}/init.d/
-- 
2.4.3


