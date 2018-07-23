Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 572FE74F9D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 13:16:07 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id n11-v6so1168783wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 06:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=UHJC8NBY7vOna0fwkVW5gKTsjEps51JIkw7zjSG78bs=;
	b=vE70X1FKuMJnphHKt+6jHZ5gbHZz5JC6v8cBh4qe4GvSknz4TSWQx4MdvWSUYGj/hH
	4dN7Ie+6nZ+Max2c5PttdmRJxXvVdhEKOdRUp3VZcwfxSCESZIO497nWfG/+wXY3j0NU
	2I8/eS0RT28CE8En9gQCxP6JwrnxmM3x1n5wx8AWwT+TmeHCLFKHnAJsJzRzq8Tt9Uw4
	y0hRFQlWmWej8YMTALlq1maD4aFFc+v6fo5U4QDEPSbmqLm/TOwtI457LUq6cW3UOAiA
	J91CkNNEQ/UOZtVtmQaXCQDGTWnxOIx7eWlCKIFatfsG93B9x6w7CCYfncgnCdpk/H6O
	caeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=UHJC8NBY7vOna0fwkVW5gKTsjEps51JIkw7zjSG78bs=;
	b=W0av1/G8aZ2YOET6Vwgzl35TjZTRZtxuGSdGgKkPGuvhtbjbohCJBw4eoUnEfOA5ho
	8knN/xnzu9qFviok44G6Kiy4j2/8mvLraZ36cVod/V5ZMJsoEokYpdq6LHEe7/Sld/S1
	FPQH7NrO5XOU31mYDkzaqiQmWWfpoqKPYe18XC0SiP33fkJWGJD8aVltVXm5oW8eq5nS
	clrxA0VUV7UV6AVK4qXsix7sKdsWZn/Xg6kYKf1q6bSahdzzL7qq6oC5Ztj5p0mVtN1N
	yfzII9ePcNY90Cyloqb1kMHp7Prj2/UHebvdDXdTrQSyueVQ437JVTLXtPin+bWXsy/a
	5rrg==
X-Gm-Message-State: AOUpUlFMJ3CHuxVu09Kp0kd6jn/J9hx0PtR+gN1vBI+Ku5vVRxCjFS2j
	CLTDRI9CXx+th5XEFIiYdRG25+nP5nE=
X-Google-Smtp-Source: AAOMgpdnErlbZ5wS+/SPQjgoabhjYjtb+99EU4NRDQpH9biBeEU/bwMDQfnV+Z+Qm+WnsSfCGxo1uQ==
X-Received: by 2002:a1c:228b:: with SMTP id
	i133-v6mr7898104wmi.69.1532351767372; 
	Mon, 23 Jul 2018 06:16:07 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	31-v6sm13124996wra.26.2018.07.23.06.16.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 06:16:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2018 14:16:04 +0100
Message-Id: <20180723131604.24326-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] iputils: upgrade to s20190629
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
X-List-Received-Date: Mon, 23 Jul 2018 13:16:07 -0000

Drop upstreamed patch.

Change license checksums to check the License files themselves (BSD3 and GPL2),
and the tool-to-license file (LICENSE).  Changes to LICENSE will now be
detected.

Update libidn build-dependency to libidn2.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../iputils/files/0001-Fix-build-on-MUSL.patch     | 95 ----------------------
 .../{iputils_s20161105.bb => iputils_s20180629.bb} | 18 ++--
 2 files changed, 8 insertions(+), 105 deletions(-)
 delete mode 100644 meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch
 rename meta/recipes-extended/iputils/{iputils_s20161105.bb => iputils_s20180629.bb} (70%)

diff --git a/meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch b/meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch
deleted file mode 100644
index ce8cfebbb03..00000000000
--- a/meta/recipes-extended/iputils/files/0001-Fix-build-on-MUSL.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From c6c5966d9fae27bc2f0a34ab59b999555111bd2d Mon Sep 17 00:00:00 2001
-From: Aric Belsito <lluixhi@gmail.com>
-Date: Sun, 29 Oct 2017 23:17:03 +0100
-Subject: [PATCH] Fix build on MUSL
-
-Add missing AI_IDN and NI_IDN declarations.
-
-Bug: https://bugs.gentoo.org/503914
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- arping.c      |  7 +++++++
- ping.h        | 11 +++++++++++
- tracepath.c   |  8 ++++++++
- traceroute6.c |  4 ++++
- 4 files changed, 30 insertions(+)
-
-diff --git a/arping.c b/arping.c
-index 1a3f40b..531d29d 100644
---- a/arping.c
-+++ b/arping.c
-@@ -45,6 +45,13 @@ struct sysfs_devattr_values;
- #ifdef USE_IDN
- #include <idna.h>
- #include <locale.h>
-+
-+#ifndef AI_IDN
-+#define AI_IDN 0x0040
-+#endif
-+#ifndef AI_CANONIDN
-+#define AI_CANONIDN 0x0080
-+#endif
- #endif
- 
- #include "SNAPSHOT.h"
-diff --git a/ping.h b/ping.h
-index 749f3ff..227315f 100644
---- a/ping.h
-+++ b/ping.h
-@@ -38,6 +38,17 @@
- #include <locale.h>
- #include <idna.h>
- #include <stringprep.h>
-+
-+#ifndef AI_IDN
-+#define AI_IDN 0x0040
-+#endif
-+#ifndef AI_CANONIDN
-+#define AI_CANONIDN 0x0080
-+#endif
-+#ifndef NI_IDN
-+#define NI_IDN 32
-+#endif
-+
- #define getaddrinfo_flags (AI_CANONNAME | AI_IDN | AI_CANONIDN)
- #define getnameinfo_flags NI_IDN
- #else
-diff --git a/tracepath.c b/tracepath.c
-index 74a829d..dcec5b9 100644
---- a/tracepath.c
-+++ b/tracepath.c
-@@ -30,6 +30,14 @@
- #ifdef USE_IDN
- #include <idna.h>
- #include <locale.h>
-+
-+#ifndef AI_IDN
-+#define AI_IDN 0x0040
-+#endif
-+#ifndef NI_IDN
-+#define NI_IDN 32
-+#endif
-+
- #define getnameinfo_flags	NI_IDN
- #else
- #define getnameinfo_flags	0
-diff --git a/traceroute6.c b/traceroute6.c
-index 48fc5c5..8d1eebf 100644
---- a/traceroute6.c
-+++ b/traceroute6.c
-@@ -251,6 +251,10 @@
- #include <idna.h>
- #include <locale.h>
- 
-+#ifndef NI_IDN
-+#define NI_IDN 32
-+#endif
-+
- #define getnameinfo_flags	NI_IDN
- #else
- #define getnameinfo_flags	0
--- 
-2.15.1
-
diff --git a/meta/recipes-extended/iputils/iputils_s20161105.bb b/meta/recipes-extended/iputils/iputils_s20180629.bb
similarity index 70%
rename from meta/recipes-extended/iputils/iputils_s20161105.bb
rename to meta/recipes-extended/iputils/iputils_s20180629.bb
index 0125739b034..d421cc34e77 100644
--- a/meta/recipes-extended/iputils/iputils_s20161105.bb
+++ b/meta/recipes-extended/iputils/iputils_s20180629.bb
@@ -6,25 +6,23 @@ SECTION = "console/network"
 
 LICENSE = "BSD & GPLv2+"
 
-LIC_FILES_CHKSUM = "file://ping.c;beginline=1;endline=35;md5=f9ceb201733e9a6cf8f00766dd278d82 \
-                    file://tracepath.c;beginline=1;endline=10;md5=0ecea2bf60bff2f3d840096d87647f3d \
-                    file://arping.c;beginline=1;endline=11;md5=fe84301b5c2655c950f8b92a057fafa6 \
-                    file://tftpd.c;beginline=1;endline=32;md5=28834bf8a91a5b8a92755dbee709ef96 "
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b792e38abdc59f766a3153908f23e766 \
+                    file://LICENSE.BSD3;md5=0f00d99239d922ffd13cabef83b33444 \
+                    file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "gnutls libcap libgcrypt"
 
-SRC_URI = "git://github.com/iputils/iputils \
-           file://0001-Fix-build-on-MUSL.patch \
-           "
+SRC_URI = "git://github.com/iputils/iputils"
+SRCREV = "f6aac8dbe3f8c45c53424854a3312bdd8cdd58d3"
+
 S = "${WORKDIR}/git"
-SRCREV = "bffc0e957b98d626ab4cea218c89251201425442"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>s\d+)"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-PACKAGECONFIG ?= ""
-PACKAGECONFIG[libidn] = "USE_IDN=yes,USE_IDN=no,libidn"
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[libidn] = "USE_IDN=yes,USE_IDN=no,libidn2"
 
 do_compile () {
 	oe_runmake 'CC=${CC} -D_GNU_SOURCE' VPATH="${STAGING_LIBDIR}:${STAGING_DIR_HOST}/${base_libdir}" ${PACKAGECONFIG_CONFARGS} all
-- 
2.11.0


