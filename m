Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 085C46F18B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 07:21:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2014 23:21:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,545,1389772800"; d="scan'208";a="462421855"
Received: from unknown (HELO localhost.localdomain) ([10.255.12.165])
	by orsmga001.jf.intel.com with ESMTP; 25 Feb 2014 23:21:08 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2014 09:21:04 +0200
Message-Id: <1393399264-22367-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] initrdscripts: Add rootimage option
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Feb 2014 07:21:12 -0000

This allows for setting the ROOT_IMAGE name on the kernel command line

[YOCTO #5387]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 7e27f91..9e53a25 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -49,6 +49,8 @@ read_args() {
         case $arg in
             root=*)
                 ROOT_DEVICE=$optarg ;;
+            rootimage=*)
+                ROOT_IMAGE=$optarg ;;
             rootfstype=*)
                 modprobe $optarg 2> /dev/null ;;
             LABEL=*)
@@ -133,7 +135,7 @@ do
            mount | grep media
            echo "Available block devices"
            ls /dev/sd*
-           fatal "Cannot find rootfs.img file in /media/* , dropping to a shell "
+           fatal "Cannot find $ROOT_IMAGE file in /media/* , dropping to a shell "
       fi
       C=$(( C + 1 ))
   fi
-- 
1.8.3.1


