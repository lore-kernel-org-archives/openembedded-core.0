Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RqhBV-0007R0-Al
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 09:29:25 +0100
Received: by werc1 with SMTP id c1so1117432wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 00:21:36 -0800 (PST)
Received: by 10.216.139.222 with SMTP id c72mr2548456wej.42.1327652496751;
	Fri, 27 Jan 2012 00:21:36 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fv6sm20712591wib.8.2012.01.27.00.21.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 00:21:35 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2012 09:21:29 +0100
Message-Id: <1327652489-9574-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] libtool 2.4.2: fix missing quote in FILES_libtldtl
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
X-List-Received-Date: Fri, 27 Jan 2012 08:29:25 -0000

The missing quote prohibits OE from packaging it correctly, leading to:

|  * satisfy_dependencies_for: Cannot satisfy the following dependencies for task-gnome:
|  *    libltdl7 (>= 2.4.2) *   libltdl7 (>= 2.4.2) *   libltdl7 (>= 2.4.2) *   libltdl7 (>= 2.4.2) *   libltdl7 (>= 2.4.2) *   libltdl7 (>= 2.4.2) *   libltdl7 (>= 2.4.2) *

for incremental builds and binary feeds.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-devtools/libtool/libtool-2.4.2.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
index d55b2bd..084062a 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
     file://libltdl/COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://trailingslash.patch \
@@ -36,7 +36,7 @@ DEPENDS = "libtool-native"
 
 PACKAGES =+ "libltdl libltdl-dev libltdl-dbg libltdl-staticdev"
 FILES_${PN} += "${datadir}/aclocal*"
-FILES_libltdl = "${libdir}/libltdl${SOLIBS}
+FILES_libltdl = "${libdir}/libltdl${SOLIBS}"
 FILES_libltdl-dev = "${libdir}/libltdl${SOLIBSDEV} ${includedir}"
 FILES_libltdl-staticdev = "${libdir}/libltdl.a"
 FILES_libltdl-dbg = "${libdir}/.debug/"
-- 
1.7.2.5



