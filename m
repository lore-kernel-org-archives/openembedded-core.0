Return-Path: <prvs=066539cd8=alistair.francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id 238F77E553
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 00:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1560905894; x=1592441894;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=yqHDRNGV/UKUxYMT0IyTu5LXcEX1WrgLwHGSJFMwL9c=;
	b=lPDbHlup3nurCh1MoKtQnB0aChyfCyDSY4/FDM6yn1dDvDYYq5hrCuJC
	uemEeT/2oEfbmLVyanJ/+TOtv/msNOS0qh4W38/K+86S9SSePnoPZ43h7
	0nJiCUPYpdhYyGebeaajofwHpfGqTakbljgyNeqyRCUf7p7wsRW/mCfLm
	dOwxkXY/7ngICH6tKAyT2wgrhVYm7PkzOqGc8m7w/JP0K7bdkciYebOcU
	V0ev3aCaFzHqzP9ylWt+w/eOgjF8CarAtYMRhJ/IaANBe+SLnLq2GD/Vs
	bbFSvxGsThp3h3QBl+lOEAC4S3U/oOrg2S2kiiWT1jcCxjiBBMnfY++d6 g==;
X-IronPort-AV: E=Sophos;i="5.63,390,1557158400"; d="scan'208";a="112154347"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jun 2019 08:58:14 +0800
IronPort-SDR: imGeeVcBb5FrzV8eG+FBZpidZGDPXmk8bzrDo++iQ5Yq5Wc/8h9nK4IPqQQRi8xOk6u6Ap4mPd
	5OGivuCCbpB9H4iE3APjMxW1NyWgg5zAi/8l1qNE5p0d95sqQ+7kl+2xKp0F6txj2aTI2v+rSw
	2NpThGc96TTsEQm/OsF8RQWNdqgN8EKl1r5mhQdjqqRQFXDJsAyUtrHwE6lwl1YG76IBj4veg1
	edXfUkXV601ss4Xm/TGr/DG79ZXiF55bhy2X/Z+WSIC/kA5Xm8ptEM2dkwv/H5EypkhBvGw4/3
	FnS1tJcr9kKR7L4tZACruoT+
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP; 18 Jun 2019 17:57:42 -0700
IronPort-SDR: 3MI9qUMp8eoOsBq5+xmKu2RORaNJfc18A4Rc9+9oxDgH98xNltrre2TEzgpfNiXOjSxuOVF9f4
	sBi2K9/TFUSywIr9qgE6Bvaz6eMYrxHxVprv9eXWgvdeLcSWI72sTdNkiRSVzoCrTzpuPuJgdc
	X+0fzvTjJJnciG82Z5G3c3aMxx5ZFxZFZc2DMyKvNPhbcKBkmnbtAP6eKWrG5Mjk5Gg8Qxf7NA
	ZB9uWiTDPYKDvTufyWAUtGPQZLblNXKUHB2ygHlr+/RKPDkd+rXqfq6WJZ33UMLp8hH4HD8EB0
	4AU=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip01.wdc.com with ESMTP; 18 Jun 2019 17:58:13 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 17:55:40 -0700
Message-Id: <20190619005541.17834-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190619005541.17834-1-alistair.francis@wdc.com>
References: <20190619005541.17834-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [PATCH v2 3/4] linux-yocto: Mark qemuriscv64 as compatible
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
X-List-Received-Date: Wed, 19 Jun 2019 00:58:13 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-kernel/linux/linux-yocto_5.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 8aec315084..a8ced4866f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -7,6 +7,7 @@ KBRANCH_qemuarm  ?= "v5.0/standard/arm-versatile-926ejs"
 KBRANCH_qemuarm64 ?= "v5.0/standard/qemuarm64"
 KBRANCH_qemumips ?= "v5.0/standard/mti-malta32"
 KBRANCH_qemuppc  ?= "v5.0/standard/qemuppc"
+KBRANCH_qemuriscv64  ?= "v5.0/standard/base"
 KBRANCH_qemux86  ?= "v5.0/standard/base"
 KBRANCH_qemux86-64 ?= "v5.0/standard/base"
 KBRANCH_qemumips64 ?= "v5.0/standard/mti-malta64"
@@ -15,6 +16,7 @@ SRCREV_machine_qemuarm ?= "9161b2fa2f1cec0ba02976c389c788445858e0de"
 SRCREV_machine_qemuarm64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemumips ?= "7de9b8f0db98e51a666477c8e2b64f1964b45410"
 SRCREV_machine_qemuppc ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
+SRCREV_machine_qemuriscv64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemux86 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemux86-64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemumips64 ?= "5a8b27bcc0b16077ab8edfcd3fb25c80dc2c652e"
@@ -41,7 +43,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
 KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
 
-COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-- 
2.22.0


