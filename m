Return-Path: <quic_bpothuno@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E163EC282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 10:00:11 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.9306.1741255207653006625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 02:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=EjsLG4tF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: bpothuno@qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52618jvK006820
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Mar 2025 10:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jlIBztx2E3qsehz+Iy3pd5TyqXiyqKUzQjd
	QLOuv9rc=; b=EjsLG4tFeQxMnhb3m0DktgI97swhbjp7q1ThLH4JByAuC0B4OPB
	LHeYEzBXlhMZMa9nvvyE2EgyWoQja980YkAi5N1uiSdkXCBsrrJacghiYWjiyhjZ
	fzWgI/z3Uljd6V6q5Hr8rpVo6VCI6BUmkqtgTIIV2ZQ3GRW+jeywaORC6ylFAjgT
	qDCbJxF2NN6T8LOqbBA3xfGlnCtq5JNjtG7TmINyGEBIjxhIG/XKuvpdv5bKpub6
	/+C+R3exprcVvc3RhNSWZ8Za6j7hKWDFsxe5+ltLKZPCAqEwJnZq7MlCV2Vd9g90
	1Zh0zy4+VS4pHJDbQNZbc2ukqYpmbGisH3A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4571sd98q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 10:00:07 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 526A038C001377
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Mar 2025 10:00:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 453uamng17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 10:00:03 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 526A03SR001363
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Mar 2025 10:00:03 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.93])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 526A02FT001350
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 10:00:03 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 460767)
	id 3949356F; Thu,  6 Mar 2025 15:30:02 +0530 (+0530)
From: Balaji Pothunoori <quic_bpothuno@quicinc.com>
To: openembedded-core@lists.openembedded.org
Cc: Balaji Pothunoori <quic_bpothuno@quicinc.com>
Subject: [PATCH] dhcpcd: upgrade 10.1.0 -> 10.2.2
Date: Thu,  6 Mar 2025 15:29:47 +0530
Message-Id: <20250306095947.2681969-1-quic_bpothuno@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: akanJsOyn2NFy5fSByIH4cg5W-1gub61
X-Authority-Analysis: v=2.4 cv=W6PCVQWk c=1 sm=1 tr=0 ts=67c97227 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=Pm3Ii0ycAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8 a=QFtB4FFVfBaHzDooPqsA:9 a=-FEs8UIgK8oA:10
 a=Lb0xad9IhAkqXp0dotAK:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: akanJsOyn2NFy5fSByIH4cg5W-1gub61
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_04,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 mlxlogscore=590 adultscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 10:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212378

Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
---
 .../dhcpcd/{dhcpcd_10.1.0.bb => dhcpcd_10.2.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.1.0.bb => dhcpcd_10.2.2.bb} (94%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.2.bb
similarity index 94%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.2.bb
index 3f806bb18783..0b4345e7fa4a 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.2.2.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "dhcpcd runs on your machine and silently configures your \
 HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d296c4bec306f351e676705aaf237c8c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4dda5beb433a809f2e0aeffbf9da3d91"
 
 SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=master \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "57c3506a5622e199cf0e3fc1ef26a71cdedc9521"
+SRCREV = "f6983c18dbf7989f43a2838beeaf62a54c53ff1d"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd

