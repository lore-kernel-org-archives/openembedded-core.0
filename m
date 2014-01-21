Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 851326DEDA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 20:41:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Jan 2014 12:37:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="470314950"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.29])
	by orsmga002.jf.intel.com with ESMTP; 21 Jan 2014 12:41:37 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2014 12:41:36 -0800
Message-Id: <1390336896-3652-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1390336896-3652-1-git-send-email-sgw@linux.intel.com>
References: <1390336896-3652-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2] libcgroup: Update to 0.41
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
X-List-Received-Date: Tue, 21 Jan 2014 20:41:36 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libcgroup/{libcgroup_0.38.bb => libcgroup_0.41.bb}            | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-core/libcgroup/{libcgroup_0.38.bb => libcgroup_0.41.bb} (88%)

diff --git a/meta/recipes-core/libcgroup/libcgroup_0.38.bb b/meta/recipes-core/libcgroup/libcgroup_0.41.bb
similarity index 88%
rename from meta/recipes-core/libcgroup/libcgroup_0.38.bb
rename to meta/recipes-core/libcgroup/libcgroup_0.41.bb
index 8bd0ead..5db1079 100644
--- a/meta/recipes-core/libcgroup/libcgroup_0.38.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_0.41.bb
@@ -6,16 +6,14 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-PR = "r1"
-
 inherit autotools pkgconfig
 
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/libcg/${BPN}/v.038/${BPN}-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/libcg/${BPN}/v0.41/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "f0f7d4060bf36ccc19d75dbf4f1695db"
-SRC_URI[sha256sum] = "5d36d1a48b95f62fe9fcdf74a5a4089512e5e43e6011aa1504fd6f2a0909867f"
+SRC_URI[md5sum] = "3dea9d50b8a5b73ff0bf1cdcb210f63f"
+SRC_URI[sha256sum] = "e4e38bdc7ef70645ce33740ddcca051248d56b53283c0dc6d404e17706f6fb51"
 
 EXTRA_OECONF = "${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam-module-dir=${base_libdir}/security --enable-pam=yes', '--enable-pam=no', d)}"
 
-- 
1.8.3.1


