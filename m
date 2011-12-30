Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RgXrN-0006zj-L4
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 09:30:41 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Dec 2011 00:22:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="101588792"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2011 00:22:21 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Dec 2011 16:11:21 +0800
Message-Id: <0b9676edd92395a4160b9742ad5002316af8239d.1325232608.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1325232608.git.edwin.zhai@intel.com>
References: <cover.1325232608.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1325232608.git.edwin.zhai@intel.com>
References: <cover.1325232608.git.edwin.zhai@intel.com>
Subject: [PATCH 3/3] libassuan: Upgrade to 2.0.3
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
X-List-Received-Date: Fri, 30 Dec 2011 08:30:41 -0000

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
1.7.1



