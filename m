Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrP5K-0004Vi-IS
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 09:54:14 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Jul 2012 00:42:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169736775"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by azsmga001.ch.intel.com with ESMTP; 18 Jul 2012 00:42:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 00:42:31 -0700
Message-Id: <c7beda1b779ce189c614fcce13e9ccf2c1b4ca6c.1342597081.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
References: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342597081.git.sgw@linux.intel.com>
References: <cover.1342597081.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/18] task-core-tools-testapps.bb: kexec-tools does not work on e5500-64b parts
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
X-List-Received-Date: Wed, 18 Jul 2012 07:54:14 -0000

From: Matthew McClintock <msm@freescale.com>

This prevents kexec from building for this part since it does not work

Signed-off-by: Matthew McClintock <msm@freescale.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-core/tasks/task-core-tools-testapps.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-tools-testapps.bb b/meta/recipes-core/tasks/task-core-tools-testapps.bb
index b5847f8..bdd0d05 100644
--- a/meta/recipes-core/tasks/task-core-tools-testapps.bb
+++ b/meta/recipes-core/tasks/task-core-tools-testapps.bb
@@ -22,6 +22,7 @@ KEXECTOOLS ?= "kexec"
 KEXECTOOLS_mips ?= ""
 KEXECTOOLS_mipsel ?= ""
 KEXECTOOLS_powerpc ?= ""
+KEXECTOOLS_e5500-64b ?= ""
 
 RDEPENDS_${PN} = "\
     blktool \
-- 
1.7.7.6



