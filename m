Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RQl3R-0007yL-SH
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 20:21:54 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Nov 2011 11:14:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,522,1315206000"; d="scan'208";a="86068966"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 16 Nov 2011 11:14:53 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2011 11:14:37 -0800
Message-Id: <1711325b10dfd27394bb54f65a6a5cfc9a5f582c.1321470758.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <806c47069d2d344d0fe814b50b495f535de2e924.1321470758.git.nitin.a.kamble@intel.com>
References: <806c47069d2d344d0fe814b50b495f535de2e924.1321470758.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1321470758.git.nitin.a.kamble@intel.com>
References: <cover.1321470758.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/8] mpfr: upgrade from 3.0.1 to 3.1.0
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
X-List-Received-Date: Wed, 16 Nov 2011 19:21:54 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../mpfr/{mpfr_3.0.1.bb => mpfr_3.1.0.bb}          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/mpfr/{mpfr_3.0.1.bb => mpfr_3.1.0.bb} (70%)

diff --git a/meta/recipes-support/mpfr/mpfr_3.0.1.bb b/meta/recipes-support/mpfr/mpfr_3.1.0.bb
similarity index 70%
rename from meta/recipes-support/mpfr/mpfr_3.0.1.bb
rename to meta/recipes-support/mpfr/mpfr_3.1.0.bb
index 9079e4b..8e67fc2 100644
--- a/meta/recipes-support/mpfr/mpfr_3.0.1.bb
+++ b/meta/recipes-support/mpfr/mpfr_3.1.0.bb
@@ -7,8 +7,8 @@ PR = "r0"
 
 SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "bfbecb2eacb6d48432ead5cfc3f7390a"
-SRC_URI[sha256sum] = "e1977099bb494319c0f0c1f85759050c418a56884e9c6cef1c540b9b13e38e7f"
+SRC_URI[md5sum] = "238ae4a15cc3a5049b723daef5d17938"
+SRC_URI[sha256sum] = "74a7bbbad168dd1cc414f1c9210b8fc16ccfc8e422d34b3371a8978e31eab680"
 S = "${WORKDIR}/mpfr-${PV}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.6.4



