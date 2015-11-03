Return-Path: <ruslan@babayev.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id B0C8871633
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 22:34:31 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so22937394pad.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Nov 2015 14:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=babayev.com; s=google;
	h=user-agent:from:to:subject:date:message-id:mime-version
	:content-type; bh=kEZVnH5DCFfzH7E68OBiL9mvwNhl8j21Ib76Vx3quF4=;
	b=cFfwq0gHGgPpA1MZ9nUWz6Ta2bGa8RBx4wyGDGz8VBXl98m8NRRhmk1PKtepHfubxV
	fbkU1XT3scVWDYGz662w3a+OrneQp0m9TsYFcukJJIR57HeLls3NwBCN1bPH4xSeGbz/
	PsG2RoG74ny2GVvh92laNkCrdMD7bSw5N2zNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:user-agent:from:to:subject:date:message-id
	:mime-version:content-type;
	bh=kEZVnH5DCFfzH7E68OBiL9mvwNhl8j21Ib76Vx3quF4=;
	b=Ow0vXYuqrNF4x+bgTdMYYbfdmobieUZ6A93HW+w+SxvRpgEE/WIIelBxpAW37wwcq3
	a2TBzcDgXYFM1tyWKoIEAhncymfjUusvrWAhbgvOfH9ZwkimaH6Djao8BAHvzV/YaKhj
	tVPBSbGcWvp9ocuVFbYPLGuV4HAA+YUy2FIwHmaMQwC5TeqKHXCXjMPNQCi+xBoaFzix
	WRBvMbaZTSvN9jg62fhbqtV9U8LSBuc82Zu4H3Zt8M/i9wsn0A+Fs+PEqP4A8cbmQk08
	avMpwpEofaY89btGBNCiTCMHXW1gUhyNmcL6tvkondtMpYAIJn9+UIdoJl0Z79wTmo0I
	GyiA==
X-Gm-Message-State: ALoCoQmfnspBGkwVD4uDYhFSMBAJRU2VVYFiD+xTzpQdj0EzD6h++IslmBfaMdxh9OJIgjmi7JRL
X-Received: by 10.66.102.101 with SMTP id fn5mr35939893pab.111.1446590071482; 
	Tue, 03 Nov 2015 14:34:31 -0800 (PST)
Received: from localhost ([50.247.64.110]) by smtp.gmail.com with ESMTPSA id
	so4sm31346314pbc.72.2015.11.03.14.34.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 03 Nov 2015 14:34:31 -0800 (PST)
User-agent: mu4e 0.9.15; emacs 24.5.1
From: Ruslan Babayev <ruslan@babayev.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 03 Nov 2015 15:34:31 -0800
Message-ID: <87d1vqk67s.fsf@babayev.com>
MIME-Version: 1.0
Subject: Add LibreSSL support
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
X-List-Received-Date: Tue, 03 Nov 2015 22:34:31 -0000
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain

Please find attached the patch to add support for LibreSSL.

OpenSSL is still preferred, so you'd have add these to your local.conf

PREFERRED_PROVIDER_openssl ?= "openssl"
PREFERRED_PROVIDER_openssl-native ?= "openssl-native"
PREFERRED_PROVIDER_nativesdk-openssl ?= "nativesdk-openssl"


--=-=-=
Content-Type: text/x-patch
Content-Disposition: inline; filename=0001-Add-LibreSSL.patch

From db63d8224c0779d6de466014adf10e0a092a210c Mon Sep 17 00:00:00 2001
From: Ruslan Babayev <ruslan@babayev.com>
Date: Mon, 2 Nov 2015 17:56:27 -0800
Subject: [PATCH] Add LibreSSL

---
 meta/conf/distro/include/default-providers.inc       |  3 +++
 .../libressl/files/gnuc_prereq.patch                 | 13 +++++++++++++
 meta/recipes-connectivity/libressl/libressl.inc      | 20 ++++++++++++++++++++
 meta/recipes-connectivity/libressl/libressl_2.2.4.bb |  6 ++++++
 4 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-connectivity/libressl/files/gnuc_prereq.patch
 create mode 100644 meta/recipes-connectivity/libressl/libressl.inc
 create mode 100644 meta/recipes-connectivity/libressl/libressl_2.2.4.bb

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 9f84d5c..205f1cd 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -49,3 +49,6 @@ PREFERRED_PROVIDER_bluez-hcidump ?= "${@bb.utils.contains('DISTRO_FEATURES','blu
 # Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
 PREFERRED_PROVIDER_ltp ?= "ltp"
 PREFERRED_PROVIDER_getopt ?= "util-linux-getopt"
+PREFERRED_PROVIDER_openssl ?= "openssl"
+PREFERRED_PROVIDER_openssl-native ?= "openssl-native"
+PREFERRED_PROVIDER_nativesdk-openssl ?= "nativesdk-openssl"
diff --git a/meta/recipes-connectivity/libressl/files/gnuc_prereq.patch b/meta/recipes-connectivity/libressl/files/gnuc_prereq.patch
new file mode 100644
index 0000000..61fa51a
--- /dev/null
+++ b/meta/recipes-connectivity/libressl/files/gnuc_prereq.patch
@@ -0,0 +1,13 @@
+Index: libressl-2.2.4/crypto/bn/bn_lcl.h
+===================================================================
+--- libressl-2.2.4.orig/crypto/bn/bn_lcl.h
++++ libressl-2.2.4/crypto/bn/bn_lcl.h
+@@ -259,7 +259,7 @@ extern "C" {
+ #  endif
+ # elif defined(__mips) && defined(_LP64)
+ #  if defined(__GNUC__) && __GNUC__>=2
+-#   if __GNUC__>=4 && __GNUC_MINOR__>=4 /* "h" constraint is no more since 4.4 */
++#   if __GNUC_PREREQ(4,4) /* "h" constraint is no more since 4.4 */
+ #     define BN_UMULT_HIGH(a,b)		 (((__uint128_t)(a)*(b))>>64)
+ #     define BN_UMULT_LOHI(low,high,a,b) ({	\
+ 	__uint128_t ret=(__uint128_t)(a)*(b);	\
diff --git a/meta/recipes-connectivity/libressl/libressl.inc b/meta/recipes-connectivity/libressl/libressl.inc
new file mode 100644
index 0000000..d0acdc4
--- /dev/null
+++ b/meta/recipes-connectivity/libressl/libressl.inc
@@ -0,0 +1,20 @@
+SUMMARY = "LibreSSL fork of OpenSSL"
+DESCRIPTION = "Secure Socket Layer (SSL) binary and related cryptographic tools."
+HOMEPAGE = "http://www.libressl.org/"
+SECTION = "libs/network"
+
+LICENSE = "openssl"
+LIC_FILES_CHKSUM = "file://COPYING;md5=01f9bb4d275f5eeea905377bef3de622"
+
+SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${PV}.tar.gz"
+
+S = "${WORKDIR}/libressl-${PV}"
+
+inherit pkgconfig autotools
+
+PROVIDES += "openssl"
+
+RPROVIDES_${PN} += "openssl"
+RCONFLICTS_${PN} += "openssl"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-connectivity/libressl/libressl_2.2.4.bb b/meta/recipes-connectivity/libressl/libressl_2.2.4.bb
new file mode 100644
index 0000000..f2f6fc2
--- /dev/null
+++ b/meta/recipes-connectivity/libressl/libressl_2.2.4.bb
@@ -0,0 +1,6 @@
+require libressl.inc
+
+SRC_URI += " file://gnuc_prereq.patch"
+
+SRC_URI[md5sum] = "bae037598bd63987666302f9644de237"
+SRC_URI[sha256sum] = "6b409859be8654afc3862549494e097017e64c8d167f12584383586306ef9a7e"
-- 
2.6.2


--=-=-=--
