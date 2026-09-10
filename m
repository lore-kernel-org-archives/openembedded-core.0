Return-Path: <Aravind.Bandari@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB983C79FB7
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 03:38:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5783.1789011512123247992
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 20:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hQPx4jzv;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild11.wrs.com, ip: 205.220.166.238, mailfrom: prvs=37134a2326=abandari@oak-lpgbuild11.wrs.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A3LndN2258103
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Sep 2026 20:38:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=gFi9vLy9H
	Sf6qjmiyZDN7qb4n4PYgX6XC4hY5gRY27k=; b=hQPx4jzvgcNADGK9v3gn21t24
	o9imBK3/DK74JKeOu2wsYHI6DUaTgOztdYBFVwiLeFsHNo1z4JvkFcTPa08KFmTM
	/ovVBTLhK827wY1rpwbs7dMN2eGVeFg+C1/QDir7DZaSZeydyJZ8wynnsSRKtrXJ
	vsRe+fFQ4qN8KBM3EVE1xblPbFADzWepiMFo73IeCto3pb4GGjXvUtvBChgfg4Mk
	VNRA2jMPWgjBLhV+UudOTPzsd49+S7DeYS052UnsBwQ+RpZfLJ59sk5g13DCxGun
	ooD3RmWXGpScSBMZo7PbIpoex3/YewvFI5g2tmFynkkmKy+KfTYBEDGK43eVA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gkcypgt1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 20:38:31 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 9 Sep 2026 20:38:30 -0700
Received: from oak-lpgbuild11.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 9 Sep 2026 20:38:30 -0700
Received: by oak-lpgbuild11.wrs.com (Postfix, from userid 1762445477)
	id 969F740403EF; Thu, 10 Sep 2026 03:38:30 +0000 (UTC)
From: Aravind Bandari <aravind.bandari@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Aravind Bandari <aravind.bandari@windriver.com>
Subject: [PATCH v2] maintainers.inc: update maintainer for autotools and make recipes
Date: Thu, 10 Sep 2026 03:38:17 +0000
Message-ID: <20260910033817.1330801-1-aravind.bandari@windriver.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAzNyBTYWx0ZWRfX71zJzICFseL0
 o+IowDQzNKo6sa4u1QDNgJbFJOl/r99Tf6ehsSDW85gO3Kg4Y92wNDo2qLqQJzpHYZ6Uy01P8vN
 roxtJ3RnMQPlsFcnBzVekQpuxRvXHHL4es+WYedWxGq3CWWM3wqDkcxGbTaCILW+ZRCfuFOHMeg
 7RZgk1C8aA158t7SC2rPN8nZpHyfKJaTZODqxFQBZozGwDJe3jlP5YeLGZ4N9hl5tROzbJKM6ai
 SjjidhIrBr6EGBqhbDBUlIYdDAp2b0FJv+P3wfMMYMO7/rpENv8vrN9+PgqqduJMRIG8c9Z+krg
 kNdC2OHURYCIUG3TY+vEdexcdmlkrIdsSJ6Uo0/mneRMnPQ6he5GHJco4zUYdVEWOD13OkwOkQM
 pOTp/JesH5HIHCidYSAwdTFjQHvw9EQOvhf+zpV3kEHh2VtxUtJpnpervFJM0zdBpVFr7/PWKCI
 ZjqzwfPwk4EVjxFYyqQ==
X-Proofpoint-ORIG-GUID: eCcJ3SikARMTYGwToVbSgGthcsY-M3-x
X-Proofpoint-GUID: eCcJ3SikARMTYGwToVbSgGthcsY-M3-x
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAzNyBTYWx0ZWRfX7byjp13nMUk7
 dmn6+EomFNbHqdFXa3BwGGci4W+UE5xpD9c4VJIZ6gqDnOPZ5SfU2VmuuuukimG1EjWRk1n675P
 pSxdSFTrATjpiLTBOYdROhnviQH4g4HIpy1tIXtSlsfXiigp1p/x
X-Authority-Analysis: v=2.4 cv=II+XmQvG c=1 sm=1 tr=0 ts=6aa22637 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8 a=iGHA9ds3AAAA:8 a=k-42gJp3AAAA:8
 a=pGLkceISAAAA:8 a=0gcC27t9AAAA:8 a=_iH6NxeTAAAA:8 a=iNOPiNP7n9lywY19YmYA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=uCSXFHLys93vLW5PjgO_:22
 a=f5sM90hAhNS9OGT-JDKn:22 a=zZzRKORMDKZaSe7LaTAy:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1011 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 03:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245521

Take over maintenance of autoconf, autoconf-archive, automake, libtool, libtool-cross, libtool-native, and make.

Signed-off-by: Aravind Bandari <aravind.bandari@windriver.com>
---
 meta/conf/distro/include/maintainers.inc | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5cbc60c1ce..40d62042bd 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -49,9 +49,9 @@ RECIPE_MAINTAINER:pn-aspell = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-at = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-at-spi2-core = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-attr = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-autoconf = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER:pn-autoconf-archive = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER:pn-automake = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER:pn-autoconf = "Aravind Bandari <Aravind.Bandari@windriver.com>"
+RECIPE_MAINTAINER:pn-autoconf-archive = "Aravind Bandari <Aravind.Bandari@windriver.com>"
+RECIPE_MAINTAINER:pn-automake = "Aravind Bandari <Aravind.Bandari@windriver.com>"
 RECIPE_MAINTAINER:pn-avahi = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-avahi-libnss-mdns = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-babeltrace2 = "Unassigned <unassigned@yoctoproject.org>"
@@ -409,9 +409,9 @@ RECIPE_MAINTAINER:pn-libtest-warnings-perl = "Tim Orling <tim.orling@konsulko.co
 RECIPE_MAINTAINER:pn-libtheora = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libtimedate-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libtirpc = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-libtool = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER:pn-libtool-cross = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER:pn-libtool-native = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER:pn-libtool = "Aravind Bandari <Aravind.Bandari@windriver.com>"
+RECIPE_MAINTAINER:pn-libtool-cross = "Aravind Bandari <Aravind.Bandari@windriver.com>"
+RECIPE_MAINTAINER:pn-libtool-native = "Aravind Bandari <Aravind.Bandari@windriver.com>"
 RECIPE_MAINTAINER:pn-libtraceevent = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-libtracefs = "Jaipaul Cheernam <jaipaul.cheernam@est.tech>"
 RECIPE_MAINTAINER:pn-libtry-tiny-perl = "Tim Orling <tim.orling@konsulko.com>"
@@ -501,7 +501,7 @@ RECIPE_MAINTAINER:pn-lzo = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-lzop = "Marek Vasut <marex@denx.de>"
 RECIPE_MAINTAINER:pn-m4 = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-m4-native = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER:pn-make = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER:pn-make = "Aravind Bandari <Aravind.Bandari@windriver.com>"
 RECIPE_MAINTAINER:pn-make-mod-scripts = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-makedevs = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-makedumpfile = "Etienne Cordonnier <ecordonnier@snap.com>"

