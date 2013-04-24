Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UV7ee-0007V8-4I
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 23:55:09 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2013 14:37:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,546,1363158000"; d="scan'208";a="300916412"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.85])
	by orsmga001.jf.intel.com with ESMTP; 24 Apr 2013 14:37:15 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 14:36:58 -0700
Message-Id: <e8d3a0424ed2786ded7b77832112481d0fd26fb9.1366827512.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
Subject: [PATCH 05/18] dhcp: Update to 4.2.5-P1
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
X-List-Received-Date: Wed, 24 Apr 2013 21:55:22 -0000
X-List-Received-Date: Wed, 24 Apr 2013 21:55:22 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../dhcp/{dhcp-4.2.5 => dhcp}/dhcp-3.0.3-dhclient-dbus.patch          | 0
 .../dhcp/{dhcp-4.2.5 => dhcp}/fix-client-path.patch                   | 0
 .../dhcp/{dhcp-4.2.5 => dhcp}/fix-external-bind.patch                 | 0
 meta/recipes-connectivity/dhcp/{dhcp-4.2.5 => dhcp}/fixincludes.patch | 0
 meta/recipes-connectivity/dhcp/{dhcp-4.2.5 => dhcp}/fixsepbuild.patch | 0
 .../dhcp/{dhcp-4.2.5 => dhcp}/link-with-lcrypto.patch                 | 0
 meta/recipes-connectivity/dhcp/{dhcp-4.2.5 => dhcp}/noattrmode.patch  | 0
 meta/recipes-connectivity/dhcp/{dhcp-4.2.5 => dhcp}/site.h            | 0
 meta/recipes-connectivity/dhcp/{dhcp_4.2.5.bb => dhcp_4.2.5-P1.bb}    | 4 ++--
 9 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.5 => dhcp}/dhcp-3.0.3-dhclient-dbus.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.5 => dhcp}/fix-client-path.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.5 => dhcp}/fix-external-bind.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.5 => dhcp}/fixincludes.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.5 => dhcp}/fixsepbuild.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.5 => dhcp}/link-with-lcrypto.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.5 => dhcp}/noattrmode.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.5 => dhcp}/site.h (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp_4.2.5.bb => dhcp_4.2.5-P1.bb} (66%)

diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.5/dhcp-3.0.3-dhclient-dbus.patch b/meta/recipes-connectivity/dhcp/dhcp/dhcp-3.0.3-dhclient-dbus.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.5/dhcp-3.0.3-dhclient-dbus.patch
rename to meta/recipes-connectivity/dhcp/dhcp/dhcp-3.0.3-dhclient-dbus.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.5/fix-client-path.patch b/meta/recipes-connectivity/dhcp/dhcp/fix-client-path.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.5/fix-client-path.patch
rename to meta/recipes-connectivity/dhcp/dhcp/fix-client-path.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.5/fix-external-bind.patch b/meta/recipes-connectivity/dhcp/dhcp/fix-external-bind.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.5/fix-external-bind.patch
rename to meta/recipes-connectivity/dhcp/dhcp/fix-external-bind.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.5/fixincludes.patch b/meta/recipes-connectivity/dhcp/dhcp/fixincludes.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.5/fixincludes.patch
rename to meta/recipes-connectivity/dhcp/dhcp/fixincludes.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.5/fixsepbuild.patch b/meta/recipes-connectivity/dhcp/dhcp/fixsepbuild.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.5/fixsepbuild.patch
rename to meta/recipes-connectivity/dhcp/dhcp/fixsepbuild.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.5/link-with-lcrypto.patch b/meta/recipes-connectivity/dhcp/dhcp/link-with-lcrypto.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.5/link-with-lcrypto.patch
rename to meta/recipes-connectivity/dhcp/dhcp/link-with-lcrypto.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.5/noattrmode.patch b/meta/recipes-connectivity/dhcp/dhcp/noattrmode.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.5/noattrmode.patch
rename to meta/recipes-connectivity/dhcp/dhcp/noattrmode.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.5/site.h b/meta/recipes-connectivity/dhcp/dhcp/site.h
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.5/site.h
rename to meta/recipes-connectivity/dhcp/dhcp/site.h
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.5.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb
similarity index 66%
rename from meta/recipes-connectivity/dhcp/dhcp_4.2.5.bb
rename to meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb
index 3ec9f3b..a5eed34 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.5.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb
@@ -9,5 +9,5 @@ SRC_URI += "file://fixincludes.patch \
             file://fixsepbuild.patch \
            "
 
-SRC_URI[md5sum] = "6489e919ac093d17249270ee9be1020e"
-SRC_URI[sha256sum] = "771a5cffb1fd1392d25926e22e1c58a006e2ad02ecd77d136096e5e366a5b6bc"
+SRC_URI[md5sum] = "f68e3c1f00a9af5742bc5e71d567cf93"
+SRC_URI[sha256sum] = "59b06c9f5d775e46999b422c45b9229402c462b114ce1685617bfb2b8b028250"
-- 
1.8.0.2



