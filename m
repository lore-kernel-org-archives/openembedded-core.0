Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.28288.1593351268081491670
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2020 06:34:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z2fYpMOx;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id z17so10634220edr.9
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2020 06:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vWlE/xnFvFxWq7mGIAHYB3gTH3dH6LZc1mAdGiRlnus=;
        b=Z2fYpMOxx8E4cPw4t86p4iaRZ6srZpjtMaZ/jcU1yaRB7VVZNGAUv4Qoq90hgpAcsl
         7FN89x+e4F8eEzjWhbw6Z6Hw5S4ootQsd2vnnr3boo5LIMlITjg/r2AFXRQfMG+s3Dl9
         e64OQczp2sGIqGzNbSJKICVsI8JEKfWOaWI3/NJEZMB15TA+I3Fn/VTc/91yTwkEPJC0
         CnH62fuvlPysfe78DdFa2wHQE6W21ffLldtYL42OQVObEeeYS9yoXLSvf7iiq4zTjAMG
         i7U6hbxYZppcjPaLrTm+kM94TkRmSzebTJD6Vcj/9P5TdjFI7ukbA9gHnWoJnEVkk5EA
         Ii3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vWlE/xnFvFxWq7mGIAHYB3gTH3dH6LZc1mAdGiRlnus=;
        b=fLmc0qabXmAkzlmTt5S70+LJXHrG9NnY0jHOjbCN/Vx6ILQXe59daLS2RKYNa9fOWB
         YG1pFPLYwvER7oh4mJ2Q7E+NqgnjnzSPZb6GcRhqaEY9+hGaFX+aqgrpBJhOQd5E9adB
         hG7w84/dFoIVB6ByOskIbxP5Z+eeOQcnvbSlnUUXwSgkbFlpii/yBUYXzJ/VuXPUmCpw
         ykqZAo07qDW8yfmtqOVmtoVAI7gDz4Ss+HcRTx28sFwCY0VadFWTvD8CF+/L7qfsh2G7
         mEnpcMgObfo1uywh1TM1Hyg+wQ+jvte5n0yvi6SbdW2hjSvEx3zhsEV6h71wfppeFNca
         pcHA==
X-Gm-Message-State: AOAM530NyQTtwD0vuUoWmcHBaI0KOzO5V85qxKQxReU+rKMLYE7pzkxq
	6we44+5fqoEH9vjIpg1HAKMzNTB9
X-Google-Smtp-Source: ABdhPJzx15YNyC7R2dG5CL/Za200GCUCTCY+Ua7Ml/IR0mIs0uHCaFUIMvOsz3JThSUAXGUl5PRLIw==
X-Received: by 2002:aa7:c592:: with SMTP id g18mr12926482edq.85.1593351266074;
        Sun, 28 Jun 2020 06:34:26 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f4b8e33cbb401a015e6742d.dip0.t-ipconnect.de. [2003:f0:7f4b:8e33:cbb4:1a0:15e6:742d])
        by smtp.gmail.com with ESMTPSA id u19sm18192024edd.62.2020.06.28.06.34.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 06:34:25 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] nfs-utils: upgrade 2.4.3 -> 2.5.1
Date: Sun, 28 Jun 2020 15:34:12 +0200
Message-Id: <20200628133414.3246339-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* cacheio was fixed upstream slightly different
* nfsdclnts is a python3 script for printing various nfs client information
  pack it in ${PN}-stats
* replace leading spaces by tabs in shell tasks
* remove SRC_URI[md5sum]

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...acheio-use-intmax_t-for-formatted-IO.patch | 38 -------------------
 ...{nfs-utils_2.4.3.bb => nfs-utils_2.5.1.bb} | 21 +++++-----
 2 files changed, 9 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-cacheio-use-intmax_t-for-formatted-IO.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.4.3.bb => nfs-utils_2.5.1.bb} (86%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-cacheio-use-intmax_t-for-formatted-IO.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-cacheio-use-intmax_t-for-formatted-IO.patch
deleted file mode 100644
index bafff5b9c0..0000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-cacheio-use-intmax_t-for-formatted-IO.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From ac32b813f5d6f9a2de944015cf9bb98d68e0203a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 1 Dec 2018 10:02:12 -0800
-Subject: [PATCH] cacheio: use intmax_t for formatted IO
-
-time_t is not same size on x32 ABI (ILP32)
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- support/nfs/cacheio.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/support/nfs/cacheio.c b/support/nfs/cacheio.c
-index 9dc4cf1..2086a95 100644
---- a/support/nfs/cacheio.c
-+++ b/support/nfs/cacheio.c
-@@ -17,6 +17,7 @@
- 
- #include <nfslib.h>
- #include <stdio.h>
-+#include <inttypes.h>
- #include <stdio_ext.h>
- #include <string.h>
- #include <ctype.h>
-@@ -234,7 +235,7 @@ cache_flush(int force)
- 	    stb.st_mtime > now)
- 		stb.st_mtime = time(0);
- 	
--	sprintf(stime, "%ld\n", stb.st_mtime);
-+	sprintf(stime, "%jd\n", (intmax_t)stb.st_mtime);
- 	for (c=0; cachelist[c]; c++) {
- 		int fd;
- 		sprintf(path, "/proc/net/rpc/%s/flush", cachelist[c]);
--- 
-2.19.2
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
similarity index 86%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
index 9bdb6f4ae4..188a8893b4 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.4.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.1.bb
@@ -28,12 +28,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://proc-fs-nfsd.mount \
            file://nfs-utils-debianize-start-statd.patch \
            file://bugfix-adjust-statd-service-name.patch \
-           file://0001-cacheio-use-intmax_t-for-formatted-IO.patch \
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://clang-warnings.patch \
            "
-SRC_URI[md5sum] = "06020c76f531ed97f3145514901e0e7c"
-SRC_URI[sha256sum] = "af65fce5dd8370cff9ead67baac5a6cd69c376dcadfef264dc2c78c904f26599"
+SRC_URI[sha256sum] = "0f1c8170e16a07d9836bbf0836d48d0c842b6f0e0e8b18748f099751851d30c4"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
@@ -91,7 +89,7 @@ RDEPENDS_${PN}-client = "${PN}-mount rpcbind"
 
 FILES_${PN}-mount = "${base_sbindir}/*mount.nfs*"
 
-FILES_${PN}-stats = "${sbindir}/mountstats ${sbindir}/nfsiostat"
+FILES_${PN}-stats = "${sbindir}/mountstats ${sbindir}/nfsiostat ${sbindir}/nfsdclnts"
 RDEPENDS_${PN}-stats = "python3-core"
 
 FILES_${PN}-staticdev += "${libdir}/libnfsidmap/*.a"
@@ -99,8 +97,8 @@ FILES_${PN}-staticdev += "${libdir}/libnfsidmap/*.a"
 FILES_${PN} += "${systemd_unitdir} ${libdir}/libnfsidmap/"
 
 do_configure_prepend() {
-        sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g' \
-            ${S}/utils/mount/Makefile.am
+	sed -i -e 's,sbindir = /sbin,sbindir = ${base_sbindir},g' \
+		${S}/utils/mount/Makefile.am
 }
 
 # Make clean needed because the package comes with
@@ -129,9 +127,9 @@ do_install_append () {
 		-e 's,@HIGH_RLIMIT_NOFILE@,${HIGH_RLIMIT_NOFILE},g' \
 		${D}${systemd_unitdir}/system/*.service
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-	    install -m 0644 ${WORKDIR}/proc-fs-nfsd.mount ${D}${systemd_unitdir}/system/
-	    install -d ${D}${systemd_unitdir}/system/sysinit.target.wants/
-	    ln -sf ../proc-fs-nfsd.mount ${D}${systemd_unitdir}/system/sysinit.target.wants/proc-fs-nfsd.mount
+		install -m 0644 ${WORKDIR}/proc-fs-nfsd.mount ${D}${systemd_unitdir}/system/
+		install -d ${D}${systemd_unitdir}/system/sysinit.target.wants/
+		ln -sf ../proc-fs-nfsd.mount ${D}${systemd_unitdir}/system/sysinit.target.wants/proc-fs-nfsd.mount
 	fi
 
 	# kernel code as of 3.8 hard-codes this path as a default
@@ -141,7 +139,6 @@ do_install_append () {
 	chown -R rpcuser:rpcuser ${D}${localstatedir}/lib/nfs/statd
 	chmod 0644 ${D}${localstatedir}/lib/nfs/statd/state
 
-        # Make python tools use python 3
-        sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${sbindir}/mountstats ${D}${sbindir}/nfsiostat
-
+	# Make python tools use python 3
+	sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${sbindir}/mountstats ${D}${sbindir}/nfsiostat
 }
-- 
2.26.2

