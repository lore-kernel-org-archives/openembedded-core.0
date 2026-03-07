Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E608AFCB602
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 15:07:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10540.1772896062952636558
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 07:07:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RtDAARhS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=752655555d=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 627DYs1f2381383
	for <openembedded-core@lists.openembedded.org>; Sat, 7 Mar 2026 07:07:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=XlyKz33cKTsDUDkBq3ZE
	yXT1LdSl67gb27fI0gfn31E=; b=RtDAARhSPcwZF+UXJ6Mb19e1dmaAY28hkCeK
	eIfILBnirNkpFYwfTLQsnvxcZPtgUCOJAHIVpaAFfVUWIAc87G+aTNsd+h//xeCD
	pkH+L2vnDzAxsG2hPys4vhPhHReLLwjTiUIj+68ssQ2y2yAIhfjwlBLblQL3XFfA
	iwQfirXIWyEkhswu+D0Fls1G6bo1GfuhlDw1NiUd3rXVsskbqzTBdSCs5Y3wz5i1
	PieE0oSsHJgXqqIBEGzfioPhAB9DaSLENJtyfXILDeltq4jd9Eg5zD8gZdHvgsGH
	uCHKcSVVqk7xYauSpXNH58OxprLJx0UCD+2oASyiQJGFgKXE0w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crmdm02ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 07:07:42 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sat, 7 Mar 2026 07:07:42 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sat, 7 Mar 2026 07:07:42 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] gettext: 0.26 -> 1.0
Date: Sat, 7 Mar 2026 07:07:41 -0800
Message-ID: <cover.1772895871.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: nu3fTAeDByuLQAomoKX1E3GHU9yZvPeV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDE0MyBTYWx0ZWRfXx3clb3jH7CDN
 qaOeHUxWN1cRphJk8hqxLIv0H5Hs6MRRaDLeK3rJxmd8SDlrLvs8yYjoO4YidDw02wVAY2jyOTh
 Zhw91eeWQ+zFdOUV31N2XT1ofw+4OAhaE/IhaFIjQxst7ldOcgi/Gqvm9+yRP7Efz68Xhp6ezAm
 plcwuonfpz7q67fkjZSTTMC2OGeCXnZOeDbDB9gyyvmKG/mri9b8BeyA5Aouo7m8XyXu4t3BZV1
 jvBjJA5DKg7gdazEcnkFSpgk2ldTUA3UbG3VTmWg/kNtypanyhZvBRTcelVklT6F5WLIqR5p5wv
 n92U2pBoyzF5t28HMhCKInx1gR1hxKsI/E3s4cUzwnVzTo1D/5GcnQyc38sTZLLZ4HrWfInyEKk
 l24It+0wuzwpiabpPJveS58G9UrGKu6HhPiyDDcPyoBq77T65Ihg/sFjMT4Hln4wE46X9PRyb2l
 kf0KRebxQJ+7NAVaIvg==
X-Proofpoint-GUID: nu3fTAeDByuLQAomoKX1E3GHU9yZvPeV
X-Authority-Analysis: v=2.4 cv=QppTHFyd c=1 sm=1 tr=0 ts=69ac3f3e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=T4u-WDFCqk39IoDw_RYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 15:07:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232614

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit ac5e0160df78eef03470daf1f70a5f4d2dc0bac1:

  mesa: depend on mesa-tools-native for less expensive libclc dependency (2026-03-06 16:13:12 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/gettext
  https://github.com/robertlinux/yocto/tree/rbt/gettext

for you to fetch changes up to 191df553a920c1de37bf8ddadc492c6230a15398:

  gettext: 0.26 -> 1.0 (2026-03-07 15:01:35 +0000)

----------------------------------------------------------------

Robert Yang (1):
  gettext: 0.26 -> 1.0

 ..._0.26.bb => gettext-minimal-native_1.0.bb} |  3 +-
 meta/recipes-core/gettext/gettext-sources.inc |  2 +-
 .../gettext/gettext/use-pkgconfig.patch       | 86 +++++++++----------
 .../{gettext_0.26.bb => gettext_1.0.bb}       |  0
 4 files changed, 44 insertions(+), 47 deletions(-)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.26.bb => gettext-minimal-native_1.0.bb} (93%)
 rename meta/recipes-core/gettext/{gettext_0.26.bb => gettext_1.0.bb} (100%)

-- 
2.49.1


