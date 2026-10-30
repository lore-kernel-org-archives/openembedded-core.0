Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8094.1793354596084735366
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 03:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=N63yQRWS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: roshs@qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F2tb1120613;
	Fri, 30 Oct 2026 10:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/+ZxS7qwjbnb7VeR6FVzJYkY8oM1TLlTHXu
	o1L0cDUs=; b=N63yQRWS7wzQiw1xAjED58AQEiXociQ53cEYlKKiJVPrzVh9C1D
	UHhLQlPZSu2mizWeWaVmdVj7B4LIay06+CAx2MSR/BbFei0pyaWKn149b8IlB6pu
	ag+LKkF25I8krm4lKqMnXYgjebKF5EiloXJPZXM9/QnwIM2kIZ/BA0etbqHFPUW7
	Iy6+OsRoaiAYd2MS2+ITFN1zQAsXp5DAqG8EEpzcN+YtLbSBFLcdUHJYat+ZpT3+
	Tlxfi6G2JmWHhotmEjIRnpFNXQnmVwPCBRp8QO5Matw9vKpXWyvnxPeh4FHC7SDi
	hvbt68aBDWgdfc7AZE8MRZmZC9ZFKlM/cAw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pjbpg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 10:03:09 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69UA360B1094327;
	Fri, 30 Oct 2026 10:03:06 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-roshs-hyd.qualcomm.com [10.147.243.236])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69UA36qY1094316
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 10:03:06 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4086833)
	id 07CA5B85; Fri, 30 Oct 2026 15:33:05 +0530 (+0530)
From: Roshan Sivakumar <roshs@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
        Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        Sumanth Gavini <sumanth.gavini@windriver.com>,
        Roshan Sivakumar <roshs@qti.qualcomm.com>
Subject: [OE-core][PATCH] kernel-devsrc: add runtime dependency on sed
Date: Fri, 30 Oct 2026 15:32:14 +0530
Message-Id: <20261030100214.3111726-1-roshs@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOSBTYWx0ZWRfX+q/v0y7LYr0t
 NHCnKj816HWLOVj8Osfc1yVeOHWpfEyTT55eFYp7yb5GGCVhaWG0dZ6B0pFHBvQXumomdDsYwGo
 B7ZYnF2Ccr6jI6qwTUNZqMAmIYNZuTuGoUpzjjk+dMx+0U0KzJusoJKs6/P1Y6yEgS+JgC7pts2
 Ij9kVWQ5cx5yJ2H6gkWuisYGYl81RZCVv5wuX0NSBLd9wmfWMhJoNh5y+wm2jF8kC6LoTRlnkfW
 UItxLV43eLviA9aBXrhaHlA0e+eHBUz5N6EOGGyKPew7VNS3VNESSlRE0D0u2354URi/HEW7An8
 OVXvUL76GmZBlBqP/qjsk0D4jxyjbt+sGWGTbng5dVCZZ7b3Jy9EMld33BI+8Je0ekfwtZRH3Vp
 KtqYafyUAUyYFFxBLyEAf+9ndeFco0pBx9qYu5tRUR7q1XeubdqMwkrLGP+6KwoFPqDuqsk6JZL
 m6TE6+KxgElw/mihkig==
X-Proofpoint-ORIG-GUID: mbPTxODRX19vo2Al1Fl6Od3Knrrl7aZh
X-Proofpoint-GUID: mbPTxODRX19vo2Al1Fl6Od3Knrrl7aZh
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae46b5e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=kmQ_TYdsxPuzlLsWAZIA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOSBTYWx0ZWRfXzrwSq7F087gr
 VyPajSOOr4cmQ1lmfVBL2WdL9RdD4wrvry6WHOYWz+sZQPec+J0lGyd4bLW1fXFmJSEeKGuXvS+
 a+pjiYT+3FXCEns9/5bLBype1boA198=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249012
Content-Type: text/plain; charset="utf-8"

kernel-devsrc ships scripts/mksysmap, which is a sed script
(#!/bin/sed -f). The package therefore has a runtime dependency on
sed that was not declared.

Declare it explicitly in RDEPENDS, alongside the other interpreters
the kernel scripts need (bc, python3, flex, bison, gawk, ...), rather
than relying on the packaging backend to infer it from the shebang.

Assisted-by: Claude Code:claude-opus-4.8
Signed-off-by: Roshan Sivakumar <roshs@qti.qualcomm.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 90bdbfc534..92fd0e0c66 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -468,3 +468,5 @@ RDEPENDS:${PN} += "${@bb.utils.contains('ARCH', 'powerpc', 'elfutils-dev', '', d
 RDEPENDS:${PN} += "gcc-plugins libmpc-dev"
 # 5.13+ needs grep for powerpc
 RDEPENDS:${PN}:append:powerpc = " grep"
+# scripts/mksysmap is a #!/bin/sed -f script
+RDEPENDS:${PN} += "sed"
-- 
2.34.1

