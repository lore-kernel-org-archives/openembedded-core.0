Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.635.1588372372899430857
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 15:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=xDNrjkqx;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 1454F60133;
	Sat,  2 May 2020 00:32:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1588372370;
	bh=L8oTtQTc2MuVPgcU8fpzwDvqfYVjsD/3ufKb06DRuys=;
	h=From:To:Cc:Subject:Date:From;
	b=xDNrjkqxAtVXxlnhL8cPA+JlPJ9+4KLMsmwbl5DH/dfjxEeSkHfSpiTzrmYOgBgb7
	 al937M0tK5EN74fgXtzmN/59h13i6LXByv8w2qzlr4nesfbDaKGYGTN+LPrF/q+UDC
	 JcWoEDCFZuTb7ULfINEubLcDRwP38SgdIvupH8eB5eXzCDfQnCRBDaGP/GNJm/1R+m
	 p6owfBzFzdsWnktORNbFAXn6eiNHPcGQKNxtVcNVk8d8/GnGIdCvT2eeht4SQd8cMU
	 PqAjeGWcVfx8NtZDJGqm1zc0/AOY2rZfSba9cV06gRzBaqiYYLAVOdeAslBgYAHHJZ
	 AEGYDATw9++vA==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH] timezone: upgrade 2019c -> 2020a
Date: Sat,  2 May 2020 00:32:46 +0200
Message-Id: <1588372366-7791-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog https://github.com/eggert/tz/blob/master/NEWS#L11

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta/recipes-extended/timezone/timezone.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 91a5cb3..32723f3 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2019c"
+PV = "2020a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,7 +14,7 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "195a17454c5db05cab96595380650391"
-SRC_URI[tzcode.sha256sum] = "f6ebd3668e02d5ed223d3b7b1947561bf2d2da2f4bd1db61efefd9e06c167ed4"
-SRC_URI[tzdata.md5sum] = "f6987e6dfdb2eb83a1b5076a50b80894"
-SRC_URI[tzdata.sha256sum] = "79c7806dab09072308da0e3d22c37d3b245015a591891ea147d3b133b60ffc7c"
+SRC_URI[tzcode.md5sum] = "f87c3477e85a5c4b00df0def6c6a0055"
+SRC_URI[tzcode.sha256sum] = "7d2af7120ee03df71fbca24031ccaf42404752e639196fe93c79a41b38a6d669"
+SRC_URI[tzdata.md5sum] = "96a985bb8eeab535fb8aa2132296763a"
+SRC_URI[tzdata.sha256sum] = "547161eca24d344e0b5f96aff6a76b454da295dc14ed4ca50c2355043fb899a2"
-- 
2.7.4

