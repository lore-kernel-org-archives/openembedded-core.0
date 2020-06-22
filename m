Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web12.18500.1592835559145807871
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 07:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oFpXdqsx;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id k6so7630647pll.9
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7V4RtLXZLRIC2yUy/nyl+hsHzXab0Tnr4GkDpGzWIOE=;
        b=oFpXdqsx12yPozmeWP0PqwWLSprXIpvYh7+6/JR9WBtGPXCFRZWQ+bxwS4RschmkXU
         VF+4+4HWYpRPGVcZ08u6mqmUtTDwwepPvZKu8SypAYKi+1Cn+3J7D8hNl6iSRvku+7Rc
         jMXS8sEiC8rYqOI1LjOtG1cqb5RRepZ1OpERW+AiIFCBV3oLekBvpif3xfcu2XlTJYOW
         vtpZ4Q+kswS3C9kb+qSMPtlmJErwuJfBmGQnwbSEWlmmj20lm8O97qQvMW3QrRh2AtER
         o0EQF9K4DFoTCDbRoRdVCunkzNWfy+I5KFykxHIedCcTXETuhdLQAXrZKDSSf+FA6Oew
         534A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7V4RtLXZLRIC2yUy/nyl+hsHzXab0Tnr4GkDpGzWIOE=;
        b=K8oqNhQs9/LEAZ6PArI5IS6I7ltjWHcpAhLgcSuQ4gGvqG/3gWrzdijHvJPQKuWq0q
         9R91rfABAmWNVj1NHnjGstWx7cZ8ISqkjYTV5Sbju5sUELkrX9ARDA14HPPWgEPoZ3pc
         UzAdgcoPQMi5B28Lj0ANShAxeXl4oib2EGy6KsfKLKjCCG4m9H3eamnyiJI6xDEmZyGr
         2ZNLwxzijzBtvlULBMBH5zW5tUIAGx02o//+dqINBMs380yad3O3t25nrSzcqe/Wtjct
         jaHQRflGQzwLKpKBXmGYyq56sloeCqbSDdvGMWz22oBUFo5bAaHXFDtZlWc/5tZI30tu
         8Ijg==
X-Gm-Message-State: AOAM532noZzBEO8s9aJyuUZt5qGBZaqAX48OjbdpZS5q63W+60E9cAp9
	jpuHR8Lc3dzl501rfzPTIbpBF64r
X-Google-Smtp-Source: ABdhPJzxuXw0hoR5G6xnnJSEFHk0W2fwpsrhjA9XN03/1NRhvZYXtuucpS4i7fVf5oBMgIN0qGh08g==
X-Received: by 2002:a17:90a:ac05:: with SMTP id o5mr19049439pjq.228.1592835558190;
        Mon, 22 Jun 2020 07:19:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:489f:ae11:ae3f:a4e7])
        by smtp.gmail.com with ESMTPSA id 23sm14188840pfy.199.2020.06.22.07.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 07:19:17 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH 2/6] bind: Update to latest ESV version 9.16
Date: Mon, 22 Jun 2020 07:19:11 -0700
Message-Id: <20200622141915.31932-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622141915.31932-1-akuster808@gmail.com>
References: <20200622141915.31932-1-akuster808@gmail.com>

From: Armin Kuster <akuster@mvista.com>

Removed obsolete packageconfig options

License change to MPL-2.0
https://gitlab.isc.org/isc-projects/bind9/blob/master/LICENSE

Refreshed:
bind-ensure-searching-for-json-headers-searches-sysr.patch
0001-named-lwresd-V-and-start-log-hide-build-options.patch
bind-ensure-searching-for-json-headers-searches-sysr.patch

Drop obsolete patch: 0001-configure.in-remove-useless-L-use_openssl-lib.patch

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ....in-remove-useless-L-use_openssl-lib.patch | 30 ---------------
 ...d-V-and-start-log-hide-build-options.patch | 33 +++++++++--------
 ...ching-for-json-headers-searches-sysr.patch | 14 +++----
 .../bind/{bind_9.11.19.bb => bind_9.16.4.bb}  | 37 ++++++-------------
 4 files changed, 35 insertions(+), 79 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
 rename meta/recipes-connectivity/bind/{bind_9.11.19.bb => bind_9.16.4.bb} (77%)

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
index 84559e5f37..f9cdc7ca4d 100644
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
+Index: bind-9.16.4/configure.ac
+===================================================================
+--- bind-9.16.4.orig/configure.ac
++++ bind-9.16.4/configure.ac
+@@ -1232,7 +1232,7 @@ case "$use_lmdb" in
+ 		LMDB_LIBS=""
  		;;
  	auto|yes)
 -		for d in /usr /usr/local /opt/local
 +		for d in "${STAGING_INCDIR}"
  		do
- 			if test -f "${d}/include/json/json.h"
+ 			if test -f "${d}/include/lmdb.h"
  			then
diff --git a/meta/recipes-connectivity/bind/bind_9.11.19.bb b/meta/recipes-connectivity/bind/bind_9.16.4.bb
similarity index 77%
rename from meta/recipes-connectivity/bind/bind_9.11.19.bb
rename to meta/recipes-connectivity/bind/bind_9.16.4.bb
index 276173e09f..d55d662cee 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.19.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.4.bb
@@ -2,12 +2,12 @@ SUMMARY = "ISC Internet Domain Name Server"
 HOMEPAGE = "http://www.isc.org/sw/bind/"
 SECTION = "console/network"
 
-LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bf39058a7f64b2a934ce14dc9ec1dd45"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=188b8d0644bd6835df43b84e3f180be1"
 
-DEPENDS = "openssl libcap zlib"
+DEPENDS = "openssl libcap zlib libuv"
 
-SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://conf.patch \
            file://named.service \
            file://bind9 \
@@ -15,20 +15,15 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://make-etc-initd-bind-stop-work.patch \
            file://init.d-add-support-for-read-only-rootfs.patch \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
-           file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "0dee554a4caa368948b32da9a0c97b516c19103bc13ff5b3762c5d8552f52329"
+SRC_URI[sha256sum] = "7522088d3daac8bcabaae37998178e09139ef5ccae6631cb1d8a625b770f370a"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
-# stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by 4
-UPSTREAM_CHECK_REGEX = "(?P<pver>9.(11|16|20|24|28)(\.\d+)+(-P\d+)*)/"
-
-# BIND >= 9.11.2 need dhcpd >= 4.4.0,
-# don't report it here since dhcpd is already recent enough.
-CVE_CHECK_WHITELIST += "CVE-2019-6470"
+# stay at 9.16 follow the ESV versions divisible by 4
+UPSTREAM_CHECK_REGEX = "(?P<pver>9.(16|20|24|28)(\.\d+)+(-P\d+)*)/"
 
 inherit autotools update-rc.d systemd useradd pkgconfig multilib_script multilib_header
 
@@ -39,17 +34,14 @@ PACKAGECONFIG ?= "readline"
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
 
@@ -65,13 +57,6 @@ INITSCRIPT_PARAMS = "defaults"
 
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
@@ -129,7 +114,7 @@ FILES_${PN}-dev += "${bindir}/isc-config.h"
 FILES_${PN} += "${sbindir}/generate-rndc-key.sh"
 
 PACKAGE_BEFORE_PN += "${PN}-libs"
-FILES_${PN}-libs = "${libdir}/*.so*"
+FILES_${PN}-libs = "${libdir}/*.so* ${libdir}/named/*.so*"
 FILES_${PN}-staticdev += "${libdir}/*.la"
 
 PACKAGE_BEFORE_PN += "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-bind', '', d)}"
-- 
2.17.1

