Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 81B6260720
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 12:54:29 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id s11-v6so14493594wra.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 05:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=oJE/tImWuEjflb1ud+ilYwTmFqWxv7o7wWkcgcgKN8Y=;
	b=ZNF7N8IO0EBI7Mg85biq7aTtDLGbZdQWgBwqpOaGk5jYpfc6GLq1o1RaJSNXqMJ4M8
	VMcEe9Hsl9yALHPpPHGPtfirQVP8Y6QFSiA2uQQv+EsOqWK8rmbCbBLOX1SG/exQTZVf
	I08+/xJPOuNaySNNEDt3LalUctCp2G67T0V8iBrzQVXy50U+N244Cy5cw/Cg5ilED/GR
	hBiaps7IlB0/sOpggJnvOdiCxVP3MBOwZYt9KVgjSDl3rL2/93nY9o4e1yNk1ilTODr+
	A5CMsz51bMDgi8l0wzWKBD8UBGRtjILzsbvS5obyDpRugN9HfU6UCPhhaGwbjAKMngNL
	6fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=oJE/tImWuEjflb1ud+ilYwTmFqWxv7o7wWkcgcgKN8Y=;
	b=hsqUylCoSrOm1XZslFCHte1Syd96XoI9iuMdhnd7bbbjlGzdirBnok62iQA7VCc02y
	d2lbL+jlitdkFS3jz8xBnQf7GfbKd9NWN36ZLk0lhoXPtYPwsAihFBPDOBJ8fvw1UkKl
	ihwhfRR0h/vaSURRkTf7i2KMtUZR0DQZzRMIEFZP9P2oXRynbirNH9F5zY4Y58B0PYFt
	quxI4DCYUzYaxF/Vard1pwFgw5L96jdy1n3AluMmY7ccGrSKBmnRcztVBysEeVNDxFlI
	Ul5wJ/L9ltkiOOXsS2fngPrrWvBIOoIXTSVLUhvOkTmtDnpytls+RpBsN8hz94F4zBkb
	o/PQ==
X-Gm-Message-State: APt69E3bLEh33OS08iuu05N4uU2fvyGlWgg+t99iZ9ZHpJ0vZJ+cvWhk
	bHg66VTtlJ3rh/hy+vQgK9JqavU2
X-Google-Smtp-Source: AAOMgpc0AHvkusDcsyWtHFZS/0P/4oOEri7IQVGOJxxXnvN5ot5uS7UhIwTumegqJtHvEj31dOKKLA==
X-Received: by 2002:a5d:5641:: with SMTP id
	j1-v6mr18634987wrw.209.1531227269839; 
	Tue, 10 Jul 2018 05:54:29 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f18-v6sm14985543wrt.64.2018.07.10.05.54.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jul 2018 05:54:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2018 13:54:26 +0100
Message-Id: <20180710125426.31401-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] nfs-utils: remove libnfsidmap
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
X-List-Received-Date: Tue, 10 Jul 2018 12:54:29 -0000

As of nfs-utils 2.2.1 libnfsidmap has been integrated and isn't an external
requirement anymore.

Also consolidate nfs-utils patches into a single directory.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/maintainers.inc           |  1 -
 ...clude-sys-types.h-for-getting-u_-typedefs.patch | 27 ----------------------
 .../libnfsidmap/Set_nobody_user_group.patch        | 18 ---------------
 .../nfs-utils/libnfsidmap/fix-ac-prereq.patch      | 13 -----------
 .../nfs-utils/libnfsidmap_0.25.bb                  | 27 ----------------------
 .../bugfix-adjust-statd-service-name.patch         |  0
 .../nfs-utils-debianize-start-statd.patch          |  0
 .../nfs-utils/nfs-utils_2.3.1.bb                   |  2 +-
 8 files changed, 1 insertion(+), 87 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/libnfsidmap/0001-include-sys-types.h-for-getting-u_-typedefs.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/libnfsidmap/Set_nobody_user_group.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/libnfsidmap/fix-ac-prereq.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
 rename meta/recipes-connectivity/nfs-utils/{files => nfs-utils}/bugfix-adjust-statd-service-name.patch (100%)
 rename meta/recipes-connectivity/nfs-utils/{files => nfs-utils}/nfs-utils-debianize-start-statd.patch (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c44f2b804aa..4d58766451e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -326,7 +326,6 @@ RECIPE_MAINTAINER_pn-libmnl = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libmpc = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libnewt = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-libnewt-python = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER_pn-libnfsidmap = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libnl = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libnotify = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libnsl2 = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap/0001-include-sys-types.h-for-getting-u_-typedefs.patch b/meta/recipes-connectivity/nfs-utils/libnfsidmap/0001-include-sys-types.h-for-getting-u_-typedefs.patch
deleted file mode 100644
index 4ac52904401..00000000000
--- a/meta/recipes-connectivity/nfs-utils/libnfsidmap/0001-include-sys-types.h-for-getting-u_-typedefs.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From a5e95a42e7bceddc9ecad06694c1a0588f4bafc8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 14 Apr 2015 07:22:47 -0700
-Subject: [PATCH] include sys/types.h for getting u_* typedefs
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- cfg.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/cfg.h b/cfg.h
-index d4d4cab..fe49e8f 100644
---- a/cfg.h
-+++ b/cfg.h
-@@ -33,6 +33,7 @@
- #ifndef _CONF_H_
- #define _CONF_H_
- 
-+#include <sys/types.h>
- #include "queue.h"
- 
- struct conf_list_node {
--- 
-2.1.4
-
diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap/Set_nobody_user_group.patch b/meta/recipes-connectivity/nfs-utils/libnfsidmap/Set_nobody_user_group.patch
deleted file mode 100644
index 4633da919e7..00000000000
--- a/meta/recipes-connectivity/nfs-utils/libnfsidmap/Set_nobody_user_group.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Set nobody user and group
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---- a/idmapd.conf
-+++ b/idmapd.conf
-@@ -17,8 +17,8 @@
- 
- [Mapping]
- 
--#Nobody-User = nobody
--#Nobody-Group = nobody
-+Nobody-User = nobody
-+Nobody-Group = nogroup
- 
- [Translation]
- 
diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap/fix-ac-prereq.patch b/meta/recipes-connectivity/nfs-utils/libnfsidmap/fix-ac-prereq.patch
deleted file mode 100644
index d81c7c5f326..00000000000
--- a/meta/recipes-connectivity/nfs-utils/libnfsidmap/fix-ac-prereq.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
---- a/configure.in
-+++ b/configure.in
-@@ -1,7 +1,7 @@
- #                                               -*- Autoconf -*-
- # Process this file with autoconf to produce a configure script.
- 
--AC_PREREQ([2.68])
-+AC_PREREQ([2.65])
- AC_INIT([libnfsidmap],[0.25],[linux-nfs@vger.kernel.org])
- AC_CONFIG_SRCDIR([nfsidmap.h])
- AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
deleted file mode 100644
index 2565771006a..00000000000
--- a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "NFS id mapping library"
-HOMEPAGE = "http://www.citi.umich.edu/projects/nfsv4/linux/"
-SECTION = "libs"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d9c6a2a0ca6017fda7cd905ed2739b37"
-
-SRC_URI = "http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/${BPN}-${PV}.tar.gz \
-           file://fix-ac-prereq.patch \
-           file://Set_nobody_user_group.patch \
-           file://0001-include-sys-types.h-for-getting-u_-typedefs.patch \
-          "
-
-SRC_URI[md5sum] = "2ac4893c92716add1a1447ae01df77ab"
-SRC_URI[sha256sum] = "656d245d84400e1030f8f40a5a27da76370690c4a932baf249110f047fe7efcf"
-
-UPSTREAM_CHECK_URI = "http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/"
-
-inherit autotools
-
-EXTRA_OECONF = "--disable-ldap"
-
-do_install_append () {
-	install -d ${D}${sysconfdir}/
-	install -m 0644 ${WORKDIR}/${BPN}-${PV}/idmapd.conf ${D}${sysconfdir}/idmapd.conf
-}
-
diff --git a/meta/recipes-connectivity/nfs-utils/files/bugfix-adjust-statd-service-name.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/bugfix-adjust-statd-service-name.patch
similarity index 100%
rename from meta/recipes-connectivity/nfs-utils/files/bugfix-adjust-statd-service-name.patch
rename to meta/recipes-connectivity/nfs-utils/nfs-utils/bugfix-adjust-statd-service-name.patch
diff --git a/meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start-statd.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-debianize-start-statd.patch
similarity index 100%
rename from meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start-statd.patch
rename to meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-debianize-start-statd.patch
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb
index 6390c324f8f..6d450c75109 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT & GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 
 # util-linux for libblkid
-DEPENDS = "libcap libnfsidmap libevent util-linux sqlite3 libtirpc"
+DEPENDS = "libcap libevent util-linux sqlite3 libtirpc"
 RDEPENDS_${PN} = "${PN}-client bash"
 RRECOMMENDS_${PN} = "kernel-module-nfsd"
 
-- 
2.11.0


