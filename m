Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9174F77BDE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Aug 2017 18:07:14 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Aug 2017 11:07:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,398,1498546800"; d="scan'208";a="139546292"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga005.jf.intel.com with ESMTP; 19 Aug 2017 11:07:15 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Aug 2017 11:06:54 -0700
Message-Id: <1503166017-3945-3-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503166017-3945-1-git-send-email-juro.bystricky@intel.com>
References: <1503166017-3945-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH v4 2/5] cpio: provide cpio-replacement-native
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
X-List-Received-Date: Sat, 19 Aug 2017 18:07:14 -0000

By default, bitbake uses host cpio, which can be quite old
and missing crucial newever features.
This patch allows to use the cpio-native instead, which is the
latest upstream version. To use the cpio-native instead of the
cpio from host, you need to specify:

IMAGE_DEPENDS_cpio_append = " cpio-replacement-native"
EXTRANATIVEPATH += "cpio-native"

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-extended/cpio/cpio_v2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/cpio/cpio_v2.inc b/meta/recipes-extended/cpio/cpio_v2.inc
index 31adb71..b2a0d1b 100644
--- a/meta/recipes-extended/cpio/cpio_v2.inc
+++ b/meta/recipes-extended/cpio/cpio_v2.inc
@@ -6,6 +6,8 @@ SECTION = "base"
 
 DEPENDS = "texinfo-native"
 
+PROVIDES_append_class-native = " cpio-replacement-native"
+
 SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
     "
 
-- 
2.7.4


