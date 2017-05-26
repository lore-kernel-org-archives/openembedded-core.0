Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 829B378164
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 07:03:43 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 26 May 2017 00:03:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,395,1491289200"; d="scan'208";a="973278466"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by orsmga003.jf.intel.com with ESMTP; 26 May 2017 00:03:40 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 26 May 2017 15:04:00 +0800
Message-Id: <1495782240-159458-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [master] [PATCH] cryptodev-linux: update SRC_URI
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
X-List-Received-Date: Fri, 26 May 2017 07:03:44 -0000

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
index 24b3227..4ae0a2b 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://cryptodev-linux.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "http://download.gna.org/cryptodev-linux/cryptodev-linux-${PV}.tar.gz \
+SRC_URI = "http://nwl.cc/pub/cryptodev-linux/cryptodev-linux-${PV}.tar.gz \
            file://06d6b560c6e45dc317dae47c74706fa43f4a31d8.patch \
            file://cb186f682679383e8b5806240927903730ce85d9.patch \
            file://0001-Adjust-to-another-change-in-the-user-page-API.patch \
-- 
2.7.4


