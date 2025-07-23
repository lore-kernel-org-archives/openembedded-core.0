Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E6C0C87FC5
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 03:29:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5793.1753241382977520250
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 20:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9299fc1790=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56N15v531212455
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 03:29:42 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqmsnxm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 03:29:42 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 22 Jul 2025 20:29:27 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 22 Jul 2025 20:29:27 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 6/6] mtools: upgrade 4.0.48 -> 4.0.49
Date: Wed, 23 Jul 2025 11:29:33 +0800
Message-ID: <20250723032933.546382-6-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250723032933.546382-1-jinfeng.wang.cn@windriver.com>
References: <20250723032933.546382-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: C2Py-xQrAjs5C4rPaa86Glu5Re0-Jho-
X-Proofpoint-GUID: C2Py-xQrAjs5C4rPaa86Glu5Re0-Jho-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAyNyBTYWx0ZWRfX25EliyOqv0/Z
 h+y98+JbWsj2plYaRaKKdmGGAnp0uaqcrzsGB9WkeujrlzCsdgsqkg8YqefOw9Pc3ebQfQOzIlc
 8K9dgdYbJSG4twXKxnoN/gn2WKLRPpyNZ0Bu6sQXf4AIoLs2eJ95lJfbSdbxfUXP7rOAk2i1YMy
 HLIzSUzF265Z9UVYb+Ks+Np5jxVG5Su0VDXfBvFC4G2VtMhKDavYNPCqh1oEt1oCJH2n4BS4N/U
 5AWNA7PTRKDablroLh9uzYsOVVMcND+RJ7w64xkERPIKYqksEqbmGCNZzdrqa4xO6A8J8omH7fV
 VvSjcvAjjDvb0ihdkoCHnwLEW29zYhEoBuMfThSzPHz59nIn1L3SKcahX2dzScJlKrRRDdpFlD0
 3Qp6HMMm
X-Authority-Analysis: v=2.4 cv=BbrY0qt2 c=1 sm=1 tr=0 ts=68805726 cx=c_pps
 a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17
 a=Wb1JkmetP80A:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8
 a=_6HNBx9gwFrwLxd684kA:9 a=qJXtpl8PtDUA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 03:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220784

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


