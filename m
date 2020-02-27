Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9AE0F6189A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 20:56:11 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id j7so300167plt.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 12:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AnEDj4nIHYTIQMrclYt91iOjQAVk0ZO8xcJY5rtqb6k=;
	b=kCr4qJ0ToqZJ6jerSyxQ/AcgBSMYorvhqHHWXPLG3wYK5H0smrQpSzOy6Zf2EOnSo6
	Ma9d90Q8wpkJOtqkEKIXqS4BCvJCThVBBYNo7ZHwBHf5F9ipX8uefuTD8tuO4nQSYcN9
	r3+ZTjWo1d8FOP+3zHEDRT5sMyfZTVCVDKVAdHbKfuohcFYNJ9GJH+36ERFVuHvhTqIe
	HF5pWsjrL0DsBOrr5jWMql6WUq1Eu7CFC48koYFlzh9wYxx+c1NnofbqvWxNFqiP2wB9
	6if0a+0/W4ODCv2tBC6meUYxfWqXfqSA+OxwAP91gB+NY3aU9tnAHecamTzqlfimzRUH
	gisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AnEDj4nIHYTIQMrclYt91iOjQAVk0ZO8xcJY5rtqb6k=;
	b=fEzYWf+Hr8hYbQDtYIidT4UGSP2l/+4A9TkZKyqeSHqB8tyaO4nRksD0np6OTH6ZfC
	Mh1KUit3fUNc/y8S9Zy53CIzBKopB9txhKCw96pG/BgHsCwdP1O5myKO6pN6DSmARH09
	pcQ/MGj7rFD31NI64S4qwjeh/8kFNrPhEl7nmmB1HwEoiAgtpw6HiKgYvWv2NeGqyeEG
	VqpBDorZr1RjlnQy9KnWz/D7mDu2SB+mTcgxDHeEPks97lMXXQZELG8Esco3Us+f38kP
	VYo9Bf3CgSRj9j630CXe+Cb5sRndLJi5Xk5D81Jr01a35mC21SbqXr0f6GaWEPoiOF0c
	S8Gg==
X-Gm-Message-State: APjAAAX//Fu7Z6Q86EJdVqJ6i54Hnfcmfhdw3Zw3b/C03+siBq5R0Zq2
	C1hheKTm/XXwa6zBXNMQrpSOiciK
X-Google-Smtp-Source: APXvYqyurkDUFpvDJauTM4PZz0K37L1XHZVADT2PH/GQS/9G4hiUYX+lF4KfSnWL+HBcO08dkykBjw==
X-Received: by 2002:a17:90a:f492:: with SMTP id
	bx18mr898062pjb.118.1582836971986; 
	Thu, 27 Feb 2020 12:56:11 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:3d0b:bd00:40e0:2589])
	by smtp.gmail.com with ESMTPSA id
	f43sm7150784pje.23.2020.02.27.12.56.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 12:56:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2020 12:56:08 -0800
Message-Id: <20200227205608.26788-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200227205608.26788-1-akuster808@gmail.com>
References: <20200227205608.26788-1-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH 2/2] bind: Update to latest ESV version 9.16
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
X-List-Received-Date: Thu, 27 Feb 2020 20:56:11 -0000

From: Armin Kuster <akuster@mvista.com>

Removed obsolete packageconfig options

License change to MPL-2.0
https://gitlab.isc.org/isc-projects/bind9/blob/master/LICENSE

Refreshed:
bind-ensure-searching-for-json-headers-searches-sysr.patch
0001-named-lwresd-V-and-start-log-hide-build-options.patch

Drop obsolete patch: 0001-configure.in-remove-useless-L-use_openssl-lib.patch

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ....in-remove-useless-L-use_openssl-lib.patch | 30 --------------
 ...d-V-and-start-log-hide-build-options.patch | 33 +++++++--------
 ...ching-for-json-headers-searches-sysr.patch | 14 +++----
 .../bind/{bind_9.11.13.bb => bind_9.16.0.bb}  | 40 +++++++------------
 4 files changed, 38 insertions(+), 79 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
 rename meta/recipes-connectivity/bind/{bind_9.11.13.bb => bind_9.16.0.bb} (77%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch b/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
deleted file mode 100644
index 9d31b98080..0000000000
--- a/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 2325a92f1896a2a7f586611686801b41fbc91b50 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 27 Aug 2018 15:00:51 +0800
-Subject: [PATCH] configure.in: remove useless `-L$use_openssl/lib'
-
-Since `--with-openssl=${STAGING_DIR_HOST}${prefix}' is used in bind recipe,
-the `-L$use_openssl/lib' has a hardcoded suffix, removing it is harmless
-and helpful for clean up host build path in isc-config.sh
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index e85a5c6..2bbfc58 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1631,7 +1631,7 @@ If you don't want OpenSSL, use --without-openssl])
- 				fi
- 				;;
- 			*)
--				DST_OPENSSL_LIBS="-L$use_openssl/lib -lcrypto"
-+				DST_OPENSSL_LIBS="-lcrypto"
- 				;;
- 			esac
- 		fi
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 75908aa638..5bcc16c9b2 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -12,23 +12,24 @@ $ named -V
 Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Refreshed for 9.16.0
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
 ---
  bin/named/include/named/globals.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/bin/named/include/named/globals.h b/bin/named/include/named/globals.h
-index ba3457e..7741da7 100644
---- a/bin/named/include/named/globals.h
-+++ b/bin/named/include/named/globals.h
-@@ -68,7 +68,7 @@ EXTERN const char *		ns_g_version		INIT(VERSION);
- EXTERN const char *		ns_g_product		INIT(PRODUCT);
- EXTERN const char *		ns_g_description	INIT(DESCRIPTION);
- EXTERN const char *		ns_g_srcid		INIT(SRCID);
--EXTERN const char *		ns_g_configargs		INIT(CONFIGARGS);
-+EXTERN const char *		ns_g_configargs		INIT("*** (options are hidden)");
- EXTERN const char *		ns_g_builder		INIT(BUILDER);
- EXTERN in_port_t		ns_g_port		INIT(0);
- EXTERN isc_dscp_t		ns_g_dscp		INIT(-1);
--- 
-2.7.4
-
+Index: bind-9.16.0/bin/named/include/named/globals.h
+===================================================================
+--- bind-9.16.0.orig/bin/named/include/named/globals.h
++++ bind-9.16.0/bin/named/include/named/globals.h
+@@ -69,7 +69,7 @@ EXTERN const char *named_g_version     I
+ EXTERN const char *named_g_product     INIT(PRODUCT);
+ EXTERN const char *named_g_description INIT(DESCRIPTION);
+ EXTERN const char *named_g_srcid       INIT(SRCID);
+-EXTERN const char *named_g_configargs  INIT(CONFIGARGS);
++EXTERN const char *named_g_configargs  INIT("*** (options are hidden)");
+ EXTERN const char *named_g_builder     INIT(BUILDER);
+ EXTERN in_port_t named_g_port	       INIT(0);
+ EXTERN isc_dscp_t named_g_dscp	       INIT(-1);
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 84559e5f37..19f1a25ad7 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -32,16 +32,16 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index 17392fd..e85a5c6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2449,7 +2449,7 @@ case "$use_libjson" in
- 		libjson_libs=""
+Index: bind-9.16.0/configure.ac
+===================================================================
+--- bind-9.16.0.orig/configure.ac
++++ bind-9.16.0/configure.ac
+@@ -1214,7 +1214,7 @@ case "$use_lmdb" in
+ 		lmdb_libs=""
  		;;
  	auto|yes)
 -		for d in /usr /usr/local /opt/local
 +		for d in "${STAGING_INCDIR}"
  		do
- 			if test -f "${d}/include/json/json.h"
+ 			if test -f "${d}/include/lmdb.h"
  			then
diff --git a/meta/recipes-connectivity/bind/bind_9.11.13.bb b/meta/recipes-connectivity/bind/bind_9.16.0.bb
similarity index 77%
rename from meta/recipes-connectivity/bind/bind_9.11.13.bb
rename to meta/recipes-connectivity/bind/bind_9.16.0.bb
index 4e64171cc1..62e9be4c87 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.13.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.0.bb
@@ -2,12 +2,12 @@ SUMMARY = "ISC Internet Domain Name Server"
 HOMEPAGE = "http://www.isc.org/sw/bind/"
 SECTION = "console/network"
 
-LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8f17f64e47e83b60cd920a1e4b54419e"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=188b8d0644bd6835df43b84e3f180be1"
 
-DEPENDS = "openssl libcap zlib"
+DEPENDS = "openssl libcap zlib libuv"
 
-SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://conf.patch \
            file://named.service \
            file://bind9 \
@@ -15,22 +15,20 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://make-etc-initd-bind-stop-work.patch \
            file://init.d-add-support-for-read-only-rootfs.patch \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
-           file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[md5sum] = "17de0d024ab1eac377f1c2854dc25057"
-SRC_URI[sha256sum] = "fd3f3cc9fcfcdaa752db35eb24598afa1fdcc2509d3227fc90a8631b7b400f7d"
+SRC_URI[md5sum] = "f973848bf32797c5f546de7d92a6fd07"
+SRC_URI[sha256sum] = "af4bd9bdaeb1aa7399429972f3a8aa01dd6886b7ae046d703ab8da45330f2e28"
+SRC_URI[sha1sum] = "01678973598db55dfb03cd12a004d3d75a8ab2bf"
+SRC_URI[sha384sum] = "29df1a4a9d2a460ff970ea3d9abb47ff1204c762fa5c23da0627b0eeb847560f706d333796f61c5aeba09b8333532359"
+SRC_URI[sha512sum] = "6f836fe4cb12d3e2e3a871f69e5b249b2bae6ae1dc542395c79cc974ca95aa595e963b6716a38f6c9d5cb3c54ec606fcd932412a6fbe596651123ac1379dd010"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
-# stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by 4
+# stay at 9.16 follow the ESV versions divisible by 4
 UPSTREAM_CHECK_REGEX = "(?P<pver>9.(11|16|20|24|28)(\.\d+)+(-P\d+)*)/"
 
-# BIND >= 9.11.2 need dhcpd >= 4.4.0,
-# don't report it here since dhcpd is already recent enough.
-CVE_CHECK_WHITELIST += "CVE-2019-6470"
-
 inherit autotools update-rc.d systemd useradd pkgconfig multilib_script multilib_header
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/bind9-config ${PN}:${bindir}/isc-config.sh"
@@ -40,17 +38,14 @@ PACKAGECONFIG ?= "readline"
 PACKAGECONFIG[httpstats] = "--with-libxml2=${STAGING_DIR_HOST}${prefix},--without-libxml2,libxml2"
 PACKAGECONFIG[readline] = "--with-readline=-lreadline,,readline"
 PACKAGECONFIG[libedit] = "--with-readline=-ledit,,libedit"
-PACKAGECONFIG[urandom] = "--with-randomdev=/dev/urandom,--with-randomdev=/dev/random,,"
 PACKAGECONFIG[python3] = "--with-python=yes --with-python-install-dir=${PYTHON_SITEPACKAGES_DIR} , --without-python, python3-ply-native,"
 
-ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
-EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
-                 --disable-devpoll --enable-epoll --with-gost=no \
-                 --with-gssapi=no --with-ecdsa=yes --with-eddsa=no \
-                 --with-lmdb=no \
+EXTRA_OECONF = " --with-libtool --disable-devpoll --enable-epoll \
+                 --with-gssapi=no --with-lmdb=no --with-zlib \
                  --sysconfdir=${sysconfdir}/bind \
                  --with-openssl=${STAGING_DIR_HOST}${prefix} \
                "
+LDFLAGS_append = " -lz"
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native distutils3-base', '', d)}
 
@@ -66,13 +61,6 @@ INITSCRIPT_PARAMS = "defaults"
 
 SYSTEMD_SERVICE_${PN} = "named.service"
 
-do_install_prepend() {
-	# clean host path in isc-config.sh before the hardlink created
-	# by "make install":
-	#   bind9-config -> isc-config.sh
-	sed -i -e "s,${STAGING_LIBDIR},${libdir}," ${B}/isc-config.sh
-}
-
 do_install_append() {
 
 	rmdir "${D}${localstatedir}/run"
@@ -130,7 +118,7 @@ FILES_${PN}-dev += "${bindir}/isc-config.h"
 FILES_${PN} += "${sbindir}/generate-rndc-key.sh"
 
 PACKAGE_BEFORE_PN += "${PN}-libs"
-FILES_${PN}-libs = "${libdir}/*.so*"
+FILES_${PN}-libs = "${libdir}/*.so* ${libdir}/named/*.so*"
 FILES_${PN}-staticdev += "${libdir}/*.la"
 
 PACKAGE_BEFORE_PN += "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-bind', '', d)}"
-- 
2.17.1


