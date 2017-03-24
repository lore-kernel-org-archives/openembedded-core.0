Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 874F577BDB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 16:09:29 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id n11so6123649wma.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 09:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=6pnl4CSB/XT73ppH9d8tDOziW/9cB08kH938y9t+auE=;
	b=tv1HRwCIqoNiij1U/6mrSIhqDBFioOK5z/eOCMPBtEMIpKz+/+cCqb1yG0D6h9vfgz
	Noq8jWELnhie4yCnXXgLeOe+ME/BZ3GiXoqfbtYOw8NU91QJfd5N9G8bnMZ22oCBD3vq
	XKOGfaeZ6XcSzgW/2fQIREsQkbkt7tWTMhP2fNmWQX22vH1c6+A+IweRr9SzXzlsG91k
	MTKljZIfFrcDFILXr/643RH1fn4gIRNk+vjEAVPxBIYoDuW2TwB27wA59ZKVi3y2JOLj
	fnQDp88n/cX73ej4FleKbZY6pJPvDz9CFb9uU67ROHzBRpWLuVKU9VUGF+SyOFrpWNCj
	WpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6pnl4CSB/XT73ppH9d8tDOziW/9cB08kH938y9t+auE=;
	b=G5A2pWMiEhQsTJd+zXp9c/BFzDQ/GO5mKVYZKqOvFC/keLoKiB9RakWfV69e8S+7Fd
	1nkd+OA5Ny1w5m46N3bKIXFG0gS4mhPSWSMLWqdB3iSkVmONWSSb7gyLlOXsK/TAwRGj
	G79/F0ozC3adyI3ljf6xEAjrcGg1ALKCOFTrQQaxJJLKqZC6rtuh3qROQ3Py915jDb9B
	NKGgk2GjhLnz414jOEpkRoS6jCCcmHvABCxir6H1N6JGaD0e0wgR+tMhP0pBpvqewfAi
	D5nbwIoWRPiAiOYlJ835Kmhiaaa1+5xevBCUAkITESJcNqPbu5FoT5gz5fvm54s2Q20w
	vnlA==
X-Gm-Message-State: AFeK/H12wMtFLPgYDRka4o/Z9OJwr9DvfZmJBq+mZrUybif8SaYIEBdUHbHOQK+SOaWObgrQ
X-Received: by 10.28.95.87 with SMTP id t84mr3782284wmb.35.1490371769686;
	Fri, 24 Mar 2017 09:09:29 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	b42sm3447252wra.36.2017.03.24.09.09.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Mar 2017 09:09:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 16:09:27 +0000
Message-Id: <1490371767-30577-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] boost: various cleanups
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
X-List-Received-Date: Fri, 24 Mar 2017 16:09:29 -0000

Re-order some assignments to be logically arranged.

Remove the set -ex statements as they serve no purpose.

Pass --debug-configuration to see what configuration steps boost is taking.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/boost/boost.inc | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index dcadcbc..4ff70e3 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -69,7 +69,6 @@ python __anonymous () {
 }
 
 # Override the contents of specific packages
-FILES_${PN}-graph = "${libdir}/libboost_graph.so.*"
 FILES_${PN}-graph_parallel = "${libdir}/libboost_graph_parallel.so.*"
 FILES_${PN}-locale = "${libdir}/libboost_locale.so.*"
 FILES_${PN}-mpi = "${libdir}/mpi.so ${libdir}/libboost_mpi*.so.*"
@@ -80,15 +79,15 @@ FILES_boost-test = "${libdir}/libboost_prg_exec_monitor*.so.* \
 
 # -dev last to pick up the remaining stuff
 PACKAGES += "${PN}-dev ${PN}-staticdev"
-FILES_${PN} = ""
 FILES_${PN}-dev = "${includedir} ${libdir}/libboost_*.so"
 FILES_${PN}-staticdev = "${libdir}/libboost_*.a"
 
 # "boost" is a metapackage which pulls in all boost librabries
 PACKAGES += "${PN}"
+FILES_${PN} = ""
+ALLOW_EMPTY_${PN} = "1"
 RRECOMMENDS_${PN} += "${BOOST_PACKAGES}"
 RRECOMMENDS_${PN}_class-native = ""
-ALLOW_EMPTY_${PN} = "1"
 
 # to avoid GNU_HASH QA errors added LDFLAGS to ARCH; a little bit dirty but at least it works
 TARGET_CC_ARCH += "${LDFLAGS}"
@@ -196,16 +195,15 @@ do_configure() {
 }
 
 do_compile() {
-	set -ex
 	rm -rf ${S}/${TARGET_SYS}
 	bjam ${BJAM_OPTS} --prefix=${prefix} \
 		--exec-prefix=${exec_prefix} \
 		--libdir=${libdir} \
-		--includedir=${includedir}
+		--includedir=${includedir} \
+		--debug-configuration
 }
 
 do_install() {
-	set -ex
 	bjam ${BJAM_OPTS} \
 		--libdir=${D}${libdir} \
 		--includedir=${D}${includedir} \
-- 
2.8.1


