Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D0FEDEC03
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 04:54:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11608.1772600060376941449
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 20:54:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NFSmTcA9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7523de4f93=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6244BLrk3916912;
	Wed, 4 Mar 2026 04:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=WaL31rKyKUMSsI4DEk9bv5fsQEqnjv4aVt/Hf9RV5Tg=; b=
	NFSmTcA9CrcIIcRZwmz8gMfXr0MJiIDERP50DgEMG2uQD0a9yrLRtI3S3ACZBbVM
	C38BqHoRt0o/QcGuN6/Dys/+mKooSWb4/RnexZ80v9L20jQ4T9MEE/aLbvHAbNO+
	DtrClpl0KoG0qTs0uL+PXSDZqUE9B29EK/0ttZPYo5It51WdZ1tAKIwvfBF9YF1I
	mkN2RvZ4Rsv6VKmetRNP9D26mb2CXYZU8HIn236QUZGa31s+X9O7ESCHQzxbZtUJ
	3upoSDKWqP9LAe8NsqodDvH0t7x2Ppgg/kDjiHgMpVzcbdLHz+mTSmqM/jGH4xHC
	HAFa+e8LRk2LVl3yqcU9Vw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4mmgr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 04 Mar 2026 04:54:18 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 3 Mar 2026 20:54:17 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 3 Mar 2026 20:54:16 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 3/4] python3-scons: remove python3-pkg-resources from runtime depends
Date: Wed, 4 Mar 2026 12:54:12 +0800
Message-ID: <20260304045413.3265198-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304045413.3265198-1-hongxu.jia@windriver.com>
References: <20260304045413.3265198-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a7bafa cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=dXvAoEkxAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=0BvbmTEWtoCt7q4_a5QA:9 a=iJ39DRKJB4kz2P1Iyp3E:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: soV6h0RW9ypEqBDW4UdsrReuezfiU-0y
X-Proofpoint-ORIG-GUID: soV6h0RW9ypEqBDW4UdsrReuezfiU-0y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAzOSBTYWx0ZWRfX1x1GqfSpRsUn
 IhQyFaHbmqeHzfNC3CeQ86yxvF2Cpt/A4KmwZ2T/ko7YJ/becPp/BAseTn1O4T23ptutU665cAc
 tcyRCTGuMP2LWvVMgHL6MoBlplhsdA+RHGm2/QGu8tWeO9SkbEDMDC0iV3ok1F7UNsgRzd1hpLU
 rqvhZJR5dqNMlkG0I+OOpWSsACEZKOqYmOUtIt9Jbkx340VsmOwgAi1HdI6Vi2hcwM8a2fIQKLB
 MQwjT+NbRQpBbtXXYsjp2toiVHztpuZYi7Bnj3/d6D8BNyOsECZ3mzWMPwtSAX7IdwifoYYuH0h
 x/qCdRO62S2m5uIIWBi89Y9zM92limcXzgzGigItZHSszhiFdlwK2ZSzFPWiI7cOIqiynHFSaMS
 Zp74pHj7x+eticyoVoTH9QyTJ67dXOtKQT7Nwgrc+em0Zwna/Yt/moYex/tXFmA4e8rdXuOrpmI
 B27KIibjUSBCdyd9lxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 04:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232345

Due to setuptools removes and deprecates pkg_resources in 82.0.0 [1],
SCons nowhere in its code does import `setuptools` or `pkg_resources` [2],
remove python3-pkg-resources from runtime depends

[1] https://setuptools.pypa.io/en/stable/history.html#v82-0-0
[2] https://github.com/SCons/scons/commit/e27b28c6b3ca8c9155bff38891189eb73deab611

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/python/python3-scons_4.10.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-scons_4.10.1.bb b/meta/recipes-devtools/python/python3-scons_4.10.1.bb
index 4a62e2e811..5fb896f8bc 100644
--- a/meta/recipes-devtools/python/python3-scons_4.10.1.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.10.1.bb
@@ -18,7 +18,6 @@ RDEPENDS:${PN}:class-target = "\
   python3-json \
   python3-shell \
   python3-pickle \
-  python3-pkg-resources \
   python3-pprint \
   "
 
-- 
2.34.1


