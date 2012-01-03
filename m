Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrI-0004Kv-27
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:28 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:20:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752197"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:29 -0800
Message-Id: <abde2a045a39a70a6247a7ae591a131120ab8ed3.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 043/113] udev: reorganize files of 164 version
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
X-List-Received-Date: Tue, 03 Jan 2012 06:29:37 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

We merged both files and udev-164 directory onto a single directory
and renamed udev-new.inc onto udev.inc as we have a single version of
udev now.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/udev/{udev-new.inc => udev.inc}  |    0
 .../udev/{files => udev}/devfs-udev.rules          |    0
 meta/recipes-core/udev/{udev-164 => udev}/init     |    0
 meta/recipes-core/udev/{files => udev}/links.conf  |    0
 .../udev/{udev-164 => udev}/local.rules            |    0
 meta/recipes-core/udev/{files => udev}/mount.sh    |    0
 meta/recipes-core/udev/{files => udev}/network.sh  |    0
 .../udev/{udev-164 => udev}/permissions.rules      |    0
 .../recipes-core/udev/{udev-164 => udev}/run.rules |    0
 .../udev/{files => udev}/udev-166-v4l1-1.patch     |    0
 meta/recipes-core/udev/{files => udev}/udev-cache  |    0
 .../udev/{udev-164 => udev}/udev.rules             |    0
 meta/recipes-core/udev/udev_164.bb                 |    2 +-
 13 files changed, 1 insertions(+), 1 deletions(-)
 rename meta/recipes-core/udev/{udev-new.inc => udev.inc} (100%)
 rename meta/recipes-core/udev/{files => udev}/devfs-udev.rules (100%)
 rename meta/recipes-core/udev/{udev-164 => udev}/init (100%)
 rename meta/recipes-core/udev/{files => udev}/links.conf (100%)
 rename meta/recipes-core/udev/{udev-164 => udev}/local.rules (100%)
 rename meta/recipes-core/udev/{files => udev}/mount.sh (100%)
 rename meta/recipes-core/udev/{files => udev}/network.sh (100%)
 rename meta/recipes-core/udev/{udev-164 => udev}/permissions.rules (100%)
 rename meta/recipes-core/udev/{udev-164 => udev}/run.rules (100%)
 rename meta/recipes-core/udev/{files => udev}/udev-166-v4l1-1.patch (100%)
 rename meta/recipes-core/udev/{files => udev}/udev-cache (100%)
 rename meta/recipes-core/udev/{udev-164 => udev}/udev.rules (100%)

diff --git a/meta/recipes-core/udev/udev-new.inc b/meta/recipes-core/udev/udev.inc
similarity index 100%
rename from meta/recipes-core/udev/udev-new.inc
rename to meta/recipes-core/udev/udev.inc
diff --git a/meta/recipes-core/udev/files/devfs-udev.rules b/meta/recipes-core/udev/udev/devfs-udev.rules
similarity index 100%
rename from meta/recipes-core/udev/files/devfs-udev.rules
rename to meta/recipes-core/udev/udev/devfs-udev.rules
diff --git a/meta/recipes-core/udev/udev-164/init b/meta/recipes-core/udev/udev/init
similarity index 100%
rename from meta/recipes-core/udev/udev-164/init
rename to meta/recipes-core/udev/udev/init
diff --git a/meta/recipes-core/udev/files/links.conf b/meta/recipes-core/udev/udev/links.conf
similarity index 100%
rename from meta/recipes-core/udev/files/links.conf
rename to meta/recipes-core/udev/udev/links.conf
diff --git a/meta/recipes-core/udev/udev-164/local.rules b/meta/recipes-core/udev/udev/local.rules
similarity index 100%
rename from meta/recipes-core/udev/udev-164/local.rules
rename to meta/recipes-core/udev/udev/local.rules
diff --git a/meta/recipes-core/udev/files/mount.sh b/meta/recipes-core/udev/udev/mount.sh
similarity index 100%
rename from meta/recipes-core/udev/files/mount.sh
rename to meta/recipes-core/udev/udev/mount.sh
diff --git a/meta/recipes-core/udev/files/network.sh b/meta/recipes-core/udev/udev/network.sh
similarity index 100%
rename from meta/recipes-core/udev/files/network.sh
rename to meta/recipes-core/udev/udev/network.sh
diff --git a/meta/recipes-core/udev/udev-164/permissions.rules b/meta/recipes-core/udev/udev/permissions.rules
similarity index 100%
rename from meta/recipes-core/udev/udev-164/permissions.rules
rename to meta/recipes-core/udev/udev/permissions.rules
diff --git a/meta/recipes-core/udev/udev-164/run.rules b/meta/recipes-core/udev/udev/run.rules
similarity index 100%
rename from meta/recipes-core/udev/udev-164/run.rules
rename to meta/recipes-core/udev/udev/run.rules
diff --git a/meta/recipes-core/udev/files/udev-166-v4l1-1.patch b/meta/recipes-core/udev/udev/udev-166-v4l1-1.patch
similarity index 100%
rename from meta/recipes-core/udev/files/udev-166-v4l1-1.patch
rename to meta/recipes-core/udev/udev/udev-166-v4l1-1.patch
diff --git a/meta/recipes-core/udev/files/udev-cache b/meta/recipes-core/udev/udev/udev-cache
similarity index 100%
rename from meta/recipes-core/udev/files/udev-cache
rename to meta/recipes-core/udev/udev/udev-cache
diff --git a/meta/recipes-core/udev/udev-164/udev.rules b/meta/recipes-core/udev/udev/udev.rules
similarity index 100%
rename from meta/recipes-core/udev/udev-164/udev.rules
rename to meta/recipes-core/udev/udev/udev.rules
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index d487add..3e4e402 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,4 +1,4 @@
-include udev-new.inc
+include udev.inc
 
 PR = "r7"
 
-- 
1.7.6.4



