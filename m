Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C308373169
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 13:02:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 04 Jul 2016 06:02:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,574,1459839600"; d="scan'208";a="988798570"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 04 Jul 2016 06:02:18 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 5246F6A4082
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 06:02:11 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2016 16:02:03 +0300
Message-Id: <1467637324-16642-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1467637324-16642-1-git-send-email-maxin.john@intel.com>
References: <1467637324-16642-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/4] libatomic-ops: upgrade to 7.4.4
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
X-List-Received-Date: Mon, 04 Jul 2016 13:02:40 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libatomic-ops/{libatomic-ops_7.4.2.bb => libatomic-ops_7.4.4.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.4.2.bb => libatomic-ops_7.4.4.bb} (85%)

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.4.2.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.4.4.bb
similarity index 85%
rename from meta/recipes-support/libatomic-ops/libatomic-ops_7.4.2.bb
rename to meta/recipes-support/libatomic-ops/libatomic-ops_7.4.4.bb
index fdb70d8..930c1b8 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.4.2.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.4.4.bb
@@ -12,8 +12,8 @@ SRC_URI = "\
 	file://0001-Add-initial-nios2-architecture-support.patch \
 	"
 
-SRC_URI[md5sum] = "1d6538604b314d2fccdf86915e5c0857"
-SRC_URI[sha256sum] = "04fa615f62992547bcbda562260e28b504bc4c06e2f985f267f3ade30304b5dd"
+SRC_URI[md5sum] = "426d804baae12c372967a6d183e25af2"
+SRC_URI[sha256sum] = "bf210a600dd1becbf7936dd2914cf5f5d3356046904848dcfd27d0c8b12b6f8f"
 
 S = "${WORKDIR}/libatomic_ops-${PV}"
 
-- 
2.4.0


