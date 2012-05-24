Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SXfuN-0002x9-Ck
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 23:49:24 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 14:38:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148125504"
Received: from sgarman-ws.jf.intel.com ([10.7.199.160])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 14:38:48 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 14:38:16 -0700
Message-Id: <544fe63b6a861129ea15f4cd37952e513ab0013e.1337892418.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
Subject: [PATCH 05/32] bdwgc: Set ARM_INSTRUCTION_SET to "arm"
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
X-List-Received-Date: Thu, 24 May 2012 21:49:24 -0000

From: Ken Werner <ken.werner@linaro.org>

The bdwgc recipe uses a version of libatomic that fails when building in Thumb
mode. This has been fixed upstream already. The
pulseaudio/libatomics-ops_1.2.bb has the same issue and sets the
ARM_INSTRUCTION_SET to "arm" (probably until a new version gets pulled in).
This patch applies the same workaround to the bdwgc/bdwgc_20110107.bb recipe.

Signed-off-by: Ken Werner <ken.werner@linaro.org>
---
 meta/recipes-support/bdwgc/bdwgc_20110107.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/bdwgc/bdwgc_20110107.bb b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
index 327e59b..bc7b613 100644
--- a/meta/recipes-support/bdwgc/bdwgc_20110107.bb
+++ b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
@@ -33,5 +33,7 @@ PR = "r1"
 
 S = "${WORKDIR}/bdwgc"
 
+ARM_INSTRUCTION_SET = "arm"
+
 inherit autotools
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.9.5



