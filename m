Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QoivY-0002E7-PY
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 23:24:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Aug 2011 14:20:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; d="scan'208";a="34056917"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 03 Aug 2011 14:19:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 14:19:26 -0700
Message-Id: <80e5b9a044b8901f9c77aa1c6231f2eba6d1ced4.1312394851.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312394851.git.sgw@linux.intel.com>
References: <cover.1312394851.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312394851.git.sgw@linux.intel.com>
References: <cover.1312394851.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/33] libassuan: Upgrade to 2.0.2
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
X-List-Received-Date: Wed, 03 Aug 2011 21:24:33 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../{libassuan_2.0.1.bb => libassuan_2.0.2.bb}     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libassuan/{libassuan_2.0.1.bb => libassuan_2.0.2.bb} (82%)

diff --git a/meta/recipes-support/libassuan/libassuan_2.0.1.bb b/meta/recipes-support/libassuan/libassuan_2.0.2.bb
similarity index 82%
rename from meta/recipes-support/libassuan/libassuan_2.0.1.bb
rename to meta/recipes-support/libassuan/libassuan_2.0.2.bb
index 5425673..53c1230 100644
--- a/meta/recipes-support/libassuan/libassuan_2.0.1.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.0.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "libgpg-error"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libassuan/libassuan-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "53a7d4c22af909d7236d17d454ef935b"
-SRC_URI[sha256sum] = "1117be532ac41b13790b4756df7fa747d3d04264f7b4544aa9d7ff468a24b457"
+SRC_URI[md5sum] = "3e7d00fd2ee8a0b9c51ac7616ef3f1ec"
+SRC_URI[sha256sum] = "61e0cba33dcbade2dce953b95f06b843af2a73de875303f2585227ecd475b4d8"
 
 inherit autotools binconfig
-- 
1.7.3.4



