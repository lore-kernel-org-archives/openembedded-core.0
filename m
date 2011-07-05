Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Qe3HH-00061H-IB
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 12:54:51 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jul 2011 03:51:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,478,1304319600"; d="scan'208";a="23932890"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jul 2011 03:51:01 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 18:51:31 +0800
Message-Id: <1970842424c414db50058ff99c6627e3ca034a04.1309862610.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <8afebe13f6e5c1ba3354907892f2808277a96e6e.1309862610.git.lianhao.lu@intel.com>
References: <8afebe13f6e5c1ba3354907892f2808277a96e6e.1309862610.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1309862610.git.lianhao.lu@intel.com>
References: <cover.1309862610.git.lianhao.lu@intel.com>
Subject: [MULTILIB_SUBTASK4 2/5] classes/multilib.bbclass: Change the SHLIBSDIR.
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
X-List-Received-Date: Tue, 05 Jul 2011 10:54:51 -0000

Changes the SHLIBSDIR for the multilib version, so it won't mix up with
the normal version.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/multilib.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 36c52ef..17edc37 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -30,6 +30,7 @@ python multilib_virtclass_handler () {
             e.data.setVar("BASE_PACKAGE_ARCH", "${TARGET_ARCH}")
 
     bb.data.setVar("PN", variant + "-" + bb.data.getVar("PN", e.data, False), e.data)
+    bb.data.setVar("SHLIBSDIR_virtclass-multilib-" + variant ,bb.data.getVar("SHLIBSDIR",e.data,False) + "/" + variant, e.data)
     bb.data.setVar("OVERRIDES", bb.data.getVar("OVERRIDES", e.data, False) + override, e.data)
 }
 
-- 
1.7.0.4



