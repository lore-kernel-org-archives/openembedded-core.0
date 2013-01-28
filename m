Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tzl44-0003nW-DY
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 10:32:01 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Jan 2013 01:16:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,550,1355126400"; d="scan'208";a="195769977"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.19])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Jan 2013 01:16:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 01:15:48 -0800
Message-Id: <54f691914c45c5f855b29bb6221c0cf143891ed8.1359364462.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
Subject: [PATCH 01/13] libnl: Update to 3.2.21
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 09:32:04 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/libnl/{libnl_3.2.18.bb => libnl_3.2.21.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libnl/{libnl_3.2.18.bb => libnl_3.2.21.bb} (90%)

diff --git a/meta/recipes-support/libnl/libnl_3.2.18.bb b/meta/recipes-support/libnl/libnl_3.2.21.bb
similarity index 90%
rename from meta/recipes-support/libnl/libnl_3.2.18.bb
rename to meta/recipes-support/libnl/libnl_3.2.21.bb
index 0da7f20..1e97603 100644
--- a/meta/recipes-support/libnl/libnl_3.2.18.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.21.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
            file://fix-pktloc_syntax_h-race.patch \
            file://fix-pc-file.patch "
 
-SRC_URI[md5sum] = "378eafcca1f51d1c7498d78946cd891a"
-SRC_URI[sha256sum] = "6563e4e72a35f9f96380086f6bd17307552977af98e98bd3dd0fdde8013d53a9"
+SRC_URI[md5sum] = "6fe7136558a9071e70673dcda38545b3"
+SRC_URI[sha256sum] = "2dc80f043116ec8610d9d418f5f5e9283f3d9a3a48b8d51a8cb0146b3f279604"
 
 inherit autotools pkgconfig
 
-- 
1.8.0.2



