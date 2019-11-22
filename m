Return-Path: <prvs=2224211a8=alistair.francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id D67677FC79
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 00:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1574381300; x=1605917300;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=8IQdTq9S+EYj99P729LlSkFQb5F+bzoHrb91L9fn+bk=;
	b=CoPxfKvYPfkIxcyARG8dKhvUm0rC7GvFH8W7hln91KlMYbA0Iwh4i2Rd
	eUxP10fnA/9UCfLLGhbsfd+dPHsgIDdXmmLJCiZdS6huNvYQSh6INLk1T
	GpLbx04WuQMW5+Tsf6hSLKj8yHr8TqzOabf9AqP+xjnZ7yrrFswG/lVgd
	CE+skdsFDDB/JK749bXg9AOvIUe8G/jPcT2XhY5TNdF/SOP6gNMfhu3cI
	6rHxOJmEpOnnsr4KuyuRiO0yweWkxEFKUoJnOyOVYnPf/Uesm3zyNDyqu
	SI06JPaxYy6DuaqAs1DmnyrwgEaUaZpNDWKFrpJGM6RYCbsfA2ls2Rs+f A==;
IronPort-SDR: 9loHq0/o7YRVC3pxxLDNs+uXLJNEEyK0zC+0KfcJCZsjfQsOKRt6BpIdfFxoMcC3Ixp+2tSKlK
	gd+XgyAMJ2lPuB7AsrKDWyjq7Pp5eCGBzKWqD5cCmcHgfsrX9gAB9B+7yD0afWhpzh50f0plAy
	oC3lthT4Ax5PmqeaxmBTTRVEaaKbzSserwVYtdtB0aG1SL/gliqPsvc5zdMiNQPA0yf3HvDB45
	c9tw+l1GsNrDUxrNBgohq0JlkM2m7pCysvOfPbE3vUsP5g/u6EvGHSc8ZVcQppjTEBAIk4S5RK
	me8=
X-IronPort-AV: E=Sophos;i="5.69,227,1571673600"; d="scan'208";a="125304011"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 22 Nov 2019 08:08:19 +0800
IronPort-SDR: vOsHo+f+u2EzYkR8bemB7CyNKKelvbtZ0vzU6WWw4h73kjtOhZklwzCgUHvVSsR5V7d1OMaB8s
	TxACcAod4FSQlKMc8zxF6AFHVmrwuJCb1t4Sf9diW61jn3w3aRBix5nfDxFRQ2Eztw1Np9R+Ux
	Jb+Lqp3ad5+83ZWky6WcsPZAqX9Iek7tMg+dNLO76VbiOWYUwvVtSsevHdKmhmS3GpVF19PlNT
	N+AbPgj/lF0rOzI5/KjlUHtn3yyq9KW8NstnMz0eJce9ZqkrWda1oUwY9W6SjoGUaxX7GlwkVQ
	RW2U1IWzo0yQ7efD1Zi2Gk1C
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	21 Nov 2019 16:03:26 -0800
IronPort-SDR: GIOGOpfS+o6nJoqYcWDIXZnHxoYQMgLFhKH59LNdYB3pltDSi7mmxC9d2dY/wX8wcgAX0C72Yy
	zmga5IYfEy9cRTewiKWaDIxDXr3yQe/9U3JglAT5wBH554NetoR8lDAmb6Rf+J126tDYyTrwgc
	BZX5wyH8WPbDxiUaBh3A0grFSxIHI4SGe2DRA6BG2SeT8Am5MumDOaKCihzBuXJo2TXn0PR4KB
	J5E2NDNEqaS3eS30120/f4vCcNPLR6GjxnVUveNffQq1pocnV7YImJnxJy8PS5SbJ/11XOR/Pr
	Q7E=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 21 Nov 2019 16:08:19 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 16:02:51 -0800
Message-Id: <20191122000251.28530-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH v2] tune-riscv: Add support for no float
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
X-List-Received-Date: Fri, 22 Nov 2019 00:08:18 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/conf/machine/include/riscv/arch-riscv.inc |  3 ++-
 meta/conf/machine/include/riscv/tune-riscv.inc | 16 +++++++++++++++-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index f3edcc39f7..33ad6a28e1 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -4,7 +4,8 @@ DEFAULTTUNE ?= "riscv64"
 
 TUNE_ARCH = "${TUNE_ARCH_tune-${DEFAULTTUNE}}"
 TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
-TUNE_CCARGS .= ""
+TUNE_CCARGS_append_riscv64 = "${@bb.utils.contains('TUNE_FEATURES', 'riscv64nf', ' -mabi=lp64', ' ', d)}"
+TUNE_CCARGS_append_riscv32 = "${@bb.utils.contains('TUNE_FEATURES', 'riscv32nf', ' -mabi=ilp32', ' ', d)}"
 
 # QEMU usermode fails with invalid instruction error (For riscv32)
 MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv32', ' qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index 25d0463492..b7dcd244d6 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -3,10 +3,14 @@ require conf/machine/include/riscv/arch-riscv.inc
 TUNEVALID[riscv64] = "Enable 64-bit RISC-V optimizations"
 TUNEVALID[riscv32] = "Enable 32-bit RISC-V optimizations"
 
+TUNEVALID[riscv64nf] = "Enable 64-bit RISC-V optimizations no floating point"
+TUNEVALID[riscv32nf] = "Enable 32-bit RISC-V optimizations no floating point"
+
 TUNEVALID[bigendian] = "Big endian mode"
 
-AVAILTUNES += "riscv64 riscv32"
+AVAILTUNES += "riscv64 riscv32 riscv64nf riscv32nf"
 
+# Default
 TUNE_FEATURES_tune-riscv64 = "riscv64"
 TUNE_ARCH_tune-riscv64 = "riscv64"
 TUNE_PKGARCH_tune-riscv64 = "riscv64"
@@ -17,3 +21,13 @@ TUNE_ARCH_tune-riscv32 = "riscv32"
 TUNE_PKGARCH_tune-riscv32 = "riscv32"
 PACKAGE_EXTRA_ARCHS_tune-riscv32 = "riscv32"
 
+# No float
+TUNE_FEATURES_tune-riscv64nf = "${TUNE_FEATURES_tune-riscv64} riscv64nf"
+TUNE_ARCH_tune-riscv64nf = "riscv64"
+TUNE_PKGARCH_tune-riscv64nf = "riscv64"
+PACKAGE_EXTRA_ARCHS_tune-riscv64nf = "riscv64"
+
+TUNE_FEATURES_tune-riscv32nf = "${TUNE_FEATURES_tune-riscv32} riscv32nf"
+TUNE_ARCH_tune-riscv32nf = "riscv32"
+TUNE_PKGARCH_tune-riscv32nf = "riscv32"
+PACKAGE_EXTRA_ARCHS_tune-riscv32nf = "riscv32"
-- 
2.24.0


