Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E9CC36018
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 11:45:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5974.1743594341043604437
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 04:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=618716983d=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5323e35Y028041
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Apr 2025 11:45:40 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45rtd4rrmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 11:45:40 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 2 Apr 2025 04:45:38 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 2 Apr 2025 04:45:37 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH  2/2] ghostscript: upgrade 10.04.0 -> 10.05.0
Date: Wed, 2 Apr 2025 11:45:33 +0000
Message-ID: <20250402114533.2807712-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250402114533.2807712-1-archana.polampalli@windriver.com>
References: <20250402114533.2807712-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Sa7QAbj73PYecP2dkCGfVV3sGjUXgkYD
X-Proofpoint-ORIG-GUID: Sa7QAbj73PYecP2dkCGfVV3sGjUXgkYD
X-Authority-Analysis: v=2.4 cv=famty1QF c=1 sm=1 tr=0 ts=67ed2364 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=UXIAUNObAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=iDlDVc_ZF4IyxEHjMaIA:9 a=Q5htsEMMScwA:10
 a=a1s67YnXd6TbAZZNj1wK:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_04,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 mlxlogscore=958 adultscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504020074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 11:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214262

From: Archana Polampalli <archana.polampalli@windriver.com>

This upgrade addresses CVEs:
CVE-2025-27835 CVE-2025-27832
CVE-2025-27831 CVE-2025-27836
CVE-2025-27830 CVE-2025-27833
CVE-2025-27833 CVE-2025-27834

Changelog:
https://ghostscript.readthedocs.io/en/gs10.05.0/News.html

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../{ghostscript_10.04.0.bb => ghostscript_10.05.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.04.0.bb => ghostscript_10.05.0.bb} (97%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.04.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
similarity index 97%
rename from meta/recipes-extended/ghostscript/ghostscript_10.04.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
index 546d734333..1d05945c30 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.04.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://avoid-host-contamination.patch \
            "
 
-SRC_URI[sha256sum] = "c764dfbb7b13fc71a7a05c634e014f9bb1fb83b899fe39efc0b6c3522a9998b1"
+SRC_URI[sha256sum] = "56e77833de683825c420d0af8cb90aa8ba7da71ea6fb5624290cbc1b53fe7942"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.40.0


