Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E454C6379F
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 16:42:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.201733.1673973766997483902
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 08:42:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=AqXIgpQ0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03811a1422=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30HDRqIa018550
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 08:42:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=p62RAclGV4gwhaUggIu7PLioLOhnq94aRZP2L7t4mlo=;
 b=AqXIgpQ031PSI5Cyc3aBKa55Ym5od72vHC+giUVmSclE3tq50+PVLCHDAYStzHapsPas
 ATMJJGKJETQ00OPe0J6fBhN+8cLKrBb0+8LVl93s74wD27PzOp5LCQxS8EpUI2M1XY+l
 uH7KT12wYBaMaPHuoebWIBMByoBoepPFVzqC2MoMZEzl2tgsvtnTxRCRMCPbI2yXBnyC
 1BEmKggQB4mTrrhuBBx0FZbdHBlG8N/WkepTd6RgKsWJVcjVlKttZVTzgDXLjEgLhAcS
 0tzrJi06hw4hnK1Kb2pDWLNuwC/n/sR16sENV97sCDdDZO+/ZbtUdc0zXUQOfWQ3b5TR 3w== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3vsqapys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 08:42:46 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 17 Jan 2023 08:42:45 -0800
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Tue, 17 Jan 2023 08:42:45 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] vim: upgrade 9.0.0947 -> 9.0.1211
Date: Tue, 17 Jan 2023 11:42:44 -0500
Message-ID: <20230117164244.382243-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Dda2X555_yOKo7ogOUZqLBiJAmnhQMMZ
X-Proofpoint-ORIG-GUID: Dda2X555_yOKo7ogOUZqLBiJAmnhQMMZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_08,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 mlxlogscore=563 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301170134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 16:42:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176054

Includes fixes for:
   https://nvd.nist.gov/vuln/detail/CVE-2023-0049
   https://nvd.nist.gov/vuln/detail/CVE-2023-0051
   https://nvd.nist.gov/vuln/detail/CVE-2023-0054
   https://nvd.nist.gov/vuln/detail/CVE-2023-0288

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index d86841efaa..9bc6881fce 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0947"
-SRCREV = "cc762a48d42b579fb7bdec2c614636b830342dd5"
+PV .= ".1211"
+SRCREV = "f7d1c6e1884c76680980571f1cf15e0928d247b5"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


