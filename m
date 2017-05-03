Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5B0FD60721
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 20:52:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 May 2017 13:53:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,284,1491289200"; d="scan'208";a="1126169045"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga001.jf.intel.com with ESMTP; 03 May 2017 13:52:59 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 May 2017 13:52:56 -0700
Message-Id: <1493844777-25545-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH 1/2] cpio: provide cpio-replacement-native
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
X-List-Received-Date: Wed, 03 May 2017 20:52:59 -0000

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


