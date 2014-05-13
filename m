Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 87E1D605B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 11:02:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 May 2014 04:02:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1043,1389772800"; d="scan'208";a="531050149"
Received: from hpatters-mobl.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.37])
	by fmsmga001.fm.intel.com with ESMTP; 13 May 2014 04:02:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 May 2014 12:01:04 +0100
Message-Id: <7fdfedcf914c6946e08a3f7eb3da6dcd6fc65653.1399978792.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1399978792.git.paul.eggleton@linux.intel.com>
References: <cover.1399978792.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1399978792.git.paul.eggleton@linux.intel.com>
References: <cover.1399978792.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/6] libsdl2: upgrade to 2.0.3
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
X-List-Received-Date: Tue, 13 May 2014 11:02:47 -0000

License checksum changed only because copyright year changed; the actual
license text remains the same.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-graphics/libsdl2/{libsdl2_2.0.1.bb => libsdl2_2.0.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.1.bb => libsdl2_2.0.3.bb} (91%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.1.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
similarity index 91%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.0.1.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
index fa19566..38304a9 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.1.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "http://bugzilla.libsdl.org/"
 SECTION = "libs"
 
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=0605ca7e995ab1217e0bb988731a87fe"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=67dcb7fae16952557bc5f96e9eb5d188"
 
 PROVIDES = "virtual/libsdl2"
 
@@ -23,8 +23,8 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[md5sum] = "0eb97039488bf463e775295f7b18b227"
-SRC_URI[sha256sum] = "0ae7e902a26777614a011fe7053ca7e8b14843db3c42ca117564d208cf6732f0"
+SRC_URI[md5sum] = "fe6c61d2e9df9ef570e7e80c6e822537"
+SRC_URI[sha256sum] = "a5a69a6abf80bcce713fa873607735fe712f44276a7f048d60a61bb2f6b3c90c"
 
 inherit autotools lib_package binconfig pkgconfig
 
-- 
1.9.0


