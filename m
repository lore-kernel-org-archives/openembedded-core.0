Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4819.1793660932678666508
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 15:08:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=olvTX36U;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=576617c402=rachit.sharma@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K750Q1257128
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Nov 2026 15:08:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=dCK7SUQ0a7+IoFpX780K
	EnIPdKqUAjQgPBciihp9mh0=; b=olvTX36UWFP93/zjOH8/iRG5xKq24bBlbA6n
	z2lZ+rNB84HQvohihxLnXaomWG2v70ahFMmmZPgGN5FlwiDj7xUvzIznr1ue4gx8
	CyG+1kGoJ+na4i95V+KH/6+454lAVCWaJF58JapB0wLXlGHh4ND5hVZAxk2amU9G
	B9LBwed5MXzFE1Pr0jk2NhGPMOANGYgd2kKjxp8yrw8c2pI15cG32Fr7QMf8TmpK
	o8JcfkJP3Jv4mWXoRzlQLRHXrVbB+7YpbQVlJHwXA9/9J3SjDm+N3P1qziONNhkS
	VlJpHDj9OZKQB2nESS0jmUxJ348cusdC1knO6HRqOkAqsDEwKA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hnbm1k4k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 15:08:51 -0800 (PST)
Received: from ala-p2exch01.corp.ad.wrs.com (10.11.226.101) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.61; Mon, 2 Nov 2026 15:08:51 -0800
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-p2exch01.corp.ad.wrs.com (10.11.226.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 2 Nov 2026 15:08:51 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Nov 2026 15:08:51 -0800
From: <rachit.sharma@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] maintainers.inc: update recioe maintainer for attr, readline and rpcbind
Date: Mon, 2 Nov 2026 23:08:49 +0000
Message-ID: <20261102230851.2943172-1-rachit.sharma@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA5MSBTYWx0ZWRfX3Zd6Xmv+05+r
 0Hto16b4QLhN7LT2qmpWG8kFN4lr7FD/1mZ9nFpffWP8ZzQoEyMU8GLWWkeCO7KYR+ZSdk4hmuu
 qbUMm9y/W7lLni8MD+Qvm2+9yO9nSrhKocQxudLYi2K5FA3l98lmKLPj/BCC2HbX9cn2P3yzUHL
 wofm+wkapmc/3lFNrmgB3tP+6SEslSEB9i1lqyKt/Ch0+PT5AvHADx+mVJwO6dUdeKG4U9TSKpV
 2Si/xSpRldBXIN6DMFuUwvceFqh2SgW3oVsArUaXLsM26hdLl1PlXGTlsXxEBhsJ/eTXBwtTgRa
 e4e+nRiOoKbO6gN/GgGeyaWgx4NoL2cVHFafEGetYdK/UFw4v/OgHstwKQgWa2lkvCx8a/it/j/
 MVWEfHL6RFR7ms/CbJx8sOygr0ohhtroTufU0p8ehR8zvrqoXy0IJtknuPYqcgN5aE8snXDhsET
 K5aMPI101hfO7rqQc1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA5MSBTYWx0ZWRfX5WOEtsSHQ3cF
 fy7b3zFX+6S/JN4RJnbi/SEXO7l44n3Zh3rwiD42cd05/1gCT6UUbnLvd86KGiqOOvqfh6JAzE7
 6TWnvw2Fkx+zQOtuMo8i+XNxejLZnddtIZOK6CZ5qVArpwU277Vp
X-Proofpoint-ORIG-GUID: 1vku1OStilFF5iDplFiair6edFN0iTOv
X-Authority-Analysis: v=2.4 cv=RZsFmFtv c=1 sm=1 tr=0 ts=6ae91803 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=iGHA9ds3AAAA:8 a=k-42gJp3AAAA:8 a=pGLkceISAAAA:8 a=tIiIQdwvzfKH-Jw8bUcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-GUID: 1vku1OStilFF5iDplFiair6edFN0iTOv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020091
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6A2K750Q1257128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 23:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249228

From: Rachit Sharma <rachit.sharma@windriver.com>

Signed-off-by: Rachit Sharma <rachit.sharma@windriver.com>
---
 meta/conf/distro/include/maintainers.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 9c7ab70bd0..3b050f8559 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -48,7 +48,7 @@ RECIPE_MAINTAINER:pn-asciidoc =3D "Kanksha Paturi <Kank=
sha.Paturi@windriver.com>"
 RECIPE_MAINTAINER:pn-aspell =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-at =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-at-spi2-core =3D "Tim Orling <tim.orling@konsulko.c=
om>"
-RECIPE_MAINTAINER:pn-attr =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-attr =3D "Rachit Sharma <Rachit.Sharma@windriver.co=
m>"
 RECIPE_MAINTAINER:pn-autoconf =3D "Aravind Bandari <Aravind.Bandari@wind=
river.com>"
 RECIPE_MAINTAINER:pn-autoconf-archive =3D "Aravind Bandari <Aravind.Band=
ari@windriver.com>"
 RECIPE_MAINTAINER:pn-automake =3D "Aravind Bandari <Aravind.Bandari@wind=
river.com>"
@@ -770,12 +770,12 @@ RECIPE_MAINTAINER:pn-quilt =3D "Robert Yang <liezhi=
.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-quilt-native =3D "Robert Yang <liezhi.yang@windrive=
r.com>"
 RECIPE_MAINTAINER:pn-quota =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-re2c =3D "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-readline =3D "Hongxu Jia <hongxu.jia@windriver.com>=
"
+RECIPE_MAINTAINER:pn-readline =3D "Rachit Sharma <Rachit.Sharma@windrive=
r.com>"
 RECIPE_MAINTAINER:pn-repo =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-resolvconf =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-rgb =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-rng-tools =3D "Unassigned <unassigned@yoctoproject.=
org>"
-RECIPE_MAINTAINER:pn-rpcbind =3D "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER:pn-rpcbind =3D "Rachit Sharma <Rachit.Sharma@windriver=
.com>"
 RECIPE_MAINTAINER:pn-rpcsvc-proto =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-rpm =3D "Sumanth Gavini <sumanth.gavini@windriver.c=
om>"
 RECIPE_MAINTAINER:pn-rpm-sequoia =3D "Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9=
nyi <zboszor@gmail.com>"
--=20
2.43.0

