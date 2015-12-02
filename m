Return-Path: <fabrice.coulon@axis.com>
X-Greylist: delayed 352 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 02 Dec 2015 09:57:51 UTC
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 66F41601D3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 09:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 522A22E11B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 10:51:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Zok5aqyiSofD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 10:51:56 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id A6F8B2E10A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 10:51:56 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 8BC441507
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 10:51:56 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 7B11811D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 10:51:56 +0100 (CET)
Received: from lnxfabrice2.se.axis.com (lnxfabrice2.se.axis.com [10.92.161.3])
	by seth.se.axis.com (Postfix) with ESMTP id 7677C3E318;
	Wed,  2 Dec 2015 10:51:56 +0100 (CET)
Received: by lnxfabrice2.se.axis.com (Postfix, from userid 9523)
	id BAA2F801E7E; Wed,  2 Dec 2015 10:51:36 +0100 (CET)
From: Fabrice Coulon <fabrice.coulon@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Dec 2015 10:51:23 +0100
Message-Id: <1449049883-22195-1-git-send-email-fabrice.coulon@axis.com>
X-Mailer: git-send-email 1.9.1
Cc: Fabrice Coulon <fabrice@axis.com>
Subject: [PATCH] gstreamer1.0: Convert tests and valgrind config opts to PACKAGECONFIGs
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
X-List-Received-Date: Wed, 02 Dec 2015 09:57:52 -0000

I need to be able to run unit tests and build with valgrind support.

Signed-off-by: Fabrice Coulon <fabrice.coulon@axis.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index aa95d57..5a67bfd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -11,11 +11,12 @@ inherit autotools pkgconfig gettext
 
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[check] = "--enable-check,--disable-check"
+PACKAGECONFIG[tests] = "--enable-tests,--disable-tests"
+PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind"
 
 EXTRA_OECONF = "--disable-docbook --disable-gtk-doc \
                 --disable-dependency-tracking \
-                --disable-examples --disable-tests \
-                --disable-valgrind \
+                --disable-examples \
                 "
 
 RRECOMMENDS_${PN}_qemux86    += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
@@ -26,4 +27,3 @@ CACHED_CONFIGUREVARS += "ac_cv_header_valgrind_valgrind_h=no"
 FILES_${PN} += " ${libdir}/gstreamer-1.0/*.so ${datadir}/bash-completion/completions/ ${datadir}/bash-completion/helpers/gst*"
 FILES_${PN}-dev += " ${libdir}/gstreamer-1.0/*.la ${libdir}/gstreamer-1.0/*.a ${libdir}/gstreamer-1.0/include"
 FILES_${PN}-dbg += " ${libdir}/gstreamer-1.0/.debug/ ${libexecdir}/gstreamer-1.0/.debug/ ${datadir}/bash-completion/helpers/.debug/"
-
-- 
1.9.1


