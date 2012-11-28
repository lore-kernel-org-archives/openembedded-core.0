Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TdcFS-0000sj-Mm
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 08:40:05 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so9653725lag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2012 23:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=iLTDxBuwyDskIyVB8UykHeGUHptsECieh8CQJ/MLGX4=;
	b=huWJOvPBQF1oeIqR905r9V5wyurlXc2os3F2d5CN+9F+HDsu6TLUrDGZmHFOIEpOmw
	+v7eXQLusSsZMskjHVTN0AeSlrTqZNaOB/lXdSm8xtDKmkUAQWMEPIgktz6WrPg6MLo8
	t5v3wvxEEzqs94WF2kQa/A5G8EWPJ/WxWnCfRz1Q1+5d3slm68/AocImqCT6om7vxdOk
	vXIa1hpscfyPvy4Zw5XE24LXMi/Xo3PTMfNpn2qjcO3bBAM0ipj793JR/kTrLDOwr4eO
	kkwpWiPOuZWAXlvSB3QfMzsNANEjEdW/JJ6wzkEJtkynpgLSCr8ClSd+r9WgFWW5vKtt
	GPPA==
Received: by 10.112.83.42 with SMTP id n10mr3885996lby.116.1354087544091;
	Tue, 27 Nov 2012 23:25:44 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id gt17sm7633103lab.6.2012.11.27.23.25.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 23:25:40 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1Tdc1Z-0002YJ-Hv; Wed, 28 Nov 2012 09:25:37 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2012 09:25:31 +0200
Message-Id: <1354087531-9781-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libpng: update to upstream version 1.2.50
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
X-List-Received-Date: Wed, 28 Nov 2012 07:40:06 -0000

License md5sum changed only because libpng version numbers and
release dates mentioned in it.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../libpng/{libpng_1.2.49.bb => libpng_1.2.50.bb}          |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.2.49.bb => libpng_1.2.50.bb} (52%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.49.bb b/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
similarity index 52%
rename from meta/recipes-multimedia/libpng/libpng_1.2.49.bb
rename to meta/recipes-multimedia/libpng/libpng_1.2.50.bb
index d33a9f5..211e357 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.2.49.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
@@ -3,15 +3,15 @@ DESCRIPTION = "PNG Library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=20110633230abd47fe8680afa75f1492 \
-                    file://png.h;startline=308;endline=422;md5=edd1c552386a8c3773d90e278ae30891"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c3d807a85c09ebdff087f18b4969ff96 \
+                    file://png.h;startline=310;endline=424;md5=62968b88b0425ceeb919de3fd21b03e5"
 DEPENDS = "zlib"
-PR = "r1"
+PR = "r0"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "d5106b70b4f8b464a7da66bffe4565fb"
-SRC_URI[sha256sum] = "fbf8faa70ebca2ed2ee6df6f2249f4722517b581af5b6c3c71bbdaf925d5954e"
+SRC_URI[md5sum] = "a3e00fccbfe356174ab515b5c00641c7"
+SRC_URI[sha256sum] = "4724f81f8c92ac7f360ad1fbf173396ea7c535923424db9fbaff07bfd9d8e8e7"
 
 inherit autotools binconfig pkgconfig
 
-- 
1.7.10.4



