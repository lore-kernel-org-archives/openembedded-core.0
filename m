Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1273C88E7D
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:39:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26167.1789486971387756533
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 08:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NBPlT7jD;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild13.wrs.com, ip: 205.220.178.238, mailfrom: prvs=3718ecb676=kpaturi@oak-lpgbuild13.wrs.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAMQi3849476
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 15:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=5iM0iwlCG
	YhZz/oXmdLbdXhzNl5ddQcS2f60zoCJ2zo=; b=NBPlT7jDjohcZS1daLWoawxNz
	B57I7MWHk9V7JlIKa4Ahwl+mywdcWWrJQ8KGxWAkrjKsmxEWMASyYjo8zbUm+HGl
	ccolaUKpD386lNa46e+Hmt4uNQBABM/J/RaP34cMwFCR7SoQjLr9rAm1f8XKRaB0
	hAmoD9WkWLT0N4+Dq5OuWKc2pgFey4OL1FDFac6qavV7Slx6GARjZUCcoX+qYCUr
	VunUMvFGKUsgZvQCnTFiLGQ5X6uMjpxERPGaHzHAfdziC0R/i//gAz6nHbIvfXSI
	ZWpLQm2ki3qU6P/C+BjHjoGEDKE5JduwafNOWj8rdr+EAH8hQwR0yKCiZOxiA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gmxxnpgr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 15:31:46 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 15 Sep 2026 08:31:45 -0700
Received: from oak-lpgbuild13.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 15 Sep 2026 08:31:45 -0700
Received: by oak-lpgbuild13.wrs.com (Postfix, from userid 1762445479)
	id 18CA04BC0311; Tue, 15 Sep 2026 15:31:45 +0000 (UTC)
From: Kanksha Paturi <Kanksha.Paturi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Kanksha Paturi <Kanksha.Paturi@windriver.com>
Subject: [PATCH] maintainers.inc: Update maintainer for asciidoc, docbook-xml-dtd4, docbook-xsl-stylesheets, gettext, gettext-minimal-native, ghostscript
Date: Tue, 15 Sep 2026 15:31:40 +0000
Message-ID: <20260915153140.18617-1-Kanksha.Paturi@windriver.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIyNiBTYWx0ZWRfX1YEYY83TTfNB
 OelEA4X67gtf1E7zgp/28Ts2Qgv50cK5cLWVHwEpd27+cWbrTXvpEylkHnRhVkKmGCpkkXAEt78
 z1iaws300w4pdszCM5p+AEBbRob7TzWm3hRtMY6L3LLrXF6n5ZB0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIyNiBTYWx0ZWRfX3hl6emaQN4NN
 gq5WLzsUP7atwFAo7LPNFHsS3x+8S3/gNedvcjGSxiqYuXE8rzbocSxmicamrBBggctX/ck7KgP
 dSB9Po0IkBxaUjCQqIbeB42ICvO6sGTYWuPEWXFoqH1oxb4mbdef/P0itp4FA6cUZbos3QOAf3G
 50s5G5ue3urhdLMR2dFz64aF3DWi57ADK61gc8BajGYO/8P4XFuXdSyOMt1Wjp+MuTJo+mud1Mt
 fLVjGOR/Z0LdvDQ2bqCNXumg9ADmpOOiUAjBViCib4yeLrJ9lEIONzYb8S4M9Yd/oqRdMrFz5hK
 gowm+NBuVrnwDJ7viaXKtAgcG7+b6IlPXWXAJZVtjPDmkxpSZByrLN8LWQi+flb2Gvs94wrHi0G
 FtrVoztNerU6CUz205FdoS48Wp+HrdS1zAB0Pm4XOfaWpKsS0i0EXS6p4riwSXP4H8nuBT/FNIb
 iqiqTFTGhF9daBiT70w==
X-Proofpoint-GUID: Us9vDNoCJPFc_XJ3eTnzr779up9ZOy48
X-Proofpoint-ORIG-GUID: Us9vDNoCJPFc_XJ3eTnzr779up9ZOy48
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6aa964e2 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8
 a=k-42gJp3AAAA:8 a=7CQSdrXTAAAA:8 a=HX2QBKq16wMS2Eg3w24A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=uCSXFHLys93vLW5PjgO_:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 clxscore=1011
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150226
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:39:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245890

Take over maintenance of asciidoc, docbook-xml-dtd4, docbook-xsl-stylesheets, gettext, gettext-minimal-native and ghostscript.

Signed-off-by: Kanksha Paturi <Kanksha.Paturi@windriver.com>
---
 meta/conf/distro/include/maintainers.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index bded4bf6c7..8920bd2f06 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -44,7 +44,7 @@ RECIPE_MAINTAINER:pn-apr = "Enoch Ng <enoch.ng@windriver.com>"
 RECIPE_MAINTAINER:pn-apr-util = "Enoch Ng <enoch.ng@windriver.com>"
 RECIPE_MAINTAINER:pn-apt = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-argp-standalone = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-asciidoc = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-asciidoc = "Kanksha Paturi <Kanksha.Paturi@windriver.com>"
 RECIPE_MAINTAINER:pn-aspell = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-at = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-at-spi2-core = "Tim Orling <tim.orling@konsulko.com>"
@@ -158,8 +158,8 @@ RECIPE_MAINTAINER:pn-distcc = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-distcc-config = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-dmidecode = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-dnf = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-docbook-xml-dtd4 = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER:pn-docbook-xsl-stylesheets = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-docbook-xml-dtd4 = "Kanksha Paturi <Kanksha.Paturi@windriver.com>"
+RECIPE_MAINTAINER:pn-docbook-xsl-stylesheets = "Kanksha Paturi <Kanksha.Paturi@windriver.com>"
 RECIPE_MAINTAINER:pn-dos2unix = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-dosfstools = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-dpkg = "Unassigned <unassigned@yoctoproject.org>"
@@ -210,9 +210,9 @@ RECIPE_MAINTAINER:pn-gdb-cross-${TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gdbm = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-gdk-pixbuf = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-gettext = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER:pn-gettext-minimal-native = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER:pn-ghostscript = "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER:pn-gettext = "Kanksha Paturi <Kanksha.Paturi@windriver.com>"
+RECIPE_MAINTAINER:pn-gettext-minimal-native = "Kanksha Paturi <Kanksha.Paturi@windriver.com>"
+RECIPE_MAINTAINER:pn-ghostscript = "Kanksha Paturi <Kanksha.Paturi@windriver.com>"
 RECIPE_MAINTAINER:pn-gi-docgen = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-git = "Sumanth Gavini <sumanth.gavini@windriver.com>"
 RECIPE_MAINTAINER:pn-glew = "Unassigned <unassigned@yoctoproject.org>"

