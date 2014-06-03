Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7AE596FAB5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 03:26:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Jun 2014 20:21:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,962,1392192000"; d="scan'208";a="521786739"
Received: from kmaligas-mobl1.gar.corp.intel.com (HELO swold-linux.bigsur.com)
	([10.255.12.167])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2014 20:26:15 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jun 2014 20:26:11 -0700
Message-Id: <8b37215e726e4adf16e8e4fae1e8998f326c77f3.1401765630.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1401765630.git.sgw@linux.intel.com>
References: <cover.1401765630.git.sgw@linux.intel.com>
In-Reply-To: <cover.1401765630.git.sgw@linux.intel.com>
References: <cover.1401765630.git.sgw@linux.intel.com>
Subject: [PATCH 6/7] resolvconf: Update to 1.75
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
X-List-Received-Date: Tue, 03 Jun 2014 03:26:35 -0000

Archive compression changed to xz

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../resolvconf/{resolvconf_1.74.bb => resolvconf_1.75.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.74.bb => resolvconf_1.75.bb} (92%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.74.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.75.bb
similarity index 92%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.74.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.75.bb
index 68bd515..7310c83 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.74.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.75.bb
@@ -11,10 +11,10 @@ AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
 RDEPENDS_${PN} = "bash"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
+SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.xz"
 
-SRC_URI[md5sum] = "2f190d3bb8960b69157f63590c262e93"
-SRC_URI[sha256sum] = "2e72e6884e9105cbf57101ab0f11e768717b6f76b7f5100c6a2a0cc69bb3d4a0"
+SRC_URI[md5sum] = "4b8bc86a3cf070e3fd0e9aff7eaaba56"
+SRC_URI[sha256sum] = "16167f37a77ef4bc4596dcbefece269b6a10d10fa448594ec55ed3303193086e"
 
 inherit allarch
 
-- 
1.8.3.1


