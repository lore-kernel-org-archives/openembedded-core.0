Return-Path: <prvs=177211c83=alistair.francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id 55DD36BDE3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 21:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1570571425; x=1602107425;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=t7KkLFRPuxGXH4T76xiiZuOkIAzJ6CYbmgbE6HnXD0w=;
	b=oJUjJo0SUlrGaietr4zayU4oTEtVZWrnlOtrhH4POw+HxPPpGUOdr9+Q
	KxBtLwt62dTDz6HSbl/iZvPGQYdjsEuIGRY0LB7Z0JEwKZLhuM9ZPoXQc
	d3axQ1l1t0TFWmf5Sw/TEJQcKnvsKQ5zBMM/4+6MJMOjLe1zHTyVtkJgt
	WB1ferkwYq928x99de7oh/uczSfqZ3uOSDvW1/WIP2trx/edmxHoXxcma
	eoQMzVsn/MK4aFrfx0yEERXWSmbaD6slZU0PljjxSN5yAOI0sLLPReF84
	rbCOVjJS+rVuZ0RL9HVe3GKSPKLEDdu0LTKu7mdW2yX16EMUv1pQ19hWS Q==;
IronPort-SDR: E/KITm3WASgTgP/l7ScLiY7JWJEVmJT55biwHk8PPUL3O1nFG6TqbqeoJQCRclplWGJ4llYebC
	wPWve6m5m+YoS1kMaY/M+wRo/hBb4sHv1xMmdCj9NvXfs6wDaASPalTgKSf3nGh+2Dodq4MOfo
	SZFZC8ehsMjy7HPy0JzNp2+j3Opqtj2uklc4sPQAZ4tlnsY1QyPbAVQ6nQ6Fnk1TMULng9IRcL
	/o1pvmclNmRy7/T37PLyNpf/4AxgoW8IYfPNjxWrYhsAuGNEid2sdv31oxnLxv1jLYIU/AbBB2
	Dlw=
X-IronPort-AV: E=Sophos;i="5.67,272,1566835200"; d="scan'208";a="120863547"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 09 Oct 2019 05:50:24 +0800
IronPort-SDR: cHF+k9IHGSy9OQmREBybx9tOOTkQQjlNYwFSqwOHxHMHZa7XJ8dSwrf7f9kjvzvZDxhfvLEEtQ
	qhdX4Y2hLHejUF4l6z2F2wHpPdP32llMPJ0q4yXlj2UxIdCDElFNifEbKxb3wpZe3R+ueXrHsW
	4/rhp1m4ng4+Ag7tp/XNeBNBOgpkPqy7k2MnEMtayZnUx/TrXeBPHTaxkB8SmGOGbgVwwf6e02
	EmwrUw0OFUny46PC1ctGvfvulhpM8981bDjPuitFdZoQM8GEMcx/+by/jBKTKn7LlJ8EZ4is9R
	7eJv3e84CrA1wD2vyO+Z2+D4
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	08 Oct 2019 14:46:24 -0700
IronPort-SDR: 93EevlRdI/NP/IV7ESInGRjHXZobhPNmGzKFclOQG4wv+84wk43ynbqlliVL7pS/bRbXfVzRq4
	4kyuNo5tuSJlLtrqfdtSEPfaq2aY8L6PZw7J0BvShEZ5pn9ENY/WaN4n5hpS3GiEaSCw19VUzP
	ikKs2ooveeZyW3SklrQP0tdY1/aotLQ7C/p27NgSKMZlxzWt0wioRTUx7TKK+EzirMQ7FYyFaJ
	jk1o5pdxl2crrqWAsGccDg1DRkXb7jV4CaABOWcTZh22VsJDuQDbMulwsTBEmnXHhn2xRhgk3a
	668=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 08 Oct 2019 14:50:25 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 14:45:51 -0700
Message-Id: <20191008214551.32751-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191008214551.32751-1-alistair.francis@wdc.com>
References: <20191008214551.32751-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] qemuriscv64: Build smode U-Boot
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
X-List-Received-Date: Tue, 08 Oct 2019 21:50:23 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/conf/machine/qemuriscv64.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuriscv64.conf b/meta/conf/machine/qemuriscv64.conf
index 99b48b309b..b45fdd556d 100644
--- a/meta/conf/machine/qemuriscv64.conf
+++ b/meta/conf/machine/qemuriscv64.conf
@@ -5,5 +5,5 @@
 require conf/machine/include/riscv/qemuriscv.inc
 
 EXTRA_IMAGEDEPENDS += "u-boot"
-UBOOT_MACHINE = "qemu-riscv64_defconfig"
+UBOOT_MACHINE = "qemu-riscv64_smode_defconfig"
 UBOOT_ELF = "u-boot"
-- 
2.23.0


