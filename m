Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 84CF5784B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 14:57:49 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 06:57:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; d="scan'208";a="173402166"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 14 Nov 2017 06:57:50 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 16:57:33 +0200
Message-Id: <20171114145754.9643-6-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/27] libcheck: fix upstream version check
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
X-List-Received-Date: Tue, 14 Nov 2017 14:57:49 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/libcheck/libcheck_0.12.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libcheck/libcheck_0.12.0.bb b/meta/recipes-support/libcheck/libcheck_0.12.0.bb
index e684958925f..e646d439681 100644
--- a/meta/recipes-support/libcheck/libcheck_0.12.0.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.12.0.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SRC_URI = "https://github.com/${BPN}/check/releases/download/${PV}/check-${PV}.tar.gz"
 SRC_URI[md5sum] = "31b17c6075820a434119592941186f70"
 SRC_URI[sha256sum] = "464201098bee00e90f5c4bdfa94a5d3ead8d641f9025b560a27755a83b824234"
+UPSTREAM_CHECK_URI = "https://github.com/libcheck/check/releases/"
 
 S = "${WORKDIR}/check-${PV}"
 
-- 
2.15.0


