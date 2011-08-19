Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QuXes-0003Mr-Pz
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 00:35:23 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Aug 2011 15:30:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="39592235"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.14.3])
	by orsmga002.jf.intel.com with ESMTP; 19 Aug 2011 15:30:40 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2011 15:30:33 -0700
Message-Id: <f22710e02b075d0cac9eb153e054e0c18905907d.1313792370.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313792370.git.josh@linux.intel.com>
References: <cover.1313792370.git.josh@linux.intel.com>
In-Reply-To: <cover.1313792370.git.josh@linux.intel.com>
References: <cover.1313792370.git.josh@linux.intel.com>
Subject: [PATCH 1/1] bluez4: drop usbpath from DEPENDS
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
X-List-Received-Date: Fri, 19 Aug 2011 22:35:23 -0000

We don't (currently) have usbpath in oe-core, so drop it from the DEPENDS to
make BlueZ buildable again.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
CC: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/bluez/bluez4_4.96.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4_4.96.bb b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
index edba167..994cec7 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.96.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
                     file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
-DEPENDS = "udev gst-plugins-base alsa-lib libusb dbus-glib usbpath"
+DEPENDS = "udev gst-plugins-base alsa-lib libusb dbus-glib"
 RDEPENDS_${PN}-dev = "bluez-hcidump"
 
 ASNEEDED = ""
-- 
1.7.6



