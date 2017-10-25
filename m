Return-Path: <prvs=14716c3ac2=holzmayr@rsi-elektrotechnik.de>
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
	[81.169.146.160])
	by mail.openembedded.org (Postfix) with ESMTP id CF2FD71B48
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 12:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1508934883;
	s=domk; d=rsi-elektrotechnik.de;
	h=References:In-Reply-To:Date:Subject:Cc:To:From;
	bh=TfHlwWaVf6JWKdb78iwYJm0aCy4XIPnGeAfC0Pmt6NM=;
	b=UwoeQzGQ8LJvqKjsGy5dcc36nQYoTApv/pjdsYfYso3/T++3YODLuzLdKsoj0R4TIP
	32Ee0rK4I7wKVXFVo8LfJdbqc003Nvj/ZGek5XRzJICbmDWfthSqHr76x3E1VWvbFaCh
	ul+Pzt/MEz+C+6b2hgxs5F1uG5n8WOflGwUyg=
X-RZG-AUTH: :fz5RJhWIaexwuXGosGLfiBc0xYyi1Y5bd+wRKqrzPXw4V1/Kpz6b/avroGOv0c9mHNc01sePA6ZpTLlbQjW24Oop5Qo4fhADQi1rSTLfuAPP4FE=
X-RZG-CLASS-ID: mo00
Received: from mail.rsi-elektrotechnik.de
	([2001:0:9d38:78cf:2cf1:e1f:af6c:cbea])
	by smtp.strato.de (RZmta 42.8 AUTH) with ESMTPSA id 40b7eet9PCYgQsw
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp384r1
	with 384 ECDH bits, eq. 7680 bits RSA))
	(Client did not present a certificate)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 14:34:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/relaxed;
	d=rsi-elektrotechnik.de; s=MDaemon; t=1508934880; x=1509539680;
	i=holzmayr@rsi-elektrotechnik.de; q=dns/txt; h=From:To:Cc:
	Subject:Date:Message-Id:In-Reply-To:References; bh=TfHlwWaVf6JWK
	db78iwYJm0aCy4XIPnGeAfC0Pmt6NM=; b=o5vkcBRDGeygm15LkgMAw4Hw7x18f
	K/4sH3LUqHyKuP6V+ziaChyxwJM2GVs+QNMhLyfNU8No8nuMX7VFNVLBLpOmEUMI
	ibxkEHDrOh5894QEKvTGzY2Hfdw0/3+eAKJvs1Kcdj3+LMzP6cZuOSNlmusGmtqI
	GwBVIGeVa9rZ/Y=
X-Spam-Processed: mail.rsi-elektrotechnik.de, Wed, 25 Oct 2017 14:34:39 +0200
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NO_RELAYS shortcircuit=no
	autolearn=disabled version=3.4.1
X-Spam-Report: * -0.0 NO_RELAYS Informational: message was not relayed via SMTP
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28)
Received: by mail.rsi-elektrotechnik.de (MDaemon PRO v17.5.0) with ESMTPSA id
	md50000014559.msg; Wed, 25 Oct 2017 14:34:38 +0200
X-MDRemoteIP: 62.168.35.124
X-MDHelo: localhost.localdomain
X-MDArrival-Date: Wed, 25 Oct 2017 14:34:38 +0200
X-Authenticated-Sender: holzmayr@rsi-elektrotechnik.de
X-Return-Path: prvs=14716c3ac2=holzmayr@rsi-elektrotechnik.de
X-Envelope-From: holzmayr@rsi-elektrotechnik.de
X-MDaemon-Deliver-To: openembedded-core@lists.openembedded.org
X-CAV-Result: skipped - holzmayr@rsi-elektrotechnik.de is in exclusion list
From: Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Oct 2017 12:34:11 +0000
Message-Id: <1508934851-3067-3-git-send-email-holzmayr@rsi-elektrotechnik.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1508934851-3067-1-git-send-email-holzmayr@rsi-elektrotechnik.de>
References: <1508934851-3067-1-git-send-email-holzmayr@rsi-elektrotechnik.de>
Subject: [PATCH 2/2] bc: bump version to 1.07.1
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
X-List-Received-Date: Wed, 25 Oct 2017 12:34:43 -0000

Signed-off-by: Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>
---
 meta/recipes-extended/bc/bc_1.06.bb                | 26 --------------------
 meta/recipes-extended/bc/bc_1.07.1.bb              | 25 +++++++++++++++++++
 .../bc/files/fix-segment-fault.patch               | 28 ----------------------
 3 files changed, 25 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-extended/bc/bc_1.06.bb
 create mode 100644 meta/recipes-extended/bc/bc_1.07.1.bb
 delete mode 100644 meta/recipes-extended/bc/files/fix-segment-fault.patch

diff --git a/meta/recipes-extended/bc/bc_1.06.bb b/meta/recipes-extended/bc/bc_1.06.bb
deleted file mode 100644
index d8c8a86..0000000
--- a/meta/recipes-extended/bc/bc_1.06.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "Arbitrary precision calculator language"
-HOMEPAGE = "http://www.gnu.org/software/bc/bc.html"
-
-LICENSE = "GPLv2+ & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
-                    file://bc/bcdefs.h;endline=31;md5=46dffdaf10a99728dd8ce358e45d46d8 \
-                    file://dc/dc.h;endline=25;md5=2f9c558cdd80e31b4d904e48c2374328 \
-                    file://lib/number.c;endline=31;md5=99434a0898abca7784acfd36b8191199"
-
-SECTION = "base"
-DEPENDS = "flex"
-PR = "r3"
-
-SRC_URI = "${GNU_MIRROR}/bc/bc-${PV}.tar.gz \
-           file://fix-segment-fault.patch "
-
-SRC_URI[md5sum] = "d44b5dddebd8a7a7309aea6c36fda117"
-SRC_URI[sha256sum] = "4ef6d9f17c3c0d92d8798e35666175ecd3d8efac4009d6457b5c99cea72c0e33"
-
-inherit autotools texinfo update-alternatives
-
-ALTERNATIVE_${PN} = "dc"
-ALTERNATIVE_PRIORITY = "100"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extended/bc/bc_1.07.1.bb
new file mode 100644
index 0000000..5e4bd95
--- /dev/null
+++ b/meta/recipes-extended/bc/bc_1.07.1.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Arbitrary precision calculator language"
+HOMEPAGE = "http://www.gnu.org/software/bc/bc.html"
+
+LICENSE = "GPLv2 & GPLv3+ & LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
+                    file://bc/bcdefs.h;endline=28;md5=1acd4c17e6f5fe1f387fd12ac7d96fe2 \
+                    file://dc/dc.h;endline=22;md5=6b2786d0e2f15f966acc13f3e71f3ce0 \
+                    file://lib/number.c;endline=31;md5=5c437fc63f83a46d4d769d4dd1e74525"
+
+SECTION = "base"
+DEPENDS = "flex ed-native"
+PR = "r0"
+
+SRC_URI = "${GNU_MIRROR}/bc/bc-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "cda93857418655ea43590736fc3ca9fc"
+SRC_URI[sha256sum] = "62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a"
+
+inherit autotools texinfo update-alternatives
+
+ALTERNATIVE_${PN} = "dc"
+ALTERNATIVE_PRIORITY = "100"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/bc/files/fix-segment-fault.patch b/meta/recipes-extended/bc/files/fix-segment-fault.patch
deleted file mode 100644
index 20c0da2..0000000
--- a/meta/recipes-extended/bc/files/fix-segment-fault.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Pending
-
-when run command such as 'echo "a = 13" | bc -l', it segmentation faults.
-This patch is from http://www.mail-archive.com/blfs-support@linuxfromscratch.org/msg04602.html.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
---- bc-1.06/lib/number.c.orig	2003-09-26 21:14:02.000000000 +0000
-+++ bc-1.06/lib/number.c	2003-09-26 21:14:26.000000000 +0000
-@@ -34,6 +34,7 @@
- #include <number.h>
- #include <assert.h>
- #include <stdlib.h>
-+#include <string.h>
- #include <ctype.h>/* Prototypes needed for external utility routines. */
- 
- #define bc_rt_warn rt_warn
---- bc-1.06/bc/load.c.orig	2003-09-26 21:14:14.000000000 +0000
-+++ bc-1.06/bc/load.c	2003-09-26 21:14:26.000000000 +0000
-@@ -156,7 +156,7 @@
-   long  label_no;
-   long  vaf_name;	/* variable, array or function number. */
-   long  func;
--  program_counter save_adr;
-+  static program_counter save_adr;
- 
-   /* Initialize. */
-   str = code;
-- 
2.7.4


-- 
_____________________________________________________________
R-S-I Elektrotechnik GmbH & Co. KG
Woelkestrasse 11
D-85301 Schweitenkirchen
Fon: +49 8444 9204-0
Fax: +49 8444 9204-50
www.rsi-elektrotechnik.de

_____________________________________________________________
Amtsgericht Ingolstadt - GmbH: HRB 191328 - KG: HRA 170363
Geschäftsführer: Dr.-Ing. Michael Sorg, Dipl.-Ing. Franz Sorg
USt-IdNr.: DE 128592548


