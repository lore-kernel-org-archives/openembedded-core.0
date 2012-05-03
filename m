Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQZ-0006gd-Ol
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:05:56 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772198"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:38 -0700
Message-Id: <d327813315fd467fb147cda1820b1fd8a7b31ce3.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 19/36] makedepend: upgrade from 1.0.3 to 1.0.4
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
X-List-Received-Date: Thu, 03 May 2012 02:05:56 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../{makedepend_1.0.3.bb => makedepend_1.0.4.bb}   |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-util/{makedepend_1.0.3.bb => makedepend_1.0.4.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-util/makedepend_1.0.3.bb b/meta/recipes-graphics/xorg-util/makedepend_1.0.4.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-util/makedepend_1.0.3.bb
rename to meta/recipes-graphics/xorg-util/makedepend_1.0.4.bb
index 86e5d81..fea0b22 100644
--- a/meta/recipes-graphics/xorg-util/makedepend_1.0.3.bb
+++ b/meta/recipes-graphics/xorg-util/makedepend_1.0.4.bb
@@ -18,6 +18,5 @@ BBCLASSEXTEND = "native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=43a6eda34b48ee821b3b66f4f753ce4f"
 
-SRC_URI[md5sum] = "ec37ca8b810a40cdfb16a736b3360f6c"
-SRC_URI[sha256sum] = "2d3466acc29b382a4368b30371f17a4083933281b97f8ef67fc8b785a60d52dc"
-
+SRC_URI[md5sum] = "bf1c54028427829c9c3193bef710dbee"
+SRC_URI[sha256sum] = "f53b8ce5dec02a05f8994036a8ebac485a96324143ff2382e29578fdc096b04f"
-- 
1.7.7.6



