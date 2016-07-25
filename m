Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 830F2731C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 08:16:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6P8GeLU009369
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 01:16:40 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jul 2016 01:16:38 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2016 01:16:29 -0700
Message-ID: <56ab9510504b38f1a379667a0ae9d056e8440527.1469431066.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1469431066.git.liezhi.yang@windriver.com>
References: <cover.1469431066.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] gettext: 0.19.6 -> 0.19.8.1
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
X-List-Received-Date: Mon, 25 Jul 2016 08:16:40 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../add-with-bisonlocaledir.patch                                | 0
 .../gettext/{gettext-0.19.6 => gettext-0.19.8.1}/parallel.patch  | 0
 .../gettext/{gettext_0.19.6.bb => gettext_0.19.8.1.bb}           | 9 +++++++--
 3 files changed, 7 insertions(+), 2 deletions(-)
 rename meta/recipes-core/gettext/{gettext-0.19.6 => gettext-0.19.8.1}/add-with-bisonlocaledir.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.19.6 => gettext-0.19.8.1}/parallel.patch (100%)
 rename meta/recipes-core/gettext/{gettext_0.19.6.bb => gettext_0.19.8.1.bb} (93%)

diff --git a/meta/recipes-core/gettext/gettext-0.19.6/add-with-bisonlocaledir.patch b/meta/recipes-core/gettext/gettext-0.19.8.1/add-with-bisonlocaledir.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.19.6/add-with-bisonlocaledir.patch
rename to meta/recipes-core/gettext/gettext-0.19.8.1/add-with-bisonlocaledir.patch
diff --git a/meta/recipes-core/gettext/gettext-0.19.6/parallel.patch b/meta/recipes-core/gettext/gettext-0.19.8.1/parallel.patch
similarity index 100%
rename from meta/recipes-core/gettext/gettext-0.19.6/parallel.patch
rename to meta/recipes-core/gettext/gettext-0.19.8.1/parallel.patch
diff --git a/meta/recipes-core/gettext/gettext_0.19.6.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
similarity index 93%
rename from meta/recipes-core/gettext/gettext_0.19.6.bb
rename to meta/recipes-core/gettext/gettext_0.19.8.1.bb
index 592e4fc..7b8c1e8 100644
--- a/meta/recipes-core/gettext/gettext_0.19.6.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
@@ -15,8 +15,8 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
 	   file://add-with-bisonlocaledir.patch \
 "
 
-SRC_URI[md5sum] = "6d1447f8c5c45c329371ef4bfe7d79a5"
-SRC_URI[sha256sum] = "ed4b4c19bd3a3034eb6769500a3592ff616759ef43cf30586dbb7a17c9dd695d"
+SRC_URI[md5sum] = "97e034cf8ce5ba73a28ff6c3c0638092"
+SRC_URI[sha256sum] = "ff942af0e438ced4a8b0ea4b0b6e0d6d657157c5e2364de57baa279c1c125c43"
 
 PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${STAGING_LIBDIR}/..,--disable-curses,ncurses,"
 
@@ -70,6 +70,11 @@ PACKAGES =+ "gettext-runtime gettext-runtime-dev gettext-runtime-doc"
 
 FILES_${PN} += "${libdir}/${BPN}/*"
 
+# The its/Makefile.am has defined:
+# itsdir = $(pkgdatadir)$(PACKAGE_SUFFIX)/its
+# not itsdir = $(pkgdatadir), so use wildcard to match the version.
+FILES_${PN} += "${datadir}/${BPN}-*/*"
+
 FILES_gettext-runtime = "${bindir}/gettext \
                          ${bindir}/ngettext \
                          ${bindir}/envsubst \
-- 
2.9.0


