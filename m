Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1RGMBj-0000aq-Mb
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 04:47:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9J2fa7s029080
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 19:41:36 -0700 (PDT)
Received: from localhost (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 18 Oct 2011 19:41:36 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Oct 2011 10:42:40 +0800
Message-ID: <957ba5fda0006e6e885711f0d1c7b1371a6e642f.1318991782.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.1.300.gc565c
In-Reply-To: <cover.1318991782.git.kai.kang@windriver.com>
References: <cover.1318991782.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.225]
Subject: [PATCH 4/5] liburi-perl: update to 1.59
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
X-List-Received-Date: Wed, 19 Oct 2011 02:47:28 -0000
Content-Type: text/plain

Update liburi-perl to 1.59

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../{liburi-perl_1.58.bb => liburi-perl_1.59.bb}   |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/perl/{liburi-perl_1.58.bb => liburi-perl_1.59.bb} (81%)

diff --git a/meta/recipes-devtools/perl/liburi-perl_1.58.bb b/meta/recipes-devtools/perl/liburi-perl_1.59.bb
similarity index 81%
rename from meta/recipes-devtools/perl/liburi-perl_1.58.bb
rename to meta/recipes-devtools/perl/liburi-perl_1.59.bb
index 9b84e2c..877b252 100644
--- a/meta/recipes-devtools/perl/liburi-perl_1.58.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_1.59.bb
@@ -4,7 +4,7 @@ and manipulate the various components that make up these strings."
 
 SECTION = "libs"
 LICENSE = "Artistic | GPLv1+"
-PR = "r2"
+PR = "r0"
 
 LIC_FILES_CHKSUM = "file://README;beginline=26;endline=30;md5=6c33ae5c87fd1c4897714e122dd9c23d"
 
@@ -12,8 +12,8 @@ DEPENDS += "perl"
 
 SRC_URI = "http://www.cpan.org/authors/id/G/GA/GAAS/URI-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "540575aee18616ad9a21e0af7a1e7b18"
-SRC_URI[sha256sum] = "5ddeb8e4707bd4c37a3a60f634de8424e40c85bba98cf6c1053ae5e71c9b8289"
+SRC_URI[md5sum] = "fecebf8fa20e2d26ea4a1649c095e96e"
+SRC_URI[sha256sum] = "cb88d29b589db8d2adbc4713fd082284cba77883488717375f011bbd13b5cac6"
 
 S = "${WORKDIR}/URI-${PV}"
 
-- 
1.7.5.1.300.gc565c



