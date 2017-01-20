Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5456B731F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 14:13:39 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id c7so21443055itd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 06:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9i5SofXvseWuemMeypkZmbWdVimsjuy3u1dXHvRGfZc=;
	b=AOdGbfDMTuYBEY+u3gEw3Ay8baJ15VjsGUT+vCz6pGn8MUe7x5WCfe/WSFPwgWbm8G
	aZGcoq7jJ4O8D79Sh/18m02tgBQDHsZd1Ydt/QKv2hN+WRTWj/8LhY4I2OzPfZ3xCGam
	ZCggboQ7Ho7xF17R1fK2+4+suExdGGtDWjWZoAmDZHEw3SjJyL1st1IqdnvgJ7J24dim
	N2j7TsGvl2TB2WYWBh7xnLPyhWgRJDb9S2OXPp70+qzjkRf/CTXLESKGBFu+OFdXEEP4
	1ZXDKnwYD4zh9WiPeUnzLMQQLeQJW03fmCqg0mEQlZj0m9HG1pA/K07hR2JD5Sqh+gKp
	HY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9i5SofXvseWuemMeypkZmbWdVimsjuy3u1dXHvRGfZc=;
	b=P82eKNU/H/MwIFWExtM/5lhIqbzdvYM6MX297QbalVPtUoYDy76bWdhw0LMjNWLd5k
	9P5zyoJRy85oJypDRC+iOeGIflXoylREfp/fLu8NnQKq+69IC9TQIJaBESmGCQvYIgL4
	B/ZZBUnnsZtMIK/66x9W8Wb72p1+z86Zp/okBCzU2WA26MvLw0R/6cTtkmTdyEVFrM0G
	eFTNCrXwYx9X9RuokPeDud8phW6VeUucaLZ375XJE3a0a5++PxGWYZy9/arKTwNF3boK
	BteVViI3k/X1S/iv6SniNaHby4swzY7V8EOrxoF1jjevVeB9Y78k1YKf0dpoNK1vVvLD
	yUlA==
X-Gm-Message-State: AIkVDXLH0zXNeJvhOW/mJf4f3mDMpJ+msUHBwwAwXkgXC3Kk5/fr9C5aMjuHWcGAuI/0dw4A
X-Received: by 10.36.169.12 with SMTP id r12mr3692533ite.69.1484921619598;
	Fri, 20 Jan 2017 06:13:39 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56DD5.dip0.t-ipconnect.de.
	[87.165.109.213])
	by smtp.gmail.com with ESMTPSA id k6sm4573464ioe.1.2017.01.20.06.13.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jan 2017 06:13:38 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 15:12:43 +0100
Message-Id: <7e46c8339039adf3c197313a6beebbb8dec1db25.1484921498.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
References: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
Subject: [PATCH v4 12/12] ovmf: remove BGRT patch
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
X-List-Received-Date: Fri, 20 Jan 2017 14:13:39 -0000

This patch was added to meta-luv for kernel testing purposes and
probably is not relevant for OE-core.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-core/ovmf/ovmf/0001-OvmfPkg-Enable-BGRT-in-OVMF.patch | 110 +------------------------------------------------------------------------
 meta/recipes-core/ovmf/ovmf_git.bb                                 |   1 +-
 2 files changed, 111 deletions(-)
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0001-OvmfPkg-Enable-BGRT-in-OVMF.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-OvmfPkg-Enable-BGRT-in-OVMF.patch b/meta/recipes-core/ovmf/ovmf/0001-OvmfPkg-Enable-BGRT-in-OVMF.patch
deleted file mode 100644
index 4531a6d..0000000
--- a/meta/recipes-core/ovmf/ovmf/0001-OvmfPkg-Enable-BGRT-in-OVMF.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 66a4020c3c2163aeffc9757851f33c346ecfd870 Mon Sep 17 00:00:00 2001
-From: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
-Date: Mon, 4 Apr 2016 12:15:12 -0700
-Subject: [PATCH] OvmfPkg: Enable BGRT in OVMF
-
-By default, firmware (OVMF - Open source Virtual Machine Firmware)
-never publishes BGRT (Boot Graphics Resource Table) and in the boot
-process Linux kernel checks for this table and if it fails to find BGRT
-table then corresponding code in Linux kernel is not executed. EDK II
-(EFI Development Kit, thus OVMF) already has BGRT source code packaged
-into it but it is excluded from the build process of OVMF. These changes
-to build system of OVMF enables BGRT in 32-bit and 64-bit OVMF.
-
-There are only two files that need to be modified in order to do this.
-The first one being OvmfPkg*.dsc (this file describes the platform) and
-the second one being OvmfPkg*.fdf (this file describes firmware descriptor
-volume). A *.inf file (here "BootGraphicsResourceTableDxe.inf")
-describes a module (here BGRT). So, include
-"BootGraphicsResourceTableDxe.inf" file in "OvmfPkg*.dsc" so that BGRT
-source code will be compiled and "BootGraphicsResourceTableDxe.efi" file
-is generated and we should also include
-"BootGraphicsResourceTableDxe.inf" file in "OvmfPkg*.fdf" file so that
-"BootGraphicsResourceTableDxe.efi" will be placed in a firmware volume
-and thus gets published.
-
-Signed-off-by: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
----
- OvmfPkg/OvmfPkgIa32.dsc    | 1 +
- OvmfPkg/OvmfPkgIa32.fdf    | 1 +
- OvmfPkg/OvmfPkgIa32X64.dsc | 1 +
- OvmfPkg/OvmfPkgIa32X64.fdf | 1 +
- OvmfPkg/OvmfPkgX64.dsc     | 1 +
- OvmfPkg/OvmfPkgX64.fdf     | 1 +
- 6 files changed, 6 insertions(+)
-
-diff --git a/OvmfPkg/OvmfPkgIa32.dsc b/OvmfPkg/OvmfPkgIa32.dsc
-index 9e5b477..0582219 100644
---- a/OvmfPkg/OvmfPkgIa32.dsc
-+++ b/OvmfPkg/OvmfPkgIa32.dsc
-@@ -647,6 +647,7 @@
-   OvmfPkg/AcpiS3SaveDxe/AcpiS3SaveDxe.inf
-   MdeModulePkg/Universal/Acpi/S3SaveStateDxe/S3SaveStateDxe.inf
-   MdeModulePkg/Universal/Acpi/BootScriptExecutorDxe/BootScriptExecutorDxe.inf
-+  MdeModulePkg/Universal/Acpi/BootGraphicsResourceTableDxe/BootGraphicsResourceTableDxe.inf
- 
-   #
-   # Network Support
-diff --git a/OvmfPkg/OvmfPkgIa32.fdf b/OvmfPkg/OvmfPkgIa32.fdf
-index fc203f2..f968cb7 100644
---- a/OvmfPkg/OvmfPkgIa32.fdf
-+++ b/OvmfPkg/OvmfPkgIa32.fdf
-@@ -274,6 +274,7 @@ INF  RuleOverride=ACPITABLE OvmfPkg/AcpiTables/AcpiTables.inf
- INF  OvmfPkg/AcpiS3SaveDxe/AcpiS3SaveDxe.inf
- INF  MdeModulePkg/Universal/Acpi/S3SaveStateDxe/S3SaveStateDxe.inf
- INF  MdeModulePkg/Universal/Acpi/BootScriptExecutorDxe/BootScriptExecutorDxe.inf
-+INF  MdeModulePkg/Universal/Acpi/BootGraphicsResourceTableDxe/BootGraphicsResourceTableDxe.inf
- 
- INF  RuleOverride = BINARY FatBinPkg/EnhancedFatDxe/Fat.inf
- 
-diff --git a/OvmfPkg/OvmfPkgIa32X64.dsc b/OvmfPkg/OvmfPkgIa32X64.dsc
-index 6e4da4f..8289385 100644
---- a/OvmfPkg/OvmfPkgIa32X64.dsc
-+++ b/OvmfPkg/OvmfPkgIa32X64.dsc
-@@ -656,6 +656,7 @@
-   OvmfPkg/AcpiS3SaveDxe/AcpiS3SaveDxe.inf
-   MdeModulePkg/Universal/Acpi/S3SaveStateDxe/S3SaveStateDxe.inf
-   MdeModulePkg/Universal/Acpi/BootScriptExecutorDxe/BootScriptExecutorDxe.inf
-+  MdeModulePkg/Universal/Acpi/BootGraphicsResourceTableDxe/BootGraphicsResourceTableDxe.inf
- 
-   #
-   # Network Support
-diff --git a/OvmfPkg/OvmfPkgIa32X64.fdf b/OvmfPkg/OvmfPkgIa32X64.fdf
-index d3f46f3..282d40b 100644
---- a/OvmfPkg/OvmfPkgIa32X64.fdf
-+++ b/OvmfPkg/OvmfPkgIa32X64.fdf
-@@ -274,6 +274,7 @@ INF  RuleOverride=ACPITABLE OvmfPkg/AcpiTables/AcpiTables.inf
- INF  OvmfPkg/AcpiS3SaveDxe/AcpiS3SaveDxe.inf
- INF  MdeModulePkg/Universal/Acpi/S3SaveStateDxe/S3SaveStateDxe.inf
- INF  MdeModulePkg/Universal/Acpi/BootScriptExecutorDxe/BootScriptExecutorDxe.inf
-+INF  MdeModulePkg/Universal/Acpi/BootGraphicsResourceTableDxe/BootGraphicsResourceTableDxe.inf
- 
- INF  RuleOverride = BINARY USE = X64 FatBinPkg/EnhancedFatDxe/Fat.inf
- 
-diff --git a/OvmfPkg/OvmfPkgX64.dsc b/OvmfPkg/OvmfPkgX64.dsc
-index 3d6d43e..0f956a7 100644
---- a/OvmfPkg/OvmfPkgX64.dsc
-+++ b/OvmfPkg/OvmfPkgX64.dsc
-@@ -654,6 +654,7 @@
-   OvmfPkg/AcpiS3SaveDxe/AcpiS3SaveDxe.inf
-   MdeModulePkg/Universal/Acpi/S3SaveStateDxe/S3SaveStateDxe.inf
-   MdeModulePkg/Universal/Acpi/BootScriptExecutorDxe/BootScriptExecutorDxe.inf
-+  MdeModulePkg/Universal/Acpi/BootGraphicsResourceTableDxe/BootGraphicsResourceTableDxe.inf
- 
-   #
-   # Network Support
-diff --git a/OvmfPkg/OvmfPkgX64.fdf b/OvmfPkg/OvmfPkgX64.fdf
-index 15ef13a..9708fd5 100644
---- a/OvmfPkg/OvmfPkgX64.fdf
-+++ b/OvmfPkg/OvmfPkgX64.fdf
-@@ -274,6 +274,7 @@ INF  RuleOverride=ACPITABLE OvmfPkg/AcpiTables/AcpiTables.inf
- INF  OvmfPkg/AcpiS3SaveDxe/AcpiS3SaveDxe.inf
- INF  MdeModulePkg/Universal/Acpi/S3SaveStateDxe/S3SaveStateDxe.inf
- INF  MdeModulePkg/Universal/Acpi/BootScriptExecutorDxe/BootScriptExecutorDxe.inf
-+INF  MdeModulePkg/Universal/Acpi/BootGraphicsResourceTableDxe/BootGraphicsResourceTableDxe.inf
- 
- INF  RuleOverride = BINARY FatBinPkg/EnhancedFatDxe/Fat.inf
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 436b2f0..6b3a597 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -12,7 +12,6 @@ PACKAGECONFIG[secureboot] = ",,,"
 
 SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
 	file://0001-BaseTools-Force-tools-variables-to-host-toolchain.patch \
-	file://0001-OvmfPkg-Enable-BGRT-in-OVMF.patch \
 	file://0002-ovmf-update-path-to-native-BaseTools.patch \
 	file://0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch \
         "
-- 
git-series 0.9.1

