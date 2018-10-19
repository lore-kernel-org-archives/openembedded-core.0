Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id ACBC774C4D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 19:43:22 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y144-v6so4696759wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 12:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=plVQuQc51GeWSqWrm1qrq4Vv6R1QHdakHjJSTPArf5M=;
	b=oJu9mQlI6wKcnBndFgTdXygA8WSUraq3gZGQ4gcyhYMMS0ZQFzR3OwwPFiLzbLEjN3
	UTG7KJH5A05mfejftas/mlHzk/nPiG1TmZjAiIANwsLHjmej1YGJMZsX/guxmgWdo2kc
	XBLcG+owdEnumO7Uz2eKQCqJWBK6h7KjM8c2c2g4QVa+Dfa3hqPP4CBG+JUa2Z94axLj
	bRkxViZHzryD8CVkR7g+bNPgbMFaSydkn1tb04VJxM5F3swJHE+9n1EcMYpWmyuF8wrr
	4RubjC/g2EhknsDUrb5IBblDGF2zhwHm/CS1TuvQqfxADvnzpCWB4aRzmHSNuDJGRePG
	gEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=plVQuQc51GeWSqWrm1qrq4Vv6R1QHdakHjJSTPArf5M=;
	b=MD/VyTW1/y6VHhNFowjcm7+pjcdkJUZbosf9x98OnXrIae0LmMzdhzmFn8VvgnZE82
	50Yv9//ml54LX7zJRj4Gl/AzDV5NvhvNrCu22WhZUgoikzVa36mFWkFn+dxn3tsYYd13
	o1OsIhk/YcLd/TqrIsZKLgBkuWdocALLO8btoHhs6eHOUSC0wN2GLZ0/iSdoFNfMXSSy
	xQ40vyr/RbtXGxxv1iXdMOIYtqd0W6B6vuuNYOR0Wb8Q3cVD4fQmW/B2QYh0SVr1Wdmd
	hKHe8Uuu37gD8pfwhQ5yutCLgrKJcN5KnEUhG3XUXVqVxc7srvd9hwdxLYvt7xo14zZh
	qKZQ==
X-Gm-Message-State: ABuFfogWFAE7jBmF3+Xj0DFiKn9Rxo7kx2Od2Xhv/2TEGidjjRjWfHdd
	dFIN1++pPPo2w3NhWHR8ykjVmpkZHpg=
X-Google-Smtp-Source: ACcGV60I9ZuvQvOz0X2UTiQSglfzIg/nn2cFOhV2VuMA8i7OoaGpWs+H5pKnODQ+XEreDnn8NofFoA==
X-Received: by 2002:a1c:a90:: with SMTP id 138-v6mr6390274wmk.49.1539978203043;
	Fri, 19 Oct 2018 12:43:23 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	134-v6sm2830398wmb.13.2018.10.19.12.43.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Oct 2018 12:43:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Oct 2018 20:43:18 +0100
Message-Id: <20181019194318.23511-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181019194318.23511-1-ross.burton@intel.com>
References: <20181019194318.23511-1-ross.burton@intel.com>
Subject: [PATCH 2/2] openssl: do an out-of-tree build
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
X-List-Received-Date: Fri, 19 Oct 2018 19:43:23 -0000

OpenSSL supports out-of-tree builds so we should use them.  This makes builds
more reliable, and makes it easier to reduce the size of the ptest package.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1.bb | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
index 4516f610217..af9038abd5f 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
@@ -26,6 +26,9 @@ SRC_URI[sha256sum] = "2836875a0f89c03d0fdf483941512613a50cfb421d6fd94b9f41d7279d
 
 inherit lib_package multilib_header ptest
 
+B = "${WORKDIR}/build"
+do_configure[cleandirs] = "${B}"
+
 #| ./libcrypto.so: undefined reference to `getcontext'
 #| ./libcrypto.so: undefined reference to `setcontext'
 #| ./libcrypto.so: undefined reference to `makecontext'
@@ -107,7 +110,7 @@ do_configure () {
 	# WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
 	# environment variables set by bitbake. Adjust the environment variables instead.
 	PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
-	perl ./Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
+	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
 }
 
 do_install () {
@@ -151,9 +154,11 @@ do_install_append_class-nativesdk () {
 }
 
 do_install_ptest () {
-	cp ${B}/Configure ${B}/configdata.pm ${D}${PTEST_PATH}
-	# TODO fuzz needs to be pruned of non-binaries
-	cp -r ${B}/external ${B}/test ${B}/fuzz ${B}/util ${D}${PTEST_PATH}
+	# Prune the build tree
+	rm -f ${B}/fuzz/*.* ${B}/test/*.*
+
+	cp ${S}/Configure ${B}/configdata.pm ${D}${PTEST_PATH}
+	cp -r ${S}/external ${B}/test ${S}/test ${B}/fuzz ${S}/util ${B}/util ${D}${PTEST_PATH}
 
 	# For test_shlibload
 	ln -s ${libdir}/libcrypto.so.1.1 ${D}${PTEST_PATH}/libcrypto.so
@@ -161,7 +166,7 @@ do_install_ptest () {
 
 	install -d ${D}${PTEST_PATH}/apps
 	ln -s ${bindir}/openssl ${D}${PTEST_PATH}/apps
-	install -m644 ${B}/apps/*.pem ${B}/apps/*.srl ${B}/apps/openssl.cnf ${D}${PTEST_PATH}/apps
+	install -m644 ${S}/apps/*.pem ${S}/apps/*.srl ${S}/apps/openssl.cnf ${D}${PTEST_PATH}/apps
 	install -m755 ${B}/apps/CA.pl ${D}${PTEST_PATH}/apps
 
 	install -d ${D}${PTEST_PATH}/engines
-- 
2.11.0


