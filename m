Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D016C60EFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 13:16:08 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Aug 2014 06:16:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,863,1400050800"; d="scan'208";a="468690471"
Received: from atdias-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.159])
	by azsmga001.ch.intel.com with ESMTP; 14 Aug 2014 06:16:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Aug 2014 14:15:41 +0100
Message-Id: <ddfe8924fd80c4a1ed93aae70f037f78ffb476fc.1408022072.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1408022072.git.paul.eggleton@linux.intel.com>
References: <cover.1408022072.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1408022072.git.paul.eggleton@linux.intel.com>
References: <cover.1408022072.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] libav: update 0.8 version to 0.8.15
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
X-List-Received-Date: Thu, 14 Aug 2014 13:16:09 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-multimedia/libav/{libav_0.8.11.bb => libav_0.8.15.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libav/{libav_0.8.11.bb => libav_0.8.15.bb} (79%)

diff --git a/meta/recipes-multimedia/libav/libav_0.8.11.bb b/meta/recipes-multimedia/libav/libav_0.8.15.bb
similarity index 79%
rename from meta/recipes-multimedia/libav/libav_0.8.11.bb
rename to meta/recipes-multimedia/libav/libav_0.8.15.bb
index 662d205..18dc49a 100644
--- a/meta/recipes-multimedia/libav/libav_0.8.11.bb
+++ b/meta/recipes-multimedia/libav/libav_0.8.15.bb
@@ -3,8 +3,8 @@ require libav.inc
 SRC_URI = "http://libav.org/releases/${BP}.tar.xz \
            file://0001-configure-enable-pic-for-AArch64.patch"
 
-SRC_URI[md5sum] = "cdc9b53c56a375baf73ea38cf7ade4f9"
-SRC_URI[sha256sum] = "5934e4f0dbf6e0fc4987de86cdd079f1d11a1410ae275e9f46472af17f05155a"
+SRC_URI[md5sum] = "e483ea8f482b5ecd65ee1d09251b0a5b"
+SRC_URI[sha256sum] = "495789ec547e93632937f0f36b06f4dd3180bc61518181f124af6746c6218710"
 
 LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-- 
1.9.3


