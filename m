Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3738765D27
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 11:27:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 05 Jan 2015 03:23:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="646388896"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2015 03:27:50 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Jan 2015 11:27:43 +0000
Message-Id: <81d8e8bc94752d68f1f5a3804768e558c7bbbef3.1420457243.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420457243.git.paul.eggleton@linux.intel.com>
References: <cover.1420457243.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420457243.git.paul.eggleton@linux.intel.com>
References: <cover.1420457243.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] libevdev: upgrade to 1.3
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
X-List-Received-Date: Mon, 05 Jan 2015 11:27:50 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-support/libevdev/{libevdev_1.2.2.bb => libevdev_1.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libevdev/{libevdev_1.2.2.bb => libevdev_1.3.bb} (74%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.2.2.bb b/meta/recipes-support/libevdev/libevdev_1.3.bb
similarity index 74%
rename from meta/recipes-support/libevdev/libevdev_1.2.2.bb
rename to meta/recipes-support/libevdev/libevdev_1.3.bb
index db4ffc6..7206b30 100644
--- a/meta/recipes-support/libevdev/libevdev_1.2.2.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
                     file://libevdev/libevdev.h;endline=21;md5=7ff4f0b5113252c2f1a828e0bbad98d1"
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
-SRC_URI[md5sum] = "7c1ee9c2069489b2a25dfde6f8e2ff6a"
-SRC_URI[sha256sum] = "860e9a1d5594393ff1f711cdeaf048efe354992019068408abbcfa4914ad6709"
+SRC_URI[md5sum] = "ab67de8f949e84ae2abb48af09eda423"
+SRC_URI[sha256sum] = "265411ce79a592b3074e9d07fb97d462745d0c7ef178254a6f720245ed253446"
 
 inherit autotools pkgconfig
-- 
1.9.3


