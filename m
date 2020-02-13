Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id AD0E260BE2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:22:04 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id c23so2050225plz.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 00:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JBaYzVXEHNCFD2pMJZNs9Byex27FcIXud+vhlz9mkng=;
	b=nWf6HSFI4NzUj5hNB8MjP/fjpNQ2SOCSmG6xQWo6ISLGmxWYHqzLd4b4E+VV7Na2SL
	Hv9ObDvpeeNEEhmLJrvSfZ/4vRI1p/MbZ0XzCk3ZU7tRMBzjcs4oMQ8ndZtv3pc0OHCE
	nrXlOGZdjDR5hczrZc/kM9DdOwMq9Vz/QChCKamMcCe8CIlFZ4GrjuQioQw5rzqN2xZ3
	suc+B6ZlHAJ2rs45K+sEzXiIUUDP0eLzHdTBGheLmxGgPPJpcMNKOZMTDZBzd/g041a3
	xl9Mg9VGPIAEFe8IHq7HWDEF73JQVGoa02f78470cw9Li8GwconXLUhYogaVLBL6gvW/
	xzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JBaYzVXEHNCFD2pMJZNs9Byex27FcIXud+vhlz9mkng=;
	b=fo0Tui+cwMEiDvrub47tdcjC7tOtfrhBpbSLwv63yvPIGhL9sR4gk3Abmu5hIhEnkg
	XvhIXqbuu85nQC8SpT9FRpIUz+Q2Y6gwkkq7OlpCRYCU6fbJmwUX6ry2iTR7t7hwIFUF
	kBI/h6zuT52tiM4BtuvtR9dXtzzwuRZTj9+XKNkmGM1hJ8SYPIxAn2+cCsIVbjlV830V
	61lzXekPkcyQ92SKsjnRerppKW61889dmTPMYI/C8D8/mlmPX4SlvdyJJxfmIU8cA9uM
	zxd5OgfppjbyhojlsvjfWvW9DkfX4T5DBDvfOcu/AsJlaGhK8A6N8X3iCc1uYWCF65Nx
	qbiA==
X-Gm-Message-State: APjAAAV5riJmi0V8VQPakRIwzksJM0DZzEuGCF2zkkFgUMI7xmX1j/pi
	DhNCJ+L3q+aWtOyTVmm1LrKh6pi0gFQ=
X-Google-Smtp-Source: APXvYqwLNwm4X2JhDUGJhXOJ6WGjA9tM4HCwJWpY6U3+sQYwx3esmRNoxEhfLLiZPMF6l2wyqHss5Q==
X-Received: by 2002:a17:902:ba93:: with SMTP id
	k19mr12737125pls.197.1581582124691; 
	Thu, 13 Feb 2020 00:22:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	f127sm1958085pfa.112.2020.02.13.00.22.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 00:22:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2020 00:21:55 -0800
Message-Id: <650b515ce0c79adcbba39cdf47bc23f764ca1465.1581580428.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1581580428.git.raj.khem@gmail.com>
References: <cover.1581580428.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/10] gdb: Upgrade to 9.1 release
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
X-List-Received-Date: Thu, 13 Feb 2020 08:22:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop security patches which are now in 9.1 already
Forward port rest of patches to 9.1
Detailed changes [1]

[1] https://lists.gnu.org/archive/html/info-gnu/2020-02/msg00008.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 meta/recipes-devtools/gdb/gdb-8.3.1.inc       |  22 ---
 meta/recipes-devtools/gdb/gdb-9.1.inc         |  21 +++
 ...ian_8.3.1.bb => gdb-cross-canadian_9.1.bb} |   0
 .../{gdb-cross_8.3.1.bb => gdb-cross_9.1.bb}  |   0
 ...ake-man-install-relative-to-DESTDIR.patch} |   9 +-
 ...x-nat-Define-_ABIO32-if-not-defined.patch} |   9 +-
 ...-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch} |   7 +-
 ...ort-for-Renesas-SH-sh4-architecture.patch} |  41 +++---
 ...eadline.a-when-using-disable-static.patch} |  13 +-
 ...s.h.patch => 0006-use-asm-sgidefs.h.patch} |   9 +-
 ...Use-exorted-definitions-of-SIGRTMIN.patch} |  11 +-
 ...atch => 0008-Change-order-of-CFLAGS.patch} |  13 +-
 ...9-resolve-restrict-keyword-conflict.patch} |  17 +--
 ...> 0010-Fix-invalid-sigprocmask-call.patch} |  23 ++-
 ...h => 0011-gdbserver-ctrl-c-handling.patch} |  31 ++--
 .../gdb/gdb/CVE-2019-1010180.patch            | 132 ------------------
 .../gdb/{gdb_8.3.1.bb => gdb_9.1.bb}          |   0
 18 files changed, 107 insertions(+), 253 deletions(-)
 delete mode 100644 meta/recipes-devtools/gdb/gdb-8.3.1.inc
 create mode 100644 meta/recipes-devtools/gdb/gdb-9.1.inc
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.3.1.bb => gdb-cross-canadian_9.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_8.3.1.bb => gdb-cross_9.1.bb} (100%)
 rename meta/recipes-devtools/gdb/gdb/{0002-make-man-install-relative-to-DESTDIR.patch => 0001-make-man-install-relative-to-DESTDIR.patch} (77%)
 rename meta/recipes-devtools/gdb/gdb/{0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch => 0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch} (82%)
 rename meta/recipes-devtools/gdb/gdb/{0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch => 0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch} (89%)
 rename meta/recipes-devtools/gdb/gdb/{0005-Add-support-for-Renesas-SH-sh4-architecture.patch => 0004-Add-support-for-Renesas-SH-sh4-architecture.patch} (96%)
 rename meta/recipes-devtools/gdb/gdb/{0006-Dont-disable-libreadline.a-when-using-disable-static.patch => 0005-Dont-disable-libreadline.a-when-using-disable-static.patch} (83%)
 rename meta/recipes-devtools/gdb/gdb/{0007-use-asm-sgidefs.h.patch => 0006-use-asm-sgidefs.h.patch} (84%)
 rename meta/recipes-devtools/gdb/gdb/{0008-Use-exorted-definitions-of-SIGRTMIN.patch => 0007-Use-exorted-definitions-of-SIGRTMIN.patch} (81%)
 rename meta/recipes-devtools/gdb/gdb/{0009-Change-order-of-CFLAGS.patch => 0008-Change-order-of-CFLAGS.patch} (75%)
 rename meta/recipes-devtools/gdb/gdb/{0010-resolve-restrict-keyword-conflict.patch => 0009-resolve-restrict-keyword-conflict.patch} (80%)
 rename meta/recipes-devtools/gdb/gdb/{0011-Fix-invalid-sigprocmask-call.patch => 0010-Fix-invalid-sigprocmask-call.patch} (65%)
 rename meta/recipes-devtools/gdb/gdb/{0001-gdbserver-ctrl-c-handling.patch => 0011-gdbserver-ctrl-c-handling.patch} (45%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch
 rename meta/recipes-devtools/gdb/{gdb_8.3.1.bb => gdb_9.1.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 936db5ae16..b451f0ba26 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -19,7 +19,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "9.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.33%"
-GDBVERSION ?= "8.3%"
+GDBVERSION ?= "9.%"
 GLIBCVERSION ?= "2.31"
 LINUXLIBCVERSION ?= "5.4%"
 QEMUVERSION ?= "4.1%"
diff --git a/meta/recipes-devtools/gdb/gdb-8.3.1.inc b/meta/recipes-devtools/gdb/gdb-8.3.1.inc
deleted file mode 100644
index aec913f3ce..0000000000
--- a/meta/recipes-devtools/gdb/gdb-8.3.1.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-LICENSE = "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-		    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
-		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
-		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
-
-SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
-           file://0001-gdbserver-ctrl-c-handling.patch \
-           file://0002-make-man-install-relative-to-DESTDIR.patch \
-           file://0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch \
-           file://0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch \
-           file://0005-Add-support-for-Renesas-SH-sh4-architecture.patch \
-           file://0006-Dont-disable-libreadline.a-when-using-disable-static.patch \
-           file://0007-use-asm-sgidefs.h.patch \
-           file://0008-Use-exorted-definitions-of-SIGRTMIN.patch \
-           file://0009-Change-order-of-CFLAGS.patch \
-           file://0010-resolve-restrict-keyword-conflict.patch \
-           file://0011-Fix-invalid-sigprocmask-call.patch \
-           file://CVE-2019-1010180.patch \
-           "
-SRC_URI[md5sum] = "73b6a5d8141672c62bf851cd34c4aa83"
-SRC_URI[sha256sum] = "1e55b4d7cdca7b34be12f4ceae651623aa73b2fd640152313f9f66a7149757c4"
diff --git a/meta/recipes-devtools/gdb/gdb-9.1.inc b/meta/recipes-devtools/gdb/gdb-9.1.inc
new file mode 100644
index 0000000000..d019e6b384
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb-9.1.inc
@@ -0,0 +1,21 @@
+LICENSE = "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+		    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
+		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
+		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
+
+SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
+           file://0001-make-man-install-relative-to-DESTDIR.patch \
+           file://0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch \
+           file://0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch \
+           file://0004-Add-support-for-Renesas-SH-sh4-architecture.patch \
+           file://0005-Dont-disable-libreadline.a-when-using-disable-static.patch \
+           file://0006-use-asm-sgidefs.h.patch \
+           file://0007-Use-exorted-definitions-of-SIGRTMIN.patch \
+           file://0008-Change-order-of-CFLAGS.patch \
+           file://0009-resolve-restrict-keyword-conflict.patch \
+           file://0010-Fix-invalid-sigprocmask-call.patch \
+           file://0011-gdbserver-ctrl-c-handling.patch \
+           "
+SRC_URI[md5sum] = "f7e9f6236c425097d9e5f18a6ac40655"
+SRC_URI[sha256sum] = "699e0ec832fdd2f21c8266171ea5bf44024bd05164fdf064e4d10cc4cf0d1737"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_8.3.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_9.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_8.3.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_9.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_8.3.1.bb b/meta/recipes-devtools/gdb/gdb-cross_9.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_8.3.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_9.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb/0002-make-man-install-relative-to-DESTDIR.patch b/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
similarity index 77%
rename from meta/recipes-devtools/gdb/gdb/0002-make-man-install-relative-to-DESTDIR.patch
rename to meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
index 60479e5410..82287ea13a 100644
--- a/meta/recipes-devtools/gdb/gdb/0002-make-man-install-relative-to-DESTDIR.patch
+++ b/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
@@ -1,7 +1,7 @@
-From b0209f282716bed2c230c7b496fbcc7af503d0cc Mon Sep 17 00:00:00 2001
+From 036f8e1d387f65e52cb021dbb1bd28e8b75cf017 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 02:27:55 +0000
-Subject: [PATCH 02/11] make man install relative to DESTDIR
+Subject: [PATCH] make man install relative to DESTDIR
 
 Upstream-Status: Pending
 
@@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sim/common/Makefile.in b/sim/common/Makefile.in
-index 227e4cfbc2..8c3457e0bd 100644
+index c6de14122c..c4b1214946 100644
 --- a/sim/common/Makefile.in
 +++ b/sim/common/Makefile.in
 @@ -35,7 +35,7 @@ tooldir = $(libdir)/$(target_alias)
@@ -23,6 +23,3 @@ index 227e4cfbc2..8c3457e0bd 100644
  infodir = @infodir@
  includedir = @includedir@
  
--- 
-2.18.0
-
diff --git a/meta/recipes-devtools/gdb/gdb/0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch b/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
similarity index 82%
rename from meta/recipes-devtools/gdb/gdb/0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
rename to meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
index cf54c74c09..6067caf63d 100644
--- a/meta/recipes-devtools/gdb/gdb/0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
+++ b/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
@@ -1,7 +1,7 @@
-From b14a57d90e1cdd8144cda4c8882bd1db44d26dab Mon Sep 17 00:00:00 2001
+From 6bff2862f9597f324a9385eb2f828e838e51a8a1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 23 Mar 2016 06:30:09 +0000
-Subject: [PATCH 03/11] mips-linux-nat: Define _ABIO32 if not defined
+Subject: [PATCH] mips-linux-nat: Define _ABIO32 if not defined
 
 This helps building gdb on mips64 on musl, since
 musl does not provide sgidefs.h this define is
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index 32835c16b2..68a7587af2 100644
+index 104c972f24..7f575b3363 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -41,6 +41,10 @@
@@ -30,6 +30,3 @@ index 32835c16b2..68a7587af2 100644
  
  class mips_linux_nat_target final : public linux_nat_trad_target
  {
--- 
-2.18.0
-
diff --git a/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
similarity index 89%
rename from meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
rename to meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
index 170d512ef7..c4bab7bb1a 100644
--- a/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
+++ b/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -1,4 +1,4 @@
-From da30370c1e3ff7728a857e119e0529a9f097086e Mon Sep 17 00:00:00 2001
+From d5817bcf2f7313699bfa85b41220d862db327664 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 18:32:14 -0700
 Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
@@ -6,14 +6,13 @@ Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  gdb/gdbserver/linux-ppc-low.c | 6 ++++++
  gdb/nat/ppc-linux.h           | 6 ++++++
  2 files changed, 12 insertions(+)
 
 diff --git a/gdb/gdbserver/linux-ppc-low.c b/gdb/gdbserver/linux-ppc-low.c
-index 1b695e53..1978347c 100644
+index 5d8d67bec2..ffcf65ab58 100644
 --- a/gdb/gdbserver/linux-ppc-low.c
 +++ b/gdb/gdbserver/linux-ppc-low.c
 @@ -23,7 +23,13 @@
@@ -31,7 +30,7 @@ index 1b695e53..1978347c 100644
  #include "arch/ppc-linux-common.h"
  #include "arch/ppc-linux-tdesc.h"
 diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
-index f1561b3b..40399361 100644
+index d937a65b69..1fd54b4a0e 100644
 --- a/gdb/nat/ppc-linux.h
 +++ b/gdb/nat/ppc-linux.h
 @@ -18,7 +18,13 @@
diff --git a/meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch b/meta/recipes-devtools/gdb/gdb/0004-Add-support-for-Renesas-SH-sh4-architecture.patch
similarity index 96%
rename from meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch
rename to meta/recipes-devtools/gdb/gdb/0004-Add-support-for-Renesas-SH-sh4-architecture.patch
index f840cafe2e..fd165d4b81 100644
--- a/meta/recipes-devtools/gdb/gdb/0005-Add-support-for-Renesas-SH-sh4-architecture.patch
+++ b/meta/recipes-devtools/gdb/gdb/0004-Add-support-for-Renesas-SH-sh4-architecture.patch
@@ -1,7 +1,7 @@
-From 215486b53a7a6dfca064cd2e9196a9de6ed6f0c2 Mon Sep 17 00:00:00 2001
+From 505f10a0ea1a8bba0584859d9a348bb779593ec2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 02:31:12 +0000
-Subject: [PATCH 05/11] Add support for Renesas SH (sh4) architecture.
+Subject: [PATCH] Add support for Renesas SH (sh4) architecture.
 
 gdb (7.4-1~cvs20111117.2) experimental; urgency=low
  .
@@ -27,10 +27,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  11 files changed, 617 insertions(+), 29 deletions(-)
 
 diff --git a/gdb/Makefile.in b/gdb/Makefile.in
-index c76a4e4394..921fdadb49 100644
+index c3e074b21f..42dd7af59c 100644
 --- a/gdb/Makefile.in
 +++ b/gdb/Makefile.in
-@@ -2326,6 +2326,8 @@ ALLDEPFILES = \
+@@ -2317,6 +2317,8 @@ ALLDEPFILES = \
  	sh-nbsd-nat.c \
  	sh-nbsd-tdep.c \
  	sh-tdep.c \
@@ -38,12 +38,12 @@ index c76a4e4394..921fdadb49 100644
 +	sh-linux-nat.c \
  	sol2-tdep.c \
  	solib-aix.c \
- 	solib-spu.c \
+ 	solib-svr4.c \
 diff --git a/gdb/configure.host b/gdb/configure.host
-index 23a2f16399..39a886ec53 100644
+index ce52823729..5b5173a71a 100644
 --- a/gdb/configure.host
 +++ b/gdb/configure.host
-@@ -153,6 +153,7 @@ riscv*-*-linux*)	gdb_host=linux ;;
+@@ -148,6 +148,7 @@ riscv*-*-linux*)	gdb_host=linux ;;
  
  s390*-*-linux*)		gdb_host=linux ;;
  
@@ -52,7 +52,7 @@ index 23a2f16399..39a886ec53 100644
  			gdb_host=nbsd ;;
  sh*-*-openbsd*)		gdb_host=nbsd ;;
 diff --git a/gdb/sh-linux-tdep.c b/gdb/sh-linux-tdep.c
-index db93967910..4109c549e8 100644
+index 13c10eeeda..1d0d583a64 100644
 --- a/gdb/sh-linux-tdep.c
 +++ b/gdb/sh-linux-tdep.c
 @@ -18,14 +18,37 @@
@@ -93,7 +93,7 @@ index db93967910..4109c549e8 100644
  #include "glibc-tdep.h"
  #include "sh-tdep.h"
  #include "linux-tdep.h"
-@@ -180,9 +203,505 @@ static struct tramp_frame sh_linux_rt_sigreturn_tramp_frame = {
+@@ -181,9 +204,505 @@ static struct tramp_frame sh_linux_rt_sigreturn_tramp_frame = {
    sh_linux_rt_sigreturn_init
  };
  
@@ -600,7 +600,7 @@ index db93967910..4109c549e8 100644
  
    /* GNU/Linux uses SVR4-style shared libraries.  */
 diff --git a/gdb/sh-tdep.c b/gdb/sh-tdep.c
-index fe64cf979a..4417114cd0 100644
+index e3aee0ac28..5958cf3688 100644
 --- a/gdb/sh-tdep.c
 +++ b/gdb/sh-tdep.c
 @@ -21,6 +21,9 @@
@@ -655,7 +655,7 @@ index fe64cf979a..4417114cd0 100644
        len = TYPE_LENGTH (type);
        val = sh_justify_value_in_reg (gdbarch, args[argnum], len);
  
-@@ -1834,7 +1820,7 @@ sh_dwarf2_frame_init_reg (struct gdbarch *gdbarch, int regnum,
+@@ -1835,7 +1821,7 @@ sh_dwarf2_frame_init_reg (struct gdbarch *gdbarch, int regnum,
      reg->how = DWARF2_FRAME_REG_UNDEFINED;
  }
  
@@ -664,7 +664,7 @@ index fe64cf979a..4417114cd0 100644
  sh_alloc_frame_cache (void)
  {
    struct sh_frame_cache *cache;
-@@ -1861,7 +1847,7 @@ sh_alloc_frame_cache (void)
+@@ -1862,7 +1848,7 @@ sh_alloc_frame_cache (void)
    return cache;
  }
  
@@ -673,7 +673,7 @@ index fe64cf979a..4417114cd0 100644
  sh_frame_cache (struct frame_info *this_frame, void **this_cache)
  {
    struct gdbarch *gdbarch = get_frame_arch (this_frame);
-@@ -1928,9 +1914,9 @@ sh_frame_cache (struct frame_info *this_frame, void **this_cache)
+@@ -1929,9 +1915,9 @@ sh_frame_cache (struct frame_info *this_frame, void **this_cache)
    return cache;
  }
  
@@ -686,7 +686,7 @@ index fe64cf979a..4417114cd0 100644
  {
    struct gdbarch *gdbarch = get_frame_arch (this_frame);
    struct sh_frame_cache *cache = sh_frame_cache (this_frame, this_cache);
-@@ -1944,7 +1930,7 @@ sh_frame_prev_register (struct frame_info *this_frame,
+@@ -1945,7 +1931,7 @@ sh_frame_prev_register (struct frame_info *this_frame,
       the current frame.  Frob regnum so that we pull the value from
       the correct place.  */
    if (regnum == gdbarch_pc_regnum (gdbarch))
@@ -695,7 +695,7 @@ index fe64cf979a..4417114cd0 100644
  
    if (regnum < SH_NUM_REGS && cache->saved_regs[regnum] != -1)
      return frame_unwind_got_memory (this_frame, regnum,
-@@ -2255,8 +2241,8 @@ sh_return_in_first_hidden_param_p (struct gdbarch *gdbarch,
+@@ -2234,8 +2220,8 @@ sh_return_in_first_hidden_param_p (struct gdbarch *gdbarch,
  static struct gdbarch *
  sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
  {
@@ -705,7 +705,7 @@ index fe64cf979a..4417114cd0 100644
  
    /* If there is already a candidate, use it.  */
    arches = gdbarch_list_lookup_by_info (arches, &info);
-@@ -2268,6 +2254,18 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
+@@ -2247,6 +2233,18 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
    tdep = XCNEW (struct gdbarch_tdep);
    gdbarch = gdbarch_alloc (&info, tdep);
  
@@ -724,7 +724,7 @@ index fe64cf979a..4417114cd0 100644
    set_gdbarch_short_bit (gdbarch, 2 * TARGET_CHAR_BIT);
    set_gdbarch_int_bit (gdbarch, 4 * TARGET_CHAR_BIT);
    set_gdbarch_long_bit (gdbarch, 4 * TARGET_CHAR_BIT);
-@@ -2422,10 +2420,11 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
+@@ -2398,10 +2396,11 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
        break;
      }
  
@@ -738,7 +738,7 @@ index fe64cf979a..4417114cd0 100644
    frame_unwind_append_unwinder (gdbarch, &sh_frame_unwind);
  
 diff --git a/gdb/sh-tdep.h b/gdb/sh-tdep.h
-index 59acd35b88..be3f998d84 100644
+index 76e2e76e39..2710f63010 100644
 --- a/gdb/sh-tdep.h
 +++ b/gdb/sh-tdep.h
 @@ -21,6 +21,12 @@
@@ -821,7 +821,7 @@ index 59acd35b88..be3f998d84 100644
       where each general-purpose register is stored inside the associated
       core file section.  */
 diff --git a/gdb/testsuite/gdb.asm/asm-source.exp b/gdb/testsuite/gdb.asm/asm-source.exp
-index 9879f0ca47..cbc0e4d5f7 100644
+index 4914498f98..6e25cbed18 100644
 --- a/gdb/testsuite/gdb.asm/asm-source.exp
 +++ b/gdb/testsuite/gdb.asm/asm-source.exp
 @@ -116,6 +116,11 @@ switch -glob -- [istarget] {
@@ -909,6 +909,3 @@ index 756606880f..1205a9bc9c 100644
  
  static int count = 0;
  
--- 
-2.18.0
-
diff --git a/meta/recipes-devtools/gdb/gdb/0006-Dont-disable-libreadline.a-when-using-disable-static.patch b/meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-when-using-disable-static.patch
similarity index 83%
rename from meta/recipes-devtools/gdb/gdb/0006-Dont-disable-libreadline.a-when-using-disable-static.patch
rename to meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-when-using-disable-static.patch
index 9ae3ee62be..d0360da439 100644
--- a/meta/recipes-devtools/gdb/gdb/0006-Dont-disable-libreadline.a-when-using-disable-static.patch
+++ b/meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-when-using-disable-static.patch
@@ -1,7 +1,7 @@
-From 5fdd42acaa965be7c420a3f2ba12b77ea503c59b Mon Sep 17 00:00:00 2001
+From d132f21d89157e980574da7d0c949f6dd17df8c3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:25:03 -0700
-Subject: [PATCH 06/11] Dont disable libreadline.a when using --disable-static
+Subject: [PATCH] Dont disable libreadline.a when using --disable-static
 
 If gdb is configured with --disable-static then this is dutifully passed to
 readline which then disables libreadline.a, which causes a problem when gdb
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.def b/Makefile.def
-index 75063b6d12..c27bbe4d28 100644
+index 311feb9de3..24c0685d48 100644
 --- a/Makefile.def
 +++ b/Makefile.def
 @@ -105,7 +105,8 @@ host_modules= { module= libiconv;
@@ -33,10 +33,10 @@ index 75063b6d12..c27bbe4d28 100644
  host_modules= { module= sim; };
  host_modules= { module= texinfo; no_install= true; };
 diff --git a/Makefile.in b/Makefile.in
-index 7814fe745f..3b0dc7cbb0 100644
+index 1aabf6ede4..d957efde81 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -25470,7 +25470,7 @@ configure-readline:
+@@ -25510,7 +25510,7 @@ configure-readline:
  	  $$s/$$module_srcdir/configure \
  	  --srcdir=$${topdir}/$$module_srcdir \
  	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
@@ -45,6 +45,3 @@ index 7814fe745f..3b0dc7cbb0 100644
  	  || exit 1
  @endif readline
  
--- 
-2.18.0
-
diff --git a/meta/recipes-devtools/gdb/gdb/0007-use-asm-sgidefs.h.patch b/meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch
similarity index 84%
rename from meta/recipes-devtools/gdb/gdb/0007-use-asm-sgidefs.h.patch
rename to meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch
index 808f4bfa14..d222d01083 100644
--- a/meta/recipes-devtools/gdb/gdb/0007-use-asm-sgidefs.h.patch
+++ b/meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch
@@ -1,7 +1,7 @@
-From d6e12d52f9cef7f5e6315003ceaa236f6cc7723b Mon Sep 17 00:00:00 2001
+From 329e5bf29e934ba99622372a9660865864bb0298 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <amccurdy@gmail.com>
 Date: Sat, 30 Apr 2016 15:29:06 -0700
-Subject: [PATCH 07/11] use <asm/sgidefs.h>
+Subject: [PATCH] use <asm/sgidefs.h>
 
 Build fix for MIPS with musl libc
 
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index 68a7587af2..2b77221372 100644
+index 7f575b3363..dc93a64a93 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -31,7 +31,7 @@
@@ -31,6 +31,3 @@ index 68a7587af2..2b77221372 100644
  #include "nat/gdb_ptrace.h"
  #include <asm/ptrace.h>
  #include "inf-ptrace.h"
--- 
-2.18.0
-
diff --git a/meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch b/meta/recipes-devtools/gdb/gdb/0007-Use-exorted-definitions-of-SIGRTMIN.patch
similarity index 81%
rename from meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch
rename to meta/recipes-devtools/gdb/gdb/0007-Use-exorted-definitions-of-SIGRTMIN.patch
index 95bec5fd60..09896611f0 100644
--- a/meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch
+++ b/meta/recipes-devtools/gdb/gdb/0007-Use-exorted-definitions-of-SIGRTMIN.patch
@@ -1,4 +1,4 @@
-From bab0b34672727c50313eb98b8522355cbe1bde36 Mon Sep 17 00:00:00 2001
+From 782bb2ab9b104dad4bbaed1d9ac769ce7e5b9f4d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:31:40 -0700
 Subject: [PATCH] Use exorted definitions of SIGRTMIN
@@ -14,17 +14,16 @@ https://sourceware.org/bugzilla/show_bug.cgi?id=13012
 Upstream-Status: Submitted
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  gdb/linux-nat.c     | 4 ++--
  gdb/nat/linux-nat.h | 4 ++++
  2 files changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/gdb/linux-nat.c b/gdb/linux-nat.c
-index 063afe26..fb1d2d5d 100644
+index 4484fa5c87..3bb0ee7a49 100644
 --- a/gdb/linux-nat.c
 +++ b/gdb/linux-nat.c
-@@ -4713,6 +4713,6 @@ lin_thread_get_thread_signals (sigset_t *set)
+@@ -4588,6 +4588,6 @@ lin_thread_get_thread_signals (sigset_t *set)
    /* NPTL reserves the first two RT signals, but does not provide any
       way for the debugger to query the signal numbers - fortunately
       they don't change.  */
@@ -34,10 +33,10 @@ index 063afe26..fb1d2d5d 100644
 +  sigaddset (set, SIGRTMIN + 1);
  }
 diff --git a/gdb/nat/linux-nat.h b/gdb/nat/linux-nat.h
-index 1e32dd9e..b886305d 100644
+index 44dcbb7758..975d7276f6 100644
 --- a/gdb/nat/linux-nat.h
 +++ b/gdb/nat/linux-nat.h
-@@ -90,4 +90,8 @@ extern void linux_stop_lwp (struct lwp_info *lwp);
+@@ -91,4 +91,8 @@ extern void linux_stop_lwp (struct lwp_info *lwp);
  
  extern int lwp_is_stepping (struct lwp_info *lwp);
  
diff --git a/meta/recipes-devtools/gdb/gdb/0009-Change-order-of-CFLAGS.patch b/meta/recipes-devtools/gdb/gdb/0008-Change-order-of-CFLAGS.patch
similarity index 75%
rename from meta/recipes-devtools/gdb/gdb/0009-Change-order-of-CFLAGS.patch
rename to meta/recipes-devtools/gdb/gdb/0008-Change-order-of-CFLAGS.patch
index bc4bc26835..18168c6bae 100644
--- a/meta/recipes-devtools/gdb/gdb/0009-Change-order-of-CFLAGS.patch
+++ b/meta/recipes-devtools/gdb/gdb/0008-Change-order-of-CFLAGS.patch
@@ -1,7 +1,7 @@
-From ba6ffa461fe781d44d6dcbc0fbd569237b450fdc Mon Sep 17 00:00:00 2001
+From 40c9c174590ce6fdc873b453285249fe957f376d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:35:39 -0700
-Subject: [PATCH 09/11] Change order of CFLAGS
+Subject: [PATCH] Change order of CFLAGS
 
 Lets us override Werror if need be
 
@@ -13,18 +13,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdb/gdbserver/Makefile.in b/gdb/gdbserver/Makefile.in
-index f2f8a084bd..9528db1364 100644
+index 16a9f2fd38..b9c8cd9c41 100644
 --- a/gdb/gdbserver/Makefile.in
 +++ b/gdb/gdbserver/Makefile.in
-@@ -143,7 +143,7 @@ CPPFLAGS = @CPPFLAGS@
+@@ -146,7 +146,7 @@ PTHREAD_LIBS = @PTHREAD_LIBS@
  INTERNAL_CFLAGS_BASE = ${CXXFLAGS} ${GLOBAL_CFLAGS} \
- 	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS} ${CPPFLAGS}
+ 	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS} ${CPPFLAGS} $(PTHREAD_CFLAGS)
  INTERNAL_WARN_CFLAGS = ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)
 -INTERNAL_CFLAGS = ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) -DGDBSERVER
 +INTERNAL_CFLAGS = ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) ${COMPILER_CFLAGS} -DGDBSERVER
  
  # LDFLAGS is specifically reserved for setting from the command line
  # when running make.
--- 
-2.18.0
-
diff --git a/meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch b/meta/recipes-devtools/gdb/gdb/0009-resolve-restrict-keyword-conflict.patch
similarity index 80%
rename from meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch
rename to meta/recipes-devtools/gdb/gdb/0009-resolve-restrict-keyword-conflict.patch
index 809d52f250..8f15c49d0e 100644
--- a/meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch
+++ b/meta/recipes-devtools/gdb/gdb/0009-resolve-restrict-keyword-conflict.patch
@@ -1,7 +1,7 @@
-From 19b581056c1709f7d2872cd76b977542a0fe6142 Mon Sep 17 00:00:00 2001
+From 5b69a98f6bb7363a1f79f29bac2b25b7df6d2fdd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 10 May 2016 08:47:05 -0700
-Subject: [PATCH 10/11] resolve restrict keyword conflict
+Subject: [PATCH] resolve restrict keyword conflict
 
 GCC detects that we call 'restrict' as param name in function
 signatures and complains since both params are called 'restrict'
@@ -11,13 +11,13 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- gdb/gnulib/import/sys_time.in.h | 8 ++++----
+ gnulib/import/sys_time.in.h | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
-diff --git a/gdb/gnulib/import/sys_time.in.h b/gdb/gnulib/import/sys_time.in.h
-index b4a0e49c50..d22cea9aaf 100644
---- a/gdb/gnulib/import/sys_time.in.h
-+++ b/gdb/gnulib/import/sys_time.in.h
+diff --git a/gnulib/import/sys_time.in.h b/gnulib/import/sys_time.in.h
+index d535a6a48b..7c34d5a1aa 100644
+--- a/gnulib/import/sys_time.in.h
++++ b/gnulib/import/sys_time.in.h
 @@ -93,20 +93,20 @@ struct timeval
  #   define gettimeofday rpl_gettimeofday
  #  endif
@@ -43,6 +43,3 @@ index b4a0e49c50..d22cea9aaf 100644
  # endif
  _GL_CXXALIASWARN (gettimeofday);
  # if defined __cplusplus && defined GNULIB_NAMESPACE
--- 
-2.18.0
-
diff --git a/meta/recipes-devtools/gdb/gdb/0011-Fix-invalid-sigprocmask-call.patch b/meta/recipes-devtools/gdb/gdb/0010-Fix-invalid-sigprocmask-call.patch
similarity index 65%
rename from meta/recipes-devtools/gdb/gdb/0011-Fix-invalid-sigprocmask-call.patch
rename to meta/recipes-devtools/gdb/gdb/0010-Fix-invalid-sigprocmask-call.patch
index bce025c391..5209c00275 100644
--- a/meta/recipes-devtools/gdb/gdb/0011-Fix-invalid-sigprocmask-call.patch
+++ b/meta/recipes-devtools/gdb/gdb/0010-Fix-invalid-sigprocmask-call.patch
@@ -1,7 +1,7 @@
-From b1985595e46721bb168ac38f4c841a915cc2f799 Mon Sep 17 00:00:00 2001
+From bc1f01ff5e524f7777083024bce348a9b0017a7a Mon Sep 17 00:00:00 2001
 From: Yousong Zhou <yszhou4tech@gmail.com>
 Date: Fri, 24 Mar 2017 10:36:03 +0800
-Subject: [PATCH 11/11] Fix invalid sigprocmask call
+Subject: [PATCH] Fix invalid sigprocmask call
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -28,22 +28,19 @@ Upstream-Status: Pending [not author, cherry-picked from LEDE https://bugs.lede-
 Signed-off-by: André Draszik <adraszik@tycoint.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- gdb/common/signals-state-save-restore.c | 2 +-
+ gdb/gdbsupport/signals-state-save-restore.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/gdb/common/signals-state-save-restore.c b/gdb/common/signals-state-save-restore.c
-index 5bb66321bb..6597decbc6 100644
---- a/gdb/common/signals-state-save-restore.c
-+++ b/gdb/common/signals-state-save-restore.c
-@@ -41,7 +41,7 @@ save_original_signals_state (bool quiet)
+diff --git a/gdb/gdbsupport/signals-state-save-restore.c b/gdb/gdbsupport/signals-state-save-restore.c
+index c292d498da..af9dcaeb08 100644
+--- a/gdb/gdbsupport/signals-state-save-restore.c
++++ b/gdb/gdbsupport/signals-state-save-restore.c
+@@ -38,7 +38,7 @@ save_original_signals_state (bool quiet)
    int i;
    int res;
  
--  res = sigprocmask (0,  NULL, &original_signal_mask);
-+  res = sigprocmask (SIG_BLOCK,  NULL, &original_signal_mask);
+-  res = gdb_sigmask (0,  NULL, &original_signal_mask);
++  res = gdb_sigmask (SIG_BLOCK,  NULL, &original_signal_mask);
    if (res == -1)
      perror_with_name (("sigprocmask"));
  
--- 
-2.18.0
-
diff --git a/meta/recipes-devtools/gdb/gdb/0001-gdbserver-ctrl-c-handling.patch b/meta/recipes-devtools/gdb/gdb/0011-gdbserver-ctrl-c-handling.patch
similarity index 45%
rename from meta/recipes-devtools/gdb/gdb/0001-gdbserver-ctrl-c-handling.patch
rename to meta/recipes-devtools/gdb/gdb/0011-gdbserver-ctrl-c-handling.patch
index 71fe7f83b6..eedd94c4d4 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-gdbserver-ctrl-c-handling.patch
+++ b/meta/recipes-devtools/gdb/gdb/0011-gdbserver-ctrl-c-handling.patch
@@ -1,19 +1,32 @@
+From 3d6700d38153a0ec8e0800de703a5089a8cd3d2d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Nov 2018 18:00:23 -0800
+Subject: [PATCH] gdbserver ctrl-c handling
+
 This problem was created by the upstream commit 78708b7c8c
-After applying the commit, it will send SIGINT to the process group(-signal_pid).
-But if we use gdbserver send SIGINT, and the attached process is not a process
-group leader, then the "kill (-signal_pid, SIGINT)" returns error and fails  to
+After applying the commit, it will send SIGINT to the process
+group(-signal_pid).
+But if we use gdbserver send SIGINT, and the attached process is not a
+process
+group leader, then the "kill (-signal_pid, SIGINT)" returns error and
+fails  to
 interrupt the attached process.
 
-Upstream-Status: Submitted [https://sourceware.org/bugzilla/show_bug.cgi?id=18945]
+Upstream-Status: Submitted
+[https://sourceware.org/bugzilla/show_bug.cgi?id=18945]
 
 Author: Josh Gao
 Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gdb/gdbserver/linux-low.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
 
-Index: gdb-8.2/gdb/gdbserver/linux-low.c
-===================================================================
---- gdb-8.2.orig/gdb/gdbserver/linux-low.c
-+++ gdb-8.2/gdb/gdbserver/linux-low.c
-@@ -5940,9 +5940,7 @@ linux_look_up_symbols (void)
+diff --git a/gdb/gdbserver/linux-low.c b/gdb/gdbserver/linux-low.c
+index 4255795ea6..762f8bafb6 100644
+--- a/gdb/gdbserver/linux-low.c
++++ b/gdb/gdbserver/linux-low.c
+@@ -5904,9 +5904,7 @@ linux_look_up_symbols (void)
  static void
  linux_request_interrupt (void)
  {
diff --git a/meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch b/meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch
deleted file mode 100644
index 46b2b3a713..0000000000
--- a/meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From 950b74950f6020eda38647f22e9077ac7f68ca49 Mon Sep 17 00:00:00 2001
-From: Keith Seitz <keiths@redhat.com>
-Date: Wed, 16 Oct 2019 11:33:59 -0700
-Subject: [PATCH] DWARF reader: Reject sections with invalid sizes
-
-This is another fuzzer bug, gdb/23567.  This time, the fuzzer has
-specifically altered the size of .debug_str:
-
-$ eu-readelf -S objdump
-Section Headers:
-[Nr] Name                 Type         Addr             Off      Size     ES Flags Lk Inf Al
-[31] .debug_str           PROGBITS     0000000000000000 0057116d ffffffffffffffff  1 MS     0   0  1
-
-When this file is loaded into GDB, the DWARF reader crashes attempting
-to access the string table (or it may just store a bunch of nonsense):
-
-[gdb-8.3-6-fc30]
-$ gdb -nx -q objdump
-BFD: warning: /path/to/objdump has a corrupt section with a size (ffffffffffffffff) larger than the file size
-Reading symbols from /path/to/objdump...
-Segmentation fault (core dumped)
-
-Nick has already committed a BFD patch to issue the warning seen above.
-
-[gdb master 6acc1a0b]
-$ gdb -BFD: warning: /path/to/objdump has a corrupt section with a size (ffffffffffffffff) larger than the file size
-Reading symbols from /path/to/objdump...
-(gdb) inf func
-All defined functions:
-
-File ./../include/dwarf2.def:
-186:	const
-
-              8 *>(.:
-                     ;'@�B);
-747:	const
-
-              8 *�(.:
-                     ;'@�B);
-701:	const
-
-              8 *�D �
-                     (.:
-                        ;'@�B);
-71:	const
-
-              8 *(.:
-                    ;'@�B);
-/* and more gibberish  */
-
-Consider read_indirect_string_at_offset_from:
-
-static const char *
-read_indirect_string_at_offset_from (struct objfile *objfile,
-                                     bfd *abfd, LONGEST str_offset,
-                                     struct dwarf2_section_info *sect,
-                                     const char *form_name,
-                                     const char *sect_name)
-{
-  dwarf2_read_section (objfile, sect);
-  if (sect->buffer == NULL)
-    error (_("%s used without %s section [in module %s]"),
-           form_name, sect_name, bfd_get_filename (abfd));
-  if (str_offset >= sect->size)
-    error (_("%s pointing outside of %s section [in module %s]"),
-           form_name, sect_name, bfd_get_filename (abfd));
-  gdb_assert (HOST_CHAR_BIT == 8);
-  if (sect->buffer[str_offset] == '\0')
-    return NULL;
-  return (const char *) (sect->buffer + str_offset);
-}
-
-With sect_size being ginormous, the code attempts to access
-sect->buffer[GINORMOUS], and depending on the layout of memory,
-GDB either stores a bunch of gibberish strings or crashes.
-
-This is an attempt to mitigate this by implementing a similar approach
-used by BFD. In our case, we simply reject the section with the invalid
-length:
-
-$ ./gdb -nx -q objdump
-BFD: warning: /path/to/objdump has a corrupt section with a size (ffffffffffffffff) larger than the file size
-Reading symbols from /path/to/objdump...
-
-warning: Discarding section .debug_str which has a section size (ffffffffffffffff) larger than the file size [in module /path/to/objdump]
-DW_FORM_strp used without .debug_str section [in module /path/to/objdump]
-(No debugging symbols found in /path/to/objdump)
-(gdb)
-
-Unfortunately, I have not found a way to regression test this, since it
-requires poking ELF section headers.
-
-gdb/ChangeLog:
-2019-10-16  Keith Seitz  <keiths@redhat.com>
-
-	PR gdb/23567
-	* dwarf2read.c (dwarf2_per_objfile::locate_sections): Discard
-	sections whose size is greater than the file size.
-
-Change-Id: I896ac3b4eb2207c54e8e05c16beab3051d9b4b2f
-
-CVE: CVE-2019-1010180
-Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=950b74950f6020eda38647f22e9077ac7f68ca49]
-[Removed Changelog entry]
-Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
----
- gdb/dwarf2read.c | 9 +++++++++
- 2 files changed, 15 insertions(+)
-
-diff --git a/gdb/dwarf2read.c b/gdb/dwarf2read.c
-index 0443b55..a78f818 100644
---- a/gdb/dwarf2read.c
-+++ b/gdb/dwarf2read.c
-@@ -2338,6 +2338,15 @@ dwarf2_per_objfile::locate_sections (bfd *abfd, asection *sectp,
-   if ((aflag & SEC_HAS_CONTENTS) == 0)
-     {
-     }
-+  else if (elf_section_data (sectp)->this_hdr.sh_size
-+	   > bfd_get_file_size (abfd))
-+    {
-+      bfd_size_type size = elf_section_data (sectp)->this_hdr.sh_size;
-+      warning (_("Discarding section %s which has a section size (%s"
-+		 ") larger than the file size [in module %s]"),
-+	       bfd_section_name (abfd, sectp), phex_nz (size, sizeof (size)),
-+	       bfd_get_filename (abfd));
-+    }
-   else if (section_is_p (sectp->name, &names.info))
-     {
-       this->info.s.section = sectp;
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/gdb/gdb_8.3.1.bb b/meta/recipes-devtools/gdb/gdb_9.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_8.3.1.bb
rename to meta/recipes-devtools/gdb/gdb_9.1.bb
-- 
2.25.0


