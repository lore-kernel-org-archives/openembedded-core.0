Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B024C3ABB2
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 08:49:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2138.1748594955593741594
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 01:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8245dbf612=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U8OIHH006686
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 01:49:15 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46udmm62j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 01:49:14 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 30 May 2025 01:48:54 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 30 May 2025 01:48:53 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH  1/1] ghostscript: upgrade 10.05.0 -> 10.05.1
Date: Fri, 30 May 2025 14:19:10 +0530
Message-ID: <20250530084910.647529-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=WpErMcfv c=1 sm=1 tr=0 ts=6839710a cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=xvhtPVTgd45RIVhUFq8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA3MyBTYWx0ZWRfX/uGwoR8slIK3 rQSjpx2AYjFqYxGjKppIZ2V8zGMT5NfpMPtKbd4Q2gVDJ7iR5hkxY6fdCsYs5iU2lDgYA+t9HNO oODMAWSwz7TnrP4bTchOcw2ZBmITOK4l4YsGbGhDejoW4yDzerevCNWvqhjm8spmmgIoP9Vl6CC
 jNy9HMmTPbwGuCk/6nZyvdTVZS8qCVFpOqThrMq4hAwm0b1HBXCeEboySAEpCRApopDX9Hj8FW7 uSqL4uMdlq4m5a6XkGO9EeRYor3zVr7Hz9K4ZrqpYBHYCUwbvbEuxG2BHKP0/OMJSiW/ee4pmDk h8E8fQv0+6fkVCe4tmt3r6XOftarlhj5a3mUxo43SwcB18KoX1dbuTW9U4RrssdyWQGzzeHIsvl
 Wbk4pU9cytZ9Phk9fvY3uMIAsyfzuANLJBWQ0nsYTHDOWF1ulArBHZakl4I5KU7qRJJlzd9s
X-Proofpoint-ORIG-GUID: M5M3nvmNV4OM97xl7Kk4Y4yOJgAdSXXN
X-Proofpoint-GUID: M5M3nvmNV4OM97xl7Kk4Y4yOJgAdSXXN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_03,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=772 clxscore=1015
 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 08:49:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217490

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../{ghostscript_10.05.0.bb => ghostscript_10.05.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.05.0.bb => ghostscript_10.05.1.bb} (97%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
similarity index 97%
rename from meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
index 1d05945c30..bd34058517 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://avoid-host-contamination.patch \
            "
 
-SRC_URI[sha256sum] = "56e77833de683825c420d0af8cb90aa8ba7da71ea6fb5624290cbc1b53fe7942"
+SRC_URI[sha256sum] = "121861b6d29b2461dec6575c9f3cab665b810bd408d4ec02c86719fa708b0a49"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.40.0


