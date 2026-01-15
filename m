Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97D7D4114E
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 09:38:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31978.1768469915845612006
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 01:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aAvDt0Lz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5475b384d2=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F5k8cr4021586
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 01:38:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=j+yfmpDx/Qxtj/lDC/x+YNWO0k5/6+J9G22dROc+nBg=; b=aAvDt0LzrnIg
	PGdgu6jZmYQ6Rmzv+4Pyq1yZAE1iJj7INC2mdfRU0DKCqXiyGQXWT9gItIDPdNH/
	OmcDkgKLTSCCDqluLC4ijZMwCngvl5/vriElR4cvpVwhr7izJ7KS/OFv+oStyNFF
	/qaEnJoPAlL+6FyzSw0Adst6BtMkJArSaoCmpq7oxyVjclLfPmESXDactqqTO54s
	eETpVnaZyy6hTH+79a312S8aCUGC78fBMSgMKHMlMy9f9ARK1NVfGEkB0TBoGcue
	Wes8+mVvq2KoANWZHRsH38GdJiym8CGTtCZEfnYBswDpx1TOypVgkA3ZPFUckdiw
	KR82rjTF4Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkq5fwdsa-2
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
Subject: [PATCH 1/1] rpm: 4.20.1 -> 6.0.1
Date: Thu, 15 Jan 2026 01:38:34 -0800
Message-ID: <f69b7f8ddf584c045a6fa168f6add2850519e410.1768469892.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1768469892.git.liezhi.yang@windriver.com>
References: <cover.1768469892.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=d/z4CBjE c=1 sm=1 tr=0 ts=6968b59b cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=GMGn13PZAAAA:8 a=t7CeM3EgAAAA:8
 a=FzFx-O5CkA9YSjBAPGoA:9 a=jIF0orF5dxDFSsn8Ms5I:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2OCBTYWx0ZWRfXzvs6Cn2dkbx+
 /Wd3uHSfpcM+s9Y5XKKrwms+f7tkchOM7DMSqKgg74XOsOgLLF/s28rAkwFe+IFfWL9Lde7IiZ5
 /y2XzFVZuJdRIJkP7KBxikq6eqxubrtly+KdXDFvYhwWwCd595obVt55SXMMpjyz9S5h9UvePyI
 UgarKRD8EHnXYYLQUofvDgI1qmDkZ6hPb8Rvg3Q4sYh6loyIT7qDSVFwBzfSeTr5AeAvj87gF8S
 Hfs8qgp22nZ5Pg4tkiCnuBs2Tq2v71maxfsCx5Nll4U1+rZqxSDMkR/8xsiErysQ1lglpSyOuwV
 JonFYNd9/pyKOrpHAwxuvOv+lyI4UldJGZZCaOFl6gGKV4R/jEHRTR/eCh9wGzivvjP0m8Bhs7A
 nKfgpHn3nQidE0k/Q2Cu6dFH6S/5mzu4G59pGAJS1mLizQPOzMDnY61027vXI4n1O0wRRprFBxc
 iIXvZIhFr5pvcXF3ZhQ==
X-Proofpoint-ORIG-GUID: VzEwJTKHCihH4KJ8qMc2EH1QmfJ_Xx2F
X-Proofpoint-GUID: VzEwJTKHCihH4KJ8qMc2EH1QmfJ_Xx2F
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229395

From: Robert Yang <liezhi.yang@windriver.com>

* RPM 6.0.0 Release Notes: https://rpm.org/releases/6.0.0
* RPM 6.0.1 Release Notes: https://rpm.org/releases/6.0.1
* Test info:
  PACKAGE_CLASSES = "package_rpm"
  $ bitbake core-image-sato world

Works well

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.1.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.1.bb} (100%)

diff --git a/meta/recipes-devtools/rpm/rpm_4.20.1.bb b/meta/recipes-devtools/rpm/rpm_6.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/rpm/rpm_4.20.1.bb
rename to meta/recipes-devtools/rpm/rpm_6.0.1.bb
-- 
2.49.0


