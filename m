Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CBEC25B7A
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 01:37:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18710.1716773830502855834
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 May 2024 18:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5877813c0a=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44R1JciM006470
	for <openembedded-core@lists.openembedded.org>; Sun, 26 May 2024 18:37:10 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ybfgg92te-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 26 May 2024 18:37:10 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 26 May 2024 18:37:09 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 26 May 2024 18:37:08 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/4] libxml2: upgrade 2.12.6 -> 2.12.7
Date: Mon, 27 May 2024 09:37:04 +0800
Message-ID: <20240527013705.2781009-3-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240527013705.2781009-1-changqing.li@windriver.com>
References: <20240527013705.2781009-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: hXXJvSNbPaFngGKaivUaJVHSzzyMqjeB
X-Proofpoint-ORIG-GUID: hXXJvSNbPaFngGKaivUaJVHSzzyMqjeB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=916 priorityscore=1501 adultscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405270012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 01:37:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199891

From: Changqing Li <changqing.li@windriver.com>

Changes:

- [CVE-2024-34459] Fix buffer overread with `xmllint --htmlout`

- xmllint: Fix --pedantic option
- save: Handle invalid parent pointers in xhtmlNodeDumpOutput

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libxml/{libxml2_2.12.6.bb => libxml2_2.12.7.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxml/{libxml2_2.12.6.bb => libxml2_2.12.7.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2_2.12.6.bb b/meta/recipes-core/libxml/libxml2_2.12.7.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.12.6.bb
rename to meta/recipes-core/libxml/libxml2_2.12.7.bb
index 14fcff7fa4..84601c282f 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.6.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.7.bb
@@ -20,7 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "889c593a881a3db5fdd96cc9318c87df34eb648edfc458272ad46fd607353fbb"
+SRC_URI[archive.sha256sum] = "24ae78ff1363a973e6d8beba941a7945da2ac056e19b53956aeb6927fd6cfb56"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.25.1


