Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [91.207.212.93])
 by mx.groups.io with SMTP id smtpd.web10.11196.1621955471181564365
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 08:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foss.st.com header.s=selector1 header.b=gF5Yvf9e;
 spf=pass (domain: foss.st.com, ip: 91.207.212.93, mailfrom: christophe.priouzeau@foss.st.com)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14PF6qMX025104
	for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 17:11:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=q3z3F4JTN+5BSSIxp+ySA2MMIynVn7P00R71faH+Q3Y=;
 b=gF5Yvf9e8bUfFfOwWdva6wKa3RyOfhQwrQgcm4eWCDnd26VsalPBVOhOJTDIWIU+M+sL
 iwJvsJLonAHYi7r7Od09gyhTf+R0MjrZMm81zLI/5n+7IkRRMReAb/fsGfUdFRCudvbS
 wkyLvY8ToEIBElFQhrP4HvGvmUSqDs7bOGKWLDdtw4VB7IYDv8N8QvIXq3iYyKVk0xhC
 l8V9ItReNpX/Syg1yfaxNGkraMSmA86QOjwfKC0ikcvWBs6dI4B+xIopO8Usp1s8Kex1
 j3TEBTRAeikcgJlchOsBRlvXRTpCj1KmPa2dYz5vV21wvdcM1vukQAfcdsApeivgtpsK kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 38rqekcra7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 17:11:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 18C12100034
	for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 17:11:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0A2A422A66E
	for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 17:11:08 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 25 May 2021 17:11:07
 +0200
From: "cpriouzeau" <christophe.priouzeau@foss.st.com>
To: <openembedded-core@lists.openembedded.org>
CC: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Subject: [dunfell][PATCH 2/2] mesa: use python3targetconfig
Date: Tue, 25 May 2021 17:11:06 +0200
Message-ID: <20210525151106.522334-2-christophe.priouzeau@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525151106.522334-1-christophe.priouzeau@foss.st.com>
References: <20210525151106.522334-1-christophe.priouzeau@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
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
index a1bf878b1a..fe1c23070a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -24,7 +24,7 @@ PROVIDES = " \
     virtual/mesa \
     "
 
-inherit meson pkgconfig python3native gettext features_check
+inherit meson pkgconfig python3native gettext features_check python3targetconfig
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1

