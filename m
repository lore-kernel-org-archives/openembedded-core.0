Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 45D74771BF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Apr 2016 14:16:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3AEGoeB001233
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Apr 2016 07:16:50 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 10 Apr 2016 07:16:49 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 Apr 2016 07:16:48 -0700
Message-ID: <d5001db65b5acf7879105d5693c225ececec0b86.1460297783.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1460297783.git.liezhi.yang@windriver.com>
References: <cover.1460297783.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] runqemu: let ramfs equal to cpio.gz
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
X-List-Received-Date: Sun, 10 Apr 2016 14:16:49 -0000
Content-Type: text/plain

For example, support both:
$ runqemu qemux86-64 ramfs
$ runqemu qemux86-64 cpio.gz (new)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 49ccd18..d7fa941 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -40,7 +40,7 @@ Examples:
   $MYNAME qemux86-64 core-image-sato ext4
   $MYNAME qemux86-64 wic-image-minimal wic
   $MYNAME path/to/bzImage-qemux86.bin path/to/nfsrootdir/ serial
-  $MYNAME qemux86 iso/hddimg/vmdk/qcow2/vdi/ramfs...
+  $MYNAME qemux86 iso/hddimg/vmdk/qcow2/vdi/ramfs/cpio.gz...
   $MYNAME qemux86 qemuparams="-m 256"
   $MYNAME qemux86 bootparams="psplash=false"
   $MYNAME path/to/<image>-<machine>.vmdk
@@ -132,7 +132,7 @@ while true; do
             check_fstype_conflicts $arg
             IS_VM="true"
             ;;
-        "ramfs")
+        "ramfs" | "cpio.gz")
             FSTYPE=cpio.gz
             ;;
         "nographic")
-- 
2.8.0


