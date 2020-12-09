Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.1109.1607541684897182057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Dec 2020 11:21:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=bMlQH2Yd;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B9JLNOT078109;
	Wed, 9 Dec 2020 13:21:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607541683;
	bh=DRJr4U9thHsAlBE17k+J/RJnj8Cetcstq2sMAOasufo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bMlQH2YdTxLXsgSQuuO2AKB+QaioSIoW+WndPadvOnc5lqIFWd+zlktj4F4C+iOM6
	 Mf9nimqe4n68HqoytjVfW6dkWATVUcVbysvGyTDhbYuMgFssLhtwjc0pI+0YvHzRA0
	 yvzuNsojlPDn/cR4bfQV+8mq5Uz8n+rE/nfiJw/c=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B9JLNEq079981
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Dec 2020 13:21:23 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 9 Dec
 2020 13:21:22 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 9 Dec 2020 13:21:22 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B9JLMBf040922;
	Wed, 9 Dec 2020 13:21:22 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <richard.purdie@linuxfoundation.org>,
        <openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex.kanavin@gmail.com>, Dan Murphy <dmurphy@ti.com>
Subject: [dunfell] [PATCH 2/2] lz4: upgrade 1.9.2 -> 1.9.3
Date: Wed, 9 Dec 2020 13:21:11 -0600
Message-ID: <20201209192111.21817-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201209192111.21817-1-dmurphy@ti.com>
References: <20201209192111.21817-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 meta/recipes-support/lz4/{lz4_1.9.2.bb => lz4_1.9.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/lz4/{lz4_1.9.2.bb => lz4_1.9.3.bb} (90%)

diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.3.bb
similarity index 90%
rename from meta/recipes-support/lz4/lz4_1.9.2.bb
rename to meta/recipes-support/lz4/lz4_1.9.3.bb
index 455d2a5141f0..00f2dd32fedd 100644
--- a/meta/recipes-support/lz4/lz4_1.9.2.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.3.bb
@@ -9,9 +9,9 @@ LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=ebc2ea4814a64de7708f1571904b32cc \
 
 PE = "1"
 
-SRCREV = "fdf2ef5809ca875c454510610764d9125ef2ebbd"
+SRCREV = "d44371841a2f1728a3f36839fd4b7e872d0927d3"
 
-SRC_URI = "git://github.com/lz4/lz4.git;branch=dev \
+SRC_URI = "git://github.com/lz4/lz4.git;branch=release \
            file://run-ptest \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-- 
2.29.2

