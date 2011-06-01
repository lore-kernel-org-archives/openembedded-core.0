Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRerp-000421-W1
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:22 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203818"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:45 -0700
Message-Id: <37c55bb895efdd226162e5280eaa1dea1335c04c.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 18/32] gthumb: update to 2.12.3
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
X-List-Received-Date: Wed, 01 Jun 2011 06:25:22 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gthumb/{gthumb_2.12.2.bb => gthumb_2.12.3.bb}  |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gthumb/{gthumb_2.12.2.bb => gthumb_2.12.3.bb} (76%)

diff --git a/meta/recipes-gnome/gthumb/gthumb_2.12.2.bb b/meta/recipes-gnome/gthumb/gthumb_2.12.3.bb
similarity index 76%
rename from meta/recipes-gnome/gthumb/gthumb_2.12.2.bb
rename to meta/recipes-gnome/gthumb/gthumb_2.12.3.bb
index 258f2d5..115a805 100644
--- a/meta/recipes-gnome/gthumb/gthumb_2.12.2.bb
+++ b/meta/recipes-gnome/gthumb/gthumb_2.12.3.bb
@@ -12,5 +12,5 @@ inherit gnome pkgconfig
 FILES_${PN} += "${datadir}/icons"
 FILES_${PN}-dbg += "${libdir}/gthumb/modules/.debug"
 
-SRC_URI[archive.md5sum] = "5f6cb5957a4dcf196cedc6bb836169dc"
-SRC_URI[archive.sha256sum] = "bce8111e4d699620ae0399963798ff25929df8c8546f4949e2a871b330277091"
+SRC_URI[archive.md5sum] = "bfa0957a1bafc5d049292cd5fad372ce"
+SRC_URI[archive.sha256sum] = "0060c05fd372c2af2048d294ab3f75c8fb02c576d3e2004e08b7d34f49da1e66"
-- 
1.7.3.4



