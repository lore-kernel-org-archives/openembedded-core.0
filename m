Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B917B77CEC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 09:21:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3B9LZ3P028331
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 02:21:35 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Apr 2017 02:21:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Apr 2017 02:21:27 -0700
Message-ID: <659218ca617749253b8c52eba5589c0cc44b5701.1491902179.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1491902179.git.liezhi.yang@windriver.com>
References: <cover.1491902179.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] runqemu: run without arguments
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
X-List-Received-Date: Tue, 11 Apr 2017 09:21:36 -0000
Content-Type: text/plain

Since we can get MACHINE and others from env vars and "bitbake -e",
"runqemu" can work without any arguments.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 4594173db7..a4036ae091 100755
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


