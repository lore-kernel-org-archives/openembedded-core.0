Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1StyIU-0004bK-Ks
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 11:54:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6P9gunq021867
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Jul 2012 02:42:56 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Wed, 25 Jul 2012 02:42:56 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <saul.wold@intel.com>
Date: Wed, 25 Jul 2012 17:42:44 +0800
Message-ID: <bfe8ad8a7da3fe6dcde0d745b98c2c43cceacb9c.1343209283.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1343209283.git.kai.kang@windriver.com>
References: <cover.1343209283.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] liburi-perl: update to 1.60
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
X-List-Received-Date: Wed, 25 Jul 2012 09:54:27 -0000
Content-Type: text/plain

Update to 1.60

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../{liburi-perl_1.59.bb => liburi-perl_1.60.bb}   |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/perl/{liburi-perl_1.59.bb => liburi-perl_1.60.bb} (81%)

diff --git a/meta/recipes-devtools/perl/liburi-perl_1.59.bb b/meta/recipes-devtools/perl/liburi-perl_1.60.bb
similarity index 81%
rename from meta/recipes-devtools/perl/liburi-perl_1.59.bb
rename to meta/recipes-devtools/perl/liburi-perl_1.60.bb
index 3916b1e..4eb98b2 100644
--- a/meta/recipes-devtools/perl/liburi-perl_1.59.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_1.60.bb
@@ -4,7 +4,7 @@ and manipulate the various components that make up these strings."
 
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-PR = "r1"
+PR = "r0"
 
 LIC_FILES_CHKSUM = "file://README;beginline=26;endline=30;md5=6c33ae5c87fd1c4897714e122dd9c23d"
 
@@ -12,8 +12,8 @@ DEPENDS += "perl"
 
 SRC_URI = "http://www.cpan.org/authors/id/G/GA/GAAS/URI-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "fecebf8fa20e2d26ea4a1649c095e96e"
-SRC_URI[sha256sum] = "cb88d29b589db8d2adbc4713fd082284cba77883488717375f011bbd13b5cac6"
+SRC_URI[md5sum] = "70f739be8ce28b8baba7c5920ffee4dc"
+SRC_URI[sha256sum] = "1f92d3dc64acb8845e9917c945e22b9a5275aeb9ff924eb7873c3b7a5c0d2377"
 
 S = "${WORKDIR}/URI-${PV}"
 
@@ -25,4 +25,3 @@ do_compile() {
 	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
 	cpan_do_compile
 }
-
-- 
1.7.5.4



