Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by mx.groups.io with SMTP id smtpd.web08.192.1611265515060390264
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 13:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=XQP0sATT;
 spf=pass (domain: wdc.com, ip: 216.71.154.42, mailfrom: prvs=648e1bbf7=alistair.francis@wdc.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611265515; x=1642801515;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2fj8SmfvtY77sxzB99yf0JqBjAUwqcDcumPZtaTVHNI=;
  b=XQP0sATTMAuD9QjQXRX3lXaLV5hbqoGEG7jL1K6Qi/7XSvogtU/1fY66
   oSXdUc+Op/k0Fiojvq+R0mBeTtFXAalipiusua96vH2wg9yUpbw+IF6AX
   GPa584RzVz/9epNzjdrSD8XsfUcr+k5kThJfXDW/zFj0RZyv+g7nPPhxd
   YRjPDfyCx+XFSSPiJ9eER/MsxE0Z/JISxfat5uXe2icf8i3AHowh7pO+i
   H8+1DLOqOpUwnX+pbDdFp8oI4RneWs6No24YMwGnGdebbPBQd/hrQyVPO
   tXFJiHIQjq9q/EBdF4U6FZOHthZoMMjcLBygwupynk34oSOQOymlncEkw
   Q==;
IronPort-SDR: eO0VaeC9ETSK4RUxPVJ6hvhKlf4R9sXl/xz85+6HH4JKkzPn7x5hPuxXhJpLIjwsUdBUI7yWXY
 1ZhuMDHStvzdgd5/utFCVvI48YIfOOUiUwUkSB22McRhC/ZcQgQnmEGhXqj+NtiQtK+k9ifhFn
 s0Ojt3mBhUOo+I6Cs1+shGde4Q+oJIYs0RBlKMKd4HRWm2aTBdgqM9mBiBF8X+Ap9pNJZHGuwQ
 Iy75+CTvQpA8icl0l0M0voGKL2TmiXWQELyjn2vi+itf3NPKvfpVAnbmjyngj2ohER1uDaxB+v
 pW4=
X-IronPort-AV: E=Sophos;i="5.79,365,1602518400"; 
   d="scan'208";a="158027685"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 22 Jan 2021 05:45:13 +0800
IronPort-SDR: MH4HEi/zSliT4qFiCcUwo1iTcQDZuAaZ1dpPbjZolBE30ALBg7A6usmnZttz1daqmEPwYxg1GA
 DG1IhzrTvT1yiA/FCeCBCL+cIHd3Kj2Hosg8OSTgwSIRoKxLJKvBYD1v6/k1Gu0nHyIf2yQo4G
 q2R/+SHwm6TOTBb3OwLAtUW58msh1PAMNbQ5gT6Tbvcic+5VSAx+aOlB1mbsyQtKlrHaTiLWL2
 Kwa6b7LJ/O741vWYw7VcK1i/SjA75H6FEnEzlZqAjgY8mddVryLD5Z0RbfuGxtHKQZ5vyjRbVi
 KbNJ/W5ZdxIHd9Gfua1oULbR
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 13:29:47 -0800
IronPort-SDR: /X6PYMCQMXU+PfRiomOgLJtm/iJt3usOhbsRghbsfkHllxX7g+AZe+n7ju3nSS18/7To1hqmWG
 4fX7mDX5irXuI4HlNydqBGvVowSmly9gCuDML9YyydWM8JJhhxYPhGJw7MsCrIj16jNSeYFjIV
 Nq7KyYPlFpvbTtxfq1ysr4ZoEn4p7yo5qz8qFUYRZEvHlJE2ID1tVXsy/BU31TeiEk7HYr2kxD
 rDA9GG7/jSt9ID3x4j2kITr4sUmixvz2ERebRKSZIxR9xqlQbIMgm7Xj4ilAT/KJFHqA7KXiml
 YGM=
WDCIronportException: Internal
Received: from jpf004744.ad.shared (HELO risc6-mainframe.hgst.com) ([10.86.63.63])
  by uls-op-cesaip01.wdc.com with ESMTP; 21 Jan 2021 13:45:13 -0800
From: "Alistair Francis" <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] opensbi: Bump from 0.8 to 0.9
Date: Thu, 21 Jan 2021 13:45:08 -0800
Message-Id: <20210121214508.1512242-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-bsp/opensbi/{opensbi_0.8.bb => opensbi_0.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/opensbi/{opensbi_0.8.bb => opensbi_0.9.bb} (97%)

diff --git a/meta/recipes-bsp/opensbi/opensbi_0.8.bb b/meta/recipes-bsp/opensbi/opensbi_0.9.bb
similarity index 97%
rename from meta/recipes-bsp/opensbi/opensbi_0.8.bb
rename to meta/recipes-bsp/opensbi/opensbi_0.9.bb
index 818efac733..9f17258edb 100644
--- a/meta/recipes-bsp/opensbi/opensbi_0.8.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_0.9.bb
@@ -7,7 +7,7 @@ require opensbi-payloads.inc
 
 inherit autotools-brokensep deploy
 
-SRCREV = "a98258d0b537a295f517bbc8d813007336731fa9"
+SRCREV = "234ed8e427f4d92903123199f6590d144e0d9351"
 SRC_URI = "git://github.com/riscv/opensbi.git;branch=master \
            file://0001-Makefile-Don-t-specify-mabi-or-march.patch \
           "
-- 
2.29.2

