Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F10C83F0A
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 06:26:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6719.1751610383548653193
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 23:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9280fa9c81=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5644e3px002077
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Jul 2025 06:26:22 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j5m1eh8c-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 06:26:22 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 3 Jul 2025 23:25:24 -0700
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 3 Jul 2025 23:25:24 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] pseudo: 1.9.0 -> 1.9.2
Date: Thu, 3 Jul 2025 23:26:20 -0700
Message-ID: <6406a5728c94563eda60f3b77609d5635a4f6154.1751610337.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1751610337.git.liezhi.yang@windriver.com>
References: <cover.1751610337.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA0OCBTYWx0ZWRfX1geahCNS73mm dN5UvwwEhc3EVz+B3y+Vbv1OwZPBUlP5c2WdZmRlZMJI+pjq5Z/pQjdk+QNHk63fT2S3vEPU6mW EeUDt5vvK29pZVMy552dPRn1EVKH3O06iQs9TJxbkOcZ8IeiWTdvx9/h9kvPFImo3Ly2zCOhMTj
 24rrQoBT43pQfRT8xU2qISGMh+4wEPEH3q+FVBLam94PzzYA6R1X8WdVb4DsNJrfbDJ6NMkAxj/ yuHxrLv2VRyOsGAifVV6jqnXQnc5GZxm/KqSLSP6JlSG8L5aj1XwrBjcEV15rCR+x3k4QG9sS0r z/6TUzqih1NUNsc80vjDzg2Xi7ap59hK/TKKi0HZ6FKxhFjBdvqBalsp8VAxiaXq9v+QG++Ytuz
 l7QMQu+FQXEWwALtxRcwGm1xd5HLjCx9nnhpGqv8oepDwZI69+DahLLuBV/EqcpdHpLwkZjp
X-Authority-Analysis: v=2.4 cv=IOsCChvG c=1 sm=1 tr=0 ts=6867740e cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=kP8cXfqgbZGvQaP_GYIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: RniBdQdv3wVisakTjpCIdpZHATMIiDy2
X-Proofpoint-ORIG-GUID: RniBdQdv3wVisakTjpCIdpZHATMIiDy2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=294 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507040048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 06:26:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219902

From: Robert Yang <liezhi.yang@windriver.com>

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 385b6f34d9..ae89d4d8e3 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "2c43381180f9cfef4c0a8bb0c1658a86c3fcc876"
-PV = "1.9.0+git"
+SRCREV = "b4645cb30573c5b3d5e94b9d50e1e2f8beefe9be"
+PV = "1.9.2"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be
-- 
2.49.0


