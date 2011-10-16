Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RFLW0-000288-RS
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Oct 2011 09:52:13 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Oct 2011 00:46:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="63341613"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by orsmga001.jf.intel.com with ESMTP; 16 Oct 2011 00:46:22 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Oct 2011 00:46:12 -0700
Message-Id: <e8ee4e3bcb09c6ee6607f088aa9b18f4f2d8dba1.1318751027.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318751027.git.sgw@linux.intel.com>
References: <cover.1318751027.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318751027.git.sgw@linux.intel.com>
References: <cover.1318751027.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/14] bluez4: disable hidd, pand & dund
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
X-List-Received-Date: Sun, 16 Oct 2011 07:52:13 -0000

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



