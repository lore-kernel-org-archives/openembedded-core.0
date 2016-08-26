Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4558977028
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 14:30:38 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 07:30:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,581,1464678000"; 
   d="scan'208";a="1525572"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by orsmga004.jf.intel.com with ESMTP; 26 Aug 2016 07:30:38 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 17:28:29 +0300
Message-Id: <c6c5c3e159305b9d2f9458bff0f830b738555487.1472221205.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 14/28] orc: enable gtk-doc
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
X-List-Received-Date: Fri, 26 Aug 2016 14:30:38 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/orc/orc_0.4.25.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/orc/orc_0.4.25.bb b/meta/recipes-devtools/orc/orc_0.4.25.bb
index f3bde46..897493a 100644
--- a/meta/recipes-devtools/orc/orc_0.4.25.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.25.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
 SRC_URI[md5sum] = "8582a28b15f53110c88d8043d9f55bcf"
 SRC_URI[sha256sum] = "c1b1d54a58f26d483f0b3881538984789fe5d5460ab8fab74a1cacbd3d1c53d1"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gtk-doc
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.9.3


