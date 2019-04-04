Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id E35387D45D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 22:16:55 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id z11so4775452wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 15:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ioUUZBGRteS5T22R/hNDRLSHmEgvF1kfWemI3ZH0niQ=;
	b=DGEOSuTzT4eLwc2JNvaWQdaD6ePSMrT8p4Zx8LsglvpB20HxsNK+WVedAK2OGv4waA
	m3XdrH4598xC3Erika3tcZje36B7OD1c3fW0bNprUcfyVdxO2ZTOku5LymnUe/T5v6jT
	Fa4NcnP24KCrHn8lXWzkIVeaZZb5bTOclMJ0yrCL3qYNl4I1BTn7tqGbTWhD/qEyNdkg
	YZneboTqIG+O7X9JdihTxmSQPj/YdNRWV1BBWC4llfZxbwNi03HN52igOo4+5R4uJCjS
	bWrz4Y15mqE0Hb68LDIVAyKIbT9DMJzG7bhSGHqd+LKfwBGFum5ZUPiadm70dPtX+rvl
	vaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ioUUZBGRteS5T22R/hNDRLSHmEgvF1kfWemI3ZH0niQ=;
	b=stc0+p9ddyNDxbOACuSGDkIVc0HeKuquCy4tAwslUp6/SHyK5PaDzpWeM0PCFLX7Tc
	2UkCwaOCdFAl5K/wp0EJM4ndXaZiQ6fCl0gayFwZ+9hD0XvJeBQ97qslNJCEMgZBwYZa
	TreC9LndJE+IdLAzhMTXZfzDlIDaopN/IKmntcHpQBPnJfTsgEDwdJKM7AXixTig/Q1R
	EcRZtwotTNLnYd4PQAUkEpDa5IxmJ0fOXVXpc0eP6mXxIo5tr7znYaECXzdvvNLGyACi
	o4nmnyn+cR4pDvl0/hqjZI8pmRRoon1wC0fKd6CajSWwr+HBxw0I6QLOSSNEaIW0rBz7
	5K2A==
X-Gm-Message-State: APjAAAXdMmopT8VVw8Bz6dh/rErI7qzQiAogmCPmnrpf4E5f1Il171Qt
	9uvhTJfZi8EqhzKBKpNf2nnzSJXQavg=
X-Google-Smtp-Source: APXvYqxmEg8yJb+C3CaCRjp+9bFlnbPWpo+c3EntYkQZC5MHIomAg2uzvHAd2nCayQUQoNX2dF8VsQ==
X-Received: by 2002:a1c:ac07:: with SMTP id v7mr5994257wme.49.1554416216414;
	Thu, 04 Apr 2019 15:16:56 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d3sm305565wmf.46.2019.04.04.15.16.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Apr 2019 15:16:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2019 23:16:39 +0100
Message-Id: <20190404221644.20496-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190404221644.20496-1-ross.burton@intel.com>
References: <20190404221644.20496-1-ross.burton@intel.com>
Subject: [PATCH v2 4/9] docbook-xsl: use xmlcatalog
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
X-List-Received-Date: Thu, 04 Apr 2019 22:16:56 -0000

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


