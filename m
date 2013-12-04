Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7867A6D761
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 22:10:23 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id a15so648959eae.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 14:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Lfp4hnUUruDZ7D1qv02Xwxr5vrHDLt9jD8u9+CnypPY=;
	b=JQyGZ10zE7mB3WhYjn3ZqI/mnq5/Q1/ywY/d3wC2K/l+sphbtUvQ8P0h4WZ77kvUvD
	tF1R57iNW0+5llMf05MqIkyoeF9vksFRpeAmVl4dmwGG9OJxlHY1CIBhDOaWopPzRh3R
	gndvrR3lzGTX2Xk+14xpMlusbUnQhrHrUq+PQYESwgDkV/10e2GsN226HqaRs+8mBWLb
	qXk1iPtAQPrX3dZsCHNIh9f4aW5Bm1iMipCoCuJK5iwDDGWXOtO2dultJ2S3Ej47srDs
	hQHb/YN9lW4AUfuiyqtGeWSTjavLnFWA3q5ceiIR/d3y8bpAVYBIQ6L79MXmEQa9sP1f
	uS4Q==
X-Received: by 10.15.73.134 with SMTP id h6mr9376683eey.90.1386195022670;
	Wed, 04 Dec 2013 14:10:22 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 4sm86684463eed.14.2013.12.04.14.10.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 14:10:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 23:10:30 +0100
Message-Id: <1386195032-18264-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [PATCH 1/3] icecc.bbclass: Fix whitespace, improve comment
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
X-List-Received-Date: Wed, 04 Dec 2013 22:10:24 -0000

* Add leading space in big documentation block at the top
* Drop trailing spaces in code
* Update documentation to mention 'bb.utils.which' instead of 'which'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/icecc.bbclass | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 931623c..5af764d 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -8,21 +8,22 @@
 # For the cross compiler, creates a tar.gz of our toolchain and sets
 # ICECC_VERSION accordingly.
 #
-#The class now handles all 3 different compile 'stages' (i.e native ,cross-kernel and target) creating the
-#necessary environment tar.gz file to be used by the remote machines.
-#It also supports meta-toolchain generation
+# The class now handles all 3 different compile 'stages' (i.e native ,cross-kernel and target) creating the
+# necessary environment tar.gz file to be used by the remote machines.
+# It also supports meta-toolchain generation
 #
-#If ICECC_PATH is not set in local.conf then the class will try to locate it using 'which'
-#but nothing is sure ;)
+# If ICECC_PATH is not set in local.conf then the class will try to locate it using 'bb.utils.which'
+# but nothing is sure ;)
 #
-#If ICECC_ENV_EXEC is set in local.conf should point to the icecc-create-env script provided by the user
-#or the default one provided by icecc-create-env.bb  will be used
-#(NOTE that this is a modified version of the script need it and *not the one that comes with icecc*
+# If ICECC_ENV_EXEC is set in local.conf, then it should point to the icecc-create-env script provided by the user
+# or the default one provided by icecc-create-env.bb will be used
+# (NOTE that this is a modified version of the script need it and *not the one that comes with icecc*
+#
+# User can specify if specific packages or packages belonging to class should not use icecc to distribute
+# compile jobs to remote machines, but handled locally, by defining ICECC_USER_CLASS_BL and ICECC_USER_PACKAGE_BL
+# with the appropriate values in local.conf. In addition the user can force to enable icecc for packages
+# which set an empty PARALLEL_MAKE variable by defining ICECC_USER_PACKAGE_WL.
 #
-#User can specify if specific packages or packages belonging to class should not use icecc to distribute
-#compile jobs to remote machines, but handled locally, by defining ICECC_USER_CLASS_BL and ICECC_USER_PACKAGE_BL
-#with the appropriate values in local.conf. In addition the user can force to enable icecc for packages
-#which set an empty PARALLEL_MAKE variable by defining ICECC_USER_PACKAGE_WL.
 #########################################################################################
 #Error checking is kept to minimum so double check any parameters you pass to the class
 ###########################################################################################
@@ -96,7 +97,7 @@ def use_icc(bb,d):
 
     package_tmp = d.expand('${PN}')
 
-    system_class_blacklist = [ "none" ] 
+    system_class_blacklist = [ "none" ]
     user_class_blacklist = (d.getVar('ICECC_USER_CLASS_BL') or "none").split()
     package_class_blacklist = system_class_blacklist + user_class_blacklist
 
@@ -174,7 +175,7 @@ def icc_path(bb,d):
 
     else:
         prefix = d.expand('${HOST_PREFIX}')
-        return create_path( [prefix+"gcc", prefix+"g++"], bb, d)      
+        return create_path( [prefix+"gcc", prefix+"g++"], bb, d)
 
 def icc_get_external_tool(bb, d, tool):
     external_toolchain_bindir = d.expand('${EXTERNAL_TOOLCHAIN}${bindir_cross}')
-- 
1.8.4.3


