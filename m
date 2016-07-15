Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 40108606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 13:22:30 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id u6FDMQN2023851
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 15:22:26 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.77.104])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id u6FDMQpl016583;
	Fri, 15 Jul 2016 15:22:26 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2016 15:22:21 +0200
Message-Id: <1468588941-2574-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [krogoth][PATCH] gcc, qemuppc: Explicitly disable forcing SPE flags for 4.9
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
X-List-Received-Date: Fri, 15 Jul 2016 13:22:31 -0000

This ports the missing changes from commit: 7a51776a830167e43cbd185505f62f328704e271
from 5.3 to 4.9 so that qemuppc can be compiled.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 ...Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-4.9/0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
index b98f8ff..77fa18a 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9/0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
@@ -37,6 +37,17 @@ index cb7a94e..d392c2b 100644
  	extra_options="${extra_options} rs6000/sysv4.opt"
  	tmake_file="rs6000/t-fprules rs6000/t-ppcos ${tmake_file} rs6000/t-ppccomm"
  	case ${target} in
+Index: gcc-4.9.3/gcc/config/rs6000/linuxspe.h
+===================================================================
+--- gcc-4.9.3.orig/gcc/config/rs6000/linuxspe.h
++++ gcc-4.9.3/gcc/config/rs6000/linuxspe.h
+@@ -27,6 +27,3 @@
+ #undef	TARGET_DEFAULT
+ #define TARGET_DEFAULT MASK_STRICT_ALIGN
+ #endif
+-
+-#undef  ASM_DEFAULT_SPEC
+-#define	ASM_DEFAULT_SPEC "-mppc -mspe -me500"
 -- 
 1.7.9.5
 
-- 
2.1.4


