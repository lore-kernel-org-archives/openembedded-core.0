Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14F4C71155
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 06:05:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1480.1750399529930042656
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 23:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=826695628c=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K5LDk0028771;
	Thu, 19 Jun 2025 23:05:25 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47c8729e2e-11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Jun 2025 23:05:24 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 19 Jun 2025 23:05:24 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 19 Jun 2025 23:05:22 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        Praveen Kumar
	<praveen.kumar@windriver.com>
Subject: [oe-core][walnascar][PATCH 2/3] bind: upgrade 9.20.7 -> 9.20.8
Date: Fri, 20 Jun 2025 11:35:10 +0530
Message-ID: <20250620060511.809534-2-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250620060511.809534-1-praveen.kumar@windriver.com>
References: <20250620060511.809534-1-praveen.kumar@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA0NCBTYWx0ZWRfXx9DUWEY/UOn/ fooQJOkKDOhcRTCBkplT5WGzgDBrzgkpG6Q2KsZZentxigPFEl9sp0PGMvZEPNwuYn1/YsgOqDN wNVddaZtkhAUGHKZ9TS5/HFJoZFRfhc89XANjVn9vR/dnekwpYIXfopxUthmc2DxTjdxcsmojsC
 MPYQ0HHoNAe1GXhaZWYQOjlaVrW052M3bwHv9Ka8i9JFi94utw3I222Ry08wSgwys7BhZi8HAN+ +Ik5G9WSGvgUungac54fo0Ccr2sJAe73tJMDGdSNleq13DRgfuBQW276dT2iiLpat/UE3LZ9gQW B+sgi8TlmuYkh3rkRpYMQ3JXYzSz3IueTr8kD3bSVbphfDv+vn9ADfpI3x5GR0rRaZW0BfHW7tN
 6RNMzfAV1LDOofdiKoV4xVUGyqJ6APmJxO2Fdl5xHRRQl8kF8yQqZYM/m044Q83fWnGG1hNd
X-Proofpoint-GUID: 15s0p9sfB-agNsZ_c9hp9KAXOt_jsr2o
X-Proofpoint-ORIG-GUID: 15s0p9sfB-agNsZ_c9hp9KAXOt_jsr2o
X-Authority-Analysis: v=2.4 cv=RpXFLDmK c=1 sm=1 tr=0 ts=6854fa24 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=SCo1hh1FAAAA:8 a=omOdbC7AAAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=fXuYZ1wJWn1zlZ85C1IA:9
 a=jjiDOD437DYA:10 a=nwb-CePKZZm3gL-ai9HY:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506200044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 06:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219098

From: Wang Mingyu <wangmy@fujitsu.com>

(From OE-Core rev: 670cb507b9125c152aa08702520f2d220c207c71)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../bind/{bind_9.20.7.bb => bind_9.20.8.bb}                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.7.bb => bind_9.20.8.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.7.bb b/meta/recipes-connectivity/bind/bind_9.20.8.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.7.bb
rename to meta/recipes-connectivity/bind/bind_9.20.8.bb
index b4202f1a59..864daed97e 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.7.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.8.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "43323c8d22d2144282c37b4060ec11e98c24835e225688876fad08ba7b95dca6"
+SRC_URI[sha256sum] = "3004d99c476beab49a986c2d49f902e2cd7766c9ab18b261e8b353cabf3a04b5"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.40.0


