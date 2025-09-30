Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4803BCAC5B8
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 06:51:38 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.19120.1759215097672787610
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 23:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=iaFg1ukl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: kavinaya@qti.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HM3i012433
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 06:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YLXVMHGulqpxRiWLZ+FJFL
	s5aWlMOUnV2tFqxUnrMPw=; b=iaFg1ukldhCUbn4qIE5vtpBP8NSC0bV9T3psQz
	8P05++rfN2xDJyQbS+/XqMyFLxXaZCLojIRXrg89ucdzrm/UTpHvVjpMugqYCabz
	6aqFOu1sElAnKqnqg2HKf5jyF6fr/zDwJaNWDzwUF0IzizF+6emmx1jwQc4mbXik
	7tud8VsMU9BeyxKjmYrK42IgM8PHe8DxxsH7wCC19Pz4tt5J4o/w55uwYbhvWTDl
	nPQy0oIr0RLRVT35Lizfo8L3e4c8P5BYP5gxq+b90YglJeKMVkbROd4KuMyF3/uW
	rVXgu3hcPkObiFIqvL4C0dH8DWNb02LcvbKG9bdqdwseDytA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a5yxun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 06:51:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58U6pZJg000505
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 06:51:35 GMT
Received: from hu-kavinaya-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 29 Sep 2025 23:51:34 -0700
From: Kavinaya S <kavinaya@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kavinaya S <kavinaya@qti.qualcomm.com>
Subject: [PATCH v4 0/1] Add support for custom compatible string via optional parameter
Date: Tue, 30 Sep 2025 12:21:16 +0530
Message-ID: <20250930065117.2625998-1-kavinaya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68db7df8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=jPrQqdRHPBW417H5_hAA:9
X-Proofpoint-GUID: jTgArFSNFRPizF9UR204OPqig48YI_LY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX3ZvBSUi5mHZi
 6sMc6rUv2IuNrw0SKVD7Pz6dsW4A0/MyN3yJbcse1QjWLfcRnQw9EQ76TX84PTxJyShfuTNI/6T
 yUkIYIm80LjfMBtIdtj4cT4VorIjar4OtE2z13nw0I/7PQed254Vx3QHepLNqA93Q4QI8rI4lqE
 5q3ttPZ8OWdWRSQBIVNx/6bz6IslKxgB3R6B1cKV24p1mWArzACjzt9cAgAlOCAyPp/3/zJHHZO
 G+GyO6LEDu/lj/nMlEn9rTkw9cDSNRrg6CWKc/wMecZ2H0YuCaEwGDgqzfIAOuLHdWaz6Qsezb2
 m/nj5RS8XCD+4gOk1Yt4WkA9dx+gOaw3xI0VzXKfi6xnbatfk5xDRbE9lnWqSFVpYqzaTDoJNGz
 O0ZboeBzljIXXOGSuyyuYxMmJhzlgA==
X-Proofpoint-ORIG-GUID: jTgArFSNFRPizF9UR204OPqig48YI_LY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 06:51:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224174

This update adds flexibility to FIT image generation by introducing
an optional mechanism to override the DTB compatible string.
Instead of always extracting the value from the DTB, the generator
can now use a custom string defined in build metadata. This is
particularly useful when the FIT configuration requires a different
compatible value than what is embedded in the DTB.

Key changes:
Adds a custom_compatible parameter to fitimage_emit_section_dtb().
Preserves existing behavior when no override is specified.

Usage:
To override the default behavior, define in machine configuration
or local.conf:
FIT_DTB_COMPATIBLE_OVERRIDE_<dtb-filename.dtb> = "custom-compatible-string"

This method avoids using custom ITS files, keeps the build process
consistent, and makes it easy to understand and track changes.

Kavinaya S (1):
  fitimage: Add support for custom compatible string via optional
    parameter

 meta/classes-recipe/kernel-fit-image.bbclass |  3 ++-
 meta/conf/image-fitimage.conf                |  6 ++++++
 meta/lib/oe/fitimage.py                      | 12 +++++++++---
 meta/lib/oeqa/selftest/cases/fitimage.py     |  8 ++++++++
 4 files changed, 25 insertions(+), 4 deletions(-)

-- 
2.34.1


