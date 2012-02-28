Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1S2I9n-0004sq-1n
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 09:11:35 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Feb 2012 00:02:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="115563787"
Received: from yocto-build3.sh.intel.com ([10.239.48.15])
	by orsmga002.jf.intel.com with ESMTP; 28 Feb 2012 00:01:03 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 16:00:47 +0800
Message-Id: <41d276807b67807826163f305c95ab234977a0e4.1330415940.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1330415940.git.edwin.zhai@intel.com>
References: <cover.1330415940.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1330415940.git.edwin.zhai@intel.com>
References: <cover.1330415940.git.edwin.zhai@intel.com>
Subject: [PATCH 2/5] gnupg: Fix for multilib
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
X-List-Received-Date: Tue, 28 Feb 2012 08:11:35 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-support/gnupg/gnupg_2.0.18.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/gnupg/gnupg_2.0.18.bb b/meta/recipes-support/gnupg/gnupg_2.0.18.bb
index 6712269..abcb5fb 100644
--- a/meta/recipes-support/gnupg/gnupg_2.0.18.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.0.18.bb
@@ -8,7 +8,7 @@ DEPENDS = "pth libassuan libksba zlib bzip2 readline libgcrypt"
 
 inherit autotools gettext
 
-SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${PN}/${P}.tar.bz2"
+SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "2f37e0722666a0fedbe4d9f9227ac4d7"
 SRC_URI[sha256sum] = "48aedd762ca443fb952a9e859efe3c66706d7c2c9c77c32dbdbac4fe962dae5b"
-- 
1.7.1



