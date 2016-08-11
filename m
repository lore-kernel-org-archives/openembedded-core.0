Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DFCD477257
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 13:55:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 11 Aug 2016 06:55:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,505,1464678000"; d="scan'208";a="863720837"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 11 Aug 2016 06:55:44 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 67A986A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 06:55:29 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 16:56:43 +0300
Message-Id: <1470923804-25804-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1470923804-25804-1-git-send-email-maxin.john@intel.com>
References: <1470923804-25804-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/3] iproute2: update 4.6.0 -> 4.7.0
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
X-List-Received-Date: Thu, 11 Aug 2016 13:55:57 -0000

4.6.0 -> 4.7.0

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../iproute2/{iproute2_4.6.0.bb => iproute2_4.7.0.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_4.6.0.bb => iproute2_4.7.0.bb} (71%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.6.0.bb b/meta/recipes-connectivity/iproute2/iproute2_4.7.0.bb
similarity index 71%
rename from meta/recipes-connectivity/iproute2/iproute2_4.6.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_4.7.0.bb
index 4971937..426f989 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.6.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.7.0.bb
@@ -5,8 +5,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-iproute2-de-bash-scripts.patch \
            file://iproute2-4.3.0-musl.patch \
           "
-SRC_URI[md5sum] = "d015e437e4f744d51d3a1a53341826d5"
-SRC_URI[sha256sum] = "74fc6a8ad085be095a159f8158bbaf385b42af9e101619f233f1ae466829d406"
+SRC_URI[md5sum] = "d4b205830cdc2702f8a0cbd6232129cd"
+SRC_URI[sha256sum] = "8f60dbcfb33a79daae0638f53bdcaa4310c0aa59ae39af8a234020dc69bb7b92"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.4.0


