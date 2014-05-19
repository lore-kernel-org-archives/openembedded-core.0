Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (unknown [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A544266114
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 11:42:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 May 2014 04:37:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,866,1392192000"; d="scan'208";a="513973074"
Received: from akagikob-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.55])
	by orsmga001.jf.intel.com with ESMTP; 19 May 2014 04:42:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 May 2014 12:42:27 +0100
Message-Id: <a1754bb18af780f2e01cb5e30d11e70e48db9bc3.1400499708.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1400499708.git.paul.eggleton@linux.intel.com>
References: <cover.1400499708.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1400499708.git.paul.eggleton@linux.intel.com>
References: <cover.1400499708.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] libav: upgrade 9.x version to 9.13
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
X-List-Received-Date: Mon, 19 May 2014 11:42:35 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-multimedia/libav/{libav_9.10.bb => libav_9.13.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libav/{libav_9.10.bb => libav_9.13.bb} (74%)

diff --git a/meta/recipes-multimedia/libav/libav_9.10.bb b/meta/recipes-multimedia/libav/libav_9.13.bb
similarity index 74%
rename from meta/recipes-multimedia/libav/libav_9.10.bb
rename to meta/recipes-multimedia/libav/libav_9.13.bb
index 48bab7d..7bfbc48 100644
--- a/meta/recipes-multimedia/libav/libav_9.10.bb
+++ b/meta/recipes-multimedia/libav/libav_9.13.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "http://libav.org/releases/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "4b49d1d8734815ca095bb0600d41c5cb"
-SRC_URI[sha256sum] = "83dbe640779da1c1e8d8836c99575f57f749d18407494ebca451578afee9300d"
+SRC_URI[md5sum] = "23b9e34bffdaee366710fdf20157a570"
+SRC_URI[sha256sum] = "2ff05df6cd2259b3bb277eb16c234214f8e0530700d0c774d033eba23edde6ca"
 
 DEFAULT_PREFERENCE = "-1"
-- 
1.9.0


