Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A1CBD61489
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 00:40:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 May 2013 17:40:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,717,1363158000"; d="scan'208";a="341405596"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.171])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2013 17:40:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 17:40:24 -0700
Message-Id: <5c625bd876b0d599495268c909f1b65a26b97297.1369183108.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1369183108.git.sgw@linux.intel.com>
References: <cover.1369183108.git.sgw@linux.intel.com>
In-Reply-To: <cover.1369183108.git.sgw@linux.intel.com>
References: <cover.1369183108.git.sgw@linux.intel.com>
Subject: [PATCH 6/7] resolvconf: Update to 1.72
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
X-List-Received-Date: Wed, 22 May 2013 00:40:38 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../resolvconf/{resolvconf_1.71.bb => resolvconf_1.72.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.71.bb => resolvconf_1.72.bb} (88%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb
similarity index 88%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb
index d342a6e..a96dbff 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.72.bb
@@ -13,8 +13,8 @@ RDEPENDS_${PN} = "bash"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
 
-SRC_URI[md5sum] = "f073ab06b11584c8af86e7f84a56680e"
-SRC_URI[sha256sum] = "f2ec30a0e89330c6cbc3117efd60639da8305782979844ee4a1906e4b0ca230c"
+SRC_URI[md5sum] = "6bf631213c97f89261d997c78f7b9506"
+SRC_URI[sha256sum] = "196e8b5ef0a0282bf99e156113b058e65dd7f889cf4aea16597cddeef7e7cd43"
 
 inherit allarch
 
-- 
1.8.1.4


