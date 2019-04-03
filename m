Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 786357D3B9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 17:04:19 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id z11so8335501wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 10:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ioUUZBGRteS5T22R/hNDRLSHmEgvF1kfWemI3ZH0niQ=;
	b=X0t0sj2N5bbb5eVBLRzX94WHiHKs8UYWO7A4G5emVf02S9N32AFSJBDDoPl4XK5P5Z
	eA2ZmNmJXBZozRp47BzYbrvrRw4FIc7sSBwy/Wvpahj5hqGc2SVUTAXm7a5HCrNCt5dW
	WcCHQTdXXJ9D8PMOBFeIQEEy9SgbsoxPAt8weVMwC1BIkSh6/+jmipX1pd5p1exDpjp1
	A1g6jkbuCVpwOA0MVTIVfd8jI/QjkcBpxPJevpuTUWWpINTkG99KtpCxMjILbBE1MHHo
	JKv7HrShfM49xMNH074hykzXA08zyj5kjU2ZcrlK/S/STJdgK00Q+XJe9V/UQ+xOjTWV
	/YBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ioUUZBGRteS5T22R/hNDRLSHmEgvF1kfWemI3ZH0niQ=;
	b=TRNbLT92oMXO7KfKPmtZ5Er5BCQDRCIJH8XgmZXbJL+jlFgMl1XZpxOv/lAIUDmhXe
	VdEmsdZu6b0iiPtc9cp5gtz2l1eSJbJemMu74Ugn6Q5JWymVudiePMgC60DujPP0F4lu
	X3ZbfTHEV8JLLsRTBjN2K7psXvrWKCLp8kRL2AT5OxTAW4OYMb75NOt9yWdVdqhNtjfz
	aObw4ce5UzBg37Fq682CQMulQ26Cki/Ro92um4MiyDp+XUaai8QUb/T+poDoyqunNQ8k
	ZL/jQ9k9pGOQfgzdduBLSrClfiWZdmM8NOPma44WiLKIepzbik8rX3x1nbCaA8G5tldr
	jO4g==
X-Gm-Message-State: APjAAAWJEetkqKuCc8LPQhq28KEJNjBI/hsPTNVwdgmJx8SFNivrUJqD
	/w0UlbQRbe1ldbcaFzA6SGZjcgl6IvU=
X-Google-Smtp-Source: APXvYqwLOgnVkxg/08GoOE2GzfubdEtrcLoGlmku4s0mI//pXa9H4hTsNue6QFpbdh54xnI1W4bwbw==
X-Received: by 2002:a1c:c101:: with SMTP id r1mr711468wmf.123.1554311059965;
	Wed, 03 Apr 2019 10:04:19 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o17sm17362170wrw.73.2019.04.03.10.04.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 10:04:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2019 18:04:07 +0100
Message-Id: <20190403170412.23568-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190403170412.23568-1-ross.burton@intel.com>
References: <20190403170412.23568-1-ross.burton@intel.com>
Subject: [PATCH 4/9] docbook-xsl: use xmlcatalog
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
X-List-Received-Date: Wed, 03 Apr 2019 17:04:20 -0000

There is no need to ship a static catalog that we have to patch, as upstream
comes with a catalog fragment.

Use the xmlcatalog class to register this catalog.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../docbook-xsl-stylesheets/docbook-xsl.xml         |  6 ------
 .../docbook-xml/docbook-xsl-stylesheets_1.79.1.bb   | 21 +++++++--------------
 2 files changed, 7 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl.xml

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl.xml b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl.xml
deleted file mode 100644
index c60555ae149..00000000000
--- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets/docbook-xsl.xml
+++ /dev/null
@@ -1,6 +0,0 @@
-<?xml version="1.0"?>
-<!DOCTYPE catalog PUBLIC "-//OASIS//DTD Entity Resolution XML Catalog V1.0//EN" "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd">
-<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
-<delegateURI uriStartString="http://docbook.sourceforge.net/release/xsl/" catalog="file:///usr/share/xml/docbook/xsl-stylesheets/catalog.xml"/>
-<delegateSystem systemIdStartString="http://docbook.sourceforge.net/release/xsl/" catalog="file:///usr/share/xml/docbook/xsl-stylesheets/catalog.xml"/>
-</catalog>
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
index 036fc15dc9a..ff38e874b3e 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
@@ -4,7 +4,6 @@ LICENSE = "XSL"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6beadd98f9c54ab0c387e14211ee4d0e"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/docbook/docbook-xsl-${PV}.tar.bz2 \
-           file://docbook-xsl.xml \
            file://docbook-xsl-stylesheets-no-bashism-in-docbook-xsl-up.patch \
 "
 
@@ -15,10 +14,11 @@ UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/docbook/files/docbook-xsl/
 # Reject versions ending in .0 as those are release candidates
 UPSTREAM_CHECK_REGEX = "/docbook-xsl/(?P<pver>(\d+[\.\-_]*)+(?!\.0)\.\d+)/"
 
+DEPENDS = "libxml2-native"
+
 S = "${WORKDIR}/docbook-xsl-${PV}"
 
-inherit allarch
-BBCLASSEXTEND = "native"
+inherit allarch xmlcatalog
 
 do_configure (){
 	:
@@ -29,8 +29,6 @@ do_compile (){
 }
 
 do_install () {
-	# Refer to http://www.linuxfromscratch.org/blfs/view/stable/pst/docbook-xsl.html
-	# for details.
 	install -v -m755 -d ${D}${datadir}/xml/docbook/xsl-stylesheets-${PV}
 	ln -s xsl-stylesheets-${PV} ${D}${datadir}/xml/docbook/xsl-stylesheets
 
@@ -44,17 +42,12 @@ do_install () {
 
 	install -d ${D}${docdir}/${BPN}
 	install -v -m644 README RELEASE-NOTES* NEWS* ${D}${docdir}/${BPN}
-
-	install -d ${D}${sysconfdir}/xml/
-	install -m 755  ${WORKDIR}/docbook-xsl.xml ${D}${sysconfdir}/xml/docbook-xsl.xml
-}
-
-do_install_append_class-native () {
-	# Ensure that the catalog file sgml-docbook.cat is properly
-	# updated when the package is installed from sstate cache.
-	sed -i -e "s|file://.*/usr/share/xml|file://${datadir}/xml|g" ${D}${sysconfdir}/xml/docbook-xsl.xml
 }
 
 RDEPENDS_${PN} += "perl"
 FILES_${PN} = "${datadir}/xml/* ${sysconfdir}/xml/docbook-xsl.xml"
 FILES_${PN}-doc = "${datadir}/doc/*"
+
+XMLCATALOGS = "${datadir}/xml/docbook/xsl-stylesheets-${PV}/catalog.xml"
+
+BBCLASSEXTEND = "native"
-- 
2.11.0


