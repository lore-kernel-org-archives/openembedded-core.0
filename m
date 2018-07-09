Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id D3A2F74EE5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 18:13:03 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id l123-v6so14208083pfl.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2018 11:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hC1jkKhYbJS2VZdtbv2dclUZfBqdrj2syw4/hPH13e0=;
	b=JceFWxdqFpSpKyiqeKxosIUpvZKuvODEgQBsrBxy+OswtVJ2xEk6SYhzUdivDfKhb4
	HqjeBhXHbQzxbxdkHHXBLWb2ROHUOA2J9PZ6Zg1cs3EaWQ45PwYw0Rp+VUDOzCe9iyvV
	LdWuXCrL6ZG+c8feYeOvE/3X5WmyAGkzhoZnva1T+3Gl3r5ygKGL0XUpFxZRGmDZFJeP
	tjNrEShIzwdKHp+0dcOoipyDGcpN9QPaAW1BTR1gounVbQw7r6rrj0/i6qxBZkW23vcZ
	e2RLrnnLTzEvJneD7KK2LcVdCtczbQWljyNIQdyN4cOlU02LseQzpUqYefh44Nb07vbw
	RYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hC1jkKhYbJS2VZdtbv2dclUZfBqdrj2syw4/hPH13e0=;
	b=Q7yb5TFGYHH0CI5ykJsdItWs7Fz0/8FmUUDi30INPE7H9x0CCdrkRMXoHQp4kFliVT
	jOvkiM2Niexz+zuJZlGVXsVvj57wX4rfC/xdlhiDLw6NsEfgA03hicOvQFdqbbkPGR8B
	o/YF2GESbAvm8ARAlZDf/+Oh/ic+mZtbvSscIu2qHfZZDX3d9BofQ1oMkZxDhzOItC3+
	19HgE7kQbUvUSAuRyai3Q4mYKCvRHL2hVS7tgM3T5yxjGh+Co5vtD9Kej9TGIZv63MIv
	D4D5J2i2bvNuf6DnS3pYB+hi/EEWju7I8AM0pvTRlgWMa8CAqc/g5bIEKVaQhzyFPhOj
	JSYw==
X-Gm-Message-State: APt69E29hpOvKztHknGjONNA53NItO5L9SHfThzK3R3f9+THC4u0sOCb
	M4QvRWZvgcYspnJdEPe/AIkvnQ==
X-Google-Smtp-Source: AAOMgpe0O053RJs9qMVQ5r8nsOSgFjHBjKzW+o/InjhDjhVz9vFc+5LaukDzGPKa+YqyhuUb0x2Rqg==
X-Received: by 2002:a63:3190:: with SMTP id
	x138-v6mr19691494pgx.60.1531159984749; 
	Mon, 09 Jul 2018 11:13:04 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	k12-v6sm24020644pff.31.2018.07.09.11.13.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jul 2018 11:13:04 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2018 11:12:53 -0700
Message-Id: <1531159973-23897-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] openssl_1.1: minor recipe formatting tweaks etc
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
X-List-Received-Date: Mon, 09 Jul 2018 18:13:04 -0000

Drop redundant setting of S to its default value and re-order
variables to align more closely to the OE style-guide.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 v2: rebase to latest master-next

 .../recipes-connectivity/openssl/openssl_1.1.0h.bb | 50 ++++++++++------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index 64b8a99..8d445e4 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -8,11 +8,6 @@ SECTION = "libs/network"
 LICENSE = "openssl"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d57d511030c9d66ef5f5966bee5a7eff"
 
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI[md5sum] = "5271477e4d93f4ea032b665ef095ff24"
-SRC_URI[sha256sum] = "5835626cde9e99656585fc7aaa2302a73a7e1340bf8c14fd635a62c66802a517"
-
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
@@ -21,12 +16,24 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
 
 SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
-          "
+           "
 
-S = "${WORKDIR}/openssl-${PV}"
+SRC_URI[md5sum] = "5271477e4d93f4ea032b665ef095ff24"
+SRC_URI[sha256sum] = "5835626cde9e99656585fc7aaa2302a73a7e1340bf8c14fd635a62c66802a517"
 
 inherit lib_package multilib_header ptest
 
+#| engines/afalg/e_afalg.c: In function 'eventfd':
+#| engines/afalg/e_afalg.c:110:20: error: '__NR_eventfd' undeclared (first use in this function)
+#|      return syscall(__NR_eventfd, n);
+#|                     ^~~~~~~~~~~~
+EXTRA_OECONF_append_aarch64 = " no-afalgeng"
+
+#| ./libcrypto.so: undefined reference to `getcontext'
+#| ./libcrypto.so: undefined reference to `setcontext'
+#| ./libcrypto.so: undefined reference to `makecontext'
+EXTRA_OECONF_append_libc-musl = " -DOPENSSL_NO_ASYNC"
+
 do_configure () {
 	os=${HOST_OS}
 	case $os in
@@ -122,17 +129,6 @@ do_configure () {
 	perl ./Configure ${EXTRA_OECONF} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdirleaf} $target
 }
 
-#| engines/afalg/e_afalg.c: In function 'eventfd':
-#| engines/afalg/e_afalg.c:110:20: error: '__NR_eventfd' undeclared (first use in this function)
-#|      return syscall(__NR_eventfd, n);
-#|                     ^~~~~~~~~~~~
-EXTRA_OECONF_append_aarch64 = " no-afalgeng"
-
-#| ./libcrypto.so: undefined reference to `getcontext'
-#| ./libcrypto.so: undefined reference to `setcontext'
-#| ./libcrypto.so: undefined reference to `makecontext'
-EXTRA_OECONF_append_libc-musl = " -DOPENSSL_NO_ASYNC"
-
 do_install () {
         oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
         oe_multilib_header openssl/opensslconf.h
@@ -146,13 +142,11 @@ do_install_append_class-native () {
         sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash
 }
 
-do_install_append_class-nativesdk() {
-    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
-    install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
+do_install_append_class-nativesdk () {
+        mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+        install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
 }
 
-FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
-
 do_install_ptest() {
         cp -r * ${D}${PTEST_PATH}
 
@@ -163,10 +157,12 @@ do_install_ptest() {
         sed -i 's/$target{shared_extension_simple}/".so.ptest"/' ${D}${PTEST_PATH}/test/recipes/90-test_shlibload.t
 }
 
-RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions bash python"
-
-FILES_${PN} =+ " ${libdir}/ssl-1.1/*"
-
 PACKAGES =+ "${PN}-engines"
+
+FILES_${PN} =+ "${libdir}/ssl-1.1/*"
+FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
 FILES_${PN}-engines = "${libdir}/engines-1.1"
 
+RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions bash python"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


