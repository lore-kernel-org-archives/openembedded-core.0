Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9A0F5609C0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Aug 2014 08:44:17 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s728iHqQ025491 for <openembedded-core@lists.openembedded.org>;
	Sat, 2 Aug 2014 09:44:17 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LtQk15USJHGG
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Aug 2014 09:44:17 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s728iCO1025269
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 2 Aug 2014 09:44:14 +0100
Message-ID: <1406969052.6981.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 02 Aug 2014 09:44:12 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] bdwgc: Upgrade 7.2d -> 7.4.2
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
X-List-Received-Date: Sat, 02 Aug 2014 08:44:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Update the SRC_URI to the new site, same as HOMEPAGE. The libatomic
pieces were removed and some of the READMEs, allowing simplification
of the project license which is clear now.
    
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-support/bdwgc/bdwgc_7.2d.bb b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
similarity index 71%
rename from meta/recipes-support/bdwgc/bdwgc_7.2d.bb
rename to meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
index 2e1a0e5..23ec954 100644
--- a/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
+++ b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
@@ -16,17 +16,15 @@ DESCRIPTION = "The Boehm-Demers-Weiser conservative garbage collector can be\
  by replacing malloc with GC_malloc calls, replacing realloc with GC_realloc\
  calls, and removing free calls."
 
-HOMEPAGE = "http://www.hpl.hp.com/personal/Hans_Boehm/gc/"
+HOMEPAGE = "http://www.hboehm.info/gc/"
 SECTION = "devel"
-LICENSE = "MIT & FSF-Unlimited & GPL-2.0"
-LIC_FILES_CHKSUM = "file://README.QUICK;md5=9b9dd874f6940641b6ab19893ee8f1cc \
-                    file://doc/README;md5=92e7dd0334d1f672b699cd0aca08bef0 \
-                    file://libatomic_ops/doc/LICENSING.txt;md5=607073e04548eac7d1f763e480477bab"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README.QUICK;md5=55f5088f90a982fed7af9a4897047ef7"
 
-SRC_URI = "http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/gc-${PV}.tar.gz"
+SRC_URI = "http://www.hboehm.info/gc/gc_source/gc-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "91340b28c61753a789eb6077675d87d2"
-SRC_URI[sha256sum] = "d9fe0ae8650d43746a48bfb394cab01a319f3809cee19f8ebd16aa985b511c5e"
+SRC_URI[md5sum] = "12c05fd2811d989341d8c6d81f66af87"
+SRC_URI[sha256sum] = "63320ad7c45460e4a40e03f5aa4c6893783f21a16416c3282b994f933312afa2"
 FILES_${PN}-doc = "/usr/share"
 
 REAL_PV = "${@[d.getVar('PV',1)[:-1], d.getVar('PV',1)][(d.getVar('PV',1)[-1]).isdigit()]}"


