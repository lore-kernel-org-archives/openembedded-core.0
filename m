Return-Path: <Aravind.Bandari@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11468C79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 18:47:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19938.1788979620588938953
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 11:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aF9KWXpX;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild11.wrs.com, ip: 205.220.178.238, mailfrom: prvs=3712a3a885=abandari@oak-lpgbuild11.wrs.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689IkxCn1810547
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Sep 2026 18:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=TRb1k4D3O
	siKpwPy29NL68ItN7E0adda/4PbwsZyrFk=; b=aF9KWXpXS7UxR654uZcU9tRq6
	nQP+rVAlRyzGehuY5lxmFqwORFzj7m6l/bdCGNTq4/w27XtZ/Dn633A40NQxlf27
	VLp2CnA3ggZ1T5l0Il59HhNs+azk5db7LwowcXOyJlLFNPDuhzD3OZayVXlULjct
	J6ky3sVIKAdHTuUqspX4Xs+D4l/I9ZHKmRjf5CGJZMyZhZceU0vL1VdbQEHIWeob
	xI9zzkcqHyo5Gd1o7f+J0WxVQsu6XdTuQESDmAQh5uzWT0hRK1w6b20vYX4g1j48
	eUFvZfAX5WKNBhW7m5PdpabrumY/lJUTTQa8mKfzrQTmzEzkjDmcARKVNwIRg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gkcypr06s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 18:46:59 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 9 Sep 2026 11:46:58 -0700
Received: from oak-lpgbuild11.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 9 Sep 2026 11:46:58 -0700
Received: by oak-lpgbuild11.wrs.com (Postfix, from userid 1762445477)
	id 4DF3D404033F; Wed,  9 Sep 2026 18:46:58 +0000 (UTC)
From: Aravind Bandari <aravind.bandari@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Aravind Bandari <aravind.bandari@windriver.com>
Subject: [PATCH] maintainers.inc: Update maintainer for autoconf, autoconf-archive, automake, libtool, libtool-native, libtool-cross, make
Date: Wed, 9 Sep 2026 18:46:11 +0000
Message-ID: <20260909184611.1022046-1-aravind.bandari@windriver.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIxMCBTYWx0ZWRfX4f9lgFG3olDP
 ri3bWIEu8ykvx8EQtXYaPmaAUv+3b+lyOhETU9m+I5a2V6s1pan3WlHz8AibKSz2Jrzggp/T28v
 boZa7hyoyBdXrHVo1rjlt0MsAK30oRoy+FEasYCnrcwlHST5NgkL
X-Authority-Analysis: v=2.4 cv=b40ncdGx c=1 sm=1 tr=0 ts=6aa1a9a3 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=iGHA9ds3AAAA:8 a=k-42gJp3AAAA:8
 a=pGLkceISAAAA:8 a=0gcC27t9AAAA:8 a=_iH6NxeTAAAA:8 a=iNOPiNP7n9lywY19YmYA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=uCSXFHLys93vLW5PjgO_:22
 a=f5sM90hAhNS9OGT-JDKn:22 a=zZzRKORMDKZaSe7LaTAy:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIxMCBTYWx0ZWRfXwPBLthSFn1iI
 XUp0tqXUcT9Rv84tV6EZRN0SgdGTL7teEgw+xQ+sdCt4KhOqkyYvEk9ElSaE86szu+T1++AGgvx
 sJtph80bBCY1JQaisdc8ISk7Bl0cvIYSQOU5KeLgB6OivubhU53NhzFfuc6xOd4IIHyryB14IPg
 V7TMYl3EAZtwDc89L6AYdQ2b4jiwso7FvluvJFXl9ERDVky6AfG1y/10/x477TkSe7biESCzYt3
 /15zMZyY65Aadjoaro01RD3Zv6ToY/DY0W9Q/zf+Df9A5NypWSlLaPZLAl55rNNEby2EbyfdTXB
 Aa6oH9gU4AQZufRM/xtuf2otnNuQr8L18aGtQ02zuemklGZtVcji1fNtGYMIOIB6IjugR/u6Rfm
 E7jSSBKFYAWopRk/Igy0WK5HyBVfpg==
X-Proofpoint-GUID: C4icnW7eB0amI2uhJQoAnIj4L2AlALed
X-Proofpoint-ORIG-GUID: C4icnW7eB0amI2uhJQoAnIj4L2AlALed
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090210
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 18:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245487

Take over maintenance of autoconf, autoconf-archive, automake, libtool, libtool-native, libtool-cross, make.

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

