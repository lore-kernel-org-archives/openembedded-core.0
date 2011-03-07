Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Pwdk3-0007ll-5K
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Mar 2011 17:57:07 +0100
Received: by wyb38 with SMTP id 38so4193559wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2011 08:55:33 -0800 (PST)
Received: by 10.216.213.29 with SMTP id z29mr3665409weo.19.1299516933545;
	Mon, 07 Mar 2011 08:55:33 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id b54sm1363651wer.45.2011.03.07.08.55.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Mar 2011 08:55:32 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Mar 2011 17:53:47 +0100
Message-Id: <1299516827-23938-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] libgpg-error: extend to nativesdk to catch up with metadata changes
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
X-List-Received-Date: Mon, 07 Mar 2011 16:57:07 -0000

libgpg-error was introduced into the dependency tree for meta-toolchain-qte without the needed nativesdk extend

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../libgpg-error/libgpg-error_1.9.bb               |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.9.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.9.bb
index 479a11f..5e474cd 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.9.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.9.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 
 SECTION = "libs"
-DEPENDS = "gettext"
 PR = "r0"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.bz2 \
@@ -23,4 +22,6 @@ SRC_URI[sha256sum] = "54d9326bfbd46c705963c507953f65a40576d04b374e131008dc5b732f
 FILES_${PN} = "${libdir}/lib*.so.*"
 FILES_${PN}-dev += "${bindir}/*"
 
-inherit autotools binconfig pkgconfig
+inherit gettext autotools binconfig pkgconfig
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.6.6.1



