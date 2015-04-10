Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B948973D13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 09:30:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3A9UCs9002971
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 02:30:12 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 02:30:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Apr 2015 02:30:02 -0700
Message-ID: <7406c2d4472c879b4c3ff358fdfd02e46ec194e8.1428656126.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1428656126.git.liezhi.yang@windriver.com>
References: <cover.1428656126.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/15] libtool: remove libltdl-dev libltdl-dbg libltdl-staticdev from PACKAGES
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
X-List-Received-Date: Fri, 10 Apr 2015 09:30:10 -0000
Content-Type: text/plain

There should be only one dev and dbg package

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/libtool/libtool-2.4.6.inc |    9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
index 2125de3..6af6923 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
@@ -36,17 +36,10 @@ EXTRA_AUTORECONF = "--exclude=libtoolize"
 
 DEPENDS = "libtool-native"
 
-PACKAGES =+ "libltdl libltdl-dev libltdl-dbg libltdl-staticdev"
+PACKAGES =+ "libltdl"
 FILES_${PN} += "${datadir}/aclocal"
-FILES_${PN}-dev = "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la \
-                ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
-                ${base_libdir}/*.o ${libdir}/${BPN}/*.la ${base_libdir}/*.la"
 
 #FILES_${PN}-dev := "${@oe_filter_out('${datadir}/aclocal', '${FILES_libtool-dev}', d)}"
 FILES_libltdl = "${libdir}/libltdl${SOLIBS}"
-FILES_libltdl-dev = "${libdir}/libltdl${SOLIBSDEV} ${includedir}"
-FILES_libltdl-dev =+ "${libdir}/libltdl.la"
-FILES_libltdl-staticdev = "${libdir}/libltdl.a"
-FILES_libltdl-dbg = "${libdir}/.debug/"
 
 export CONFIG_SHELL="/bin/bash"
-- 
1.7.9.5


