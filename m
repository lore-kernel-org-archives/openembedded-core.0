Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872F7C04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 07:56:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.35372.1715932570211877305
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 May 2024 00:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5867cc905d=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44H5LBW2001279
	for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 07:56:09 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y1yc4e59s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 07:56:09 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 00:56:06 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][master][scarthgap][PATCH 1/1] git: upgrade 2.44.0 -> 2.44.1
Date: Fri, 17 May 2024 07:55:50 +0000
Message-ID: <20240517075550.3178706-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: L2GGB25Xy6r3PKkTaZuQRE17iWNjy8Bd
X-Proofpoint-ORIG-GUID: L2GGB25Xy6r3PKkTaZuQRE17iWNjy8Bd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=962
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 07:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199506

From: Soumya Sambu <soumya.sambu@windriver.com>

Addresses the security issues - CVE-2024-32002, CVE-2024-32004,
CVE-2024-32020,CVE-2024-32021 and CVE-2024-32465

Changelog:
==========
https://raw.githubusercontent.com/git/git/master/Documentation/RelNotes/2.44.1.txt

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta/recipes-devtools/git/{git_2.44.0.bb => git_2.44.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.44.0.bb => git_2.44.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.44.0.bb b/meta/recipes-devtools/git/git_2.44.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.44.0.bb
rename to meta/recipes-devtools/git/git_2.44.1.bb
index 90e555eba7..438295c13e 100644
--- a/meta/recipes-devtools/git/git_2.44.0.bb
+++ b/meta/recipes-devtools/git/git_2.44.1.bb
@@ -163,4 +163,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "f9e36f085458fe9688fbbe7846b8c4770b13d161fcd8953655f36b2b85f06b76"
+SRC_URI[tarball.sha256sum] = "118214bb8d7ba971a62741416e757562b8f5451cefc087a407e91857897c92cc"
-- 
2.40.0


