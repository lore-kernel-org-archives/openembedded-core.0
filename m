Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id A208771AFA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 21:47:19 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 9BD22B807DB; Wed, 30 Nov 2016 22:47:17 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 22:47:17 +0100
Message-Id: <1480542437-22778-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480542437-22778-1-git-send-email-obi@opendreambox.org>
References: <1480542437-22778-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 2/2] lighttpd: access and accesslog are optional modules
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
X-List-Received-Date: Wed, 30 Nov 2016 21:47:21 -0000

Move them from RDEPENDS to RRECOMMENDS.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb
index 237c07f..cb95f98 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.43.bb
@@ -6,13 +6,11 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4dac5c6ab169aa212feb5028853a579"
 
 SECTION = "net"
-RDEPENDS_${PN} += " \
-               lighttpd-module-access \
-               lighttpd-module-accesslog \
-               lighttpd-module-indexfile \
-               lighttpd-module-dirlisting \
-               lighttpd-module-staticfile \
-"
+RDEPENDS_${PN} = "lighttpd-module-dirlisting \
+                  lighttpd-module-indexfile \
+                  lighttpd-module-staticfile"
+RRECOMMENDS_${PN} = "lighttpd-module-access \
+                     lighttpd-module-accesslog"
 
 SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.xz \
         file://index.html.lighttpd \

