Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 6033B751D2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Oct 2018 14:05:39 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w99E5dVW006218
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Oct 2018 16:05:39 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.79.58])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w99E5dAd025138;
	Tue, 9 Oct 2018 16:05:39 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id A86F710037C0;
	Tue,  9 Oct 2018 16:05:38 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2018 16:05:34 +0200
Message-Id: <20181009140534.5221-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] cmake.bbclass: use CMAKE_SYSTEM_LIBRARY_PATH instead of CMAKE_LIBRARY_PATH
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
X-List-Received-Date: Tue, 09 Oct 2018 14:05:39 -0000

CMAKE_LIBRARY_PATH is intended to be set by projects.
CMAKE_SYSTEM_LIBRARY_PATH is better suited to be used in a toolchain
file.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/classes/cmake.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 251ddd9afe..6e2c34e4c6 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -111,7 +111,7 @@ set( CMAKE_INSTALL_RPATH ${OECMAKE_RPATH} )
 list(APPEND CMAKE_MODULE_PATH "${STAGING_DATADIR}/cmake/Modules/")
 
 # add for non /usr/lib libdir, e.g. /usr/lib64
-set( CMAKE_LIBRARY_PATH ${libdir} ${base_libdir})
+set( CMAKE_SYSTEM_LIBRARY_PATH ${libdir} ${base_libdir})
 
 EOF
 }
-- 
2.11.0


