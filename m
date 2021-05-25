Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [91.207.212.93])
 by mx.groups.io with SMTP id smtpd.web12.11116.1621955835634028039
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 08:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foss.st.com header.s=selector1 header.b=ekNFx0bb;
 spf=pass (domain: foss.st.com, ip: 91.207.212.93, mailfrom: christophe.priouzeau@foss.st.com)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14PF7svR018039
	for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 17:17:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=PrvTgTFa+n9Q5A7RV4y37V5U5Mzj5dsUbNaY8kL1s58=;
 b=ekNFx0bb+dbt3Fe+8Yl6tRiBHOiqU5Z1tzFsA59HlhUxfYiq3hxcyF5xyCW/15HAPOwe
 Hd1RjPc9CPIaVMHa162mAi8L36HHrj40yG7bezIuh8e8ylg51n0+RmQwdmhll6JK04BZ
 zFPs8dBqOkWFd7o+PL9NVAR1sSg9KDUz/PGvy+9O5NJWxoszZ+3zma86v3IYC81PMf6m
 phx3ul2EthTddD25XvTMrEfnx1nchP3gPO14wAt9Y2Pf9AJeYIg7mRHnE0QHl2OveDN0
 DC0vYUnvTrksSQ4rFA+T/vwy+nCm873xxobHZuSRQR7u022t+FhucWPHA0Umb2iA8ULb EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 38ra6u0847-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 17:17:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1D1C1100034
	for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 17:17:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 15F3D230D0D
	for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 17:17:13 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 25 May 2021 17:17:12
 +0200
From: "cpriouzeau" <christophe.priouzeau@foss.st.com>
To: <openembedded-core@lists.openembedded.org>
CC: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Subject: [hardknott][PATCH 2/2] mesa: use python3targetconfig
Date: Tue, 25 May 2021 17:17:09 +0200
Message-ID: <20210525151709.522795-2-christophe.priouzeau@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525151709.522795-1-christophe.priouzeau@foss.st.com>
References: <20210525151709.522795-1-christophe.priouzeau@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-25_07:2021-05-25,2021-05-25 signatures=0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Meson request to have a valid python, meson-log indicate that
issue come from:
ModuleNotFoundError: No module named '_sysconfigdata'

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a85f94c75e..de39dc34e4 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -43,7 +43,7 @@ PROVIDES = " \
     virtual/mesa \
     "
 
-inherit meson pkgconfig python3native gettext features_check
+inherit meson pkgconfig python3native gettext features_check python3targetconfig
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1

