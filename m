Return-Path: <prvs=316f2015f=alistair.francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id 567986168C
	for <openembedded-core@openembedded.org>;
	Mon, 24 Feb 2020 18:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1582569780; x=1614105780;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=R7mmiElZM42+d2yRbbvlw+RXRSPSN1sGVSsBlz91Rrg=;
	b=PRn//ulYR8B1DyI9nIu2QIgxtyMs3GwWvpx3cS67tD5RSeUzxMLnHSZN
	Q8mW+5oEJ3j2TxjL86EKjxr8MWlhg/5/N8mLdxeGEHxe1aOBmwtRSQIYD
	8IRyiUZYPvl4XhZcI4+UjqJSessuvffY95AAG6+ikCMSazJuweB6ctf6j
	4bHmdCcFJ9MFe5JHPNWt2s8cbT32UtznIz5WKV9wQOicJIsN8+GMEHV1A
	0r5McIEhoDJlUH+OeY0042zRNi11DF1/ZOUB2lADPkHcUhe8tP58rj9ZK
	wQ3qklcXIQzzGwae6Du/Ao1jJJTVEybaWpJZ6V/pjLxEBLvm6iSXhd+wZ Q==;
IronPort-SDR: 46oUkiTKH+HnXKTY2fHXWAMhWcxAjdQuiR9xcG8MgP+LYPd6rcH9xD4e9NpPGRD8Kil/XoKH+g
	RBupo6OvGYOXyNwfZCrFzLPYcDW2gTBudCAviY7zL+5eMLYWxG0WY6moQVALyzjoLmQFAEYBut
	d+DTYEyPtHAcuxOlQvwWQlm4JxkuqnKwbm5aSuDOxbns8CoN6bhaOaDwFwz4Bh+GI60Jv/6vm7
	rUvmUAWaHT/C5TRI8DSp6ZsR/MNd7JHKiyuSWy88Uj7lfxfRFHltfEeeESWthgHjxnC6WAGh7O
	87o=
X-URL-LookUp-ScanningError: 1
X-IronPort-AV: E=Sophos;i="5.70,481,1574092800"; d="scan'208";a="131126298"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 25 Feb 2020 02:42:53 +0800
IronPort-SDR: y6e3Gkoj1UFaCM9GmUVkhPQZQO49Xig/iLtC97h7T1PYNEfv1z0C0krVxMch24iZT3XLrRtiLa
	+sfCzp3X2jbEQoRsYqsuKMQwKhRuhwUOJW9GOl1chWraqpCszgMxx6JZCs6Yfrslg6c9qczLrK
	+7Ti63jwbqgmN12NB9uI+Nbvvv5a7AWeeY2pceDy6py8PPBuMbQ3BeYO/5Tg2To0oqjwRx8DsO
	wM6pCXgV+Ug3O3iCcGtPn4Fh//545j6LQFxV+bcq9y6wCUd6FsIwjJKbqouz0E2pUivOeSfjX4
	P3jr4R7btilrH2EcjdNsrxrT
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	24 Feb 2020 10:35:20 -0800
IronPort-SDR: QdDH6P8UHKl0/Or5Z1qzvXFn6uRuvDfEc4aNqjp3eKeLz+Ro3FqLOlwrv4Lobpeub9GmWy+ElL
	8P6GyXWHzODUmWmexod9sG1DFFZ5fEVq6QpAwc2B9MsikgHtwPAA3pURaMfywGX/QE9yibA4g6
	XFK6JIJVhDhOz9rQpY2ukArJuX5i3ufgyF022Mror3UZ8+dBDAuEml9X85uAZcIN2EccPMeSpk
	rJqZS2mbUWWYzfHkGCsXqbHOzNWKJzyfwOJg2JGljhtYcewHru7bIwE48n/X/0TUIUepsgowvG
	CUQ=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.158.235])
	by uls-op-cesaip01.wdc.com with ESMTP; 24 Feb 2020 10:42:51 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@openembedded.org
Date: Mon, 24 Feb 2020 10:35:43 -0800
Message-Id: <20200224183543.9198-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] opensbi: Update to v0.6
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
X-List-Received-Date: Mon, 24 Feb 2020 18:42:57 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...Makefile-Don-t-specify-mabi-or-march.patch | 13 +++++----
 .../files/0001-build-Use-ffreestanding.patch  | 28 -------------------
 .../{opensbi_0.5.bb => opensbi_0.6.bb}        |  6 +---
 3 files changed, 9 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-bsp/opensbi/files/0001-build-Use-ffreestanding.patch
 rename meta/recipes-bsp/opensbi/{opensbi_0.5.bb => opensbi_0.6.bb} (88%)

diff --git a/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch b/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch
index 74d93618b2..d2a8048e87 100644
--- a/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch
+++ b/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch
@@ -1,4 +1,4 @@
-From f5871e1f3650d6c8a032928cb5d8ca00c275c377 Mon Sep 17 00:00:00 2001
+From fe9860fd85e49a75bef545e5d9914070491e8002 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair.francis@wdc.com>
 Date: Fri, 15 Feb 2019 14:57:41 -0800
 Subject: [PATCH] Makefile: Don't specify mabi or march
@@ -7,23 +7,26 @@ To avoid
     can't link double-float modules with soft-float modules
 errors when building 32-bit openSBI don't specify mabi or march.
 
-Upstream-Status: Inappropriate [Fixes a 32-bit Yocto flow bug]
+Upstream-Status: Inappropriate [Fixes a 32-bit OE flow bug]
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+
 ---
  Makefile | 2 --
  1 file changed, 2 deletions(-)
 
+diff --git a/Makefile b/Makefile
+index ccf8ea3..69e5b38 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -162,7 +162,6 @@ GENFLAGS	+=	$(firmware-genflags-y)
- CFLAGS		=	-g -Wall -Werror -nostdlib -fno-strict-aliasing -O2
+@@ -169,7 +169,6 @@ GENFLAGS	+=	$(firmware-genflags-y)
+ CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-strict-aliasing -O2
  CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
  CFLAGS		+=	-mno-save-restore -mstrict-align
 -CFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
  CFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
  CFLAGS		+=	$(GENFLAGS)
  CFLAGS		+=	$(platform-cflags-y)
-@@ -176,7 +175,6 @@ CPPFLAGS	+=	$(firmware-cppflags-y)
+@@ -183,7 +182,6 @@ CPPFLAGS	+=	$(firmware-cppflags-y)
  ASFLAGS		=	-g -Wall -nostdlib -D__ASSEMBLY__
  ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
  ASFLAGS		+=	-mno-save-restore -mstrict-align
diff --git a/meta/recipes-bsp/opensbi/files/0001-build-Use-ffreestanding.patch b/meta/recipes-bsp/opensbi/files/0001-build-Use-ffreestanding.patch
deleted file mode 100644
index 4899fad6aa..0000000000
--- a/meta/recipes-bsp/opensbi/files/0001-build-Use-ffreestanding.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From efa39afecedf75a1f3154c39507bdde2810bc140 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 6 Jan 2020 18:21:02 -0800
-Subject: [PATCH] build: Use -ffreestanding
-
-this is a stand-alone/baremetal application, therefore demanding
--ffreestanding would help it compile with hosted toolchains e.g. ( linux
-toolchains ), it also ensures that it won't be using platform
-optimizations like inlining mem* str* functions which gcc might decide
-especially with wrapper string functions in opensbi code
-
-Upstream-Status: Accepted [https://github.com/riscv/opensbi/commit/049ad0b3877352527ab470eba33bc767e9b54961]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/Makefile
-+++ b/Makefile
-@@ -159,7 +159,7 @@ GENFLAGS	+=	$(libsbiutils-genflags-y)
- GENFLAGS	+=	$(platform-genflags-y)
- GENFLAGS	+=	$(firmware-genflags-y)
- 
--CFLAGS		=	-g -Wall -Werror -nostdlib -fno-strict-aliasing -O2
-+CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-strict-aliasing -O2
- CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
- CFLAGS		+=	-mno-save-restore -mstrict-align
- CFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
diff --git a/meta/recipes-bsp/opensbi/opensbi_0.5.bb b/meta/recipes-bsp/opensbi/opensbi_0.6.bb
similarity index 88%
rename from meta/recipes-bsp/opensbi/opensbi_0.5.bb
rename to meta/recipes-bsp/opensbi/opensbi_0.6.bb
index 71d64fa324..56f2d4b915 100644
--- a/meta/recipes-bsp/opensbi/opensbi_0.5.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_0.6.bb
@@ -7,17 +7,13 @@ require opensbi-payloads.inc
 
 inherit autotools-brokensep deploy
 
-SRCREV = "be92da280d87c38a2e0adc5d3f43bab7b5468f09"
+SRCREV = "ac5e821d50be631f26274765a59bc1b444ffd862"
 SRC_URI = "git://github.com/riscv/opensbi.git \
            file://0001-Makefile-Don-t-specify-mabi-or-march.patch \
-           file://0001-build-Use-ffreestanding.patch \
           "
 
 S = "${WORKDIR}/git"
 
-SRC_URI[md5sum] = "621f38d8205ef5fb185e4055025e73df"
-SRC_URI[sha256sum] = "07f18b73abf3b85aabe5bead19a923716c100d30eb58033459f39c3a224be300"
-
 EXTRA_OEMAKE += "PLATFORM=${RISCV_SBI_PLAT} I=${D}"
 # If RISCV_SBI_PAYLOAD is set then include it as a payload
 EXTRA_OEMAKE_append = " ${@riscv_get_extra_oemake_image(d)}"
-- 
2.25.0


