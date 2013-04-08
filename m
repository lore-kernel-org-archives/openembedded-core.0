Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1UPBth-0002i0-W3
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 15:14:10 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Apr 2013 05:55:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,431,1363158000"; d="scan'208";a="314672575"
Received: from adamian-desktop.rb.intel.com ([10.237.105.58])
	by orsmga002.jf.intel.com with ESMTP; 08 Apr 2013 05:56:33 -0700
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id 52EEC5632DD; Mon,  8 Apr 2013 15:56:41 +0300 (EEST)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: paul.eggleton@linux.intel.com, raj.khem@gmail.com,
	cristian.iorga@intel.com, openembedded-core@lists.openembedded.org
Date: Mon,  8 Apr 2013 15:56:39 +0300
Message-Id: <1365425799-25357-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH] bluez4: add readline dependency
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
X-List-Received-Date: Mon, 08 Apr 2013 13:14:10 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

bluez4 uses readline to be build, but the dependency is not listed
This is listed in the configuration log.
So we add it.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/recipes-connectivity/bluez/bluez4.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
index bff24d3..42d82b0 100644
--- a/meta/recipes-connectivity/bluez/bluez4.inc
+++ b/meta/recipes-connectivity/bluez/bluez4.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
                     file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
-DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck"
+DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck readline"
 RDEPENDS_${PN}-dev = "bluez-hcidump"
 
 PACKAGECONFIG ??= "\
-- 
1.7.10.4



