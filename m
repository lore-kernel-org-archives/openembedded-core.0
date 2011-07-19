Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QjCNl-0003fr-4T
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 17:38:49 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6JFYhMj027827
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 10:34:43 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 08:34:45 -0700
Message-Id: <053df0dc079b5d83dc8e0a62e4d6c0c845572254.1311089204.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311089204.git.tom_rini@mentor.com>
References: <cover.1311089204.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311089204.git.tom_rini@mentor.com>
References: <cover.1311089204.git.tom_rini@mentor.com>
Subject: [PATCH 4/4] btrfs-tools: Add util-linux to DEPENDS
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
X-List-Received-Date: Tue, 19 Jul 2011 15:38:49 -0000

This needs libuuid bits in order to build.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 .../btrfs-tools/btrfs-tools_git.bb                 |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
index a5c556d..9b5a17a 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
@@ -10,12 +10,13 @@ HOMEPAGE = "https://btrfs.wiki.kernel.org"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
 SECTION = "base"
+DEPENDS = "util-linux"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs-unstable.git;protocol=git;tag=1b444cd2e6ab8dcafdd47dbaeaae369dd1517c17;branch=master"
 
 S = "${WORKDIR}/git"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "file://upstream-tmp/0001-Btrfs-progs-add-a-btrfs-select-super-command-to-over.patch \
 	    file://upstream-tmp/0002-Btrfs-progs-use-safe-string-manipulation-functions.patch \
-- 
1.7.0.4



