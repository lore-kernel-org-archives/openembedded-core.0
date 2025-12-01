Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A11D116F5
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 08:07:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16396.1764576471582467743
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 00:07:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YCAaNf6k;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4430d93b62=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B148rLv1875474
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Dec 2025 08:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=0uF02qx7zPmWz1uC+qAO
	sK6i0W6BvXGz4gdSLVUzwPg=; b=YCAaNf6ka+WDXOGwZs5bt2xVCi4A/mrzPbO2
	UJtzBHeggdqTiR381Qdww7OqvIbYT4PU/vhrPpyBqRh/gnerwDkc725Enxve9sr5
	D9C1oJ7oIObj7y1DueMEOLokrXgd/re2VJgsgN3toHudT47A+gb0sYiXCbXqE1V5
	i4uFt/TwHiVN4wagqiulr12oGLwhO4tiNJ2IpqqWHb0L9/D7IpN80RwG9TRiim4v
	eAggPxhgLVl7U2qnNWgrQuGUd8fAoh/wzf6W13G0I+8adsYPXcsHHX8vIQpzyNpm
	OFwWu22CBCL5lH9Z9yzOY/AAx9gm4AdpSttwzUFLxtqzHgIuag==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt69jh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 08:07:50 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 1 Dec 2025 00:07:49 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 1 Dec 2025 00:07:49 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/2] Upgrade ccache and git
Date: Mon, 1 Dec 2025 00:07:47 -0800
Message-ID: <cover.1764576433.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA2NCBTYWx0ZWRfX+6C9isgdr2BI
 k2Xp6NpiE/Eex3qqvdi2s3ZQwvHR7uuZg3+v+hY+Ec0xhC73W9GMRCb4D3U8kHDzjiS+WbWr1AU
 OcZWCEMz0KWrx3Km3R3Gl9J6XWvNHQKK9mqwuLIqG7xfAKMN7WxaEqwkLbkybtU3lpVLqcJB67T
 L8v9KH7jAh71iQYWSEh4SemGkhDZSH5d5mX2Hv8zqwD00xwLAVtJeDQ1FdigrxOg9VlxQhFouci
 PIxqLFEDISI0HP6MmpdINpqyFg4nEmXiUfQSLM0D9sQ3+H3gTzGYX+N3ANpmOUG4LIsdabs6+hg
 Ib5yoVaa5kEnyJzybK+Iip9I5Z5BI+ypQ4Y02yofPdvZB0ipZotr3VoXajmUWnIKQTioGef6qOM
 4j7GwM2ulcP/HqKe0pNTf4UW4E3Z/Q==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692d4cd6 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=2lvuDc57X4K8AnRM3QAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -jd2VY8LvD62nK0XAYxyhKaoFnDwYb9S
X-Proofpoint-GUID: -jd2VY8LvD62nK0XAYxyhKaoFnDwYb9S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 08:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227116

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit ac7327583aef83fd400190506f3147623de38b68:

  libdrm: upgrade 2.4.125 -> 2.4.128 (2025-11-27 11:03:37 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/pu
  https://github.com/robertlinux/yocto/tree/rbt/pu

Robert Yang (2):
  ccache: 4.12.1 -> 4.12.2
  git: 2.51.2 -> 2.52.0

 .../ccache/{ccache_4.12.1.bb => ccache_4.12.2.bb}               | 2 +-
 meta/recipes-devtools/git/{git_2.51.2.bb => git_2.52.0.bb}      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.12.1.bb => ccache_4.12.2.bb} (93%)
 rename meta/recipes-devtools/git/{git_2.51.2.bb => git_2.52.0.bb} (98%)

-- 
2.49.0


