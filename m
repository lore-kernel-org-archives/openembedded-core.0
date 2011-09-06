Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joelagnel@ti.com>) id 1R13pu-0000W5-MS
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 00:09:43 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id p86M4eE7026955
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2011 17:04:40 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id p86M4e1h003173
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2011 17:04:40 -0500 (CDT)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p86M4e37014692
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2011 17:04:40 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 6 Sep 2011 17:04:39 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p86M4cHD013829;	Tue, 6 Sep 2011 17:04:39 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Sep 2011 16:54:02 -0500
Message-ID: <1315346049-8611-2-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1315346049-8611-1-git-send-email-joelagnel@ti.com>
References: <1315346049-8611-1-git-send-email-joelagnel@ti.com>
MIME-Version: 1.0
Cc: jdk@ti.com, k-kooi@ti.com
Subject: [PATCH v2 meta-oe 1/8] faad2: Imported from OE classic
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
X-List-Received-Date: Tue, 06 Sep 2011 22:09:44 -0000
Content-Type: text/plain

Changed LICENSE to GPLv2 and added LIC_FILES_CHKSUM

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 meta-oe/recipes-multimedia/faad2/faad2_2.7.bb |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/faad2/faad2_2.7.bb

diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
new file mode 100644
index 0000000..4015c1a
--- /dev/null
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Library for reading some sort of media format."
+SECTION = "libs"
+LICENSE = "GPLv2"
+PRIORITY = "optional"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=381c8cbe277a7bc1ee2ae6083a04c958"
+
+inherit autotools
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/faac/faad2-src/faad2-${PV}/${PN}-${PV}.tar.bz2;name=faad2 \
+"
+
+SRC_URI[faad2.md5sum] = "4c332fa23febc0e4648064685a3d4332"
+SRC_URI[faad2.sha256sum] = "14561b5d6bc457e825bfd3921ae50a6648f377a9396eaf16d4b057b39a3f63b5"
+
+PACKAGES =+ "libfaad libfaad-dev libmp4ff libmp4ff-dev"
+
+FILES_${PN} = "${bindir}/faad"
+
+FILES_libfaad = "${libdir}/libfaad.so.*"
+FILES_libfaad-dev = "${libdir}/libfaad.so ${libdir}/libfaad.la ${libdir}/libfaad.a ${includedir}/faad.h"
+
+FILES_libmp4ff = "${libdir}/libmp4ff.so.*"
+FILES_libmp4ff-dev = "${libdir}/libmp4ff.so ${libdir}/libmp4ff.la ${libdir}/libmp4ff.a ${includedir}/mp4ff.h"
+
-- 
1.7.0.4



