Return-Path: <Lizhi.Xu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F45C4167D
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 08:36:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.31567.1702456594919492593
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 00:36:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qkgM936S;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0711fb917c=lizhi.xu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BD5WgZ2026168;
	Wed, 13 Dec 2023 08:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=m5LX2+/tCacD81K4At7LwGE7mOgnEPRySe6S4HADgwk=; b=
	qkgM936SlTYTctYCv/Oj52S1urJAZvTpr+GYh+0wfKxiQWGsLWWAxBfCdwMAbh6v
	IlgZOYSHJvsVLFrbbAcmtvU5A0uNhqvdATPxaEmwGbyIOD+wMN09V5wLdcPz6BJw
	wS32gFLSE6o4DOYggjwbgNVkrdZA3fgbCwibaqY6QiZc7SKk+bgpt0ZdM/KcrkfO
	4ZZQC3Pcs8aojJP4KFWpE6C7l01FDuqJMeNa49E/BCFQy5sZ/an0ouW+zynUOLA+
	iNaB1LHWLz7YAVpL5VqnAm/BMyOeQBZqZ71I3ND1E8uYXogGyTiyKXEQrXHySC21
	8+pNpzamCNUQfIlhLziCbA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvdexuxsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 13 Dec 2023 08:36:32 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 00:36:35 -0800
Received: from pek-lpd-ccm6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 00:36:34 -0800
From: Lizhi Xu <lizhi.xu@windriver.com>
To: <alexandre.belloni@bootlin.com>
CC: <Lizhi.Xu@windriver.com>, <anca.mihalache@windriver.com>,
        <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [OE-Core] tzdata: only the timezone subpackage tzdata-core is retained
Date: Wed, 13 Dec 2023 16:36:28 +0800
Message-ID: <20231213083628.177541-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211110247ae40506c@mail.local>
References: <20231211110247ae40506c@mail.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: jod5hhn1kQf98CPcVbvxqlCKLL390ik6
X-Proofpoint-GUID: jod5hhn1kQf98CPcVbvxqlCKLL390ik6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=771 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 08:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192272

On Mon, 11 Dec 2023 12:02:47 +0100, Alexandre Belloni wrote:
> Please follow https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#fixing-your-from-identity
Yes, I followed the rules in this document.

Lizhi

