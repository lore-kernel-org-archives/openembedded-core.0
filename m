Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TkrX1-0003Tx-3S
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 08:24:03 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Dec 2012 23:09:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,308,1355126400"; d="scan'208";a="182231443"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com)
	([10.255.13.212])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Dec 2012 23:09:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 23:09:18 -0800
Message-Id: <1355814558-19628-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <1355814558-19628-1-git-send-email-sgw@linux.intel.com>
References: <1355814558-19628-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2] matchbox-theme-sato-2: remove, depends on matchbox-wm-2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2012 07:24:03 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../matchbox-theme-sato/matchbox-theme-sato-2_git.bb          | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2_git.bb

diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2_git.bb b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2_git.bb
deleted file mode 100644
index 3edc3a3..0000000
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2_git.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require matchbox-theme-sato.inc
-
-DEPENDS = "matchbox-wm-2"
-SRCREV = "e3ccc08d4a680d70fd4891fca966aa6ce503065c"
-PV = "0.2+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/matchbox-sato;protocol=git"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OECONF = "--disable-matchbox-1 --enable-matchbox-2"
-- 
1.8.0.2



