Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1S2I9p-0004sr-1b
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 09:11:37 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Feb 2012 00:02:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="115563793"
Received: from yocto-build3.sh.intel.com ([10.239.48.15])
	by orsmga002.jf.intel.com with ESMTP; 28 Feb 2012 00:01:03 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 16:00:48 +0800
Message-Id: <caa2cfb3151d6d36dd631ba854decf8e4cec7605.1330415940.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1330415940.git.edwin.zhai@intel.com>
References: <cover.1330415940.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1330415940.git.edwin.zhai@intel.com>
References: <cover.1330415940.git.edwin.zhai@intel.com>
Subject: [PATCH 3/5] libskba: Fix for multilib
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
X-List-Received-Date: Tue, 28 Feb 2012 08:11:37 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-support/libksba/libksba_1.2.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/libksba/libksba_1.2.0.bb b/meta/recipes-support/libksba/libksba_1.2.0.bb
index 6489cc5..1d8d287 100644
--- a/meta/recipes-support/libksba/libksba_1.2.0.bb
+++ b/meta/recipes-support/libksba/libksba_1.2.0.bb
@@ -7,7 +7,7 @@ DEPENDS = "libgpg-error"
 
 inherit autotools binconfig
 
-SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${PN}/${PN}-${PV}.tar.bz2"
+SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "e797f370b69b4dc776499d6a071ae137"
 SRC_URI[sha256sum] = "09afce65b03d027cbec10d21464f4f651cdfd269e38b404f83e48d3e2a3c934b"
-- 
1.7.1



