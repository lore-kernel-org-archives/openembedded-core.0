Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RO4Je-0001Y9-PG
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 10:19:31 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Nov 2011 01:13:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,483,1315206000"; d="scan'208";a="72177131"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by azsmga001.ch.intel.com with ESMTP; 09 Nov 2011 01:13:12 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 01:13:12 -0800
Message-Id: <1320829992-14284-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH] udev-extraconf: blacklist /dev/md
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
X-List-Received-Date: Wed, 09 Nov 2011 09:19:31 -0000

Do not mount /dev/md by default via udev, this resolved a problem
with the sanity test failing due to seeing the error while attempting
to mount /dev/md0

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/udev/files/mount.blacklist |    1 +
 meta/recipes-core/udev/udev-extraconf_0.0.bb |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/udev/files/mount.blacklist b/meta/recipes-core/udev/files/mount.blacklist
index d3ebb17..7c7d938 100644
--- a/meta/recipes-core/udev/files/mount.blacklist
+++ b/meta/recipes-core/udev/files/mount.blacklist
@@ -1,3 +1,4 @@
 /dev/loop
 /dev/ram
 /dev/mtdblock
+/dev/md
diff --git a/meta/recipes-core/udev/udev-extraconf_0.0.bb b/meta/recipes-core/udev/udev-extraconf_0.0.bb
index e17d944..d0d0e84 100644
--- a/meta/recipes-core/udev/udev-extraconf_0.0.bb
+++ b/meta/recipes-core/udev/udev-extraconf_0.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Extra machine specific configuration files for udev, specifically
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "file://mount.blacklist \
            file://COPYING.GPL"
-- 
1.7.6.4



