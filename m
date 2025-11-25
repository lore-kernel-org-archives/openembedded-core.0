Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1D1CFD374
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 02:30:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8522.1764037827002422342
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Nov 2025 18:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=N2ZJKJCk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3424aaec24=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP1elfx2470388
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 18:30:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=JNSh/2IofJoAlI3tLBZg
	JAgKRYoW4nhBiL92UqcyYkU=; b=N2ZJKJCkET9znnzrDGilljmmCktVopOmjHnO
	v6xxIEmNYTUymwlOhApc2IBp5+gqhqOfSxVJ4XQqw/qqn1BPHdodNn+6TwJei7rR
	nc7QxFy83KqtZvXB5RyFvd94LYJwwCUZhGr8TNjbUZaGBWq0QdOT1xkgHomFrmMC
	NRdJTmQZ5gvWc5HZ+/VnvAPIrBueNly/dalzcK6KC+q8Ic5HL17kNv9YiQ2qwIsj
	Y1+fZSoEJqON15Ztue9aeohYZzBup0GEY+I/57SFiwwlASRscts51SuUX1aP8C3Y
	0z9fo/9OwvPbhthz/oS2/lQhrIGxCpzdc6Hhp2LGFEjWfqHH8Q==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4akdjja98k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 18:30:25 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 24 Nov 2025 18:30:24 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 24 Nov 2025 18:30:24 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] maintainers.inc: Add myself for valgrind
Date: Tue, 25 Nov 2025 10:30:22 +0800
Message-ID: <20251125023022.2109633-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDAxOSBTYWx0ZWRfXxoXiGAbWMQT2
 rOrK/L+tDn2isf/FgbK8+4tTs63LOa+joPR6NvE2RYyfmF6t0Ks//Tx5W6rKlbUJ4fvDOFjjDSw
 /1ei+mUnyHf0pOU+AQMT7k3iW9OYJWHmT+XY8v701/yfaNTWbu5XTWhYF+TO1euGBdW9iLuUAMn
 3Hd3WYBUFPc4n8DlwPoMeft+M6cFFBlPd+9By6IN3nv3FfILdENt2mYUAqUT+pcJMN6j+XS8Gef
 YqVv4xK47a/Xyy2CFlrcfRxMqN0eP4was9kpRXGSZalRGZej87FFKhv4wwoATfcm5y4UJV+jyf+
 Ui5bDtDDcwMtu3Jps/4iVDsPeJUIMPV3Wz5xjA5m9uW6HVRj7S3SBGdrzPO5jP1oo/HLmbZ5g1L
 dJHNEwnSCRzWawpH4K69B3TA2YlknA==
X-Proofpoint-ORIG-GUID: h0POm2-mYGz1l6bclf6hk3P7XkUohxdf
X-Authority-Analysis: v=2.4 cv=Wq8m8Nfv c=1 sm=1 tr=0 ts=692514c1 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=iGHA9ds3AAAA:8
 a=jva71zQrhPedn7yd_e8A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: h0POm2-mYGz1l6bclf6hk3P7XkUohxdf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 02:30:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226749

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6c3174cbb7..5377baf7db 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -857,7 +857,7 @@ RECIPE_MAINTAINER:pn-util-macros = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-utfcpp = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-v86d = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-vala = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-valgrind = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-valgrind = "Mingli Yu <mingli.yu@windriver.com>"
 RECIPE_MAINTAINER:pn-vim = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-vim-tiny = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-virglrenderer = "Unassigned <unassigned@yoctoproject.org>"
-- 
2.34.1


