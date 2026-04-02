Return-Path: <ygupt@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62B8CC6B17
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 07:32:26 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10612.1775115145183879101
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 00:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hN7jxstB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: ygupt@qti.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6325VUSo090876
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Apr 2026 07:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xAinKsmQBY2ZwsjqJJEz4m
	xWlB6d5h8e5g0zsZQ0nps=; b=hN7jxstBx7VjBlQX+wVPjbXuKPgbd6LZG0ci9h
	0bn00cCYwHwQdQyVYoCWeH4b3Z/6eY9taNDfwynrkXqIAGzzrfWAU7DdXjzs1B96
	9FymnOIE5UwHX8P89yPYG8HfbDgpseoNcS3ioWI7PP0aaXrd2HJC6gxsSHCh+FRz
	Iuc9uP7fOIzmBEn63l/r1VdLLxWpPimb///R2vMx59eXJVSFiJWohbsBTGFGiaaN
	fB4vSEecBL/wh8/gsxNzpEOTVu6gxjijCkLKDPVeT36mKNVGVEGTNPXs/k1Hlron
	yvOA7mQ29ObRUy+itk0CftUieSmpL9YSklS5qZXhLqPAJcOQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9jcu8cxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 07:12:09 +0000 (GMT)
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ygupt-hyd.qualcomm.com [10.213.99.200])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 6327C6EJ010590
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Apr 2026 07:12:06 GMT
Received: from hu-ygupt-hyd.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-hyd-u22-c.qualcomm.com (Postfix) with ESMTP id ADD7A5E5
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Apr 2026 12:42:05 +0530 (+0530)
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Test connectivity
From: ygupt@qti.qualcomm.com
To: openembedded-core@lists.openembedded.org
Message-Id: <20260402071205.ADD7A5E5@hu-devc-hyd-u22-c.qualcomm.com>
Date: Thu,  2 Apr 2026 12:42:05 +0530 (+0530)
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA2MSBTYWx0ZWRfX4IMv4Lh+nira
 7WyGgNHewhG/lVMff2f8BdhMfINE+1D7HuzPFKXKg6MPL2Aiy1rOutFKh7LtXJyO+7kQct3OCQG
 IKQGsJ3NwO5MJDb+7JkpBhlVNWxLQY5skxwd+Ry3+PGnyaAmN9pCFkfojUnlmv3PiwlHQEZ8pD9
 XYq3I8JXFrYanEeKIcfs4BcWTzQZh74EOGQtuWfdzu/5qOWNPGYBlBAgqJmdmigWMMqzuUhuEAN
 +h+pCxXnwN0mYZ/dGEi8z1HJRt6afBq5sYzc1GZZz6WOPcpfESrAWGHs0YVCE/7vcFcQMYB638c
 mlyCAXec+b3WHwBzmRJ9oUt62zQOrVhGMDY2Fh/SdU2CFctmPyJ7JHVUcDW9R+ui/BsoKwT9vTi
 A1KXLNNjscnT9iF8ZvgovtpVzkvbmgYTiu/dgZQde662HzRngnNCjB8V4g0VlfiU1ECDKDcBb7Z
 kL0qBUaMzY0nPxVu5Hw==
X-Proofpoint-GUID: 7cAsXyX4eOjG7gbysCf5M7yaEufxFFr9
X-Authority-Analysis: v=2.4 cv=eYYwvrEH c=1 sm=1 tr=0 ts=69ce16c9 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=S4gN_ueGO__6Sh8bU9wA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 7cAsXyX4eOjG7gbysCf5M7yaEufxFFr9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 07:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234499

Test connectivity to OE-Core list

