Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Qe75X-00072u-Ud
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 16:59:00 +0200
Received: from localhost (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Tue, 5 Jul 2011
	16:55:10 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Jul 2011 16:55:04 +0200
Message-ID: <977364608aaefbf5b73bdd6ef5c7c8b59d2f52b7.1309877488.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1309877488.git.anders@chargestorm.se>
References: <cover.1309877488.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 1/1] module-base: remove KERNEL-SOURCE
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
X-List-Received-Date: Tue, 05 Jul 2011 14:59:00 -0000
Content-Type: text/plain

kernel-source do not exist in STAGING_KERNEL_DIR any longer.
Remove the exported KERNEL_SOURCE as the STAGING_KERNEL_DIR can
be used in module recipes directly.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/classes/module-base.bbclass |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index a7cf233..1a39cc1 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -6,7 +6,6 @@ export OS = "${TARGET_OS}"
 export CROSS_COMPILE = "${TARGET_PREFIX}"
 
 export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
-export KERNEL_SOURCE = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-source')}"
 KERNEL_OBJECT_SUFFIX = ".ko"
 KERNEL_CCSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ccsuffix')}"
 KERNEL_LDSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ldsuffix')}"
-- 
1.7.4.1



