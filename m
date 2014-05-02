Return-Path: <valentin.popa@intel.com>
X-Greylist: delayed 662 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 02 May 2014 11:30:52 UTC
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 57DF460048
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 11:30:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 May 2014 04:19:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,972,1389772800"; d="scan'208";a="532443555"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by fmsmga002.fm.intel.com with ESMTP; 02 May 2014 04:19:39 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 May 2014 14:19:26 +0300
Message-Id: <1399029566-14565-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cff8f1a8914290689c411c19e78f7118036eda9c.1398871949.git.valentin.popa@intel.com>
References: <cff8f1a8914290689c411c19e78f7118036eda9c.1398871949.git.valentin.popa@intel.com>
Subject: [PATCH 1/3] nettle: add nettle to oe-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 May 2014 11:30:55 -0000

Newer versions of gnutls depends on nettle.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/recipes-support/nettle/nettle_2.7.1.bb | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/recipes-support/nettle/nettle_2.7.1.bb

diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_2.7.1.bb
new file mode 100644
index 0000000..87f1639
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
@@ -0,0 +1,24 @@
+SUMMARY = "A low level cryptographic library"
+HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
+SECTION = "libs"
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+                    file://serpent-decrypt.c;beginline=53;endline=67;md5=bcfd4745d53ca57f82907089898e390d \
+                    file://serpent-set-key.c;beginline=56;endline=70;md5=bcfd4745d53ca57f82907089898e390d"
+
+DEPENDS += "gmp"
+
+SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "003d5147911317931dd453520eb234a5"
+SRC_URI[sha256sum] = "bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40"
+
+do_configure_prepend() {
+       if [ ! -e ${S}/acinclude.m4 -a -e ${S}/aclocal.m4 ]; then
+               cp ${S}/aclocal.m4 ${S}/acinclude.m4
+       fi
+}
+
+inherit autotools
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


