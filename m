Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 480C260EFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 13:16:08 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Aug 2014 06:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,863,1400050800"; d="scan'208";a="468690483"
Received: from atdias-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.159])
	by azsmga001.ch.intel.com with ESMTP; 14 Aug 2014 06:16:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Aug 2014 14:15:42 +0100
Message-Id: <ee097f6bf2c415ede7bb093f89f066e50b2a2762.1408022072.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1408022072.git.paul.eggleton@linux.intel.com>
References: <cover.1408022072.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1408022072.git.paul.eggleton@linux.intel.com>
References: <cover.1408022072.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] libav: update 9.x version to 9.16
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
X-List-Received-Date: Thu, 14 Aug 2014 13:16:11 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-multimedia/libav/{libav_9.13.bb => libav_9.16.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libav/{libav_9.13.bb => libav_9.16.bb} (74%)

diff --git a/meta/recipes-multimedia/libav/libav_9.13.bb b/meta/recipes-multimedia/libav/libav_9.16.bb
similarity index 74%
rename from meta/recipes-multimedia/libav/libav_9.13.bb
rename to meta/recipes-multimedia/libav/libav_9.16.bb
index 7bfbc48..d046885 100644
--- a/meta/recipes-multimedia/libav/libav_9.13.bb
+++ b/meta/recipes-multimedia/libav/libav_9.16.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "http://libav.org/releases/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "23b9e34bffdaee366710fdf20157a570"
-SRC_URI[sha256sum] = "2ff05df6cd2259b3bb277eb16c234214f8e0530700d0c774d033eba23edde6ca"
+SRC_URI[md5sum] = "7b44b75cec24b8e7545e5029e76917e0"
+SRC_URI[sha256sum] = "ca846473b0b8ed8e3404c52e5e92df6d35cb5fa487eec498525de3ffda4367a0"
 
 DEFAULT_PREFERENCE = "-1"
-- 
1.9.3


