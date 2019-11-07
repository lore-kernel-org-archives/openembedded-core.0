Return-Path: <prvs=207c28696=alistair.francis@wdc.com>
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id 4F7837F36B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 00:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1573088066; x=1604624066;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=3Ax2+KZ87qcz5kN/5rAB2AAEuprEhcf19o01joJldNo=;
	b=nKWGZABQ1BisSWy2kbpl/a+DWbLEdeTjxzSBRxiTK1ikUYWlEVJUxBR2
	TpRaNoTufuKTBjB9gc5fz3rDh9WJnlk7rY2nQVzZtAH5O2jMJW8fpsoQS
	e2uVctbr1ZGcF0YmvoyDiMET02fYo9MLNBWKAgRaqrvWMeV6xRYMfBav/
	VsmtGF+YcKdyQk7Vx9G7uRNHEPxsABk7LMSLlgeUTtTWxYETzGHhg1Gbb
	bJzTNaiielCAUrswLXyfC5UIkpdSgcUdJrQWKq8RuMOTyjfSOrmPI2VhG
	0EqHBkWfXS5964pvrYGjo6spkegsMaG3OFfa3MADetk0BiCBGhelgrLdb g==;
IronPort-SDR: 7lTUcoifd408LkelwjatUIHi41vH0xclqacsw2enuSewoQo4KD8cZu5RHNOQkPCtgb1tIpTrBT
	2luHtivXEYjKh0E4RcAuql9dZDjVCmMnNeohbI4wJAFHZ3YGh/I8ORy1VDnYUMPdHsamorbhlV
	yV0ALnpw2FwaAEKkbWRm+3Cp4QuxA+foHj+ka2+qjtdiLDKyuoUgdvhIEyLHdRTKNTuTUw6K/G
	WX2vLCvPEl83mpSNQ6DuYxVIiwOzCLVv87bVSomgvuc/FrIBzIpGLjhV/J4kGoqi4N5Xxj56ea
	Y+c=
X-IronPort-AV: E=Sophos;i="5.68,276,1569254400"; d="scan'208";a="223524309"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2019 08:54:25 +0800
IronPort-SDR: v1uSbg/yuyuvGVW81FmBMf4snPKY2yEzCeNuRimxEwkVKwCo8Ew9AdX2I7ld6vMrk0ysWg6NAY
	GMl/XHUuqfNM+j2B5TuxewvKwWTYLK0QLZo+6+p4I+QKx5+Q/FDOKXQ9nMlISSVwX9FjmPesk/
	SyddrqEhNmnZDWkb2HMMD6FoED/Y9QQz5ij2sIGfkrljV3YZKFoh8ZE9rVzhHuNvpmSqbEDjGZ
	9ahHeAIsFBf6SWLo1t331gFpwxeI4pGHV6/cL3Yx4MabC4NrVV1WtoPYdrYBpp4gGK8LsoqUFV
	HbUUR2ZRznOwjuqAluFyNQty
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	06 Nov 2019 16:48:33 -0800
IronPort-SDR: IV6w4lUZOOX2uf0q/iFT8xfWlLg2Bf9Dms8qTz5DOl7dzBt57X4C221vJdbDA2AFahkv0tOZPz
	Ts3jJSVBZw8+NC7GKhUct8j+/7ym/ZkB0QbXB/t4Mha/XueFSMp9CkEKz1cHqNxA3sVerug817
	AN372Rcxm7JZqwD/dWrcKCOACzQXH3xC32oRTtP5s/5LkISPMe178VJ8eU6VVoSxIgevqRKd2I
	xW9AW1bKk7E4H27vn6X73U8jGnsX8Qrpp6VwVdHCf8rMECocF7p1mDRAR4VcirBaOdjf+jwOJ+
	PFY=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 06 Nov 2019 16:53:22 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 16:48:04 -0800
Message-Id: <20191107004804.14368-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
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
X-List-Received-Date: Thu, 07 Nov 2019 00:53:21 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/conf/machine/include/riscv/arch-riscv.inc |  3 ++-
 meta/conf/machine/include/riscv/tune-riscv.inc | 16 +++++++++++++++-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index f3edcc39f7..7ee497fe20 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -4,7 +4,8 @@ DEFAULTTUNE ?= "riscv64"
 
 TUNE_ARCH = "${TUNE_ARCH_tune-${DEFAULTTUNE}}"
 TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
-TUNE_CCARGS .= ""
+TUNE_CCARGS_riscv64 .= "${@bb.utils.contains('TUNE_FEATURES', 'riscv64nf', ' -mabi=lp64', ' ', d)}"
+TUNE_CCARGS_riscv32 .= "${@bb.utils.contains('TUNE_FEATURES', 'riscv32nf', ' -mabi=ilp32', ' ', d)}"
 
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
2.23.0


