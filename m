Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1T4qC8-0006AO-9d
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 11:28:48 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 24 Aug 2012 02:15:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,302,1344236400"; d="scan'208";a="184898713"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.39])
	by orsmga001.jf.intel.com with ESMTP; 24 Aug 2012 02:15:33 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Aug 2012 12:15:34 +0300
Message-Id: <1345799734-4305-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <y>
References: <y>
Subject: [PATCH] dhcp : upgrade to 4.2.4-P1
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
X-List-Received-Date: Fri, 24 Aug 2012 09:28:48 -0000

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../dhcp-3.0.3-dhclient-dbus.patch                 |    0
 .../fix-client-path.patch                          |    0
 .../fix-external-bind.patch                        |    0
 .../fixincludes.patch                              |    0
 .../link-with-lcrypto.patch                        |    0
 .../noattrmode.patch                               |    0
 .../dhcp/{dhcp-4.2.3-P2 => dhcp-4.2.4-P1}/site.h   |    0
 .../dhcp/{dhcp_4.2.3-P2.bb => dhcp_4.2.4-P1.bb}    |    7 ++++---
 8 files changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.3-P2 => dhcp-4.2.4-P1}/dhcp-3.0.3-dhclient-dbus.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.3-P2 => dhcp-4.2.4-P1}/fix-client-path.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.3-P2 => dhcp-4.2.4-P1}/fix-external-bind.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.3-P2 => dhcp-4.2.4-P1}/fixincludes.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.3-P2 => dhcp-4.2.4-P1}/link-with-lcrypto.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.3-P2 => dhcp-4.2.4-P1}/noattrmode.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.3-P2 => dhcp-4.2.4-P1}/site.h (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp_4.2.3-P2.bb => dhcp_4.2.4-P1.bb} (59%)

diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/dhcp-3.0.3-dhclient-dbus.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/dhcp-3.0.3-dhclient-dbus.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/dhcp-3.0.3-dhclient-dbus.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/dhcp-3.0.3-dhclient-dbus.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fix-client-path.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/fix-client-path.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fix-client-path.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/fix-client-path.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fix-external-bind.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/fix-external-bind.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fix-external-bind.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/fix-external-bind.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fixincludes.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/fixincludes.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fixincludes.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/fixincludes.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/link-with-lcrypto.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/link-with-lcrypto.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/link-with-lcrypto.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/link-with-lcrypto.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/noattrmode.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/noattrmode.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/noattrmode.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/noattrmode.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/site.h b/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/site.h
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/site.h
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.4-P1/site.h
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.4-P1.bb
similarity index 59%
rename from meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
rename to meta/recipes-connectivity/dhcp/dhcp_4.2.4-P1.bb
index 67af3e2..850212e 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.4-P1.bb
@@ -1,6 +1,6 @@
 require dhcp.inc
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI += "file://fixincludes.patch \
             file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
@@ -8,5 +8,6 @@ SRC_URI += "file://fixincludes.patch \
             file://link-with-lcrypto.patch \
            "
 
-SRC_URI[md5sum] = "14f57fd580d01633d0fad4809007a801"
-SRC_URI[sha256sum] = "5cf7ae2cad9c4ca0103748b2476ec8ea78484e408f8fe597e4e0a4afb051b469"
+SRC_URI[md5sum] = "0ca7181024651f6323951d5498c8020b"
+SRC_URI[sha256sum] = "d3baabef27fc006e1ce1c4e3d03d7e5c4b6a34d5a2f45fa47d69235ed25ad420"
+
-- 
1.7.9.5



