Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZREc-0007l3-3d
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 19:29:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MHPRAp026744
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 10:25:27 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 10:25:26 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 12:36:13 -0500
Message-ID: <cd740c46bb565d8dd2a09a020284c89326801fbd.1308763995.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308763995.git.mark.hatle@windriver.com>
References: <cover.1308763995.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 19/40] liba52: Remove custom -dbg, fall back to default
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
X-List-Received-Date: Wed, 22 Jun 2011 17:29:02 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
index 239c30a..47a9409 100644
--- a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
+++ b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 			file://include/a52.h;beginline=1;endline=12;md5=81152ceb3562bf20a60d1b6018175dd1"
 SECTION = "libs"
 PRIORITY = "optional"
-PR = "r2"
+PR = "r3"
 
 inherit autotools
 
@@ -18,11 +18,9 @@ S = "${WORKDIR}/a52dec-${PV}"
 
 EXTRA_OECONF = " --enable-shared "
 
-PACKAGES =+ "a52dec a52dec-dbg a52dec-doc"
+PACKAGES =+ "a52dec a52dec-doc"
 
 FILES_${PN} = " ${libdir}/liba52.so.0 ${libdir}/liba52.so.0.0.0 " 
 FILES_${PN}-dev = " ${includedir}/a52dec/*.h ${libdir}/liba52.so ${libdir}/liba52.la ${libdir}/liba52.a "
-FILES_${PN}-dbg = " ${libdir}/.debug/*"
 FILES_a52dec = " ${bindir}/* "
-FILES_a52dec-dbg = " ${bindir}/.debug/* "
 FILES_a52dec-doc = " ${mandir}/man1/* "
-- 
1.7.3.4



