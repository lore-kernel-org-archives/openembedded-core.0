Return-Path: <yash.gupta@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A54E6401B
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 06:23:18 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49554.1775456590476144086
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 23:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=pdu5eSv8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: yash.gupta@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635KnXAU2446987
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Apr 2026 06:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zvMmK2p8Nl7YaztLtccnlo+j1Ryy6Gel3FiVac9c2F0=; b=pdu5eSv8FsmeqUk8
	AjsYkQhEPwTmSw+kR5yN2aijf3X7Z0/oyNe0sYJpEb3aGqnuxLYZURdjxUrlwlqj
	qRFc8+LhCy0Tc2U3sQi0CEH3yCF1G5gBsbZInyg5WwOGNHA2vWuKBkx96QFm1BIz
	wOiswetadg6yWPjFNxKHsNL7Nsuz38rQ/9+Q4d1D2D7tERZ5iRtRMqSidhHg4dlr
	nJNTNWiXUDWQmTjQTFTqOgpUlyFj0jZAxccC6+NWPjQrEmZWfEcmNu39qRuR2Y2o
	nVdjJeWiclTEuSx33fUy0pLB9HxgSbcDdbgFtM1dUZZgSjRgTYZfP3pjSEn9Z7Ml
	XHylBw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4darbfma86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:23:09 +0000 (GMT)
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ygupt-hyd.qualcomm.com [10.213.99.200])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 6366N6qc014358
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Apr 2026 06:23:06 GMT
Received: from hu-ygupt-hyd.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-hyd-u22-c.qualcomm.com (Postfix) with ESMTP id 63B4D514
	for <openembedded-core@lists.openembedded.org>; Mon,  6 Apr 2026 11:53:05 +0530 (+0530)
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] weston-init: add repaint-window=10 to [core] config
From: Yash Gupta <yash.gupta@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <20260402062634.296082-1-ygupt@qti.qualcomm.com>
References: <20260402062634.296082-1-ygupt@qti.qualcomm.com>
Message-Id: <20260406062305.63B4D514@hu-devc-hyd-u22-c.qualcomm.com>
Date: Mon,  6 Apr 2026 11:53:05 +0530 (+0530)
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA1OSBTYWx0ZWRfX6C6qmuxioVRT
 0VobHGI5tHsHiheH0MxaIxy/adETNBbfUbk+c76yfpN8kSNndsW9c51bsFlvHnoN68BDMNrVS54
 PiFqUJ44xrrjRbF0yNR1pLeqQigZ/aUVgWMdaAEwweWfx1pXul9ZF7zG4fKRXq/AOPVRh3NF71I
 c4vhRkk1qsEIiZzILizdCz0NuqmlICMr4cj8iiX22TExkE2QOMTRwh/X542RvS3zzTxyKEHylWj
 M0EnY7LwzAQOxOLh1GKudwIziLoe5wMmXS0rbRtN6sy0dQMic5u6QMYjadxEFkUI/rgLooroovY
 eiTR25wzDTDUONdxQkrVXku5cMMDxOjhV4An0CwAnO4BO6zVkKLOGmP/Pb9mDeSOZX71nbcPH/u
 0MOxCmRTcS8y4rVR+P9540xG0NRGH7pyg965S5jhV5ZBKGqgT8HqDFlaeNYiIeKqGE8Cs5TZuop
 s5hFynB7AKDRsKP254w==
X-Proofpoint-ORIG-GUID: R_eUQok-yUGNpTsCJrtBJKvyvg5r2r7M
X-Proofpoint-GUID: R_eUQok-yUGNpTsCJrtBJKvyvg5r2r7M
X-Authority-Analysis: v=2.4 cv=I6Zohdgg c=1 sm=1 tr=0 ts=69d3514d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=z9JP47T3OlqGB4sRWXMA:9 a=CjuIK1q_8ugA:10 a=QYH75iMubAgA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234644

This patch was sent from an incorrect email address.
Please ignore messages #234500 and #234502.
A corrected version will follow from yash.gupta@oss.qualcomm.com.

Sorry for the noise.

Yash Gupta

