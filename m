Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A7B910A62F1
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:30:42 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48780.1774535432484290720
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JG0HV8QU;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4870206f73bso6040755e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 07:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535431; x=1775140231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H47I2lMV51nvA7P/8f4uYlnI3ivh8ZSvej4vTyyfk84=;
        b=JG0HV8QUOPrrQHWIlrfwmXaTlAwwR7Zivi/zO+tGXw+LEhcjUnPgsShnro580yjzp/
         Cq9tvxLqZSFyPLjJmoss+N21uyTuIajN1OQwGMp4Fi9EO8sZoDeXhNhs2qCC/miBsuSi
         nvvja6tvSRqPpqkjW4SicAPiLNt0vrmy4dplGzWqomG89wpXavk0FiiEXpKrGADISYwE
         sNz/L5+XvIvjehWYOge7rz2x20x7TwzQMwtrTjCB4JMWz2NWztaBlLv852n9OIXuEH1F
         LnXASRHyJqJoTagmcdqQuzbCfgH09e+U2ONXWKO72KIOf22on76g4JokPEXYwoMY73bg
         eeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535431; x=1775140231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H47I2lMV51nvA7P/8f4uYlnI3ivh8ZSvej4vTyyfk84=;
        b=XiMO5i3+JHJ2ni9ToaofgOzFuge7PKIL4WB4EettUYL9xgGrCc+7ED5u0j4HKZqkhL
         Q/fdlwfmC/5/Y1cXCOc24D65lXMFtJKOPv4Blyi/ggEG0WNht2xZ2RQmmUN2oh0/1kCa
         mpQG+/+ZFL4+Lmkz2wUvRgVCEJqaoMJ2+tFVOlgF+z46gQQ0ROL/LoB/lJttJZ6GcJpY
         50CEMR7u3S6FmtkSjT3xxO5TGyR/bspZ09Np9qIwl6oMiEpYeDIYiuBDg9PI0soD+lHi
         7/HZYS6d5mQ62u6C6rK1bew6RqZaD2zf/FMFpKrxFk8JeFZjRIShjWLG/AgYhEtrD9ig
         7lTQ==
X-Gm-Message-State: AOJu0YydZa5dXxb8zCT+ICT+FaeME08i9WcVoqDZnYj/nlosCIqV8JIu
	ZVKykulCwOjnO8pqw0k1zdjbmpiMVF91BoSGylZWYp0UqmklaY4Lak8C1yoSJQ==
X-Gm-Gg: ATEYQzxYCvCA2tbM4pzqaflH2K5kIgLrxZLxfYJPL6+YgTIkzkp7a92jHMN47JWju9F
	wuvaZyKbq9vTPDy1a9xNvlxXffiv8DqhVFm40j5v9x1xv4utCxrwGXgO40QLIBTfsjYaFuYAdmO
	CjsSwDStsKseLn5Lj1nL/hfGyrEma4P0GRFd7B2Z1v3N8p4BN16vq4bOmGu6sPqnl6IoIIrgpFV
	wFL/RIE8LcbIYItBllgZe8Z0MtHDUktbfpQz6D7LqPUkuyyYECxVt35Nxix3CexinmEF72miaKT
	AuePtl7QtOpzmiYohf4nJ2Vy+2qqBzIwA5evEcV+pYQr1u3ZgRthtUBDGmbJ75SL25yWrCKpmRT
	I+dxs8mNHqxZzeH2YvDPTdDDQVZ1lD3asnHAe5jARh+Y5oZIlOlFSRZQIXJzmbHlrYtsPkHU3/L
	RQDaZdTH/IusOFeA==
X-Received: by 2002:a05:600c:1913:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-48716061795mr114274695e9.24.1774535430173;
        Thu, 26 Mar 2026 07:30:30 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b91942f24sm9162880f8f.11.2026.03.26.07.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:30:29 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 03/12] python3: Use the variables from python3-dir.bbclass
Date: Thu, 26 Mar 2026 15:30:11 +0100
Message-ID: <20260326143020.2083293-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326143020.2083293-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326143020.2083293-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 14:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234006

Replace using PYTHON_MAJMIN and various custom constructed
settings with inherit python3-dir and its variables.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../recipes-devtools/python/python3_3.14.3.bb | 56 +++++++++----------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb b/meta/recipes-devtools/python/python3_3.14.3.bb
index c23605f59c..12d1223d4c 100644
--- a/meta/recipes-devtools/python/python3_3.14.3.bb
+++ b/meta/recipes-devtools/python/python3_3.14.3.bb
@@ -47,19 +47,17 @@ UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
 CVE_PRODUCT = "python:python python_software_foundation:python cpython"
 
-PYTHON_MAJMIN = "3.14"
-
 S = "${UNPACKDIR}/Python-${PV}"
 
 BBCLASSEXTEND = "native nativesdk"
 
-inherit autotools pkgconfig qemu ptest multilib_header update-alternatives
+inherit autotools pkgconfig qemu python3-dir ptest multilib_header update-alternatives
 
 MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
 
 ALTERNATIVE:${PN}-dev = "python3-config"
-ALTERNATIVE_LINK_NAME[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config"
-ALTERNATIVE_TARGET[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}"
+ALTERNATIVE_LINK_NAME[python3-config] = "${bindir}/${PYTHON_DIR}-config"
+ALTERNATIVE_TARGET[python3-config] = "${bindir}/${PYTHON_DIR}-config-${MULTILIB_SUFFIX}"
 
 DEPENDS = "\
     autoconf-archive-native \
@@ -86,7 +84,7 @@ EXTRA_OECONF:append:class-native = " --bindir=${bindir}/${PN}"
 EXTRA_OECONF:append:class-target = " --with-build-python=nativepython3 PLATFORM_TRIPLET=${HOST_ARCH}-${HOST_OS}"
 EXTRA_OECONF:append:class-nativesdk = " --with-build-python=nativepython3"
 
-export CROSSPYTHONPATH = "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/"
+export CROSSPYTHONPATH = "${STAGING_LIBDIR_NATIVE}/${PYTHON_DIR}/lib-dynload/"
 
 EXTRANATIVEPATH += "python3-native"
 
@@ -185,7 +183,7 @@ do_install:prepend() {
 }
 
 do_install:append:class-target() {
-        oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
+        oe_multilib_header ${PYTHON_DIR}/pyconfig.h
 }
 
 do_install:append:class-native() {
@@ -210,20 +208,20 @@ do_install:append:class-native() {
 
         # Nothing should be looking into ${B} for python3-native
         sed -i -e 's:${B}:/build/path/unavailable/:g' \
-                ${D}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile
+                ${D}/${libdir}/${PYTHON_DIR}/config-${PYTHON_MAINVERSION}*/Makefile
 
         # disable the lookup in user's site-packages globally
-        sed -i 's#ENABLE_USER_SITE = None#ENABLE_USER_SITE = False#' ${D}${libdir}/python${PYTHON_MAJMIN}/site.py
+        sed -i 's#ENABLE_USER_SITE = None#ENABLE_USER_SITE = False#' ${D}${libdir}/${PYTHON_DIR}/site.py
 
         # python3-config needs to be in /usr/bin and not in a subdir of it to work properly
         mv ${D}/${bindir}/${PN}/python*config ${D}/${bindir}/
 }
 
 do_install:append() {
-        for c in ${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py; do
+        for c in ${D}/${libdir}/${PYTHON_DIR}/_sysconfigdata*.py; do
             python3 ${UNPACKDIR}/reformat_sysconfig.py $c
         done
-        rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfigdata*.cpython*
+        rm -f ${D}${libdir}/${PYTHON_DIR}/__pycache__/_sysconfigdata*.cpython*
 
         mkdir -p ${D}${libdir}/python-sysconfigdata
         sysconfigfile=`find ${D} -name _sysconfig*.py`
@@ -231,8 +229,8 @@ do_install:append() {
                 -e "s,^ 'LIBDIR'.*, 'LIBDIR': '${STAGING_LIBDIR}'\,,g" \
                 -e "s,^ 'INCLUDEDIR'.*, 'INCLUDEDIR': '${STAGING_INCDIR}'\,,g" \
                 -e "s,^ 'CONFINCLUDEDIR'.*, 'CONFINCLUDEDIR': '${STAGING_INCDIR}'\,,g" \
-                -e "s,^ 'INCLUDEPY'.*, 'INCLUDEPY': '${STAGING_INCDIR}/python${PYTHON_MAJMIN}'\,,g" \
-                -e "s,^ 'CONFINCLUDEPY'.*, 'CONFINCLUDEPY': '${STAGING_INCDIR}/python${PYTHON_MAJMIN}'\,,g" \
+                -e "s,^ 'INCLUDEPY'.*, 'INCLUDEPY': '${STAGING_INCDIR}/${PYTHON_DIR}'\,,g" \
+                -e "s,^ 'CONFINCLUDEPY'.*, 'CONFINCLUDEPY': '${STAGING_INCDIR}/${PYTHON_DIR}'\,,g" \
                 -e "s,${B},/build/path/unavailable/,g" \
                 $sysconfigfile
         cp $sysconfigfile ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
@@ -248,7 +246,7 @@ do_install:append:class-nativesdk () {
     for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
          sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
     done
-    create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
+    create_wrapper ${D}${bindir}/${PYTHON_DIR} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
 }
 
 do_install_ptest:append:class-target:libc-musl () {
@@ -264,7 +262,7 @@ SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " provide_target_config_script
 provide_target_config_script() {
         install -d ${SYSROOT_DESTDIR}${prefix}/python-target-config/
         install ${D}/${bindir}/python3-config ${SYSROOT_DESTDIR}/${prefix}/python-target-config/
-        install ${D}/${bindir}/python${PYTHON_MAJMIN}-config ${SYSROOT_DESTDIR}/${prefix}/python-target-config/
+        install ${D}/${bindir}/${PYTHON_DIR}-config ${SYSROOT_DESTDIR}/${prefix}/python-target-config/
 }
 SYSROOT_DIRS += "${prefix}/python-target-config/"
 
@@ -287,13 +285,13 @@ py_package_preprocess () {
                 -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
                 -e 's:${RECIPE_SYSROOT}::g' \
                 -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
-                ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile \
-                ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py \
-                ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config
+                ${PKGD}/${libdir}/${PYTHON_DIR}/config-${PYTHON_MAINVERSION}*/Makefile \
+                ${PKGD}/${libdir}/${PYTHON_DIR}/_sysconfigdata*.py \
+                ${PKGD}/${bindir}/${PYTHON_DIR}-config
 
         # Reformat _sysconfigdata after modifying it so that it remains
         # reproducible
-        for c in ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py; do
+        for c in ${PKGD}/${libdir}/${PYTHON_DIR}/_sysconfigdata*.py; do
             python3 ${UNPACKDIR}/reformat_sysconfig.py $c
         done
 
@@ -308,7 +306,7 @@ py_package_preprocess () {
              -c "from py_compile import compile; compile('$sysconfigfile', optimize=2)"
         cd -
 
-        mv ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}
+        mv ${PKGD}/${bindir}/${PYTHON_DIR}-config ${PKGD}/${bindir}/${PYTHON_DIR}-config-${MULTILIB_SUFFIX}
 
         #Remove the unneeded copy of target sysconfig data
         rm -rf ${PKGD}/${libdir}/python-sysconfigdata
@@ -320,7 +318,7 @@ py_package_preprocess () {
                 -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
                 -e 's:${RECIPE_SYSROOT}::g' \
                 -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
-		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfig_vars*.json
+		${PKGD}/${libdir}/${PYTHON_DIR}/_sysconfig_vars*.json
 }
 
 # We want bytecode precompiled .py files (.pyc's) by default
@@ -421,7 +419,7 @@ do_create_manifest() {
     cp ${UNPACKDIR}/get_module_deps3.py ${WORKDIR}
     cd ${WORKDIR}
     # This needs to be executed by python-native and NOT by HOST's python
-    nativepython3 create_manifest3.py ${PYTHON_MAJMIN}
+    nativepython3 create_manifest3.py ${PYTHON_MAINVERSION}
     cp python3-manifest.json.new ${THISDIR}/python3/python3-manifest.json
 }
 
@@ -436,11 +434,12 @@ RRECOMMENDS:${PN}-crypt:append:class-nativesdk = " ${MLPREFIX}openssl ${MLPREFIX
 
 # For historical reasons PN is empty and provided by python3-modules
 FILES:${PN} = ""
+FILES:${PN}-core += "${bindir}/python${PYTHON_MAINVERSION} ${bindir}/python${PYTHON_BASEVERSION}"
 RPROVIDES:${PN}-modules = "${PN}"
 
-FILES:${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
-FILES:${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
-FILES:${PN}-tkinter += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so"
+FILES:${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAINVERSION} ${bindir}/pydoc3"
+FILES:${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAINVERSION}"
+FILES:${PN}-tkinter += "${libdir}/${PYTHON_DIR}/lib-dynload/_tkinter.*.so"
 
 # provide python-pyvenv from python3-venv
 RPROVIDES:${PN}-venv += "${MLPREFIX}python3-pyvenv"
@@ -448,13 +447,14 @@ RPROVIDES:${PN}-venv += "${MLPREFIX}python3-pyvenv"
 # package libpython3
 PACKAGES =+ "libpython3 libpython3-staticdev"
 FILES:libpython3 = "${libdir}/libpython*.so.*"
-FILES:libpython3-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}-*/libpython${PYTHON_MAJMIN}.a"
+FILES:libpython3-staticdev += "${libdir}/${PYTHON_DIR}/config-${PYTHON_MAINVERSION}-*/lib${PYTHON_DIR}.a"
 INSANE_SKIP:${PN}-dev += "dev-elf"
 INSANE_SKIP:${PN}-ptest = "dev-deps"
 
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
 RDEPENDS:${PN}-misc += "\
+    bash \
     ${PN}-audio \
     ${PN}-codecs \
     ${PN}-core \
@@ -466,7 +466,7 @@ RDEPENDS:${PN}-misc += "\
 RDEPENDS:${PN}-modules:append:class-target = " ${MLPREFIX}python3-misc"
 RDEPENDS:${PN}-modules:append:class-nativesdk = " ${MLPREFIX}python3-misc"
 RDEPENDS:${PN}-modules:append:class-target = " ${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '${MLPREFIX}python3-gdbm', '', d)}"
-FILES:${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MAJMIN}/lib-dynload"
+FILES:${PN}-misc = "${libdir}/${PYTHON_DIR} ${libdir}/${PYTHON_DIR}/lib-dynload"
 
 # catch manpage
 PACKAGES += "${PN}-man"
@@ -506,5 +506,5 @@ RDEPENDS:${PN}-tests:append:class-nativesdk = " ${MLPREFIX}bash"
 # Python's tests contain large numbers of files we don't need in the recipe sysroots
 SYSROOT_PREPROCESS_FUNCS += " py3_sysroot_cleanup"
 py3_sysroot_cleanup () {
-	rm -rf ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_MAJMIN}/test
+	rm -rf ${SYSROOT_DESTDIR}${libdir}/${PYTHON_DIR}/test
 }
-- 
2.53.0


