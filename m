Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E000C71155
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 11:36:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5714.1750419388762015418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 04:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8266d82ee8=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K3wccP026549
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 11:36:27 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47c80gsrrr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 11:36:26 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Fri, 20 Jun 2025 04:36:25 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Fri, 20 Jun 2025 04:36:23 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][Walnascar][PATCH  1/1] ghostscript: upgrade 10.05.0 -> 10.05.1
Date: Fri, 20 Jun 2025 17:06:21 +0530
Message-ID: <20250620113621.1993574-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: yZVhotWZAjnV8NEhp1cpVuDc7jTglPmP
X-Proofpoint-GUID: yZVhotWZAjnV8NEhp1cpVuDc7jTglPmP
X-Authority-Analysis: v=2.4 cv=WLp/XmsR c=1 sm=1 tr=0 ts=685547ba cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=xvhtPVTgd45RIVhUFq8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA4NCBTYWx0ZWRfX+0VSehNl9Wn8 skvGEC0ITpmAoWVmnnBzLQzsBlUWj1vx9+K7jxDrPFLTdiJScjXjMjRvEhji8edKV6CE/wRGJYn SN1ZWk+Sr6RUNLp2dUfO/yDweQqh6qL8Ca3UqKNu3xHw0PJ8nnyOVAgOtCHdBdpvzIVCJpm+NwC
 fKztWGVisMC43irPGIhYS0fPs3r4WgjmZkC4CmJgRF7zgw3EM7A7INXcbE7Vi3wz0g8wSKIw5LG 7C6aE4pCthlBAPmYtCjSHYLwNkpCTDCMX4TyjElTARpj2keoUSXlOeG3OT25Qp7kPSbs2CcNrp/ j0Cp0C/JkwUtqK/K/oIOcPp9kp90nHvS8jepHdDqxcmNi92RSxqzkaPtygs1vcC/GBw9V1nRgfP
 NiGKhbzZkgq7plEHa3nbyBWcMTVd9CxZLAblt7LsQ4ASuYJp7p+0MVjm0nrO7bje4QP/oQ55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=773 phishscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506200084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 11:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219122

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
index e937f04cb3..fa6ead0cd8 100644
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


