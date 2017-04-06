Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3C74F72F50
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 06:41:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v366fe0V007032
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Apr 2017 23:41:40 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 5 Apr 2017 23:41:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Apr 2017 23:41:33 -0700
Message-ID: <c95b247813033fe4c45fa8603d8002ef1f2ef916.1491460816.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1491460816.git.liezhi.yang@windriver.com>
References: <cover.1491460816.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] runqemu: fix 2 typos
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
X-List-Received-Date: Thu, 06 Apr 2017 06:41:39 -0000
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


