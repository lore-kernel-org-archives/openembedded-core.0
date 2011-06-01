Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRero-00042u-De
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:20 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203809"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:41 -0700
Message-Id: <2c4d0120a930023fafc826685fcfad212dad3785.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/32] chkconfig: update to 1.3.52
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
X-List-Received-Date: Wed, 01 Jun 2011 06:25:21 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{chkconfig_1.3.51.bb => chkconfig_1.3.52.bb}   |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/chkconfig/{chkconfig_1.3.51.bb => chkconfig_1.3.52.bb} (83%)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.51.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.52.bb
similarity index 83%
rename from meta/recipes-extended/chkconfig/chkconfig_1.3.51.bb
rename to meta/recipes-extended/chkconfig/chkconfig_1.3.52.bb
index 3f810b6..7d5f069 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.51.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.52.bb
@@ -16,8 +16,8 @@ PR = "r0"
 
 SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${P}.tar.bz2"
 
-SRC_URI[md5sum] = "0a7e5b271084abf368919b51fd917750"
-SRC_URI[sha256sum] = "bfa83a8f69f5127ab772eee33a48f3c1839efac1a622ab484d2f688264d13929"
+SRC_URI[md5sum] = "a576808a6d66763606d750ec451bab6d"
+SRC_URI[sha256sum] = "aa36bf7fd3f7c6e3371eddd8a7846b83435c48f132cc5919d83a830504b797d6"
 
 inherit autotools gettext
 
-- 
1.7.3.4



