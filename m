Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB3DF532CB
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 03:29:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12158.1774322993681805034
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 20:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qfdGLlUQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7543d56b91=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O2kBDu1875388
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 20:29:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=vdMPtdH8iIAKVv3w2hG6
	C9HTkxTpd1DGWUT31ga4DG8=; b=qfdGLlUQDaBKftblgwknuJInJguHo7AW0R8U
	6FSkuMFWlDAmtYHBlHp0saCXGkWWyF6fipQLzvSov3dK6yHkY9vdPFzZVbIni7ZO
	wqA6D3XGi0hwtsVCq72Yqipg96sSJHOroUpoGVNwjA6Mjaof1qbTyoDugB7FeZDI
	TckuwImjtMUKNa0MBJ+hMVQJcf0BhlKvkpILWOtBxCjpCFKo9mr9MHU0XPHQu0sP
	2+HA4tTpY/nZ0KJOdHuOUw0UMFH4xNimjdoxVZQ/iVnUiLb5Jt6AWddlW4twSgXj
	l68K86gJxTBCvsDNcaTSZn0cP5kuf7GDeqHD79d7qTKql/C3Zg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1tuctgbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 20:29:53 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 23 Mar 2026 20:29:52 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 23 Mar 2026 20:29:52 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] tzdata/tzcode-native: upgrade 2025c -> 2026a
Date: Tue, 24 Mar 2026 11:29:51 +0800
Message-ID: <20260324032951.2617270-1-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 1oBLx0UrKNbvGfrITKQljpoEkBoYEILP
X-Proofpoint-ORIG-GUID: 1oBLx0UrKNbvGfrITKQljpoEkBoYEILP
X-Authority-Analysis: v=2.4 cv=deCNHHXe c=1 sm=1 tr=0 ts=69c20531 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=I0CVDw5ZAAAA:8 a=t7CeM3EgAAAA:8
 a=iZHUemEkkY5Qf-xOW0sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAyNiBTYWx0ZWRfX7sCzmdtF6HOj
 Iky1nHqJOwCwFZoH5fU9pqFU0MKWt2kz+VUDgZWQ4AI4Fl8bMfomozP8CjCw+O0CtNyDi443XTc
 Tvxv1NIo0+wBJA+iklQ6noenTp7Mry9+bgdGufOV2xkyzAWlen3UFTaOfETKd7H3DyaHMfC8Gjd
 AWo95+RKGGFz6pmHM+qV6UI2UV4mlrGKLqT3Cpsiq91QOBHsHKYAOAyCyrBkdbJcHvwKOOJS4bQ
 u5h/ihpGN7gGRZYLcgVmRJAJzbCGrzGQ6RRdsD2yk0aMNGBjtx/DH0oc9HuRSUQE/IpPG7vO8iu
 +guz1G9b4CHqPqcR9g9orkbgF0eFWRNbGxRcESe04Pt9U7obTys5DOxvqGO1nlv6Ni7OHdOG3gz
 YqLsworMp0F62hx1CLM9LIT12aIFqlR1Sp2CP+Rf49ph+QnTtFvK1yY2okl0aQ+YZbFVlPpDTME
 SKXb3II290GfaDpVYKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 03:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233772

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index b9323432b8..00bb704e36 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025c"
+PV = "2026a"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${UNPACKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
-SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"
+SRC_URI[tzcode.sha256sum] = "f80a17a2eddd2b54041f9c98d75b0aa8038b016d7c5de72892a146d9938740e1"
+SRC_URI[tzdata.sha256sum] = "77b541725937bb53bd92bd484c0b43bec8545e2d3431ee01f04ef8f2203ba2b7"
-- 
2.34.1


