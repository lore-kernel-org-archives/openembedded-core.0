Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Pxrzi-0006ty-5l
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Mar 2011 03:22:22 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Mar 2011 18:20:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,300,1297065600"; d="scan'208";a="666140296"
Received: from unknown (HELO localhost) ([10.255.17.57])
	by fmsmga002.fm.intel.com with ESMTP; 10 Mar 2011 18:20:43 -0800
Message-Id: <7977bfd5b70973eefdba38ae9dd44373aa0d8b94.1299809859.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299809859.git.sgw@linux.intel.com>
References: <cover.1299809859.git.sgw@linux.intel.com>
Old-Date: Sat, 5 Mar 2011 19:28:23 -0800
Date: Thu, 10 Mar 2011 18:20:42 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 08/12] task-poky-ssh.bb: new task for ssh services
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
X-List-Received-Date: Fri, 11 Mar 2011 02:22:22 -0000

From: Scott Garman <scott.a.garman@intel.com>

This task can then be used in image recipes to include a
configurable ssh server. Currently dropbear and openssh
are supported.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-core/tasks/task-poky-ssh.bb |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/tasks/task-poky-ssh.bb

diff --git a/meta/recipes-core/tasks/task-poky-ssh.bb b/meta/recipes-core/tasks/task-poky-ssh.bb
new file mode 100644
index 0000000..37a0241
--- /dev/null
+++ b/meta/recipes-core/tasks/task-poky-ssh.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "SSH tasks for Poky"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${POKYBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${POKYBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+PACKAGES = "\
+    task-poky-ssh-server \
+    task-poky-ssh-server-dbg \
+    task-poky-ssh-server-dev \
+    "
+
+ALLOW_EMPTY = "1"
+
+# Default to dropbear for historical reasons
+IMAGE_SSH_PROVIDER ?= "dropbear"
+
+RDEPENDS_task-poky-ssh-server = "${IMAGE_SSH_PROVIDER}" 
+
+RDEPENDS_task-poky-ssh-server-dbg = "${IMAGE_SSH_PROVIDER}-dbg"
+
+RDEPENDS_task-poky-ssh-server-dev = "${IMAGE_SSH_PROVIDER}-dev"
-- 
1.7.1.1



