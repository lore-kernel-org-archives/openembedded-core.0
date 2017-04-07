Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 680A377D90
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 09:47:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v379lK3T012310
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Apr 2017 02:47:20 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 7 Apr 2017 02:47:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Apr 2017 02:47:11 -0700
Message-ID: <08a486f967e61fbf6dcf176d2c44195e228b898a.1491557671.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1491557671.git.liezhi.yang@windriver.com>
References: <cover.1491557671.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] runqemu: run without arguments
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
X-List-Received-Date: Fri, 07 Apr 2017 09:47:19 -0000
Content-Type: text/plain

Since we can get MACHINE and others from env vars and "bitbake -e",
"runqemu" can work without any arguments.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 7e7a6b4915..f55494df12 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -83,6 +83,7 @@ of the following environment variables (in any order):
   help, -h, --help: print this text
 
 Examples:
+  runqemu
   runqemu qemuarm
   runqemu tmp/deploy/images/qemuarm
   runqemu tmp/deploy/images/qemux86/<qemuboot.conf>
@@ -1182,8 +1183,7 @@ class BaseConfig(object):
             logger.warn("Couldn't run 'bitbake -e' to gather environment information:\n%s" % err.output.decode('utf-8'))
 
 def main():
-    if len(sys.argv) == 1 or "help" in sys.argv or \
-            '-h' in sys.argv or '--help' in sys.argv:
+    if "help" in sys.argv or '-h' in sys.argv or '--help' in sys.argv:
         print_usage()
         return 0
     config = BaseConfig()
-- 
2.11.0.rc2.dirty


