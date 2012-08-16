Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T20fo-0000SA-Bv
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 16:03:44 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2012 06:50:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,778,1336374000"; d="scan'208";a="134986101"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.33])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2012 06:50:40 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2012 15:55:15 +0300
Message-Id: <1345121720-25925-2-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345121720-25925-1-git-send-email-constantinx.musca@intel.com>
References: <1345121720-25925-1-git-send-email-constantinx.musca@intel.com>
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 1/6] dbus: upgrade to 1.6.4
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
X-List-Received-Date: Thu, 16 Aug 2012 14:03:44 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../dbus/{dbus-1.4.20 => dbus-1.6.4}/dbus-1.init   |    0
 .../dbus/{dbus-1.4.20 => dbus-1.6.4}/tmpdir.patch  |    0
 .../dbus/{dbus_1.4.20.bb => dbus_1.6.4.bb}         |    4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus-1.4.20 => dbus-1.6.4}/dbus-1.init (100%)
 rename meta/recipes-core/dbus/{dbus-1.4.20 => dbus-1.6.4}/tmpdir.patch (100%)
 rename meta/recipes-core/dbus/{dbus_1.4.20.bb => dbus_1.6.4.bb} (21%)

diff --git a/meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init b/meta/recipes-core/dbus/dbus-1.6.4/dbus-1.init
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init
rename to meta/recipes-core/dbus/dbus-1.6.4/dbus-1.init
diff --git a/meta/recipes-core/dbus/dbus-1.4.20/tmpdir.patch b/meta/recipes-core/dbus/dbus-1.6.4/tmpdir.patch
similarity index 100%
rename from meta/recipes-core/dbus/dbus-1.4.20/tmpdir.patch
rename to meta/recipes-core/dbus/dbus-1.6.4/tmpdir.patch
diff --git a/meta/recipes-core/dbus/dbus_1.4.20.bb b/meta/recipes-core/dbus/dbus_1.6.4.bb
similarity index 21%
rename from meta/recipes-core/dbus/dbus_1.4.20.bb
rename to meta/recipes-core/dbus/dbus_1.6.4.bb
index c0da998..179097d 100644
--- a/meta/recipes-core/dbus/dbus_1.4.20.bb
+++ b/meta/recipes-core/dbus/dbus_1.6.4.bb
@@ -2,5 +2,5 @@ include dbus.inc
 
 PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "79eca2f2c1894ac347acce128314428b"
-SRC_URI[sha256sum] = "103bdcd261a13140730b5fa69f56a98ab5c89ba3f0116ea62fcfd639520d5aaf"
+SRC_URI[md5sum] = "5ec43dc4554cba638917317b2b4f7640"
+SRC_URI[sha256sum] = "5fba6b7a415d761a843fb8e0aee72db61cf13057a9ef8cdc795e5d369dc74cf1"
-- 
1.7.9.5



