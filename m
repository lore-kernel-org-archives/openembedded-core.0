Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXqbV-0002AR-OP
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 09:42:21 +0100
Received: by mail-ee0-f47.google.com with SMTP id v2so847020eea.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 00:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=DZC3AHAaiWJPTiAIrG4NsfR+hjt9xTU1RPDCfcpBgb4=;
	b=TP7IOq6es9DGpneys1dOWRTGNEKbYX6aVupTRSGnEkVk1SmvX7dN5+PVRs++4rnYqx
	Kvmz9JlodMIaxm26I7zc8WdlSDoRsjkb0VeHcf4KyHiMFBmLMcGaOsOrdPFts1kh+72e
	uHis1NpbnAwVtjy9gl6tvqHYgpaNLMCTwB9Rw=
Received: by 10.14.2.195 with SMTP id 43mr1990772eef.207.1323160537006;
	Tue, 06 Dec 2011 00:35:37 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c9sm66652161eeb.0.2011.12.06.00.35.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 00:35:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2011 09:35:20 +0100
Message-Id: <7bf394a40453afe887753dea6879a5f01a6b3fcc.1323160412.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <822c669a79e5f30bda467bc3a6f7b3c92377af22.1323160412.git.Martin.Jansa@gmail.com>
References: <822c669a79e5f30bda467bc3a6f7b3c92377af22.1323160412.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323160412.git.Martin.Jansa@gmail.com>
References: <cover.1323160412.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 2/3] subversion: update 1.7.0 to 1.7.1 and force libtool recreation
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
X-List-Received-Date: Tue, 06 Dec 2011 08:42:21 -0000

From: Klaus Kurzmann <mok@fluxnetz.de>

* subversion-1.7.* had libtool-2.4, oe-core now has 2.4.2 and it was
  failing:
  x86_64-linux-libtool: Version mismatch error.  This is libtool 2.4.2, but the
  x86_64-linux-libtool: definition of this LT_INIT comes from libtool 2.4.
  x86_64-linux-libtool: You should recreate aclocal.m4 with macros from libtool 2.4.2
  x86_64-linux-libtool: and run autoconf again.

Signed-off-by: Klaus Kurzmann <mok@fluxnetz.de>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libtool2.patch                                 |    0
 .../{subversion_1.7.0.bb => subversion_1.7.1.bb}   |    7 ++++---
 2 files changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion-1.7.0 => subversion-1.7.1}/libtool2.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion_1.7.0.bb => subversion_1.7.1.bb} (75%)

diff --git a/meta/recipes-devtools/subversion/subversion-1.7.0/libtool2.patch b/meta/recipes-devtools/subversion/subversion-1.7.1/libtool2.patch
similarity index 100%
rename from meta/recipes-devtools/subversion/subversion-1.7.0/libtool2.patch
rename to meta/recipes-devtools/subversion/subversion-1.7.1/libtool2.patch
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.0.bb b/meta/recipes-devtools/subversion/subversion_1.7.1.bb
similarity index 75%
rename from meta/recipes-devtools/subversion/subversion_1.7.0.bb
rename to meta/recipes-devtools/subversion/subversion_1.7.1.bb
index 396b35b..a99e087 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.0.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.1.bb
@@ -14,8 +14,8 @@ DEFAULT_PREFERENCE = "-1"
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
 "
-SRC_URI[md5sum] = "930e6644a1b6094efd268fde6a318f04"
-SRC_URI[sha256sum] = "64fd5f263a80e609717a3ca42f1f2625606a5c4a40a85716f82c866033780978"
+SRC_URI[md5sum] = "8a4fa74385df85a9702141b6b68b8307"
+SRC_URI[sha256sum] = "d34bde626fac1aa553f5c9aeedf961999a77cc31540ace18da5aeacdd03d6608"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a14fd2da3134e40a087eb4326a4ecd4"
 
@@ -32,6 +32,7 @@ acpaths = "-I build/ -I build/ac-macros/"
 
 do_configure_prepend () {
 	rm -f ${S}/libtool
-	rm -f ${S}/build/libtool.m4
+	rm -f ${S}/build/libtool.m4 ${S}/build/ltmain.sh ${S}/build/ltoptions.m4 ${S}/build/ltsugar.m4 ${S}/build/ltversion.m4 ${S}/build/lt~obsolete.m4
+	rm -f ${S}/aclocal.m4
 	sed -i -e 's:with_sasl="/usr/local":with_sasl="${STAGING_DIR}":' ${S}/build/ac-macros/sasl.m4
 }
-- 
1.7.8



