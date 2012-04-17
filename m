Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SKGco-00025J-4T
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 00:11:50 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Apr 2012 15:02:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="154859731"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.25])
	by fmsmga002.fm.intel.com with ESMTP; 17 Apr 2012 15:02:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2012 15:02:12 -0700
Message-Id: <a511ea9fea4f9e151f1e704fa06d2106442c5818.1334700068.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334700068.git.sgw@linux.intel.com>
References: <cover.1334700068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334700068.git.sgw@linux.intel.com>
References: <cover.1334700068.git.sgw@linux.intel.com>
Subject: [PATCH 2/3] task-self-hosted: Add LSB for distro info
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
X-List-Received-Date: Tue, 17 Apr 2012 22:11:50 -0000

The lsb package is needed to enable the distro checking
in the self hosted image. Currently there is no standard
identification in the self-hosted image so use the existing
lsb package which provides lsb_release that parses the
/etc/release file

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/tasks/task-self-hosted.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/tasks/task-self-hosted.bb b/meta/recipes-core/tasks/task-self-hosted.bb
index 5588cd3..5d4e153 100644
--- a/meta/recipes-core/tasks/task-self-hosted.bb
+++ b/meta/recipes-core/tasks/task-self-hosted.bb
@@ -44,6 +44,7 @@ RDEPENDS_task-self-hosted-host-tools = "\
     kernel-module-iptable-nat \
     kernel-module-iptable-mangle \
     kernel-module-iptable-filter \
+    lsb \
     mc \
     parted \
     pseudo \
-- 
1.7.7.6



