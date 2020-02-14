Return-Path: <prvs=306a69b02=alistair.francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id 3EFE661130
	for <openembedded-core@openembedded.org>;
	Fri, 14 Feb 2020 19:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1581709766; x=1613245766;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=a30kUBj6F3gz94c//+so3PgKnziKTWaND/PjYkj3i+Y=;
	b=WPDH2ThtDLLQcJSrV7HRHIhDFv1uKqp7E0FNubRBfxLVK6mbIEVdeKiF
	qPsDdPki4FA5dycwasVrjW1flWCVYOnAB8mmiUMyj7vbkOXL8ATCm1DlO
	bi1ybAuc/7vg0t1ghaMRoNXD41gxyuH2RVuu1cmq9MIaL4tCvd/RJ8CV9
	X4lKiyyKkyS9wP7Os0o+N1TIftnS1yrBPn3rXKhG3v6iCGZfEW2jw9qDe
	VIDexmsziZjWQUtH5HnTrSz3Ym1ZAyUPidVvAr//D2H0LwzVFNdMoeODz
	z6KYPT4jH/f05rdkWalRB9Achj3yZ/7lv7psVZeYO1XFLIyeAWjfy5EqQ A==;
IronPort-SDR: BH5lvQQbEjsLPY0enlz60Q+inunASYpOr4FnPdnR2MLrXbxBEGYT9WGUAv//MsQMFmEYwDtyZM
	ijyAu+dE5kyc8nAUvw8zahjGSssYwOFhIel0fbxYONbfFLHMchY4DvFPQvWlhNK/ywpev2n6gt
	TYWXDLWv9iYhlCc4CABvSe0NCIz7hvGDUybkoD8RZnrWaNBHRv5NkNCvXiz10ZF6AeMPEc0Arg
	rbAa3nJWsfvbkbEniLH9zrcVqTBpRd5LfR0goFy9fl2UaVfSGAwPuyzyWjBdcCfCx129rtWfKn
	WrU=
X-IronPort-AV: E=Sophos;i="5.70,441,1574092800"; d="scan'208";a="130418069"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 15 Feb 2020 03:49:25 +0800
IronPort-SDR: SgyX0JL33RMBRJk0lUB5vSel/CFDZ6Fb9SLSAElXKRZSIOSdNnx64ruN75nvLppw9jKI9BDF7J
	qD4g0PzySGDCaIns68nA3ILXoTBiaBnvXEBNlXF2c2nlz8knshbSqfW8gAaY9g0S3ZTNGpRtaU
	8rIBoM3Dk1PhWVg7R6HvV/kWhjzu6kv0iN19ALzJVLxSDxK4oiqS4MoFejkjfDjDoOQAmHfb0i
	1NAC9WZoN5XS564LBy5LLfXLYlhHXpD3ROSIqNMe2HBdghsm5DO2yYaNYCgw5Pq83MIIZEzjCb
	UI69TquyrpjOrbpLo7otDFdJ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	14 Feb 2020 11:42:09 -0800
IronPort-SDR: bGk6866uTqdZDdIHtJVBhHBsG/1fxyhl6DSked+beXyIWtdmmxMKlGtrFi0DUTK+fQfL8FOD78
	ItEjucx+YST8eZuZDeR2vHwFSmBJaUBmz4e5GSAZdWDF6zIZFfDoiHnYxJdG7MT61DET8g795D
	TGkxwtLV/jBetXD58LqdVMio0/wgQQ8mUaxZx483EVPXGuvnZHV7QzBakN7vvOmFqwpznMq0o2
	IhXLktNclUe6FivCXv0XKWFtntlzGV2lfRIg0r6msNWmt5EqbpaxJ7OFBwAGOvvPa1ljUoIAKK
	ZZ0=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.158.235])
	by uls-op-cesaip01.wdc.com with ESMTP; 14 Feb 2020 11:49:22 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@openembedded.org
Date: Fri, 14 Feb 2020 11:42:30 -0800
Message-Id: <20200214194230.2361-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] qemuriscv64: Set the Xvisor platform
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
X-List-Received-Date: Fri, 14 Feb 2020 19:49:23 -0000
Content-Transfer-Encoding: 8bit

Set the platform information required to build Xvisor.
https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-extended/xvisor

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/conf/machine/qemuriscv64.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/machine/qemuriscv64.conf b/meta/conf/machine/qemuriscv64.conf
index b45fdd556d..a753af0576 100644
--- a/meta/conf/machine/qemuriscv64.conf
+++ b/meta/conf/machine/qemuriscv64.conf
@@ -4,6 +4,8 @@
 
 require conf/machine/include/riscv/qemuriscv.inc
 
+XVISOR_PLAT = "riscv/virt64"
+
 EXTRA_IMAGEDEPENDS += "u-boot"
 UBOOT_MACHINE = "qemu-riscv64_smode_defconfig"
 UBOOT_ELF = "u-boot"
-- 
2.25.0


