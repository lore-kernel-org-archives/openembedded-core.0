Return-Path: <prvs=2541d1ea5=alistair.francis@wdc.com>
X-Greylist: delayed 600 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 24 Dec 2019 22:57:35 UTC
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id 3C67A7F29F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2019 22:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1577228274; x=1608764274;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=EABwofgdqZs8+ZCMAP+WS5MoPKKq0RpqfkRkyrXkQx0=;
	b=TSf/QvPInSB1846DuTeS0VnZwOsq+rOKey8yHjJXO+VttPXMFQJgg9K7
	BNQJTJFdk0gzpfkaS+RLKT+kEoQCa4AUpM8QkJJPHe0jrN5QC0E9EP6S2
	BRXOrhgsm7i48/AAbxPcjHjXvUar9jZraL8c9MiiUXolM+LK/XtnXphTJ
	YoJpi0tDTogXj8F1Ze/Jj9rE0BUbgoaxi/JZ7bTrw4D/aFIAjhstQ53hN
	uk919v1qRPyqfqJLKoevqz0TDRl0bzRK84keyksUYqNutne67SNsAkhRz
	zieiwhvhNAvRCm7d57+QsC2c6eVbTBqGSKsNDW4ttcUHgP7KnuJgZtzxR Q==;
IronPort-SDR: 4JUiRc7KCV91O9nXzuDCJlxhFQnI8flQKktmg3OKlD1jr/vyqEp16RPgzIW3OzyrVqvAjW2DlB
	WlLXKJhwQ9GTkdksQVC1bnUKjQ9KVrMma/rkhQGHDXEm4OwM9pSQo3BF7pe6urT3yGOfds1ur/
	3I8HVMbOcn41/4HJ4XXP5Pe794RGFgRi0nljD73/7+5CjHtkxfXCKiineLGcRNZMXneIs7gwtZ
	5uQYJWr/wYW9EqMf8QYKzmBmwKPJfklHiSg1iX47vCoTllMWh30Lzpk7DImMlZMEW7b5GQE76j
	tGI=
X-IronPort-AV: E=Sophos;i="5.69,353,1571673600"; d="scan'208";a="227740920"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 25 Dec 2019 06:47:51 +0800
IronPort-SDR: XXQwpRVNtPcUo4ol+2sHl9e064kS234+si1Oczq5LUfgH29iqg5JSr1jmHpBD+2sfjT1lwodpn
	ZKFnGSBVV4KXlsP7ODuCrneiZKkKu5+FGNnRo2wkgTUuUL7k5EJlxG2jwglP7vgvWihhTdeLc2
	kpmcgbcG9HsekRIlJWUDnKGqZ1VWi1tYpoceZ9PJqQBZKy3xfIw92ya5DtYbbWvEk9REpy6wot
	BZZxY2iO7qm1KjwfL1Z0wRs1Js4RHV5solZowNZzYaKZi3oMeTUHeNmGwmdBLS7Ac8nZ0+ZtCJ
	vE+aQ58avmbg6sbUQiLZtrIz
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	24 Dec 2019 14:41:49 -0800
IronPort-SDR: gfiGLbMKVpJuvE7Er/z3OQcfHOllSNcpg5gOzcXVQXJc6HPUHR0l4FcEtBKE62DQ0zR3Icdhe0
	uGd2EOfzsbA9rU1Q48DIZrZycBeak6Vn+23osS+Cvw5/Cnb/H0nDuuVhA5YtaH9sP/nqi0L+tf
	p++Yj5RrqeEM6r3NYmkVrtazyEIu7gpUTc0uLan45p+DDZvFUEZvfz0So2VP2DovXVkv4vbfJn
	0iqnz3kT7rOSW/8ur6Q2+YpVxK4FUcBejolCASEJaHhpvcEkRkDqJ4y2ERXul09LNV4i9vz211
	AXk=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.158.235])
	by uls-op-cesaip01.wdc.com with ESMTP; 24 Dec 2019 14:47:36 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Dec 2019 14:41:35 -0800
Message-Id: <20191224224135.20121-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: sateesh0457@gmail.com
Subject: [PATCH] u-boot: Update to v2020.01-rc5
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
X-List-Received-Date: Tue, 24 Dec 2019 22:57:36 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index a0f9c41469..4799948bb1 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -11,11 +11,11 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
 PE = "1"
 
 # Drop this line when updating to 2020.01 final
-PV = "2020.01~rc3"
+PV = "2020.01~rc5"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "d4a31e8ee5592072d8d5208b3e950cba2d89b6bd"
+SRCREV = "ef7c2af65966a57c98d3c47e6c2fe1ce2103b7f6"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
           "
-- 
2.24.0


