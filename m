Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 3F29379A3F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 08:11:44 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w9A8BjW2013904
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 10:11:45 +0200
Received: from dev.vm6.ccp.siemens.com ([167.87.5.162])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w9A8BjMj024116;
	Wed, 10 Oct 2018 10:11:45 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id E6AB810037C0;
	Wed, 10 Oct 2018 10:11:44 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Oct 2018 10:10:32 +0200
Message-Id: <20181010081035.10735-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCHv3 1/4] cmake.bbclass: use CMAKE_SYSTEM_LIBRARY_PATH instead of CMAKE_LIBRARY_PATH
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
X-List-Received-Date: Wed, 10 Oct 2018 08:11:45 -0000

CMAKE_LIBRARY_PATH is intended to be set by projects.
CMAKE_SYSTEM_LIBRARY_PATH is better suited to be used in a toolchain
file.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/classes/cmake.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index fd40a9863e..86b1d0e9aa 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -106,7 +106,7 @@ set( CMAKE_INSTALL_RPATH ${OECMAKE_RPATH} )
 list(APPEND CMAKE_MODULE_PATH "${STAGING_DATADIR}/cmake/Modules/")
 
 # add for non /usr/lib libdir, e.g. /usr/lib64
-set( CMAKE_LIBRARY_PATH ${libdir} ${base_libdir})
+set( CMAKE_SYSTEM_LIBRARY_PATH ${libdir} ${base_libdir})
 
 EOF
 }
-- 
2.11.0


