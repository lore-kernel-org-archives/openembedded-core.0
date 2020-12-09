Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.998.1607541287631146403
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Dec 2020 11:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OuIOSlFi;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B9JEibC076036;
	Wed, 9 Dec 2020 13:14:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607541284;
	bh=M+5jtVvlvdsB6bv480Yx5MviQrc5E7mHJ2PvU2qx8SM=;
	h=From:To:CC:Subject:Date;
	b=OuIOSlFieSqKKokIRuPS2GhZCd/VE66Lu7q6GaDv+Ajz+LX3PniROxpnZ3w1KCOWK
	 HlKj+FpMYOM82xhWwtFGn8bjN57nwO1/xjIIlkWhppqBUrSJbSfMjQq7+NRmhb3xHb
	 V71p5z1uegO58yXb+bl67CMlfFjhGlqSQla5I9Cw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B9JEi61032654
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Dec 2020 13:14:44 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 9 Dec
 2020 13:14:44 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 9 Dec 2020 13:14:44 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B9JEiHX110035;
	Wed, 9 Dec 2020 13:14:44 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
CC: "changqing.li@windriver.com" <changqing.li@windriver.com>,
        Dan Murphy
	<dmurphy@ti.com>
Subject: [dunfell] [PATCH] thin-provisioning-tools: switch branch from master to main
Date: Wed, 9 Dec 2020 13:14:38 -0600
Message-ID: <20201209191438.20673-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: "changqing.li@windriver.com" <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
index 9f89bac22ac9..3f82734acde2 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
@@ -7,7 +7,7 @@ SECTION = "devel"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://github.com/jthornber/thin-provisioning-tools \
+SRC_URI = "git://github.com/jthornber/thin-provisioning-tools;branch=main \
            file://0001-do-not-strip-pdata_tools-at-do_install.patch \
            file://use-sh-on-path.patch \
 "
-- 
2.29.2

