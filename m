Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QeBLn-0003jC-Dv
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 21:32:03 +0200
Received: by fxh10 with SMTP id 10so6825376fxh.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2011 12:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=mH0Rf3SkqddK+q1AzYDxtiQni/613RRa2l7ONUz2pys=;
	b=P6Eydxe2ctsnMhjkFIFbyOIgQgi+O2IdGBJ7U72hSbhhoS+NfxPWCMxYK2U3RVd0hM
	xba3Ixx03msWUPsLmphboXldZRvd2pet8QvkmwhYTFbcYzDDKE2wCivijPHwjDwLpmgz
	l8ld75++X/B0IC7oLz7X11sTuXcQ1yL2X1g6o=
Received: by 10.223.132.207 with SMTP id c15mr5466755fat.73.1309894093689;
	Tue, 05 Jul 2011 12:28:13 -0700 (PDT)
Received: from localhost.localdomain
	(85-127-149-243.dynamic.xdsl-line.inode.at [85.127.149.243])
	by mx.google.com with ESMTPS id f15sm4331195fai.22.2011.07.05.12.28.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jul 2011 12:28:12 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 21:28:24 +0200
Message-Id: <1309894104-11504-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] libxslt: Inherit from binconfig
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
X-List-Received-Date: Tue, 05 Jul 2011 19:32:03 -0000

libxslt provides a binconfig that may be used to cross-compile/-link against the
target library.

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 meta/recipes-support/libxslt/libxslt_1.1.26.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.26.bb b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
index 71fb478..b077d13 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.26.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0cd9a07afbeb24026c9b03aecfeba458"
 SECTION = "libs"
 PRIORITY = "optional"
 DEPENDS = "libxml2 (>=2.6.27)"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
            file://pkgconfig_fix.patch;patch=1"
@@ -17,7 +17,7 @@ SRC_URI[md5sum] = "e61d0364a30146aaa3001296f853b2b9"
 SRC_URI[sha256sum] = "55dd52b42861f8a02989d701ef716d6280bfa02971e967c285016f99c66e3db1"
 S = "${WORKDIR}/libxslt-${PV}"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig binconfig
 
 EXTRA_OECONF = "--without-python --without-debug --without-mem-debug --without-crypto"
 
-- 
1.7.3.4



