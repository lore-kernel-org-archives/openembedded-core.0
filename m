Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QZ7bL-0004fd-5f
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 22:31:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 Jun 2011 13:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,402,1304319600"; d="scan'208";a="16391772"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 21 Jun 2011 13:27:33 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2011 13:27:25 -0700
Message-Id: <ff82238aa1e471b456b7a6d7cda5ec1abb11537e.1308687821.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <c3a70e785af909a60451135bf72663bed052ff7d.1308687821.git.nitin.a.kamble@intel.com>
References: <c3a70e785af909a60451135bf72663bed052ff7d.1308687821.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1308687821.git.nitin.a.kamble@intel.com>
References: <cover.1308687821.git.nitin.a.kamble@intel.com>
Subject: [btrfs patch 5/6] base-files: add btrfs to /etc/filesystems
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
X-List-Received-Date: Tue, 21 Jun 2011 20:31:11 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../recipes-core/base-files/base-files/filesystems |    1 +
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/filesystems b/meta/recipes-core/base-files/base-files/filesystems
index 653593a..2af6a7e 100644
--- a/meta/recipes-core/base-files/base-files/filesystems
+++ b/meta/recipes-core/base-files/base-files/filesystems
@@ -3,4 +3,5 @@ fat
 vfat
 ext2
 ext3
+btrfs
 *
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index e76fdf6..6091f1b 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -2,7 +2,7 @@ SUMMARY = "Miscellaneous files for the base system."
 DESCRIPTION = "The base-files package creates the basic system directory structure and provides a small set of key configuration files for the system."
 SECTION = "base"
 PRIORITY = "required"
-PR = "r68"
+PR = "r69"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://licenses/GPL-2;md5=94d55d512a9ba36caa9b7df079bae19f"
 SRC_URI = "file://rotation \
-- 
1.7.4.4



