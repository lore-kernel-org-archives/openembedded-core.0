Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q7wvb-0008MC-3I
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Apr 2011 23:39:47 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Apr 2011 14:37:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,319,1299484800"; d="scan'208";a="625199199"
Received: from unknown (HELO localhost) ([10.255.12.228])
	by orsmga002.jf.intel.com with ESMTP; 07 Apr 2011 14:37:37 -0700
Message-Id: <abd84857b0c9000117a5889ee4dba53373957f62.1302211549.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302211549.git.sgw@linux.intel.com>
References: <cover.1302211549.git.sgw@linux.intel.com>
Old-Date: Wed, 6 Apr 2011 17:56:53 -0700
Date: Thu, 07 Apr 2011 14:37:37 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 05/11] gthumb: update to 2.12.1
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
X-List-Received-Date: Thu, 07 Apr 2011 21:39:47 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gthumb/{gthumb_2.12.1.bb => gthumb_2.12.2.bb}  |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gthumb/{gthumb_2.12.1.bb => gthumb_2.12.2.bb} (76%)

diff --git a/meta/recipes-gnome/gthumb/gthumb_2.12.1.bb b/meta/recipes-gnome/gthumb/gthumb_2.12.2.bb
similarity index 76%
rename from meta/recipes-gnome/gthumb/gthumb_2.12.1.bb
rename to meta/recipes-gnome/gthumb/gthumb_2.12.2.bb
index 68437fc..0b3bd1a 100644
--- a/meta/recipes-gnome/gthumb/gthumb_2.12.1.bb
+++ b/meta/recipes-gnome/gthumb/gthumb_2.12.2.bb
@@ -12,5 +12,5 @@ inherit gnome pkgconfig
 FILES_${PN} += "${datadir}/icons"
 FILES_${PN}-dbg += "${libdir}/gthumb/modules/.debug"
 
-SRC_URI[archive.md5sum] = "a89be18a9e6f7f9d65cef56f34eb3022"
-SRC_URI[archive.sha256sum] = "94d186db48e4527f1ba1dad41b860fc34b8f13da4228319dc742c91f45ddea64"
+SRC_URI[archive.md5sum] = "5f6cb5957a4dcf196cedc6bb836169dc"
+SRC_URI[archive.sha256sum] = "bce8111e4d699620ae0399963798ff25929df8c8546f4949e2a871b330277091"
-- 
1.7.1



