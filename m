Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23249E67814
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 22:17:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26135.1730585813580337968
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Nov 2024 15:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1036f0d59f=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A2MA2Yv021626;
	Sat, 2 Nov 2024 22:16:52 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42n9a0gpcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 02 Nov 2024 22:16:52 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 2 Nov 2024 15:16:50 -0700
Received: from pop-os.wrs.com (172.25.44.6) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 2 Nov 2024 15:16:50 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <steve@sakoman.com>
Subject: [PATCH scarthgap] systemd: stable update 255.4 -> 255.13
Date: Sat, 2 Nov 2024 18:16:50 -0400
Message-ID: <20241102221650.3866203-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=H7mJwPYi c=1 sm=1 tr=0 ts=6726a4d4 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=htMi0B-JUoZ-EB1pgjwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: OusxDPRuibh64o9LoPuQVOJaMmKQCdJH
X-Proofpoint-GUID: OusxDPRuibh64o9LoPuQVOJaMmKQCdJH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-02_21,2024-11-01_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411020199
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Nov 2024 22:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206658

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Full change log:
   https://github.com/systemd/systemd-stable/compare/v255.4...v255.13

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...stemd-boot-native_255.4.bb => systemd-boot-native_255.13.bb} | 0
 .../systemd/{systemd-boot_255.4.bb => systemd-boot_255.13.bb}   | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../systemd/{systemd_255.4.bb => systemd_255.13.bb}             | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot-native_255.4.bb => systemd-boot-native_255.13.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-boot_255.4.bb => systemd-boot_255.13.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_255.4.bb => systemd_255.13.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_255.4.bb b/meta/recipes-core/systemd/systemd-boot-native_255.13.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot-native_255.4.bb
rename to meta/recipes-core/systemd/systemd-boot-native_255.13.bb
diff --git a/meta/recipes-core/systemd/systemd-boot_255.4.bb b/meta/recipes-core/systemd/systemd-boot_255.13.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_255.4.bb
rename to meta/recipes-core/systemd/systemd-boot_255.13.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index a35db5091e..88f24f99c2 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,7 +15,7 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "387a14a7b67b8b76adaed4175e14bb7e39b2f738"
+SRCREV = "565916c245b53b49f5917f5326d21246f46ae3db"
 SRCBRANCH = "v255-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd_255.4.bb b/meta/recipes-core/systemd/systemd_255.13.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_255.4.bb
rename to meta/recipes-core/systemd/systemd_255.13.bb
-- 
2.34.1


