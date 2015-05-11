Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CEBC072E49
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 06:48:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4B6mF1v003363
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 23:48:15 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 10 May 2015 23:48:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 May 2015 23:48:13 -0700
Message-ID: <252b3bc1cc5576e16b13d0121ece472c2f6f830c.1431326848.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1431326848.git.liezhi.yang@windriver.com>
References: <cover.1431326848.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] libpcre: 8.36 -> 8.37
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
X-List-Received-Date: Mon, 11 May 2015 06:48:16 -0000
Content-Type: text/plain

The LICENSE's md5sum has changed mainly because the new version added
this line:
The data in the testdata directory is not copyrighted and is in the
public domain.

The license is the same, so just update the md5sum.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../libpcre/{libpcre_8.36.bb => libpcre_8.37.bb}   |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.36.bb => libpcre_8.37.bb} (91%)

diff --git a/meta/recipes-support/libpcre/libpcre_8.36.bb b/meta/recipes-support/libpcre/libpcre_8.37.bb
similarity index 91%
rename from meta/recipes-support/libpcre/libpcre_8.36.bb
rename to meta/recipes-support/libpcre/libpcre_8.37.bb
index a4b7f6d..bcfc9e9 100644
--- a/meta/recipes-support/libpcre/libpcre_8.36.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.37.bb
@@ -6,7 +6,7 @@ SUMMARY = "Perl Compatible Regular Expressions"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=ded617e975f28e15952dc68b84a7ac1a"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=7e4937814aee14758c1c95b59c80c44d"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.tar.bz2 \
            file://pcre-cross.patch \
            file://fix-pcre-name-collision.patch \
@@ -14,8 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.tar.bz2 \
            file://Makefile \
 "
 
-SRC_URI[md5sum] = "b767bc9af0c20bc9c1fe403b0d41ad97"
-SRC_URI[sha256sum] = "ef833457de0c40e82f573e34528f43a751ff20257ad0e86d272ed5637eb845bb"
+SRC_URI[md5sum] = "ed91be292cb01d21bc7e526816c26981"
+SRC_URI[sha256sum] = "51679ea8006ce31379fb0860e46dd86665d864b5020fc9cd19e71260eef4789d"
 
 S = "${WORKDIR}/pcre-${PV}"
 
-- 
1.7.9.5


