Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R5bdl-0007go-Jj
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 13:03:57 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Sep 2011 03:58:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="50049721"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.110])
	by orsmga002.jf.intel.com with ESMTP; 19 Sep 2011 03:58:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2011 11:58:34 +0100
Message-Id: <8024295fe908b81f64d24e44adb9603ecf1878ea.1316429640.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1316429640.git.paul.eggleton@linux.intel.com>
References: <cover.1316429640.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1316429640.git.paul.eggleton@linux.intel.com>
References: <cover.1316429640.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] libgcrypt: add libcap to DEPENDS
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
X-List-Received-Date: Mon, 19 Sep 2011 11:03:57 -0000

We explicitly enable capabilities, so libcap is required. (This fixes a
race condition when libcap happens to be building at the same time as
libgcrypt.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-support/libgcrypt/libgcrypt.inc      |    2 +-
 meta/recipes-support/libgcrypt/libgcrypt_1.4.6.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 128aed3..989d556 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff"
 
-DEPENDS = "libgpg-error"
+DEPENDS = "libgpg-error libcap"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${PV}.tar.gz \
            file://add-pkgconfig-support.patch"
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.4.6.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.4.6.bb
index 22eefd4..aef616c 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.4.6.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.4.6.bb
@@ -1,6 +1,6 @@
 require libgcrypt.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "bfd45922eefb8a24d598af77366220d4"
 SRC_URI[sha256sum] = "996d2874643318c9df835777034a8b7a923d3cd0bee593bab1780305f9de872d"
-- 
1.7.4.1



