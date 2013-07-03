Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F33166AFD4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 22:26:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Jul 2013 15:26:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,991,1363158000"; d="scan'208";a="340154945"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.183])
	by orsmga001.jf.intel.com with ESMTP; 03 Jul 2013 15:26:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2013 15:26:29 -0700
Message-Id: <ed593cb9b242356b10ebd4ced3b1d9b8f5f37134.1372890071.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1372890071.git.sgw@linux.intel.com>
References: <cover.1372890071.git.sgw@linux.intel.com>
In-Reply-To: <cover.1372890071.git.sgw@linux.intel.com>
References: <cover.1372890071.git.sgw@linux.intel.com>
Subject: [PATCH 8/8] resolvconf: Update to 1.72
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
X-List-Received-Date: Wed, 03 Jul 2013 22:26:31 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../resolvconf/{resolvconf_1.72.bb => resolvconf_1.73.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.72.bb => resolvconf_1.73.bb} (92%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.73.bb
similarity index 92%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.73.bb
index 4fe70f5..ea5b6dd 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.73.bb
@@ -13,8 +13,8 @@ RDEPENDS_${PN} = "bash"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
 
-SRC_URI[md5sum] = "6bf631213c97f89261d997c78f7b9506"
-SRC_URI[sha256sum] = "196e8b5ef0a0282bf99e156113b058e65dd7f889cf4aea16597cddeef7e7cd43"
+SRC_URI[md5sum] = "1216bf45be4695e13d95ef5b63b76faa"
+SRC_URI[sha256sum] = "1147412c93e1ae9dc2bec43d3763ffada21dc00c1c7051b06543bd5d65629d09"
 
 inherit allarch
 
-- 
1.8.1.4


