Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA2CC4451B
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 14:16:46 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14663.1784297800287790129
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 07:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=O4JsGakG;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: festevam@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-664a09bc459so11715104d50.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 07:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784297799; x=1784902599; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMsi2k7S5iE9c+qBc3aNjoGS0y1/6BFlXGZkwfMxWro=;
        b=O4JsGakGbGvleoeAgws+CrkSq6OomSZfmZUEc7vfbvDuEPcTTaVJ43G7ESQMrGnv3y
         mXY3AAiDWa36EaZCmHVFZrpJ/hBVvPOApup/W8lFo3WcIA354nI31djefBTP9aTuyG5a
         QXtsSZ+ubLIzE3cF+kA/by9KcoHQrjWPhvsEpkNq3vEfk+GsOZKEWKoSPWi57ce5mmfy
         VsbyGH/Jhfx9f1f5KDKg29mtgCrEch8N1jhVKmFnK+obphfpFjphN+q2cbUx7h0GQope
         /Hs5iz+Qj/RTJ36xL7INRXoLz6DbMxMs0vucnYB3V1VAwSR23QsV7HE+l/Ny3NPu51VA
         6qjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784297799; x=1784902599;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wMsi2k7S5iE9c+qBc3aNjoGS0y1/6BFlXGZkwfMxWro=;
        b=i4PHF6K6zhhLCnWocBIksZ62OvfRrflnkec7QMKR6YN+A7wKKWDn1Sy1vU6YgqVXCV
         9Lu+wArVCYzwG6cAQdbyKjgafyHaRrJxlFnTpTmUcipINTdJjRQHr8AOnZgnfzUP9/Ew
         nbGeZ1YFUqe09NCj1jFquqtkZIrSjOl3Y0kp73gWMsNPUQxfRaEr0qGy4OQHmjnjtFFm
         ZvijpuJZ749+4C6IBuP8J+vJCFF8Ig2DdnxB7pWU/AoxhznFfMVelLApMYcI4wfXDJz4
         oXmUZvbcDvFqbOph5rMPH0hUV06Bnki4ZIicGMXNutprcHoe7EHIIMbyRy0jEd1xQh3y
         dSFg==
X-Gm-Message-State: AOJu0Yx7jiE07KDP8pCT2YX71hQF2tKsph9ok4U/hIhKr+aREsGNIuS4
	MIdkCvld+yJcZZi4OXGCJRl24kTopmsDqYS4EffkIU2FvYtttCWL65RdXjt7Dw==
X-Gm-Gg: AfdE7clUxTbkT8JN6IwgOkKqNcAmoBL3EGm7Q6KKUdLWQEzAPDINBoI2LctUXAxbs7W
	kH5emBJjrGBKcy3KflWCMIQ3QmAEE2LXcrYlr5l9w9qr4jaLC/1GX3c/XjySFIQYireX3vM19ve
	qyXwfjYz2eq0LnVcURYxnrKFHnZ2TCSR+k6VViWrBw5e29Js7+Ser66EsZEgt1TKpi9v7W4oFXC
	jW2JPJQd2Jz2m9RtJBAuYrSmAhAbxd/mrSkAiIfX/U1UJi6tNJXlhIZXRnywF/Gr6BXmsYM0wQ0
	nLt0qXOJoxmL7R7ftIyWuBuhAx+vzPIMraFI77YnsTfdYAtDIc6rc9ppfZproRE2TYLiZW2YK7G
	vWLghl1yRbHdPTCggb9YkJ21go0fzDPUbLBT0WiA9Tp3ClcBm6EyM+MvB+e2mg/wKHfbMGNCDUh
	pWLECUUk7Y2ES/BpehH9AVdtEZgsahP0eM0GqzI0tMLglIwek=
X-Received: by 2002:a53:ec8e:0:b0:667:d662:3fbe with SMTP id 956f58d0204a3-6683bd8bb87mr547519d50.60.1784297798922;
        Fri, 17 Jul 2026 07:16:38 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a801:a24:ee37:ad79:5553:41e6])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6683b80d1aasm1458496d50.12.2026.07.17.07.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:16:38 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@nabladev.com,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v3] u-boot: upgrade 2026.04 -> 2026.07
Date: Fri, 17 Jul 2026 11:16:24 -0300
Message-ID: <20260717141625.591480-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 14:16:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241195

From: Fabio Estevam <festevam@nabladev.com>

Remove the local DT validation patch as it has been upstreamed.

Add the submitted mkeficapsule PKCS#11 detection patch so
u-boot-tools can build with target GnuTLS configurations that do
not enable p11-kit.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v2:
- Removed spurious hunk.

 ...ripts-dtc-drop-yaml-in-DT-validation.patch |  85 ---------
 ...apsule-Detect-GnuTLS-PKCS-11-support.patch | 179 ++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |   2 +-
 .../u-boot/u-boot-tools_2026.04.bb            |   4 -
 .../u-boot/u-boot-tools_2026.07.bb            |   4 +
 .../{u-boot_2026.04.bb => u-boot_2026.07.bb}  |   2 -
 6 files changed, 184 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-yaml-in-DT-validation.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-tools-mkeficapsule-Detect-GnuTLS-PKCS-11-support.patch
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb
 rename meta/recipes-bsp/u-boot/{u-boot_2026.04.bb => u-boot_2026.07.bb} (93%)

diff --git a/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-yaml-in-DT-validation.patch b/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-yaml-in-DT-validation.patch
deleted file mode 100644
index 9c1adc8faf..0000000000
--- a/meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-yaml-in-DT-validation.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From e77402000f978561ff2afe405aa9e5c9037a8717 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
-Date: Wed, 29 Apr 2026 15:22:25 +0200
-Subject: [PATCH] scripts/dtc: drop yaml in DT validation
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The build issues found in dtc/yamltree were partially mitigated by a
-previous commit (807bcd844a: "scripts/dtc: Fix pkg-config behavior under
-sysroot"), but upstream dtc simply disabled yaml, and the same should be
-done here in order to permanently avoid those issues.
-
-Backport the change below from Linux v5.18 [1]:
-
-ef8795f3f1c ("dt-bindings: kbuild: Use DTB files for validation")
-
-I tested this patch with a couple Yocto builds: u-boot and u-boot-tools,
-using the current master branch (rev. "c53b0708f9"), having removed
-libyaml-native from u-boot-tools's dependencies.
-
-[1] https://git.kernel.org/linus/ef8795f3f1ce
-
-Signed-off-by: João Marcos Costa <joaomarcos.costa@bootlin.com>
-
-Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/8ef8dee4f3a2b2021decfefd853dbd2a1632b77f]
----
- scripts/Makefile.lib             | 6 ------
- scripts/dtc/Makefile             | 8 --------
- scripts/dtc/update-dtc-source.sh | 2 +-
- 3 files changed, 1 insertion(+), 15 deletions(-)
-
-diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
-index b8969b7de54..d66f1ed13b1 100644
---- a/scripts/Makefile.lib
-+++ b/scripts/Makefile.lib
-@@ -86,12 +86,6 @@ base-dtb-y := $(foreach m, $(multi-dtb-y), $(firstword $(call suffix-search, $m,
- extra-y				+= $(dtb-y)
- extra-$(CONFIG_OF_ALL_DTBS)	+= $(dtb-)
- 
--# U-Boot specific
--ifneq ($(CHECK_DTBS),)
--extra-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
--extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
--endif
--
- # Add subdir path
- 
- extra-y		:= $(addprefix $(obj)/,$(extra-y))
-diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
-index 6f309b37e08..2ba8dba03be 100644
---- a/scripts/dtc/Makefile
-+++ b/scripts/dtc/Makefile
-@@ -17,15 +17,7 @@ fdtoverlay-objs	:= $(libfdt) fdtoverlay.o util.o
- # Source files need to get at the userspace version of libfdt_env.h to compile
- HOST_EXTRACFLAGS := -I$(srctree)/$(src)/libfdt
- 
--ifeq ($(wildcard $(PKG_CONFIG_SYSROOT_DIR)/usr/include/yaml.h),)
- HOST_EXTRACFLAGS += -DNO_YAML
--else
--dtc-objs	+= yamltree.o
--# To include <yaml.h> installed in a non-default path
--HOSTCFLAGS_yamltree.o := $(shell pkg-config --cflags yaml-0.1)
--# To link libyaml installed in a non-default path
--HOSTLDLIBS_dtc	:= $(shell pkg-config --libs yaml-0.1)
--endif
- 
- # Generated files need one more search path to include headers in source tree
- HOSTCFLAGS_dtc-lexer.lex.o := -I$(src)
-diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc-source.sh
-index 32ff17ffd08..94627541533 100755
---- a/scripts/dtc/update-dtc-source.sh
-+++ b/scripts/dtc/update-dtc-source.sh
-@@ -32,7 +32,7 @@ DTC_UPSTREAM_PATH=`pwd`/../dtc
- DTC_LINUX_PATH=`pwd`/scripts/dtc
- 
- DTC_SOURCE="checks.c data.c dtc.c dtc.h flattree.c fstree.c livetree.c srcpos.c \
--		srcpos.h treesource.c util.c util.h version_gen.h yamltree.c \
-+		srcpos.h treesource.c util.c util.h version_gen.h \
- 		dtc-lexer.l dtc-parser.y"
- LIBFDT_SOURCE="fdt.c fdt.h fdt_addresses.c fdt_empty_tree.c \
- 		fdt_overlay.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c \
--- 
-2.47.0
-
diff --git a/meta/recipes-bsp/u-boot/files/0001-tools-mkeficapsule-Detect-GnuTLS-PKCS-11-support.patch b/meta/recipes-bsp/u-boot/files/0001-tools-mkeficapsule-Detect-GnuTLS-PKCS-11-support.patch
new file mode 100644
index 0000000000..68865af481
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-tools-mkeficapsule-Detect-GnuTLS-PKCS-11-support.patch
@@ -0,0 +1,179 @@
+From 007b77c2f51d4c1c696fbf1ff92694b585b35f57 Mon Sep 17 00:00:00 2001
+From: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
+Date: Tue, 9 Jun 2026 09:01:04 +0200
+Subject: [PATCH] tools: mkeficapsule: Rework pkcs11 support
+
+Some distros like OpenEmbedded are using gnutls library
+without pkcs11 support and linking of mkeficapsule will fail.
+It would make maintenance of default configs a hurdle.
+Add detection of pkcs11 support in gnutls so it's enabled
+when available and doesn't need to be set explicitly.
+
+Upstream-Status: Submitted [https://lists.openembedded.org/g/openembedded-core/message/238267]
+
+Reviewed-by: Simon Glass <sjg@chromium.org>
+Acked-by: Quentin Schulz <quentin.schulz@cherry.de>
+Suggested-by: Tom Rini <trini@konsulko.com>
+Cc: Franz Schnyder <fra.schnyder@gmail.com>
+Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
+---
+ tools/Makefile       |  5 +++
+ tools/mkeficapsule.c | 95 +++++++++++++++++++++++++++++++++-----------
+ 2 files changed, 77 insertions(+), 23 deletions(-)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index 1a5f425ecdaa..e85f5a354b81 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -271,6 +271,11 @@ mkeficapsule-objs := generated/lib/uuid.o \
+ 	$(LIBFDT_OBJS) \
+ 	mkeficapsule.o
+ hostprogs-always-$(CONFIG_TOOLS_MKEFICAPSULE) += mkeficapsule
++GNUTLS_SUPPORTS_P11KIT = $(shell pkg-config --libs gnutls --print-requires-private \
++			 2> /dev/null | grep p11-kit-1)
++ifeq ($(GNUTLS_SUPPORTS_P11KIT),p11-kit-1)
++HOSTCFLAGS_mkeficapsule.o += -DMKEFICAPSULE_PKCS11
++endif
+ 
+ include tools/fwumdata_src/fwumdata.mk
+ 
+diff --git a/tools/mkeficapsule.c b/tools/mkeficapsule.c
+index ec640c57e8a5..c3cf48f4cc1d 100644
+--- a/tools/mkeficapsule.c
++++ b/tools/mkeficapsule.c
+@@ -207,6 +207,71 @@ static int write_capsule_file(FILE *f, void *data, size_t size, const char *msg)
+ 	return 0;
+ }
+ 
++#ifdef MKEFICAPSULE_PKCS11
++static int pkcs11_init(void)
++{
++	const char *lib;
++	int ret;
++
++	lib = getenv("PKCS11_MODULE_PATH");
++	if (!lib) {
++		fprintf(stdout,
++			"PKCS11_MODULE_PATH not set in the environment\n");
++		return -1;
++	}
++
++	gnutls_pkcs11_init(GNUTLS_PKCS11_FLAG_MANUAL, NULL);
++	gnutls_global_init();
++
++	ret = gnutls_pkcs11_add_provider(lib, "trusted");
++	if (ret < 0) {
++		fprintf(stdout, "Failed to add pkcs11 provider\n");
++		return -1;
++	}
++
++	return 0;
++}
++
++static int import_pkcs11_crt(gnutls_x509_crt_t *x509, struct auth_context *ctx)
++{
++	gnutls_pkcs11_obj_t *obj_list;
++	unsigned int obj_list_size = 0;
++	int ret;
++
++	ret = gnutls_pkcs11_obj_list_import_url4(&obj_list, &obj_list_size,
++						 ctx->cert_file, 0);
++	if (ret < 0 || obj_list_size == 0)
++		return -1;
++
++	gnutls_x509_crt_import_pkcs11(*x509, obj_list[0]);
++
++	return 0;
++}
++
++static int import_pkcs11_key(gnutls_privkey_t *pkey, struct auth_context *ctx)
++{
++	return gnutls_privkey_import_pkcs11_url(*pkey, ctx->key_file);
++}
++#else
++static int pkcs11_init(void)
++{
++	fprintf(stderr, "Pkcs11 support is disabled\n");
++	return -1;
++}
++
++static int import_pkcs11_crt(gnutls_x509_crt_t *x509, struct auth_context *ctx)
++{
++	fprintf(stderr, "Pkcs11 support is disabled\n");
++	return -1;
++}
++
++static int import_pkcs11_key(gnutls_privkey_t *pkey, struct auth_context *ctx)
++{
++	fprintf(stderr, "Pkcs11 support is disabled\n");
++	return -1;
++}
++#endif
++
+ /**
+  * create_auth_data - compose authentication data in capsule
+  * @auth_context:	Pointer to authentication context
+@@ -229,9 +294,6 @@ static int create_auth_data(struct auth_context *ctx)
+ 	gnutls_pkcs7_t pkcs7;
+ 	gnutls_datum_t data;
+ 	gnutls_datum_t signature;
+-	gnutls_pkcs11_obj_t *obj_list;
+-	unsigned int obj_list_size = 0;
+-	const char *lib;
+ 	int ret;
+ 	bool pkcs11_cert = false;
+ 	bool pkcs11_key = false;
+@@ -243,19 +305,8 @@ static int create_auth_data(struct auth_context *ctx)
+ 		pkcs11_key = true;
+ 
+ 	if (pkcs11_cert || pkcs11_key) {
+-		lib = getenv("PKCS11_MODULE_PATH");
+-		if (!lib) {
+-			fprintf(stdout,
+-				"PKCS11_MODULE_PATH not set in the environment\n");
+-			return -1;
+-		}
+-
+-		gnutls_pkcs11_init(GNUTLS_PKCS11_FLAG_MANUAL, NULL);
+-		gnutls_global_init();
+-
+-		ret = gnutls_pkcs11_add_provider(lib, "trusted");
++		ret = pkcs11_init();
+ 		if (ret < 0) {
+-			fprintf(stdout, "Failed to add pkcs11 provider\n");
+ 			return -1;
+ 		}
+ 	}
+@@ -301,14 +352,12 @@ static int create_auth_data(struct auth_context *ctx)
+ 
+ 	/* load x509 certificate */
+ 	if (pkcs11_cert) {
+-		ret = gnutls_pkcs11_obj_list_import_url4(&obj_list, &obj_list_size,
+-							 ctx->cert_file, 0);
+-		if (ret < 0 || obj_list_size == 0) {
+-			fprintf(stdout, "Failed to import crt_file URI objects\n");
++		ret = import_pkcs11_crt(&x509, ctx);
++		if (ret < 0) {
++			fprintf(stderr, "error in import_pkcs11_crt(): %s\n",
++				gnutls_strerror(ret));
+ 			return -1;
+ 		}
+-
+-		gnutls_x509_crt_import_pkcs11(x509, obj_list[0]);
+ 	} else {
+ 		ret = gnutls_x509_crt_import(x509, &cert, GNUTLS_X509_FMT_PEM);
+ 		if (ret < 0) {
+@@ -320,9 +369,9 @@ static int create_auth_data(struct auth_context *ctx)
+ 
+ 	/* load a private key */
+ 	if (pkcs11_key) {
+-		ret = gnutls_privkey_import_pkcs11_url(pkey, ctx->key_file);
++		ret = import_pkcs11_key(&pkey, ctx);
+ 		if (ret < 0) {
+-			fprintf(stderr, "error in %d: %s\n", __LINE__,
++			fprintf(stderr, "error in import_pkcs11_key(): %s\n",
+ 				gnutls_strerror(ret));
+ 			return -1;
+ 		}
+-- 
+2.47.3
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 574768b9f8..229d779498 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "88dc2788777babfd6322fa655df549a019aa1e69"
+SRCREV = "ece349ade2973e220f524ce59e59711cc919263f"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb
deleted file mode 100644
index 6c3ef7efd1..0000000000
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require u-boot-common.inc
-require u-boot-tools.inc
-
-SRC_URI += "file://0001-scripts-dtc-drop-yaml-in-DT-validation.patch"
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb
new file mode 100644
index 0000000000..9e7a178310
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2026.07.bb
@@ -0,0 +1,4 @@
+require u-boot-common.inc
+require u-boot-tools.inc
+
+SRC_URI += "file://0001-tools-mkeficapsule-Detect-GnuTLS-PKCS-11-support.patch"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2026.04.bb b/meta/recipes-bsp/u-boot/u-boot_2026.07.bb
similarity index 93%
rename from meta/recipes-bsp/u-boot/u-boot_2026.04.bb
rename to meta/recipes-bsp/u-boot/u-boot_2026.07.bb
index b6345c8875..eed5127004 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2026.04.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2026.07.bb
@@ -3,8 +3,6 @@ require u-boot.inc
 
 DEPENDS += "bc-native dtc-native gnutls-native python3-pyelftools-native"
 
-SRC_URI += "file://0001-scripts-dtc-drop-yaml-in-DT-validation.patch"
-
 # workarounds for aarch64 kvm qemu boot regressions
 SRC_URI:append:qemuarm64 = " file://disable-CONFIG_BLOBLIST.cfg"
 SRC_URI:append:genericarm64 = " file://disable-CONFIG_BLOBLIST.cfg"
-- 
2.43.0


