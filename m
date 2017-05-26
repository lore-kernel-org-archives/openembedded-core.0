Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3CD5678281
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 08:03:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 01:03:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,396,1491289200"; d="scan'208";a="1153066602"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2017 01:03:09 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 26 May 2017 16:03:26 +0800
Message-Id: <1495785806-63833-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [krogoth] [PATCH] cryptodev-linux: update SRC_URI
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
X-List-Received-Date: Fri, 26 May 2017 08:03:10 -0000

Gna! project announced that the download site from gna.org HTTP server
will soon be closing down. We have verified that the site is no longer
accessible without network proxy cache. We need to update SRC_URI to
point to new alternative (nwl.cc HTTP server) in order to avoid fetcher
issues in future.

[YOCTO #11575]

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 meta/recipes-kernel/cryptodev/cryptodev.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index ade7ef9..c0ff4a1 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://cryptodev-linux.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "http://download.gna.org/cryptodev-linux/cryptodev-linux-${PV}.tar.gz"
+SRC_URI = "http://nwl.cc/pub/cryptodev-linux/cryptodev-linux-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "02644cc4cd02301e0b503a332eb2f0b5"
 SRC_URI[sha256sum] = "67fabde9fb67b286a96c4f45b594b0eccd0f761b495705c18f2ae9461b831376"
-- 
2.7.4


