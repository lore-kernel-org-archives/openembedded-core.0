Return-Path: <peter.marko@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id B082677D74
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 06:10:40 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v7P6AeDV005809
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 25 Aug 2017 08:10:40 +0200
Received: from dev.sbt.siemens.com ([163.242.44.100])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v7P6AeEi012784;
	Fri, 25 Aug 2017 08:10:40 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 0BDC823DDC4;
	Fri, 25 Aug 2017 08:10:40 +0200 (CEST)
From: "Marko, Peter" <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 08:10:16 +0200
Message-Id: <1503641416-14607-1-git-send-email-peter.marko@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [pyro][PATCH] staging: add missing import errno to staging_populate_sysroot_dir
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
X-List-Received-Date: Fri, 25 Aug 2017 06:10:41 -0000

Fixes error "Exception: NameError: name 'errno' is not defined"
during build-sysroots.bb:do_build_target_sysroot

Signed-off-by: Marko, Peter <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index a0b74a2..67f7b3d 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -259,6 +259,7 @@ def staging_processfixme(fixme, target, recipesysroot, recipesysrootnative, d):
 def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
     import glob
     import subprocess
+    import errno
 
     fixme = []
     postinsts = []
-- 
2.1.4


