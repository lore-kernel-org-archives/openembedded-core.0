Return-Path: <prvs=2065966fb=alistair.francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id BFBF471B1D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 18:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1573064628; x=1604600628;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=L93dwyXKYJMt4laOvVEA/f/OIytaDiNczayfA2T1pis=;
	b=adn07r1wlfgam2MWwdMI8/JsEdOQ5hXnGZa5y2V+XxBW4Lqpioqby+mA
	gF2V0bTUKscRX4oA7Ra+FQBeu7AiVkIdC9I85SGYZrLgFOrzelfrwGEKw
	YLr3fFTkc1GS4AuP1D0CSnWQGrkwQc63zcq40WbL6hHzf/K2FdghNOq5F
	D5JfYThhEJrAchB26IBBRPZwGOxNVEn/oylsk63y7wTTTxlCRRy9Jdvj4
	9aUfZ+DGcl1ykYPvXpwD5AjnUslz1rtnmuihzBgGPMlvuWP2opaYusepn
	HQG8+xrMR2jDxb1sS4lDcHgWONLAuUVSAAAQRD2z4ijqxwcGEjbJnLANQ Q==;
IronPort-SDR: Prap2sn2YRMAH4k3AD34NX/ENssxePF80HVvYCgqtdNe/W49Pbclj7GLdiwbHEJRTN3V/HACUi
	atiNVwSjuD+Nfm1A/ilBFXveyxmbYCAjL4tgwGaDBS1L440mu/LfLCvtgMF+xqLOe7wxw3ElaW
	RRk8CYVExZ6p2To87WS20mST/ynoN6wIiDJ/tptmJyyFOXxM3QKzMbLU9k3utNyRG3YFQy+jW9
	HT8UgLCdT7WAI4irf0aWZl9cWfpbQwBGwwzXyXK2DMsI2uwaTFVSSbRgoncMGLLyFyVCv2BT6R
	Dmc=
X-IronPort-AV: E=Sophos;i="5.68,275,1569254400"; d="scan'208";a="123048685"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2019 02:23:34 +0800
IronPort-SDR: SDjRNPODoxivU1zD7gpDtRRJz2fSTTzBCD9sPmXKM/z/lauKOdkY7tha/aKdNIeAc41lmR5oBJ
	Kh7rbGO4eO63tzGVEM4OwFAwPrNCakAPgCwzrcLSClEaQydkHmovaXP/xZjEoZMQ4duep1ngIi
	GqBnbMXY9UkNWIWx+2RtZdvG52k+qMmNT1wO6LOQSN/Z2+AtdgAOX1pTrUbptJrVK6l+kDbLZG
	0nPTujvUQrD2AtkVRwHSD6tr+Dfer11jlmqV88jrQO/7GvMTx5k90KXqLl+TuasFxqBitTf+WL
	r7uC4qlupbjUktK8ouuU+qvg
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	06 Nov 2019 10:18:46 -0800
IronPort-SDR: Gi2eL+jNN+iCe/EEAa1vK96tfZNq6L9m710/SE5+Cj5qTDTh9Rz6Zbs6ftIYuKTkr/aHf/p9rX
	dUBR9Ioe42c4/ogokHuVpZoqalgC8WEIyP+PDThz7CMBzuBipIv1iTs3VQuuMPjyLdTG546QSb
	qgc5UF4gORhFBbOCxoGtKHgOfMcza9mg3NYzqwdyzvg3P1AOVzydSS7TQoeBbOWZS5gJsDfAbh
	whFrlNOB2d2vSs0YeBMT1zi5U2FNLCR52dV0WBTK86zKbkpML+K41aLg/51lVTzTAcOyYd0EP0
	r3c=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 06 Nov 2019 10:23:35 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 10:18:18 -0800
Message-Id: <20191106181819.12517-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 1/2] tune-riscv: Add support for hard and soft float
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
X-List-Received-Date: Wed, 06 Nov 2019 18:23:45 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/conf/machine/include/riscv/arch-riscv.inc |  3 ++-
 meta/conf/machine/include/riscv/tune-riscv.inc | 17 +++++++++++++++--
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index f3edcc39f7..6737545e00 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -4,7 +4,8 @@ DEFAULTTUNE ?= "riscv64"
 
 TUNE_ARCH = "${TUNE_ARCH_tune-${DEFAULTTUNE}}"
 TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
-TUNE_CCARGS .= ""
+TUNE_CCARGS_riscv64 .= "${@bb.utils.contains('TUNE_FEATURES', 'riscv64-f', ' -mabi=lp64d', ' -mabi=lp64', d)}"
+TUNE_CCARGS_riscv32 .= "${@bb.utils.contains('TUNE_FEATURES', 'riscv32-f', ' -mabi=ilp32f', ' -mabi=ilp32', d)}"
 
 # QEMU usermode fails with invalid instruction error (For riscv32)
 MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv32', ' qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index 25d0463492..631653f2a2 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -1,12 +1,26 @@
 require conf/machine/include/riscv/arch-riscv.inc
 
 TUNEVALID[riscv64] = "Enable 64-bit RISC-V optimizations"
+TUNEVALID[riscv64-f] = "Enable 64-bit RISC-V optimizations with hard float"
 TUNEVALID[riscv32] = "Enable 32-bit RISC-V optimizations"
+TUNEVALID[riscv32-f] = "Enable 32-bit RISC-V optimizations with hard float"
 
 TUNEVALID[bigendian] = "Big endian mode"
 
-AVAILTUNES += "riscv64 riscv32"
+AVAILTUNES += "riscv64 riscv64-f riscv32 riscv32-f"
 
+# Hard float
+TUNE_FEATURES_tune-riscv64-f = "${TUNE_FEATURES_tune-riscv64} riscv64-f"
+TUNE_ARCH_tune-riscv64-f = "riscv64"
+TUNE_PKGARCH_tune-riscv64-f = "riscv64"
+PACKAGE_EXTRA_ARCHS_tune-riscv64-f = "riscv64"
+
+TUNE_FEATURES_tune-riscv32-f = "${TUNE_FEATURES_tune-riscv32} riscv32-f"
+TUNE_ARCH_tune-riscv32-f = "riscv32"
+TUNE_PKGARCH_tune-riscv32-f = "riscv32"
+PACKAGE_EXTRA_ARCHS_tune-riscv32-f = "riscv32"
+
+# Soft float
 TUNE_FEATURES_tune-riscv64 = "riscv64"
 TUNE_ARCH_tune-riscv64 = "riscv64"
 TUNE_PKGARCH_tune-riscv64 = "riscv64"
@@ -16,4 +30,3 @@ TUNE_FEATURES_tune-riscv32 = "riscv32"
 TUNE_ARCH_tune-riscv32 = "riscv32"
 TUNE_PKGARCH_tune-riscv32 = "riscv32"
 PACKAGE_EXTRA_ARCHS_tune-riscv32 = "riscv32"
-
-- 
2.23.0


