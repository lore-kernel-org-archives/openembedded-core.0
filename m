Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id B18957964D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 11:15:26 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id j192-v6so10869634wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 04:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0i0DK+ixPmgmsBKhd1OI3gyTn3uhohl1ohgQ5CS7oog=;
	b=wh9sbqGEka7lzZNKEGwWuQ6VMJxB/9SfBwcDqnck9foMnFduZZ8dNrCspD/UGUJpfb
	F8n4NAxN8wfJipwLO9gNl1wrtDliONSbWZTAvyM9oCs34IqlsagHRdW7zE6bNfi0zBvq
	uxJ8l4rnYB9UTW0NCbSQB/yCjeygVCFoaRj3JbFORuY6NquCXekB/sDRjI4lMfn2N+pm
	N95ghOQYniyZb+fahZuv8ini1InZwmn/bNOyOQ21Xy7n241ryqoxNBCaaFFnPiSlYZ1h
	+SVLTI6+UH2txW6Wu3TXOokOh6G4FYVHWDaNqNlg6/P0g82OYyAlpEOh8hdp9A4a5sr/
	K1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0i0DK+ixPmgmsBKhd1OI3gyTn3uhohl1ohgQ5CS7oog=;
	b=NxdbjtAe8ZpZqmI2oIYN9D04y92IivUBWdLj3XhIRKheo7fknXBotKEOfX9NJ2KfZj
	h8nDiZA8I2f0IQJ628UpxCwJ7wQP7uuAHu4isGKNT5NApQd0+dwKO1wu+QHq5dBPcODA
	8j7bI7jCfrWUe3/ANyQoPybGtgdEh8YWHO3aesOs30tTbKqjngrLvBDRLwfB0kEanr2B
	VdZU3KfIeiCyv+CCp1U9uO8v2MiVxCNeIojR86GokT07WuKvl3HuyQpgHcjprylbPlQo
	1dMtcV4a0wWzINnmMd/5eZ1J9YI1ln4MbnaKsBwyPonhUtgad2D1RBi+oRxXZWSgxlUb
	f8gQ==
X-Gm-Message-State: APzg51BsYwL/tLLfJAHQ+EOeQ4Vyo+HLg9vZoAUKK801kPbDnRjGXw7b
	rf4oO4937JnfemXyNbfgYlS8FZRc0qs=
X-Google-Smtp-Source: ANB0VdaKru9PftSPNnj7DUcwcPgFjYDHwGRVXsZoNagiBmQ7AHqzlbjqeV6XTB8f43NGYpJdHXj2Ww==
X-Received: by 2002:a1c:4182:: with SMTP id
	o124-v6mr1778063wma.101.1536232526909; 
	Thu, 06 Sep 2018 04:15:26 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f6-v6sm5519173wrr.68.2018.09.06.04.15.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 04:15:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:15:18 +0100
Message-Id: <20180906111521.20997-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180906111521.20997-1-ross.burton@intel.com>
References: <20180906111521.20997-1-ross.burton@intel.com>
Subject: [PATCH 2/5] python3: add toggle for profile-guided-optimisation
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
X-List-Received-Date: Thu, 06 Sep 2018 11:15:26 -0000

Add a PACKAGECONFIG for profile-guided-optimisation, and default to whether
qemu-usermode is available.

Move --enable-optimizations to the pgo optimisation as all this currently does
is use the PGO rules, causing a performance hit if PGO isn't actually used.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3_3.5.5.bb | 54 +++++++++++++++------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
index 8e94e38a2d5..aad2e3abe60 100644
--- a/meta/recipes-devtools/python/python3_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3_3.5.5.bb
@@ -73,7 +73,8 @@ CACHED_CONFIGUREVARS = "ac_cv_have_chflags=no \
 TARGET_CC_ARCH += "-DNDEBUG -fno-inline"
 SDK_CC_ARCH += "-DNDEBUG -fno-inline"
 EXTRA_OEMAKE += "CROSS_COMPILE=yes"
-EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ --without-ensurepip --enable-optimizations"
+EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ --without-ensurepip"
+
 PYTHON3_PROFILE_TASK ?= "${S}/Tools/pybench/pybench.py -n 1"
 
 export CROSS_COMPILE = "${TARGET_PREFIX}"
@@ -87,8 +88,10 @@ export CROSSPYTHONPATH = "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dy
 # No ctypes option for python 3
 PYTHONLSBOPTS = ""
 
-PACKAGECONFIG ??= "readline"
+PACKAGECONFIG ??= "readline ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'pgo', '', d)}"
 PACKAGECONFIG[readline] = ",,readline"
+# Use profile guided optimisation by running PyBench inside qemu-user
+PACKAGECONFIG[pgo] = "--enable-optimizations"
 
 do_configure_append() {
 	rm -f ${S}/Makefile.orig
@@ -108,16 +111,16 @@ run_make() {
 }
 
 do_compile() {
-        # regenerate platform specific files, because they depend on system headers
-        cd ${S}/Lib/plat-linux*
-        include=${STAGING_INCDIR} ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
-                ${S}/Tools/scripts/h2py.py -i '(u_long)' \
-                ${STAGING_INCDIR}/dlfcn.h \
-                ${STAGING_INCDIR}/linux/cdrom.h \
-                ${STAGING_INCDIR}/netinet/in.h \
-                ${STAGING_INCDIR}/sys/types.h
-        sed -e 's,${STAGING_DIR_HOST},,g' -i *.py
-        cd -
+	# regenerate platform specific files, because they depend on system headers
+	cd ${S}/Lib/plat-linux*
+	include=${STAGING_INCDIR} ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
+		${S}/Tools/scripts/h2py.py -i '(u_long)' \
+		${STAGING_INCDIR}/dlfcn.h \
+		${STAGING_INCDIR}/linux/cdrom.h \
+		${STAGING_INCDIR}/netinet/in.h \
+		${STAGING_INCDIR}/sys/types.h
+	sed -e 's,${STAGING_DIR_HOST},,g' -i *.py
+	cd -
 
 	# remove any bogus LD_LIBRARY_PATH
 	sed -i -e s,RUNSHARED=.*,RUNSHARED=, Makefile
@@ -137,20 +140,21 @@ do_compile() {
 	# then call do_install twice we get Makefile.orig == Makefile.sysroot
 	install -m 0644 Makefile Makefile.sysroot
 
-    run_make profile-opt
-
-        if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
-                qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])}"
-                cat > pgo-image-qemuwrapper << EOF
+	if ${@bb.utils.contains('PACKAGECONFIG', 'pgo', 'true', 'false', d)}; then
+		run_make profile-opt
+		qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])}"
+		cat > pgo-image-qemuwrapper << EOF
 #!/bin/sh
 set -x
 $qemu_binary "\$@"
 EOF
-                chmod +x pgo-image-qemuwrapper
-                ./pgo-image-qemuwrapper ${B}/python ${PYTHON3_PROFILE_TASK} || true
+		chmod +x pgo-image-qemuwrapper
+		./pgo-image-qemuwrapper ${B}/python ${PYTHON3_PROFILE_TASK} || true
+		run_make clean_and_use_profile
+	else
+		run_make libpython3.so
+		run_make
 	fi
-
-    run_make clean_and_use_profile
 }
 
 do_install() {
@@ -163,8 +167,12 @@ do_install() {
 
 	# rerun the build once again with original makefile this time
 	# run install in a separate step to avoid compile/install race
-	run_make DESTDIR=${D} LIBDIR=${libdir} build_all_use_profile
-	
+	if ${@bb.utils.contains('PACKAGECONFIG', 'pgo', 'true', 'false', d)}; then
+		run_make DESTDIR=${D} LIBDIR=${libdir} build_all_use_profile
+	else
+		run_make DESTDIR=${D} LIBDIR=${libdir}
+	fi
+
 	run_make DESTDIR=${D} LIBDIR=${libdir} install
 
 	# avoid conflict with 2to3 from Python 2
-- 
2.11.0


