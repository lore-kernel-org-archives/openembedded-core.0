Return-Path: <prvs=1236ab962=alistair.francis@wdc.com>
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id CE8717F2DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 21:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1565905518; x=1597441518;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=P4qRZ2efTMJMW+3L2p3FvEqcZBCmKJhImk0hqiOKnWU=;
	b=ZMeiNZQU3ohz09jpCwFJH7vwhvCTWhfuQZKGyfFEnaZU/YghmEasi43s
	pDZ+8zNGPkfQn4pxj3n3RSFMS6xhINpOW4k4tzm0LKesGPIvXlG7l+y47
	ozG8ph03nuMxSdkW9v+x9aUmFQeZQ4AnGXvxrIPOU/GSyUW3JV8PZhFye
	erLDO4cCcuAAgvQDvh5X+B2oeOyuCdAVVONlW52GxtyZHPMvzKdBjhMEp
	UuxeycZyw5IJ2RnJ6t9s2PQcdc4j+RezbAGk4tMrR7M3FYwxinP7UemVw
	umI9XiKH6+PfKxIigOPPXopRSMRuHd76eTvyftEhdnr66H3kStXP+1Unr g==;
IronPort-SDR: tta1vbHILtlzVDZPY8wYWuG5byB5B5R1xQglqvwbQa/Z5jSlXJSjB1mas+UhfM47JOFDNp1ipL
	u0OCOqK3gpTtCD6r64KdQNQ8jgAGTPBqaCtscEHJaDBwl7Yr2WBRY+3Pd+TJI4wXRqmkPIq7DU
	cryEf5+VeVv4PejlagiWVSIFMi+kRAvNL9KsBJ4a8MRrNYlpRf9txr2ZEiQNiltb2imJU/JgaN
	7kB3k1ZkTbcqHRNaSXG6yl1HXptkP2GIkqURaiKQcFJhD6wLwjc2y9ew4KEVnOFH0s/xWckpvk
	+wU=
X-IronPort-AV: E=Sophos;i="5.64,389,1559491200"; d="scan'208";a="216305646"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 16 Aug 2019 05:35:51 +0800
IronPort-SDR: bp+DPQGJix9xcTRMsgEM0vtcDtff/xRxN0TWu0JCtSu1f5LU9VkKmdAmr4FIlZn63AL4SR+AUp
	iW4blFREbl9CLMGYqPbsvWFGBjunOvfXbBySTW0+KnCRiE/ld2Ve+jJV4vtahAHjEj1BtTmDbj
	1NnpbN5FJsxGUPwAsnI1UumzAFw/ZQRJE1MdOhXleVegFKWB+ID70akp2SYo+2vxtsaEZtd0mJ
	H8eYVXyJy9Evo+xb4TQPMSwVBIiX2y+gaSC+7+XdfTBVn7dxPsfV/t9ybzDzMBBjpfIccXMUFk
	qz4fndiQkm+Lkn1fLJXqRhYT
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Aug 2019 14:32:47 -0700
IronPort-SDR: tDX5/eN4a25OFOfQxnlF58MVbbP1eqHB2P2XVyEE2ea/9zDOs3AN2ikfU5JnarWzmohkg0ujk6
	L1dlq77zU9VzdU1DGA8Z2aJiqOfOiz3TJp+b+2cNyxIazDq7Yq/VPoOQQTprTAK3pvgldZaxXf
	jICwgsWCIwEIaR+LNUf6UXN/geJMMzrgFA+VJT2CTvDN6PNczYaUfOSlQP2AwWEUKgUPLpU8UZ
	NJCiz13l3l7U8QO8tOurw/IzlFWC7Mn82NPVmhckPCnxhjUtklFEMyjDy3Nbzf709fEogiwtt3
	eJk=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip02.wdc.com with ESMTP; 15 Aug 2019 14:35:16 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2019 14:31:45 -0700
Message-Id: <20190815213145.8986-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190815213145.8986-1-alistair.francis@wdc.com>
References: <20190815213145.8986-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] qemuriscv64: Specify the firmware as a bios instead of kernel
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
X-List-Received-Date: Thu, 15 Aug 2019 21:45:15 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 2 +-
 meta/conf/machine/qemuriscv64.conf            | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index 797a27660d..2ebd0a01f2 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -28,7 +28,7 @@ UBOOT_ENTRYPOINT_riscv64 = "0x80200000"
 QB_KERNEL_CMDLINE_APPEND = "earlycon=sbi"
 QB_MEM = "-m 512"
 QB_MACHINE = "-machine virt"
-QB_DEFAULT_KERNEL = "fw_jump.elf"
+QB_DEFAULT_BIOS = "fw_jump.elf"
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
 QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
diff --git a/meta/conf/machine/qemuriscv64.conf b/meta/conf/machine/qemuriscv64.conf
index dba8f09e93..99b48b309b 100644
--- a/meta/conf/machine/qemuriscv64.conf
+++ b/meta/conf/machine/qemuriscv64.conf
@@ -4,8 +4,6 @@
 
 require conf/machine/include/riscv/qemuriscv.inc
 
-QB_OPT_APPEND += "-show-cursor -monitor null -device loader,file=${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE},addr=0x80200000"
-
 EXTRA_IMAGEDEPENDS += "u-boot"
 UBOOT_MACHINE = "qemu-riscv64_defconfig"
 UBOOT_ELF = "u-boot"
-- 
2.22.0


