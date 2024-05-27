Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09EB0C25B7E
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 01:37:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18583.1716773830451868833
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 May 2024 18:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5877813c0a=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44R1ODB0031020
	for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 01:37:09 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yb6y5hcta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 01:37:09 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 26 May 2024 18:37:08 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 26 May 2024 18:37:07 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/4] ghostscript: upgrade 10.03.0 -> 10.03.1
Date: Mon, 27 May 2024 09:37:03 +0800
Message-ID: <20240527013705.2781009-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240527013705.2781009-1-changqing.li@windriver.com>
References: <20240527013705.2781009-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Gk0YH_qWAsI9FIHxElLz1wHUTFXc7XD0
X-Proofpoint-GUID: Gk0YH_qWAsI9FIHxElLz1wHUTFXc7XD0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=808 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405270012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 01:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199892

From: Changqing Li <changqing.li@windriver.com>

Patch release to address security bugs:
CVE-2024-33869
CVE-2023-52722
CVE-2024-33870
CVE-2024-33871
CVE-2024-29510

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../{ghostscript_10.03.0.bb => ghostscript_10.03.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.03.0.bb => ghostscript_10.03.1.bb} (97%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.03.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.03.1.bb
similarity index 97%
rename from meta/recipes-extended/ghostscript/ghostscript_10.03.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.03.1.bb
index ff7d38676e..0504f5244f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.03.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.03.1.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://avoid-host-contamination.patch \
            "
 
-SRC_URI[sha256sum] = "6f2bc61023469fcf7c7c2d7f1bdd75b75f2b41836aa1d5e641396246d4abbb59"
+SRC_URI[sha256sum] = "31cd01682ad23a801cc3bbc222a55f07c4ea3e068bdfb447792d54db21a2e8ad"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.25.1


