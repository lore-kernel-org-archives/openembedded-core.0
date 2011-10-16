Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RFXEn-0003VD-95
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Oct 2011 22:23:13 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Oct 2011 13:17:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,354,1315206000"; d="scan'208";a="74375155"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2011 13:17:22 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Oct 2011 13:17:09 -0700
Message-Id: <8ea251ce1824bbbc372049b8a9a427f14f6c065a.1318796061.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
Subject: [v2 -CONSOLIDATED PULL 07/14] bluez4: disable hidd, pand & dund
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
X-List-Received-Date: Sun, 16 Oct 2011 20:23:13 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

These daemons have been deprecated for some time, as their functionality
is now provided within the main bluetoothd daemon.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-connectivity/bluez/bluez4.inc     |    6 +++---
 meta/recipes-connectivity/bluez/bluez4_4.96.bb |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
index 5dacd92..fc515f6 100644
--- a/meta/recipes-connectivity/bluez/bluez4.inc
+++ b/meta/recipes-connectivity/bluez/bluez4.inc
@@ -27,9 +27,9 @@ EXTRA_OECONF = "\
   --enable-bccmd \
   --enable-hid2hci \
   --enable-dfutool \
-  --enable-hidd \
-  --enable-pand \
-  --enable-dund \
+  --disable-hidd \
+  --disable-pand \
+  --disable-dund \
   --disable-cups \
   --enable-test \
   --enable-datafiles \
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.96.bb b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
index 420a525..52268cf 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.96.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
@@ -1,6 +1,6 @@
 require bluez4.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI += "file://bluetooth.conf"
 
-- 
1.7.6.2



