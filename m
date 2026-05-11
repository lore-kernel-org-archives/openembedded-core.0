Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8475CCD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 06:16:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43748.1778480195718657022
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 May 2026 23:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Bnsc3lYv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9591b8f324=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5U23q3062461
	for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 06:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=gTVWMTbsHh1ReW8Zi9Jm
	lTwn7r+oVVPi9jrkPxSgtRg=; b=Bnsc3lYvePjR+g0zAnp/aVlZq+ad6Z8Fu+4w
	f6bTh7LG59YDzr0hTmQo44uwSLh00VuvHQxfydVoQvWMwff9xVaqSvwTeVDU65m8
	319CEf1Ke8dIq21pKt7ixFVNetgIxbtQaDa1elZkfvdyRmh0+9DrcE1rmRFCu4cs
	Og16fMvEElUK7hkJkHvWZgxYhteMvaB9Q8dy8SLam1ePOFucpo4Ejf7lRxS00SJ0
	NLRTk+ZFWHjLVR5Pn+d/XRufojI4krc9KpNMV5lRmViV49lusniHjdT+Gr0iLkDh
	mSB//Gk/f2J2kucBc2sBrbNseKMmu0GbJ5MqsL7ss/ud8Wm4Kw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1uw6hm18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 06:16:34 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 10 May 2026 23:16:33 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 10 May 2026 23:16:32 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] libxml2: fix CVE id in CVE-2026-0990.patch
Date: Mon, 11 May 2026 14:16:30 +0800
Message-ID: <20260511061630.1696436-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA2NiBTYWx0ZWRfX3vYqjPi1vj3A
 wX1SES6zCGHjLvEc1XJfsGA2iJPe/BJus0R5LLKZscrmqRbkUEOSrHzQi451uhjmbHPUX/MkiTt
 NAgAAL/+/rDwVsTcD92af6c17udyhwqzj8inbDfQTkIrUGySvYh7LVbHB9Sr3nvEPrHayxhzPtv
 1sqiGIK5pN1Xl4f+oF0XL5Woalrqwaqmb09Hl2xcBmYf/01LqOf+L54h3ZzX9Q75QXj0oRcjeVw
 Jn/SxFbWUwoMnSSJTNx7TRLSwlfiIHSMQJW3ad8aZmO4p+HEW5h/Sjs02kfvwLfD1KLglfEfe5m
 eccayrkKy/NQMQYjBG9mEx2Kc9IUqRpMUvFKe6URW1LtW470nejyf1TnAy3UMhvIgGSu9SGe7Ai
 KsH7HC5Hgc47/YrrYWVlJPxYhatJTHnI6EZUmOe4PA7eyAUJIdzFQOU7vZEga5Y1LA6Ackrtqhm
 61vQ1IBoNfKOc/rj7mg==
X-Authority-Analysis: v=2.4 cv=d6nFDxjE c=1 sm=1 tr=0 ts=6a017442 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=a_U1oVfrAAAA:8
 a=qYx7bVSug6J65hSlHoAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 6IoTOSs0_mePFR5YXZZeOyC3sVFKuIRz
X-Proofpoint-ORIG-GUID: 6IoTOSs0_mePFR5YXZZeOyC3sVFKuIRz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 06:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236777

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
index e0c1e3c707..f04b3739c4 100644
--- a/meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] catalog: prevent inf recursion in xmlCatalogXMLResolveURI
 
 Fix https://gitlab.gnome.org/GNOME/libxml2/-/issues/1018
 
-CVE: CVE-2026-0989
+CVE: CVE-2026-0990
 Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/1961208e958ca22f80a0b4e4c9d71cfa050aa982]
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---
-- 
2.34.1


