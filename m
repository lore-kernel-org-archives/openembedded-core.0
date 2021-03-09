Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by mx.groups.io with SMTP id smtpd.web12.11376.1615306214386966127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 08:10:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=iREVy9c3;
 spf=pass (domain: wdc.com, ip: 216.71.154.42, mailfrom: prvs=695091433=alistair.francis@wdc.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1615306214; x=1646842214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xT9lL8hlSZLX0tlhCzBX8krbKp5TrwDC8GtdwhZOxVo=;
  b=iREVy9c38mWTjiotyZU+R3y/nwUkIUVy4BjMriS6qF9e0PSZubEZ2j82
   a70L0AnUD2vk4q8rfqbUiasjezNnRQRGSx+51gc+adoEfateLYe4QEkNm
   rrmq4ulsRBn7IuaSXqoP7rO2nJEMFyMp1VTQhzpdEJxldWCXswaGWwL9c
   EksojAQq5rsBPpX3eRj8Wq6DST5Bd9gVoaSEC4Ll+YS+fpgWEV4pf94Dl
   jlbuU2UChtAyMplkQJoesGVAoSrCRzAkY/GFApndvoHISG+x6W0FxcMjo
   1YSShsNQDhogxNa2b55LllJpvqablrJvBCg0mQVK9mMIOt3gTxoChUuZl
   w==;
IronPort-SDR: 4dQIIzOnElJb+YW8utgfkxhDPMsp5jVORU68KQfe7hvWE78HF50PRBZjnMoUVopYKOecReMYyN
 S7jDfNY6i8/IjaT8nXPVljj5xpZoT8FW61L6HnYlE/JEFblbUqCI8qzTmCLlL++H6kb2kNrFLf
 cPJx/2xf76etI9Hq2821YBkCWz8Iy2Unr+9AK7wQcZfM/MYQnYn/FT63VyvB6ilcys4VH03qIX
 f4xka0Np7xgZk+VeQBCs84ZOZV2QuqLiNIGucrbWuT3bUgikHVii5YZHmv3pqmVdZV1EwaeVoC
 SBY=
X-IronPort-AV: E=Sophos;i="5.81,234,1610380800"; 
   d="scan'208";a="161720434"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 10 Mar 2021 00:10:12 +0800
IronPort-SDR: kFi1qQtI2xVy5kD546dJFARLokrzCXwaDQoYTKgK4nHxC/QvERHC2hU9PS5dWFZhmV6DGZvhlK
 /Pj8XY0qUqjYs7eNB47qREIYvoVuYaAWjrq+DljCyPg+NT+PgwD3VGDCUiNi83UsvmVYZJEMHM
 2X4/ACZaVGD46hf1FbrSzQd3zQNXX7dK+WKQPwdj2KDCkwrem1+g+zVBdf6wDMBxNU034CwAQY
 S1RxXd+Ri2ROaej8/xxRfc9Z8jlw51/OZr47r6ggkcw/Uk+ECSHB+AGJosy87zd4KvFmOhWgQK
 tUq6pqixgacM2A0ZHbEDMr1E
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 07:52:51 -0800
IronPort-SDR: 0UExUqI1dpf4jDyJ+FtGBRiI90fnpE0P0ucLHFsnYGxif/QEum/UOjR4icl6rvhT0033dX+2q8
 Njg8NsVWWnrztbo+/ViWqHn33r+cMGMNBw/lL68RH6NmatPD1I1Uqt4x0wOWKHDseXHBvpQOFV
 MpUMC3zTzW8sPCx6mnCuk8k8Nt9GI2jyh7X4aZYIDRkIuRD+/a/BYFbByOJqx4VcEkRcDl4i4Y
 QLfwJKrzrH9XJqLKKI+OGmstKbGkU7tfivQ5fgYrts73xJKCcdszAuiW+Dn64PtSzkHp1mxztH
 P0E=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO risc6-mainframe.int.fusionio.com) ([10.196.157.248])
  by uls-op-cesaip01.wdc.com with ESMTP; 09 Mar 2021 08:10:09 -0800
From: "Alistair Francis" <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 3/3] machine: Initial commit of qemuriscv32
Date: Tue,  9 Mar 2021 08:10:05 -0800
Message-Id: <20210309161005.27422-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309161005.27422-1-alistair.francis@wdc.com>
References: <20210309161005.27422-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/conf/machine/qemuriscv32.conf | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/conf/machine/qemuriscv32.conf

diff --git a/meta/conf/machine/qemuriscv32.conf b/meta/conf/machine/qemuriscv32.conf
new file mode 100644
index 0000000000..1413775ad6
--- /dev/null
+++ b/meta/conf/machine/qemuriscv32.conf
@@ -0,0 +1,17 @@
+#@TYPE: Machine
+#@NAME: generic riscv32 machine
+#@DESCRIPTION: Machine configuration for running a generic riscv32
+
+require conf/machine/include/riscv/qemuriscv.inc
+
+DEFAULTTUNE = "riscv32"
+
+PREFERRED_VERSION_openocd-native = "riscv"
+PREFERRED_VERSION_openocd = "riscv"
+
+XVISOR_PLAT = "riscv/virt32"
+
+# u-boot doesn't compile, error: "can't link hard-float modules with soft-float modules"
+# EXTRA_IMAGEDEPENDS += "u-boot"
+# UBOOT_MACHINE = "qemu-riscv32_smode_defconfig"
+# UBOOT_ELF = "u-boot"
-- 
2.30.1

