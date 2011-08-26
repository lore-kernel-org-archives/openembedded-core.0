Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joelagnel@ti.com>) id 1QwkUl-0003no-J8
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 02:42:03 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id p7Q0bHAP005561
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:37:17 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id p7Q0bGxY008791
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:37:16 -0500 (CDT)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p7Q0bGg2001486
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:37:16 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 25 Aug 2011 19:37:16 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p7Q0bFap011622;	Thu, 25 Aug 2011 19:37:16 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Aug 2011 19:28:16 -0500
Message-ID: <1314318504-9524-2-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
References: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
MIME-Version: 1.0
Subject: [PATCH meta-oe 2/9] faad2: Imported from OE classic
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
X-List-Received-Date: Fri, 26 Aug 2011 00:42:03 -0000
Content-Type: text/plain

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 meta-oe/recipes-multimedia/faad2/faad2_2.7.bb |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/faad2/faad2_2.7.bb

diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
new file mode 100644
index 0000000..e778432
--- /dev/null
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Library for reading some sort of media format."
+SECTION = "libs"
+LICENSE = "LGPL"
+PRIORITY = "optional"
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



