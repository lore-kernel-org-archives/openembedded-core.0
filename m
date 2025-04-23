Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E46CC369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 05:02:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1763.1745384530732868157
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 22:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=620871aa93=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N4AB1t031320
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 22:02:10 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jharamb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 22:02:10 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 22 Apr 2025 22:02:09 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 22 Apr 2025 22:02:07 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/1] git: Upgrade 2.44.1 -> 2.44.3
Date: Wed, 23 Apr 2025 05:02:04 +0000
Message-ID: <20250423050204.3626850-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: JQZki9wgvdpPRJ6tpeJDrc-esi456y64
X-Proofpoint-ORIG-GUID: JQZki9wgvdpPRJ6tpeJDrc-esi456y64
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAzMSBTYWx0ZWRfX2r4IJCZecD5k mJTOkjYjUYMICirkgPNcJ5GuGJz2DjtSmoj85bxvXJ6Y5VhaXkNhY4nFRy/rRjznrwv96pd2wyj z2Ghiyzh3RFxSqLU+0+hbmr+G/w8dxRFrpBqtRE4wL+kVtrYJjZgC7SDVvz8t1gb/wzqFGlpQ9A
 RdwAeNpBYw1K1XEhdAa3c2cIkvhrmtLdR8YqcJrsTQaycR3SBfmwzCw68+rDT7WhjifzTPY2LJA Wo1NU3wHsbleumCk2+4L6W7Vnv7eejHlt9+GdZ4lFcqUaAOUszqjp+HvlyE3XHVsX3qWzyoqm60 WBg/dDAbPaoFokRc6KYxtd6hnKK1d3PPWT3RSs89u+50MkAfQ0S56brqz4dcddlV7X2qVDgL/bc
 8FY2OmB04U3HMcGiFYHAbtDkD/GxQJMA4ENk7xhff9OeDtaDMVGZZc2752cqmLZRZN+oFo76
X-Authority-Analysis: v=2.4 cv=Sa33duRu c=1 sm=1 tr=0 ts=68087452 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=SG4lKEz3AM62bhclQhEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_02,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504230031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 05:02:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215261

From: Soumya Sambu <soumya.sambu@windriver.com>

Addresses the security issues - CVE-2024-50349 and CVE-2024-52006

Release Notes:
https://github.com/git/git/blob/v2.44.3/Documentation/RelNotes/2.44.3.txt

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta/recipes-devtools/git/{git_2.44.1.bb => git_2.44.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.44.1.bb => git_2.44.3.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.44.1.bb b/meta/recipes-devtools/git/git_2.44.3.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.44.1.bb
rename to meta/recipes-devtools/git/git_2.44.3.bb
index 53d67eb40a..a5afd36168 100644
--- a/meta/recipes-devtools/git/git_2.44.1.bb
+++ b/meta/recipes-devtools/git/git_2.44.3.bb
@@ -164,4 +164,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "118214bb8d7ba971a62741416e757562b8f5451cefc087a407e91857897c92cc"
+SRC_URI[tarball.sha256sum] = "4237c37cdf7b3d38102117b22993b2f761a4c02758dfbe33f7b7423c0b096ca9"
-- 
2.40.0


