Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A8E9877CF1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 09:47:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v379lHVd012307
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Apr 2017 02:47:18 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 7 Apr 2017 02:47:16 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Apr 2017 02:47:08 -0700
Message-ID: <7f93752b82e09b1e23f921a3a675b744af6531ce.1491557671.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1491557671.git.liezhi.yang@windriver.com>
References: <cover.1491557671.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/8] runqemu: fix 2 typos
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
X-List-Received-Date: Fri, 07 Apr 2017 09:47:17 -0000
Content-Type: text/plain

* "is it" -> "it is"
* Remove "<image>.qemuboot.conf =" in the error message which looked strange.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 23c9efbae2..251f5f7e94 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -421,7 +421,7 @@ class BaseConfig(object):
             elif arg.startswith('ovmf'):
                 self.ovmf_bios.append(arg)
             else:
-                # At last, assume is it the MACHINE
+                # At last, assume it is the MACHINE
                 if (not unknown_arg) or unknown_arg == arg:
                     unknown_arg = arg
                 else:
@@ -677,7 +677,7 @@ class BaseConfig(object):
             return
 
         if not os.path.exists(self.qemuboot):
-            raise Exception("Failed to find <image>.qemuboot.conf = %s (wrong image name or BSP does not support running under qemu?)." % self.qemuboot)
+            raise Exception("Failed to find %s (wrong image name or BSP does not support running under qemu?)." % self.qemuboot)
 
         logger.info('CONFFILE: %s' % self.qemuboot)
 
-- 
2.11.0.rc2.dirty


