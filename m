Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45255CA1007
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 04:16:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4693.1756873009884340897
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 21:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Bvpdp2s9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1341cf759b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5834Adaj3601874
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Sep 2025 04:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=03kLglu9R4EWVOiA5bOg
	DZsuX/uTT/ZfEQZwqk+T4ZA=; b=Bvpdp2s9Uhv1mKfE3nJvNlyj3f5lXQmh+lYt
	XeXJX+UIK3d30cZAF9iX/hDS/MJuAtscYAk+x469gxhJPgosAX603+s2Axv+OAbd
	WVXhWQaQfJ3mzDg+1LPoLQT98Qu+YuQTizsIWH9+CJIa6I3YY5h6HtIJ42+O8TeE
	sIjdoZAVGSc8Q8cnwpJgoznWnDFfL3kEq/ACAa5eVocPdgNLZuuHbfDjxq/BlIrW
	mDQcJIytyhcm9GznJVswvOC2NRApQIubkiZGtsv04RhdvfPtP37kUP2Sqpm9Jhug
	nCO3DNO/HhzJiUTcew5LwNrg6MANwdjkGZRlbmT+fMbkTaZ2Jw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48upgykm28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 04:16:48 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 2 Sep 2025 21:17:04 -0700
Received: from ala-lpggp7.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 2 Sep 2025 21:17:05 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] git: 2.50.1 -> 2.51.0
Date: Tue, 2 Sep 2025 21:16:56 -0700
Message-ID: <cover.1756872991.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDAzOCBTYWx0ZWRfX3Zm9mavMCYiz
 yCPsS8lt7PCR548JrAnBFbVn4d/qUwrUwVI1qkgzCkIuvVXSgR15Rs3g0GFz0JQztawH0cDH37f
 iTx/e2eSIEbOh+7o4Vp/WDBpg4sbcI1nqvgSNCxh1ueZNwEF/6dFCPBNDSnB8JYSNTQ15qjiOsO
 CxPki1vdDHq1k/h8JNnMhzjyrMCXjDj0LE9HmaunNq5cfTe54nEjQ2DMOKlwWgcNtwtuS2wZtJS
 mCQ4K8ucLY5l1zLBN/Uj9wfdjh19QcdKdJB0GIcJ2LhZhdLjUzIoFLfPlGXYreDqyffts4NvoKE
 inwf0jpdnw0FRaWBmo21Fo6RjACCRL1FLXyF1ULGcJjVlild4lChgAli7r7NEE=
X-Authority-Analysis: v=2.4 cv=eubfzppX c=1 sm=1 tr=0 ts=68b7c130 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=8j5IvXYytdARMNDa2b0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: d1wy1io33HqlXKZTK5ge2QpA4FRGYWDV
X-Proofpoint-ORIG-GUID: d1wy1io33HqlXKZTK5ge2QpA4FRGYWDV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 04:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222841

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit 0a849dc7edeecb6c16a8a0fe347015d6d85e9dfd:

  vte: upgrade 0.78.2 -> 0.80.3 (2025-09-01 23:07:03 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/git
  https://github.com/robertlinux/yocto/tree/rbt/git

Robert Yang (1):
  git: 2.50.1 -> 2.51.0

 meta/recipes-devtools/git/{git_2.50.1.bb => git_2.51.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.50.1.bb => git_2.51.0.bb} (98%)

-- 
2.49.0


