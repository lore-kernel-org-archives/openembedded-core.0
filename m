Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 15F1A7FCAD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 18:10:52 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id s8so4583561pji.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 10:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=X+1FSoVkJykbL13jHRUpmGghyhLHCAXN0xuLx5SGlpQ=;
	b=ZQ8pxE/luKTKUihflPEr69PYycweWQBI/l2HKeZgc4HZLBGgefH51XmuUM9582Vvaw
	mhTUCKwf7YRHfg41wpdEwfKUVoGnjC1PXD9nCf2Tln3jScHEi9o9jXrZHU73GnCCYpug
	Xf2r/wgVDE+kJFROMhGZAPXm5mSCI1gP49LzM2puG8Lz2tlhgjFunhwh3mzKfAJR90fM
	1Jh+GTV5ksHrjjjKsPlk8g19Fy28OJ6ZZZFhq3Zsrcjlq9A30tFnExnaIEevYQOj7poM
	nkBCLECF8GNuXZRb41vv5wUsffJjfxre1pSoFqKceX1sGFXXDJ+G3hOeME1hg8ngG7eu
	lsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=X+1FSoVkJykbL13jHRUpmGghyhLHCAXN0xuLx5SGlpQ=;
	b=MNXCto24jnknGkGnKfN6BO7E8JGB+sVr/Y3sYqIIrCL/QGc74zqCsM4I9G2Drfxa1Y
	zEtrBgPK6DpyN5hs3doBqFS/whpbsUI6r+FSDhlmSxQrnbvkHRT+Yq9S5JFG/yzs7KPr
	VvqTj3a1aQY8UWfCfYuvQwU03zNaASH+6kDeQo/Es63Y4WlTlRIHgtiXSpSqbS/RlEDl
	EUpV8+VumkPjf3xG5pGTfDo35Lw+WyLwLSUIztSasZ1aRu4lNvN0S+WAQtaDknBnLcgb
	twJiC6LugZSej7eelxWagzB6O7FzvtaL3+RbP+RHdwmdWua7SxtF33TGylZuH3p+AWIB
	NyWA==
X-Gm-Message-State: APjAAAXKqVD8UcBrCkmVsLeQMLZAEd4tuJIifJ5w3g3MJZpq4yONip3r
	UI/z8TuGDTl2izeLOpLruk5I0X3KsNE=
X-Google-Smtp-Source: APXvYqw5VONFgo94UGRWH2P0ASbx3sIl/LbXMaw3WISCnXA1psm6teGduXx2SdxREEsxyoofftdF/Q==
X-Received: by 2002:a17:902:8c84:: with SMTP id
	t4mr20235330plo.269.1574532653325; 
	Sat, 23 Nov 2019 10:10:53 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::d61])
	by smtp.gmail.com with ESMTPSA id
	o125sm2320037pfg.118.2019.11.23.10.10.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 23 Nov 2019 10:10:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 10:10:37 -0800
Message-Id: <20191123181037.2776067-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH v2] systemd-bootchart: Backport RISC-V support
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
X-List-Received-Date: Sat, 23 Nov 2019 18:10:53 -0000
Content-Transfer-Encoding: 8bit

This is a combined backport from upstream patches for added risc-v
support

Upstream code has been re-organised before risc-v support was added to
its mix of two commits
primarily
https://github.com/systemd/systemd/commit/171b53380085b1288b03b19a2b978f36a5c003d0

https://github.com/systemd/systemd/commit/680a752c834aba1b66449d34f17dbe37e040f6b0

Upstream-Status: Backport [https://github.com/systemd/systemd/commit/171b53380085b1288b03b19a2b978f36a5c003d0]
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Improve commit msg

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


