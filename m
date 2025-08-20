Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3122FCA0EF8
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 10:16:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16632.1755684994257916344
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 03:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gcMCtluq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03275178e8=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57K5tbN33161164;
	Wed, 20 Aug 2025 03:16:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=GvzfrWAC7
	tluoRQHU7GInEAPQE2nYTJYeoa+QL5HL2c=; b=gcMCtluqrQD1OUNvlNj8MiktI
	sW/xtZZX9hea/CgBoRF/75R+EmR0yRVvf8pPYYzKRdph63IQ/TJOz2+wQo93D+aY
	OnNSbK1Yl4UrNgAujx2zwvN/pB5q4GD5tPsjzy1h+GzduVs/ej3o1X6mx8Q4O+qh
	DeQjBJDUiODt1OZdKONlTeJhdLJ4WxwunBZTIi7wM/WfsOIWq1L7cjSDxObS38sU
	zhNLJwXyjC5+vbqP9n1tL+7Lmg/Kw38D1lAZ1GzekhUF3vcmog92/N6jQiq7EEKY
	vNDdltvf97Zin8DcR6Fxo9t/0K5VnWp7Tq515bR5pFWWC8/Xxf8rk4RB0umPw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48mydq8nfs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 20 Aug 2025 03:16:32 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 20 Aug 2025 03:16:03 -0700
Received: from ala-lpggp7.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 20 Aug 2025 03:16:03 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <steve@sakoman.com>, <patryk.seregiet@gmail.com>
Subject: [walnascar][PATCH 0/1] linux-firmware: fix FILES to drop RDEPENDS on full package
Date: Wed, 20 Aug 2025 03:16:15 -0700
Message-ID: <cover.1755684475.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDA5MCBTYWx0ZWRfX1p9MMLseeGdN
 4pKLYLhispf+VVsS0eswdbbuZvYH6EU0ssINQQTkd8srirTmsdhvOF3J7NZQ77RnIjQCM1VDG/N
 U7y+KNDeohBqLawngXAipWRVOf2EfvCbY7H9qSI4pRTpzX6SDaxx8gi4QCQ73408lab6fv4FqdK
 f3Nn3hPq51Px2VOCIEcFuf98CsxIlTfdjNpfiPRu+xVcYR1HowHUlxM71S8G+vqotZQS9QIA2E3
 IioDop1480SmzerhJygeBng9NVHmwZ0z//k6eonL37tmbs2LJFyHk1PQbuAyP9Ur0c8FuNU3kpg
 2d0hG/OBVzKoQjqnv/IH93cjCZ1CiVJLgcSAsJ1szKB9bEsrOnIZBQ+sjcdzsr9Y4/4ofGfmvGY
 /P/DDdKUN0qMaUKjnZ2T3RQU6xqZlw==
X-Proofpoint-GUID: WUU7R4lYWthZfKMCZDuLDIZ8Mm1DZ3f9
X-Authority-Analysis: v=2.4 cv=aKupab9m c=1 sm=1 tr=0 ts=68a5a080 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=BShDIBq-Pv0OsVWI9AUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: WUU7R4lYWthZfKMCZDuLDIZ8Mm1DZ3f9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1011 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 10:16:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222167

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit 347cb0861dde58613541ce692778f907943a60ea:

  build-appliance-image: Update to walnascar head revision (2025-08-15 09:08:50 -0700)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/firmware
  https://github.com/robertlinux/yocto/tree/rbt/firmware

Patryk Seregiet (1):
  linux-firmware: fix FILES to drop RDEPENDS on full package

 .../linux-firmware/linux-firmware_20250311.bb               | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.49.0


