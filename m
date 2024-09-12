Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6964AEE644E
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 06:42:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.41336.1726123349904687144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 23:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99850483cc=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C6PjtK009260
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 06:42:29 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gdt8nnjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 06:42:28 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 23:42:26 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] python3: Upgrade 3.10.14 -> 3.10.15
Date: Thu, 12 Sep 2024 06:42:05 +0000
Message-ID: <20240912064206.2502219-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 4b_cJrhqr6Tns5ynQ5MG-urPh3ZAs7ob
X-Proofpoint-GUID: 4b_cJrhqr6Tns5ynQ5MG-urPh3ZAs7ob
X-Authority-Analysis: v=2.4 cv=a+hi9lSF c=1 sm=1 tr=0 ts=66e28d54 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=8AHkEIZyAAAA:8 a=lqX-N2EBX6u_gMdcw9EA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-11_02,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409120046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 06:42:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204423

From: Divya Chellam <divya.chellam@windriver.com>

Includes security fixes for CVE-2024-7592, CVE-2024-4032, CVE-2024-8088
CVE-2024-6232, CVE-2024-6923 and other bug fixes.

Release Notes:
https://www.python.org/downloads/release/python-31015/

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../python/{python3_3.10.14.bb => python3_3.10.15.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.10.14.bb => python3_3.10.15.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.10.14.bb b/meta/recipes-devtools/python/python3_3.10.15.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.10.14.bb
rename to meta/recipes-devtools/python/python3_3.10.15.bb
index 14ab3f6155..e3b4dad180 100644
--- a/meta/recipes-devtools/python/python3_3.10.14.bb
+++ b/meta/recipes-devtools/python/python3_3.10.15.bb
@@ -45,7 +45,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "9c50481faa8c2832329ba0fc8868d0a606a680fc4f60ec48d26ce8e076751fda"
+SRC_URI[sha256sum] = "aab0950817735172601879872d937c1e4928a57c409ae02369ec3d91dccebe79"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.40.0


