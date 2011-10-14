Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1REiVR-0006CV-Ih
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 16:13:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Oct 2011 07:07:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,346,1315206000"; d="scan'208";a="62611694"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.218])
	by azsmga001.ch.intel.com with ESMTP; 14 Oct 2011 07:07:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Oct 2011 15:07:11 +0100
Message-Id: <66b15853a3088bdcf6034755ea5ecea1e9da2fb3.1318601142.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1318601142.git.paul.eggleton@linux.intel.com>
References: <cover.1318601142.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1318601142.git.paul.eggleton@linux.intel.com>
References: <cover.1318601142.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] bluez4: disable hidd, pand & dund
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
X-List-Received-Date: Fri, 14 Oct 2011 14:13:01 -0000

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
1.7.4.1



