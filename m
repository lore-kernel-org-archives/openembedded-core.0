Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1113.1607541679248148394
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Dec 2020 11:21:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fA1abiMi;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B9JLHWf078072;
	Wed, 9 Dec 2020 13:21:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607541677;
	bh=jefTKcltpapiagrJQQNYmc/ffRKlVz+VLzosweWc3Yw=;
	h=From:To:CC:Subject:Date;
	b=fA1abiMioLmjsScU/kwfKW9J5P37iH2Yd1BwOjzOsNbobYuQQVA9oEPO7hF8grmCt
	 1RU3pdTsdS3MysrXFkfah3DyKvYbc+HreHILOw/TUCcGzJLQ6bM39mHIknR05ip2z2
	 DpvLzkTr+Fy0y/OWdXUy/WDLwoNftSDGr/Q07vDA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B9JLH86079906
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Dec 2020 13:21:17 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 9 Dec
 2020 13:21:17 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 9 Dec 2020 13:21:17 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B9JLHUd117071;
	Wed, 9 Dec 2020 13:21:17 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <richard.purdie@linuxfoundation.org>,
        <openembedded-core@lists.openembedded.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell] [PATCH 1/2] lz4: Use the new branch naming from upstream
Date: Wed, 9 Dec 2020 13:21:10 -0600
Message-ID: <20201209192111.21817-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Upstream renamed master -> dev, update SRC_URI to match.

[YOCTO #14135]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 meta/recipes-support/lz4/lz4_1.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.2.bb
index 6510156ed0c9..455d2a5141f0 100644
--- a/meta/recipes-support/lz4/lz4_1.9.2.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
@@ -11,7 +11,7 @@ PE = "1"
 
 SRCREV = "fdf2ef5809ca875c454510610764d9125ef2ebbd"
 
-SRC_URI = "git://github.com/lz4/lz4.git \
+SRC_URI = "git://github.com/lz4/lz4.git;branch=dev \
            file://run-ptest \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-- 
2.29.2

