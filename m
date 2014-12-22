Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3274E72999
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 05:28:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBM5SV0w006895
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 21:28:31 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 21 Dec 2014 21:28:30 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Dec 2014 21:28:24 -0800
Message-ID: <a2337b1a98db213e18084fa5f228639f12de4e79.1419226071.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1419226071.git.liezhi.yang@windriver.com>
References: <cover.1419226071.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] wget: upgrade to 1.16.1
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
X-List-Received-Date: Mon, 22 Dec 2014 05:28:31 -0000
Content-Type: text/plain

* upgrade to 1.16.1
* inherit pkgconfig to fix the error like:a
  | configure.ac:41: error: possibly undefined macro: AC_MSG_NOTICE
  | configure.ac:89: error: possibly undefined macro: AS_IF

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/wget/wget.inc                |    2 +-
 .../wget/{wget_1.16.bb => wget_1.16.1.bb}          |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/wget/{wget_1.16.bb => wget_1.16.1.bb} (45%)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index dc46841..f2e12ef 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -7,7 +7,7 @@ DEPENDS = "gnutls zlib libpcre"
 
 INC_PR = "r16"
 
-inherit autotools gettext texinfo update-alternatives
+inherit autotools gettext texinfo update-alternatives pkgconfig
 
 EXTRA_OECONF = "--enable-ipv6 --with-ssl=gnutls --disable-rpath --disable-iri \
                 --without-libgnutls-prefix ac_cv_header_uuid_uuid_h=no"
diff --git a/meta/recipes-extended/wget/wget_1.16.bb b/meta/recipes-extended/wget/wget_1.16.1.bb
similarity index 45%
rename from meta/recipes-extended/wget/wget_1.16.bb
rename to meta/recipes-extended/wget/wget_1.16.1.bb
index 257b534..ca6f0fe 100644
--- a/meta/recipes-extended/wget/wget_1.16.bb
+++ b/meta/recipes-extended/wget/wget_1.16.1.bb
@@ -2,7 +2,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://fix_makefile.patch \
           "
 
-SRC_URI[md5sum] = "293a37977c41b5522f781d3a3a078426"
-SRC_URI[sha256sum] = "b977fc10ac7a72d987d48136251aeb332f2dced1aabd50d6d56bdf72e2b79101"
+SRC_URI[md5sum] = "5d12410a398ec9907e105e8734561ba0"
+SRC_URI[sha256sum] = "3b834ce69366d4681f295307fce36ee14e122c4ee68a4d1291b62b0b26755a77"
 
 require wget.inc
-- 
1.7.9.5


