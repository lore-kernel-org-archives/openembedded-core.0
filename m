Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 15E2365CC2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 01:18:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9951876"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Aug 2016 09:18:03 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 673DE42BC510
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 09:18:03 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 16 Aug 2016 09:18:01 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Aug 2016 21:17:57 -0400
Message-ID: <1471310277-1300-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 673DE42BC510.A4437
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] bind: 9.10.3-P3 -> 9.11.0b2
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
X-List-Received-Date: Tue, 16 Aug 2016 01:18:03 -0000
Content-Type: text/plain

1) Upgrade bind from 9.10.3-P3 to 9.11.0b2.
2) Delete some patches, since they are no use.
    bind-confgen-build-unix.o-once.patch
    CVE-2016-1285.patch
    CVE-2016-1286_1.patch
    CVE-2016-1286_2.patch
    CVE-2016-2088.patch

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../bind/{bind_9.10.3-P3.bb => bind_9.11.0b2.bb}             | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.10.3-P3.bb => bind_9.11.0b2.bb} (86%)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb b/meta/recipes-connectivity/bind/bind_9.11.0b2.bb
similarity index 86%
rename from meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
rename to meta/recipes-connectivity/bind/bind_9.11.0b2.bb
index a99f0dd..c02d19a 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.3-P3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.0b2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.isc.org/sw/bind/"
 SECTION = "console/network"
 
 LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=0a95f52a0ab6c5f52dedc9a45e7abb3f"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=26895b6b2e11695fb4756065b885d5d9"
 
 DEPENDS = "openssl libcap"
 
@@ -16,19 +16,14 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://named.service \
            file://bind9 \
            file://init.d-add-support-for-read-only-rootfs.patch \
-           file://bind-confgen-build-unix.o-once.patch \
            file://0001-build-use-pkg-config-to-find-libxml2.patch \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            file://0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch \
            file://0001-lib-dns-gen.c-fix-too-long-error.patch \
-           file://CVE-2016-1285.patch \
-           file://CVE-2016-1286_1.patch \
-           file://CVE-2016-1286_2.patch \
-           file://CVE-2016-2088.patch \
            "
 
-SRC_URI[md5sum] = "bcf7e772b616f7259420a3edc5df350a"
-SRC_URI[sha256sum] = "690810d1fbb72afa629e74638d19cd44e28d2b2e5eb63f55c705ad85d1a4cb83"
+SRC_URI[md5sum] = "30db652baa5c227a61f8f4ca9b7ad9c2"
+SRC_URI[sha256sum] = "440e7fa7c4e241c13028699ab107fc4c3efd1719012b1af356d39db5ab49109d"
 
 ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
 EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
@@ -81,7 +76,6 @@ do_install_append() {
 	install -d "${D}${sysconfdir}/init.d"
 	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
 	install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
-	sed -i -e '1s,#!.*python,#! /usr/bin/python3,' ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
 
 	# Install systemd related files
 	install -d ${D}${sbindir}
-- 
2.7.4




