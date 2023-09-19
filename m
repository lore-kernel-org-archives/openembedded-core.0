Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFC2CD5BBF
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 13:29:25 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.8598.1695130164411441340
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 06:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IOHWRJ1c;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A6CC1BF205;
	Tue, 19 Sep 2023 13:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695130162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rVAyO5lfCbKYNyO+81KyQOM8lXhfVchZglANceNJcjY=;
	b=IOHWRJ1ctTyvbvZECrhlzUib3+WNs5XZamNwLntTmCBxMspILlmC+VF+FedkdpQYJ3PE55
	9Oph1nxITaR8vLJXt96n2uRT66+ntgn2PpQ6mXsAre4A/mz+pKC5ZAQx33P0dkbvYpDtvy
	UKBQXCWzhaheF1R5i5yI+NOd5XpgDUqo1Sx7OWSSu9cc2pNpPpN4yjpIPgM6xXNygqz0/5
	0rSSZ5/SFFmjFnfPifzyXBIc5nb2lb+xptGbFWln7dF7ZyJcKNCz9X6YQjV7Fb3dNCxTzX
	GPb3dEXOx9hvgWiHCN0tdQ7SjFxjMjSYO8egaXWDMMiLv3vN58iNICpJAytcHA==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 2/2] alsa-utils: upgrade 1.2.9 -> 1.2.10
Date: Tue, 19 Sep 2023 15:29:03 +0200
Message-Id: <20230919132903.3029244-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919132903.3029244-1-michael.opdenacker@bootlin.com>
References: <17864AAD64BD6546.28522@lists.openembedded.org>
 <20230919132903.3029244-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 13:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187869

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Changelog:
- po: add Korean translations
- alsactl: fix compilation when building in a subdir
- reshuffle included files to include config.h as first
- github: update build.yml
- aseqdump: fix MIDI 2.0 code - it compiles now
- gitcompile: set more verbose compilation warnings
- nhlt-dmic-info: fix the verbose compilation warnings for latest gcc
- alsaucm: fix the verbose compilation warnings for latest gcc
- aplaymidi: fix the verbose compilation warnings for latest gcc
- aseqnet: fix the verbose compilation warnings for latest gcc
- aseqdump: fix the verbose compilation warnings for latest gcc
- aconnect: fix the verbose compilation warnings for latest gcc
- speaker-test: fix the verbose compilation warnings for latest gcc
- amidi: fix the verbose compilation warnings for latest gcc
- bat: fix the verbose compilation warnings for latest gcc
- iecset: fix the verbose compilation warnings for latest gcc
- alsamixer: fix the verbose compilation warnings for latest gcc
- alsaloop: fix the verbose compilation warnings for latest gcc
- axfer: fix the verbose compilation warnings for latest gcc
- alsactl: fix the verbose compilation warnings for latest gcc
- amixer: fix the verbose compilation warnings for latest gcc
- aplay: fix the verbose compilation warnings for latest gcc
- topology: fix the verbose compilation warnings for latest gcc
- alsactl: fix the copy-n-paste typo (SND_RAWMIDI_STREAM_*)
- aseqdump: Add options to switch view mode
- aseqdump: Correct wrong channel number
- aseqdump: Align outputs of UMP MIDI 1.0 with legacy MIDI 1.0
- speaker-test: allow large buffer and period time setup - up to 100 seconds
- topology: plugins: nhlt: remove dmic error print
- Topology: NHLT: Intel: Update DMIC FIR coefficients
- topology: nhlt: intel: support more device types and directions
- topology: pre-processor: Add support for CombineArrays
- alsactl: add define to compile with glibc 2.38
- topology: plugins: nhlt: set dmic stereo mode only in hw version 1
- aplaymidi: Add UMP support
- aconnect: Add UMP support
- aseqdump: Add UMP support
- nhlt: add nhlt-dmic-info utility

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

---

Changes in V2:
 - 0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch,
   0001-topology.c-include-locale.h.patch:
   Upstream-Status: replace "Submitted" by "Backport",
   as the patches were quickly accepted by the maintainer.

0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch#
---
 ...dd-define-to-compile-with-glibc-2.38.patch | 39 -------------------
 ...ompilation-when-building-in-a-subdir.patch | 35 -----------------
 ...nhlt-dmic-info.c-include-sys-types.h.patch | 31 +++++++++++++++
 .../0001-topology.c-include-locale.h.patch    | 31 +++++++++++++++
 ...sa-utils_1.2.9.bb => alsa-utils_1.2.10.bb} | 11 ++++--
 5 files changed, 69 insertions(+), 78 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-add-define-to-compile-with-glibc-2.38.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-fix-compilation-when-building-in-a-subdir.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-topology.c-include-locale.h.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.9.bb => alsa-utils_1.2.10.bb} (93%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-add-define-to-compile-with-glibc-2.38.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-add-define-to-compile-with-glibc-2.38.patch
deleted file mode 100644
index 8c23fb2cec..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-add-define-to-compile-with-glibc-2.38.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From a610f4c21b083c0f9cf62ad2251dfadc98abb50e Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Sat, 22 Jul 2023 15:36:09 +0000
-Subject: [PATCH] alsactl: add define to compile with glibc 2.38
-
-strlcat and strlcpy have been added to glibc 2.38.
-update the defines to use the glibc versions, and not conflict with
-string.h.
-
-ref:
-- https://sourceware.org/git/?p=glibc.git;a=commit;h=454a20c8756c9c1d55419153255fc7692b3d2199
-
-Fixes: https://github.com/alsa-project/alsa-utils/pull/225
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Upstream-Status: Backport [https://github.com/alsa-project/alsa-utils/commit/d6a71bfbde9e1710743d3a446c6ea3b41c45234e]
----
- alsactl/init_sysdeps.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/alsactl/init_sysdeps.c b/alsactl/init_sysdeps.c
-index 3aca1b4..f09b1ae 100644
---- a/alsactl/init_sysdeps.c
-+++ b/alsactl/init_sysdeps.c
-@@ -18,6 +18,7 @@
-  */
- 
- #if defined(__GLIBC__) && !(defined(__UCLIBC__) && defined(__USE_BSD))
-+#if !(__GLIBC_PREREQ(2, 38))
- static size_t strlcpy(char *dst, const char *src, size_t size)
- {
- 	size_t bytes = 0;
-@@ -60,4 +61,5 @@ static size_t strlcat(char *dst, const char *src, size_t size)
- 	*q = '\0';
- 	return bytes;
- }
-+#endif /* !(__GLIBC_PREREQ(2, 38)) */
- #endif /* __GLIBC__ */
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-fix-compilation-when-building-in-a-subdir.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-fix-compilation-when-building-in-a-subdir.patch
deleted file mode 100644
index 3b3fe5345a..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-fix-compilation-when-building-in-a-subdir.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 44636a7c5862538def0d2fac074772cc39a22a15 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Tue, 16 May 2023 02:27:59 +1000
-Subject: [PATCH] alsactl: fix compilation when building in a subdir
-
-Fixes: 613372d
-Fixes: cff2d1c
-
-Compile errors when building in a subdir:
-alsactl/alsactl.c:33:10: fatal error: os_compat.h: No such file or directory
-   33 | #include "os_compat.h"
-      |          ^~~~~~~~~~~~~
-alsactl/lock.c:34:10: fatal error: os_compat.h: No such file or directory
-   34 | #include "os_compat.h"
-      |          ^~~~~~~~~~~~~
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Upstream-Status: Submitted [https://github.com/alsa-project/alsa-utils/pull/213]
----
- alsactl/Makefile.am | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/alsactl/Makefile.am b/alsactl/Makefile.am
-index 80dba69d..fb32c4f3 100644
---- a/alsactl/Makefile.am
-+++ b/alsactl/Makefile.am
-@@ -9,6 +9,8 @@ EXTRA_DIST=alsactl.1 alsactl_init.xml
- 
- AM_CFLAGS = -D_GNU_SOURCE
- 
-+AM_CPPFLAGS = -I$(top_srcdir)/include
-+
- alsactl_SOURCES=alsactl.c state.c lock.c utils.c init_parse.c init_ucm.c \
- 		daemon.c monitor.c clean.c info.c
- 
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch
new file mode 100644
index 0000000000..0ebf98b41e
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-utils/0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch
@@ -0,0 +1,31 @@
+From 35a3382f3818d29b60f4c888e338189a4d93d0e5 Mon Sep 17 00:00:00 2001
+From: Michael Opdenacker <michael.opdenacker@bootlin.com>
+Date: Tue, 19 Sep 2023 11:47:50 +0200
+Subject: [PATCH] nhlt/nhlt-dmic-info.c: include sys/types.h
+
+To fix an issue compiling with the musl C library:
+nhlt-dmic-info.c: error: unknown type name 'u_int8_t'
+
+https://github.com/alsa-project/alsa-utils/issues/238
+
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-utils/commit/0925ad7f09b2dc77015784f9ac2f5e34dd0dd5c3]
+Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
+---
+ nhlt/nhlt-dmic-info.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/nhlt/nhlt-dmic-info.c b/nhlt/nhlt-dmic-info.c
+index 3f6c64d..331555a 100644
+--- a/nhlt/nhlt-dmic-info.c
++++ b/nhlt/nhlt-dmic-info.c
+@@ -33,6 +33,7 @@
+ #include <fcntl.h>
+ #include <getopt.h>
+ #include <sys/stat.h>
++#include <sys/types.h>
+ #include <arpa/inet.h>
+ 
+ int debug = 0;
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-topology.c-include-locale.h.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-topology.c-include-locale.h.patch
new file mode 100644
index 0000000000..e1c7470356
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-utils/0001-topology.c-include-locale.h.patch
@@ -0,0 +1,31 @@
+From d8a8a9affd5726827ef3995652248595b4a8c87e Mon Sep 17 00:00:00 2001
+From: Michael Opdenacker <michael.opdenacker@bootlin.com>
+Date: Tue, 19 Sep 2023 11:27:46 +0200
+Subject: [PATCH] topology.c: include locale.h
+
+To fix an issue compiling with the musl C library:
+topology.c: error: 'LC_ALL' undeclared
+
+https://github.com/alsa-project/alsa-utils/issues/239
+
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-utils/commit/8c229270f6bae83b705a03714c46067a7aa57b02]
+Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
+---
+ topology/topology.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/topology/topology.c b/topology/topology.c
+index 1840ffe..5d03a8b 100644
+--- a/topology/topology.c
++++ b/topology/topology.c
+@@ -32,6 +32,7 @@
+ #include <sys/stat.h>
+ #include <getopt.h>
+ #include <assert.h>
++#include <locale.h>
+ 
+ #include <alsa/asoundlib.h>
+ #include <alsa/topology.h>
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb
similarity index 93%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb
index af28f5468f..4e5ed8dfa0 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.10.bb
@@ -25,10 +25,10 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2 \
-           file://0001-alsactl-fix-compilation-when-building-in-a-subdir.patch \
-           file://0001-alsactl-add-define-to-compile-with-glibc-2.38.patch \
-          "
-SRC_URI[sha256sum] = "e7623d4525595f92e11ce25ee9a97f2040a14c6e4dcd027aa96e06cbce7817bd"
+           file://0001-topology.c-include-locale.h.patch \
+           file://0001-nhlt-nhlt-dmic-info.c-include-sys-types.h.patch \
+           "
+SRC_URI[sha256sum] = "104b62ec7f02a7ce16ca779f4815616df1cc21933503783a9107b5944f83063a"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
@@ -57,6 +57,7 @@ ALSA_UTILS_PKGS = "\
              alsa-utils-alsaloop \
              alsa-utils-alsaucm \
              alsa-utils-scripts \
+             alsa-utils-nhltdmicinfo \
             "
 
 PACKAGES += "${ALSA_UTILS_PKGS}"
@@ -82,6 +83,7 @@ FILES:alsa-utils-scripts     = "${sbindir}/alsaconf \
                ${sbindir}/alsa-info.sh \
                ${sbindir}/alsabat-test.sh \
               "
+FILES:alsa-utils-nhltdmicinfo = "${bindir}/nhlt-dmic-info"
 
 SUMMARY:alsa-utils-alsabat      = "Command-line sound tester for ALSA sound card driver"
 SUMMARY:alsa-utils-alsatplg     = "Converts topology text files into binary format for kernel"
@@ -98,6 +100,7 @@ SUMMARY:alsa-utils-aseqdump     = "Shows the events received at an ALSA sequence
 SUMMARY:alsa-utils-alsaloop     = "ALSA PCM loopback utility"
 SUMMARY:alsa-utils-alsaucm      = "ALSA Use Case Manager"
 SUMMARY:alsa-utils-scripts      = "Shell scripts that show help info and create ALSA configuration files"
+SUMMARY:alsa-utils-nhltdmicinfo = "Dumps microphone array information from ACPI NHLT table"
 
 RRECOMMENDS:alsa-utils-alsactl = "alsa-states"
 
-- 
2.34.1


