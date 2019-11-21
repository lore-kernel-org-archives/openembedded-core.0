Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id B1D247F931
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 18:21:19 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id o14so1858645pjr.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 10:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bN1p1X4dPcAWRcqRHZ2hiXy0XU0BV2NrZe6YfuwR3XQ=;
	b=YH+lSNBOXddLgUBl3Br6HAFIyyxJ/GdMcwLLXQNMAdPtONvu5tYPepd1tFpEmeS0NN
	We+XVbFcgJq+seev2ZLd94qqx319/mnxQ3oKy1ympOSyYSr3fU8Dj5MULUQf2ve/Sorl
	I5R0xlNDeDIUktHMqtc+DUa47ItxXb458iuc/dS4nQ8LpOP4vmR3w99CHCez+S+HGKaY
	qJcv/XXFjMFXHQLfOHLxfgpC3DA371K+Y5DB1tHQgsSJTXV5N83blidBuik1JLGcRcF+
	oSIGxF0KHsqptroAT1dDJc1k+BrKfWCrNEz87CFeCIlm37BNHunfqdt9Edxa9QXK8B6A
	Ltvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bN1p1X4dPcAWRcqRHZ2hiXy0XU0BV2NrZe6YfuwR3XQ=;
	b=dVb5whHVC7NDENZn5dZS56BBIdo133a3OZg3Xm6o4vyWVM9TpTwXr2L0WA/d2ROPmn
	klHyhchzYZ/4UMUoDiIYsoMDVmDc+LZsQLGyBb/VQSiyQ7fhbVxO4YgozEFhzHpu/JUw
	QT9J8IjuaEBpr3WFNFSSCQAzPG71nk7uSB9ecD1jKqB7Yp7uscgEeA+IQv+AelW0Dbsy
	7vSezHT+FUN6OghWNc9q6y97LAFbW2VVc3xsIP3JoEE9HD4M8BKT638wJ4DtUmSFPJk1
	8yuLe1kpgmY4lUAK5XC0dDQ/1vZkYuYJIp+t4j8P7ICLLIOd0ULnsOrIB0TPlhFKvIpD
	ttHA==
X-Gm-Message-State: APjAAAWGGwbMU/nG35Umt4Upo/pYUytQ4yNcb0I7KmKODmsOkw7GyTU5
	kfEkHnird1WgwRBzmH+qX69XMyWl6OU=
X-Google-Smtp-Source: APXvYqyBXhz65Ngnv4CRIekaHC3FGw38p9izNtECAy9poSPrIMS004eKqwgkajPB7gAMyzITRl49dA==
X-Received: by 2002:a17:90a:ff02:: with SMTP id
	ce2mr13234226pjb.117.1574360479989; 
	Thu, 21 Nov 2019 10:21:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::d61])
	by smtp.gmail.com with ESMTPSA id
	k13sm3877082pgl.69.2019.11.21.10.21.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 10:21:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 10:21:05 -0800
Message-Id: <20191121182105.2803314-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] systemd-bootchart: Add RISC-V support
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
X-List-Received-Date: Thu, 21 Nov 2019 18:21:19 -0000
Content-Transfer-Encoding: 8bit

This is a partial backport from upstream systemd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...itecture-Recognise-RISCV-32-RISCV-64.patch | 45 +++++++++++++++++++
 .../systemd-bootchart_233.bb                  |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-architecture-Recognise-RISCV-32-RISCV-64.patch

diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-architecture-Recognise-RISCV-32-RISCV-64.patch b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-architecture-Recognise-RISCV-32-RISCV-64.patch
new file mode 100644
index 0000000000..5e89195915
--- /dev/null
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-architecture-Recognise-RISCV-32-RISCV-64.patch
@@ -0,0 +1,45 @@
+From 4a6ace0a965965ea15e88c3418c7158ca5cc9f8f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 21 Nov 2019 10:12:05 -0800
+Subject: [PATCH] architecture: Recognise RISCV-32/RISCV-64
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/architecture.h | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/src/architecture.h b/src/architecture.h
+index 26679e2..89c7d32 100644
+--- a/src/architecture.h
++++ b/src/architecture.h
+@@ -57,6 +57,8 @@ enum {
+         ARCHITECTURE_M68K,
+         ARCHITECTURE_TILEGX,
+         ARCHITECTURE_CRIS,
++       ARCHITECTURE_RISCV32,
++       ARCHITECTURE_RISCV64,
+         _ARCHITECTURE_MAX,
+         _ARCHITECTURE_INVALID = -1
+ };
+@@ -194,6 +196,17 @@ int uname_architecture(void);
+ #elif defined(__cris__)
+ #  define native_architecture() ARCHITECTURE_CRIS
+ #  error "Missing LIB_ARCH_TUPLE for CRIS"
++#elif defined(__riscv)
++#  if __SIZEOF_POINTER__ == 4
++#    define native_architecture() ARCHITECTURE_RISCV32
++#    define LIB_ARCH_TUPLE "riscv32-linux-gnu"
++#  elif __SIZEOF_POINTER__ == 8
++#    define native_architecture() ARCHITECTURE_RISCV64
++#    define LIB_ARCH_TUPLE "riscv64-linux-gnu"
++#  else
++#    error "Unrecognized riscv architecture variant"
++#  endif
++#  define PROC_CPUINFO_MODEL "cpu model"
+ #else
+ #  error "Please register your architecture here!"
+ #endif
+-- 
+2.24.0
+
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_233.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_233.bb
index aef8839864..960edc75e6 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_233.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_233.bb
@@ -3,6 +3,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c
                     file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe"
 
 SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https \
+           file://0001-architecture-Recognise-RISCV-32-RISCV-64.patch \
 "
 
 SRC_URI_append_libc-musl = " \
-- 
2.24.0


