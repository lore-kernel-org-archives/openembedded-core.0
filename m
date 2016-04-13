Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 185CD73169
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 16:12:17 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id j35so47296169qge.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 09:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=w+Lcrlo50H+IMcXftXc1Ft6I49ckHXvCX+UsKRW7vUU=;
	b=WauzPje5bgxTzWiM45s+c1xGolTmWpsIv8B/EKjS9UAKHz5RpokNXtFa8HjkGcNnY6
	RW4c1Z13zCzNZlIxw9c8Gwb1ASDn3uo3gBIyBodL06diOsUuCjCwKPPqZavp76t/m4tB
	kw3xYqZzTz5xMo2X8MEESJZUbiXP/w+wAA4wvx3TZ36cGxaBwz/hMBTso93CtO7WxG5e
	XY67Gtg9nHUKcrXj3ZG2JvObXjL1R6pxp3y0b3lshjv3SrXfF1XNrjvuw5SszH2zsKgQ
	9N3QwSyOL2nIMno8j9gDdSssLhs3MeLrELIjZgExsdQ3+8trGVRYVUL/Y/CzwK6KgvIM
	pwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=w+Lcrlo50H+IMcXftXc1Ft6I49ckHXvCX+UsKRW7vUU=;
	b=BJIz60qEJWVeQ3LAbTHhB1VhoZRdarNF11LtRkOVO4mLC2rjQHIlCnP0+HBLuPsMJ9
	j1UH5l+A9QiGsi+BbERTzvbuMaJNz9uGdP1tzIMoP4eLcnPPVXdgIebwVZVqpJX9BheM
	/YXT7/2K5hNFyYE8ssD05/9Zwgf5lPrE3T/IOWP5FTSFwaTDKL0zIKlCgP1aHwd4NUE1
	d1B/42w0aOxnfvcZYeLS3ahUdPi/5QQ9UeuFzAFIzMAJzJ8xibzuCtkj8o8kuA0N+j2r
	yMO+JSShx+NOJgtCqJZYj9cnzlIEgefp2+J0MBwiEG4tCPint7VdSDHZx1zEIbgw0YfD
	pZjQ==
X-Gm-Message-State: AOPr4FXEv22APtw7/5kCADYwq8h5c/g8dH+43coIEMABDwagA6sO3LZkkkxkFNgZPmJmMQ==
X-Received: by 10.140.94.183 with SMTP id g52mr12358266qge.35.1460563938137;
	Wed, 13 Apr 2016 09:12:18 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CMbcc810032faf.cpe.net.cable.rogers.com.
	[99.224.124.24]) by smtp.gmail.com with ESMTPSA id
	y123sm16264104qka.0.2016.04.13.09.12.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Apr 2016 09:12:17 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 13 Apr 2016 12:12:10 -0400
Message-Id: <b9315f8ff1b5ffca3f1d6e36407d3a8c5077ee87.1460563722.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1460563722.git.bruce.ashfield@windriver.com>
References: <cover.1460563722.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1460563722.git.bruce.ashfield@windriver.com>
References: <cover.1460563722.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] linux-yocto/4.1: mainline SPI backports
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
X-List-Received-Date: Wed, 13 Apr 2016 16:12:18 -0000

Backporting SPI changes for the Broxton and Apollo lake:

91f62d4a0a31 spi: pxa2xx: derive struct chip_data from struct drv_data
a9ed63a84921 spi: pxa2xx: Remove CONFIG_SPI_PXA2XX_DMA
f218d99d91ad spi: pxa2xx: Remove redundant call to lpss_ssp_setup() in probe
c02fa78f26b3 spi: pxa2xx: Rework self-initiated platform data creation for non-ACPI
7e576a63daf8 spi: pxa2xx: Add support for Intel Broxton
5afb534233ea spi: pxa2xx: Detect number of enabled Intel LPSS SPI chip select signals
9dfe49803d54 spi: pxa2xx: Add output control for multiple Intel LPSS chip selects
c3ea9f8cb427 spi: pxa2xx: Use LPSS prefix for defines that are Intel LPSS specific
769387d447c6 spi: pxa2xx: Align a few defines
c4d5f4b2c5e1 spi: pxa2xx: Save other reg_cs_ctrl bits when configuring chip select
cef6fd04c480 spi: pxa2xx: Convert unique ID string of ACPI device as unsigned integer
5cd1fcbbe756 spi: pxa2xx: move debug messages to pump_transfer()
86d77af087c1 spi: pxa2xx: choose closest lower speed
b92f9ddf2a03 spi: pxa2xx: Remove unused psp member variable from struct chip_data
eead50ab6d02 spi: pxa2xx: Remove empty function pxa2xx_spi_dma_resume()
59956c05a4c1 spi: pxa2xx: Use ACPI_COMPANION() instead of acpi_bus_get_device()
362498a7e09b spi: pxa2xx: Set the max_speed_hz of the master
34b9b6d72a6e spi: pxa2xx: Remove cr0 variable from struct chip_data
906a045e325a spi: pxa2xx: Remove if statement that is always true in pump_transfers()
9dcbad25be03 spi: pxa2xx: Remove two variables from struct chip_data
3a166657678e spi: pxa2xx: Add terminating entry for pxa2xx_spi_pci_compound_match
f8912dd06280 spi: spi-pxa2xx: Remove unused legacy PXA DMA API channel numbers
b75adec5ab03 spi: pxa2xx: Add support for Intel Sunrisepoint
54f13620b12e spi: spi-pxa2xx: Remove clk.h include
c4dcefa9a892 spi: pxa2xx: Constify ACPI device ids
e1deb5e11adc spi: spi-pxa2xx: remove legacy PXA DMA bits
1cae65e20310 spi: pxa2xx: Make LPSS SPI general register optional
dffc716a7725 spi: pxa2xx: Prepare for new Intel LPSS SPI type
9641b2e46b6a spi: pxa2xx: Differentiate Intel LPSS types

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 304b0dd2ef0e..521eff41246a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "8380fdf86b5d1ff542153e647f2ded0026a91852"
+SRCREV_machine ?= "28d8cfdbcb18a6eef202099cca66430fd3b6eae0"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 22a8dbee4b38..62cf57d49536 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f5b08e95bc03f9819fa9d7ff57c698fbe2c16cc5"
+SRCREV_machine ?= "91f62d4a0a31919d9b2ccdaf881130f99b61fc5e"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 5682b66a1240..d8e864394f57 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "75d5fa3b94efe0eb2101946d51015ce5bdc126cf"
-SRCREV_machine_qemuarm64 ?= "f5b08e95bc03f9819fa9d7ff57c698fbe2c16cc5"
-SRCREV_machine_qemumips ?= "5b7969dfff341c7d81b3726e0bb100cafa1cbfa1"
-SRCREV_machine_qemuppc ?= "f5b08e95bc03f9819fa9d7ff57c698fbe2c16cc5"
-SRCREV_machine_qemux86 ?= "f5b08e95bc03f9819fa9d7ff57c698fbe2c16cc5"
-SRCREV_machine_qemux86-64 ?= "f5b08e95bc03f9819fa9d7ff57c698fbe2c16cc5"
-SRCREV_machine_qemumips64 ?= "a3a35132a724752464ee13b10432cbdb2a110404"
-SRCREV_machine ?= "f5b08e95bc03f9819fa9d7ff57c698fbe2c16cc5"
+SRCREV_machine_qemuarm ?= "232e2d88841c7e20857350275d80f5585ed93734"
+SRCREV_machine_qemuarm64 ?= "91f62d4a0a31919d9b2ccdaf881130f99b61fc5e"
+SRCREV_machine_qemumips ?= "7d3690c0762f11e038f14310a50ca1cdc813cc22"
+SRCREV_machine_qemuppc ?= "91f62d4a0a31919d9b2ccdaf881130f99b61fc5e"
+SRCREV_machine_qemux86 ?= "91f62d4a0a31919d9b2ccdaf881130f99b61fc5e"
+SRCREV_machine_qemux86-64 ?= "91f62d4a0a31919d9b2ccdaf881130f99b61fc5e"
+SRCREV_machine_qemumips64 ?= "b71e4cd7d45f03048ad31e2a36dfe5a43f021b51"
+SRCREV_machine ?= "91f62d4a0a31919d9b2ccdaf881130f99b61fc5e"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


