Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web10.6082.1588679757624080048
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 04:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=p5ROGsoi;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=3877ea1dc=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588679757; x=1620215757;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3JYV+JZ7NdDFLILzkLtf2ElqWyrdvObvp9cl17MHqH4=;
  b=p5ROGsoivhNBXfoEHyuMfKceqs3VLFlPEfN/lvH2SqMP5S9BRHGOdW3k
   pbdERaCYh/SWc0G8uL3LzPe6fej6vIfzFlAsffWcMZwhaOUmuqbxyzYs1
   a2hLwIckhVE2r7FRj44DnS1Fehcz08xmOsQJdl3Z4NTz3xMtg0wJQZ3P+
   7DCCrfNhfIoSOxt3ZxQFNICTNJlossPfnMMf92boghYSxNdE3g+rE9KtY
   VAXwG3C2M+B6JRFpYpqUO3x7YpfX+qNqvDatrnWmkuhf0wzTZ8VkWWvny
   SqPvlpFQn0QWklnM1IaoPVsQU/LattvZJVtFogU988AO41N/DTctw6SNO
   A==;
IronPort-SDR: r5v4VFrALu65/Wi1Ryr2dBT5kb3j7VaybLjThFFEDvkmNC5iF6PQ+s0OxV39wmfNq62svKRUFM
 kBWzZephcfGJl0/Zon+RJ7mWfTFmtXP3BVDnRQ/UWkT9BhVNK00U035ohDWk0lMXpJWK81fN72
 xQn6Puu2MU4PyEVka3dNVKWqwKrM3+bEl/GMw6weuTBCQmg2Hj4HG9tkyNuPLBocJ83w8KCYan
 MdmXSRsr2PAJgXpdDC7NoRI27dzGWHSMQ84WpQLI+DreV9AxmPKqzi20GC/LvQGMcSmYvulZwJ
 oyA=
X-IronPort-AV: E=Sophos;i="5.73,354,1583190000"; 
   d="scan'208";a="2575018"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-core@lists.openembedded.org>
CC: Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH] dtc: update to 1.6.0
Date: Tue, 5 May 2020 13:55:35 +0200
Message-ID: <20200505115535.141557-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This also fixes issues with gcc 10's default change to "-fno-common".

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 meta/recipes-kernel/dtc/{dtc_1.5.1.bb => dtc_1.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/dtc/{dtc_1.5.1.bb => dtc_1.6.0.bb} (81%)

diff --git a/meta/recipes-kernel/dtc/dtc_1.5.1.bb b/meta/recipes-kernel/dtc/dtc_1.6.0.bb
similarity index 81%
rename from meta/recipes-kernel/dtc/dtc_1.5.1.bb
rename to meta/recipes-kernel/dtc/dtc_1.6.0.bb
index 9df8a06d47..2dbda4fb0d 100644
--- a/meta/recipes-kernel/dtc/dtc_1.5.1.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.6.0.bb
@@ -3,7 +3,7 @@ require dtc.inc
 LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 		    file://libfdt/libfdt.h;beginline=4;endline=7;md5=05bb357cfb75cae7d2b01d2ee8d76407"
 
-SRCREV = "60e0db3d65a1218b0d5a29474e769f28a18e3ca6"
+SRCREV = "v${PV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

