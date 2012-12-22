Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmS6T-0004uY-GU
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Dec 2012 17:39:21 +0100
Received: by mail-ee0-f42.google.com with SMTP id c41so3028050eek.29
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2012 08:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=W2zz27axY4m+dq7fTvRhYfD3+Y5G/0rBbhoiraT7fKY=;
	b=LxZ2KOI4ZM8RpticBV7dCb2MHpVZC+Q3D0tDqzFF8tAy3DxIzfHS+19AcvjOjNv4Vr
	A5Luc3qebZoJBLOyIbaeUhZ6yxlPtJZ7UR1liIlf66/Xm3AqD5oJjZv6QHZwpDzPS4II
	Z1vhcQCuL5aUCS7b4N+iJ3cMX1d82W4ol4p9qY81x0lSDRlx+VHkzgZo6DxV8335OC1h
	BV+JNFVVatUs3edl/GHyyq0l8SwMEh70ZvAKOZksKBHIBUn8v75fRs61OogtDR8ZnldX
	TxwUF2tYq2CAGnohsBkrkTfF/skSJSK1vJMmoIn8Qqs7THK5fUzFa4D4D2yh4zBDYySk
	x8zA==
X-Received: by 10.14.1.195 with SMTP id 43mr41375465eed.31.1356193466342;
	Sat, 22 Dec 2012 08:24:26 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b2sm29083161eep.9.2012.12.22.08.24.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Dec 2012 08:24:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Dec 2012 17:24:20 +0100
Message-Id: <1356193460-27079-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <20121222161624.GB8988@jama.palm1.palmone.com>
References: <20121222161624.GB8988@jama.palm1.palmone.com>
Subject: [PATCH] libpng: fix packaging
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
X-List-Received-Date: Sat, 22 Dec 2012 16:39:22 -0000

* PN-LIBV is not needed, was used to package libpng12 from libpng3 build
  now only libpng15 is built.
* if you're not using OEBasicHash + PRserv you need to rebuild and
  reinstall a lot of packages to upgrade to libpng-1.5 correctly

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/libpng/libpng_1.5.13.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.5.13.bb b/meta/recipes-multimedia/libpng/libpng_1.5.13.bb
index 28220ad..04bb932 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.5.13.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.5.13.bb
@@ -6,7 +6,7 @@ LICENSE = "Libpng"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=00b5b35853278d508806c2e5860e82cb \
                     file://png.h;beginline=207;endline=321;md5=50e583fb60bb36f37ab5023b2a3715d1"
 DEPENDS = "zlib"
-PR = "r0"
+PR = "r1"
 LIBV = "15"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}.tar.xz"
@@ -16,9 +16,4 @@ SRC_URI[sha256sum] = "b843f9cb01d10ae22acd9aaf58aceaa4a6aeb9cf78943b41588004b271
 
 inherit autotools binconfig pkgconfig
 
-PACKAGES =+ "${PN}${LIBV}"
-
-FILES_${PN}${LIBV} = "${libdir}/libpng${LIBV}${SOLIBS}"
-RPROVIDES_${PN}-dev += "${PN}${LIBV}-dev"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
1.8.0.2



