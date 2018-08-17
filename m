Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f49.google.com (mail-pl0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2207078AB5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 04:43:46 +0000 (UTC)
Received: by mail-pl0-f49.google.com with SMTP id g23-v6so169606plq.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 21:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TMTY4aRlnxogUU7bArzBzs0i8XRkdXhcFnvH1ktgFoY=;
	b=e4tIZO7fhPmilMZsXgHX6qNU2U8qamlF+vUY4ib1gdnDr42uHnbgfQQNnHxlAL3gM1
	saL5tYeqAwf/IF2/sPoRw4FXobhQ7y+sj4r3jhdzHyzCImodoDqcaKfx/4w381y08s8P
	WVA4+PR9M8BB/zNy2cJtP1giUKTl+T6mcvxKdZda/37FmTKmrLexfZRS7vaNzt72G3Lo
	77HFbZPIZoGxyoGqA7pQB2rfhVcHBi8to9n6XyF828UhdqH3fkOldKXnLsb0cq1OdN30
	tM8Xkevr8/nTltUU1W4EblwhRhhboX4KC/yt897+EmcqytiUU/EQRfnuxUtDRnWojHHe
	ZEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TMTY4aRlnxogUU7bArzBzs0i8XRkdXhcFnvH1ktgFoY=;
	b=QqxHsLhPleYq4c/kc1jKDVmeYuWw8Vx9Q7XP4KFkkNZiZy2cdfXgCrNeCBO1szDV1m
	OjgjDYwAqb25bKdFXjoctK5LEFrm3tcklhYkic1oACQZAeXcwK60ieWqYN/DeTF+aFX9
	uRoYq5fLrU7zkftlr8Au7m1981QzvEq4DC8kZdhO5lKNTTIR2jyt2vBOf8RPS4JZKQpD
	gKEFnTSVzEC8pl+jXQIbsYZfaq2INVJbjE2K7C+vQxV49g4I55jH8WgJ9ngVg8/OJmjJ
	nbTRNv3diQWx0h4Ar2I7Jc7Zsyn84QdpEIhkPYV4uhbxVqaULMRIHd5iwNyQC5AjogqT
	mFMQ==
X-Gm-Message-State: AOUpUlHiqQjs0o7Q7IpOUWzUa9XhYDTX0lX7ADsGPy/WtL8JPWcjdP0x
	h1BFNth6mCxCilzu1pat8GXHj/fO
X-Google-Smtp-Source: AA+uWPzJ4xFXj1R+SoCqpuG8/S25MtBdqY8/yDtYkj0WHAqamCXoRvZFyqV7pzSfoBpiTUlsTBuH7w==
X-Received: by 2002:a17:902:9a8a:: with SMTP id
	w10-v6mr31882905plp.14.1534481027056; 
	Thu, 16 Aug 2018 21:43:47 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	r64-v6sm1157526pfk.157.2018.08.16.21.43.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Aug 2018 21:43:46 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2018 21:43:33 -0700
Message-Id: <1534481017-17310-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1534481017-17310-1-git-send-email-armccurdy@gmail.com>
References: <1534481017-17310-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/7] openssl: minor reformatting to align the 1.0 and 1.1 recipes
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
X-List-Received-Date: Fri, 17 Aug 2018 04:43:46 -0000

Formatting and comment tweaks only, no functional changes.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../recipes-connectivity/openssl/openssl_1.0.2p.bb | 43 +++++++++++-----------
 .../recipes-connectivity/openssl/openssl_1.1.0i.bb | 36 ++++++++++--------
 2 files changed, 42 insertions(+), 37 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2p.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2p.bb
index 5a2593c..1abf894 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2p.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2p.bb
@@ -223,10 +223,11 @@ do_install () {
 	install -d ${D}${includedir}
 	cp --dereference -R include/openssl ${D}${includedir}
 
+	oe_multilib_header openssl/opensslconf.h
+
 	install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh ${D}${bindir}/c_rehash
 	sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash
 
-	oe_multilib_header openssl/opensslconf.h
 	if [ "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}" ]; then
 		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
 		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/tsget
@@ -234,12 +235,12 @@ do_install () {
 		rm -f ${D}${libdir}/ssl/misc/CA.pl ${D}${libdir}/ssl/misc/tsget
 	fi
 
-	# Create SSL structure
-	install -d ${D}${sysconfdir}/ssl/
-	mv ${D}${libdir}/ssl/openssl.cnf \
-	   ${D}${libdir}/ssl/certs \
+	# Create SSL structure for packages such as ca-certificates which
+	# contain hard-coded paths to /etc/ssl. Debian does the same.
+	install -d ${D}${sysconfdir}/ssl
+	mv ${D}${libdir}/ssl/certs \
 	   ${D}${libdir}/ssl/private \
-	   \
+	   ${D}${libdir}/ssl/openssl.cnf \
 	   ${D}${sysconfdir}/ssl/
 	ln -sf ${sysconfdir}/ssl/certs ${D}${libdir}/ssl/certs
 	ln -sf ${sysconfdir}/ssl/private ${D}${libdir}/ssl/private
@@ -256,6 +257,19 @@ do_install () {
 	done
 }
 
+do_install_append_class-native () {
+	create_wrapper ${D}${bindir}/openssl \
+	    OPENSSL_CONF=${libdir}/ssl/openssl.cnf \
+	    SSL_CERT_DIR=${libdir}/ssl/certs \
+	    SSL_CERT_FILE=${libdir}/ssl/cert.pem \
+	    OPENSSL_ENGINES=${libdir}/ssl/engines
+}
+
+do_install_append_class-nativesdk () {
+	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+	install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
+}
+
 do_install_ptest () {
 	cp -r -L Makefile.org Makefile test ${D}${PTEST_PATH}
 
@@ -304,21 +318,8 @@ do_install_ptest () {
 	${D}${PTEST_PATH}/Makefile ${D}${PTEST_PATH}/Configure
 }
 
-do_install_append_class-native() {
-	create_wrapper ${D}${bindir}/openssl \
-	    OPENSSL_CONF=${libdir}/ssl/openssl.cnf \
-	    SSL_CERT_DIR=${libdir}/ssl/certs \
-	    SSL_CERT_FILE=${libdir}/ssl/cert.pem \
-	    OPENSSL_ENGINES=${libdir}/ssl/engines
-}
-
-do_install_append_class-nativesdk() {
-	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
-	install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
-}
-
-# Add the openssl.cnf file to the openssl-conf package.  Make the libcrypto
-# package RRECOMMENDS on this package.  This will enable the configuration
+# Add the openssl.cnf file to the openssl-conf package. Make the libcrypto
+# package RRECOMMENDS on this package. This will enable the configuration
 # file to be installed for both the base openssl package and the libcrypto
 # package since the base openssl package depends on the libcrypto package.
 
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
index ab0d264..3d4b7ee 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
@@ -106,16 +106,16 @@ do_configure () {
 
 do_install () {
 	oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
+
 	oe_multilib_header openssl/opensslconf.h
 
-	# Create SSL structure for PATH hard-coded packages like ca-certificates
-	# Debian is also using this technique
-	install -d ${D}${sysconfdir}/ssl/
-	mv ${D}${libdir}/ssl-1.1/openssl.cnf \
-		${D}${libdir}/ssl-1.1/certs \
-		${D}${libdir}/ssl-1.1/private \
-		\
-		${D}${sysconfdir}/ssl/
+	# Create SSL structure for packages such as ca-certificates which
+	# contain hard-coded paths to /etc/ssl. Debian does the same.
+	install -d ${D}${sysconfdir}/ssl
+	mv ${D}${libdir}/ssl-1.1/certs \
+	   ${D}${libdir}/ssl-1.1/private \
+	   ${D}${libdir}/ssl-1.1/openssl.cnf \
+	   ${D}${sysconfdir}/ssl/
 	ln -sf ${sysconfdir}/ssl/certs ${D}${libdir}/ssl-1.1/certs
 	ln -sf ${sysconfdir}/ssl/private ${D}${libdir}/ssl-1.1/private
 	ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${libdir}/ssl-1.1/openssl.cnf
@@ -134,7 +134,7 @@ do_install_append_class-nativesdk () {
 	install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
 }
 
-do_install_ptest() {
+do_install_ptest () {
 	cp -r * ${D}${PTEST_PATH}
 
 	# Putting .so files in ptest package will mess up the dependencies of the main openssl package
@@ -144,22 +144,26 @@ do_install_ptest() {
 	sed -i 's/$target{shared_extension_simple}/".so.ptest"/' ${D}${PTEST_PATH}/test/recipes/90-test_shlibload.t
 }
 
-PACKAGES =+ "libcrypto libssl ${PN}-misc ${PN}-engines openssl-conf"
+# Add the openssl.cnf file to the openssl-conf package. Make the libcrypto
+# package RRECOMMENDS on this package. This will enable the configuration
+# file to be installed for both the openssl-bin package and the libcrypto
+# package since the openssl-bin package depends on the libcrypto package.
+
+PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc"
 
 FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
 FILES_libssl = "${libdir}/libssl${SOLIBS}"
-FILES_${PN} =+ "${libdir}/ssl-1.1/*"
-FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
+FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf ${libdir}/ssl-1.1/openssl.cnf"
 FILES_${PN}-engines = "${libdir}/engines-1.1"
-
 FILES_${PN}-misc = "${libdir}/ssl-1.1/misc"
-RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
+FILES_${PN} =+ "${libdir}/ssl-1.1/*"
+FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
 
-FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf ${libdir}/ssl-1.1/openssl.cnf"
 CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
-RRECOMMENDS_libcrypto += "openssl-conf"
 
+RRECOMMENDS_libcrypto += "openssl-conf"
 RDEPENDS_${PN}-bin = "perl"
+RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
 RDEPENDS_${PN}-ptest += "perl-module-file-spec-functions bash python"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


