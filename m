Return-Path: <prvs=184014d2e=alistair.francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id 4DFD97D270
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 00:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571100478; x=1602636478;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=t7KkLFRPuxGXH4T76xiiZuOkIAzJ6CYbmgbE6HnXD0w=;
	b=FDciGp1M/jDcVdbSL+Zy2oBytAt8KZu7wfV2oPLI+C2cVrId41g65lDf
	J9tv4jTtjvHj405qbJX8EsrzI1dxhCCRJYP3Ji4hPdAa0DjDEUauCrFFe
	7v0+tbwkWu3zn/unzKeEEOX4+a9z27x730HRY4Uh4k+VXDjdAce/iZOb2
	aiK5Nk6Vq2iU0SqRIooLRoD5clrXBHvcg0d4fJjgo8cdZciJvc1j5lTkg
	iAGZN5df9BD2JkvfrdamJgETcMiu3R7DO4L1JaVZhmWdkf0mJmOGy1Jhb
	z/fB73R/fS30axihzjoPZo/PRZwVB83Wz2MTV4wgEMaGaAvg4bbLToNu6 g==;
IronPort-SDR: SvFzzrWFWvXGcYeYvWnMQYgnZ7oMZjIZLDBDIhUBY0Ur5BdsCv99WAjwC01tlhfXLYvMV1Mg3Z
	ay32U2QMH779ZDYaxkfgvf7FisYDBVi4LISpdf6biXycHsx6JQMj8vCowRRpTWD7jfbnYbvWcF
	dg/I7kbnFuyrpmH7Cem3cz86iloO5fpCwl5yJoV2fJDnul2ez/fyi4fRtqyQS2t1yMexH48EEU
	jeksxa8tDPCbyke4vYot747oyVYPmOOsg868/b35X62j1897YVq/8UcBWNkYPSfC9gMOi5Es1c
	VHg=
X-IronPort-AV: E=Sophos;i="5.67,297,1566835200"; d="scan'208";a="121308667"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 15 Oct 2019 08:47:57 +0800
IronPort-SDR: VrFqfcTvCs8wbjadJmP0KPXRsnkjvlFoebF94XhPZHabCfhof0SjVJsmbpuGUUeitsXPNuhwH4
	qP+ahYwqO/Gr9x8sVuE35ab4IL3H6iOoZWqS3EJXA541j8vsTdjHyFfTWHxVNHZJZ7oRz/DN8i
	TURjSrKt57AuVVHoxC+9e7bSzAlypl8aP6oQFl6diVuMOhwce/q/eDsfZHsgODx9OboEocN4EI
	0ouzm0TxWy1LsBy8237i5cif4mHfnEFfvxTw5QeUo+l7fi6VwdxBbU44Mx2Ny5et1MEBO3zU3/
	hjeObQGlL1nBmMiVqUGySSOn
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	14 Oct 2019 17:43:46 -0700
IronPort-SDR: TCFDLhqeSd2Y550Fbv15MNyOZftSKIjivqRhcGoq7MC7WP9LKo6VFa4OEK+82tePs+3az8g8v8
	vexl5T+zP/PCfAUZOhGwVEjQQ8i6lpu6U+5vZ+zyCm0n0ruNLuJ8MDNuQQ0jm/BxW+s2g7Mury
	CkWyI076tlGkknlMKl4ssqgwNKkryKQ6UX6HryprPJ+7w+fxSgjXoiA+efC8ZrMf6DhcHUesFi
	FighZ9efjEnkereSmSTjx4OjCkQoWKSdhOd+xyaf0AFgFqVeo/sf6im40Dt70Nm0wo7MRZebJg
	KY8=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip02.wdc.com with ESMTP; 14 Oct 2019 17:47:56 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2019 17:43:17 -0700
Message-Id: <20191015004317.21230-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015004317.21230-1-alistair.francis@wdc.com>
References: <20191015004317.21230-1-alistair.francis@wdc.com>
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
X-List-Received-Date: Tue, 15 Oct 2019 00:47:56 -0000
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


