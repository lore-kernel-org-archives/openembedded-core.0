Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrR-0004tp-Tl
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:38 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:21:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752309"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:17 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:28 -0800
Message-Id: <6ce2c77923379bde6ca2d2b0cb7e5a2ab6ab158e.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 102/113] libassuan: Upgrade to 2.0.3
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:38 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../{libassuan_2.0.2.bb => libassuan_2.0.3.bb}     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libassuan/{libassuan_2.0.2.bb => libassuan_2.0.3.bb} (82%)

diff --git a/meta/recipes-support/libassuan/libassuan_2.0.2.bb b/meta/recipes-support/libassuan/libassuan_2.0.3.bb
similarity index 82%
rename from meta/recipes-support/libassuan/libassuan_2.0.2.bb
rename to meta/recipes-support/libassuan/libassuan_2.0.3.bb
index 53c1230..2a8963e 100644
--- a/meta/recipes-support/libassuan/libassuan_2.0.2.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.0.3.bb
@@ -12,7 +12,7 @@ DEPENDS = "libgpg-error"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libassuan/libassuan-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "3e7d00fd2ee8a0b9c51ac7616ef3f1ec"
-SRC_URI[sha256sum] = "61e0cba33dcbade2dce953b95f06b843af2a73de875303f2585227ecd475b4d8"
+SRC_URI[md5sum] = "179d1918325fdb928c7bd90b8a514fc7"
+SRC_URI[sha256sum] = "bad5682374c76bcc0abb1a7a34c9557af6874a477500748e64a7d3def79cac1b"
 
 inherit autotools binconfig
-- 
1.7.6.4



