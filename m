Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TB7rt-0003Mf-0C
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 19:33:53 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 10 Sep 2012 10:21:17 -0700
Received: by mail-we0-f175.google.com with SMTP id r6so1413034wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 10:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=it/51ZcgUSeBj3LrpI/YhrtnFgLxe6J308QgqQ78ZSw=;
	b=o9WxVUXWjx5C6jZT3P/KkcGRwzoKqg/8yFSXbHNNSSIpThcoiElq6TK7c5U/OQwsI3
	BLhpJrd+5Ehm840SFTnF07sjlDlIFFZK7xYSHC/nkKy7FLQ4TfJkLmtDw8ULe9PJI3Ym
	qNO7Xceo7XVq76Ak1+BWLSrvrPs8t/QIRBj6jICeIZaT4h7H7aBXBSEGB47F8vNo38/B
	7KfycRv9qpynV/C33aQJnC9oyuYT08JRYX6nrhb1mcAPfwjrf8PVBlWHZHWiLJZ/D9Mg
	qIDTpkmLe8QEBNLfHnsbWUaDPNdI0xLroPdY1XWh7BbPKbBYzcNDXZTt1kK+nDdiV7/q
	dnlA==
Received: by 10.180.90.104 with SMTP id bv8mr18525631wib.22.1347297684589;
	Mon, 10 Sep 2012 10:21:24 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id r9sm26684729wia.2.2012.09.10.10.21.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Sep 2012 10:21:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Sep 2012 18:20:30 +0100
Message-Id: <1347297632-16529-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347297632-16529-1-git-send-email-ross.burton@intel.com>
References: <1347297632-16529-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkFUvtNxsRYK9mV2tROly1ygA73nxigQTOh74u2l5FUX2+9PkD+ikidUrWpOGvKzoexOU3z
Subject: [PATCH 2/4] libx11-diet: you can't disable UDC, because it's always disabled
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
X-List-Received-Date: Mon, 10 Sep 2012 17:33:53 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
index 6a898b5..4440a80 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
@@ -1,11 +1,11 @@
 require libx11.inc
 
-DESCRIPTION += " Support for UDC, XCMS and XLOCALE is disabled in \
+DESCRIPTION += " Support for XCMS and XLOCALE is disabled in \
 this version."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI += "file://x11_disable_makekeys.patch \
             file://X18NCMSstubs.diff \
@@ -25,6 +25,6 @@ DEPENDS += "libxcb bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
 
 FILESDIR = "${@os.path.dirname(d.getVar('FILE', True))}/libx11"
 
-EXTRA_OECONF += "--disable-udc --disable-xcms --disable-xlocale --with-keysymdefdir=${STAGING_INCDIR}/X11"
+EXTRA_OECONF += "--disable-xcms --disable-xlocale --with-keysymdefdir=${STAGING_INCDIR}/X11"
 CFLAGS += "-D_GNU_SOURCE"
 
-- 
1.7.10



