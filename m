Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1ScGpn-0005HE-Hb
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 16:03:39 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jun 2012 06:53:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175498158"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by fmsmga002.fm.intel.com with ESMTP; 06 Jun 2012 06:53:12 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2012 08:53:00 -0500
Message-Id: <73f473e10d4b1670823ff5b1ec9d8220f2751f9f.1338990374.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1338990374.git.tom.zanussi@intel.com>
References: <cover.1338990374.git.tom.zanussi@intel.com>
Subject: [PATCH 1/2] gnupg: add libusb to DEPENDS
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
X-List-Received-Date: Wed, 06 Jun 2012 14:03:39 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

gnupg apparently depends on libusb:

| error: Failed dependencies:
| 	 libusb-0.1-4 >= 0.1.3 is needed by gnupg-2.0.18-r1.core2

So add libusb to gnupg DEPENDS.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-support/gnupg/gnupg_2.0.19.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gnupg/gnupg_2.0.19.bb b/meta/recipes-support/gnupg/gnupg_2.0.19.bb
index 1d19fe3..9a0f160 100644
--- a/meta/recipes-support/gnupg/gnupg_2.0.19.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.0.19.bb
@@ -4,8 +4,8 @@ LICENSE = "GPLv3 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
 
-DEPENDS = "pth libassuan libksba zlib bzip2 readline libgcrypt"
-PR = "r0"
+DEPENDS = "pth libassuan libksba zlib bzip2 readline libgcrypt libusb"
+PR = "r1"
 
 inherit autotools gettext
 
-- 
1.7.0.4



