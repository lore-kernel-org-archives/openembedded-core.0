Return-Path: <prvs=138ea0b3a=alistair.francis@wdc.com>
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id 3A7647F440
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 15:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1567179906; x=1598715906;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=JYkPwYw4GqiVJGB8pXnAgx+5Gwppi8aKbi14+6pIhA4=;
	b=A3WwhfZZq3RHCx7R0AaEwte+jyuVu4DuZpvkn63VWqUkrP+Gp41Lk8aZ
	ZFFO52+8lNqD/jy+ZGUyD3TR17z1N0hrbeybMDHSI92kNZxNqZ3QIGfg8
	QG5QvjilWWX0PP7ZvIodi45sZ7tIuVhFw3adK04pby6m+UVrrTcIrbu46
	UtUpdNO/RLHdQlLbnvGaTxXVeWt68TALYmSn+hXGlk4VbxR7JJHaZM/IC
	nRPq+dZpb9cqZKu7K2ee1+cfyn9M+IvlCWiX0zS3017eGQh4Y+oTk8TyB
	7F2zMp8g8su6YcyI1OoTN3okBwD3Jo9dTaJhHBi2czgGWh2GPA5NJjPd6 g==;
IronPort-SDR: lWPVS1SI0MTHmVVyw0IZ3m5Z4TGYmAdRb1B5mBAW/ExFnk00cyOaSJBdNwOHe0R3Kx0k7ssFjy
	JD4g7cmDoAZBrsICQwATsoMt2DsO+c5I7B1H7yv+ICiqelehZvKbZGe2H1FdOY7ISuciwIsNIb
	FQNHUZz4aVHGfCRjgxy5l34GZzFw3WJOQ54aqU1Q/eNXZhY6aUaslYEh5TCNDBr5KP7QR/3YQC
	c7F/z5jGZyC86MNnDzOWdKxad6uNOkEer3Zkb/5ebVxwmxQSiMrvKESM8Q2aN6+pTw57+TKcpx
	Bf0=
X-IronPort-AV: E=Sophos;i="5.64,447,1559491200"; d="scan'208";a="217576264"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2019 23:44:56 +0800
IronPort-SDR: PXRsW7xM558ogZwkfzaxy5Be/F/ZCBFSs/uUK0h6Msffjp8Qh9Oeip6W+okWewXuFYbiHuWtQs
	M2w9bXWAsZ+VeBHOgFv7fzC+3uOPslTcilA59ZiflJ5ZGQePzJ6LKfpmiB4iRtblsAe/21e9Aj
	dXjapVn9j5sh4HUjcZlMWTenD672tUMnQyAtlHr5HMga9nqeSlOmDQLh0zwhGu/yPWT//HUthO
	4PcL4EkIWus1g8Gh2K9PqZekPCtV23W3ZVWbnRbDvCn6sOGCLgvKepueOuAx6vm+H9+zBmK1xb
	8rwIY6MPw/dFwb91pPmaXkiz
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	30 Aug 2019 08:41:57 -0700
IronPort-SDR: SDL9GBIuxrYVS/UC5fxiSrD8ol6vqHmlK6qvaqT/9CpQfTnbKdipTs3/Vg+hnJPod9MSy20kED
	W71Vzhyo+3zs9y690PA2eFSEYQCVFOPuVEtbtnRDl+AOFlipkoo9VvrBrxKyojiTDP1UTC4L3G
	dA4EUa9m3Z4wRVgHjryggzKDi4RyXJqIb89FITN/A3HHFkk50eFTf4kfaJ6qFduabpU5moA8Yf
	MVsZxdfLLsXKOWNcG7BqIkfiTTv8lwri4pCeOOx3U8GDAzlEXmQ2tkC/q6EJYJ/zQErimpZNnC
	b5c=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip02.wdc.com with ESMTP; 30 Aug 2019 08:44:50 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 08:41:05 -0700
Message-Id: <20190830154105.29251-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] qemuriscv: Generate a wic rootFS with a larger filesystem
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
X-List-Received-Date: Fri, 30 Aug 2019 15:44:55 -0000
Content-Transfer-Encoding: 8bit

This allows us to generate a rootFS with a large filesystem for use with
QEMU.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 4 +++-
 scripts/lib/wic/canned-wks/qemuriscv.wks      | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)
 create mode 100644 scripts/lib/wic/canned-wks/qemuriscv.wks

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index 952779e98e..df35f2808f 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -11,7 +11,9 @@ KEEPUIMAGE = "no"
 
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;hvc0"
 
-IMAGE_FSTYPES_append = " ext4"
+IMAGE_FSTYPES += "ext4 wic.qcow2"
+
+WKS_FILE ?= "qemuriscv.wks"
 
 MACHINE_EXTRA_RRECOMMENDS += " kernel-modules"
 
diff --git a/scripts/lib/wic/canned-wks/qemuriscv.wks b/scripts/lib/wic/canned-wks/qemuriscv.wks
new file mode 100644
index 0000000000..12c68b7069
--- /dev/null
+++ b/scripts/lib/wic/canned-wks/qemuriscv.wks
@@ -0,0 +1,3 @@
+# short-description: Create qcow2 image for RISC-V QEMU machines
+
+part / --source rootfs --fstype=ext4 --label root --align 4096 --size 5G
-- 
2.22.0


