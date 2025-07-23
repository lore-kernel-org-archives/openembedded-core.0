Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BF4C83F27
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 03:16:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5661.1753240602328949745
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 20:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9299fc1790=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56N3F2om1566656
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 20:16:42 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqt1n2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 20:16:41 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 22 Jul 2025 20:16:28 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 22 Jul 2025 20:16:28 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH] mtools: upgrade 4.0.48 -> 4.0.49
Date: Wed, 23 Jul 2025 11:16:39 +0800
Message-ID: <20250723031639.528595-1-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: zcRz_u-s-LmepnGuYu_lEhd7YN7z51Ju
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAyNSBTYWx0ZWRfX67yVVY9h9oGh
 tx0foGzZVfOPH6wCW5K/IA1sz//2GzAgzuDhQF33AYw8n2m3zSoPOLw+BDEGaNJHUuzCxVHwrgW
 2BfF7h9slUNUd7aYA1UhT4yiSNwsUhAig8hCnCUSuAppS2xqki0pbMel8KxXEJnSNhS4nnwgQ71
 Q9Lm0LenUrlW2S/gK5NVyTszPp7tU2ZpZpqOAdOC6nhUHZfyuSbaaT5PbRewzRs3q5t/DMPtH0+
 421nhRda42fyjfJ/QgQPslgbZ6Iw1oxedb9TnTbbPrzt3G8y7Cg6D/ubEtWSAK8l/YE9mSiCXoh
 GvoDEWoMMq0t5l5byKcSjv+/FYelQDlNCtlS1E2fnPM7tSoFxIP7lusXanBXYP3N48Sm94On+IH
 KQeNp39M
X-Proofpoint-GUID: zcRz_u-s-LmepnGuYu_lEhd7YN7z51Ju
X-Authority-Analysis: v=2.4 cv=Z9/sHGRA c=1 sm=1 tr=0 ts=68805419 cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=Wb1JkmetP80A:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8
 a=_6HNBx9gwFrwLxd684kA:9 a=qJXtpl8PtDUA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 03:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220778

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

New version includes check for overlong file names, see [1].

[1] https://lists.gnu.org/archive/html/info-mtools/2025-06/msg00005.html

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

(From OE-Core rev: 044c2bceefcc12262cb2421e8f1da5f6c2ed9f72)

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../mtools/{mtools_4.0.48.bb => mtools_4.0.49.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.48.bb => mtools_4.0.49.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools_4.0.48.bb b/meta/recipes-devtools/mtools/mtools_4.0.49.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.48.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.49.bb
index 646735f3b3..294b2f37b2 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.48.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.49.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "03c29aac8735dd7154a989fbc29eaf2b506121ae1c3a35cd0bf2a02e94d271a9"
+SRC_URI[sha256sum] = "6fe5193583d6e7c59da75e63d7234f76c0b07caf33b103894f46f66a871ffc9f"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.34.1


