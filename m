Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2673FCAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 11:14:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14853.1758885247826989994
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 04:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BV6yTo/P;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13648e1d86=divya.chellam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q5ahdg1835477
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 04:14:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=UxSRmg9QIm+zyEesSdHO
	6oQJrctQxZLxbEDsfhZuMn0=; b=BV6yTo/P7IfclUi3/r50FqZiecgIH7ry6Dzs
	OtfI0bqBRQ5mTTA7QnzeirIZAx+vvcNzOKYkuGb3UQ4VT2lZW8aapxpF8kRFPozd
	x1jQwtaSc6z78vkykcoTq9VK9cZJFQrVvQeWlZ02W4P8+FJ2PbEpmMTE5l+02Zrm
	Bz7aLMEQ77XSIRWllZRQFqKsCngkrOl5Z7ivphE8Ti/Io63zkhhGWvr0qMLLHhg2
	XrKwxEwKMhGC+BQLV9deEVCgAC9EL9q/9vD6zmwjzHlQciLNoky7hsGfMpqHh+RW
	OSc+PL5IgskQmyt0Fj1ZH0fPTxXwtR6NRXe6DwP/m1K9NWGqGA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsh0qf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 04:14:07 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 26 Sep 2025 04:14:05 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/1] vim: upgrade 9.1.1652 -> 9.1.1683
Date: Fri, 26 Sep 2025 16:43:38 +0530
Message-ID: <20250926111338.976004-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Authority-Analysis: v=2.4 cv=ebUwvrEH c=1 sm=1 tr=0 ts=68d6757f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=CO6_6GR02mM01ndywr8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -_REiJzpQaWyE_qFx49SHJGUBlpNoad2
X-Proofpoint-GUID: -_REiJzpQaWyE_qFx49SHJGUBlpNoad2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDEwMyBTYWx0ZWRfX/6vYb6ODU4He
 GUme9zHrkZwoUW1KIVTNvfkK6lin5+fOx1cjKhwwUsRJ4oGc2VQihf2dC4RmgBlcY58GLI0keMW
 irvpp31e++/b8xWcIt1kLxDxOsnKKpAgMneJqihEfJXo4jZThBYKiL3fwGe1aYKeekLQgQLe+vX
 AA57uAOrU/72G4Wf8kTTCjgBXjpykfZYvII35Xhia25hS/YH+EhEs7K7zTV7By064yheZ0Nbdm/
 /yS92oq/ctPzv8bHE3nUs9dMGAGVRx9C3a7yy/RQPZSlF0u3uiqVqZ6dbeVtUVfRtgJ75x84ooY
 RsvJi5pIKxx5/k5/Q1urc6G0Klp+x41Zw7qeg0qJqHIv7ZsjbXeGrm/FkZQNnBF/+yqYwfbYc/C
 tSjIo61AFdjHy2zX+b4cPtBfUkjlXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2509260103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 11:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224078

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
index 2a9fda5376..289f31be70 100644
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


