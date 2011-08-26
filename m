Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QwrFu-00012X-5m
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 09:55:11 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 26 Aug 2011 00:50:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,283,1312182000"; d="scan'208";a="11274508"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Aug 2011 00:50:19 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 15:52:23 +0800
Message-Id: <2ffe6e3f93c178838d4c0efabd720d2e51893665.1314344548.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1314344548.git.dongxiao.xu@intel.com>
References: <cover.1314344548.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1314344548.git.dongxiao.xu@intel.com>
References: <cover.1314344548.git.dongxiao.xu@intel.com>
Subject: [PATCH 4/5] multilib.bbclass: add "pkg_postinst" and "pkg_postrm" as renaming elements
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
X-List-Received-Date: Fri, 26 Aug 2011 07:55:12 -0000

Add "pkg_postinst" and "pkg_postrm" as renaming elements, which fixes
missing post install/rm scripts in target image.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/multilib.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 46c24e1..5976d5d 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -73,7 +73,7 @@ python __anonymous () {
     d.setVar("PACKAGES", " ".join([row[1] for row in pkgs_mapping]))
 
     for pkg_mapping in pkgs_mapping:
-        for subs in ["FILES", "RDEPENDS", "RRECOMMENDS", "SUMMARY", "DESCRIPTION", "RSUGGESTS", "RPROVIDES", "RCONFLICTS", "PKG", "ALLOW_EMPTY"]:
+        for subs in ["FILES", "RDEPENDS", "RRECOMMENDS", "SUMMARY", "DESCRIPTION", "RSUGGESTS", "RPROVIDES", "RCONFLICTS", "PKG", "ALLOW_EMPTY", "pkg_postinst", "pkg_postrm"]:
             d.renameVar("%s_%s" % (subs, pkg_mapping[0]), "%s_%s" % (subs, pkg_mapping[1]))
 
     map_dependencies("DEPENDS", d)
-- 
1.7.1



