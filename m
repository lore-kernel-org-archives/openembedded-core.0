Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D58F1C83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 17:12:04 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.46821.1753117916313293097
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 10:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L3kOndDz;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-236470b2dceso36733835ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 10:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753117915; x=1753722715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LW11S0Bzopa2JAb1ywr5gabM/XzT2EmBWsWPlLmjNn4=;
        b=L3kOndDzyEOUu9pyOLLW4UH7yOt7ASCl6j7WbitgtGfJPxV2c+7TvVRshkYC7NxtPo
         HZY21eMB6EAvYUDEgsKdbCVeXALKxXcWrHDmcvRWKQOH8Qm6gvNMFXiHESmjIVR/S/W5
         D86qLvN5Axtr4Sx2lN7cwxBr1Fh96NjkNgx3mpRuC8CUH/FI3FnscspQrpa1TK9t0HnK
         S169u8TWyamQG4wJIvfqULRWHzFZq/LvyU5TKVDdE9IjjwE8ONHGe8eVXTI0dhSJlLFi
         QVh+cA55FgHZath28KqTwA/ekPZPQ4rtaLPkBeC4sn7HMewpTnt+g0oh5bcogaaAwol/
         b/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753117915; x=1753722715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LW11S0Bzopa2JAb1ywr5gabM/XzT2EmBWsWPlLmjNn4=;
        b=IWL8rY8oGwhj1VAVnDDCUVCgi2Q9BMiRMaTRT4+lhrbohZa9Ng8Md4hINbvUijl5vs
         qEuHozff0WGvhbPNBmsMJeRnNfRQbLrDiun1V7+o8A3FW66rdAs8wwkWlW4WUN4tyzeA
         2dCbQ7CptXTB0XyJAtjjNd6uGGMXHkOHyOaeweMRE/xE8wccp21qMe4yjIOXvtWcY87E
         N1VpvZNj3psgkOLE9lVysVM3C2ZINNHV0Yu8iAKY1MubXN78HlHP9n5lfWUWBH/wRhHW
         qrIEFCyF9tCH6EGyZ+gLaXdvUw0by/oJ2B9L8K48y3L+0lIDECihvt8pMf5zFlW3nOsO
         mwEQ==
X-Gm-Message-State: AOJu0Yw7kpNKUgDLiFRXFWVkRo50krQsMpKoJCK9MY7on0lhjad2XHqK
	rIbRc2wiLvHw74heKfR6FR7F+pdFbAfK2mWLO2Z4dkWRVhPxBVylv2GbUXbr3w==
X-Gm-Gg: ASbGnctbeaVJI4Hp+u0kgOZ185y6lnXDGI3HCd5CUR7j6XLjMWKuILWrY638Xb0ZMDD
	YVcblZmj3DWzV7vgBmYbkUWfC1KgT90MEiu0qUKPR17Rsc1p9CVN1ZL/ArKKp8A/bLQ5c1aTdbn
	NuMYSXEAcmPTYdq3xyT4vljvp5ZJmURrlvkp2GzPmw4ZsO0lVsENEA48c2L7yY3sRvnnc67q6Y5
	YfQYLy/NKXoU23xds6wMobyIkvhVshMoQXFRbtwb0k5py7E2z21pDULfWOKBOJuUDPCy4Pb+LsB
	TY8y19w/IVMu/7cAdctBJaAcCpI+yQwm0XUbe/Ey6QDb94Mb/Q0m2qmdSdFmdOK/3jVKnssst+L
	v4g4kxZ3H1U1sdaA220o4e3bUpLSz0l8bF5qV
X-Google-Smtp-Source: AGHT+IEmvqzt2/4qVbgFYaqXk7RaV9Yb9hEtRzsG7J0aVgellWW6oB+Un8vXJ6F0iqr+k3KCRdnPGg==
X-Received: by 2002:a17:902:f68d:b0:235:1962:1bf4 with SMTP id d9443c01a7336-23e256b7428mr261756745ad.14.1753117914653;
        Mon, 21 Jul 2025 10:11:54 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:af3a:4b84:73a2:ca20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6eef8esm60561545ad.188.2025.07.21.10.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 10:11:54 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mikko.rapeli@linaro.org,
	trini@konsulko.com,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4] u-boot: upgrade 2025.04 -> 2025.07
Date: Mon, 21 Jul 2025 14:11:32 -0300
Message-Id: <20250721171132.1270623-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 17:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220708

Upgrade to U-Boot 2025.07.

Add patches for build race conditions.
Remove the QEMU KVM USB workaround since the issue is fixed upstream.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
Changes since v3:
- Cherry-pick QEMU KVM USB fixes from upstream.

 ...1-nxp-Prepare-macros-for-KVM-changes.patch | 100 ++++++
 ...02-arm-io.h-Fix-io-accessors-for-KVM.patch | 310 ++++++++++++++++++
 ...rm-Enable-virtualizable-IO-accessors.patch |  41 +++
 .../u-boot/files/disable_CONFIG_USB.cfg       |   1 -
 ...pts-Makefile.lib-fix-_efi.so-depende.patch | 136 ++++++++
 ...kefile-change-apps-from-always-to-ta.patch |  57 ++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  13 +-
 ...ols_2025.04.bb =3D> u-boot-tools_2025.07.bb} |   0
 .../{u-boot_2025.04.bb =3D> u-boot_2025.07.bb}  |   4 +-
 9 files changed, 656 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-nxp-Prepare-macros-f=
or-KVM-changes.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/0002-arm-io.h-Fix-io-acce=
ssors-for-KVM.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/0003-qemu-arm-Enable-virt=
ualizable-IO-accessors.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/disable_CONFIG_USB.cfg
 create mode 100644 meta/recipes-bsp/u-boot/files/v3-0001-Makefile-scripts-=
Makefile.lib-fix-_efi.so-depende.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/v3-0002-efi_loader-Makefi=
le-change-apps-from-always-to-ta.patch
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2025.04.bb =3D> u-boot-tools_=
2025.07.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2025.04.bb =3D> u-boot_2025.07.bb} =
(64%)

diff --git a/meta/recipes-bsp/u-boot/files/0001-nxp-Prepare-macros-for-KVM-=
changes.patch b/meta/recipes-bsp/u-boot/files/0001-nxp-Prepare-macros-for-K=
VM-changes.patch
new file mode 100644
index 000000000000..fa34c8033ec6
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-nxp-Prepare-macros-for-KVM-changes=
.patch
@@ -0,0 +1,100 @@
+From 9be804cbfde1df715d79247b27de4b388c714cde Mon Sep 17 00:00:00 2001
+From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+Date: Wed, 18 Jun 2025 09:58:12 +0300
+Subject: [PATCH 1/3] nxp: Prepare macros for KVM changes
+
+A following patch is replacing our IO accessors with
+do { ... } while(0) ones in order to make them usable with KVM.
+
+That leads to an error eventually looking like this:
+arch/arm/include/asm/io.h:62:9: error: expected expression before 'do'
+   62 |         do {                                            \
+      |         ^~
+arch/arm/include/asm/io.h:211:41: note: in expansion of macro '__raw_write=
l'
+  211 | #define out_arch(type,endian,a,v)       __raw_write##type(cpu_to_#=
#endian(v),a)
+      |                                         ^~~~~~~~~~~
+arch/arm/include/asm/io.h:223:25: note: in expansion of macro 'out_arch'
+  223 | #define out_be32(a,v)   out_arch(l,be32,a,v)
+      |                         ^~~~~~~~
+drivers/spi/fsl_dspi.c:127:17: note: in expansion of macro 'out_be32'
+  127 |                 out_be32(addr, val) : out_le32(addr, val);
+      |                 ^~~~~~~~
+
+So adjust the current macros and code to be compatible with the upcoming
+change.
+
+Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/b56c063=
2ad62]
+Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+Reviewed-by: Tom Rini <trini@konsulko.com>
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+---
+ drivers/spi/fsl_dspi.c |  6 ++++--
+ include/fsl_ifc.h      | 24 ++++++++++++------------
+ 2 files changed, 16 insertions(+), 14 deletions(-)
+
+diff --git a/drivers/spi/fsl_dspi.c b/drivers/spi/fsl_dspi.c
+index f2393c041f44..545561ad1169 100644
+--- a/drivers/spi/fsl_dspi.c
++++ b/drivers/spi/fsl_dspi.c
+@@ -123,8 +123,10 @@ static uint dspi_read32(uint flags, uint *addr)
+=20
+ static void dspi_write32(uint flags, uint *addr, uint val)
+ {
+-	flags & DSPI_FLAG_REGMAP_ENDIAN_BIG ?
+-		out_be32(addr, val) : out_le32(addr, val);
++	if (flags & DSPI_FLAG_REGMAP_ENDIAN_BIG)
++		out_be32(addr, val);
++	else
++		out_le32(addr, val);
+ }
+=20
+ static void dspi_halt(struct fsl_dspi_priv *priv, u8 halt)
+diff --git a/include/fsl_ifc.h b/include/fsl_ifc.h
+index 3ac226879303..1c363115beb2 100644
+--- a/include/fsl_ifc.h
++++ b/include/fsl_ifc.h
+@@ -803,29 +803,29 @@ void init_final_memctl_regs(void);
+ 	((struct fsl_ifc_fcm *)CFG_SYS_IFC_ADDR)
+=20
+ #define get_ifc_cspr_ext(i)	\
+-		(ifc_in32(&(IFC_FCM_BASE_ADDR)->cspr_cs[i].cspr_ext))
++		ifc_in32(&(IFC_FCM_BASE_ADDR)->cspr_cs[i].cspr_ext)
+ #define get_ifc_cspr(i)		\
+-		(ifc_in32(&(IFC_FCM_BASE_ADDR)->cspr_cs[i].cspr))
++		ifc_in32(&(IFC_FCM_BASE_ADDR)->cspr_cs[i].cspr)
+ #define get_ifc_csor_ext(i)	\
+-		(ifc_in32(&(IFC_FCM_BASE_ADDR)->csor_cs[i].csor_ext))
++		ifc_in32(&(IFC_FCM_BASE_ADDR)->csor_cs[i].csor_ext)
+ #define get_ifc_csor(i)		\
+-		(ifc_in32(&(IFC_FCM_BASE_ADDR)->csor_cs[i].csor))
++		ifc_in32(&(IFC_FCM_BASE_ADDR)->csor_cs[i].csor)
+ #define get_ifc_amask(i)	\
+-		(ifc_in32(&(IFC_FCM_BASE_ADDR)->amask_cs[i].amask))
++		ifc_in32(&(IFC_FCM_BASE_ADDR)->amask_cs[i].amask)
+ #define get_ifc_ftim(i, j)	\
+-		(ifc_in32(&(IFC_FCM_BASE_ADDR)->ftim_cs[i].ftim[j]))
++		ifc_in32(&(IFC_FCM_BASE_ADDR)->ftim_cs[i].ftim[j])
+ #define set_ifc_cspr_ext(i, v)	\
+-		(ifc_out32(&(IFC_FCM_BASE_ADDR)->cspr_cs[i].cspr_ext, v))
++		ifc_out32(&(IFC_FCM_BASE_ADDR)->cspr_cs[i].cspr_ext, v)
+ #define set_ifc_cspr(i, v)	\
+-		(ifc_out32(&(IFC_FCM_BASE_ADDR)->cspr_cs[i].cspr, v))
++		ifc_out32(&(IFC_FCM_BASE_ADDR)->cspr_cs[i].cspr, v)
+ #define set_ifc_csor_ext(i, v)	\
+-		(ifc_out32(&(IFC_FCM_BASE_ADDR)->csor_cs[i].csor_ext, v))
++		ifc_out32(&(IFC_FCM_BASE_ADDR)->csor_cs[i].csor_ext, v)
+ #define set_ifc_csor(i, v)	\
+-		(ifc_out32(&(IFC_FCM_BASE_ADDR)->csor_cs[i].csor, v))
++		ifc_out32(&(IFC_FCM_BASE_ADDR)->csor_cs[i].csor, v)
+ #define set_ifc_amask(i, v)	\
+-		(ifc_out32(&(IFC_FCM_BASE_ADDR)->amask_cs[i].amask, v))
++		ifc_out32(&(IFC_FCM_BASE_ADDR)->amask_cs[i].amask, v)
+ #define set_ifc_ftim(i, j, v)	\
+-		(ifc_out32(&(IFC_FCM_BASE_ADDR)->ftim_cs[i].ftim[j], v))
++		ifc_out32(&(IFC_FCM_BASE_ADDR)->ftim_cs[i].ftim[j], v)
+=20
+ enum ifc_chip_sel {
+ 	IFC_CS0,
+--=20
+2.34.1
+
diff --git a/meta/recipes-bsp/u-boot/files/0002-arm-io.h-Fix-io-accessors-f=
or-KVM.patch b/meta/recipes-bsp/u-boot/files/0002-arm-io.h-Fix-io-accessors=
-for-KVM.patch
new file mode 100644
index 000000000000..558d753d4a39
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0002-arm-io.h-Fix-io-accessors-for-KVM.=
patch
@@ -0,0 +1,310 @@
+From 2fc16d8de5bbe2a40ab25445936150c3250a9077 Mon Sep 17 00:00:00 2001
+From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+Date: Wed, 18 Jun 2025 09:58:13 +0300
+Subject: [PATCH 2/3] arm: io.h: Fix io accessors for KVM
+
+commit 2e2c2a5e72a8 ("arm: qemu: override flash accessors to use virtualiz=
able instructions")
+explains why we can't have instructions with multiple output registers
+when running under QEMU + KVM and the instruction leads to an exception
+to the hypervisor.
+
+USB XHCI is such a case (MMIO) where a ldr w1, [x0], #4 is emitted for
+xhci_start() which works fine with QEMU but crashes for QEMU + KVM.
+
+These instructions cannot be emulated by KVM as they do not produce
+syndrome information data that KVM can use to infer the destination
+register, the faulting address, whether it was a load or store, or
+if it's a 32 or 64 bit general-purpose register.
+As a result an external abort is injected from QEMU, via ext_dabt_pending
+to KVM and we end up throwing an exception that looks like
+
+ U-Boot 2025.07-rc4 (Jun 10 2025 - 12:00:15 +0000)
+ [...]
+ Register 8001040 NbrPorts 8
+ Starting the controller
+ "Synchronous Abort" handler, esr 0x96000010, far 0x10100040
+ elr: 000000000005b1c8 lr : 000000000005b1ac (reloc)
+ elr: 00000000476fc1c8 lr : 00000000476fc1ac
+ x0 : 0000000010100040 x1 : 0000000000000001
+ x2 : 0000000000000000 x3 : 0000000000003e80
+ x4 : 0000000000000000 x5 : 00000000477a5694
+ x6 : 0000000000000038 x7 : 000000004666f360
+ x8 : 0000000000000000 x9 : 00000000ffffffd8
+ x10: 000000000000000d x11: 0000000000000006
+ x12: 0000000046560a78 x13: 0000000046560dd0
+ x14: 00000000ffffffff x15: 000000004666eed2
+ x16: 00000000476ee2f0 x17: 0000000000000000
+ x18: 0000000046660dd0 x19: 000000004666f480
+ x20: 0000000000000000 x21: 0000000010100040
+ x22: 0000000010100000 x23: 0000000000000000
+ x24: 0000000000000000 x25: 0000000000000000
+ x26: 0000000000000000 x27: 0000000000000000
+ x28: 0000000000000000 x29: 000000004666f360
+
+ Code: d5033fbf aa1503e0 5287d003 52800002 (b8004401)
+ Resetting CPU ...
+
+There are two problems making this the default.
+- It will emit ldr + add or str + add instead of ldr/str(post increment)
+  in somne cases
+- Some platforms that depend on TPL/SPL grow in size enough so that the
+  binary doesn't fit anymore.
+
+So let's add proper I/O accessors add a Kconfig option
+to turn it off by default apart from our QEMU builds.
+
+Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/dc51270=
0ad46]
+Reported-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+Tested-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+---
+ arch/arm/Kconfig          |  12 +++
+ arch/arm/include/asm/io.h | 152 ++++++++++++++++++++++++++++----------
+ 2 files changed, 124 insertions(+), 40 deletions(-)
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index 6ff3f2750ea8..f6430a5aaf07 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -108,6 +108,18 @@ config LNX_KRNL_IMG_TEXT_OFFSET_BASE
+ 	  The value subtracted from CONFIG_TEXT_BASE to calculate the
+ 	  TEXT_OFFSET value written to the Linux kernel image header.
+=20
++config KVM_VIRT_INS
++	bool "Emit virtualizable instructions"
++	help
++	  Instructions in the ARM ISA that have multiple output registers,
++	  can't be used if the instruction leads to an exception to the hypervis=
or.
++	  These instructions cannot be emulated by KVM because they do not produ=
ce
++	  syndrome information data that KVM can use to infer the destination
++	  register, the faulting address, whether it was a load or store,
++	  if it's a 32 or 64 bit general-purpose register amongst other things.
++	  Use this to produce virtualizable instructions if you plan to run U-Bo=
ot
++	  with KVM.
++
+ config NVIC
+ 	bool
+=20
+diff --git a/arch/arm/include/asm/io.h b/arch/arm/include/asm/io.h
+index 89b1015bc4d3..85ec0e6937e8 100644
+--- a/arch/arm/include/asm/io.h
++++ b/arch/arm/include/asm/io.h
+@@ -20,23 +20,108 @@ static inline void sync(void)
+ {
+ }
+=20
+-/* Generic virtual read/write. */
+-#define __arch_getb(a)			(*(volatile unsigned char *)(a))
+-#define __arch_getw(a)			(*(volatile unsigned short *)(a))
+-#define __arch_getl(a)			(*(volatile unsigned int *)(a))
+-#define __arch_getq(a)			(*(volatile unsigned long long *)(a))
++#ifdef CONFIG_ARM64
++#define __W	"w"
++#else
++#define __W
++#endif
++
++#if CONFIG_IS_ENABLED(SYS_THUMB_BUILD)
++#define __R "l"
++#define __RM "=3Dl"
++#else
++#define __R "r"
++#define __RM "=3Dr"
++#endif
+=20
+-#define __arch_putb(v,a)		(*(volatile unsigned char *)(a) =3D (v))
+-#define __arch_putw(v,a)		(*(volatile unsigned short *)(a) =3D (v))
+-#define __arch_putl(v,a)		(*(volatile unsigned int *)(a) =3D (v))
+-#define __arch_putq(v,a)		(*(volatile unsigned long long *)(a) =3D (v))
++#ifdef CONFIG_KVM_VIRT_INS
++/*
++ * The __raw_writeX/__raw_readX below should be converted to static inline
++ * functions. However doing so produces a lot of compilation warnings when
++ * called with a raw address. Convert these once the callers have been fi=
xed.
++ */
++#define __raw_writeb(val, addr)			\
++	do {					\
++		asm volatile("strb %" __W "0, [%1]"	\
++		:				\
++		: __R ((u8)(val)), __R (addr));	\
++	} while (0)
++
++#define __raw_readb(addr)				\
++	({						\
++		u32 __val;				\
++		asm volatile("ldrb %" __W "0, [%1]"		\
++		: __RM (__val)				\
++		: __R (addr));				\
++		__val;					\
++	})
++
++#define __raw_writew(val, addr)			\
++	do {					\
++		asm volatile("strh %" __W "0, [%1]"	\
++		:					\
++		: __R ((u16)(val)), __R (addr));	\
++	} while (0)
++
++#define __raw_readw(addr)				\
++	({						\
++		u32 __val;				\
++		asm volatile("ldrh %" __W "0, [%1]"		\
++		: __RM (__val)				\
++		: __R (addr));				\
++	__val;						\
++    })
++
++#define __raw_writel(val, addr)				\
++	do {						\
++		asm volatile("str %" __W "0, [%1]"		\
++		:					\
++		: __R ((u32)(val)), __R (addr));	\
++	} while (0)
++
++#define __raw_readl(addr)				\
++	({						\
++		u32 __val;				\
++		asm volatile("ldr %" __W "0, [%1]"		\
++		: __RM (__val)				\
++		: __R (addr));				\
++		__val;					\
++	})
++
++#define __raw_writeq(val, addr)				\
++	do {						\
++		asm volatile("str %0, [%1]"		\
++		:					\
++		: __R ((u64)(val)), __R (addr));	\
++	} while (0)
++
++#define __raw_readq(addr)				\
++	({						\
++		u64 __val;				\
++		asm volatile("ldr %0, [%1]"		\
++		: __RM (__val)				\
++		: __R (addr));				\
++		__val;					\
++	    })
++#else
++/* Generic virtual read/write. */
++#define __raw_readb(a)			(*(volatile unsigned char *)(a))
++#define __raw_readw(a)			(*(volatile unsigned short *)(a))
++#define __raw_readl(a)			(*(volatile unsigned int *)(a))
++#define __raw_readq(a)			(*(volatile unsigned long long *)(a))
++
++#define __raw_writeb(v, a)		(*(volatile unsigned char *)(a) =3D (v))
++#define __raw_writew(v, a)		(*(volatile unsigned short *)(a) =3D (v))
++#define __raw_writel(v, a)		(*(volatile unsigned int *)(a) =3D (v))
++#define __raw_writeq(v, a)		(*(volatile unsigned long long *)(a) =3D (v))
++#endif
+=20
+ static inline void __raw_writesb(unsigned long addr, const void *data,
+ 				 int bytelen)
+ {
+ 	uint8_t *buf =3D (uint8_t *)data;
+ 	while(bytelen--)
+-		__arch_putb(*buf++, addr);
++		__raw_writeb(*buf++, addr);
+ }
+=20
+ static inline void __raw_writesw(unsigned long addr, const void *data,
+@@ -44,7 +129,7 @@ static inline void __raw_writesw(unsigned long addr, co=
nst void *data,
+ {
+ 	uint16_t *buf =3D (uint16_t *)data;
+ 	while(wordlen--)
+-		__arch_putw(*buf++, addr);
++		__raw_writew(*buf++, addr);
+ }
+=20
+ static inline void __raw_writesl(unsigned long addr, const void *data,
+@@ -52,40 +137,30 @@ static inline void __raw_writesl(unsigned long addr, =
const void *data,
+ {
+ 	uint32_t *buf =3D (uint32_t *)data;
+ 	while(longlen--)
+-		__arch_putl(*buf++, addr);
++		__raw_writel(*buf++, addr);
+ }
+=20
+ static inline void __raw_readsb(unsigned long addr, void *data, int bytel=
en)
+ {
+ 	uint8_t *buf =3D (uint8_t *)data;
+ 	while(bytelen--)
+-		*buf++ =3D __arch_getb(addr);
++		*buf++ =3D __raw_readb(addr);
+ }
+=20
+ static inline void __raw_readsw(unsigned long addr, void *data, int wordl=
en)
+ {
+ 	uint16_t *buf =3D (uint16_t *)data;
+ 	while(wordlen--)
+-		*buf++ =3D __arch_getw(addr);
++		*buf++ =3D __raw_readw(addr);
+ }
+=20
+ static inline void __raw_readsl(unsigned long addr, void *data, int longl=
en)
+ {
+ 	uint32_t *buf =3D (uint32_t *)data;
+ 	while(longlen--)
+-		*buf++ =3D __arch_getl(addr);
++		*buf++ =3D __raw_readl(addr);
+ }
+=20
+-#define __raw_writeb(v,a)	__arch_putb(v,a)
+-#define __raw_writew(v,a)	__arch_putw(v,a)
+-#define __raw_writel(v,a)	__arch_putl(v,a)
+-#define __raw_writeq(v,a)	__arch_putq(v,a)
+-
+-#define __raw_readb(a)		__arch_getb(a)
+-#define __raw_readw(a)		__arch_getw(a)
+-#define __raw_readl(a)		__arch_getl(a)
+-#define __raw_readq(a)		__arch_getq(a)
+-
+ /*
+  * TODO: The kernel offers some more advanced versions of barriers, it mi=
ght
+  * have some advantages to use them instead of the simple one here.
+@@ -98,15 +173,15 @@ static inline void __raw_readsl(unsigned long addr, v=
oid *data, int longlen)
+=20
+ #define smp_processor_id()	0
+=20
+-#define writeb(v,c)	({ u8  __v =3D v; __iowmb(); __arch_putb(__v,c); __v;=
 })
+-#define writew(v,c)	({ u16 __v =3D v; __iowmb(); __arch_putw(__v,c); __v;=
 })
+-#define writel(v,c)	({ u32 __v =3D v; __iowmb(); __arch_putl(__v,c); __v;=
 })
+-#define writeq(v,c)	({ u64 __v =3D v; __iowmb(); __arch_putq(__v,c); __v;=
 })
++#define writeb(v, c)	({ u8  __v =3D v; __iowmb(); writeb_relaxed(__v, c);=
 __v; })
++#define writew(v, c)	({ u16 __v =3D v; __iowmb(); writew_relaxed(__v, c);=
 __v; })
++#define writel(v, c)	({ u32 __v =3D v; __iowmb(); writel_relaxed(__v, c);=
 __v; })
++#define writeq(v, c)	({ u64 __v =3D v; __iowmb(); writeq_relaxed(__v, c);=
 __v; })
+=20
+-#define readb(c)	({ u8  __v =3D __arch_getb(c); __iormb(); __v; })
+-#define readw(c)	({ u16 __v =3D __arch_getw(c); __iormb(); __v; })
+-#define readl(c)	({ u32 __v =3D __arch_getl(c); __iormb(); __v; })
+-#define readq(c)	({ u64 __v =3D __arch_getq(c); __iormb(); __v; })
++#define readb(c)	({ u8  __v =3D readb_relaxed(c); __iormb(); __v; })
++#define readw(c)	({ u16 __v =3D readw_relaxed(c); __iormb(); __v; })
++#define readl(c)	({ u32 __v =3D readl_relaxed(c); __iormb(); __v; })
++#define readq(c)	({ u64 __v =3D readq_relaxed(c); __iormb(); __v; })
+=20
+ /*
+  * Relaxed I/O memory access primitives. These follow the Device memory
+@@ -121,13 +196,10 @@ static inline void __raw_readsl(unsigned long addr, =
void *data, int longlen)
+ #define readq_relaxed(c)	({ u64 __r =3D le64_to_cpu((__force __le64) \
+ 						__raw_readq(c)); __r; })
+=20
+-#define writeb_relaxed(v, c)	((void)__raw_writeb((v), (c)))
+-#define writew_relaxed(v, c)	((void)__raw_writew((__force u16) \
+-						    cpu_to_le16(v), (c)))
+-#define writel_relaxed(v, c)	((void)__raw_writel((__force u32) \
+-						    cpu_to_le32(v), (c)))
+-#define writeq_relaxed(v, c)	((void)__raw_writeq((__force u64) \
+-						    cpu_to_le64(v), (c)))
++#define writeb_relaxed(v, c)	__raw_writeb((v), (c))
++#define writew_relaxed(v, c)	__raw_writew((__force u16)cpu_to_le16(v), (c=
))
++#define writel_relaxed(v, c)	__raw_writel((__force u32)cpu_to_le32(v), (c=
))
++#define writeq_relaxed(v, c)	__raw_writeq((__force u64)cpu_to_le64(v), (c=
))
+=20
+ /*
+  * The compiler seems to be incapable of optimising constants
+--=20
+2.34.1
+
diff --git a/meta/recipes-bsp/u-boot/files/0003-qemu-arm-Enable-virtualizab=
le-IO-accessors.patch b/meta/recipes-bsp/u-boot/files/0003-qemu-arm-Enable-=
virtualizable-IO-accessors.patch
new file mode 100644
index 000000000000..520c9226b40e
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0003-qemu-arm-Enable-virtualizable-IO-a=
ccessors.patch
@@ -0,0 +1,41 @@
+From cb6120b4bfd8b24dde7e0d1eda882e203a849d3f Mon Sep 17 00:00:00 2001
+From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+Date: Wed, 18 Jun 2025 09:58:14 +0300
+Subject: [PATCH 3/3] qemu: arm: Enable virtualizable IO accessors
+
+We recently added IO accessors that will work with KVM for any MMIO
+access that casues an exception to the hypervisor. Enable them by
+default for QEMU.
+
+Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/fcc6048=
1ae75]
+Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
+Tested-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+---
+ configs/qemu_arm64_defconfig | 1 +
+ configs/qemu_arm_defconfig   | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/configs/qemu_arm64_defconfig b/configs/qemu_arm64_defconfig
+index 72bd255eafa3..39afb837e411 100644
+--- a/configs/qemu_arm64_defconfig
++++ b/configs/qemu_arm64_defconfig
+@@ -1,4 +1,5 @@
+ CONFIG_ARM=3Dy
++CONFIG_KVM_VIRT_INS=3Dy
+ CONFIG_ARCH_QEMU=3Dy
+ CONFIG_SYS_MALLOC_LEN=3D0x1000000
+ CONFIG_BLOBLIST_SIZE_RELOC=3D0x2000
+diff --git a/configs/qemu_arm_defconfig b/configs/qemu_arm_defconfig
+index f13001390d4d..92ba48f6af97 100644
+--- a/configs/qemu_arm_defconfig
++++ b/configs/qemu_arm_defconfig
+@@ -1,4 +1,5 @@
+ CONFIG_ARM=3Dy
++CONFIG_KVM_VIRT_INS=3Dy
+ CONFIG_ARM_SMCCC=3Dy
+ CONFIG_ARCH_QEMU=3Dy
+ CONFIG_SYS_MALLOC_LEN=3D0x1000000
+--=20
+2.34.1
+
diff --git a/meta/recipes-bsp/u-boot/files/disable_CONFIG_USB.cfg b/meta/re=
cipes-bsp/u-boot/files/disable_CONFIG_USB.cfg
deleted file mode 100644
index 1d2509982be1..000000000000
--- a/meta/recipes-bsp/u-boot/files/disable_CONFIG_USB.cfg
+++ /dev/null
@@ -1 +0,0 @@
-# CONFIG_USB is not set
diff --git a/meta/recipes-bsp/u-boot/files/v3-0001-Makefile-scripts-Makefil=
e.lib-fix-_efi.so-depende.patch b/meta/recipes-bsp/u-boot/files/v3-0001-Mak=
efile-scripts-Makefile.lib-fix-_efi.so-depende.patch
new file mode 100644
index 000000000000..e8253a67b211
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/v3-0001-Makefile-scripts-Makefile.lib-f=
ix-_efi.so-depende.patch
@@ -0,0 +1,136 @@
+From 2e7c1321bb44cc6af4ee4b1026a52e1a0aa7e336 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Thu, 10 Jul 2025 14:24:07 +0000
+Subject: [PATCH v3 1/2] Makefile scripts/Makefile.lib: fix *_efi.so depend=
ency
+ to PLATFORM_LIBGCC
+
+When PLATFORM_LIBGCC was added to linker command it was not
+added to the dependency of the .so and other rules. Thus a build can
+try to link *_efi.so files before lib.a from PLATFORM_LIBGCC is available.
+This was seen in yocto autobuilder builds with u-boot 2025.07
+update, see https://lists.openembedded.org/g/openembedded-core/message/220=
004
+
+https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2914600/raw_inli=
ne
+
+|    rm -f lib/efi_loader/built-in.o; arm-poky-linux-gnueabi-ar cDPrsT lib=
/efi_loader/built-in.o lib/efi_loader/efi_bootmgr.o lib/efi_loader/efi_boot=
bin.o lib/efi_loader/efi_boottime.o lib/efi_loader/efi_helper.o lib/efi_loa=
der/efi_console.o lib/efi_loader/efi_device_path.o lib/efi_loader/efi_devic=
e_path_to_text.o lib/efi_loader/efi_device_path_utilities.o lib/efi_loader/=
efi_dt_fixup.o lib/efi_loader/efi_fdt.o lib/efi_loader/efi_file.o lib/efi_l=
oader/efi_hii.o lib/efi_loader/efi_hii_config.o lib/efi_loader/efi_image_lo=
ader.o lib/efi_loader/efi_load_options.o lib/efi_loader/efi_memory.o lib/ef=
i_loader/efi_root_node.o lib/efi_loader/efi_runtime.o lib/efi_loader/efi_se=
tup.o lib/efi_loader/efi_string.o lib/efi_loader/efi_unicode_collation.o li=
b/efi_loader/efi_var_common.o lib/efi_loader/efi_var_mem.o lib/efi_loader/e=
fi_variable.o lib/efi_loader/efi_var_file.o lib/efi_loader/efi_watchdog.o l=
ib/efi_loader/efi_disk.o lib/efi_loader/efi_net.o lib/efi_loader/efi_smbios=
.o lib/efi_loader/efi_load_initrd.o lib/efi_loader/efi_conformance.o
+|   arm-poky-linux-gnueabi-ld.bfd -nostdlib -zexecstack -znocombreloc -zno=
relro --no-warn-rwx-segments -L /srv/pokybuild/yocto-worker/oe-selftest-arm=
host/build/build-st-3119200/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-=
boot/2025.07/sources/u-boot-2025.07 -T arch/arm/lib/elf_arm_efi.lds -shared=
 -Bsymbolic -s lib/efi_loader/helloworld.o lib/efi_loader/efi_crt0.o lib/ef=
i_loader/efi_reloc.o lib/efi_loader/efi_freestanding.o arch/arm/lib/lib.a -=
o lib/efi_loader/helloworld_efi.so
+| arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a: No such f=
ile or directory
+| make[3]: *** [scripts/Makefile.lib:512: lib/efi_loader/helloworld_efi.so=
] Error 1
+
+The issue is hard to reproduce but this change can artificially trigger it:
+
+  a/scripts/Makefile.build
+  b/scripts/Makefile.build
+@@ -353,7 +353,7 @@ $(modorder-target): $(subdir-ym) FORCE
+ #
+ ifdef lib-target
+ quiet_cmd_link_l_target =3D AR      $@
+-cmd_link_l_target =3D rm -f $@; $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(lib-y)
++cmd_link_l_target =3D rm -f $@ && echo "HACK, delaying build!" && sleep 6=
0 && $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(lib-y)
+
+ $(lib-target): $(lib-y) FORCE
+        $(call if_changed,link_l_target)
+
+Then run a rebuild with:
+
+$  rm -f $( find build/ -name lib.a -or -name helloworld_efi.so ) && \
+   make
+...
+  arm-poky-linux-gnueabi-ld.bfd -nostdlib -zexecstack -znocombreloc -znore=
lro --no-warn-rwx-segments -L /home/mcfrisk/src/base/repo/poky/build_bea
+glebone/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/2025.07/source=
s/u-boot-2025.07 -T arch/arm/lib/elf_arm_efi.lds -shared -Bsymbolic -s lib/=
efi_loader/helloworld.o lib/efi_loader/efi_crt0.o lib/efi_loader/efi_reloc.=
o lib/efi_loader/efi_freestanding.o arch/arm/lib/lib.a -o lib/efi_loader/he=
lloworld_efi.so
+arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a: No such fil=
e or directory
+make[3]: *** [scripts/Makefile.lib:512: lib/efi_loader/helloworld_efi.so] =
Error 1
+
+Fix by introducing PLATFORM_LIBGCC_LIBA variable with only lib.a
+filename which is then used to add the dependency in rules which use
+PLATFORM_LIBGCC. This should not impact builds which don't set
+PLATFORM_LIBGCC_LIBA and PLATFORM_LIBGCC usage stays as is.
+
+Fixes: 43d43241d1c9 ("scripts/Makefile.lib: add PLATFORM_LIBGCC to efi lin=
king")
+
+Cc: Adriano Cordova <adrianox@gmail.com>
+Cc: Fabio Estevam <festevam@gmail.com>
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ Makefile                     | 4 +++-
+ examples/standalone/Makefile | 2 +-
+ scripts/Makefile.lib         | 2 +-
+ scripts/Makefile.xpl         | 3 ++-
+ 4 files changed, 7 insertions(+), 4 deletions(-)
+
+Upstream-Status: Submitted [https://lists.denx.de/pipermail/u-boot/2025-Ju=
ly/594581.html]
+
+v3: added "export PLATFORM_LIBGCC_LIBA" like PLATFORM_LIBGCC, not sure
+    how testing worked without this before
+
+v2: introduced PLATFORM_LIBGCC_LIBA variable with just lib.a filename,
+    PLATFORM_LIBGCC can have other flags too
+    https://lists.denx.de/pipermail/u-boot/2025-July/594034.html
+
+v1: https://lists.denx.de/pipermail/u-boot/2025-July/593982.html
+
+diff --git a/Makefile b/Makefile
+index 1a5c77d7caf0..a0797f36f7f6 100644
+--- a/Makefile
++++ b/Makefile
+@@ -911,7 +911,8 @@ u-boot-main :=3D $(libs-y)
+=20
+ # Add GCC lib
+ ifeq ($(CONFIG_USE_PRIVATE_LIBGCC),y)
+-PLATFORM_LIBGCC =3D arch/$(ARCH)/lib/lib.a
++PLATFORM_LIBGCC_LIBA =3D arch/$(ARCH)/lib/lib.a
++PLATFORM_LIBGCC =3D $(PLATFORM_LIBGCC_LIBA)
+ else
+ ifndef CONFIG_CC_IS_CLANG
+ PLATFORM_LIBGCC :=3D -L $(shell dirname `$(CC) $(c_flags) -print-libgcc-f=
ile-name`) -lgcc
+@@ -926,6 +927,7 @@ endif
+=20
+ export PLATFORM_LIBS
+ export PLATFORM_LIBGCC
++export PLATFORM_LIBGCC_LIBA
+=20
+ # Special flags for CPP when processing the linker script.
+ # Pass the version down so we can handle backwards compatibility
+diff --git a/examples/standalone/Makefile b/examples/standalone/Makefile
+index 9b57f1c0c66c..aa9e3121cf9a 100644
+--- a/examples/standalone/Makefile
++++ b/examples/standalone/Makefile
+@@ -64,7 +64,7 @@ quiet_cmd_link_elf =3D LD      $@
+       cmd_link_elf =3D $(LD) $(KBUILD_LDFLAGS) $(LDFLAGS_STANDALONE) -g  \
+ 		     -o $@ -e $(SYM_PREFIX)$(@F) $< $(LIB) $(PLATFORM_LIBGCC)
+=20
+-$(ELF): $(obj)/%: $(obj)/%.o $(LIB) FORCE
++$(ELF): $(obj)/%: $(obj)/%.o $(LIB) $(PLATFORM_LIBGCC_LIBA) FORCE
+ 	$(call if_changed,link_elf)
+=20
+ $(obj)/%.srec: OBJCOPYFLAGS +=3D -O srec
+diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
+index e89a4a51b74d..cef3863dfdc4 100644
+--- a/scripts/Makefile.lib
++++ b/scripts/Makefile.lib
+@@ -508,7 +508,7 @@ $(obj)/efi_reloc.o: $(srctree)/arch/$(ARCH)/lib/$(EFI_=
RELOC:.o=3D.c) $(recordmcoun
+ 	$(call cmd,force_checksrc)
+ 	$(call if_changed_rule,cc_o_c)
+=20
+-$(obj)/%_efi.so: $(obj)/%.o $(obj)/efi_crt0.o $(obj)/efi_reloc.o $(obj)/e=
fi_freestanding.o
++$(obj)/%_efi.so: $(PLATFORM_LIBGCC_LIBA) $(obj)/%.o $(obj)/efi_crt0.o $(o=
bj)/efi_reloc.o $(obj)/efi_freestanding.o
+ 	$(call cmd,efi_ld)
+=20
+ targets +=3D $(obj)/efi_crt0.o $(obj)/efi_reloc.o $(obj)/efi_freestanding=
.o
+diff --git a/scripts/Makefile.xpl b/scripts/Makefile.xpl
+index 43f27874f9fe..68c88293f0d9 100644
+--- a/scripts/Makefile.xpl
++++ b/scripts/Makefile.xpl
+@@ -139,7 +139,8 @@ libs-y :=3D $(patsubst %/, %/built-in.o, $(libs-y))
+=20
+ # Add GCC lib
+ ifeq ($(CONFIG_USE_PRIVATE_LIBGCC),y)
+-PLATFORM_LIBGCC =3D arch/$(ARCH)/lib/lib.a
++PLATFORM_LIBGCC_LIBA =3D arch/$(ARCH)/lib/lib.a
++PLATFORM_LIBGCC =3D $(PLATFORM_LIBGCC_LIBA)
+ PLATFORM_LIBS :=3D $(filter-out %/lib.a, $(filter-out -lgcc, $(PLATFORM_L=
IBS))) $(PLATFORM_LIBGCC)
+ endif
+=20
+--=20
+2.43.0
+
diff --git a/meta/recipes-bsp/u-boot/files/v3-0002-efi_loader-Makefile-chan=
ge-apps-from-always-to-ta.patch b/meta/recipes-bsp/u-boot/files/v3-0002-efi=
_loader-Makefile-change-apps-from-always-to-ta.patch
new file mode 100644
index 000000000000..6b68f7472410
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/v3-0002-efi_loader-Makefile-change-apps=
-from-always-to-ta.patch
@@ -0,0 +1,57 @@
+From d207ec22429adc94f9e173971e30c675d2ab3de4 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Fri, 18 Jul 2025 08:15:25 +0000
+Subject: [PATCH v3 2/2] efi_loader Makefile: change apps from "always" to
+ "targets"
+
+Adding delay to link commands in scripts/Makefile.build
+
+@@ -353,7 +353,7 @@ $(modorder-target): $(subdir-ym) FORCE
+ #
+ ifdef lib-target
+ quiet_cmd_link_l_target =3D AR      $@
+-cmd_link_l_target =3D rm -f $@; $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(lib-y)
++cmd_link_l_target =3D rm -f $@; echo "HACK delaying lib-target"; sleep 10=
; $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(lib-y)
+
+ $(lib-target): $(lib-y) FORCE
+        $(call if_changed,link_l_target)
+(1/2) Stage this hunk [y,n,q,a,d,j,J,g,/,e,?]? n
+@@ -362,7 +362,7 @@ targets +=3D $(lib-target)
+ endif
+
+ quiet_cmd_link_multi-y =3D AR      $@
+-cmd_link_multi-y =3D rm -f $@; $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(filter =
%.o,$^)
++cmd_link_multi-y =3D rm -f $@; echo "HACK delaying cmd_link_multi-y"; sle=
ep 10; $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(filter %.o,$^)
+
+ quiet_cmd_link_multi-m =3D AR [M]  $@
+ cmd_link_multi-m =3D $(cmd_link_multi-y)
+
+exposes a build failure:
+
+make[3]: *** No rule to make target 'lib/efi_loader/helloworld.efi', neede=
d by '__build'.  Stop.
+make[3]: *** Waiting for unfinished jobs....
+
+This if fixed by using normal targets for .efi apps. The rules
+in scripts/Makefile.lib handle the dependencies correctly.
+
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ lib/efi_loader/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Upstream-Status: Submitted [https://lists.denx.de/pipermail/u-boot/2025-Ju=
ly/594583.html]
+
+diff --git a/lib/efi_loader/Makefile b/lib/efi_loader/Makefile
+index cf050e5385dd..e929c23b1cb1 100644
+--- a/lib/efi_loader/Makefile
++++ b/lib/efi_loader/Makefile
+@@ -96,5 +96,5 @@ $(foreach f,$(apps-y),\
+ 	$(eval CFLAGS_$(f).o :=3D $(CFLAGS_EFI) -Os -ffreestanding)\
+ 	$(eval CFLAGS_REMOVE_$(f).o :=3D $(CFLAGS_NON_EFI)))
+=20
+-always +=3D $(foreach f,$(apps-y),$(f).efi)
++targets +=3D $(foreach f,$(apps-y),$(f).efi)
+ targets +=3D $(foreach f,$(apps-y),$(f).o)
+--=20
+2.43.0
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u=
-boot/u-boot-common.inc
index 8600d4bab6ed..053e68635453 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,9 +12,16 @@ PE =3D "1"
=20
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV =3D "34820924edbc4ec7803eb89d9852f4b870fa760a"
-
-SRC_URI =3D "git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;branc=
h=3Dmaster;tag=3Dv${PV}"
+SRCREV =3D "e37de002fac3895e8d0b60ae2015e17bb33e2b5b"
+
+SRC_URI =3D "\
+    git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;branch=3Dmaste=
r;tag=3Dv${PV} \
+    file://v3-0001-Makefile-scripts-Makefile.lib-fix-_efi.so-depende.patch=
 \
+    file://v3-0002-efi_loader-Makefile-change-apps-from-always-to-ta.patch=
 \
+    file://0001-nxp-Prepare-macros-for-KVM-changes.patch \
+    file://0002-arm-io.h-Fix-io-accessors-for-KVM.patch \
+    file://0003-qemu-arm-Enable-virtualizable-IO-accessors.patch \
+"
=20
 SRC_URI_RISCV =3D "\
     file://u-boot-riscv-isa_clear.cfg \
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2025.04.bb b/meta/recipes=
-bsp/u-boot/u-boot-tools_2025.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2025.04.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2025.07.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2025.04.bb b/meta/recipes-bsp/u=
-boot/u-boot_2025.07.bb
similarity index 64%
rename from meta/recipes-bsp/u-boot/u-boot_2025.04.bb
rename to meta/recipes-bsp/u-boot/u-boot_2025.07.bb
index 89e964f627e5..25f264c961eb 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2025.04.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2025.07.bb
@@ -4,5 +4,5 @@ require u-boot.inc
 DEPENDS +=3D "bc-native dtc-native gnutls-native python3-pyelftools-native"
=20
 # workarounds for aarch64 kvm qemu boot regressions
-SRC_URI:append:qemuarm64 =3D " file://disable-CONFIG_BLOBLIST.cfg file://d=
isable_CONFIG_USB.cfg"
-SRC_URI:append:genericarm64 =3D " file://disable-CONFIG_BLOBLIST.cfg file:=
//disable_CONFIG_USB.cfg"
+SRC_URI:append:qemuarm64 =3D " file://disable-CONFIG_BLOBLIST.cfg"
+SRC_URI:append:genericarm64 =3D " file://disable-CONFIG_BLOBLIST.cfg"
--=20
2.34.1


