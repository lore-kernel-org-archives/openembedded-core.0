Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 56E5874702
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 08:11:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="40751983"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jun 2018 16:11:39 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 188874B41E91
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 16:11:34 +0800 (CST)
Received: from localhost.localdomain (10.167.226.122) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 5 Jun 2018 16:11:38 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Jun 2018 16:10:55 +0800
Message-ID: <20180605081056.16610-2-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180605081056.16610-1-hongl.fnst@cn.fujitsu.com>
References: <20180605081056.16610-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.122]
X-yoursite-MailScanner-ID: 188874B41E91.AD5B1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] [PATCH] bind:9.10.6 -> 9.10.7
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
X-List-Received-Date: Tue, 05 Jun 2018 08:11:42 -0000
Content-Type: text/plain

1.Upgrade bind from 9.10.6 to 9.10.7.
2.Update the checksum of LIC_FILES_CHKSUM, since bind has been changed. The lincese has been modified time.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../bind/{bind_9.10.6.bb => bind_9.10.7.bb}                 | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.10.6.bb => bind_9.10.7.bb} (90%)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.6.bb b/meta/recipes-connectivity/bind/bind_9.10.7.bb
similarity index 90%
rename from meta/recipes-connectivity/bind/bind_9.10.6.bb
rename to meta/recipes-connectivity/bind/bind_9.10.7.bb
index 20c8d7b..124968b 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.6.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.isc.org/sw/bind/"
 SECTION = "console/network"
 
 LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=dba46507446198119bcde32a4feaab43"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=c767ea4f3cf1017290d5b799fa929f80"
 
 DEPENDS = "openssl libcap"
 
@@ -15,16 +15,14 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://named.service \
            file://bind9 \
            file://init.d-add-support-for-read-only-rootfs.patch \
-           file://bind-confgen-build-unix.o-once.patch \
            file://0001-build-use-pkg-config-to-find-libxml2.patch \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            file://0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch \
            file://0001-lib-dns-gen.c-fix-too-long-error.patch \
-           file://use-python3-and-fix-install-lib-path.patch \
            "
 
-SRC_URI[md5sum] = "84e663284b17aee0df1ce6f248b137d7"
-SRC_URI[sha256sum] = "17bbcd2bd7b1d32f5ba4b30d5dbe8a39bce200079048073d1e0d050fdf47e69d"
+SRC_URI[md5sum] = "320b9ef5bdf19ef2718a823d9b4243ba"
+SRC_URI[sha256sum] = "e15e70982d966cd4b194ff483f5cc636c0017b054ae2e332ca3f28fe53f11660"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
@@ -36,6 +34,7 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
                  --with-gssapi=no --with-ecdsa=yes \
                  --sysconfdir=${sysconfdir}/bind \
                  --with-openssl=${STAGING_DIR_HOST}${prefix} \
+		--with-eddsa=no \
                "
 
 inherit autotools update-rc.d systemd useradd pkgconfig python3-dir
@@ -67,6 +66,7 @@ PACKAGE_BEFORE_PN += "${PN}-utils"
 FILES_${PN}-utils = "${bindir}/host ${bindir}/dig"
 FILES_${PN}-dev += "${bindir}/isc-config.h"
 FILES_${PN} += "${sbindir}/generate-rndc-key.sh ${PYTHON_SITEPACKAGES_DIR}"
+FILES_${PN} += "/usr/lib/python2.7/site-packages/*"
 
 PACKAGE_BEFORE_PN += "${PN}-libs"
 FILES_${PN}-libs = "${libdir}/*.so*"
@@ -88,7 +88,7 @@ do_install_append() {
 	install -d "${D}${sysconfdir}/init.d"
 	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
 	install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
-	sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
+	sed -i -e '1s,#!.*python,#! /usr/bin/python3,' ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
 
 	# Install systemd related files
 	install -d ${D}${sbindir}
@@ -120,4 +120,3 @@ CONFFILES_${PN} = " \
 	${sysconfdir}/bind/db.local \
 	${sysconfdir}/bind/db.root \
 	"
-
-- 
2.7.4




