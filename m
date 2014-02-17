Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 834476F06C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 08:23:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 17 Feb 2014 00:23:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,859,1384329600"; d="scan'208";a="476400718"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.197])
	by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2014 00:23:04 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 00:23:02 -0800
Message-Id: <0ac7622a72ca8536e4fe8ffd21487270840dd99d.1392625337.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1392625337.git.sgw@linux.intel.com>
References: <cover.1392625337.git.sgw@linux.intel.com>
In-Reply-To: <cover.1392625337.git.sgw@linux.intel.com>
References: <cover.1392625337.git.sgw@linux.intel.com>
Subject: [PATCH 7/7] nspr: Update to 4.10.3
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
 meta/recipes-support/nspr/{nspr_4.10.2.bb => nspr_4.10.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nspr/{nspr_4.10.2.bb => nspr_4.10.3.bb} (96%)

diff --git a/meta/recipes-support/nspr/nspr_4.10.2.bb b/meta/recipes-support/nspr/nspr_4.10.3.bb
similarity index 96%
rename from meta/recipes-support/nspr/nspr_4.10.2.bb
rename to meta/recipes-support/nspr/nspr_4.10.3.bb
index bb8912e..4792b65 100644
--- a/meta/recipes-support/nspr/nspr_4.10.2.bb
+++ b/meta/recipes-support/nspr/nspr_4.10.3.bb
@@ -13,8 +13,8 @@ SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-$
 
 SRC_URI += "file://nspr.pc.in"
 
-SRC_URI[md5sum] = "f0d254da0b2b870d9a5fa094e879d4b8"
-SRC_URI[sha256sum] = "4d09ee67a6fb57d3c646098b0ac7fd1e31be1c2c2ca57cd2ad28b42e6d3cf400"
+SRC_URI[md5sum] = "bf298e874cf454a3c2f8fe7e671c5d2e"
+SRC_URI[sha256sum] = "f25779b1a665dab0090b9c977dc6c29a63320f442956ed78629b66b405cb01e5"
 
 S = "${WORKDIR}/nspr-${PV}/nspr"
 
-- 
1.8.3.1


