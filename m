Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH78-0005g9-Bn
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:20 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Apr 2012 09:45:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167912"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:45:22 -0700
Message-Id: <94309a319aaf91b1a3a29025c50076bd35b22f47.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 31/43] bdwgc: Set ARM_INSTRUCTION_SET to "arm"
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:20 -0000

From: Ken Werner <ken.werner@linaro.org>

The bdwgc recipe uses a version of libatomic that fails when building in Thumb
mode. This has been fixed upstream already. The
pulseaudio/libatomics-ops_1.2.bb has the same issue and sets the
ARM_INSTRUCTION_SET to "arm" (probably until a new version gets pulled in).
This patch applies the same workaround to the bdwgc/bdwgc_20110107.bb recipe.

Signed-off-by: Ken Werner <ken.werner@linaro.org>
---
 meta/recipes-support/bdwgc/bdwgc_20110107.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
1.7.7.6



