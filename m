Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 226F3C71136
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 05:06:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7474.1750309586850233599
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 22:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82650b996c=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J4dfDV030943
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 05:06:26 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47c80gr65w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 05:06:25 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 18 Jun 2025 22:06:22 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][master][walnascar][scarthgap][PATCH 1/1] xserver-xorg: upgrade 21.1.16 -> 21.1.17
Date: Thu, 19 Jun 2025 10:36:02 +0530
Message-ID: <20250619050602.517939-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: x23YgCEl1QdpoVD2ZrA3d6vrUmSBefqw
X-Proofpoint-GUID: x23YgCEl1QdpoVD2ZrA3d6vrUmSBefqw
X-Authority-Analysis: v=2.4 cv=WLp/XmsR c=1 sm=1 tr=0 ts=68539ad1 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=4m-Gv8FuJ20A:10 a=HCiNrPZc1L8A:10 a=6IFa9wvqVegA:10 a=aR16PxjQAAAA:8 a=t7CeM3EgAAAA:8 a=mUhONat06tTNzUvUs84A:9
 a=cBGy5TzRNOsA:10 a=zbFvvTOBjyH4ze5LlUjX:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA0MSBTYWx0ZWRfX0ubweuYUdT7o gPjhPFHN5FlrgiNLkDg6Z3JD33YuAlcfoCHNEZDQXJFRxJMbATMp1MqMNqOAAvtH0nJHrKXabj0 PfHZJQ90brmONsL/bvP6HE+7kaJEo7zc9/dgehmoDq+2EgNZM8Fod79huzX7wwhtFUwjzkThWyr
 Z8R9mvEkPPYPrMvrxO/qo0GoTNWqyY+c8TSGMLtYzMQBHUbaFB/WC+N16HMsJnpMTTtTQfUI2SF j0wFEz+skCe08Jrl7Ei8QPfouaZ6Kt+rkJkwERwlTCfFrQ8Uv9xJnVdDS7Nqfx2+j9Z/cbRPGnm 6LZ3yADkQ5oX98q40CPVfdskjPLg4wNqZnPIkSf7Uc6/EqKUttc2KIPszNcMEwLyaTDT2ci+yw6
 ooEcoPyDvkpTKBnWFGpDBHYTnMCCUq+DI6EcihWaGa6iRJuyw5G/198sTOKLIWkhCVoyfFjZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=947 phishscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506190041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 05:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219049

From: Yogita Urade <yogita.urade@windriver.com>

Includes security fix for:
CVE-2025-49175
CVE-2025-49176
CVE-2025-49177
CVE-2025-49178
CVE-2025-49179
CVE-2025-49180
and CVE-2022-49737

Ref: https://lists.x.org/archives/xorg-announce/2025-June/003609.html

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../{xserver-xorg_21.1.16.bb => xserver-xorg_21.1.17.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.16.bb => xserver-xorg_21.1.17.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.17.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.17.bb
index 38c81f2372..1d17026a36 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.17.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "b14a116d2d805debc5b5b2aac505a279e69b217dae2fae2dfcb62400471a9970"
+SRC_URI[sha256sum] = "a29441c21a55f4cd2c2d93d3a4ec24a4c15f053d55aea104f97da32f66efecd0"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.40.0


