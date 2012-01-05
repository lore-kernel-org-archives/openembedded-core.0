Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RijlC-0002Ob-Ac
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 10:37:22 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jan 2012 01:29:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108992546"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.94])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jan 2012 01:29:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 09:29:46 +0000
Message-Id: <b63fd2c71b9d5d3bcaa98fe08b2e65db8c2bf6d1.1325755613.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1325755613.git.paul.eggleton@linux.intel.com>
References: <cover.1325755613.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1325755613.git.paul.eggleton@linux.intel.com>
References: <cover.1325755613.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] classes/update-alternatives: fix typos and grammar
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
X-List-Received-Date: Thu, 05 Jan 2012 09:37:22 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/update-alternatives.bbclass |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index e5ba655..0e8e58b 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -3,7 +3,7 @@
 # command directly in your recipe, but in most cases this class simplifies
 # that job.
 #
-# There're two basic modes supported: 'single update' and 'batch update'
+# There are two basic modes supported: 'single update' and 'batch update'
 #
 # 'single update' is used for a single alternative command, and you're
 # expected to provide at least below keywords:
@@ -11,19 +11,19 @@
 #     ALTERNATIVE_NAME - the name that the alternative is registered
 #     ALTERNATIVE_PATH - the path of installed alternative
 #
-# ALTENATIVE_PRIORITY and ALTERNATIVE_LINK are optional which have defautls
+# ALTERNATIVE_PRIORITY and ALTERNATIVE_LINK are optional which have defaults
 # in this class.
 #
 # 'batch update' is used if you have multiple alternatives to be updated.
 # Unlike 'single update', 'batch update' in most times only require two
-# parameter:
+# parameters:
 #
-#     ALTERNATIVE_LINKS - a list of symbol links for which you'd like to
+#     ALTERNATIVE_LINKS - a list of symbolic links for which you'd like to
 #                         create alternatives, with space as delimiter, e.g:
 #
 #         ALTERNATIVE_LINKS = "${bindir}/cmd1 ${sbindir}/cmd2 ..."
 #
-#     ALTNERATIVE_PRIORITY - optional, applies to all
+#     ALTERNATIVE_PRIORITY - optional, applies to all
 #
 # To simplify the design, this class has the assumption that for a name
 # listed in ALTERNATIVE_LINKS, say /path/cmd:
@@ -49,7 +49,7 @@ update-alternatives --remove ${ALTERNATIVE_NAME} ${ALTERNATIVE_PATH}
 }
 
 # for batch alternatives, we use a simple approach to require only one parameter
-# with the rest info deduced implicitly
+# with the rest of the info deduced implicitly
 update_alternatives_batch_postinst() {
 for link in ${ALTERNATIVE_LINKS}
 do
-- 
1.7.5.4



