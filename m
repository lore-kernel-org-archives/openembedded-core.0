Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E613C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 11:23:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17536.1744716216428161634
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 04:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62000427ad=divya.chellam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F6IqMY008184
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 11:23:35 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ydd1k9tj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 11:23:35 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 15 Apr 2025 04:23:32 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/1] ruby: upgrade 3.4.2 -> 3.4.3
Date: Tue, 15 Apr 2025 11:23:11 +0000
Message-ID: <20250415112311.2204453-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: AfoDnv1JCd3HibvTvmImJZYXvCkfChFO
X-Proofpoint-GUID: AfoDnv1JCd3HibvTvmImJZYXvCkfChFO
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=67fe41b7 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=qDDauB9DyFF7jx48-8kA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 clxscore=1011
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504150080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 11:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214841

From: Divya Chellam <divya.chellam@windriver.com>

This includes CVE-fix for CVE-2025-27219, CVE-2025-27220 and
CVE-2025-27221

Changes between 3.4.2 -> 3.4.3
==============================
https://github.com/ruby/ruby/compare/v3_4_2...v3_4_3

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 meta/recipes-devtools/ruby/{ruby_3.4.2.bb => ruby_3.4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ruby/{ruby_3.4.2.bb => ruby_3.4.3.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby_3.4.2.bb b/meta/recipes-devtools/ruby/ruby_3.4.3.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_3.4.2.bb
rename to meta/recipes-devtools/ruby/ruby_3.4.3.bb
index aa22ef3992..45047b8859 100644
--- a/meta/recipes-devtools/ruby/ruby_3.4.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.4.3.bb
@@ -48,7 +48,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "41328ac21f2bfdd7de6b3565ef4f0dd7543354d37e96f157a1552a6bd0eb364b"
+SRC_URI[sha256sum] = "55a4cd1dcbe5ca27cf65e89a935a482c2bb2284832939266551c0ec68b437f46"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.40.0


