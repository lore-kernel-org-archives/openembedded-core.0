Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SirKY-0004YT-2q
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Jun 2012 20:14:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2012 11:03:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="161983155"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by orsmga002.jf.intel.com with ESMTP; 24 Jun 2012 11:03:45 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jun 2012 11:03:38 -0700
Message-Id: <af05a8cd868de913ef754ca2710985d031ebd253.1340560914.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
Subject: [PATCH 13/14] libidn: Upgrade to 1.25
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
X-List-Received-Date: Sun, 24 Jun 2012 18:14:40 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libidn/{libidn_1.24.bb => libidn_1.25.bb}      |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/libidn/{libidn_1.24.bb => libidn_1.25.bb} (89%)

diff --git a/meta/recipes-extended/libidn/libidn_1.24.bb b/meta/recipes-extended/libidn/libidn_1.25.bb
similarity index 89%
rename from meta/recipes-extended/libidn/libidn_1.24.bb
rename to meta/recipes-extended/libidn/libidn_1.25.bb
index a4ecce1..755a818 100644
--- a/meta/recipes-extended/libidn/libidn_1.24.bb
+++ b/meta/recipes-extended/libidn/libidn_1.25.bb
@@ -10,15 +10,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9c9d9d207a3468a696a03368913d360b \
                     file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://lib/idna.h;endline=21;md5=7364f6a250728ffe16170f5e3ab37512 \
                     file://src/idn.c;endline=20;md5=7d7235e7951ac87d9dfac42e1b69d9cb"
-PR = "r2"
+PR = "r0"
 
 inherit pkgconfig autotools gettext
 
 SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
            file://libidn_fix_for_automake-1.12.patch "
 
-SRC_URI[md5sum] = "764d7258eeb273941680499fab2c7367"
-SRC_URI[sha256sum] = "da1708c6063ecb7951a0908e67df3eacdfe128b18edaa6cf6867d7b73b5f35ff"
+SRC_URI[md5sum] = "45ffabce4b8ca87fe98fe4542668d33d"
+SRC_URI[sha256sum] = "7fe625328a6a5d837d723c462c1788affb84d9c9fc0ae5cd0ce9ac7724c34716"
 
 # command tool is under GPLv3+, while libidn itself is under LGPLv2.1+ or LGPLv3
 # so package command into a separate package
-- 
1.7.7.6



