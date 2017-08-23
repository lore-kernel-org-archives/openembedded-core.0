Return-Path: <peter.marko@siemens.com>
X-Greylist: delayed 1378 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 23 Aug 2017 12:39:43 UTC
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 73437781F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 12:39:42 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v7NCGjRH021623
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 14:16:46 +0200
Received: from dev.sbt.siemens.com ([163.242.44.100])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v7NCGjeO027880;
	Wed, 23 Aug 2017 14:16:45 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 6AC7ABA1A7B;
	Wed, 23 Aug 2017 14:16:45 +0200 (CEST)
From: "Marko, Peter" <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Aug 2017 14:16:29 +0200
Message-Id: <1503490589-19310-1-git-send-email-peter.marko@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] staging: add missing import errno to staging_populate_sysroot_dir
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
X-List-Received-Date: Wed, 23 Aug 2017 12:39:43 -0000

Fixes error "Exception: NameError: name 'errno' is not defined"
during build-sysroots.bb:do_build_target_sysroot

Signed-off-by: Marko, Peter <peter.marko@siemens.com>
---
 meta/classes/staging.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 162c8e9..9d3d2ad 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -177,6 +177,7 @@ def staging_processfixme(fixme, target, recipesysroot, recipesysrootnative, d):
 def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
     import glob
     import subprocess
+    import errno
 
     fixme = []
     postinsts = []
-- 
2.1.4


