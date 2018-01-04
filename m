Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 281E56011B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 04:59:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jan 2018 20:59:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,505,1508828400"; d="scan'208";a="164047904"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga004.jf.intel.com with ESMTP; 03 Jan 2018 20:59:58 -0800
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu,  4 Jan 2018 12:54:08 +0800
Message-Id: <1515041649-67749-2-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515041649-67749-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1515041649-67749-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [pyro] [PATCH 1/2] liburi-perl: update SRC_URI to yoctoproject mirror
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
X-List-Received-Date: Thu, 04 Jan 2018 04:59:57 -0000

Upstream has removed the 1.71 release from www.cpan.org and
moved to the latest 1.72. Since we don't want to upgrade at
this point of time, temporarily move the SRC_URI to yoctoproject
source mirror.

[YOCTO #12454]

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 meta/recipes-devtools/perl/liburi-perl_1.71.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/liburi-perl_1.71.bb b/meta/recipes-devtools/perl/liburi-perl_1.71.bb
index a800198..432803c 100644
--- a/meta/recipes-devtools/perl/liburi-perl_1.71.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_1.71.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c453e94fae672800f83bc1bd7a38b53f"
 
 DEPENDS += "perl"
 
-SRC_URI = "http://www.cpan.org/authors/id/E/ET/ETHER/URI-${PV}.tar.gz"
+SRC_URI = "https://downloads.yoctoproject.org/mirror/sources/URI-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "247c3da29a794f72730e01aa5a715daf"
 SRC_URI[sha256sum] = "9c8eca0d7f39e74bbc14706293e653b699238eeb1a7690cc9c136fb8c2644115"
-- 
2.7.4


