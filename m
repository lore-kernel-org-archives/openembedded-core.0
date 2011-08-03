Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qojje-0004YH-D1
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 00:16:18 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Aug 2011 15:11:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; 
   d="scan'208";a="3912935"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Aug 2011 15:11:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 15:10:57 -0700
Message-Id: <3693c3128046c2a8dd6d20db39a851e9d42065b3.1312407628.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL v2 13/33] libassuan: Upgrade to 2.0.2
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
X-List-Received-Date: Wed, 03 Aug 2011 22:16:19 -0000

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



