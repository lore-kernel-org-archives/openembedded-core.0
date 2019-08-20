Return-Path: <prvs=128332a65=alistair.francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 98EA67EFB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 21:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1566334976; x=1597870976;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=OYdj7wbIvNYQd7aIG8AyG7gm5Kf9m1HeBK2ZTlz/P68=;
	b=AHAKjAWpM/6U2Rxvz6cSs/v5dMKQAQHlO/zFnuzY7QNnpBPQSFbtt1l6
	gtQwTBqKDdh2rxolHXDtH7k+vXyT0BJmXnMP0bY3WH0/fnayo0sIIBc7N
	33cMb5JamxEFTTk7us3mUeasSpXCrTWHw5ho5b8HIEZvbnZtp81ZPrjMY
	YJh+1QfUjmCrwANSWy/jSiAwUiO7sL+Dst3+jd7k7/RAPrOBQr+ceut/q
	u86AMZ60Eny2gv/rTsoeO/grrVrVwF3P4je3RByHcj+6vi38FhxAiQ9LO
	LEUyUyUzgzVxfiNkm7bPYj8iE7ka3DIN6KnDyH4M7/dDN+eUM3ZE7e83V g==;
IronPort-SDR: GwfoRqrK6p61a9i5z4GPeGYrEhZdxezZzgUyGqAmWdwNwpanaqUsZS/C+5y3tDjKSwisXuaJ7X
	SVlqIJFe2bhPzY2JLXJSyKj3aIbps/a5ivZ1B1K8Bp7x4PH1njAjwdF1qRatHh00COR2LApElp
	5P8j2RozlMo7sQ8ADwTiZVj0jhMt46TYBuOZQZQIGq+YAPMNyQTTqtFWRL+lLFTP9ZMP7cTokw
	q+s2mnP8e4q0xslf7notiMOBlCxatqwgzDWkC7uhxn1I5E4mIhk2DYq0dLl1HmjQt5R8K+v66A
	18Y=
X-IronPort-AV: E=Sophos;i="5.64,410,1559491200"; d="scan'208";a="120872828"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 21 Aug 2019 05:02:55 +0800
IronPort-SDR: LwjRYdpbFm7gEHeflga2T6UDXQ6JB5HAaruAzAgfU6QBQrecTL0G+MvYS9FjavhZ+fY8gpPPPD
	1/p+sS19QZsxw+tRfc2+fOZydsGaJg/Wi2P/36sf32nNqO3u002kEEtmWWU/uXP8SZm3DWYj9h
	lpL8jYLFhYV1Hcbq0dHLDKw2g9gDEVB1CkixGR9ivOa9N0nNTmpy5l1PZRs6sN2NLJ8ki+judO
	QtSJg3pUxoZ9uv9JsRB9ODy0uEZiTOx0ClZxYjXkYHK1zJx4lEJDvDV31kIolyxpyOMUxec9l6
	WmCDjCpnKyhMRHqt2xoYJhJu
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	20 Aug 2019 14:00:16 -0700
IronPort-SDR: X+H2PCFAhWon/Ap61tyZozy+eDvX3ulLFnl4H6XPL1EjUzFyZkI5XYOvk7UC39SeeySEktdxiL
	RzjTZNLD4s50S92X3caxwgzGmj9K2x+iGxcJzliLpwF1nAYzKwKDfDMYfeVMzWj/I8l1BQmHk6
	8nqap/5CqmU6RZP4L1uSzQ1tFIh7DhCfRSD0Sr9ogaloP+yk9Q4ZRpXbGiOQ5I3fE3NTn9Y+vh
	CHjbk+tttn0vL6EpxBIQjQkY297sBvHTQ25swxBSxcQfEmOE9oiR1j+fk6n+rMry3ouKE8CpSf
	7tA=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip02.wdc.com with ESMTP; 20 Aug 2019 14:02:54 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2019 13:59:17 -0700
Message-Id: <20190820205917.21297-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820205917.21297-1-alistair.francis@wdc.com>
References: <20190820205917.21297-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [PATCH v2 3/3] qemuriscv64: Specify the firmware as a bios instead of kernel
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
X-List-Received-Date: Tue, 20 Aug 2019 21:02:53 -0000
Content-Transfer-Encoding: 8bit

Now that we have a -bios option for the RISC-V virt machine in QEMU we
can pass OpenSBI in via -bios and the kernel in via -kernel. We no
longer need to pass the kernel in via -device loader so let's remove
that.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v2:
 - Improve the commit message

 meta/conf/machine/include/riscv/qemuriscv.inc | 2 +-
 meta/conf/machine/qemuriscv64.conf            | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index 797a27660d..2ebd0a01f2 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -28,7 +28,7 @@ UBOOT_ENTRYPOINT_riscv64 = "0x80200000"
 QB_KERNEL_CMDLINE_APPEND = "earlycon=sbi"
 QB_MEM = "-m 512"
 QB_MACHINE = "-machine virt"
-QB_DEFAULT_KERNEL = "fw_jump.elf"
+QB_DEFAULT_BIOS = "fw_jump.elf"
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
 QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
diff --git a/meta/conf/machine/qemuriscv64.conf b/meta/conf/machine/qemuriscv64.conf
index dba8f09e93..99b48b309b 100644
--- a/meta/conf/machine/qemuriscv64.conf
+++ b/meta/conf/machine/qemuriscv64.conf
@@ -4,8 +4,6 @@
 
 require conf/machine/include/riscv/qemuriscv.inc
 
-QB_OPT_APPEND += "-show-cursor -monitor null -device loader,file=${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE},addr=0x80200000"
-
 EXTRA_IMAGEDEPENDS += "u-boot"
 UBOOT_MACHINE = "qemu-riscv64_defconfig"
 UBOOT_ELF = "u-boot"
-- 
2.22.0


