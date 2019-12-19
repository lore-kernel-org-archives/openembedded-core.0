Return-Path: <prvs=2494fb295=alistair.francis@wdc.com>
X-Greylist: delayed 428 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 19 Dec 2019 21:37:08 UTC
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id CF95B7C124
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 21:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1576791431; x=1608327431;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=N9WVYKXntFLNhCHhgC9tgVfOEN/qOUP0cru6R6yb82E=;
	b=lxci/1Bu4Fb1p+U/jkyMoi//nmx3LBR3BNosAJojGqTBXDc7ttTLEBCd
	15DEtuRs7kEntGVNWfYL1ZK1N6f36SF8FVSz11DieWkOnxHcjMj0sdHA9
	UWilv62Cg3BpenYzkWPfi169sQv5DaJ/aJTBnX96gefc6e1AY4dLcJusL
	HUhdoisijMHLvjjlSqqExeARbpUknybnLb5ZhG7d8hs1CQgBDdm67SBkc
	5QVNyZZ+NJITpAi2+WxYUsh6zVMIUEEd2n96MhxSih+NSRhS+yd3b935t
	915Tr8RVfdmmDqOSttTEdCnbj51gi5dL4STyP+WS6Uc0EALjLnSaTtnpZ g==;
IronPort-SDR: CNPJ/+MfSVI8qVcFZpZrCctCwTINfSiP1grCio/gSQAJATd8H/dBYBnEKZphdDMf672YInEZTZ
	VSVoKSVFUhPr0853cqSYCanBwmd9yBEhm04CAlVxyBAyTzFlmEg9YkMumvX+Z45Mh/ckrPw8tw
	3XEGAwDKlK9eYSpG2V2xwdR4gemAlIxKuESo7/IOZw6RNHnxLARABVviwDPbpJEw6LKiUtgtRD
	PxuOa5TkuBqruWq5jl1rYNRgtwf7ssq/FxLjovPw60VSXzTZWlBXn/mk/fM73Zsg2TvabAWOfR
	cVE=
X-IronPort-AV: E=Sophos;i="5.69,333,1571673600"; d="scan'208";a="126528441"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2019 05:30:02 +0800
IronPort-SDR: 6wNeP/GPrTq8mBIuE6lcOFldAUod4NNyBBqWPbj5Vz6oJ1uUyniPpdxBwFU8clsXap/diUXrje
	SMaN8ww/r7GJFWQJWnHMB5JWSd6ecB7SS6+DXJ5D32Oqn2HNd8Zi6YUXELRTz7IpH8m+EZuOhJ
	jccJc+/qWwRbD+DzMRKO3r6QTvN19/52mIkEV9y4EEiS2IuQVW1/1ljybu+40atrUCKAaQS7p5
	YhNedftqAni+KCERiDMP/DMse2fctmnEKvVm6KbXcaWa88CzV3ZbNgV6MxNuhaSDQ1ToK5BnTn
	yRtxjibNWVWTMOPAlyLhMEzc
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	19 Dec 2019 13:24:01 -0800
IronPort-SDR: OQBCsZUOtBd+KiUbBBIT+hST84/GUWZ9fyiF4wfw412HEthcyISnTlj5M+NlRLdQTdT5+WDxwk
	DdreQJXjh8ZRSFgmgCZvshoDE6qNsoPgok9VmZjysX1dbAgmCdE8glZdCawhzejHPrQfJ8R9WM
	EAUJpikAMLTmwSzqI76YuWW3pFsd8AiPQGDh87hB7F3Ps8EZgqCqtVScZVaJ2k95dTqww5tMpc
	U4UFtXKbmdvaw87JkpsR+S4wz+ec1i5QFSQTDIEFTmhQFwmdVnr/Xi0ATTKKdmgPjCq0uTTJ55
	Rd0=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.158.235])
	by uls-op-cesaip02.wdc.com with ESMTP; 19 Dec 2019 13:30:02 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 13:24:10 -0800
Message-Id: <20191219212410.2965-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH v3] tune-riscv: Add support for no float
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
X-List-Received-Date: Thu, 19 Dec 2019 21:37:09 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v3:
 - Don't use overrides
 - Improve the PACKAGE_EXTRA_ARCHS's setting

 meta/conf/machine/include/riscv/arch-riscv.inc |  3 ++-
 meta/conf/machine/include/riscv/tune-riscv.inc | 16 +++++++++++++++-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index 8ed9874389..e3dbef7fe3 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -4,7 +4,8 @@ DEFAULTTUNE ?= "riscv64"
 
 TUNE_ARCH = "${TUNE_ARCH_tune-${DEFAULTTUNE}}"
 TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
-TUNE_CCARGS .= ""
+TUNE_CCARGS_append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv64nf', ' -mabi=lp64', ' ', d)}"
+TUNE_CCARGS_append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv32nf', ' -mabi=ilp32', ' ', d)}"
 
 # QEMU usermode fails with invalid instruction error (For riscv32)
 MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv32', ' qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index 25d0463492..741eeb34db 100644
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
+PACKAGE_EXTRA_ARCHS_tune-riscv64nf = "riscv64nf"
+
+TUNE_FEATURES_tune-riscv32nf = "${TUNE_FEATURES_tune-riscv32} riscv32nf"
+TUNE_ARCH_tune-riscv32nf = "riscv32"
+TUNE_PKGARCH_tune-riscv32nf = "riscv32"
+PACKAGE_EXTRA_ARCHS_tune-riscv32nf = "riscv32nf"
-- 
2.24.0


