Return-Path: <prvs=1662a5b7b=alistair.francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id 211AA7F352
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 18:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1569610380; x=1601146380;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=t7KkLFRPuxGXH4T76xiiZuOkIAzJ6CYbmgbE6HnXD0w=;
	b=qeESeSIjXKXaxXlOzqBT4uc0OHZzOvwKh0/xVUGZZpmfIqXJn4GO0eXV
	ufwepi+Z65rEKERauoDcXQbbmef86gtMSRgvLRkAN0q8oVbc1y9w+YKQR
	/ZLYm22d1Ug31ApMTiJkuQ4un2rl4WJkWB69mhlQ31vyO9s5ls8JJmz0E
	ieZoP6CRuaNnHnL3v3kgIce65kQWuNrzqYR3iEjhTqHyncwC3W7MmgoOp
	G12I3TUGPFFlGV//HRykh6LqONwRIyoUrEpnFrqoFkUsldKkgwNvpaEMc
	BDmXyFuAGlavJkvg7EATlySlV+a3dJQUR4UvO+bbTkBEQ1Mf0DGfdNAlQ g==;
IronPort-SDR: 90osGY0L1uBEAeBBaRbGdwgw8FadKW78LicYaJDkGbXKtIFtiaAesAeyPM4M7dkn3DiyCRlJng
	t6xE7uGuJ/2LBX3wmk0CtiN8cOZ3wTGwiMchWi7kM5pXDyS5rHLOEsb+Y+Y/0H7pevKVBXBY5a
	WPK3+mLDaCxvZ4TnuYOw+RtEDXAji/GD4rlikdbfXNyrsZbinhU0ZUsFzEP5/KgbWstEwTV1h+
	O7XA65t/FzIDbK4lQjNUfKyaiejZU8zjX4XaEHFf1VwwFQO3jx7evXkmMdmvZjBjvNaAKUqDqr
	7ic=
X-IronPort-AV: E=Sophos;i="5.64,556,1559491200"; d="scan'208";a="120078242"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 28 Sep 2019 02:53:00 +0800
IronPort-SDR: MWGqwkqdl09m5l6bo7ofe1/O7EPkKW2YxLEgXrqimW4Y9c0dzOUxEIJPmOlXIQ7brHtA3ifAne
	KxWiqiG3zAYplrrXOPsR4BFoPE0kuJIBxlKn3UcZeBD3DbwECAakpPe4/VpbPuiDybEL0eH04o
	yFGVcMHmQYBc2qg/8jwwxOD2Ags2mOZ00qS8UcJ+AH4z0ba/Hr0fSkcMBkML5fCxFdF8WLYxhM
	BtALrXr8/bY6yew9EqPxj0cLCkGDIHm8LNPOl1e0H9HpLa9Mw8Fbo962WAwP0zu+NbP/+xgVie
	AEHn8RbdgdbFZW6nPQFPwu8R
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Sep 2019 11:49:19 -0700
IronPort-SDR: ltryBikZwiog3gQ/tAXZNHjnLFlQH3br6/cDjfi96/v6xE4rr+F7RD8NljySQXsyK/1w8JH35P
	DC/7YVGbQt7DA4ScNA+dj8fY8s95RKVXAXxJDEBrayKqUL/lVoI9bdsQiKCNXTOTFFlwsXTIHn
	NPpJYJ0h0ml+YMaeJl+2PeZfgFAf3nb2TbKEp+6DeBQ32/LcroCBM5YTo8shX1RhM99zDdUe53
	uP8fpnvsK0IME1bqh+QfNs0Mdtgp7I/qgwjtc2LIfRVZ0tUOiEkPUsue2rDTHxo+KNLI8e+8a+
	mro=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 27 Sep 2019 11:53:01 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Sep 2019 11:48:39 -0700
Message-Id: <20190927184839.20896-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] qemuriscv64: Build smode U-Boot
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
X-List-Received-Date: Fri, 27 Sep 2019 18:52:59 -0000
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


