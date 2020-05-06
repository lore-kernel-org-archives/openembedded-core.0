Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web10.3788.1588761957352647731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 03:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=hUY31VHp;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=388eec6a1=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588761957; x=1620297957;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vDIZEzPC6yvRWvLmHlDhnEGM7NJ4+EkaZson0Rm5ofk=;
  b=hUY31VHpSlpNlpMPAg1SbG/yAKJyGLkbMa2dnxOmutmHFaSTbhCe97kT
   yHNK2H6B3HfalnInrezgfJBIbsGhWd1VNoVNKBNeTv/xcP5c4SLHFbW+S
   PRcO8C9GZ8JQaNIib0RVCd4RymhdITqLLFOzf+xAiDkZtn/zvdtBUXp2w
   DUdcOyjvErXuhXJ0oCLrLDc5y7knAeqZTm7cWs/W8s7Ttjt+0sl8oYTT/
   bQjL2ESS/SsGknkxeUj3CDRTAuJjgKKYcBlPF5NtJlX4o1+5/5BBouexn
   0ljHuC0P+u1u4no8OYrkwgbrL6Quoo5ZASgTxzITVUBkaAihMF48xdbNZ
   A==;
IronPort-SDR: +vRtcm/WncfE9HL+HuwHM7FA4AjV1O2YPyU97O2dAGVv6sTNS4TkvYaXSjoYiqBI1UiOD84LAj
 Mk7OwhXDhYggdgJFQZfIO2LT4LN6oJLIa/5otBkdWglObu2YecqdAm4mUcRr24/oLwQ3mB5Chu
 AIapUlQDIyvmMvpUXQYTW/qZw71K9kOSiZkkciUy5rwf0nyFEdJkDHKppUTqubLeJIBpNHCCeQ
 h9ASZhu+6l5U8BXXvWao1raaaj0hYQcTFu5V8/Q3Skb0j2Cv/5Lcr2QANXNqZoQC2IA3uX6lck
 5+A=
X-IronPort-AV: E=Sophos;i="5.73,358,1583190000"; 
   d="scan'208";a="24188797"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-core@lists.openembedded.org>
CC: <bunk@stusta.de>, <richard.purdie@linuxfoundation.org>, Richard Leitner
	<richard.leitner@skidata.com>
Subject: [PATCH v2] dtc: update to 1.6.0
Date: Wed, 6 May 2020 12:45:38 +0200
Message-ID: <20200506104538.2951363-1-richard.leitner@skidata.com>
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
Changes v2:
 + use commit id instead of tag name for SRCREV as suggested by Adrian
   Bunk
---
 meta/recipes-kernel/dtc/{dtc_1.5.1.bb => dtc_1.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/dtc/{dtc_1.5.1.bb => dtc_1.6.0.bb} (81%)

diff --git a/meta/recipes-kernel/dtc/dtc_1.5.1.bb b/meta/recipes-kernel/dtc/dtc_1.6.0.bb
similarity index 81%
rename from meta/recipes-kernel/dtc/dtc_1.5.1.bb
rename to meta/recipes-kernel/dtc/dtc_1.6.0.bb
index 9df8a06d47..0883fae640 100644
--- a/meta/recipes-kernel/dtc/dtc_1.5.1.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.6.0.bb
@@ -3,7 +3,7 @@ require dtc.inc
 LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 		    file://libfdt/libfdt.h;beginline=4;endline=7;md5=05bb357cfb75cae7d2b01d2ee8d76407"
 
-SRCREV = "60e0db3d65a1218b0d5a29474e769f28a18e3ca6"
+SRCREV = "2525da3dba9beceb96651dc2986581871dbeca30"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

