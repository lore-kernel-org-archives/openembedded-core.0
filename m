Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefanx.stanacar@intel.com>) id 1Uaq7j-0007pT-4z
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 18:24:53 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 May 2013 09:04:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,648,1363158000"; d="scan'208";a="334932373"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 10 May 2013 09:06:17 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.149])
	by linux.intel.com (Postfix) with ESMTP id 1FCEA6A4083
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 09:06:06 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 19:06:24 +0300
Message-Id: <711805f70e82288783817bc515e9310ad128c11e.1368201796.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1368201796.git.stefanx.stanacar@intel.com>
References: <cover.1368201796.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1368201796.git.stefanx.stanacar@intel.com>
References: <cover.1368201796.git.stefanx.stanacar@intel.com>
Subject: [PATCH 1/3] scripts/runqemu: add ext4 to the list of extracted extensions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 May 2013 16:24:57 -0000

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 scripts/runqemu | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 8ed1226..9bd35de 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -384,7 +384,8 @@ if [ -e "$ROOTFS" -a -z "$FSTYPE" ]; then
     # Extract the filename extension
     EXT=`echo $ROOTFS | awk -F . '{ print \$NF }'`
     if [ "x$EXT" = "xext2" -o "x$EXT" = "xext3" -o \
-          "x$EXT" = "xjffs2" -o "x$EXT" = "xbtrfs" ]; then
+          "x$EXT" = "xjffs2" -o "x$EXT" = "xbtrfs" -o \
+          "x$EXT" = "xext4" ]; then
         FSTYPE=$EXT
     else
         echo "Note: Unable to determine filesystem extension for $ROOTFS"
-- 
1.8.1.4



