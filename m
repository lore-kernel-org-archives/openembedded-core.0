Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TaKXo-00043w-1h
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 07:09:20 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Nov 2012 21:54:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,276,1352102400"; d="scan'208";a="221530204"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.202])
	by orsmga001.jf.intel.com with ESMTP; 18 Nov 2012 21:54:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Nov 2012 21:54:41 -0800
Message-Id: <a743db14f323fce135872f5d8a06ff0656444eb5.1353304234.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1353304234.git.sgw@linux.intel.com>
References: <cover.1353304234.git.sgw@linux.intel.com>
In-Reply-To: <cover.1353304234.git.sgw@linux.intel.com>
References: <cover.1353304234.git.sgw@linux.intel.com>
Subject: [PATCH 08/17] dhcp: Update to 4.2.4-P2
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
X-List-Received-Date: Mon, 19 Nov 2012 06:09:20 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../dhcp-3.0.3-dhclient-dbus.patch                 |    0
 .../fix-client-path.patch                          |    0
 .../fix-external-bind.patch                        |    0
 .../fixincludes.patch                              |    0
 .../link-with-lcrypto.patch                        |    0
 .../noattrmode.patch                               |    0
 .../dhcp/{dhcp-4.2.4-P1 => dhcp-4.2.4-P2}/site.h   |    0
 .../dhcp/{dhcp_4.2.4-P1.bb => dhcp_4.2.4-P2.bb}    |    5 ++---
 8 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P1 => dhcp-4.2.4-P2}/dhcp-3.0.3-dhclient-dbus.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P1 => dhcp-4.2.4-P2}/fix-client-path.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P1 => dhcp-4.2.4-P2}/fix-external-bind.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P1 => dhcp-4.2.4-P2}/fixincludes.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P1 => dhcp-4.2.4-P2}/link-with-lcrypto.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P1 => dhcp-4.2.4-P2}/noattrmode.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P1 => dhcp-4.2.4-P2}/site.h (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp_4.2.4-P1.bb => dhcp_4.2.4-P2.bb} (62%)

diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/dhcp-3.0.3-dhclient-dbus.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/dhcp-3.0.3-dhclient-dbus.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/dhcp-3.0.3-dhclient-dbus.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/dhcp-3.0.3-dhclient-dbus.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/fix-client-path.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/fix-client-path.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/fix-client-path.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/fix-client-path.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/fix-external-bind.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/fix-external-bind.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/fix-external-bind.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/fix-external-bind.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/fixincludes.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/fixincludes.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/fixincludes.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/fixincludes.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/link-with-lcrypto.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/link-with-lcrypto.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/link-with-lcrypto.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/link-with-lcrypto.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/noattrmode.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/noattrmode.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/noattrmode.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/noattrmode.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/site.h b/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/site.h
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/site.h
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/site.h
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.4-P1.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bb
similarity index 62%
rename from meta/recipes-connectivity/dhcp/dhcp_4.2.4-P1.bb
rename to meta/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bb
index 850212e..c1efad1 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.4-P1.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bb
@@ -8,6 +8,5 @@ SRC_URI += "file://fixincludes.patch \
             file://link-with-lcrypto.patch \
            "
 
-SRC_URI[md5sum] = "0ca7181024651f6323951d5498c8020b"
-SRC_URI[sha256sum] = "d3baabef27fc006e1ce1c4e3d03d7e5c4b6a34d5a2f45fa47d69235ed25ad420"
-
+SRC_URI[md5sum] = "fe36056f2d274fa4b82a5422f192e65f"
+SRC_URI[sha256sum] = "0f75170e323cd9573e6e09a5d9236725f3e56e3cac5a70a01fe2a9d76b436499"
-- 
1.7.7.6



