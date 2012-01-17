Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4b3-0006gw-Qw
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:50 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:33:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96633037"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:33:07 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:27 -0800
Message-Id: <ab80cf8ae45a67843ecd59cfe50f2c487837f507.1326786990.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 42/62] task-base: move default definition of VIRTUAL-RUNTIME_apm
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
X-List-Received-Date: Tue, 17 Jan 2012 08:44:37 -0000

From: Joshua Lock <josh@linux.intel.com>

This belongs in default-providers.conf

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/conf/distro/include/default-providers.inc |    1 +
 meta/recipes-core/tasks/task-base.bb           |    3 ---
 2 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index afea5e7..2445049 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -15,6 +15,7 @@ PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"
 # Default virtual runtime providers
 #
 VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-cworth"
+VIRTUAL-RUNTIME_apm ?= "apm"
 
 #
 # Default recipe providers
diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/tasks/task-base.bb
index e0960b5..12e171a 100644
--- a/meta/recipes-core/tasks/task-base.bb
+++ b/meta/recipes-core/tasks/task-base.bb
@@ -162,9 +162,6 @@ RDEPENDS_task-base-acpi = "\
     acpid \
     libacpi "
 
-# Distro can override apm provider
-VIRTUAL-RUNTIME_apm ?= "apm"
-
 RDEPENDS_task-base-apm = "\
     ${VIRTUAL-RUNTIME_apm} \
     apmd"
-- 
1.7.6.5



