Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T0pa9-0005Am-Eu
	for openembedded-core@lists.linuxtogo.org;
	Mon, 13 Aug 2012 10:01:01 +0200
Received: by eaad12 with SMTP id d12so695622eaa.6
	for <openembedded-core@lists.linuxtogo.org>;
	Mon, 13 Aug 2012 00:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=+1XvdKMK4IWWCt6jfI4yeyvK2481AZlogJlGjpcvXYo=;
	b=Pl/k5AkzUwCp3iMbM6ST4p3nsbn77U4ExRZZ0pYmigl+NBYIRc339RwEpjradlW5YD
	nK/PdI2aoS18c34TFYrXYRiSaewoHEMgxoq9pBcbyNt0y/ww//LYyU1TdM1ew1sZIdPH
	kvl9/lcIMNaeLIdgiLQnXXazCUPjlTOnzWJ86TlI9Q3gLxVt7YxKIIe+MP6uEU4UUE1C
	JtbT2dPfcSICJEbZ6oiAuxwfnrecJHSDZ9av6jrDPZ0OONbYOuH4yNWzzGndklZcAF5y
	UHTwS3AA/RQkLTsUfV3lUZxjSuAk8cF3AbQAKjBJHij7Dc765vfEMCZ44sgYaW82y7n0
	glJA==
Received: by 10.14.177.193 with SMTP id d41mr6299802eem.19.1344844148409;
	Mon, 13 Aug 2012 00:49:08 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id d48sm16571190eeo.10.2012.08.13.00.49.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Aug 2012 00:49:06 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.linuxtogo.org
Date: Mon, 13 Aug 2012 09:48:59 +0200
Message-Id: <1344844140-10565-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQk2rHdqgUhtwwgo63QIx3YfJlzM3eARuJc+4pypAJOkoWsV9sri2Lgql8KrJ+vnxHH6O+tM
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/2] man: fix RDEPENDS and reformat recipe
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
X-List-Received-Date: Mon, 13 Aug 2012 08:01:01 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-extended/man/man_1.6f.bb |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/man/man_1.6f.bb b/meta/recipes-extended/man/man_1.6f.bb
index 9f75307..3dce1ae 100644
--- a/meta/recipes-extended/man/man_1.6f.bb
+++ b/meta/recipes-extended/man/man_1.6f.bb
@@ -3,11 +3,11 @@ DESCRIPTION = "A set of documentation tools: man, apropos and whatis"
 SECTION = "console/utils"
 HOMEPAGE = "http://primates.ximian.com/~flucifredi/man"
 LICENSE = "GPLv2"
-PR = "r3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-DEPENDS = "groff less"
+PR = "r4"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+DEPENDS = "groff less"
 
 SRC_URI = "http://primates.ximian.com/~flucifredi/${BPN}/${BPN}-${PV}.tar.gz \
            file://man-1.5k-confpath.patch;striplevel=0 \
@@ -61,4 +61,5 @@ do_install_append(){
 }
 
 
+RDEPENDS_${PN} = "less groff"
 FILES_${PN} += "${datadir}/locale ${sysconfdir}/man.conf"
-- 
1.7.10



