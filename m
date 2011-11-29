Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RVJMu-0007A3-Tz
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 09:48:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAT8g9Q2015751
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 00:42:09 -0800 (PST)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 29 Nov 2011 00:42:09 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2011 16:39:00 +0800
Message-ID: <555b0bde6753decc15052179d5559f3cfcd5d48b.1322554339.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1322554339.git.wenzong.fan@windriver.com>
References: <cover.1322554339.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] automake: Extend to provide nativesdk recipe
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
X-List-Received-Date: Tue, 29 Nov 2011 08:48:49 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

[YOCTO #1603]

automake-nativesdk should be added into meta-toolchain.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-devtools/automake/automake.inc       |    2 +-
 meta/recipes-devtools/automake/automake_1.11.1.bb |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/automake/automake.inc b/meta/recipes-devtools/automake/automake.inc
index 370a972..25b0c0e 100644
--- a/meta/recipes-devtools/automake/automake.inc
+++ b/meta/recipes-devtools/automake/automake.inc
@@ -4,7 +4,7 @@ Standards. Automake requires the use of Autoconf."
 LICENSE = "GPLv2"
 HOMEPAGE = "http://www.gnu.org/software/automake/"
 SECTION = "devel"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${GNU_MIRROR}/automake/automake-${PV}.tar.bz2 "
 
diff --git a/meta/recipes-devtools/automake/automake_1.11.1.bb b/meta/recipes-devtools/automake/automake_1.11.1.bb
index 18450a0..ff8353f 100644
--- a/meta/recipes-devtools/automake/automake_1.11.1.bb
+++ b/meta/recipes-devtools/automake/automake_1.11.1.bb
@@ -31,6 +31,7 @@ RDEPENDS_automake-native = "autoconf-native perl-native-runtime"
 
 PATHFIXPATCH = "file://path_prog_fixes.patch"
 PATHFIXPATCH_virtclass-native = ""
+PATHFIXPATCH_virtclass-nativesdk = ""
 
 SRC_URI += "${PATHFIXPATCH} \
 	    file://prefer-cpio-over-pax-for-ustar-archives.patch \
@@ -44,4 +45,4 @@ do_install () {
 	install -d ${D}${datadir}
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.0.4



