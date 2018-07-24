Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f46.google.com (mail-pl0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6FF7760851
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 02:39:14 +0000 (UTC)
Received: by mail-pl0-f46.google.com with SMTP id s17-v6so1050509plp.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 19:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JN2GmJ+2X3fI0mf27t83iv8SMpjcNoLMgU+74QdEh+s=;
	b=X8gzB/x2tztVBpN+7mG6Sgjg0T3/mGsi9Y5vNKKZXg6MCT9ws2e5TJMJkeBN5oHVK1
	1DTzGX7mYswalSX55grPp+36ZyQAckwDZosTm6dPFcsjcRs65M4a2FKFqhi2udGCWn03
	v0kdUfLqz2Xe2bbbnaZ31Bv46O/uPx22Rti42Nz+9QUiY3Taz5D97CJ6tumVlxMWTAhz
	CyFeUAwMbMjC8R1jTTXUoNo83l1Xq7pfdcw5fblap/9atNWtfVBvDXk4zlZ19GVue3MR
	myyXtz8xryUcNbCNaJ5VbhSHrEHH/kb4k/HTmY9FTU2jbZ5EF8GJj7OXMb/LjE+sRzvd
	+pEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JN2GmJ+2X3fI0mf27t83iv8SMpjcNoLMgU+74QdEh+s=;
	b=n1prc78RwffIddCY9R9yFWnQKV/zejqSEyivXNdNjahbiygGCw45Pm4oH2mseJym+n
	f6QJVefK3tsRo6qJaUTPX863Q43oQkbwVRVB5GpYiFI1UHs0TZitLoy+Eg/msi++6XZz
	hEL6u23sEI3mFt9i29l86k3VnfCameNTp1CCVSGCK7EajcXAatFGYwGeZA4AZT1I09Tu
	PGMYBCVQ90RSgPw1upMyhPp6c4Dqt5KKOSRvHf2Ya0VNnuGforICF9NnED6dCxOfKFtw
	AjvNXBJauAq6j2IRSmSxpMWZUaoQoCoYYkFYI1HKK2WJrGJsZzVJbmQdE9G3LHw1mLJ8
	TZig==
X-Gm-Message-State: AOUpUlFzkl0zWULTV/dnsMbZ/V3gGu+67YV6gHPGL15WKaguU3RP4aHP
	3tgZFPci3UjgSHcbi91k1roh1Q2Z
X-Google-Smtp-Source: AAOMgpcGrNYcEv7QPDkGztLNu2AIV34q3NSjUfahKhFY2tJYrMjAp7f05gEw/m9+vubXT6b+Wp7j6g==
X-Received: by 2002:a17:902:6b84:: with SMTP id
	p4-v6mr15146083plk.272.1532399955378; 
	Mon, 23 Jul 2018 19:39:15 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	y132-v6sm14746314pfb.91.2018.07.23.19.39.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jul 2018 19:39:14 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2018 19:38:55 -0700
Message-Id: <1532399935-32296-9-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532399935-32296-1-git-send-email-armccurdy@gmail.com>
References: <1532399935-32296-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 9/9] openssl: minor indent fixes
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
X-List-Received-Date: Tue, 24 Jul 2018 02:39:14 -0000

Fix inconsistent indent (and also make the openssl 1.1 recipe more
consistent and consistent with the openssl 1.0 recipe).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../recipes-connectivity/openssl/openssl_1.1.0h.bb | 69 +++++++++++-----------
 1 file changed, 35 insertions(+), 34 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index 5dc2966..a7cd6a4 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -44,7 +44,7 @@ do_configure () {
 	linux-musl )
 		os=linux
 		;;
-		*)
+	*)
 		;;
 	esac
 	target="$os-${HOST_ARCH}"
@@ -80,21 +80,21 @@ do_configure () {
 		target=linux-x86_64
 		;;
 	linux-mips)
-                # specifying TARGET_CC_ARCH prevents openssl from (incorrectly) adding target architecture flags
+		# specifying TARGET_CC_ARCH prevents openssl from (incorrectly) adding target architecture flags
 		target="linux-mips32 ${TARGET_CC_ARCH}"
 		;;
 	linux-mipsel)
 		target="linux-mips32 ${TARGET_CC_ARCH}"
 		;;
-        linux-gnun32-mips*)
-               target=linux-mips64
-                ;;
-        linux-*-mips64 | linux-mips64)
-               target=linux64-mips64
-                ;;
-        linux-*-mips64el | linux-mips64el)
-               target=linux64-mips64
-                ;;
+	linux-gnun32-mips*)
+		target=linux-mips64
+		;;
+	linux-*-mips64 | linux-mips64)
+		target=linux64-mips64
+		;;
+	linux-*-mips64el | linux-mips64el)
+		target=linux64-mips64
+		;;
 	linux-microblaze*|linux-nios2*)
 		target=linux-generic32
 		;;
@@ -104,12 +104,12 @@ do_configure () {
 	linux-powerpc64)
 		target=linux-ppc64
 		;;
-	linux-riscv64)
-		target=linux-generic64
-		;;
 	linux-riscv32)
 		target=linux-generic32
 		;;
+	linux-riscv64)
+		target=linux-generic64
+		;;
 	linux-supersparc)
 		target=linux-sparcv9
 		;;
@@ -120,40 +120,41 @@ do_configure () {
 		target=darwin-i386-cc
 		;;
 	esac
-        useprefix=${prefix}
-        if [ "x$useprefix" = "x" ]; then
-                useprefix=/
-        fi
+
+	useprefix=${prefix}
+	if [ "x$useprefix" = "x" ]; then
+		useprefix=/
+	fi
 	libdirleaf="$(echo ${libdir} | sed s:$useprefix::)"
-	perl ./Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdirleaf} $target
+	perl ./Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=$libdirleaf $target
 }
 
 do_install () {
-        oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
-        oe_multilib_header openssl/opensslconf.h
+	oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
+	oe_multilib_header openssl/opensslconf.h
 }
 
 do_install_append_class-native () {
-        # Install a custom version of c_rehash that can handle sysroots properly.
-        # This version is used for example when installing ca-certificates during
-        # image creation.
-        install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh ${D}${bindir}/c_rehash
-        sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash
+	# Install a custom version of c_rehash that can handle sysroots properly.
+	# This version is used for example when installing ca-certificates during
+	# image creation.
+	install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh ${D}${bindir}/c_rehash
+	sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash
 }
 
 do_install_append_class-nativesdk () {
-        mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
-        install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
+	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+	install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
 }
 
 do_install_ptest() {
-        cp -r * ${D}${PTEST_PATH}
+	cp -r * ${D}${PTEST_PATH}
 
-        # Putting .so files in ptest package will mess up the dependencies of the main openssl package
-        # so we rename them to .so.ptest and patch the test accordingly
-        mv ${D}${PTEST_PATH}/libcrypto.so ${D}${PTEST_PATH}/libcrypto.so.ptest
-        mv ${D}${PTEST_PATH}/libssl.so ${D}${PTEST_PATH}/libssl.so.ptest
-        sed -i 's/$target{shared_extension_simple}/".so.ptest"/' ${D}${PTEST_PATH}/test/recipes/90-test_shlibload.t
+	# Putting .so files in ptest package will mess up the dependencies of the main openssl package
+	# so we rename them to .so.ptest and patch the test accordingly
+	mv ${D}${PTEST_PATH}/libcrypto.so ${D}${PTEST_PATH}/libcrypto.so.ptest
+	mv ${D}${PTEST_PATH}/libssl.so ${D}${PTEST_PATH}/libssl.so.ptest
+	sed -i 's/$target{shared_extension_simple}/".so.ptest"/' ${D}${PTEST_PATH}/test/recipes/90-test_shlibload.t
 }
 
 PACKAGES =+ "${PN}-engines"
-- 
1.9.1


