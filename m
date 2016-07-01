Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0DF926067C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 15:35:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 01 Jul 2016 08:35:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,557,1459839600"; d="scan'208";a="1009015596"
Received: from jhibarra-mobl1.zpn.intel.com ([10.219.16.87])
	by orsmga002.jf.intel.com with ESMTP; 01 Jul 2016 08:35:35 -0700
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 10:37:24 -0500
Message-Id: <1467387444-4550-1-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.4.11
Subject: [PATCH] scripts: Fixed typo in parameter that was causing exception
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
X-List-Received-Date: Fri, 01 Jul 2016 15:35:49 -0000

There is a typo in the logging parameters, "filname" is being used instead of "filename" for yocto-kernel, yocto-layer and wic scripts. This didn't cause issues before since python 2 didn't validate unused parameters but with python >= 3.4.3 an exception is thrown. This patch fixes this parameter name.

[YOCTO #9834]
---
 scripts/wic          | 2 +-
 scripts/yocto-kernel | 2 +-
 scripts/yocto-layer  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/wic b/scripts/wic
index 9023755..fe2c33f 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -294,7 +294,7 @@ subcommands = {
 
 
 def start_logging(loglevel):
-    logging.basicConfig(filname='wic.log', filemode='w', level=loglevel)
+    logging.basicConfig(filename='wic.log', filemode='w', level=loglevel)
 
 
 def main(argv):
diff --git a/scripts/yocto-kernel b/scripts/yocto-kernel
index fd97cb7..5c70d0c 100755
--- a/scripts/yocto-kernel
+++ b/scripts/yocto-kernel
@@ -351,7 +351,7 @@ subcommands = {
 
 
 def start_logging(loglevel):
-    logging.basicConfig(filname = 'yocto-kernel.log', filemode = 'w', level=loglevel)
+    logging.basicConfig(filename = 'yocto-kernel.log', filemode = 'w', level=loglevel)
 
 
 def main():
diff --git a/scripts/yocto-layer b/scripts/yocto-layer
index a5267f2..d58faca 100755
--- a/scripts/yocto-layer
+++ b/scripts/yocto-layer
@@ -113,7 +113,7 @@ subcommands = {
 
 
 def start_logging(loglevel):
-    logging.basicConfig(filname = 'yocto-layer.log', filemode = 'w', level=loglevel)
+    logging.basicConfig(filename = 'yocto-layer.log', filemode = 'w', level=loglevel)
 
 
 def main():
-- 
2.4.11


