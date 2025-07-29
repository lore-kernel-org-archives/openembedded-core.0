Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED324C87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 08:03:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2181.1753776207595497195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 01:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03055d9187=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56T5WGX13813757
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 01:03:27 -0700
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 484ta1tbcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 01:03:26 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 29 Jul 2025 01:03:26 -0700
Received: from ala-lpggp7.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 29 Jul 2025 01:03:26 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] bitbake.conf: Add xz to HOSTTOOLS
Date: Tue, 29 Jul 2025 01:03:29 -0700
Message-ID: <cover.1753776105.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: X5pa4K1VAugKjKdNIE27Bhe6VKT8QKm-
X-Proofpoint-GUID: X5pa4K1VAugKjKdNIE27Bhe6VKT8QKm-
X-Authority-Analysis: v=2.4 cv=OYOYDgTY c=1 sm=1 tr=0 ts=6888804e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=8DIH_phlsEagI2MU1iIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA2MiBTYWx0ZWRfXzn0FgaB+mXDH
 m4LhGztyrffqh266tKH4btKyj6AY0Eodovzq3904VdAk5UWdmXPPrppcu/kcQcbLk5gqdjg4fhq
 SPCBALeIYsBSfi21U6k5iYTjCiJGY93Ozdg/wsBLbQ93M2013DqjT1mIhm0L/yPD36IdCxYi4tE
 yfEvDxmRSe4C9eS2K5dCnYR0FH1OqEcor+ggRpKCbmhvDCK9RXSAKk/Ag/R/xnWUtiXNcuwLYzU
 4UVajTZqh/piy+DfRvU2DfHvmWCOKL3sUSuy6KyUlPiSWoZBYXZFmbIK1MFXXKNgsjmT9sbADep
 4yp03vfqIYM29jjog112TkWjN/tIX1w0Sd+9Ykl1D7hBYJcn3ibT18li9tcM45R4ipIEzSXELnC
 y0Z47UBc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507260059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 08:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221035

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit 249e42a02c412454cfed9d58e27a054dfa5d2b06:

  qemu: Remove deprecated asyncio calls in qmp python module (2025-07-28 17:35:16 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/xz
  https://github.com/robertlinux/yocto/tree/rbt/xz

Robert Yang (1):
  bitbake.conf: Add xz to HOSTTOOLS

 meta/conf/bitbake.conf | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

-- 
2.49.0


