Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9AB6A7756E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 10:13:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2GADXg6004005
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 03:13:33 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 03:13:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Mar 2017 03:13:25 -0700
Message-ID: <fd02cf93a32744016e10043eb3c4c4c649c24f3e.1489657029.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1489657029.git.liezhi.yang@windriver.com>
References: <cover.1489657029.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] runqemu: add -h and --help
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
X-List-Received-Date: Thu, 16 Mar 2017 10:13:32 -0000
Content-Type: text/plain

Fixed:
$ runqemu -h
runqemu - INFO - Assuming MACHINE = -h
runqemu - INFO - Running MACHINE=-h bitbake -e...
[snip]
Exception: FSTYPE is NULL!

[YOCTO #10941]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index add48e6..d43006f 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -80,7 +80,7 @@ of the following environment variables (in any order):
   biosfilename=<filename> - specify bios filename
   qemuparams=<xyz> - specify custom parameters to QEMU
   bootparams=<xyz> - specify custom kernel parameters during boot
-  help: print this text
+  help, -h, --help: print this text
 
 Examples:
   runqemu qemuarm
@@ -1158,7 +1158,8 @@ class BaseConfig(object):
             logger.warn("Couldn't run 'bitbake -e' to gather environment information:\n%s" % err.output.decode('utf-8'))
 
 def main():
-    if len(sys.argv) == 1 or "help" in sys.argv:
+    if len(sys.argv) == 1 or "help" in sys.argv or \
+            '-h' in sys.argv or '--help' in sys.argv:
         print_usage()
         return 0
     config = BaseConfig()
-- 
2.9.0


