Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UV7eX-0007V8-Ih
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 23:55:03 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2013 14:37:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,546,1363158000"; d="scan'208";a="300916388"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.85])
	by orsmga001.jf.intel.com with ESMTP; 24 Apr 2013 14:37:14 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 14:36:55 -0700
Message-Id: <ffbc7d02da2b70fc66739c50b01777524ab75577.1366827512.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
Subject: [PATCH 02/18] lsbinitscripts: Update to 9.46
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Apr 2013 21:55:07 -0000
X-List-Received-Date: Wed, 24 Apr 2013 21:55:07 -0000
X-List-Received-Date: Wed, 24 Apr 2013 21:55:07 -0000
X-List-Received-Date: Wed, 24 Apr 2013 21:55:07 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../lsb/{lsbinitscripts_9.45.bb => lsbinitscripts_9.46.bb}         | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.45.bb => lsbinitscripts_9.46.bb} (77%)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.45.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.46.bb
similarity index 77%
rename from meta/recipes-extended/lsb/lsbinitscripts_9.45.bb
rename to meta/recipes-extended/lsb/lsbinitscripts_9.46.bb
index 2cc5f16..50401bf 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.45.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.46.bb
@@ -2,17 +2,16 @@ DESCRIPTION = "SysV init scripts which only is used in an LSB image"
 SECTION = "base"
 LICENSE = "GPLv2"
 DEPENDS = "popt glib-2.0"
-PR = "r0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
 
 S="${WORKDIR}/initscripts-${PV}"
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}.tar.bz2/dd514ee65e4a4610be836bb34c62c0ed/initscripts-${PV}.tar.bz2 \
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-9.46.tar.bz2/f0755d9f1e0a8ae470c22798695c3b39/initscripts-9.46.tar.bz2 \
            file://functions.patch \
           " 
 
-SRC_URI[md5sum] = "dd514ee65e4a4610be836bb34c62c0ed"
-SRC_URI[sha256sum] = "dd8bfa09f41f56c223f90629f31fc16decc3b9df4c72b1e3ee00cfa3f7d9c48c"
+SRC_URI[md5sum] = "f0755d9f1e0a8ae470c22798695c3b39"
+SRC_URI[sha256sum] = "f1b9003826d6c524c6b144e554ec38e788531270b8df252218708da11c9e4973"
 
 inherit update-alternatives
 
-- 
1.8.0.2



