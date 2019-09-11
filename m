Return-Path: <prvs=1507a981f=alistair.francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id 5A6AC7E3AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 17:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1568222836; x=1599758836;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=Cagovh9Gn4unsxFj1X9EC20iQ/7pIqBh0nS07eF4wcA=;
	b=R6Zhb1qp+DL8gmkxd/GIdd4OE41Gcc43ci3tp/l86/XilgkbKjotZuQM
	U+W42aBQWMD8mLLfI06xpXWcVjW7c8G/DFoPajjwDTOPuSyXgl3BhplB5
	m4f6/5m3G+hZB94j1s0u6F8owlKO7uirarduhSNnCFggEJ/4HNM+C8S6G
	6/4KSGx8yz3aw1QHNGLL2GkNdWoQequyBn4Gk/0XsfKc4uQrs0RvQpiTw
	+r1tEbpq2Xt5FOgfqNwMka7J53tKoNTxAPiGcmTyCI9GU6q6LHrgaod7m
	OwCrdEbSFBukxm3wLiKcPf6RWLylGQZFSo7XhgaIR8fw/Lc6rGlDKJ/Bm A==;
IronPort-SDR: R8433iNhDaWQ6ylNh8fegu4N7E8nHAbcEVXDB2Tpq0itNw8bsCoYt2uSG0fUU/rA/5IGG7Cp4F
	2O58MH1OX2SfCsr9TelJF+va10mxxzcYFgX836qlsH5dgvklHD5X2HANNCF4ccz9Wgp6c5EpFi
	nxiyxw/cBL3s4CofFd/4FfrdxYJPhwhvw8BDrcks13APzkni8PdHnjED/CfL1Vs5kAWMkgvGax
	/jtCo6ZHbP4qIGfecpvD4q5dAfHphVi8VToDWrvhzTSvCqm2ZhtFL08toJm9AizEofgQ3jo3OV
	68A=
X-IronPort-AV: E=Sophos;i="5.64,494,1559491200"; d="scan'208";a="118883271"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 12 Sep 2019 01:27:00 +0800
IronPort-SDR: 4rxNsO4FqQMEm/02hhrHVI1okJ3SRDCGVl0Gt4pAJoAHGRVAYj4m7I7whDi2a6vroesI2yHcoC
	o5kiU3rWrVwAV0L7DDVQCbOjqX/F2qSqgAM029gXod2scL1Zn91NKLo9glKs3FumiXmSfhfOAO
	GMTtGXtVWyzgp6dHYolSydbxI3J70sPWhkuxAFi63kyixSRlXEHUC1XY+0yxB+5E62KNDVnEZw
	/oBp3e++75TNCxGIwmi17lsVw1dsUzK5pTbufN+A8nZLOUTStRkoQXbM5o76Y01aDZ4clHAzV7
	qp9RFEr05utaNveiPAHabjyY
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	11 Sep 2019 10:23:40 -0700
IronPort-SDR: cUB6yvk/VV6jVIHu1dLHFjonU1xS6ULJR4HZO1VBi295x8anHxI10QWc1Cbc9YwJxnyETvyqwR
	Z8OG13r/xIL4gXPNOP8HKom46tS2xWHY5LdxrkloCLtl96OpGfKiRNVMenb5CFSuTy78Z/7U+F
	nDi0oD5UCm0k/pI091GS+q6hy9b5lz5Xf8rVclqRmbi6TMu9oMAY9rFAV5bjOyxskVTkAaQVly
	zE3muRoUzvaNdtzoszUw/F+Ri9d+MQczP0bHiP/LzNnFNkL9bjRVF7AgUtxsbd40KA42vI1vD1
	504=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 11 Sep 2019 10:26:57 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2019 10:22:56 -0700
Message-Id: <20190911172256.11378-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] gdb: Mark gdbserver as ALLOW_EMPTY for riscv32
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
X-List-Received-Date: Wed, 11 Sep 2019 17:27:14 -0000
Content-Transfer-Encoding: 8bit

riscv64 already has gdbserver set as ALLOW_EMPTY, so let's set it for
riscv32 as well.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-devtools/gdb/gdb.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 0f10b41734..249e24dc52 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -10,4 +10,5 @@ PACKAGES =+ "gdbserver"
 FILES_gdbserver = "${bindir}/gdbserver"
 
 ALLOW_EMPTY_gdbserver_riscv64 = "1"
+ALLOW_EMPTY_gdbserver_riscv32 = "1"
 
-- 
2.23.0


