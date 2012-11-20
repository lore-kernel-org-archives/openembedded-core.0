Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tact3-0005Xt-AE
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 02:44:29 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Nov 2012 17:30:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,282,1352102400"; d="scan'208";a="244596719"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.202])
	by orsmga002.jf.intel.com with ESMTP; 19 Nov 2012 17:30:23 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2012 17:30:10 -0800
Message-Id: <f861f4e044a0b632c753c7164926d969b782141f.1353374801.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1353374801.git.sgw@linux.intel.com>
References: <cover.1353374801.git.sgw@linux.intel.com>
In-Reply-To: <cover.1353374801.git.sgw@linux.intel.com>
References: <cover.1353374801.git.sgw@linux.intel.com>
Subject: [PATCH 02/13] gnutls: Update to 2.12.21
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
X-List-Received-Date: Tue, 20 Nov 2012 01:44:29 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{gnutls_2.12.20.bb => gnutls_2.12.21.bb}       |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_2.12.20.bb => gnutls_2.12.21.bb} (79%)

diff --git a/meta/recipes-support/gnutls/gnutls_2.12.20.bb b/meta/recipes-support/gnutls/gnutls_2.12.21.bb
similarity index 79%
rename from meta/recipes-support/gnutls/gnutls_2.12.20.bb
rename to meta/recipes-support/gnutls/gnutls_2.12.21.bb
index 37b101d..6b2ef3a 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.20.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.21.bb
@@ -10,6 +10,5 @@ SRC_URI += "file://gnutls-openssl.patch \
             ${@['', 'file://fix-gettext-version.patch'][bb.data.inherits_class('native', d) or (not ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1))]} \
             file://remove-gets.patch \
            "
-
-SRC_URI[md5sum] = "f1dea97da5d4dcdbc675720c9aad9ee3"
-SRC_URI[sha256sum] = "4884eafcc8383ed23209199bbc72ad04f4eb94955a50a594125ff34c6889c564"
+SRC_URI[md5sum] = "93ffac7507dd39a4c6a672ca6976d397"
+SRC_URI[sha256sum] = "2bd020665951f38a230d6b6d98630f8c47ca6977d7d86977d356ccf17756fbf3"
-- 
1.7.7.6



