Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEDE7C7115B
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 06:05:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1481.1750399536588169934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 23:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=826695628c=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K4WuCM007433;
	Fri, 20 Jun 2025 06:05:30 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47c83x1dy3-11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Jun 2025 06:05:30 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 19 Jun 2025 23:05:29 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 19 Jun 2025 23:05:26 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>,
        Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [oe-core][walnascar][PATCH 3/3] bind: upgrade 9.20.8 -> 9.20.9
Date: Fri, 20 Jun 2025 11:35:11 +0530
Message-ID: <20250620060511.809534-3-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250620060511.809534-1-praveen.kumar@windriver.com>
References: <20250620060511.809534-1-praveen.kumar@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: P0kukwIwIlrbeoLjcs8guFtwA-25Jnll
X-Authority-Analysis: v=2.4 cv=cuabk04i c=1 sm=1 tr=0 ts=6854fa2a cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=SCo1hh1FAAAA:8 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=Yams_aVIXhoTVnqRneMA:9
 a=6dmPcGKlaI8A:10 a=jjiDOD437DYA:10 a=nwb-CePKZZm3gL-ai9HY:22 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: P0kukwIwIlrbeoLjcs8guFtwA-25Jnll
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA0NCBTYWx0ZWRfX+7nWgnzPqfjZ cUkshyvgWoF923Vk18j0tz5dbFJ7TvvhFqzuwKyvfTmR2ThfJ78ub9Qy4fX2pLIpD/19/W/UCFI mh13MLbxPs3LkXo7cxVKSZaKOLjrJVkru48FGfbffemW4/NSV/zFFBlNHHundIupejYLtFiMhrw
 mb8LH5ygpJOqW7qZnGesNRi6D+SJEYoM9uUpCSXUkS5AOsFPE5/LtwzisKZvQBmpvt74WfQxBdb tcg3toAmn3/Lq/ZaaAvoCmHAZ6Nzg8+0hDnuZ4kZ6D34lv8om+6m2ySgVmVKCF22MkzGeuWe7hr 1/BcuS2v5WstdOZJZZeiXGoNCDS/q2LshrIXuySrK7u5/z5V2DrU5uq53IP+68FPxRCBx4ac9yy
 R3OWdjTh7XPPPF/P3vPXLcC+gUY1WASTWep4iNqj6Ve5LW2l9o4iWi0Tin/bkSzfowPxM3RZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506200044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 06:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219099

Overview of changes in bind 9.20.9
==================================
Security Fixes:
1. Prevent an assertion failure when processing TSIG algorithm.
2. DNS messages that included a Transaction Signature (TSIG) containing
   an invalid value in the algorithm field caused named to crash with an
   assertion failure. This has been fixed. (CVE-2025-40775) [GL #5300]

For additional feature changes and bug fixes, please see:
https://downloads.isc.org/isc/bind9/9.20.9/doc/arm/html/notes.html#notes-for-bind-9-20-9

(From OE-Core rev: c9d59ba50a102ace907779612e74646dec133271)

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../bind/{bind_9.20.8.bb => bind_9.20.9.bb}                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.8.bb => bind_9.20.9.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.8.bb b/meta/recipes-connectivity/bind/bind_9.20.9.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.8.bb
rename to meta/recipes-connectivity/bind/bind_9.20.9.bb
index 864daed97e..93ff957fc5 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.8.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.9.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "3004d99c476beab49a986c2d49f902e2cd7766c9ab18b261e8b353cabf3a04b5"
+SRC_URI[sha256sum] = "3d26900ed9c9a859073ffea9b97e292c1248dad18279b17b05fcb23c3091f86d"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.40.0


