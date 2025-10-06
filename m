Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076CECAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 20:11:58 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.2180.1759781512800071179
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 13:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=abibNug0;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: festevam@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7835321bc98so5108889b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 13:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759781512; x=1760386312; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jzZpqy+q6nIVLWbiaD77qTb2knCoWy4AVpU8BWlKAbw=;
        b=abibNug0ybNBGnKOWT2q1rIXFdsf6n++VpATfqw3+spCv07tMtSAJ3J1cmMThZ50z/
         aAQxoHD0NEb4eeA9vVcekaWg/um+j2HSexfiNjhCSOUEGY3iGc4lKkAGOGKpYdrQaxJe
         X9uuHZ170dJW1wVk6T/FevmupVkAJQ/J3PaHN//dtNb2uCeCefUDX9fwszASrwb0mcM3
         S3/S5EhGkiUJECLOmxUbGEfTEahcsUdrM5Y1P92NUubF4cBuIXfRyOsWFGRj6V/LX20O
         O4dXq9nwYLKvnJ9axKVWXzQI8GRlxZdffIph4plDZQKgRCiC3Dtp8j1/NcsazrHcvqE7
         87ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759781512; x=1760386312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzZpqy+q6nIVLWbiaD77qTb2knCoWy4AVpU8BWlKAbw=;
        b=V6TedkknAi9J4ISoMkXHYoMktlpqQxoO9vl1W9Ts5Cl7ODmz2LKq2qc+e6ZEQz2iGZ
         r/mPhfN6IBmFUlyirWAWpXdmEah6Wb06/3tyjZUwfQ7rLsWZgXy22ofuPgHJlVpPtfpk
         /+mq9wSZ/36rYDyk8urBFZ3TLhH22KTR45EWuOs8DUAMDSTUhX+zpSEpYScT5hGT4jlx
         JnEtNoWQZoU0cbti2GDm03sr8zqw9+1gqrHxuYUuJgJ6pDSDGMwo/LmKd1vvPbuvUWX2
         oHPRd0WeCEkMhigG+t6WWJYwgmRF6LAZe/Cd+pSJPKO7ev+o7a93G5oaMb2WRU6b7j98
         4lag==
X-Gm-Message-State: AOJu0YyAcJiNvoBVxd9igDLYlSdTTgz7KhI0k/AbLCd6uMuzNgFDfvae
	aekE/PKqtDlNp9MtWW1mPHiOXWXq7sH5Wd/Ec4PTTlmLXeBqcj+XsNWfe0huPg==
X-Gm-Gg: ASbGncsXyu/DEKU8QZFVJtkfLkW6v4U+jKMYH+Z84mdIrnip9fRuAR17o7dz7EsS4EG
	msKtDxF5JcMHuJzz1makyazCDXzhta25uaqiXlVii9lup7u0tRqxwYbco/xMY2PmEr+0QQl5BaN
	kfE8EO2BC2PezgKxUnd3rQ9RBGEKRW4SclAImsX7kDDVBz6gIr+hp/vl/4+jC6KE7w6F5WL0VGv
	rlVdwkSDIesXx1aq+INrzkf3YOqTOZFRgP72ONAwJHj1W13LKAkg99rke8KaicfMtw8zxRefKWy
	6fEVbvIdQxlMY25NyZboLk2aWkjNnJI84fZEsJrmvWhxpwVnf1APG1c9oF21zbF9/lU+D+TnumT
	K37EZjWG79H18If+TNtqqn3Z14F374CiTO2MLNoxV8cfVvBtBZtVeYUWF7FR/veesdKIudSA=
X-Google-Smtp-Source: AGHT+IFJd74RduHteYepI9PGRMb1n2bWwon+jPRP7TLhKolT9TCgxPaD4laRTpnyrClhIAASMR2A8g==
X-Received: by 2002:a05:6a00:2304:b0:781:1e91:fd8c with SMTP id d2e1a72fcca58-78c98d5d579mr15224489b3a.11.1759781511417;
        Mon, 06 Oct 2025 13:11:51 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:76ff:e777:b915:1894])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-790e25c1c88sm3196782b3a.72.2025.10.06.13.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 13:11:50 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] u-boot: upgrade 2025.07 -> 2025.10
Date: Mon,  6 Oct 2025 17:10:56 -0300
Message-Id: <20251006201056.43185-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 20:11:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224504

Upgrade to U-Boot 2025.10.

Drop all the applied patches.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 ...dependency-from-lib-to-arch-ARCH-lib.patch |  81 -----
 ...1-nxp-Prepare-macros-for-KVM-changes.patch | 100 ------
 ...02-arm-io.h-Fix-io-accessors-for-KVM.patch | 310 ------------------
 ...rm-Enable-virtualizable-IO-accessors.patch |  41 ---
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  12 +-
 ...ols_2025.07.bb => u-boot-tools_2025.10.bb} |   0
 .../{u-boot_2025.07.bb => u-boot_2025.10.bb}  |   0
 7 files changed, 3 insertions(+), 541 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/0001-Makefile-add-dependency-from-lib-to-arch-ARCH-lib.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/0001-nxp-Prepare-macros-for-KVM-changes.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/0002-arm-io.h-Fix-io-accessors-for-KVM.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/0003-qemu-arm-Enable-virtualizable-IO-accessors.patch
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2025.07.bb => u-boot-tools_2025.10.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2025.07.bb => u-boot_2025.10.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/files/0001-Makefile-add-dependency-from-lib-to-arch-ARCH-lib.patch b/meta/recipes-bsp/u-boot/files/0001-Makefile-add-dependency-from-lib-to-arch-ARCH-lib.patch
deleted file mode 100644
index 06fdaf5b0a37..000000000000
--- a/meta/recipes-bsp/u-boot/files/0001-Makefile-add-dependency-from-lib-to-arch-ARCH-lib.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From d0075e2d730a4fa48aa763a669e5edbc02c33a22 Mon Sep 17 00:00:00 2001
-From: Mikko Rapeli <mikko.rapeli@linaro.org>
-Date: Thu, 31 Jul 2025 14:52:48 +0300
-Subject: [PATCH] Makefile: add dependency from lib to arch/$(ARCH)/lib
-
-Top level Makefile starts separate "make" processes for each each
-subdirectory. lib/efi_loader apps now depend on lib.a from
-arch/$(ARCH)/lib if CONFIG_USE_PRIVATE_LIBGCC is enabled which creates
-a race conditions since dependency from lib/efi_loader EFI apps to
-arch/$(ARCH)/lib/lib.a is not explicit:
-
-arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a: No such file or directory
-make[3]: *** [scripts/Makefile.lib:512: lib/efi_loader/testapp_efi.so] Error 1
-
-This error was seen on yocto/OE-core CI builds after u-boot 2025.07 update:
-
-https://lists.openembedded.org/g/openembedded-core/message/220004
-
-https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2914600/raw_inline
-
-    |    rm -f lib/efi_loader/built-in.o; arm-poky-linux-gnueabi-ar cDPrsT lib/efi_loader/built-in.o lib/efi_loader/efi_bootmgr.o lib/efi_loader/efi_bootbin.o lib/efi_loader
-/efi_boottime.o lib/efi_loader/efi_helper.o lib/efi_loader/efi_console.o lib/efi_loader/efi_device_path.o lib/efi_loader/efi_device_path_to_text.o lib/efi_loader/efi_device_
-path_utilities.o lib/efi_loader/efi_dt_fixup.o lib/efi_loader/efi_fdt.o lib/efi_loader/efi_file.o lib/efi_loader/efi_hii.o lib/efi_loader/efi_hii_config.o lib/efi_loader/efi
-_image_loader.o lib/efi_loader/efi_load_options.o lib/efi_loader/efi_memory.o lib/efi_loader/efi_root_node.o lib/efi_loader/efi_runtime.o lib/efi_loader/efi_setup.o lib/efi_
-loader/efi_string.o lib/efi_loader/efi_unicode_collation.o lib/efi_loader/efi_var_common.o lib/efi_loader/efi_var_mem.o lib/efi_loader/efi_variable.o lib/efi_loader/efi_var_
-file.o lib/efi_loader/efi_watchdog.o lib/efi_loader/efi_disk.o lib/efi_loader/efi_net.o lib/efi_loader/efi_smbios.o lib/efi_loader/efi_load_initrd.o lib/efi_loader/efi_confo
-rmance.o
-    |   arm-poky-linux-gnueabi-ld.bfd -nostdlib -zexecstack -znocombreloc -znorelro --no-warn-rwx-segments -L /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-
-3119200/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/2025.07/sources/u-boot-2025.07 -T arch/arm/lib/elf_arm_efi.lds -shared -Bsymbolic -s lib/efi_loader/helloworld.o
-lib/efi_loader/efi_crt0.o lib/efi_loader/efi_reloc.o lib/efi_loader/efi_freestanding.o arch/arm/lib/lib.a -o lib/efi_loader/helloworld_efi.so
-    | arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a: No such file or directory
-    | make[3]: *** [scripts/Makefile.lib:512: lib/efi_loader/helloworld_efi.so] Error 1
-
-The different "make" processes share common scripts/Makefile.build
-and scripts/Makefile.libs but since they are separate processes
-the Makefile rules can't add a dependency from lib/uefi_loader targets
-to arch/$(ARCH)/lib/lib.a. Or the file level dependency can be added but
-then "make" produces a too sparse error message which does not mention
-that one of the dependencies like arch/$(ARCH)/lib/lib.a was not found:
-
-make[3]: *** No rule to make target 'lib/efi_loader/helloworld.efi', needed by '__build'.  Stop.
-
-Fix this dependency problem by building arch/$(ARCH)/lib before lib
-if CONFIG_USE_PRIVATE_LIBGCC was enabled.
-
-To reproduce the race condition more reliably, add a "sleep 10" delay
-before linker command cmd_link_l_target with 2025.07
-or to $(lib-target): target in scripts/Makefile.build with master branch
-after Kbuild update.
-
-Fixes: 43d43241d1c9 ("scripts/Makefile.lib: add PLATFORM_LIBGCC to efi linking")
-
-Cc: Adriano Cordova <adrianox@gmail.com>
-Cc: Fabio Estevam <festevam@gmail.com>
-Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
-Reviewed-by: Fabio Estevam <festevam@gmail.com>
----
- Makefile | 5 +++++
- 1 file changed, 5 insertions(+)
-
-Upstream-Status: Backport
-
-diff --git a/Makefile b/Makefile
-index c31bf7ecea97..b03f87a93fb9 100644
---- a/Makefile
-+++ b/Makefile
-@@ -2131,6 +2131,11 @@ $(filter-out tools, $(u-boot-dirs)): tools
- # is "yes"), so compile examples after U-Boot is compiled.
- examples: $(filter-out examples, $(u-boot-dirs))
- 
-+ifeq ($(CONFIG_USE_PRIVATE_LIBGCC),y)
-+# lib/efi_loader apps depend on arch/$(ARCH)/lib for lib.a
-+lib: $(filter arch/$(ARCH)/lib, $(u-boot-dirs))
-+endif
-+
- # The setlocalversion script comes from linux and expects a
- # KERNELVERSION variable in the environment for figuring out which
- # annotated tags are relevant. Pass UBOOTVERSION.
--- 
-2.43.0
-
diff --git a/meta/recipes-bsp/u-boot/files/0001-nxp-Prepare-macros-for-KVM-changes.patch b/meta/recipes-bsp/u-boot/files/0001-nxp-Prepare-macros-for-KVM-changes.patch
deleted file mode 100644
index fa34c8033ec6..000000000000
--- a/meta/recipes-bsp/u-boot/files/0001-nxp-Prepare-macros-for-KVM-changes.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 9be804cbfde1df715d79247b27de4b388c714cde Mon Sep 17 00:00:00 2001
-From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
-Date: Wed, 18 Jun 2025 09:58:12 +0300
-Subject: [PATCH 1/3] nxp: Prepare macros for KVM changes
-
-A following patch is replacing our IO accessors with
-do { ... } while(0) ones in order to make them usable with KVM.
-
-That leads to an error eventually looking like this:
-arch/arm/include/asm/io.h:62:9: error: expected expression before 'do'
-   62 |         do {                                            \
-      |         ^~
-arch/arm/include/asm/io.h:211:41: note: in expansion of macro '__raw_writel'
-  211 | #define out_arch(type,endian,a,v)       __raw_write##type(cpu_to_##endian(v),a)
-      |                                         ^~~~~~~~~~~
-arch/arm/include/asm/io.h:223:25: note: in expansion of macro 'out_arch'
-  223 | #define out_be32(a,v)   out_arch(l,be32,a,v)
-      |                         ^~~~~~~~
-drivers/spi/fsl_dspi.c:127:17: note: in expansion of macro 'out_be32'
-  127 |                 out_be32(addr, val) : out_le32(addr, val);
-      |                 ^~~~~~~~
-
-So adjust the current macros and code to be compatible with the upcoming
-change.
-
-Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/b56c0632ad62]
-Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
-Reviewed-by: Tom Rini <trini@konsulko.com>
-Signed-off-by: Fabio Estevam <festevam@gmail.com>
----
- drivers/spi/fsl_dspi.c |  6 ++++--
- include/fsl_ifc.h      | 24 ++++++++++++------------
- 2 files changed, 16 insertions(+), 14 deletions(-)
-
-diff --git a/drivers/spi/fsl_dspi.c b/drivers/spi/fsl_dspi.c
-index f2393c041f44..545561ad1169 100644
---- a/drivers/spi/fsl_dspi.c
-+++ b/drivers/spi/fsl_dspi.c
-@@ -123,8 +123,10 @@ static uint dspi_read32(uint flags, uint *addr)
- 
- static void dspi_write32(uint flags, uint *addr, uint val)
- {
--	flags & DSPI_FLAG_REGMAP_ENDIAN_BIG ?
--		out_be32(addr, val) : out_le32(addr, val);
-+	if (flags & DSPI_FLAG_REGMAP_ENDIAN_BIG)
-+		out_be32(addr, val);
-+	else
-+		out_le32(addr, val);
- }
- 
- static void dspi_halt(struct fsl_dspi_priv *priv, u8 halt)
-diff --git a/include/fsl_ifc.h b/include/fsl_ifc.h
-index 3ac226879303..1c363115beb2 100644
---- a/include/fsl_ifc.h
-+++ b/include/fsl_ifc.h
-@@ -803,29 +803,29 @@ void init_final_memctl_regs(void);
- 	((struct fsl_ifc_fcm *)CFG_SYS_IFC_ADDR)
- 
- #define get_ifc_cspr_ext(i)	\
--		(ifc_in32(&(IFC_FCM_BASE_ADDR)->cspr_cs[i].cspr_ext))
-+		ifc_in32(&(IFC_FCM_BASE_ADDR)->cspr_cs[i].cspr_ext)
- #define get_ifc_cspr(i)		\
--		(ifc_in32(&(IFC_FCM_BASE_ADDR)->cspr_cs[i].cspr))
-+		ifc_in32(&(IFC_FCM_BASE_ADDR)->cspr_cs[i].cspr)
- #define get_ifc_csor_ext(i)	\
--		(ifc_in32(&(IFC_FCM_BASE_ADDR)->csor_cs[i].csor_ext))
-+		ifc_in32(&(IFC_FCM_BASE_ADDR)->csor_cs[i].csor_ext)
- #define get_ifc_csor(i)		\
--		(ifc_in32(&(IFC_FCM_BASE_ADDR)->csor_cs[i].csor))
-+		ifc_in32(&(IFC_FCM_BASE_ADDR)->csor_cs[i].csor)
- #define get_ifc_amask(i)	\
--		(ifc_in32(&(IFC_FCM_BASE_ADDR)->amask_cs[i].amask))
-+		ifc_in32(&(IFC_FCM_BASE_ADDR)->amask_cs[i].amask)
- #define get_ifc_ftim(i, j)	\
--		(ifc_in32(&(IFC_FCM_BASE_ADDR)->ftim_cs[i].ftim[j]))
-+		ifc_in32(&(IFC_FCM_BASE_ADDR)->ftim_cs[i].ftim[j])
- #define set_ifc_cspr_ext(i, v)	\
--		(ifc_out32(&(IFC_FCM_BASE_ADDR)->cspr_cs[i].cspr_ext, v))
-+		ifc_out32(&(IFC_FCM_BASE_ADDR)->cspr_cs[i].cspr_ext, v)
- #define set_ifc_cspr(i, v)	\
--		(ifc_out32(&(IFC_FCM_BASE_ADDR)->cspr_cs[i].cspr, v))
-+		ifc_out32(&(IFC_FCM_BASE_ADDR)->cspr_cs[i].cspr, v)
- #define set_ifc_csor_ext(i, v)	\
--		(ifc_out32(&(IFC_FCM_BASE_ADDR)->csor_cs[i].csor_ext, v))
-+		ifc_out32(&(IFC_FCM_BASE_ADDR)->csor_cs[i].csor_ext, v)
- #define set_ifc_csor(i, v)	\
--		(ifc_out32(&(IFC_FCM_BASE_ADDR)->csor_cs[i].csor, v))
-+		ifc_out32(&(IFC_FCM_BASE_ADDR)->csor_cs[i].csor, v)
- #define set_ifc_amask(i, v)	\
--		(ifc_out32(&(IFC_FCM_BASE_ADDR)->amask_cs[i].amask, v))
-+		ifc_out32(&(IFC_FCM_BASE_ADDR)->amask_cs[i].amask, v)
- #define set_ifc_ftim(i, j, v)	\
--		(ifc_out32(&(IFC_FCM_BASE_ADDR)->ftim_cs[i].ftim[j], v))
-+		ifc_out32(&(IFC_FCM_BASE_ADDR)->ftim_cs[i].ftim[j], v)
- 
- enum ifc_chip_sel {
- 	IFC_CS0,
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/u-boot/files/0002-arm-io.h-Fix-io-accessors-for-KVM.patch b/meta/recipes-bsp/u-boot/files/0002-arm-io.h-Fix-io-accessors-for-KVM.patch
deleted file mode 100644
index 558d753d4a39..000000000000
--- a/meta/recipes-bsp/u-boot/files/0002-arm-io.h-Fix-io-accessors-for-KVM.patch
+++ /dev/null
@@ -1,310 +0,0 @@
-From 2fc16d8de5bbe2a40ab25445936150c3250a9077 Mon Sep 17 00:00:00 2001
-From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
-Date: Wed, 18 Jun 2025 09:58:13 +0300
-Subject: [PATCH 2/3] arm: io.h: Fix io accessors for KVM
-
-commit 2e2c2a5e72a8 ("arm: qemu: override flash accessors to use virtualizable instructions")
-explains why we can't have instructions with multiple output registers
-when running under QEMU + KVM and the instruction leads to an exception
-to the hypervisor.
-
-USB XHCI is such a case (MMIO) where a ldr w1, [x0], #4 is emitted for
-xhci_start() which works fine with QEMU but crashes for QEMU + KVM.
-
-These instructions cannot be emulated by KVM as they do not produce
-syndrome information data that KVM can use to infer the destination
-register, the faulting address, whether it was a load or store, or
-if it's a 32 or 64 bit general-purpose register.
-As a result an external abort is injected from QEMU, via ext_dabt_pending
-to KVM and we end up throwing an exception that looks like
-
- U-Boot 2025.07-rc4 (Jun 10 2025 - 12:00:15 +0000)
- [...]
- Register 8001040 NbrPorts 8
- Starting the controller
- "Synchronous Abort" handler, esr 0x96000010, far 0x10100040
- elr: 000000000005b1c8 lr : 000000000005b1ac (reloc)
- elr: 00000000476fc1c8 lr : 00000000476fc1ac
- x0 : 0000000010100040 x1 : 0000000000000001
- x2 : 0000000000000000 x3 : 0000000000003e80
- x4 : 0000000000000000 x5 : 00000000477a5694
- x6 : 0000000000000038 x7 : 000000004666f360
- x8 : 0000000000000000 x9 : 00000000ffffffd8
- x10: 000000000000000d x11: 0000000000000006
- x12: 0000000046560a78 x13: 0000000046560dd0
- x14: 00000000ffffffff x15: 000000004666eed2
- x16: 00000000476ee2f0 x17: 0000000000000000
- x18: 0000000046660dd0 x19: 000000004666f480
- x20: 0000000000000000 x21: 0000000010100040
- x22: 0000000010100000 x23: 0000000000000000
- x24: 0000000000000000 x25: 0000000000000000
- x26: 0000000000000000 x27: 0000000000000000
- x28: 0000000000000000 x29: 000000004666f360
-
- Code: d5033fbf aa1503e0 5287d003 52800002 (b8004401)
- Resetting CPU ...
-
-There are two problems making this the default.
-- It will emit ldr + add or str + add instead of ldr/str(post increment)
-  in somne cases
-- Some platforms that depend on TPL/SPL grow in size enough so that the
-  binary doesn't fit anymore.
-
-So let's add proper I/O accessors add a Kconfig option
-to turn it off by default apart from our QEMU builds.
-
-Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/dc512700ad46]
-Reported-by: Mikko Rapeli <mikko.rapeli@linaro.org>
-Tested-by: Mikko Rapeli <mikko.rapeli@linaro.org>
-Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
-Signed-off-by: Fabio Estevam <festevam@gmail.com>
----
- arch/arm/Kconfig          |  12 +++
- arch/arm/include/asm/io.h | 152 ++++++++++++++++++++++++++++----------
- 2 files changed, 124 insertions(+), 40 deletions(-)
-
-diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 6ff3f2750ea8..f6430a5aaf07 100644
---- a/arch/arm/Kconfig
-+++ b/arch/arm/Kconfig
-@@ -108,6 +108,18 @@ config LNX_KRNL_IMG_TEXT_OFFSET_BASE
- 	  The value subtracted from CONFIG_TEXT_BASE to calculate the
- 	  TEXT_OFFSET value written to the Linux kernel image header.
- 
-+config KVM_VIRT_INS
-+	bool "Emit virtualizable instructions"
-+	help
-+	  Instructions in the ARM ISA that have multiple output registers,
-+	  can't be used if the instruction leads to an exception to the hypervisor.
-+	  These instructions cannot be emulated by KVM because they do not produce
-+	  syndrome information data that KVM can use to infer the destination
-+	  register, the faulting address, whether it was a load or store,
-+	  if it's a 32 or 64 bit general-purpose register amongst other things.
-+	  Use this to produce virtualizable instructions if you plan to run U-Boot
-+	  with KVM.
-+
- config NVIC
- 	bool
- 
-diff --git a/arch/arm/include/asm/io.h b/arch/arm/include/asm/io.h
-index 89b1015bc4d3..85ec0e6937e8 100644
---- a/arch/arm/include/asm/io.h
-+++ b/arch/arm/include/asm/io.h
-@@ -20,23 +20,108 @@ static inline void sync(void)
- {
- }
- 
--/* Generic virtual read/write. */
--#define __arch_getb(a)			(*(volatile unsigned char *)(a))
--#define __arch_getw(a)			(*(volatile unsigned short *)(a))
--#define __arch_getl(a)			(*(volatile unsigned int *)(a))
--#define __arch_getq(a)			(*(volatile unsigned long long *)(a))
-+#ifdef CONFIG_ARM64
-+#define __W	"w"
-+#else
-+#define __W
-+#endif
-+
-+#if CONFIG_IS_ENABLED(SYS_THUMB_BUILD)
-+#define __R "l"
-+#define __RM "=l"
-+#else
-+#define __R "r"
-+#define __RM "=r"
-+#endif
- 
--#define __arch_putb(v,a)		(*(volatile unsigned char *)(a) = (v))
--#define __arch_putw(v,a)		(*(volatile unsigned short *)(a) = (v))
--#define __arch_putl(v,a)		(*(volatile unsigned int *)(a) = (v))
--#define __arch_putq(v,a)		(*(volatile unsigned long long *)(a) = (v))
-+#ifdef CONFIG_KVM_VIRT_INS
-+/*
-+ * The __raw_writeX/__raw_readX below should be converted to static inline
-+ * functions. However doing so produces a lot of compilation warnings when
-+ * called with a raw address. Convert these once the callers have been fixed.
-+ */
-+#define __raw_writeb(val, addr)			\
-+	do {					\
-+		asm volatile("strb %" __W "0, [%1]"	\
-+		:				\
-+		: __R ((u8)(val)), __R (addr));	\
-+	} while (0)
-+
-+#define __raw_readb(addr)				\
-+	({						\
-+		u32 __val;				\
-+		asm volatile("ldrb %" __W "0, [%1]"		\
-+		: __RM (__val)				\
-+		: __R (addr));				\
-+		__val;					\
-+	})
-+
-+#define __raw_writew(val, addr)			\
-+	do {					\
-+		asm volatile("strh %" __W "0, [%1]"	\
-+		:					\
-+		: __R ((u16)(val)), __R (addr));	\
-+	} while (0)
-+
-+#define __raw_readw(addr)				\
-+	({						\
-+		u32 __val;				\
-+		asm volatile("ldrh %" __W "0, [%1]"		\
-+		: __RM (__val)				\
-+		: __R (addr));				\
-+	__val;						\
-+    })
-+
-+#define __raw_writel(val, addr)				\
-+	do {						\
-+		asm volatile("str %" __W "0, [%1]"		\
-+		:					\
-+		: __R ((u32)(val)), __R (addr));	\
-+	} while (0)
-+
-+#define __raw_readl(addr)				\
-+	({						\
-+		u32 __val;				\
-+		asm volatile("ldr %" __W "0, [%1]"		\
-+		: __RM (__val)				\
-+		: __R (addr));				\
-+		__val;					\
-+	})
-+
-+#define __raw_writeq(val, addr)				\
-+	do {						\
-+		asm volatile("str %0, [%1]"		\
-+		:					\
-+		: __R ((u64)(val)), __R (addr));	\
-+	} while (0)
-+
-+#define __raw_readq(addr)				\
-+	({						\
-+		u64 __val;				\
-+		asm volatile("ldr %0, [%1]"		\
-+		: __RM (__val)				\
-+		: __R (addr));				\
-+		__val;					\
-+	    })
-+#else
-+/* Generic virtual read/write. */
-+#define __raw_readb(a)			(*(volatile unsigned char *)(a))
-+#define __raw_readw(a)			(*(volatile unsigned short *)(a))
-+#define __raw_readl(a)			(*(volatile unsigned int *)(a))
-+#define __raw_readq(a)			(*(volatile unsigned long long *)(a))
-+
-+#define __raw_writeb(v, a)		(*(volatile unsigned char *)(a) = (v))
-+#define __raw_writew(v, a)		(*(volatile unsigned short *)(a) = (v))
-+#define __raw_writel(v, a)		(*(volatile unsigned int *)(a) = (v))
-+#define __raw_writeq(v, a)		(*(volatile unsigned long long *)(a) = (v))
-+#endif
- 
- static inline void __raw_writesb(unsigned long addr, const void *data,
- 				 int bytelen)
- {
- 	uint8_t *buf = (uint8_t *)data;
- 	while(bytelen--)
--		__arch_putb(*buf++, addr);
-+		__raw_writeb(*buf++, addr);
- }
- 
- static inline void __raw_writesw(unsigned long addr, const void *data,
-@@ -44,7 +129,7 @@ static inline void __raw_writesw(unsigned long addr, const void *data,
- {
- 	uint16_t *buf = (uint16_t *)data;
- 	while(wordlen--)
--		__arch_putw(*buf++, addr);
-+		__raw_writew(*buf++, addr);
- }
- 
- static inline void __raw_writesl(unsigned long addr, const void *data,
-@@ -52,40 +137,30 @@ static inline void __raw_writesl(unsigned long addr, const void *data,
- {
- 	uint32_t *buf = (uint32_t *)data;
- 	while(longlen--)
--		__arch_putl(*buf++, addr);
-+		__raw_writel(*buf++, addr);
- }
- 
- static inline void __raw_readsb(unsigned long addr, void *data, int bytelen)
- {
- 	uint8_t *buf = (uint8_t *)data;
- 	while(bytelen--)
--		*buf++ = __arch_getb(addr);
-+		*buf++ = __raw_readb(addr);
- }
- 
- static inline void __raw_readsw(unsigned long addr, void *data, int wordlen)
- {
- 	uint16_t *buf = (uint16_t *)data;
- 	while(wordlen--)
--		*buf++ = __arch_getw(addr);
-+		*buf++ = __raw_readw(addr);
- }
- 
- static inline void __raw_readsl(unsigned long addr, void *data, int longlen)
- {
- 	uint32_t *buf = (uint32_t *)data;
- 	while(longlen--)
--		*buf++ = __arch_getl(addr);
-+		*buf++ = __raw_readl(addr);
- }
- 
--#define __raw_writeb(v,a)	__arch_putb(v,a)
--#define __raw_writew(v,a)	__arch_putw(v,a)
--#define __raw_writel(v,a)	__arch_putl(v,a)
--#define __raw_writeq(v,a)	__arch_putq(v,a)
--
--#define __raw_readb(a)		__arch_getb(a)
--#define __raw_readw(a)		__arch_getw(a)
--#define __raw_readl(a)		__arch_getl(a)
--#define __raw_readq(a)		__arch_getq(a)
--
- /*
-  * TODO: The kernel offers some more advanced versions of barriers, it might
-  * have some advantages to use them instead of the simple one here.
-@@ -98,15 +173,15 @@ static inline void __raw_readsl(unsigned long addr, void *data, int longlen)
- 
- #define smp_processor_id()	0
- 
--#define writeb(v,c)	({ u8  __v = v; __iowmb(); __arch_putb(__v,c); __v; })
--#define writew(v,c)	({ u16 __v = v; __iowmb(); __arch_putw(__v,c); __v; })
--#define writel(v,c)	({ u32 __v = v; __iowmb(); __arch_putl(__v,c); __v; })
--#define writeq(v,c)	({ u64 __v = v; __iowmb(); __arch_putq(__v,c); __v; })
-+#define writeb(v, c)	({ u8  __v = v; __iowmb(); writeb_relaxed(__v, c); __v; })
-+#define writew(v, c)	({ u16 __v = v; __iowmb(); writew_relaxed(__v, c); __v; })
-+#define writel(v, c)	({ u32 __v = v; __iowmb(); writel_relaxed(__v, c); __v; })
-+#define writeq(v, c)	({ u64 __v = v; __iowmb(); writeq_relaxed(__v, c); __v; })
- 
--#define readb(c)	({ u8  __v = __arch_getb(c); __iormb(); __v; })
--#define readw(c)	({ u16 __v = __arch_getw(c); __iormb(); __v; })
--#define readl(c)	({ u32 __v = __arch_getl(c); __iormb(); __v; })
--#define readq(c)	({ u64 __v = __arch_getq(c); __iormb(); __v; })
-+#define readb(c)	({ u8  __v = readb_relaxed(c); __iormb(); __v; })
-+#define readw(c)	({ u16 __v = readw_relaxed(c); __iormb(); __v; })
-+#define readl(c)	({ u32 __v = readl_relaxed(c); __iormb(); __v; })
-+#define readq(c)	({ u64 __v = readq_relaxed(c); __iormb(); __v; })
- 
- /*
-  * Relaxed I/O memory access primitives. These follow the Device memory
-@@ -121,13 +196,10 @@ static inline void __raw_readsl(unsigned long addr, void *data, int longlen)
- #define readq_relaxed(c)	({ u64 __r = le64_to_cpu((__force __le64) \
- 						__raw_readq(c)); __r; })
- 
--#define writeb_relaxed(v, c)	((void)__raw_writeb((v), (c)))
--#define writew_relaxed(v, c)	((void)__raw_writew((__force u16) \
--						    cpu_to_le16(v), (c)))
--#define writel_relaxed(v, c)	((void)__raw_writel((__force u32) \
--						    cpu_to_le32(v), (c)))
--#define writeq_relaxed(v, c)	((void)__raw_writeq((__force u64) \
--						    cpu_to_le64(v), (c)))
-+#define writeb_relaxed(v, c)	__raw_writeb((v), (c))
-+#define writew_relaxed(v, c)	__raw_writew((__force u16)cpu_to_le16(v), (c))
-+#define writel_relaxed(v, c)	__raw_writel((__force u32)cpu_to_le32(v), (c))
-+#define writeq_relaxed(v, c)	__raw_writeq((__force u64)cpu_to_le64(v), (c))
- 
- /*
-  * The compiler seems to be incapable of optimising constants
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/u-boot/files/0003-qemu-arm-Enable-virtualizable-IO-accessors.patch b/meta/recipes-bsp/u-boot/files/0003-qemu-arm-Enable-virtualizable-IO-accessors.patch
deleted file mode 100644
index 520c9226b40e..000000000000
--- a/meta/recipes-bsp/u-boot/files/0003-qemu-arm-Enable-virtualizable-IO-accessors.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From cb6120b4bfd8b24dde7e0d1eda882e203a849d3f Mon Sep 17 00:00:00 2001
-From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
-Date: Wed, 18 Jun 2025 09:58:14 +0300
-Subject: [PATCH 3/3] qemu: arm: Enable virtualizable IO accessors
-
-We recently added IO accessors that will work with KVM for any MMIO
-access that casues an exception to the hypervisor. Enable them by
-default for QEMU.
-
-Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/fcc60481ae75]
-Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
-Tested-by: Mikko Rapeli <mikko.rapeli@linaro.org>
-Signed-off-by: Fabio Estevam <festevam@gmail.com>
----
- configs/qemu_arm64_defconfig | 1 +
- configs/qemu_arm_defconfig   | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/configs/qemu_arm64_defconfig b/configs/qemu_arm64_defconfig
-index 72bd255eafa3..39afb837e411 100644
---- a/configs/qemu_arm64_defconfig
-+++ b/configs/qemu_arm64_defconfig
-@@ -1,4 +1,5 @@
- CONFIG_ARM=y
-+CONFIG_KVM_VIRT_INS=y
- CONFIG_ARCH_QEMU=y
- CONFIG_SYS_MALLOC_LEN=0x1000000
- CONFIG_BLOBLIST_SIZE_RELOC=0x2000
-diff --git a/configs/qemu_arm_defconfig b/configs/qemu_arm_defconfig
-index f13001390d4d..92ba48f6af97 100644
---- a/configs/qemu_arm_defconfig
-+++ b/configs/qemu_arm_defconfig
-@@ -1,4 +1,5 @@
- CONFIG_ARM=y
-+CONFIG_KVM_VIRT_INS=y
- CONFIG_ARM_SMCCC=y
- CONFIG_ARCH_QEMU=y
- CONFIG_SYS_MALLOC_LEN=0x1000000
--- 
-2.34.1
-
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index ea55545db34f..93ff0ca6cae2 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,15 +12,9 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "e37de002fac3895e8d0b60ae2015e17bb33e2b5b"
-
-SRC_URI = "\
-    git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV} \
-    file://0001-Makefile-add-dependency-from-lib-to-arch-ARCH-lib.patch \
-    file://0001-nxp-Prepare-macros-for-KVM-changes.patch \
-    file://0002-arm-io.h-Fix-io-accessors-for-KVM.patch \
-    file://0003-qemu-arm-Enable-virtualizable-IO-accessors.patch \
-"
+SRCREV = "e50b1e8715011def8aff1588081a2649a2c6cd47"
+
+SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
 
 SRC_URI_RISCV = "\
     file://u-boot-riscv-isa_clear.cfg \
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2025.07.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2025.10.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2025.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2025.10.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2025.07.bb b/meta/recipes-bsp/u-boot/u-boot_2025.10.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2025.07.bb
rename to meta/recipes-bsp/u-boot/u-boot_2025.10.bb
-- 
2.34.1


