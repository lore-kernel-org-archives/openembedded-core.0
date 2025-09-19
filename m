Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45570CAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 06:48:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10038.1758264528515632252
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 23:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Zwowg1EN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1357189f71=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58J5oUdM726591
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 06:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=pSQAVrk330JotPznliI6
	N+vCtetuj6AwZgR9TBz+Qco=; b=Zwowg1ENIfGMvaVHdCLULfxnN95DqVNWwadt
	uu7/G88f3n5k8Ux13YOSxk/6UOJKC1wagB8p4qYMCjleof53T0F7i0w1cvogkR/F
	t1G+dDjAHBp/F2rpE4HvYRkMIPHCMw6JQn2qDhJ5Laul0PMH6ZGl0ilCrj0e5g17
	CRPT+m7ngDUuhSmhDwhgNqyd2UFqWG+NP9KzGoFn/7i3xQ+iSPTskuaY1O2NKScZ
	WWhcE13hGXTh0yJPeGFpNHVCEb476LlVtjV97nEzvZvGV6rxDlLEZBPpgTL60YEf
	AcbEDXppknqYPF86sSKCE3Z7dI3JExrXxEUc3gzV5dp+4YtJOw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 498vjw07mh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 06:48:46 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 18 Sep 2025 23:48:45 -0700
Received: from ala-lpggp7.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 18 Sep 2025 23:48:45 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] gawk: Append AGPL-3.0-or-later to LICENSE when pma is enabled
Date: Thu, 18 Sep 2025 23:48:58 -0700
Message-ID: <cover.1758264088.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Hrt2G1TS c=1 sm=1 tr=0 ts=68ccfccf cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=N5_G88_haitQYVCykmoA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 4O7srmXzXI-SvKSVDgp_2AD82qJX56gk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDA2MCBTYWx0ZWRfX89PFBUT2AOVE
 uXxADNJ3doXc8Vd+H7sq14caN71EsGFjGAOtUPNqCLI+rJwFdUm+jTpHMkrLhegBaTJkCIQmfs5
 Gl8Kt2VOCsKFmxAbWrkUau1Fsh97fkRLRiuVwycfKjEeGEKWWlGUCvX627CML9dR9fQ5R0O8ZG/
 R+katkzw47DBy9VILJ98A5gi9eyBbYg3Sf0ZE/+VbEiiXI6hZjjjyqONF7learUaNE/rgiyuRLF
 mkYMWTTfV4rny//yPehjtXwNI5pbTwKqfRirSIWhsZsxJjJRU7DkiKVIaJTljm2kMoFlhmR8dWP
 KudqCnR6bJNcoftrIv6+pUIhrBPCgV25Vdp/s4I9eA39OPQRKlAd7BBU7X6UIE=
X-Proofpoint-GUID: 4O7srmXzXI-SvKSVDgp_2AD82qJX56gk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 06:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223722

From: Robert Yang <liezhi.yang@windriver.com>

The support/pma.c and support/pma.h's license is AGPL-3.0-or-later, this patch
disables pma by default, and append AGPL-3.0-or-later to LICENSE when pma is
enabled, and print a warning for that.

The other option is removing support/pma.c and support/pma.h directly, I'm not sure
which is better, please feel free to give your comments.

The scarthgap and walnascar branch also has this problem, we need backport it
after master branch is fixed.

// Robert

The following changes since commit fbe5f76ba6af0983cd90a05d4077e453e2ebb475:

  expat: upgrade to 2.7.2 (2025-09-18 11:08:20 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/gawk
  https://github.com/robertlinux/yocto/tree/rbt/gawk

Robert Yang (1):
  gawk: Append AGPL-3.0-or-later to LICENSE when pma is enabled

 meta/recipes-extended/gawk/gawk_5.3.2.bb | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

-- 
2.49.0


