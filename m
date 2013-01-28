Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tzl4k-0003oH-W1
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 10:32:41 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Jan 2013 01:16:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,550,1355126400"; d="scan'208";a="195769990"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.19])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Jan 2013 01:16:04 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 01:15:56 -0800
Message-Id: <392d982f3ca46e7a27ac57fb45dfd9fa1b340b5e.1359364462.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
Subject: [PATCH 09/13] dhcp: Update to 4.2.5
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
X-List-Received-Date: Mon, 28 Jan 2013 09:32:46 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/dhcp-3.0.3-dhclient-dbus.patch | 0
 .../dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/fix-client-path.patch          | 0
 .../dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/fix-external-bind.patch        | 0
 .../dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/fixincludes.patch              | 0
 .../dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/link-with-lcrypto.patch        | 0
 .../dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/noattrmode.patch               | 0
 meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/site.h   | 0
 meta/recipes-connectivity/dhcp/{dhcp_4.2.4-P2.bb => dhcp_4.2.5.bb}    | 4 ++--
 8 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/dhcp-3.0.3-dhclient-dbus.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/fix-client-path.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/fix-external-bind.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/fixincludes.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/link-with-lcrypto.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/noattrmode.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.4-P2 => dhcp-4.2.5}/site.h (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp_4.2.4-P2.bb => dhcp_4.2.5.bb} (62%)

diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/dhcp-3.0.3-dhclient-dbus.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.5/dhcp-3.0.3-dhclient-dbus.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/dhcp-3.0.3-dhclient-dbus.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.5/dhcp-3.0.3-dhclient-dbus.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/fix-client-path.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.5/fix-client-path.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/fix-client-path.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.5/fix-client-path.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/fix-external-bind.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.5/fix-external-bind.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/fix-external-bind.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.5/fix-external-bind.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/fixincludes.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.5/fixincludes.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/fixincludes.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.5/fixincludes.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/link-with-lcrypto.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.5/link-with-lcrypto.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/link-with-lcrypto.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.5/link-with-lcrypto.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/noattrmode.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.5/noattrmode.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/noattrmode.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.5/noattrmode.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/site.h b/meta/recipes-connectivity/dhcp/dhcp-4.2.5/site.h
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/site.h
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.5/site.h
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.5.bb
similarity index 62%
rename from meta/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bb
rename to meta/recipes-connectivity/dhcp/dhcp_4.2.5.bb
index c1efad1..af60763 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.5.bb
@@ -8,5 +8,5 @@ SRC_URI += "file://fixincludes.patch \
             file://link-with-lcrypto.patch \
            "
 
-SRC_URI[md5sum] = "fe36056f2d274fa4b82a5422f192e65f"
-SRC_URI[sha256sum] = "0f75170e323cd9573e6e09a5d9236725f3e56e3cac5a70a01fe2a9d76b436499"
+SRC_URI[md5sum] = "6489e919ac093d17249270ee9be1020e"
+SRC_URI[sha256sum] = "771a5cffb1fd1392d25926e22e1c58a006e2ad02ecd77d136096e5e366a5b6bc"
-- 
1.8.0.2



