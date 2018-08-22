Return-Path: <armccurdy@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id BF4E37916C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 00:43:35 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id h69-v6so128540pfd.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 17:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=iazPc13ViUmUY9LYiKq5EC2G1Bez6Fp7+eRbKN1BUqw=;
	b=ZANWh8K3bPNOyNsDb4RrT1hitNP2lXEB5IF/Q1n8VUxi98pbadLgj+exSjGUP7eNLm
	h/KzLBU8dadrTTGIGcWm41hfU9d7obWNrozfzy0SyTinpqXMnyTwKZaJX65LbHY+mGS7
	20Qt8UiH6wO3dhi3I9dwlouXutIjRvol7rXD79qn8ReIbGJtnpuDRnIxXhtlfPS1zKY8
	zRj18TRVAycFYindIis4I/KYhLEoiPr2KhjiN24b1RN+94HxBsXw5w7BbNTa/NjsiNdM
	DLhOjn1dwMcTaThjIsI+zvXUvw7EFahH3SN+qzdxcIWkre9S9VrX4085CvbLLdBa26CH
	pswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iazPc13ViUmUY9LYiKq5EC2G1Bez6Fp7+eRbKN1BUqw=;
	b=XNCqO1wQTWsXKVeDDmUcZrcpCdC3KPIWouj1uayG5fSHdv0uXKs7bOMMTRezO5lm0m
	W02slYZKqHSF+UfcBRplZ+JN/EuM1lqcwE3sLMKTFZ59FjxQxSVJPdzllcEPYdwi3pAB
	NKGKj9fqoPPyLTVv9aQ6yGgDA8AGn+ul2bIJzYJ2Uk1UOqVhtJzzDLrsX3KagPI1b2kR
	P+ezDmZ5zfecBgj6R2g2TkyqEEiIuZ5emc9s8MhlYVbNl8VLIZ6EuU75MGa7J2HjLTDB
	V9R8RM/r4x7k9L1FWLMdXiOH3PHCbzVXTsbDoqNT3eDhxJSfg1C/GlAQcBeib/4RIbDS
	gFJQ==
X-Gm-Message-State: AOUpUlFApuZZS1k3qKZqzpcO8/Sq0Z9WaUUm6kbk/JbJpODK4joCl7e9
	kQ0+uYqoN9QP8QTyuJl+BMeTuMXo
X-Google-Smtp-Source: AA+uWPyaCAUEffS+0/z1v73DCOj8s6p94q4sUnd0zd7zSi2LyxaWhWOXoZWUcvKcob/mcUlehNRyfg==
X-Received: by 2002:a63:d518:: with SMTP id
	c24-v6mr48894601pgg.357.1534898616547; 
	Tue, 21 Aug 2018 17:43:36 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	h24-v6sm176217pgj.10.2018.08.21.17.43.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Aug 2018 17:43:36 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Aug 2018 17:43:28 -0700
Message-Id: <1534898610-15319-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/3] gnutls: merge gnutls.inc into the gnutls recipe
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
X-List-Received-Date: Wed, 22 Aug 2018 00:43:35 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc      | 59 --------------------------
 meta/recipes-support/gnutls/gnutls_3.6.3.bb | 65 +++++++++++++++++++++++++++--
 2 files changed, 61 insertions(+), 63 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls.inc

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
deleted file mode 100644
index f204e5f..0000000
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ /dev/null
@@ -1,59 +0,0 @@
-SUMMARY = "GNU Transport Layer Security Library"
-HOMEPAGE = "http://www.gnu.org/software/gnutls/"
-BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
-
-LICENSE = "GPLv3+ & LGPLv2.1+"
-LICENSE_${PN} = "LGPLv2.1+"
-LICENSE_${PN}-xx = "LGPLv2.1+"
-LICENSE_${PN}-bin = "GPLv3+"
-LICENSE_${PN}-openssl = "GPLv3+"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=71391c8e0c1cfe68077e7fce3b586283 \
-                    file://doc/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://doc/COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
-
-DEPENDS = "nettle gmp virtual/libiconv libunistring"
-DEPENDS_append_libc-musl = " argp-standalone"
-
-SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
-
-SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz"
-
-inherit autotools texinfo binconfig pkgconfig gettext lib_package gtk-doc
-
-PACKAGECONFIG ??= "libidn"
-
-# You must also have CONFIG_SECCOMP enabled in the kernel for
-# seccomp to work.
-PACKAGECONFIG[seccomp] = "ac_cv_libseccomp=yes,ac_cv_libseccomp=no,libseccomp"
-PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
-PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
-PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
-PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
-PACKAGECONFIG[ssl3] = "--enable-ssl3-support,--disable-ssl3-support,"
-PACKAGECONFIG[tls13] = "--enable-tls13-support,--disable-tls13-support,"
-
-EXTRA_OECONF = " \
-    --enable-doc \
-    --disable-libdane \
-    --disable-guile \
-    --disable-rpath \
-    --enable-local-libopts \
-    --enable-openssl-compatibility \
-    --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
-    --without-libunistring-prefix \
-"
-
-LDFLAGS_append_libc-musl = " -largp"
-
-do_configure_prepend() {
-	for dir in . lib; do
-		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
-	done
-}
-
-PACKAGES =+ "${PN}-openssl ${PN}-xx"
-
-FILES_${PN}-dev += "${bindir}/gnutls-cli-debug"
-FILES_${PN}-openssl = "${libdir}/libgnutls-openssl.so.*"
-FILES_${PN}-xx = "${libdir}/libgnutlsxx.so.*"
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.3.bb b/meta/recipes-support/gnutls/gnutls_3.6.3.bb
index c560305..dcb211e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.3.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.3.bb
@@ -1,10 +1,67 @@
-require gnutls.inc
+SUMMARY = "GNU Transport Layer Security Library"
+HOMEPAGE = "http://www.gnu.org/software/gnutls/"
+BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
 
-SRC_URI += "file://0001-configure.ac-fix-sed-command.patch \
-            file://arm_eabi.patch \
-           "
+LICENSE = "GPLv3+ & LGPLv2.1+"
+LICENSE_${PN} = "LGPLv2.1+"
+LICENSE_${PN}-xx = "LGPLv2.1+"
+LICENSE_${PN}-bin = "GPLv3+"
+LICENSE_${PN}-openssl = "GPLv3+"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=71391c8e0c1cfe68077e7fce3b586283 \
+                    file://doc/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://doc/COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+DEPENDS = "nettle gmp virtual/libiconv libunistring"
+DEPENDS_append_libc-musl = " argp-standalone"
+
+SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
+
+SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
+           file://0001-configure.ac-fix-sed-command.patch \
+           file://arm_eabi.patch \
+"
 
 SRC_URI[md5sum] = "d3b1b05c2546b80832101a423a80faf8"
 SRC_URI[sha256sum] = "ed642b66a4ecf4851ab2d809cd1475c297b6201d8e8bd14b4d1c08b53ffca993"
 
+inherit autotools texinfo binconfig pkgconfig gettext lib_package gtk-doc
+
+PACKAGECONFIG ??= "libidn"
+
+# You must also have CONFIG_SECCOMP enabled in the kernel for
+# seccomp to work.
+PACKAGECONFIG[seccomp] = "ac_cv_libseccomp=yes,ac_cv_libseccomp=no,libseccomp"
+PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
+PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
+PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
+PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
+PACKAGECONFIG[ssl3] = "--enable-ssl3-support,--disable-ssl3-support,"
+PACKAGECONFIG[tls13] = "--enable-tls13-support,--disable-tls13-support,"
+
+EXTRA_OECONF = " \
+    --enable-doc \
+    --disable-libdane \
+    --disable-guile \
+    --disable-rpath \
+    --enable-local-libopts \
+    --enable-openssl-compatibility \
+    --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
+    --without-libunistring-prefix \
+"
+
+LDFLAGS_append_libc-musl = " -largp"
+
+do_configure_prepend() {
+	for dir in . lib; do
+		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
+	done
+}
+
+PACKAGES =+ "${PN}-openssl ${PN}-xx"
+
+FILES_${PN}-dev += "${bindir}/gnutls-cli-debug"
+FILES_${PN}-openssl = "${libdir}/libgnutls-openssl.so.*"
+FILES_${PN}-xx = "${libdir}/libgnutlsxx.so.*"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


