Return-Path: <prvs=085e8ccea=alistair.francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 951E779CB3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 21:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1562621112; x=1594157112;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=WMHlGp5lPwG6nR4oYEWD/i0AQg2MZjIEIdYJhPU9F+A=;
	b=Of/aAIKK6OBA10fViOkELP4wXCOk+UgDkHIYUXOK3fPOV1PEEiU/poDU
	tvt7GeFPe3F2OPEnCUPnbzjyhP/VB33YSUqGMpw2Rig+wwzK4QdVKI9gA
	rS0XMpm+JWXuypRr+c0bqVmGVTtEhVunEJh4dAMafkpdkzdfUngA5VjgF
	fvJNe7v6nih/jrAWci2CCqREdkN605OmXgt6QZd9G6TbXlXgCesFcZOHG
	zyuxvlDi/p8bWcJdil7hXjXUW5aZq6/R9ZIa+AZ6OwfLY4qVlIx4lFO6G
	Yg8h7a/CdjnMDRfQ5s9/QiAfuwpfYpjz4XdAW2MPytah4KNG3+tnHeNKg w==;
IronPort-SDR: +F58wOxpUK1QJtaGFR6j+3xXvPQ2p/wIHSxWNzhpVVr0IoqiAxXT0OB13uI8ldvE2d5mbzDrI/
	KNxknUYduTv9YyRKFczcgXy6eZfowvKcd4Dpa3Wh+1rkAjG64RXei/2JCi8G0OYv1toB23N841
	a0x1oKgGTFM/rVLKTR1wHZjTxKBWAlYfU5fnhXNyN72pztCXVExczF/M2SmwkQ8CGMWWyEbl7V
	2ekF+n4irxUbcCOI09IYFfcEL78zGX1WROlE46+zL9myEdgShQzRlLmMqVSbHMcRDe2jwW0f2Y
	j2s=
X-IronPort-AV: E=Sophos;i="5.63,468,1557158400"; d="scan'208";a="117307558"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2019 05:25:12 +0800
IronPort-SDR: 6eTyJN0k3s7ELbkfNtMt2R5q3+GjQEaGMcHA4EIRQ8AfFfQZSJzbyYEvkGfJxOjK+nWpB++Ji3
	gjgJfRaZ3xSAJIVhG239eD7BQTJD0xMHxFAp/FnbIF+66umA3kCQ/2xZMeqPOO23K3Phji5ES9
	thp6FftZJB+eRXSe7tYAbxNcyUS5QTchguhXXg7GkmwuIZ3RcE+EgU0m8S0XHbgpV8kGyfxJQ4
	TSHZjsTer5Gclh27LtVUH4iIuWppJ8AwlIuQVbIqTk4u1CPRlmtE2ZCaR48sjBrrbhskLjDOTn
	h+4ThRJ/7H4LydptIdZKMr2l
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP; 08 Jul 2019 14:24:00 -0700
IronPort-SDR: iIiU9nB91czcAdc/8shf8lgYRKzZ2IpFLvrBW+azif+UYULXDMdL4QomM6MJLJJKIZmcryebvh
	ugNgh21VoY1nnw1y3VSDa9dE4cjwebWkr+cHqSexAa3v/A1/HHL43LDq5yiIRqX6vU6EFFg6pu
	a06Fyd69k4ZVNznXBuZSILOrocKbHymBpMcL0w+r2Paws3rz3a+bByilzr0q8zqFTHlnF4xuSv
	9s+bzll5kWEWPAMkqMlI7OHyn6KmBNE/8rzeDcGk7qoRHyy1s4xSzQ9JDvxv0eEn4+iCqyk1Qt
	kKg=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip02.wdc.com with ESMTP; 08 Jul 2019 14:25:12 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2019 14:22:27 -0700
Message-Id: <20190708212227.20978-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] packagegroup-core-sdk: Set blank sanitiser for RISC-V 32
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
X-List-Received-Date: Mon, 08 Jul 2019 21:25:10 -0000
Content-Transfer-Encoding: 8bit

Set the SANITIZERS varialbe to "" for the riscv32 machine as it is
already set for the riscv64 machine.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index 15d0989b76..8854ec4801 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -32,6 +32,7 @@ SANITIZERS_microblaze = ""
 SANITIZERS_mipsarch = ""
 SANITIZERS_nios2 = ""
 SANITIZERS_riscv64 = ""
+SANITIZERS_riscv32 = ""
 SANITIZERS_libc-musl = ""
 
 RRECOMMENDS_packagegroup-core-sdk = "\
-- 
2.22.0


