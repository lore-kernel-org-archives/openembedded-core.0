Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3889478F34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 10:23:25 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n2-v6so1046909wrw.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 03:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qbo/YfVo1IP9OKLxjf5wDA/1yoinIgscA2Byx5V4RfQ=;
	b=ZkryKvgmd0e+udtYS7gJVBJHRTNMBIfosxt+KiVmLQxSNI59vFGZgODuz4e/0T9gj4
	ET96t7+j0TvHY9ENQhhL9yAJ4tKbIbXBJ/Np0WZs+nun3Ugww8YnWiEAsyaD3Pwnamkl
	jp2H+rK/GNpveCw3aRTSHCHYjgnpIIDX1WFTW0R5yc+yOGAkzEwb8f+5B1d+UelzHEaA
	sa0Sx6ZqgnGtlCrHySYH9qWh212cWKLuy5lVoE8TBTVSForbuhNScXLrItHzssMHBFcY
	E6iCvtQ0JLNx4vm1oSlFSljDfwI/zJx12Etxcu00H0DqwkJNnuB1cHIzP0GuKppYTzXt
	L8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qbo/YfVo1IP9OKLxjf5wDA/1yoinIgscA2Byx5V4RfQ=;
	b=dIpYEx3C1qtwKjOO3lm160QkQDNQVKRfyvHZki1mL+0CNVR1F7jWNpKSMyYvtge5BX
	r0d03YqkmtsSwJTFzReD5NPja+MCKHJvZW+2kT8kzN6psBIJkY/B4WAETaCtJigqE461
	JkSnaeJWoVkMfY9bIJ978E8ZFPqieyocWQIYsTqfY7LI3dLcvkohz2CnD3o6/DlXslZq
	8Kk5IoRDxHLcIbrCqvp0gNYsELpf/gdo0b63MX2veDhwtip30+uiqIhG4UjOLEqCJh/5
	9p8T3Ri/Ou7g0vON+Xig0QkxwZyidRxCiLTN0FsMFz66FGtc4tfY1jdIDC+Vw7OaEW2+
	Myfw==
X-Gm-Message-State: APzg51D+3PwAKypsC55kgb0MFkF0ZROMpiAd2mCB+ARk2FtN9Hbinh2j
	KAex7XbMYkWM3vZU/jUL8Wkp1opV
X-Google-Smtp-Source: ANB0VdaPWv6ycsNmVURuI6v204GI2hBWx7I68Tc64U7n6+MjakdQkEc880Cplo+JdcDsT0IE0lFsBQ==
X-Received: by 2002:a5d:5009:: with SMTP id e9-v6mr749722wrt.18.1535451805500; 
	Tue, 28 Aug 2018 03:23:25 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	198-v6sm771823wmm.0.2018.08.28.03.23.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Aug 2018 03:23:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2018 12:23:14 +0200
Message-Id: <010e93a91991128a31f1dd4e30c08e425f733ec4.1535451643.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1535451643.git.alex.kanavin@gmail.com>
References: <cover.1535451643.git.alex.kanavin@gmail.com>
Subject: [RFC PATCH 3/6] openssl: update to 1.1.1
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
X-List-Received-Date: Tue, 28 Aug 2018 10:23:26 -0000

At the moment 1.1.1 is in pre-release stage, however the final release
should be available within a few weeks. The major selling point is that
it supports the new TLS 1.3 specification. It will also be the new long
term support version. More information:

https://www.openssl.org/policies/releasestrat.html

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...1-Take-linking-flags-from-LDFLAGS-env-var.patch | 43 ----------------------
 ...SLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch | 39 --------------------
 .../{openssl_1.1.0i.bb => openssl_1.1.1-pre9.bb}   | 23 +++++++-----
 3 files changed, 14 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.0i.bb => openssl_1.1.1-pre9.bb} (83%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch b/meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
deleted file mode 100644
index 6ce4e47..0000000
--- a/meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 08face4353d80111973aba9c1304c92158cfad0e Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 28 Mar 2017 16:40:12 +0300
-Subject: [PATCH] Take linking flags from LDFLAGS env var
-
-This fixes "No GNU_HASH in the elf binary" issues.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- Configurations/unix-Makefile.tmpl | 2 +-
- Configure                         | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
-index c029817..43b769b 100644
---- a/Configurations/unix-Makefile.tmpl
-+++ b/Configurations/unix-Makefile.tmpl
-@@ -173,7 +173,7 @@ CROSS_COMPILE= {- $config{cross_compile_prefix} -}
- CC= $(CROSS_COMPILE){- $target{cc} -}
- CFLAGS={- our $cflags2 = join(" ",(map { "-D".$_} @{$target{defines}}, @{$config{defines}}),"-DOPENSSLDIR=\"\\\"\$(OPENSSLDIR)\\\"\"","-DENGINESDIR=\"\\\"\$(ENGINESDIR)\\\"\"") -} {- $target{cflags} -} {- $config{cflags} -}
- CFLAGS_Q={- $cflags2 =~ s|([\\"])|\\$1|g; $cflags2 -} {- $config{cflags} -}
--LDFLAGS= {- $target{lflags} -}
-+LDFLAGS= {- $target{lflags}." ".$ENV{'LDFLAGS'} -}
- PLIB_LDFLAGS= {- $target{plib_lflags} -}
- EX_LIBS= {- $target{ex_libs} -} {- $config{ex_libs} -}
- LIB_CFLAGS={- $target{shared_cflag} || "" -}
-diff --git a/Configure b/Configure
-index aee7cc3..274d236 100755
---- a/Configure
-+++ b/Configure
-@@ -979,7 +979,7 @@ $config{build_file} = $target{build_file};
- $config{defines} = [];
- $config{cflags} = "";
- $config{ex_libs} = "";
--$config{shared_ldflag} = "";
-+$config{shared_ldflag} = $ENV{'LDFLAGS'};
- 
- # Make sure build_scheme is consistent.
- $target{build_scheme} = [ $target{build_scheme} ]
--- 
-2.11.0
-
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch b/meta/recipes-connectivity/openssl/openssl/0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch
deleted file mode 100644
index 67d06fc..0000000
--- a/meta/recipes-connectivity/openssl/openssl/0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 26e98beb8a987cdc69699aaffc5599926fb1b293 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Fri, 17 Aug 2018 20:33:44 -0700
-Subject: [PATCH] allow OPENSSLDIR and ENGINESDIR CFLAGS to be controlled
-
-Upstream-Status: Inappropriate [OE Specific]
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- Configurations/unix-Makefile.tmpl | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
-index 034d93e..2310d12 100644
---- a/Configurations/unix-Makefile.tmpl
-+++ b/Configurations/unix-Makefile.tmpl
-@@ -156,6 +156,10 @@ LIBDIR={- #
- ENGINESDIR={- use File::Spec::Functions;
-               catdir($prefix,$libdir,"engines-$sover") -}
- 
-+# Intermediate variables so the values defined via CFLAGS can be controlled.
-+OE_DOPENSSLDIR=$(OPENSSLDIR)
-+OE_DENGINESDIR=$(ENGINESDIR)
-+
- # Convenience variable for those who want to set the rpath in shared
- # libraries and applications
- LIBRPATH=$(INSTALLTOP)/$(LIBDIR)
-@@ -174,7 +178,7 @@ HTMLSUFFIX=html
- 
- CROSS_COMPILE= {- $config{cross_compile_prefix} -}
- CC= $(CROSS_COMPILE){- $target{cc} -}
--CFLAGS={- our $cflags2 = join(" ",(map { "-D".$_} @{$target{defines}}, @{$config{defines}}),"-DOPENSSLDIR=\"\\\"\$(OPENSSLDIR)\\\"\"","-DENGINESDIR=\"\\\"\$(ENGINESDIR)\\\"\"") -} {- $target{cflags} -} {- $config{cflags} -}
-+CFLAGS={- our $cflags2 = join(" ",(map { "-D".$_} @{$target{defines}}, @{$config{defines}}),"-DOPENSSLDIR=\"\\\"\$(OE_DOPENSSLDIR)\\\"\"","-DENGINESDIR=\"\\\"\$(OE_DENGINESDIR)\\\"\"") -} {- $target{cflags} -} {- $config{cflags} -}
- CFLAGS_Q={- $cflags2 =~ s|([\\"])|\\$1|g; $cflags2 -} {- $config{cflags} -}
- LDFLAGS= {- $target{lflags}." ".$ENV{'LDFLAGS'} -}
- PLIB_LDFLAGS= {- $target{plib_lflags} -}
--- 
-1.9.1
-
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
similarity index 83%
rename from meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
index a03f6ff..1917c33 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
@@ -13,26 +13,30 @@ DEPENDS = "hostperl-runtime-native"
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
-           file://0001-Take-linking-flags-from-LDFLAGS-env-var.patch \
-           file://0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[md5sum] = "9495126aafd2659d357ea66a969c3fe1"
-SRC_URI[sha256sum] = "ebbfc844a8c8cc0ea5dc10b86c9ce97f401837f3fa08c17b2cdadc118253cf99"
+SRC_URI[md5sum] = "6aa32e976e2c9a4aee858ced135d2573"
+SRC_URI[sha256sum] = "95ebdfbb05e8451fb01a186ccaa4a7da0eff9a48999ede9fe1a7d90db75ccb4c"
 
 inherit lib_package multilib_header ptest
 
 #| ./libcrypto.so: undefined reference to `getcontext'
 #| ./libcrypto.so: undefined reference to `setcontext'
 #| ./libcrypto.so: undefined reference to `makecontext'
-EXTRA_OECONF_append_libc-musl = " -DOPENSSL_NO_ASYNC"
+CPPFLAGS_append_libc-musl = " -DOPENSSL_NO_ASYNC"
 
-EXTRA_OEMAKE_append_class-native = " OE_DOPENSSLDIR='/not/builtin' OE_DENGINESDIR='/not/builtin'"
-EXTRA_OEMAKE_append_class-nativesdk = " OE_DOPENSSLDIR='/not/builtin' OE_DENGINESDIR='/not/builtin'"
+# This prevents openssl from using getrandom() which is not available on older glibc versions
+# (native versions can be built with newer glibc, but then relocated onto a system with older glibc)
+EXTRA_OECONF_class-native = "--with-rand-seed=devrandom"
+EXTRA_OECONF_class-nativesdk = "--with-rand-seed=devrandom"
+
+# Relying on hardcoded built-in paths causes openssl-native to not be relocateable from sstate.
+CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
+CFLAGS_append_class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
 
 do_configure () {
 	os=${HOST_OS}
@@ -98,8 +102,9 @@ do_configure () {
 	if [ "x$useprefix" = "x" ]; then
 		useprefix=/
 	fi
-	libdirleaf="$(echo ${libdir} | sed s:$useprefix::)"
-	perl ./Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=$libdirleaf $target
+	# WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
+	# environment variables set by bitbake. Adjust the environment variables instead.
+	perl ./Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
 }
 
 do_install () {
-- 
2.7.4


