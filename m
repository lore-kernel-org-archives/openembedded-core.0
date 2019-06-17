Return-Path: <prvs=06424885f=alistair.francis@wdc.com>
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id C105B7E843
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 22:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1560809042; x=1592345042;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=GVUJhYmuWoCea0AEcvXjqKyDLwo9miwKNV4+1US+TPk=;
	b=P0HXE9srQHi5F+xq5sTSQlnW+8cCZPeq8jxBeiFAOsY3XgK+Mi6cc/8s
	x0Gfxfm43Q+Oe1rsC/UmUrjFIiiq0X4f2r+/jTi4kTE2Tg1CswHCCFpNp
	VVz172OO9U1WZ4HptIZrCZpQ1ozysN9GE3/ZPKb7xFJx9GCH2ELx79YxA
	gub0oK11qZqZYJOI60lzLtc3tIJA2TFgmAmAW4OqgCVNtrcYil3nh9OI/
	dZjJ0zzQg/WTJDrUX11uzwYTOtkhFn/VkLd4Gqz3JQL8IE8NqSVe/XuuG
	Oh3cdkvz2Zeu0qKJrssDB91cfQYG6xPm3R7JsIop6SfWhzUMjfxv5/AxS g==;
X-IronPort-AV: E=Sophos;i="5.63,386,1557158400"; d="scan'208";a="217157212"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 18 Jun 2019 06:04:02 +0800
IronPort-SDR: GnbDHOurYlvMFnOFMp4FhZQP0p1e11QYLetRoJS8RRjimySKqZMjEcdzqubSB7UZHkilC5Zisz
	5sxPLazFTQ/+bv7FHxXgmfJl0ea6XybL4zPEydMqG6HmDSbgLHXPlFgAmpopzFcGALm5qOS3is
	+k6/apE2pj3sCIKSBL04SUmuVQrTNWo3j5p2NmRAxfmiswdrB4shUAIvmldjY0+PsRvprtDVds
	29NRf05JOhCWczjagNZuki98IpKwjCBOZC+70wkPScEQYm7d+auc+WG32D84mFS+Zt4slqXAPD
	qx8zM2/raHRmn1c4cxu6mUcV
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP; 17 Jun 2019 15:03:35 -0700
IronPort-SDR: OCmpO2A433ad2QPTYaLGFNQzzLx9kjxsOH76p6nEf6yg4HuUVNiaGmODOAjBCtunBaS6qK3LPZ
	WA8AY/j56zOw9x7CAIDrU3lFhJo5pfpmQdXH5tIolBIf/nw9Bku75RmhxRpBwHpxYJd/ld7OQt
	1IPguDh0t6Dy1P/vlcErN+l/WpknT1mKC8ffhPMcsFkppoamtGt7n0bHr0F1nuCYMdHe7IfbYz
	P2NC5ic8xHFic2MsFacx78T/GXeG2jlyD17UmMn1ps2ciEzCP6nXxKbGzcnOPHuJxG8EITwd+o
	Sm0=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip01.wdc.com with ESMTP; 17 Jun 2019 15:04:02 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jun 2019 15:01:21 -0700
Message-Id: <20190617220122.13994-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190617220122.13994-1-alistair.francis@wdc.com>
References: <20190617220122.13994-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] linux-yocto: Mark qemuriscv64 as compatible
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
X-List-Received-Date: Mon, 17 Jun 2019 22:04:00 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-kernel/linux/linux-yocto_5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 8aec315084..a79d0b962d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -41,7 +41,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
 KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
 
-COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-- 
2.22.0


