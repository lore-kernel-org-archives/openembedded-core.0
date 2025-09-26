Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA2FCAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 11:12:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14872.1758885150104645800
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 04:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=c9av8CY4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13648e1d86=divya.chellam@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58QAnn7H1346203
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 04:12:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=QXJWolMf+HXayRBdHNFG
	wCC5QUe2P2Ux9JNOGpJi0YM=; b=c9av8CY42qeKA654XnWEeSRgBLjTqesPmWq0
	VrKE5nFMhxqTdyrcO1DRDI8pAwthFMU58+ceoQFiMQwYuzDJK3xpVZSHKwgSV7TN
	dP/aMYwEY0M8IaNm1Ldi3BTklYqAts+H6YQQpDe+4vhsFU+sMACBVanVMiT2H9Ne
	a+PzKgZCpnqnzgmhfF/bSlQ3JpXWYhaS+wUgjcNswZDmql/uLkXFj00zDhHvmv8z
	TpPKN3QjVtfhZBG9KSgWNpxmuEr2xRXQvmnWc/GqGZpqRuSsb9NKqYt+iZlhS4FR
	rb5jslM0YkaSstO026rEJNonfK8+kM+2CRysbsHtD+TebPl/jA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbse0qc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 04:12:29 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 26 Sep 2025 04:12:28 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 1/1] vim: upgrade 9.1.1652 -> 9.1.1683
Date: Fri, 26 Sep 2025 16:42:01 +0530
Message-ID: <20250926111201.963377-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-GUID: 2mha4srh0UXaifvVvu6f8d0ql77Kp0qV
X-Authority-Analysis: v=2.4 cv=NanrFmD4 c=1 sm=1 tr=0 ts=68d6751d cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=CO6_6GR02mM01ndywr8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDEwMiBTYWx0ZWRfXzV02Ud4NPXwB
 UT0F7N47ttOuJjJJ5dBvEaEjspTsxB+LSEHT5eADGVQwMBWHsj6NbO9FMoyPKnq0lRrfZ+sJEPq
 XY6qAUmu/DETQBiLjV3w0QaEc8eon3qw/QENb3i1zAcEw0cKtfxth/tbPTGk9WK1sGO+ss/U3zD
 iRS66T+uQdchM7D9vs+Jma5WYym7070WAPvittG+nN0liEpMM6U9F4l3bGuhcWQj+P6jqVKJkFY
 arDX5sZ4q/oF9RV3aZ5salIUbA1iWYEvYkBCAwUtWu+oqILn5MVpDqMWW4qySzD1d9Fz7zhpc9n
 F5+WirulvkPnOiLOIZ09lRcY7vfwj33Q8RNSXSPUpuKVgscaBNcvfQim3nl/Z9QN2PMbbSAZGAV
 CrtEiB9vJLbBC8cFOoYqxrADgpeDAw==
X-Proofpoint-ORIG-GUID: 2mha4srh0UXaifvVvu6f8d0ql77Kp0qV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2509260102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 11:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224077

From: Divya Chellam <divya.chellam@windriver.com>

Handles CVE-2025-9389

Changes between 9.1.1652 -> 9.1.1683
====================================
https://github.com/vim/vim/compare/v9.1.1652...v9.1.1683

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index c33cb09281..b05a0fd16e 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1652"
-SRCREV = "3e152c76adb9542af86760786d42a0beffe5354b"
+PV .= ".1683"
+SRCREV = "b922b30cfe4c044c83bac3cc908084ed20a83598"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.40.0


