Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2933874CA1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 12:38:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2018 05:38:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,362,1520924400"; d="scan'208";a="39254273"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 04 May 2018 05:38:42 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 15:32:35 +0300
Message-Id: <20180504123244.43049-5-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/14] pcmanfm: update to 1.3.0
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
X-List-Received-Date: Fri, 04 May 2018 12:38:42 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-sato/pcmanfm/{pcmanfm_1.2.5.bb => pcmanfm_1.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/pcmanfm/{pcmanfm_1.2.5.bb => pcmanfm_1.3.0.bb} (90%)

diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.0.bb
similarity index 90%
rename from meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb
rename to meta/recipes-sato/pcmanfm/pcmanfm_1.3.0.bb
index 4127a070460..356da02d235 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.5.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.3.0.bb
@@ -16,8 +16,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.xz \
 	   file://emblem-symbolic-link.png \
 	   file://no-desktop.patch"
 
-SRC_URI[md5sum] = "b4d1f8ce08d87e4f27805a246fc51ac2"
-SRC_URI[sha256sum] = "0c86cac028b705ff314c7464d814c2cf7ff604c17491c20aa204b1ef1a80ad67"
+SRC_URI[md5sum] = "827838f7f6b17dc97e1690c07da8fdb3"
+SRC_URI[sha256sum] = "5a693e9bf3f3294f0ee7264c1c1a600a88ee27d1572e7dd5c4b0e84aa7778ffb"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/pcmanfm/files/PCManFM%20%2B%20Libfm%20%28tarball%20release%29/PCManFM/"
 
-- 
2.16.1


