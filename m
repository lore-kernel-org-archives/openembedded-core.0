Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83275C5B549
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 05:43:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14399.1748497377151987988
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 22:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82449a48d9=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T4tAXN011607
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 05:42:56 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u5394ya9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 05:42:55 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 28 May 2025 22:42:34 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 28 May 2025 22:42:31 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe-core][PATCH 1/1] bind: upgrade 9.20.8 -> 9.20.9
Date: Thu, 29 May 2025 11:12:45 +0530
Message-ID: <20250529054245.3466804-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA1NSBTYWx0ZWRfX6726BcJ8y2Uz 8Tk3OClF6KmVzEYjiwwi7WIqp/Ba5UADZnFf1rVXy0297JO4KNQ2P8sysvh5tz6ADeMZ4+bPvkb YYozGh26pEr853ROEjkT9Ua3AIn1I0wEAUG15yW2DaO4l5UUoad5UPUdHVfR0JJJASCudpn0DBH
 83mubvc9GnsTKnTqSejoiCRjapccroBDlftrJzJUcBWJ+LseHbxm6R5oKlRqW6lesP2hHD+xch6 rU4NeIWsdLVHoEagOSP3HNZk065zb4Hp7WKklCSP7lgdViC7pLQ+q5meuw1zeMkpmJPngniwYhf Sm5MC/Ix80JTgKBbgpxcAh+6kY/oWJlK1Xx8EkqepDaHnyxdhzHgf24vdnDSBXqMMqRReZSrbXM
 RXJ4OVvRmD8MNAfMu6cnMoX0zufP6kSescF76ZRsVvgdoxbyOpQLcqU9LtqnHqflTxqOsCii
X-Authority-Analysis: v=2.4 cv=NsDRc9dJ c=1 sm=1 tr=0 ts=6837f3e0 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=SCo1hh1FAAAA:8 a=t7CeM3EgAAAA:8 a=Yams_aVIXhoTVnqRneMA:9 a=6dmPcGKlaI8A:10 a=jjiDOD437DYA:10
 a=nwb-CePKZZm3gL-ai9HY:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: dZrjwNeHup9hanMU7L6TsJBCnKf8SXSC
X-Proofpoint-GUID: dZrjwNeHup9hanMU7L6TsJBCnKf8SXSC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_03,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505290055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 05:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217400

Overview of changes in bind 9.20.9
==================================
Security Fixes:
1. Prevent an assertion failure when processing TSIG algorithm.
2. DNS messages that included a Transaction Signature (TSIG) containing
   an invalid value in the algorithm field caused named to crash with an
   assertion failure. This has been fixed. (CVE-2025-40775) [GL #5300]

For additional feature changes and bug fixes, please see:
https://downloads.isc.org/isc/bind9/9.20.9/doc/arm/html/notes.html#notes-for-bind-9-20-9

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
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


