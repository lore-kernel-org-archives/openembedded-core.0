Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CA61777230
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 10:42:32 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jan 2017 02:42:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,278,1477983600"; d="scan'208";a="812640038"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jan 2017 02:42:32 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 733F66A4082;
	Tue, 24 Jan 2017 02:41:35 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: Openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 12:42:20 +0200
Message-Id: <a6417d61f5d3ad3b75dc06acc05b51222f79126e.1485249527.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485249527.git.jussi.kukkonen@intel.com>
References: <cover.1485249527.git.jussi.kukkonen@intel.com>
Subject: [PATCH 7/9] libxpm: Upgrade 3.5.11 -> 3.5.12
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
X-List-Received-Date: Tue, 24 Jan 2017 10:42:33 -0000

Tiny bug fix release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-lib/{libxpm_3.5.11.bb => libxpm_3.5.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.11.bb => libxpm_3.5.12.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.11.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.12.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.11.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.12.bb
index 545874c..13a1b91 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.11.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.12.bb
@@ -21,7 +21,7 @@ PACKAGES =+ "sxpm cxpm"
 FILES_cxpm = "${bindir}/cxpm"
 FILES_sxpm = "${bindir}/sxpm"
 
-SRC_URI[md5sum] = "769ee12a43611cdebd38094eaf83f3f0"
-SRC_URI[sha256sum] = "c5bdafa51d1ae30086fac01ab83be8d47fe117b238d3437f8e965434090e041c"
+SRC_URI[md5sum] = "20f4627672edb2bd06a749f11aa97302"
+SRC_URI[sha256sum] = "fd6a6de3da48de8d1bb738ab6be4ad67f7cb0986c39bd3f7d51dd24f7854bdec"
 
 BBCLASSEXTEND = "native"
-- 
2.1.4


