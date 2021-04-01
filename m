Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by mx.groups.io with SMTP id smtpd.web08.3305.1617295735108356549
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 09:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@wdc.com header.s=dkim.wdc.com header.b=oWnbivW8;
 spf=pass (domain: wdc.com, ip: 216.71.154.42, mailfrom: prvs=718ae7c5e=alistair.francis@wdc.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1617295734; x=1648831734;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=a0RjqM5HlsfBLIt/wUu61Yy+3w4b15EH8uj0p+qqM1A=;
  b=oWnbivW8LkpARjRG/I9Cqkadua83Nsvp4n4kG6e0I604EZlQ50s0EQki
   QunTJmQY/HzuaQZr6jh6lW/huKyUm9lI4juesOHb7by8PJ3UU8wxAJ/jo
   f8B5IUXWRRHzYNRNKXNqSs+8oAByb1zGeuGIJHcKoS31ziMF2bBSsl+KZ
   WEuyK2kX8yEYgF6P6YuEpN8OH17+FDtmJA9a3RlasE2H+j821fWA+pUF5
   L5mKh/w7FGK53oPzKeG5xsf+bTAYyCMgQ7YaZrJSIfo0OWNEqx+lzqJ9p
   tVeSg1d5SsFxqToH/x8O27PvonmvsyD9yi7BiqFe6PJ5AQoCol9vooBvz
   Q==;
IronPort-SDR: fJwfkA/PW5QlHsg8gT6RkoqNTONN2KqUVWILGNUJJzrN9PYkmZ+K907B2FW6Y5bpNX2X7qvo8N
 sv6SNBlpPUQvLYbIAAVdojGU2NXuFKtUFGXsiG4fkofWLbZf5V/ZW4HOdWtPt9SzHtN4o2rWPS
 G3oCKM3pLXNYzPVL21pbdfPacJ6LVmubNYQWc13/LO7VFkPqGIrw6+GYq+nrhTGBHEUxNfADO4
 y/HH3/p07sqPpKzt3//ezhaMSbqqqWOBSQ6d+J62IUxWwm4RwB1v5vMu+R6zYnAtw1Nj5sGbeh
 e9M=
X-IronPort-AV: E=Sophos;i="5.81,296,1610380800"; 
   d="scan'208";a="163462763"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 02 Apr 2021 00:48:52 +0800
IronPort-SDR: hwBvUpq7LvfpP7gAPif+nAzx5IEaIL6hpejOnT0Nqek7857JotqqqoCj7g6e/CJELvAtA+0GXP
 O1wax7rYnPkI0llEd3KX7k2dW0wa66zoKjDjRM12kJyBBnoXIieVA/gvG2dlFNXfrysMd4WuR0
 qXsGttoIdIGMdTiPuDgiOfMChKjJ7/h9/vJkrDfsZY52725yaY1o9NjNHet+ogFZm0sR5j9/OR
 CGnTeXXouSeD16bqniBX4bdOfMh3TUQ8gid0vjRatKo89EwnYAmwyQ32Il/Nq8p+jXstSRjQ/K
 9dyie6Xu3OZaj8xC0FOTn9R6
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2021 09:30:33 -0700
IronPort-SDR: nzKF7dL16dogKIBZdhWBLKtywsuK/AZ4KmnuRjLofuHz8lp79JhO9ltZEK9o82slmFuJD9rRD5
 J02Z4JB/+FXfitw+cskEQ7Q0/KPVKCdaXJxnP+ekZpJO9grVwR3qEMGJk2gLoh8GPfNMfEfhuE
 FDn8YMFprWzewwFFTSHON/bBS5U2qBVN8N8oLcXasOBj+ayxnUTR+hc2gsHCcGZbVIo30GI1o2
 UEF6zYWSPeG4EVXeME8sHcUwOWaTN+2niJfbz8YdH7MvdPGU2DXmL1JvEQsFSPNJCwPKGnjpa5
 phY=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.75])
  by uls-op-cesaip01.wdc.com with ESMTP; 01 Apr 2021 09:48:51 -0700
From: "Alistair Francis" <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Cc: alistair23@gmail.com,
	alistair.francis@wdc.com,
	raj.khem@gmail.com
Subject: [PATCH] conf/machine: Enable bochs-display on RISC-V machines
Date: Thu,  1 Apr 2021 12:47:00 -0400
Message-Id: <20210401164700.3904674-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the bochs-display as q QEMU argument when running on RISC-V
machines.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index 47d7e9b174..493124d946 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -34,3 +34,4 @@ QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
 QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
 QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
 QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
+QB_GRAPHICS = "-device bochs-display"
-- 
2.31.0

