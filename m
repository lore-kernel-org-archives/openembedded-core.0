Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A980BD4114F
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 09:38:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32022.1768469915592791056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 01:38:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hpk6uRIL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5475b384d2=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F5k8cq4021586
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 01:38:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=24GCdnuawa/5duaGhdqd
	eWkpzP91htfJvTQOJ0Bde0c=; b=hpk6uRIL/bN4SRlKZgw7bJD/KGRRrKVS7BHl
	z8Lhu1q++bMa/gI87rnNJST+KfGIsQGC1E8FObUtJbNXdf9xeSvMvGgaNu3pG+k7
	2J8E49BnX2ZOzqHbV3X/krfiXdVsFS9XTr+R3WOp4SD3LoHyzDCeG0+yIO2aqpsB
	WO5IxASKrHjk/X5Prq1fNMjFGxHgp4YbzW1j+pFoeE3SU3ZQjX5TLYt4wT9NC7uJ
	RCs+p9M14RlcOqHLu2PY2ecnrVc21E6nGkC6N23feGzJVQALHuhHYG76FH7bmV0i
	jCyGY2K0cWiv8aAX7r5f6kVVIv6PpESTMWxN9wP4+7CLaJqU1g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkq5fwdsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 01:38:35 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 15 Jan 2026 01:38:34 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 15 Jan 2026 01:38:34 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] rpm: 4.20.1 -> 6.0.1
Date: Thu, 15 Jan 2026 01:38:33 -0800
Message-ID: <cover.1768469892.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=d/z4CBjE c=1 sm=1 tr=0 ts=6968b59b cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=E3FEui_tyA8wEEl0Tt0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2OCBTYWx0ZWRfXzUAXE+BEFKpx
 zN7Iw1icl/2PMMgr1HxnDuW7HnPyr3Cq4uN538oEFNqJx6vWlvFLTLV2+9aqdwH8FvJ/7T0zE65
 uFMVqEoR6pIlX3rj5wh5MyEcZexqXHhiXZBGo21dZV77d1tOLF7R+KQDJCB+tAZW3WDR40sBEbp
 OjBeBq5Fegk5nGDzXLYpZclkfDvJiW6Wm8RofKiymnl/F8Q1ylHuQE+/sinyLWolVh4wS4cz+Mw
 LcY2RyfdASzA3NkpvaPpp1gbKfY5t0ooKOd6tCmnt6SDQEivNaHd0kTsbP1c6UnnGU+3BjJOKaI
 DNcWLps0rbiSe7QGQiPoHIRwMoPWquEaKjekZe21JCXVpioJrjPtTs9kmN4AAArU4Eu2x0eMIgF
 GeDNcFCgYZfMQ3IrT49eRa+3undcSD+ppfPfMd9M/Ne9YDwrpeOBGJe2t3yKhX68ko7KS/sWxxZ
 9WF2+iB9Fo/QZEwxgNg==
X-Proofpoint-ORIG-GUID: _PW_O-yB7uo62pJuxP2YXS0WJCM51khR
X-Proofpoint-GUID: _PW_O-yB7uo62pJuxP2YXS0WJCM51khR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 09:38:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229394

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit 8acdbefd0a148c8b7713f46066ae8489984c5d2d:

  pseudo: Update to pull in 'makewrappers: Fix EFAULT implementation' (2026-01-14 17:34:30 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/rpm
  https://github.com/robertlinux/yocto/tree/rbt/rpm

Robert Yang (1):
  rpm: 4.20.1 -> 6.0.1

 meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.1.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.1.bb} (100%)

-- 
2.49.0


