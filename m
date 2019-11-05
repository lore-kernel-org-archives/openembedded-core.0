Return-Path: <prvs=2052f4dd8=alistair.francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 5EAD17F7E4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 21:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1572991048; x=1604527048;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=7ySNq6GQyVIDRHppafj7oB0OzsGbozfqmBv3hAhDrrE=;
	b=K0SS/wlUBIq8AWeOZ7Fr+2txA/cEsrQZPcGoKZbmj45CHjB8xftCUTJ1
	m3qwjXzOzN9OCYPNcVACx02eRTqvko162XbFivz6CejnUaXwJMoik2Ay5
	TcarzdhU/pUngQin0IZedEH1b9FXkTa/w8yMVom19SNAxcYqLnKUAiNxR
	omCznCjLTCQpo6+K4Iiq3AazBeLCQ5l+MjhDc6yfX5wQRwZKSjeIKJTd0
	HcSoMNuwO3moNQQ6ppXGCRjVrxQ6fMyKoAsA9dB6Q4EeOviCzfZWQAZ3N
	LtQFXF7EeEULfUCos2/YG0pBdbmhEN703e32y5VXuv3lNIkWAAajA6A9Q Q==;
IronPort-SDR: AGGIK/iy4XTePLCqk8MZNOyoAJlTmaEl6rTFBRerDd3vMTTeuivi46dO8O81Tp9MOxcHXKqihI
	3dVBFEIUmlQ8Jx9J4BwkzWx2K4JpdyA979kB2pQt/ba2iYSgUMFNng5dDazTq+Lmd/cjB6dI8I
	uBF86ugx/TBQW5z6wE8O2YCda6673OicS5XvGZal4+dfxNoDreZTifh24SKmsqgTUoDLRQ0Q3+
	BtbRt6fl3zgdHcjWt1OeJsEbzeYbSjqf4DwozsSFaGXyLqch4c343y5SfpR6gutriI881iN+L8
	uSY=
X-IronPort-AV: E=Sophos;i="5.68,271,1569254400"; d="scan'208";a="126645060"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 06 Nov 2019 05:57:27 +0800
IronPort-SDR: ffjyEO0z7HByjd4sLn5hUEp4lczXLYktxu+Hh1Ddh8WbDmziu1H4fwYhQStp1D5JUWyUb6D3X1
	f86/+NvM/wdtdQWkraGWKOgeRlZq1KFaD7Ox6jBYGRNT7ultMQQA4NqK32NakKLhTm75ld3LEK
	++0HBU47Tb8JaWP1hrSSVQNgK9YW2nWnjD+TvxpdZmz35LuPMd8s9e6Xdm660vouBKK4NqgyV9
	JRvOPqTKk+x6jGfKOrwD8/haM+g5W6RcX0FUWuh15Vo9Wg42wx4CP5vhTgAtXr1sq0roRHam/0
	D++lLz7y7EidM4CXVZVpyPtz
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	05 Nov 2019 13:52:39 -0800
IronPort-SDR: IPuBEjCBLjYx2OTeJpJwz9rg1O0ahFNnJSLKG1NV1k7WY7db553Ay7Ta43By/pDY9XKHcz+tcp
	DAVnP1ulytaiEgqABGELwh2GGcckgGqG+Arl2G0FJOfUp5b3c0zp0zeGmXjo6RRDFFKh7AD/to
	cyfFoxDxGA9bOO50pgXzXVs+KDfOJ2nEpeS4a5dmQ/0fKCwtBA1NVUVJ0v2S+hyvaaouxKD3sy
	J623/+LseWCLUL6ZGAsFSrBFNB8UbunCmbYHKho63FHBCfugrt9bRDn5b9lbK2vxQarAUkyS8X
	ok0=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 05 Nov 2019 13:57:26 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 13:52:10 -0800
Message-Id: <20191105215210.17008-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH v2] machine/arch-riscv: Fix newlib and baremetal builds
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
X-List-Received-Date: Tue, 05 Nov 2019 21:57:25 -0000
Content-Transfer-Encoding: 8bit

Fix the following errors for newlib and baremetal libcs:
  ld: unrecognized option '--hash-style=sysv'
  ld: unrecognized option '--hash-style=gnu'

Setting LINKER_HASH_STYLE to empty for just newlib and baremetal doesn't
work as GCC still ends up being built with --hash-style=gnu which causes
failures when using a built newlib SDK.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/conf/machine/include/riscv/arch-riscv.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index 19f8f3e211..f3edcc39f7 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -8,3 +8,6 @@ TUNE_CCARGS .= ""
 
 # QEMU usermode fails with invalid instruction error (For riscv32)
 MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv32', ' qemu-usermode', '', d)}"
+
+# --hash-style is unsupported
+LINKER_HASH_STYLE = ""
-- 
2.23.0


