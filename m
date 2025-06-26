Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05CA2C7EE32
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 10:27:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5064.1750933670495302119
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 03:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8272b03fd5=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q4g2n3021073
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 10:27:49 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dkqandku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 10:27:49 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 26 Jun 2025 03:27:43 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/1] python3-urllib3: upgrade 2.4.0 -> 2.5.0
Date: Thu, 26 Jun 2025 15:57:18 +0530
Message-ID: <20250626102718.899782-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: G4mvibUrxFvxWCyMUn3LbVfUH2aAwhjL
X-Proofpoint-GUID: G4mvibUrxFvxWCyMUn3LbVfUH2aAwhjL
X-Authority-Analysis: v=2.4 cv=N/IpF39B c=1 sm=1 tr=0 ts=685d20a5 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=6IFa9wvqVegA:10 a=UXIAUNObAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=GMWyAk8KPcgo7jehR0EA:9
 a=ME3_zjTLkYgA:10 a=a1s67YnXd6TbAZZNj1wK:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA4NyBTYWx0ZWRfX6uJk6uNaOY74 7Wd3WoWXSLlssQwEnippOFoGtr7njmTxhTTqx57JT6MpRe89LPNLWRvq+XGpAMZMOvvKMg2WbjO BI8ERYF5zU19D5ggYg82hdl1XfPpESO/6WLT9jpJPf6x765/hKUy2hbeQJY/YYCJEtEzBwuAXQc
 3FXiIRqd47f3dhygattQkaN6BIeyIqlsAjKZI1CSe+etLtQ7wUG0AV979VF3f6wxwhVFNqYDhin ze6Y6OEh5UbU+RnV0YAm8GnZITRg65JfU64s6LyGWCDMG6Yyh3wm5EmRrD+BNBrp+5Z7aFGVbn9 0hDRCpo2CxJjq5u1ifqB8w+8Wc+7h74g9G64cB+Y7qm8n3noyTOlJE1pJKxRW/3jgBSAoh6pcYG
 /KcmBj4A3pgFQ7br//62hE4zNXrH7cpSfxNl3utkm+GNy+O3Lw0EPoINPl9GckkGNJfcs+A6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506260087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 10:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219346

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for CVE-2025-50181 and CVE-2025-50182

Changelog:
https://urllib3.readthedocs.io/en/stable/changelog.html#id1
https://github.com/urllib3/urllib3/blob/main/CHANGES.rst#250-2025-06-18

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../{python3-urllib3_2.4.0.bb => python3-urllib3_2.5.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.4.0.bb => python3-urllib3_2.5.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb b/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-urllib3_2.4.0.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
index 7a4bffc05e..a4f3995730 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/urllib3/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "414bc6535b787febd7567804cc015fee39daab8ad86268f1310a9250697de466"
+SRC_URI[sha256sum] = "3fc47733c7e419d4bc3f6b3dc2b4f890bb743906a30d56ba4a5bfa4bbff92760"
 
 inherit pypi python_hatchling
 
-- 
2.40.0


