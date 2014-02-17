Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 453116E92E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 08:23:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 17 Feb 2014 00:23:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,859,1384329600"; d="scan'208";a="476400716"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.197])
	by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2014 00:23:04 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 00:23:01 -0800
Message-Id: <9d555c0495f871638446eaf57eff80bb3f42d02e.1392625337.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1392625337.git.sgw@linux.intel.com>
References: <cover.1392625337.git.sgw@linux.intel.com>
In-Reply-To: <cover.1392625337.git.sgw@linux.intel.com>
References: <cover.1392625337.git.sgw@linux.intel.com>
Subject: [PATCH 6/7] libcheck: Update to 0.9.12
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
X-List-Received-Date: Mon, 17 Feb 2014 08:23:03 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libcheck/{libcheck_0.9.11.bb => libcheck_0.9.12.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcheck/{libcheck_0.9.11.bb => libcheck_0.9.12.bb} (79%)

diff --git a/meta/recipes-support/libcheck/libcheck_0.9.11.bb b/meta/recipes-support/libcheck/libcheck_0.9.12.bb
similarity index 79%
rename from meta/recipes-support/libcheck/libcheck_0.9.11.bb
rename to meta/recipes-support/libcheck/libcheck_0.9.12.bb
index 7fc352c..12ef1d4 100644
--- a/meta/recipes-support/libcheck/libcheck_0.9.11.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.9.12.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SRC_URI = "${SOURCEFORGE_MIRROR}/check/check-${PV}.tar.gz \
           "
 
-SRC_URI[md5sum] = "fd5a03979bcab9fb80ba005b55f54178"
-SRC_URI[sha256sum] = "ea4e8c7ffb00bb4ffb3f59f11744a71f1cc4212c79f3083c7d9a4b0953976936"
+SRC_URI[md5sum] = "46fe540d1a03714c7a1967dbc6d484e7"
+SRC_URI[sha256sum] = "c7d47e55e133a0ca19a52e08a99333ac55cb22618b53719b7f4117a1875b1ea3"
 
 S = "${WORKDIR}/check-${PV}"
 
-- 
1.8.3.1


