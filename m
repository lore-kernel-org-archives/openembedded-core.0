Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SC3qp-0003s4-MZ
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 08:56:23 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 Mar 2012 23:47:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="133089941"
Received: from unknown (HELO localhost.localdomain) ([10.255.15.253])
	by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2012 23:47:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Mar 2012 23:47:08 -0700
Message-Id: <9369f143d2f95db807f50b57e3d5e6af82b181aa.1332744104.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1332744104.git.sgw@linux.intel.com>
References: <cover.1332744104.git.sgw@linux.intel.com>
In-Reply-To: <cover.1332744104.git.sgw@linux.intel.com>
References: <cover.1332744104.git.sgw@linux.intel.com>
Subject: [Build App RFC 5/5] builder: Enable auto starting of Hob
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
X-List-Received-Date: Mon, 26 Mar 2012 06:56:24 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/builder/builder_0.1.bb       |    2 +-
 .../builder/files/builder_hob_start.sh             |   10 +++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index ceb9612..1324e5b 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "New user to do specific job"
 DESCRIPTION = "This recipe create a new user named ${PN}, who is used for specific jobs like building. The task can be auto started via mini X"
 SECTION = "x11"
-PR = "r0"
+PR = "r1"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://builder_hob_start.sh;endline=5;md5=84796c3c41785d86100fdabcbdade00e"
 
diff --git a/meta/recipes-graphics/builder/files/builder_hob_start.sh b/meta/recipes-graphics/builder/files/builder_hob_start.sh
index fdafc4e..f43e6c5 100644
--- a/meta/recipes-graphics/builder/files/builder_hob_start.sh
+++ b/meta/recipes-graphics/builder/files/builder_hob_start.sh
@@ -4,8 +4,12 @@
 #be put here
 
 # start hob here
-#cd /intel/poky/poky
-#. ./oe-init-build-env
-#../scripts/hob
+export PSEUDO_PREFIX=/usr
+export PSEUDO_LOCALSTATEDIR=/home/builder/pseudo
+export PSEUDO_LIBDIR=/usr/lib/pseudo/lib64
+
+cd /home/builder/poky
+. ./oe-init-build-env
+hob &
 
 matchbox-terminal&
-- 
1.7.7.6



