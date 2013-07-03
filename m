Return-Path: <net147@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 835286A464
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 23:34:56 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz11so709913pad.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2013 16:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=PPGKdPfpmUFha9jMCBGndKlD0XPlon5vY+mOmZfr0ko=;
	b=VdhnTiIIS3G+rocxQRQIRbrDo9MSo74OpPQUuSSsba6hoYDEfin73HMmZyi1BHcAz4
	Tz6vfA/iGETZyeJnsTFewfyjPGlPqALemKFccV4nGwAo7jDjHllZV9m6TsloRTuKNnqj
	Ac53Bz6YKvM49OtDe4nSfARR2sGFeWZP3Ou+V7llxLOQNGP3qQiFjlhnnB81uvkopAD5
	9+MdQ++6u+X8GR/z6XNvt5S/bX6M29WTyA3Xc8658AogZw+HdUbShNV42jr7pBQvLNE5
	DqUYcmUmFEl+hR8yy4lIL8A0vseSzGDnYreVEtRK+UnRKMh5tE+Slwn3VV7c82StsGw5
	uZOw==
X-Received: by 10.66.159.105 with SMTP id xb9mr4417974pab.146.1372894497477;
	Wed, 03 Jul 2013 16:34:57 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id mr3sm258048pbb.27.2013.07.03.16.34.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Jul 2013 16:34:56 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2013 09:50:32 +1000
Message-Id: <1372895432-30904-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH v2] qt4: upgrade to 4.8.5
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
X-List-Received-Date: Wed, 03 Jul 2013 23:34:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Removed patches integrated upstream.
Added INSANE_SKIP libdir for examples packages as it includes plugin
shared libraries outside of libdir.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc        |   2 +-
 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.4.bb   |   8 --
 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bb   |   8 ++
 ...acklist-mis-issued-turktrust-certificates.patch | 108 ---------------
 ...qtnetwork-blacklist-two-more-certificates.patch |  41 ------
 ...ange-all-shmget-calls-to-user-only-memory.patch | 147 ---------------------
 ...emove-unnecessary-typedef-found-by-gcc4-8.patch |  37 ------
 ...verwrite-QMAKE_QT_CONFIG-with-empty-value.patch |  39 ------
 .../qt4/{qt4-4.8.4.inc => qt4-4.8.5.inc}           |  11 +-
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |   0
 ...tty_qws-fix-build-with-old-kernel-headers.patch |   0
 ...003-webkit2-set-OUTPUT_DIR-value-if-empty.patch |   0
 ...make-is-already-built-in-qt4-tools-native.patch |   0
 ...e-set-LFLAGS-to-pick-up-zlib-from-staging.patch |   0
 ...se-OE_QMAKE_-values-to-specify-Qt-utility.patch |   0
 ...-const-usage-that-causes-compile-failure-.patch |   0
 ...llow-building-a-separate-qmake-for-the-ta.patch |   0
 ...e-fix-source-file-references-in-qmake.pri.patch |   0
 ...ack-to-not-use-the-pg_config-of-the-host-.patch |   0
 .../0011-freetype-host-includes.patch              |   0
 .../0012-Add-2bpp-support.patch                    |   0
 .../0013-configure-add-crossarch-option.patch      |   0
 ...tions-fix-phony-translation-linking-error.patch |   0
 ...-configure-add-nostrip-for-debug-packages.patch |   0
 .../0016-configure-eval-QMAKE_CXX.patch            |   0
 ...nsure-we-identify-the-compiler-as-g-in-co.patch |   0
 ...ure-make-pulseaudio-a-configurable-option.patch |   0
 ...xes-for-gcc-4.7.0-particularly-on-qemux86.patch |   0
 ...0020-webkit-disable-the-fuse-ld-gold-flag.patch |   0
 ...ake-qt4-native-work-with-long-building-pa.patch |   0
 .../qt4/{qt4-4.8.4 => qt4-4.8.5}/g++.conf          |   0
 .../qt4/{qt4-4.8.4 => qt4-4.8.5}/linux.conf        |   0
 .../recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/qte.sh |   0
 ...qt4-embedded_4.8.4.bb => qt4-embedded_4.8.5.bb} |   0
 meta/recipes-qt/qt4/qt4-native.inc                 |   3 +-
 meta/recipes-qt/qt4/qt4-native_4.8.4.bb            |   8 --
 meta/recipes-qt/qt4/qt4-native_4.8.5.bb            |   8 ++
 ...qt4-x11-free_4.8.4.bb => qt4-x11-free_4.8.5.bb} |   0
 meta/recipes-qt/qt4/qt4.inc                        |   2 +
 39 files changed, 23 insertions(+), 399 deletions(-)
 delete mode 100644 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.4.bb
 create mode 100644 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bb
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.4/0022-ssl-certificates-blacklist-mis-issued-turktrust-certificates.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.4/0023-qtnetwork-blacklist-two-more-certificates.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.4/0024-Change-all-shmget-calls-to-user-only-memory.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.4/0025-Remove-unnecessary-typedef-found-by-gcc4-8.patch
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.4/0026-Don-t-overwrite-QMAKE_QT_CONFIG-with-empty-value.patch
 rename meta/recipes-qt/qt4/{qt4-4.8.4.inc => qt4-4.8.5.inc} (79%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/0009-qmake-fix-source-file-references-in-qmake.pri.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/0011-freetype-host-includes.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/0012-Add-2bpp-support.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/0013-configure-add-crossarch-option.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/0014-translations-fix-phony-translation-linking-error.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/0015-configure-add-nostrip-for-debug-packages.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/0016-configure-eval-QMAKE_CXX.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/0018-configure-make-pulseaudio-a-configurable-option.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/0020-webkit-disable-the-fuse-ld-gold-flag.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/0021-configure-make-qt4-native-work-with-long-building-pa.patch (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/g++.conf (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/linux.conf (100%)
 rename meta/recipes-qt/qt4/{qt4-4.8.4 => qt4-4.8.5}/qte.sh (100%)
 rename meta/recipes-qt/qt4/{qt4-embedded_4.8.4.bb => qt4-embedded_4.8.5.bb} (100%)
 delete mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.4.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.5.bb
 rename meta/recipes-qt/qt4/{qt4-x11-free_4.8.4.bb => qt4-x11-free_4.8.5.bb} (100%)

diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
index 3a825d8..a9ec61e 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
@@ -10,7 +10,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt4-${PV}:"
 
 inherit nativesdk qmake2
 
-SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-everywhere-opensource-src-${PV}.tar.gz \
            file://0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
            file://0004-configure-qmake-is-already-built-in-qt4-tools-native.patch \
            file://0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch \
diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.4.bb b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.4.bb
deleted file mode 100644
index 27d58d1..0000000
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require nativesdk-qt4-tools.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://0009-qmake-fix-source-file-references-in-qmake.pri.patch"
-
-SRC_URI[md5sum] = "89c5ecba180cae74c66260ac732dc5cb"
-SRC_URI[sha256sum] = "33b0e38ba4c54a0cf8a4be8ca5a4584f1c2e0adfecb57b21d9d1d267b0093270"
diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bb b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bb
new file mode 100644
index 0000000..6a7eefe
--- /dev/null
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bb
@@ -0,0 +1,8 @@
+require nativesdk-qt4-tools.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://0009-qmake-fix-source-file-references-in-qmake.pri.patch"
+
+SRC_URI[md5sum] = "1864987bdbb2f58f8ae8b350dfdbe133"
+SRC_URI[sha256sum] = "eb728f8268831dc4373be6403b7dd5d5dde03c169ad6882f9a8cb560df6aa138"
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0022-ssl-certificates-blacklist-mis-issued-turktrust-certificates.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0022-ssl-certificates-blacklist-mis-issued-turktrust-certificates.patch
deleted file mode 100644
index 8caef97..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.4/0022-ssl-certificates-blacklist-mis-issued-turktrust-certificates.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 451462b1e0304e0cb6c2872e4f5688bc2e556dca Mon Sep 17 00:00:00 2001
-From: Peter Hartmann <phartmann@rim.com>
-Date: Fri, 4 Jan 2013 11:06:14 +0100
-Subject: [PATCH] SSL certificates: blacklist mis-issued Turktrust certificates
-
-Those certificates have erroneously set the CA attribute to true,
-meaning everybody in possesion of their keys can issue certificates on
-their own.
-
-backport of bf5e7fb2652669599a508e049b46ebd5cd3206e5 from qtbase
-
-Task-number: QTBUG-28937
-Change-Id: Iee57c6f983fee61c13c3b66ed874300ef8e80c23
-Reviewed-by: Richard J. Moore <rich@kde.org>
-
-Upstream-Status: Accepted https://codereview.qt-project.org/#change,43968
----
- src/network/ssl/qsslcertificate.cpp                |    3 ++
- ...ted-turktrust-e-islem.kktcmerkezbankasi.org.pem |   24 +++++++++++++++
- .../blacklisted-turktrust-ego.gov.tr.pem           |   31 ++++++++++++++++++++
- 3 files changed, 58 insertions(+), 0 deletions(-)
- create mode 100644 tests/auto/qsslcertificate/more-certificates/blacklisted-turktrust-e-islem.kktcmerkezbankasi.org.pem
- create mode 100644 tests/auto/qsslcertificate/more-certificates/blacklisted-turktrust-ego.gov.tr.pem
-
-diff --git a/src/network/ssl/qsslcertificate.cpp b/src/network/ssl/qsslcertificate.cpp
-index 038187f..37799d1 100644
---- a/src/network/ssl/qsslcertificate.cpp
-+++ b/src/network/ssl/qsslcertificate.cpp
-@@ -825,6 +825,9 @@ static const char *certificate_blacklist[] = {
- 
-     "120001705", "Digisign Server ID (Enrich)", // (Malaysian) Digicert Sdn. Bhd. cross-signed by Verizon CyberTrust
-     "1276011370", "Digisign Server ID - (Enrich)", // (Malaysian) Digicert Sdn. Bhd. cross-signed by Entrust
-+
-+    "2087",                                            "*.EGO.GOV.TR", // Turktrust mis-issued intermediate certificate
-+    "2148",                                            "e-islem.kktcmerkezbankasi.org", // Turktrust mis-issued intermediate certificate
-     0
- };
- 
-diff --git a/tests/auto/qsslcertificate/more-certificates/blacklisted-turktrust-e-islem.kktcmerkezbankasi.org.pem b/tests/auto/qsslcertificate/more-certificates/blacklisted-turktrust-e-islem.kktcmerkezbankasi.org.pem
-new file mode 100644
-index 0000000..33f2ef4
---- /dev/null
-+++ b/tests/auto/qsslcertificate/more-certificates/blacklisted-turktrust-e-islem.kktcmerkezbankasi.org.pem
-@@ -0,0 +1,24 @@
-+-----BEGIN CERTIFICATE-----
-+MIID8DCCAtigAwIBAgICCGQwDQYJKoZIhvcNAQEFBQAwgawxPTA7BgNVBAMMNFTD
-+nFJLVFJVU1QgRWxla3Ryb25payBTdW51Y3UgU2VydGlmaWthc8SxIEhpem1ldGxl
-+cmkxCzAJBgNVBAYTAlRSMV4wXAYDVQQKDFVUw5xSS1RSVVNUIEJpbGdpIMSwbGV0
-+acWfaW0gdmUgQmlsacWfaW0gR8O8dmVubGnEn2kgSGl6bWV0bGVyaSBBLsWeLiAo
-+YykgS2FzxLFtICAyMDA1MB4XDTExMDgwODA3MDc1MVoXDTIxMDgwNTA3MDc1MVow
-+gaMxCzAJBgNVBAYTAlRSMRAwDgYDVQQIEwdMZWZrb3NhMRAwDgYDVQQHEwdMZWZr
-+b3NhMRwwGgYDVQQKExNLS1RDIE1lcmtleiBCYW5rYXNpMSYwJAYDVQQDEx1lLWlz
-+bGVtLmtrdGNtZXJrZXpiYW5rYXNpLm9yZzEqMCgGCSqGSIb3DQEJARYbaWxldGlA
-+a2t0Y21lcmtlemJhbmthc2kub3JnMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
-+CgKCAQEAw1hUpuRFY67NsZ6C9rzRAPCb9RVpi4nZzJIA1TvIfr4hMPM0X5jseMf5
-+GvgJQ+cBMZtooDd7BbZNy2z7O5A+8PYFaMDdokCENx2ePIqAVuO6C5UAqM7J3n6R
-+rhjOvqiw6dTQMbtXhjFao+YMuBVvRuuhGHBDK3Je64T/KLzcmAUlRJEuy+ZMe7Aa
-+tUaSDr/jy5DMA5xEYOdsnS5Zo30lRG+9vqbxb8CQi+E97sNjY+W4lEgJKQWMNh5r
-+Cxo4Hinkm3CKyKX3PAS+DDVI3LQiCiIQUOMA2+1P5aTPTkpqlbjqhbWTWAPWOKCF
-+9d83p3RMXOYt5GahS8rg5u6+toEC1QIDAQABoyMwITAOBgNVHQ8BAf8EBAMCAQYw
-+DwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQUFAAOCAQEAwjWz5tsUvYORVW8K
-+JSK/biHFrAnFotMtoTKEewRmnYaYjwXIr1IPaBqhjkGGviLN2eOH/v97Uli6HC4l
-+zhKHfMQUS9KF/f5nGcH8iQBy/gmFsfJQ1KDC6GNM4CfMGIzyxjYhP0VzdUtKX3PA
-+l5EqgMUcdqRDy6Ruz55+JkdvCL1nAC7xH+czJcZVwysTdGfLTCh6VtYPgIkeL6U8
-+3xQAyMuOHm72exJljYFqIsiNvGE0KufCqCuH1PD97IXMrLlwGmKKg5jP349lySBp
-+Jjm6RDqCTT+6dUl2jkVbeNmco99Y7AOdtLsOdXBMCo5x8lK8zwQWFrzEms0joHXC
-+pWfGWA==
-+-----END CERTIFICATE-----
-diff --git a/tests/auto/qsslcertificate/more-certificates/blacklisted-turktrust-ego.gov.tr.pem b/tests/auto/qsslcertificate/more-certificates/blacklisted-turktrust-ego.gov.tr.pem
-new file mode 100644
-index 0000000..e9d048f
---- /dev/null
-+++ b/tests/auto/qsslcertificate/more-certificates/blacklisted-turktrust-ego.gov.tr.pem
-@@ -0,0 +1,31 @@
-+-----BEGIN CERTIFICATE-----
-+MIIFPTCCBCWgAwIBAgICCCcwDQYJKoZIhvcNAQEFBQAwgawxPTA7BgNVBAMMNFTD
-+nFJLVFJVU1QgRWxla3Ryb25payBTdW51Y3UgU2VydGlmaWthc8SxIEhpem1ldGxl
-+cmkxCzAJBgNVBAYTAlRSMV4wXAYDVQQKDFVUw5xSS1RSVVNUIEJpbGdpIMSwbGV0
-+acWfaW0gdmUgQmlsacWfaW0gR8O8dmVubGnEn2kgSGl6bWV0bGVyaSBBLsWeLiAo
-+YykgS2FzxLFtICAyMDA1MB4XDTExMDgwODA3MDc1MVoXDTIxMDcwNjA3MDc1MVow
-+bjELMAkGA1UEBhMCVFIxDzANBgNVBAgMBkFOS0FSQTEPMA0GA1UEBwwGQU5LQVJB
-+MQwwCgYDVQQKDANFR08xGDAWBgNVBAsMD0VHTyBCSUxHSSBJU0xFTTEVMBMGA1UE
-+AwwMKi5FR08uR09WLlRSMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
-+v5zoj2Bpdl7R1M/zF6Qf4su2F8vDqISKvuTuyJhNAHhFGHCsHjaixGMHspuz0l3V
-+50kq/ECWbN8kKaeTrB112QOrWTU276iup1Gh+OlEOiR9vlQ4VAP00dWUjD6z9HQF
-+Ci8W3EsEtiiHiYOU9BcPpPkaUbECwP4nGVwR8aPwhB5PGBJc98romdvciYkUpSOO
-+wkuSRtooA7tRlLFu72QaNpXN1NueB36I3aajPk0YyiXy2w8XlgK7QI4PSSBnSq+Q
-+blFocWVmLhF94je7py6lCnllrIFXpR3FWZLD5GcI6HKlBS78AQ+IMBLFHhsEVw5N
-+Qj90chSZClfBWBZzIaV9RwIDAQABo4IBpDCCAaAwHwYDVR0jBBgwFoAUq042AzDS
-+29UKaL6HpVBs/PZwpSUwHQYDVR0OBBYEFGT7G4Y9uEryRIL5Vj3qJsD047M0MA4G
-+A1UdDwEB/wQEAwIBBjBFBgNVHSAEPjA8MDoGCWCGGAMAAwEBATAtMCsGCCsGAQUF
-+BwIBFh9odHRwOi8vd3d3LnR1cmt0cnVzdC5jb20udHIvc3VlMA8GA1UdEwEB/wQF
-+MAMBAf8wSQYDVR0fBEIwQDA+oDygOoY4aHR0cDovL3d3dy50dXJrdHJ1c3QuY29t
-+LnRyL3NpbC9UVVJLVFJVU1RfU1NMX1NJTF9zMi5jcmwwgaoGCCsGAQUFBwEBBIGd
-+MIGaMG4GCCsGAQUFBzAChmJodHRwOi8vd3d3LnR1cmt0cnVzdC5jb20udHIvc2Vy
-+dGlmaWthbGFyL1RVUktUUlVTVF9FbGVrdHJvbmlrX1N1bnVjdV9TZXJ0aWZpa2Fz
-+aV9IaXptZXRsZXJpX3MyLmNydDAoBggrBgEFBQcwAYYcaHR0cDovL29jc3AudHVy
-+a3RydXN0LmNvbS50cjANBgkqhkiG9w0BAQUFAAOCAQEAj89QCCyoW0S20EcYDZAn
-+vFLFmougK97Bt68iV1OM622+Cyeyf4Sz+1LBk1f9ni3fGT0Q+RWZJYWq5YuSBiLV
-+gk3NLcxnwe3wmnvErUgq1QDtAaNlBWMEMklOlWGfJ0eWaillUskJbDd4KwgZHDEj
-+7g/jYEQqU1t0zoJdwM/zNsnLHkhwcWZ5PQnnbpff1Ct/1LH/8pdy2eRDmRmqniLU
-+h8r2lZfJeudVZG6yIbxsqP3t2JCq5c2P1jDhAGF3g9DiskH0CzsRdbVpoWdr+PY1
-+Xz/19G8XEpX9r+IBJhLdbkpVo0Qh0A10mzFP/GUk5f/8nho2HvLaVMhWv1qKcF8I
-+hQ==
-+-----END CERTIFICATE-----
--- 
-1.7.1
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0023-qtnetwork-blacklist-two-more-certificates.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0023-qtnetwork-blacklist-two-more-certificates.patch
deleted file mode 100644
index 54171f7..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.4/0023-qtnetwork-blacklist-two-more-certificates.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 180bf94c241728dd6d6f100437914d3cb11cbc30 Mon Sep 17 00:00:00 2001
-From: Martin Petersson <Martin.Petersson@nokia.com>
-Date: Wed, 7 Mar 2012 12:05:59 +0100
-Subject: [PATCH] QtNetwork: blacklist two more certificates
-
-The comodogate 72:03:21:05:c5:0c:08:57:3d:8e:a5:30:4e:fe:e8:b0
-certificate is a test certificate and the MD5 Collisions was created
-as a proof of concept deliberately made to be expired at the time
-of it's creation.
-
-Task-number: QTBUG-24654
-(cherry picked from commit 4c0df9feb2b44d0c4fcaa5076f00aa08fbc1dda5)
-
-Signed-off-by: Peter Hartmann <phartmann@rim.com>
-
-Apparently this commit was forgotten to cherry-pick to Qt 4.
-
-Change-Id: I86949eaa3c02483b0b66b4a620bfa88aaa9aa99b
-Reviewed-by: Richard J. Moore <rich@kde.org>
-
-Upstream-Status: Accepted https://codereview.qt-project.org/#change,43992
----
- src/network/ssl/qsslcertificate.cpp |    2 ++
- 1 files changed, 2 insertions(+), 0 deletions(-)
-
-diff --git a/src/network/ssl/qsslcertificate.cpp b/src/network/ssl/qsslcertificate.cpp
-index 37799d1..300a261 100644
---- a/src/network/ssl/qsslcertificate.cpp
-+++ b/src/network/ssl/qsslcertificate.cpp
-@@ -825,6 +825,8 @@ static const char *certificate_blacklist[] = {
- 
-     "120001705", "Digisign Server ID (Enrich)", // (Malaysian) Digicert Sdn. Bhd. cross-signed by Verizon CyberTrust
-     "1276011370", "Digisign Server ID - (Enrich)", // (Malaysian) Digicert Sdn. Bhd. cross-signed by Entrust
-+    "72:03:21:05:c5:0c:08:57:3d:8e:a5:30:4e:fe:e8:b0", "UTN-USERFirst-Hardware", // comodogate test certificate
-+    "41",                                              "MD5 Collisions Inc. (http://www.phreedom.org/md5)", // http://www.phreedom.org/research/rogue-ca/
- 
-     "2087",                                            "*.EGO.GOV.TR", // Turktrust mis-issued intermediate certificate
-     "2148",                                            "e-islem.kktcmerkezbankasi.org", // Turktrust mis-issued intermediate certificate
--- 
-1.7.1
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0024-Change-all-shmget-calls-to-user-only-memory.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0024-Change-all-shmget-calls-to-user-only-memory.patch
deleted file mode 100644
index 6c796a3..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.4/0024-Change-all-shmget-calls-to-user-only-memory.patch
+++ /dev/null
@@ -1,147 +0,0 @@
-From 20b26bdb3dd5e46b01b9a7e1ce8342074df3c89c Mon Sep 17 00:00:00 2001
-From: Thiago Macieira <thiago.macieira@intel.com>
-Date: Sat, 22 Dec 2012 08:32:12 -0800
-Subject: [PATCH] Change all shmget calls to user-only memory
-
-Drop the read and write permissions for group and other users in the
-system.
-
-Change-Id: I8fc753f09126651af3fb82df3049050f0b14e876
-(cherry-picked from Qt 5 commit 856f209fb63ae336bfb389a12d2a75fa886dc1c5)
-Reviewed-by: Richard J. Moore <rich@kde.org>
-
-Upstream-Status: Accepted http://qt.gitorious.org/qt/qt/commit/20b26bdb3dd5e46b01b9a7e1ce8342074df3c89c
----
- src/corelib/kernel/qsharedmemory_unix.cpp          |    6 +++---
- src/corelib/kernel/qsystemsemaphore_unix.cpp       |    4 ++--
- src/gui/image/qnativeimage.cpp                     |    2 +-
- src/gui/image/qpixmap_x11.cpp                      |    2 +-
- src/plugins/platforms/xcb/qxcbwindowsurface.cpp    |    2 +-
- src/plugins/platforms/xlib/qxlibwindowsurface.cpp  |    2 +-
- .../auto/qtipc/qsharedmemory/tst_qsharedmemory.cpp |    2 +-
- tools/qvfb/qvfbshmem.cpp                           |    4 ++--
- 8 files changed, 12 insertions(+), 12 deletions(-)
-
-diff --git a/src/corelib/kernel/qsharedmemory_unix.cpp b/src/corelib/kernel/qsharedmemory_unix.cpp
-index 20d76e3..4cf3acf 100644
---- a/src/corelib/kernel/qsharedmemory_unix.cpp
-+++ b/src/corelib/kernel/qsharedmemory_unix.cpp
-@@ -238,7 +238,7 @@ bool QSharedMemoryPrivate::create(int size)
-     }
- 
-     // create
--    if (-1 == shmget(unix_key, size, 0666 | IPC_CREAT | IPC_EXCL)) {
-+    if (-1 == shmget(unix_key, size, 0600 | IPC_CREAT | IPC_EXCL)) {
-         QString function = QLatin1String("QSharedMemory::create");
-         switch (errno) {
-         case EINVAL:
-@@ -293,7 +293,7 @@ bool QSharedMemoryPrivate::attach(QSharedMemory::AccessMode mode)
- {
- #ifndef QT_POSIX_IPC
-     // grab the shared memory segment id
--    int id = shmget(unix_key, 0, (mode == QSharedMemory::ReadOnly ? 0444 : 0660));
-+    int id = shmget(unix_key, 0, (mode == QSharedMemory::ReadOnly ? 0400 : 0600));
-     if (-1 == id) {
-         setErrorString(QLatin1String("QSharedMemory::attach (shmget)"));
-         return false;
-@@ -381,7 +381,7 @@ bool QSharedMemoryPrivate::detach()
-     size = 0;
- 
-     // Get the number of current attachments
--    int id = shmget(unix_key, 0, 0444);
-+    int id = shmget(unix_key, 0, 0400);
-     cleanHandle();
- 
-     struct shmid_ds shmid_ds;
-diff --git a/src/corelib/kernel/qsystemsemaphore_unix.cpp b/src/corelib/kernel/qsystemsemaphore_unix.cpp
-index fad9acc..e77456b 100644
---- a/src/corelib/kernel/qsystemsemaphore_unix.cpp
-+++ b/src/corelib/kernel/qsystemsemaphore_unix.cpp
-@@ -153,10 +153,10 @@ key_t QSystemSemaphorePrivate::handle(QSystemSemaphore::AccessMode mode)
-     }
- 
-     // Get semaphore
--    semaphore = semget(unix_key, 1, 0666 | IPC_CREAT | IPC_EXCL);
-+    semaphore = semget(unix_key, 1, 0600 | IPC_CREAT | IPC_EXCL);
-     if (-1 == semaphore) {
-         if (errno == EEXIST)
--            semaphore = semget(unix_key, 1, 0666 | IPC_CREAT);
-+            semaphore = semget(unix_key, 1, 0600 | IPC_CREAT);
-         if (-1 == semaphore) {
-             setErrorString(QLatin1String("QSystemSemaphore::handle"));
-             cleanHandle();
-diff --git a/src/gui/image/qnativeimage.cpp b/src/gui/image/qnativeimage.cpp
-index 9654afe..fef38c5 100644
---- a/src/gui/image/qnativeimage.cpp
-+++ b/src/gui/image/qnativeimage.cpp
-@@ -176,7 +176,7 @@ QNativeImage::QNativeImage(int width, int height, QImage::Format format,bool /*
- 
-     bool ok;
-     xshminfo.shmid = shmget(IPC_PRIVATE, xshmimg->bytes_per_line * xshmimg->height,
--                            IPC_CREAT | 0777);
-+                            IPC_CREAT | 0700);
-     ok = xshminfo.shmid != -1;
-     if (ok) {
-         xshmimg->data = (char*)shmat(xshminfo.shmid, 0, 0);
-diff --git a/src/gui/image/qpixmap_x11.cpp b/src/gui/image/qpixmap_x11.cpp
-index 280d8bd..88c9b7b 100644
---- a/src/gui/image/qpixmap_x11.cpp
-+++ b/src/gui/image/qpixmap_x11.cpp
-@@ -193,7 +193,7 @@ static bool qt_create_mitshm_buffer(const QPaintDevice* dev, int w, int h)
-     bool ok;
-     xshminfo.shmid = shmget(IPC_PRIVATE,
-                              xshmimg->bytes_per_line * xshmimg->height,
--                             IPC_CREAT | 0777);
-+                             IPC_CREAT | 0700);
-     ok = xshminfo.shmid != -1;
-     if (ok) {
-         xshmimg->data = (char*)shmat(xshminfo.shmid, 0, 0);
-diff --git a/src/plugins/platforms/xcb/qxcbwindowsurface.cpp b/src/plugins/platforms/xcb/qxcbwindowsurface.cpp
-index b6a42d8..0d56821 100644
---- a/src/plugins/platforms/xcb/qxcbwindowsurface.cpp
-+++ b/src/plugins/platforms/xcb/qxcbwindowsurface.cpp
-@@ -98,7 +98,7 @@ QXcbShmImage::QXcbShmImage(QXcbScreen *screen, const QSize &size, uint depth, QI
-                                           0);
- 
-     m_shm_info.shmid = shmget (IPC_PRIVATE,
--          m_xcb_image->stride * m_xcb_image->height, IPC_CREAT|0777);
-+          m_xcb_image->stride * m_xcb_image->height, IPC_CREAT|0600);
- 
-     m_shm_info.shmaddr = m_xcb_image->data = (quint8 *)shmat (m_shm_info.shmid, 0, 0);
-     m_shm_info.shmseg = xcb_generate_id(xcb_connection());
-diff --git a/src/plugins/platforms/xlib/qxlibwindowsurface.cpp b/src/plugins/platforms/xlib/qxlibwindowsurface.cpp
-index bf003eb..46a2f97 100644
---- a/src/plugins/platforms/xlib/qxlibwindowsurface.cpp
-+++ b/src/plugins/platforms/xlib/qxlibwindowsurface.cpp
-@@ -99,7 +99,7 @@ void QXlibWindowSurface::resizeShmImage(int width, int height)
- 
- 
-     image_info->shminfo.shmid = shmget (IPC_PRIVATE,
--          image->bytes_per_line * image->height, IPC_CREAT|0777);
-+          image->bytes_per_line * image->height, IPC_CREAT|0700);
- 
-     image_info->shminfo.shmaddr = image->data = (char*)shmat (image_info->shminfo.shmid, 0, 0);
-     image_info->shminfo.readOnly = False;
-diff --git a/tools/qvfb/qvfbshmem.cpp b/tools/qvfb/qvfbshmem.cpp
-index 7f9671f..84b6ebe 100644
---- a/tools/qvfb/qvfbshmem.cpp
-+++ b/tools/qvfb/qvfbshmem.cpp
-@@ -176,13 +176,13 @@ QShMemViewProtocol::QShMemViewProtocol(int displayid, const QSize &s,
-     uint data_offset_value = sizeof(QVFbHeader);
- 
-     int dataSize = bpl * h + data_offset_value;
--    shmId = shmget(key, dataSize, IPC_CREAT | 0666);
-+    shmId = shmget(key, dataSize, IPC_CREAT | 0600);
-     if (shmId != -1)
- 	data = (unsigned char *)shmat(shmId, 0, 0);
-     else {
- 	struct shmid_ds shm;
- 	shmctl(shmId, IPC_RMID, &shm);
--	shmId = shmget(key, dataSize, IPC_CREAT | 0666);
-+    shmId = shmget(key, dataSize, IPC_CREAT | 0600);
- 	if (shmId == -1) {
-             perror("QShMemViewProtocol::QShMemViewProtocol");
-             qFatal("Cannot get shared memory 0x%08x", key);
--- 
-1.7.1
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0025-Remove-unnecessary-typedef-found-by-gcc4-8.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0025-Remove-unnecessary-typedef-found-by-gcc4-8.patch
deleted file mode 100644
index 498f14f..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.4/0025-Remove-unnecessary-typedef-found-by-gcc4-8.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From https://codereview.qt-project.org/p/qt/qt
- * branch            refs/changes/22/53322/2 -> FETCH_HEAD
-From 28524b867ee8c9784f00eec0f07e4d9491a651b8 Mon Sep 17 00:00:00 2001
-From: Thiago Macieira <thiago.macieira@intel.com>
-Date: Tue, 9 Apr 2013 16:41:23 -0700
-Subject: [PATCH] Remove unnecessary typedef, found by GCC 4.8
-
-qtconcurrentfilter.h:108:47: warning: typedef 'Iterator' locally defined but not used [-Wunused-local-typedefs]
-
-Qt5 commit: d4c241a98059edaa7a4b15beb1cfd16ed041284e (qtbase)
-Task-number: QTBUG-30594
-Change-Id: Icc69e41c2d4e11962f0c8434236d4847b46e7d9d
-
-Upstream-Status: Pending for 4.8.5 [1]
-
-[1] https://codereview.qt-project.org/#change,53322
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- src/corelib/concurrent/qtconcurrentfilter.h |    1 -
- 1 files changed, 0 insertions(+), 1 deletions(-)
-
-diff --git a/src/corelib/concurrent/qtconcurrentfilter.h b/src/corelib/concurrent/qtconcurrentfilter.h
-index 50b58bd..5a70182 100644
---- a/src/corelib/concurrent/qtconcurrentfilter.h
-+++ b/src/corelib/concurrent/qtconcurrentfilter.h
-@@ -105,7 +105,6 @@ namespace QtConcurrent {
- template <typename Sequence, typename KeepFunctor, typename ReduceFunctor>
- ThreadEngineStarter<void> filterInternal(Sequence &sequence, KeepFunctor keep, ReduceFunctor reduce)
- {
--    typedef typename Sequence::const_iterator Iterator;
-     typedef FilterKernel<Sequence, KeepFunctor, ReduceFunctor> KernelType;
-     return startThreadEngine(new KernelType(sequence, keep, reduce));
- }
--- 
-1.7.4.4
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0026-Don-t-overwrite-QMAKE_QT_CONFIG-with-empty-value.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0026-Don-t-overwrite-QMAKE_QT_CONFIG-with-empty-value.patch
deleted file mode 100644
index a37e35f..0000000
--- a/meta/recipes-qt/qt4/qt4-4.8.4/0026-Don-t-overwrite-QMAKE_QT_CONFIG-with-empty-value.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 1c75ea0332054c420efd676c147e45eee43e0118 Mon Sep 17 00:00:00 2001
-From: Jonathan Liu <net147@gmail.com>
-Date: Thu, 6 Jun 2013 12:42:13 +1000
-Subject: [PATCH] Don't overwrite QMAKE_QT_CONFIG with empty value
-
-If the mkspec sets QMAKE_QT_CONFIG, QMAKE_QT_CONFIG may be overwritten
-with an empty value from .qmake.cache. Avoid this by first checking
-if the value from .qmake.cache is not empty before assigning it to
-QMAKE_QT_CONFIG.
-
-Upstream-Status: Submitted
-https://codereview.qt-project.org/#change,58109
-
-Change-Id: I95fa630139b8798156a2fb15d0dde630a0a53a0a
-Signed-off-by: Jonathan Liu <net147@gmail.com>
----
- mkspecs/features/qt_config.prf | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/mkspecs/features/qt_config.prf b/mkspecs/features/qt_config.prf
-index fc14cdd..e059b7e 100644
---- a/mkspecs/features/qt_config.prf
-+++ b/mkspecs/features/qt_config.prf
-@@ -1,7 +1,11 @@
- # This file is loaded by the mkspecs, before .qmake.cache has been loaded.
- # Consequently, we have to do some stunts to get values out of the cache.
- 
--exists($$_QMAKE_CACHE_):QMAKE_QT_CONFIG = $$fromfile($$_QMAKE_CACHE_, QMAKE_QT_CONFIG)
-+exists($$_QMAKE_CACHE_) {
-+   qdd = $$fromfile($$_QMAKE_CACHE_, QMAKE_QT_CONFIG)
-+   !isEmpty(qdd): QMAKE_QT_CONFIG = $$qdd
-+   unset(qdd)
-+}
- isEmpty(QMAKE_QT_CONFIG)|!exists($$QMAKE_QT_CONFIG) {
-    qdd = $$QT_BUILD_TREE
-    isEmpty(qdd):exists($$_QMAKE_CACHE_): qdd = $$fromfile($$_QMAKE_CACHE_, QT_BUILD_TREE)
--- 
-1.8.2.3
-
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4.inc b/meta/recipes-qt/qt4/qt4-4.8.5.inc
similarity index 79%
rename from meta/recipes-qt/qt4/qt4-4.8.4.inc
rename to meta/recipes-qt/qt4/qt4-4.8.5.inc
index e87dacc..184261a 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.4.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.5.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt4-${PV}:"
 
-SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-everywhere-opensource-src-${PV}.tar.gz \
            file://0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch \
            file://0004-configure-qmake-is-already-built-in-qt4-tools-native.patch \
            file://0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch \
@@ -21,17 +21,12 @@ SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-sr
            file://0018-configure-make-pulseaudio-a-configurable-option.patch \
            file://0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch \
            file://0020-webkit-disable-the-fuse-ld-gold-flag.patch \
-           file://0022-ssl-certificates-blacklist-mis-issued-turktrust-certificates.patch \
-           file://0023-qtnetwork-blacklist-two-more-certificates.patch \
-           file://0024-Change-all-shmget-calls-to-user-only-memory.patch \
-           file://0025-Remove-unnecessary-typedef-found-by-gcc4-8.patch \
-           file://0026-Don-t-overwrite-QMAKE_QT_CONFIG-with-empty-value.patch \
            file://g++.conf \
            file://linux.conf \
            "
 
-SRC_URI[md5sum] = "89c5ecba180cae74c66260ac732dc5cb"
-SRC_URI[sha256sum] = "33b0e38ba4c54a0cf8a4be8ca5a4584f1c2e0adfecb57b21d9d1d267b0093270"
+SRC_URI[md5sum] = "1864987bdbb2f58f8ae8b350dfdbe133"
+SRC_URI[sha256sum] = "eb728f8268831dc4373be6403b7dd5d5dde03c169ad6882f9a8cb560df6aa138"
 
 S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
rename to meta/recipes-qt/qt4/qt4-4.8.5/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
rename to meta/recipes-qt/qt4/qt4-4.8.5/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
rename to meta/recipes-qt/qt4/qt4-4.8.5/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
rename to meta/recipes-qt/qt4/qt4-4.8.5/0004-configure-qmake-is-already-built-in-qt4-tools-native.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
rename to meta/recipes-qt/qt4/qt4-4.8.5/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
rename to meta/recipes-qt/qt4/qt4-4.8.5/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
rename to meta/recipes-qt/qt4/qt4-4.8.5/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
rename to meta/recipes-qt/qt4/qt4-4.8.5/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0009-qmake-fix-source-file-references-in-qmake.pri.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0009-qmake-fix-source-file-references-in-qmake.pri.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/0009-qmake-fix-source-file-references-in-qmake.pri.patch
rename to meta/recipes-qt/qt4/qt4-4.8.5/0009-qmake-fix-source-file-references-in-qmake.pri.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
rename to meta/recipes-qt/qt4/qt4-4.8.5/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0011-freetype-host-includes.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0011-freetype-host-includes.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/0011-freetype-host-includes.patch
rename to meta/recipes-qt/qt4/qt4-4.8.5/0011-freetype-host-includes.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0012-Add-2bpp-support.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0012-Add-2bpp-support.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/0012-Add-2bpp-support.patch
rename to meta/recipes-qt/qt4/qt4-4.8.5/0012-Add-2bpp-support.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0013-configure-add-crossarch-option.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0013-configure-add-crossarch-option.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/0013-configure-add-crossarch-option.patch
rename to meta/recipes-qt/qt4/qt4-4.8.5/0013-configure-add-crossarch-option.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0014-translations-fix-phony-translation-linking-error.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0014-translations-fix-phony-translation-linking-error.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/0014-translations-fix-phony-translation-linking-error.patch
rename to meta/recipes-qt/qt4/qt4-4.8.5/0014-translations-fix-phony-translation-linking-error.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0015-configure-add-nostrip-for-debug-packages.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0015-configure-add-nostrip-for-debug-packages.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/0015-configure-add-nostrip-for-debug-packages.patch
rename to meta/recipes-qt/qt4/qt4-4.8.5/0015-configure-add-nostrip-for-debug-packages.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0016-configure-eval-QMAKE_CXX.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0016-configure-eval-QMAKE_CXX.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/0016-configure-eval-QMAKE_CXX.patch
rename to meta/recipes-qt/qt4/qt4-4.8.5/0016-configure-eval-QMAKE_CXX.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
rename to meta/recipes-qt/qt4/qt4-4.8.5/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0018-configure-make-pulseaudio-a-configurable-option.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0018-configure-make-pulseaudio-a-configurable-option.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/0018-configure-make-pulseaudio-a-configurable-option.patch
rename to meta/recipes-qt/qt4/qt4-4.8.5/0018-configure-make-pulseaudio-a-configurable-option.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
rename to meta/recipes-qt/qt4/qt4-4.8.5/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0020-webkit-disable-the-fuse-ld-gold-flag.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0020-webkit-disable-the-fuse-ld-gold-flag.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/0020-webkit-disable-the-fuse-ld-gold-flag.patch
rename to meta/recipes-qt/qt4/qt4-4.8.5/0020-webkit-disable-the-fuse-ld-gold-flag.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0021-configure-make-qt4-native-work-with-long-building-pa.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0021-configure-make-qt4-native-work-with-long-building-pa.patch
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/0021-configure-make-qt4-native-work-with-long-building-pa.patch
rename to meta/recipes-qt/qt4/qt4-4.8.5/0021-configure-make-qt4-native-work-with-long-building-pa.patch
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/g++.conf b/meta/recipes-qt/qt4/qt4-4.8.5/g++.conf
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/g++.conf
rename to meta/recipes-qt/qt4/qt4-4.8.5/g++.conf
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/linux.conf b/meta/recipes-qt/qt4/qt4-4.8.5/linux.conf
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/linux.conf
rename to meta/recipes-qt/qt4/qt4-4.8.5/linux.conf
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/qte.sh b/meta/recipes-qt/qt4/qt4-4.8.5/qte.sh
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-4.8.4/qte.sh
rename to meta/recipes-qt/qt4/qt4-4.8.5/qte.sh
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb b/meta/recipes-qt/qt4/qt4-embedded_4.8.5.bb
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb
rename to meta/recipes-qt/qt4/qt4-embedded_4.8.5.bb
diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
index a153a37..ddb790d 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -13,12 +13,11 @@ INC_PR = "r20"
 
 inherit native
 
-SRC_URI = "http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-everywhere-opensource-src-${PV}.tar.gz \
            file://0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
            file://0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch \
            file://0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch \
            file://0021-configure-make-qt4-native-work-with-long-building-pa.patch \
-           file://0025-Remove-unnecessary-typedef-found-by-gcc4-8.patch \
            file://g++.conf \
            file://linux.conf \
 	"
diff --git a/meta/recipes-qt/qt4/qt4-native_4.8.4.bb b/meta/recipes-qt/qt4/qt4-native_4.8.4.bb
deleted file mode 100644
index 3932b3c..0000000
--- a/meta/recipes-qt/qt4/qt4-native_4.8.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require qt4-native.inc
-
-PR = "${INC_PR}.0"
-
-TOBUILD := "src/tools/bootstrap ${TOBUILD}"
-
-SRC_URI[md5sum] = "89c5ecba180cae74c66260ac732dc5cb"
-SRC_URI[sha256sum] = "33b0e38ba4c54a0cf8a4be8ca5a4584f1c2e0adfecb57b21d9d1d267b0093270"
diff --git a/meta/recipes-qt/qt4/qt4-native_4.8.5.bb b/meta/recipes-qt/qt4/qt4-native_4.8.5.bb
new file mode 100644
index 0000000..85ca0f8
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-native_4.8.5.bb
@@ -0,0 +1,8 @@
+require qt4-native.inc
+
+PR = "${INC_PR}.0"
+
+TOBUILD := "src/tools/bootstrap ${TOBUILD}"
+
+SRC_URI[md5sum] = "1864987bdbb2f58f8ae8b350dfdbe133"
+SRC_URI[sha256sum] = "eb728f8268831dc4373be6403b7dd5d5dde03c169ad6882f9a8cb560df6aa138"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.8.5.bb
similarity index 100%
rename from meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb
rename to meta/recipes-qt/qt4/qt4-x11-free_4.8.5.bb
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index ebe0ea5..81866ea 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -185,6 +185,8 @@ FILES_${QT_BASE_NAME}-xmlpatterns          = "${bindir}/xmlpatterns*"
 FILES_${QT_BASE_NAME}-xmlpatterns-dbg      = "${bindir}/.debug/xmlpatterns*"
 FILES_${QT_BASE_NAME}-qml-plugins          = "${libdir}/${QT_DIR_NAME}/imports/* ${libdir}/${QT_DIR_NAME}/plugins/qmltooling/*"
 FILES_${QT_BASE_NAME}-qml-plugins-dbg      = "${libdir}/${QT_DIR_NAME}/imports/*/*/*/.debug/* ${libdir}/${QT_DIR_NAME}/imports/*/.debug ${libdir}/${QT_DIR_NAME}/plugins/qmltooling/.debug"
+INSANE_SKIP_${QT_BASE_NAME}-examples      += "libdir"
+INSANE_SKIP_${QT_BASE_NAME}-examples-dbg  += "libdir"
 
 # License options, to be set by the recipe if different values are needed
 QT_LICENSE_FILE ?= ""
-- 
1.8.3.2


