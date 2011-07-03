Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QdMO9-0003G0-OY
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Jul 2011 15:07:05 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jul 2011 06:03:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,467,1304319600"; d="scan'208";a="25753194"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2011 06:03:17 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Jul 2011 21:03:13 +0800
Message-Id: <fd0cffc111da2fd8ac14c09471cca4252339434e.1309698011.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1309698011.git.ke.yu@intel.com>
References: <cover.1309698011.git.ke.yu@intel.com>
In-Reply-To: <cover.1309698011.git.ke.yu@intel.com>
References: <cover.1309698011.git.ke.yu@intel.com>
Subject: [PATCH 1/5] libidn: upgrade from 1.20 to 1.22
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Jul 2011 13:07:06 -0000

- update the license checksum due to some text indent change

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../libidn/{libidn_1.20.bb => libidn_1.22.bb}      |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/libidn/{libidn_1.20.bb => libidn_1.22.bb} (79%)

diff --git a/meta/recipes-extended/libidn/libidn_1.20.bb b/meta/recipes-extended/libidn/libidn_1.22.bb
similarity index 79%
rename from meta/recipes-extended/libidn/libidn_1.20.bb
rename to meta/recipes-extended/libidn/libidn_1.22.bb
index fa8953b..cf08eaf 100644
--- a/meta/recipes-extended/libidn/libidn_1.20.bb
+++ b/meta/recipes-extended/libidn/libidn_1.22.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.gnu.org/software/libidn/"
 SECTION = "libs"
 LICENSE = "LGPLv2.1+ & GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+                    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://lib/idna.h;endline=21;md5=dbd4426bbc38846d5a6b94c3570fd756 \
                     file://src/idn.c;endline=20;md5=e7bc77cab53f7367b7e381aaa546e76c"
 PR = "r0"
@@ -13,9 +13,6 @@ inherit pkgconfig autotools gettext
 
 SRC_URI = "${GNU_MIRROR}/libidn/${P}.tar.gz"
 
-SRC_URI[md5sum] = "03996d474a696e59fdddbee87fc9519c"
-SRC_URI[sha256sum] = "e1bff472e8dce11064508ef5acbd6ac72371d0028f15c65f4a91ed157bfca8b1"
-
 # command tool is under GPLv3+, while libidn itself is under LGPLv2.1+
 # so package command into a separate package
 PACKAGES =+ "idn"
-- 
1.7.0.4



