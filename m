Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rt6VU-0002Yh-2f
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 00:56:00 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2012 15:48:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113486023"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.238])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2012 15:48:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2012 15:47:46 -0800
Message-Id: <75789868df9cfc5cb74edfc3fe7d773cfa272ce6.1328226197.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
Subject: [PATCH 07/14] rxvt-unicode: Update to 9.15
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
X-List-Received-Date: Thu, 02 Feb 2012 23:56:00 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../rxvt.desktop                                   |    0
 .../rxvt.png                                       |  Bin 2847 -> 2847 bytes
 .../xwc.patch                                      |    0
 .../{rxvt-unicode_9.14.bb => rxvt-unicode_9.15.bb} |    4 ++--
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.14 => rxvt-unicode-9.15}/rxvt.desktop (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.14 => rxvt-unicode-9.15}/rxvt.png (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.14 => rxvt-unicode-9.15}/xwc.patch (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.14.bb => rxvt-unicode_9.15.bb} (94%)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.14/rxvt.desktop b/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.15/rxvt.desktop
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.14/rxvt.desktop
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.15/rxvt.desktop
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.14/rxvt.png b/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.15/rxvt.png
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.14/rxvt.png
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.15/rxvt.png
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.14/xwc.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.15/xwc.patch
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.14/xwc.patch
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.15/xwc.patch
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.14.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb
similarity index 94%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.14.bb
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb
index c349249..2415ba5 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.14.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2
 	   file://rxvt.desktop \
 	   file://rxvt.png"
 
-SRC_URI[md5sum] = "022235a9a8b012c29e72c49177be6ce4"
-SRC_URI[sha256sum] = "29928a33be6b3fb0edd126df2c3d35e1900f8268b546ce54430780c550fa1d52"
+SRC_URI[md5sum] = "15595aa326167ac5eb68c28d95432faf"
+SRC_URI[sha256sum] = "ec1aa2932da844979ed8140bd92223defb12042aa5e877e05ac31139ca81f2b1"
 
 inherit autotools update-alternatives
 
-- 
1.7.6.5



