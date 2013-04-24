Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UV7ee-0007V9-Dd
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 23:55:09 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2013 14:37:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,546,1363158000"; d="scan'208";a="300916420"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.85])
	by orsmga001.jf.intel.com with ESMTP; 24 Apr 2013 14:37:15 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 14:36:59 -0700
Message-Id: <406086a6eee7955f1dad8505531fdcd02dbe847f.1366827512.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
Subject: [PATCH 06/18] resolvconf: Update to 1.71
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
X-List-Received-Date: Wed, 24 Apr 2013 21:55:22 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../resolvconf/{resolvconf_1.70.bb => resolvconf_1.71.bb}            | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.70.bb => resolvconf_1.71.bb} (87%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.70.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb
similarity index 87%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.70.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb
index d401114..d342a6e 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.70.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb
@@ -10,12 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
 RDEPENDS_${PN} = "bash"
-PR = "r0"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
 
-SRC_URI[md5sum] = "95e19745790fd1c9a102ddde3bfdb15c"
-SRC_URI[sha256sum] = "7bb1ccfb68d61a96b91d135c4048f464482b634b0fc4a4b9d9a0f56ced5b4bf6"
+SRC_URI[md5sum] = "f073ab06b11584c8af86e7f84a56680e"
+SRC_URI[sha256sum] = "f2ec30a0e89330c6cbc3117efd60639da8305782979844ee4a1906e4b0ca230c"
 
 inherit allarch
 
-- 
1.8.0.2



