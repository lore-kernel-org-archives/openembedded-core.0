Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 54271731A1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 06:53:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2E6r3N2001577
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 23:53:03 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 13 Mar 2016 23:53:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 13 Mar 2016 23:52:56 -0700
Message-ID: <bff16f18d3b5a1ceff9dc12316a65e53bc10a408.1457938286.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1457938286.git.liezhi.yang@windriver.com>
References: <cover.1457938286.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] runqemu: add support for qcow2 and vdi
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
X-List-Received-Date: Mon, 14 Mar 2016 06:53:03 -0000
Content-Type: text/plain

[YOCTO #9168]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 058ee29..d95711b 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -40,8 +40,7 @@ Examples:
   $MYNAME qemux86-64 core-image-sato ext4
   $MYNAME qemux86-64 wic-image-minimal wic
   $MYNAME path/to/bzImage-qemux86.bin path/to/nfsrootdir/ serial
-  $MYNAME qemux86 ramfs
-  $MYNAME qemux86 iso
+  $MYNAME qemux86 iso/hddimg/vmdk/qcow2/vdi/ramfs...
   $MYNAME qemux86 qemuparams="-m 256"
   $MYNAME qemux86 bootparams="psplash=false"
   $MYNAME path/to/<image>-<machine>.vmdk
@@ -97,7 +96,7 @@ process_filename() {
 		    error "conflicting FSTYPE types [$FSTYPE] and [$EXT]"
 		fi
 		;;
-	/hddimg/|/hdddirect/|/vmdk/|/wic/)
+	/hddimg/|/hdddirect/|/vmdk/|/wic/|/qcow2/|/vdi/)
 		FSTYPE=$EXT
 		VM=$filename
 		ROOTFS=$filename
@@ -129,7 +128,7 @@ while true; do
         "ext"[234] | "jffs2" | "nfs" | "btrfs")
             check_fstype_conflicts $arg
             ;;
-        "hddimg" | "hdddirect" | "wic" | "vmdk")
+        "hddimg" | "hdddirect" | "wic" | "vmdk" | "qcow2" | "vdi")
             check_fstype_conflicts $arg
             IS_VM="true"
             ;;
-- 
1.7.9.5


