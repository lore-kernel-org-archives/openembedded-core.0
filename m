Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3D521784D7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 04:59:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jan 2018 20:59:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,505,1508828400"; d="scan'208";a="164047905"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga004.jf.intel.com with ESMTP; 03 Jan 2018 20:59:59 -0800
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu,  4 Jan 2018 12:54:09 +0800
Message-Id: <1515041649-67749-3-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515041649-67749-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1515041649-67749-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [pyro] [PATCH 2/2] diffstat: use HTTP mirror for SRC_URI
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
X-List-Received-Date: Thu, 04 Jan 2018 04:59:58 -0000

From: Ross Burton <ross.burton@intel.com>

The Invisible Mirror FTP service is currently down, and FTP is horrible, so
switch to the HTTP mirror.

(cherry picked from commit f31461f8ea11e82dbe14454a1149d9ec2120404d)

[YOCTO #12455]

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 meta/recipes-devtools/diffstat/diffstat_1.61.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/diffstat/diffstat_1.61.bb b/meta/recipes-devtools/diffstat/diffstat_1.61.bb
index 0ec41c3..583b387 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.61.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.61.bb
@@ -7,7 +7,7 @@ SECTION = "devel"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://install-sh;endline=42;md5=b3549726c1022bee09c174c72a0ca4a5"
 
-SRC_URI = "ftp://invisible-island.net/diffstat/diffstat-${PV}.tgz \
+SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://run-ptest \
 "
 
-- 
2.7.4


