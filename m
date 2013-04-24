Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UV7eX-0007Ug-CW
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 23:55:03 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2013 14:37:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,546,1363158000"; d="scan'208";a="300916382"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.85])
	by orsmga001.jf.intel.com with ESMTP; 24 Apr 2013 14:37:13 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 14:36:54 -0700
Message-Id: <8002ed9b6f0df8d79ce3f0a5650e29cc96dc3b85.1366827512.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
Subject: [PATCH 01/18] less: Update to 458
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
X-List-Received-Date: Wed, 24 Apr 2013 21:55:07 -0000
X-List-Received-Date: Wed, 24 Apr 2013 21:55:07 -0000
X-List-Received-Date: Wed, 24 Apr 2013 21:55:07 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/less/{less_457.bb => less_458.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/less/{less_457.bb => less_458.bb} (87%)

diff --git a/meta/recipes-extended/less/less_457.bb b/meta/recipes-extended/less/less_458.bb
similarity index 87%
rename from meta/recipes-extended/less/less_457.bb
rename to meta/recipes-extended/less/less_458.bb
index 41d2515..3e4518a 100644
--- a/meta/recipes-extended/less/less_457.bb
+++ b/meta/recipes-extended/less/less_458.bb
@@ -23,12 +23,11 @@ LICENSE = "GPLv3+ | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://LICENSE;md5=866cc220f330b04ae4661fc3cdfedea7"
 DEPENDS = "ncurses"
-PR = "r0"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "b5a964682f327b0dceb690f34e02632f"
-SRC_URI[sha256sum] = "63c9c421df5c64439babc3aa44861512c298af394c932672b3e5aeb53580eed8"
+SRC_URI[md5sum] = "935b38aa2e73c888c210dedf8fd94f49"
+SRC_URI[sha256sum] = "e536c7819ede54b3d487f0ffc4c14b3620bed83734d92a81e89f62346db0fcac"
 
 inherit autotools update-alternatives
 
-- 
1.8.0.2



