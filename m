Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (unknown [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C455B66114
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 11:42:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 May 2014 04:37:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,866,1392192000"; d="scan'208";a="513973068"
Received: from akagikob-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.55])
	by orsmga001.jf.intel.com with ESMTP; 19 May 2014 04:42:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 May 2014 12:42:26 +0100
Message-Id: <6a2b47e4757ec16ec4f6f7c201a99eddc5ab9c7f.1400499708.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1400499708.git.paul.eggleton@linux.intel.com>
References: <cover.1400499708.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1400499708.git.paul.eggleton@linux.intel.com>
References: <cover.1400499708.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] libav: upgrade 0.8.x version to 0.8.11
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
X-List-Received-Date: Mon, 19 May 2014 11:42:34 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-multimedia/libav/{libav_0.8.9.bb => libav_0.8.11.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libav/{libav_0.8.9.bb => libav_0.8.11.bb} (79%)

diff --git a/meta/recipes-multimedia/libav/libav_0.8.9.bb b/meta/recipes-multimedia/libav/libav_0.8.11.bb
similarity index 79%
rename from meta/recipes-multimedia/libav/libav_0.8.9.bb
rename to meta/recipes-multimedia/libav/libav_0.8.11.bb
index 7c807e8..662d205 100644
--- a/meta/recipes-multimedia/libav/libav_0.8.9.bb
+++ b/meta/recipes-multimedia/libav/libav_0.8.11.bb
@@ -3,8 +3,8 @@ require libav.inc
 SRC_URI = "http://libav.org/releases/${BP}.tar.xz \
            file://0001-configure-enable-pic-for-AArch64.patch"
 
-SRC_URI[md5sum] = "7c0e5743cd5c4d4b1bcafd02a2e82e09"
-SRC_URI[sha256sum] = "4f5181164e4007d5b0013bb3cc5e3b7393ab71ac286319c714b7697e2784f77f"
+SRC_URI[md5sum] = "cdc9b53c56a375baf73ea38cf7ade4f9"
+SRC_URI[sha256sum] = "5934e4f0dbf6e0fc4987de86cdd079f1d11a1410ae275e9f46472af17f05155a"
 
 LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-- 
1.9.0


