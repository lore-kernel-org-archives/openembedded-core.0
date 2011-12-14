Received: from e06smtp10.uk.ibm.com ([195.75.94.106])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ken.werner@linaro.org>) id 1Ray3N-00076p-34
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 00:16:01 +0100
Received: from /spool/local
	by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <openembedded-core@lists.openembedded.org> from
	<ken.werner@linaro.org>; Wed, 14 Dec 2011 22:58:49 -0000
Received: from d06nrmr1707.portsmouth.uk.ibm.com ([9.149.39.225])
	by e06smtp10.uk.ibm.com ([192.168.101.140]) with IBM ESMTP SMTP
	Gateway: Authorized Use Only! Violators will be prosecuted; 
	Wed, 14 Dec 2011 22:58:48 -0000
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com
	[9.149.37.213])
	by d06nrmr1707.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id pBEMwllr2605082
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2011 22:58:47 GMT
Received: from d06av03.portsmouth.uk.ibm.com (localhost.localdomain
	[127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id pBEMwlhD024441
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2011 15:58:47 -0700
Received: from bolide.boeblingen.de.ibm.com
	(dyn-9-152-224-84.boeblingen.de.ibm.com [9.152.224.84])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id pBEMwkDq024425; Wed, 14 Dec 2011 15:58:47 -0700
From: Ken Werner <ken.werner@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2011 23:58:31 +0100
Message-Id: <1323903512-7344-3-git-send-email-ken.werner@linaro.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1323903512-7344-1-git-send-email-ken.werner@linaro.org>
References: <1323903512-7344-1-git-send-email-ken.werner@linaro.org>
x-cbid: 11121422-4966-0000-0000-000000DEDEB7
Subject: [PATCH 2/3] Add EXTERNAL_TOOLCHAIN to CMAKE_FIND_ROOT_PATH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Dec 2011 23:16:01 -0000

This allows cmake to find the binaries of an external toolchain.

Signed-off-by: Ken Werner <ken.werner@linaro.org>
---
 meta/classes/cmake.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 432427e..8aec759 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -43,7 +43,7 @@ set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_CXX_FLAGS_RELEASE}" CACHE STRING "CXXFLA
 
 # only search in the paths provided so cmake doesnt pick
 # up libraries and tools from the native build machine
-set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} )
+set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
 set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
-- 
1.7.5.4



