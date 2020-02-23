Return-Path: <gzatko@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 93DA360AD8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 13:24:01 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id l5so2961544wrx.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 05:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2r+l3vl4sejLecQDfvMhKa7yAZeTjfpgTMYaIAmVUdI=;
	b=eFGNgNWZBtbAy6NTKYDsRETN2KASStqo7KR9+3KBc7UbLoMw2Q95QWQ20b1pwjYGsN
	9yGB/SZhggQ4l4FCR7kK2B0ANGH4b9RC8jGs5eujzObIwMiXAXyDMiQ0Y6Ym536g/SSH
	mXaiMT4HV6bUEQcijpEjE5wQHRzhoW5y7XmKUcspQPicGWe0pifj93KqrrSuO6qRfhuh
	Rx4YaSPwBTMWuHU9YQpE7ciOtrp5y35dWEH1cIGN8jIGORaqUQoEzB0pB7SM3tmZ6sJd
	/aj1blDLDK+X1/jydDqmayfagfqCqNcoY6UZpLcCk8cdE6IKt0KASopJNtYmVBI1jOIJ
	WM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2r+l3vl4sejLecQDfvMhKa7yAZeTjfpgTMYaIAmVUdI=;
	b=lCx+BPP9+j55sKUr8+/rq+DmmYZqZeojv8l74VSRLeFeoYFVXvunYrphYfyrI32+bL
	6e6P1upCof8Nrr1RXmlvQN+WBJVtM9HiXJlWsxbl4r67/onPB/yLsQFB3NecUhYJ/xVB
	7SopAynPsycs69Xs179odsUw0yQ17b+A5RngZfmJd9ZfkT0HujniKrBCWExle4lYI6VK
	v3r2lpxUVA0rmx2i3VErJp64AdBczlYRal+b2rIDepJhHfy68dxEp+2WQJGUOia3lW+M
	6UW0dLLdmgmlEvleOu0Oed+Uh6ECZaJuc/HyZ013SueXDfi/f8BAddZOR/DpJsMkk9xQ
	tMCg==
X-Gm-Message-State: APjAAAVN7zARv/Te+LGb0tdeCrR9hxwRlF2jf+YpwK5YYIfEt4KIqCZE
	1Jcp5eXjWeUNdIz6hhB+FY1zzjcH
X-Google-Smtp-Source: APXvYqwGB5ZApLP3TM7JPZ+TMSpTO991N753ZvAdeBjF42Pwmj6d1E9DyV5h2wv2Wl4udeIB+NtY7Q==
X-Received: by 2002:adf:9282:: with SMTP id 2mr9135509wrn.124.1582464242034;
	Sun, 23 Feb 2020 05:24:02 -0800 (PST)
Received: from localhost.localdomain ([37.120.221.20])
	by smtp.gmail.com with ESMTPSA id
	d17sm8314816wmb.36.2020.02.23.05.24.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 23 Feb 2020 05:24:01 -0800 (PST)
From: gzatko@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 14:22:57 +0100
Message-Id: <20200223132257.4867-1-gzatko@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: Gregor Zatko <gzatko@gmail.com>, Gregor Zatko <gzatko@zoznam.sk>
Subject: [PATCH] docbook-xml: update recipe to stick with the upstream
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
X-List-Received-Date: Sun, 23 Feb 2020 13:24:02 -0000
Content-Transfer-Encoding: 8bit

From: Gregor Zatko <gzatko@zoznam.sk>

Until now a Debian package has been used as a source.
This change just switches it to project's upstream.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13270

Signed-off-by: Gregor Zatko <gzatko@gmail.com>
---
 .../docbook-xml/docbook-xml-dtd4_4.5.bb       | 60 +++++++++----------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
index 6452c8d99f..dbea697edd 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb
@@ -1,52 +1,50 @@
 SUMMARY = "Document type definitions for verification of XML data files"
 DESCRIPTION = "Document type definitions for verification of XML data \
-files against the DocBook rule set, it ships with the latest DocBook 4.5 \
-XML DTD, as well as a selected set of legacy DTDs for use with older \
-documents, including 4.0, 4.1.2, 4.2, 4.3 and 4.4"
-HOMEPAGE = "http://www.docbook.org/xml/"
+files against the DocBook rule set. It ships with the latest DocBook 4.5 \
+XML DTD."
+HOMEPAGE = "https://www.docbook.org/xml/"
+
+PR = "r1"
 
 LICENSE = "OASIS"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-OASIS;md5=c608985dd5f7f215e669e7639a0b1d2e"
 
+ARCHIVE_NAME = "docbook-xml-${PV}.zip"
+
 # Note: the upstream sources are not distributed with a license file.
 # LICENSE-OASIS is included as a "patch" to workaround this. When
 # upgrading this recipe, please verify whether this is still needed.
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/d/docbook-xml/docbook-xml_${PV}.orig.tar.gz \
-           file://LICENSE-OASIS \
-           file://docbook-xml-update-catalog.xml.patch \
+SRC_URI = "\
+    https://docbook.org/xml/${PV}/${ARCHIVE_NAME} \
+    file://LICENSE-OASIS \
 "
+SRC_URI[md5sum] = "03083e288e87a7e829e437358da7ef9e"
+SRC_URI[sha256sum] = "4e4e037a2b83c98c6c94818390d4bdd3f6e10f6ec62dd79188594e26190dc7b4"
 
-SRC_URI[md5sum] = "487b4d44e15cffb1f4048af23f98208e"
-SRC_URI[sha256sum] = "b0f8edcf697f5318e63dd98c9a931f3fee167af0805ba441db372e0f17b2a44f"
-
-UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/docbook-xml/"
-
-S = "${WORKDIR}/docbook-xml-4.5.c31424"
+UPSTREAM_CHECK_URI = "https://docbook.org/xml/${PV}/"
 
-inherit allarch
+inherit allarch xmlcatalog
 BBCLASSEXTEND = "native"
 
-do_configure (){
-    :
-}
+# the XMLCATALOGS variable is used in xmlcatalog BB class
+XMLCATALOGS = "${sysconfdir}/xml/docbook-xml.xml"
 
-do_compile (){
-    :
-}
+S = "${WORKDIR}"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
 
 do_install () {
+
     install -d ${D}${sysconfdir}/xml/
     xmlcatalog --create --noout ${D}${sysconfdir}/xml/docbook-xml.xml
-
-    for DTDVERSION in 4.0 4.1.2 4.2 4.3 4.4 4.5; do
-        DEST=${datadir}/xml/docbook/schema/dtd/$DTDVERSION
-        install -d -m 755 ${D}$DEST
-        cp -v -R docbook-$DTDVERSION/* ${D}$DEST
-        xmlcatalog --verbose --noout --add nextCatalog unused file://$DEST/catalog.xml ${D}${sysconfdir}/xml/docbook-xml.xml
-    done
+    DEST=${datadir}/xml/docbook/schema/dtd/${PV}
+    install -d -m 755 ${D}$DEST
+    cp -v catalog.xml ${D}$DEST
+    xmlcatalog --verbose --noout --add nextCatalog unused file://$DEST/catalog.xml ${D}${sysconfdir}/xml/docbook-xml.xml
 }
 
-XMLCATALOGS = "${sysconfdir}/xml/docbook-xml.xml"
-inherit xmlcatalog
-
-FILES_${PN} = "${datadir}/* ${sysconfdir}/xml/docbook-xml.xml"
+FILES_${PN} = "\
+    ${datadir}/* \
+    ${XMLCATALOGS} \
+"
-- 
2.25.0


