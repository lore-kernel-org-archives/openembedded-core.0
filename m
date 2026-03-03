Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FB1E67A7A
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 06:57:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12829.1772521021778318339
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 22:57:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Bme7RjuO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75229269e5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6234Vbaw3902896
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 22:57:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=IyJLjGkZ+XeHyKRH+0FgQ4dFEAl3tMzm0RnABIi/NG8=; b=Bme7RjuOdYy0
	uccOFtHHMzztvAczl4l/80lF/YRdMbB1v0fcDJi9/UT6xRbmnODy1KsxrTSiRAsF
	9tAsYk1RPi1NZ4VYOlCTHco1dVi9W0F9XByQye/NrSI3H3nXyVaJfIQhhvFSYyzn
	FwwfKZ/Pwpf3dli19UBMbMJJT3plt3aSKBrwE5rh39s2ToE4oniuNHU3+nxvYn0d
	zriyxN8ZD9Uyg/+tbK3nYfJTvqes4URhwfkllehnaD+LgoAm2Lzo4inmVz32mzQc
	GJxe5fRx2JGTCtrq88A0ko/2MCGxXitm8l5rj7G0hNcHpUkGU+lEubL0uAqqyK7p
	byMbalwJwA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cm0rgju92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 22:57:01 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 2 Mar 2026 22:57:00 -0800
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Mar 2026 22:57:00 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 19/19] xauth: upgrade 1.1.4 -> 1.1.5
Date: Tue, 3 Mar 2026 14:56:40 +0800
Message-ID: <20260303065640.2541884-19-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303065640.2541884-1-hongxu.jia@windriver.com>
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: jhCvtSMFS_KS4_NnQTXArlkzwSo8UYjk
X-Authority-Analysis: v=2.4 cv=Of+VzxTY c=1 sm=1 tr=0 ts=69a6863d cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=e5mUnYsNAAAA:8 a=xNf9USuDAAAA:8 a=yPCof4ZbAAAA:8
 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=PfWtB7eRXKzbpZXRIXAA:9
 a=3w6iy9BqfFbDrj__1GvT:22 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: jhCvtSMFS_KS4_NnQTXArlkzwSo8UYjk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA0NyBTYWx0ZWRfXzgU21q34q+E0
 duVQc8RQN/ujJN+jtCyaEYz+O7n4HyBv9hk9zE4g7LrH1DYCT2oCQzD9pg6r7ppdLfnc+glmIK3
 bppqC3ox7haa8Hg0oeObuBjqO6Pe4yS7zxlrzLqMRm5CC2YrHikMhGjgZBq6J2ckBdpqAdtNhzH
 AVBp2KIgplyljaQ/A/DN3Dy7sp0QcmghYC5T+sw24sJyWNAny/bVNSG8OR7BhpfDd75giEtbeNh
 EgT16TQKP/b/nNP6MSmRta13jQPFakTk1BrjgP2SlfmXG/esbh3w2qa/16rpfiSHGGrtrwfY+YI
 qbMOr007XYdIpADQDNUiy9T4FCGLdG/Vkj5XhQ9eJmSfqTWYsn6f392dYfDxxEjXMyVgdZsd+rm
 XYKyYyAHng/JMOK/GZmn1zagCsxm18nkoHmqQ/5CJZ4QEBOdQPwLpeZk4u0Plb0NQMGMG/hFs4o
 /K3D2CuoI9Q3mZ/OUYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232257

ChangeLog in 1.1.5:

commit 6fe9365f11181a043f151f2e67f36015c278791d
Author: Alan Coopersmith <alan.coopersmith@oracle.com>
Date:   Wed Dec 31 11:58:21 2025 -0800

    xauth 1.1.5

    Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>

commit 1cb1d8e0284870a03970a0a45d1c8cfe7ec6a696
Author: Alan Coopersmith <alan.coopersmith@oracle.com>
Date:   Sun May 18 16:31:05 2025 -0700

    man page: fix warnings from `mandoc -T lint` and `groff -rCHECKSTYLE=10`

    mandoc: xauth.1:26:13: WARNING: cannot parse date, using it verbatim: TH xauth 1.1.4
    mandoc: xauth.1:33:2: WARNING: skipping paragraph macro: PP after SH
    mandoc: xauth.1:225:2: WARNING: skipping paragraph macro: sp after PP
    mandoc: xauth.1:216:2: WARNING: skipping paragraph macro: PP after SH
    mandoc: xauth.1:254:2: WARNING: skipping paragraph macro: PP after SH
    an.tmac:xauth.1:96: style: blank line in input
    an.tmac:xauth.1:104: style: blank line in input
    an.tmac:xauth.1:114: style: blank line in input
    an.tmac:xauth.1:122: style: blank line in input
    an.tmac:xauth.1:130: style: blank line in input
    an.tmac:xauth.1:135: style: blank line in input
    an.tmac:xauth.1:142: style: blank line in input
    an.tmac:xauth.1:166: style: blank line in input

    Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
    Part-of: <https://gitlab.freedesktop.org/xorg/app/xauth/-/merge_requests/28>

commit 0d43570ad3ca169464daf4304151c9b8d7ab05b8
Author: Michael Gilbert <michael.s.gilbert@gmail.com>
Date:   Fri Jul 22 14:57:37 2011 -0400

    xauth: needs cookie handling warnings in man page [Debian bug #635109]

    Reported-by: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=635109
    Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
    Part-of: <https://gitlab.freedesktop.org/xorg/app/xauth/-/merge_requests/27>

commit 23735afd04ab561914aa3d5465532be0a6975fef
Author: Alan Coopersmith <alan.coopersmith@oracle.com>
Date:   Sun Mar 30 09:07:57 2025 -0700

    Improve man page formatting

    Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
    Part-of: <https://gitlab.freedesktop.org/xorg/app/xauth/-/merge_requests/26>

commit 9e238deb87c07ecda45ad86ff1e4a49125839446
Author: Alan Coopersmith <alan.coopersmith@oracle.com>
Date:   Sun Mar 23 13:14:50 2025 -0700

    Add --help and --version options

    Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
    Part-of: <https://gitlab.freedesktop.org/xorg/app/xauth/-/merge_requests/26>

commit eb8b2ef585dc837558cc3f02f85cb88d2a6de5db
Author: Alan Coopersmith <alan.coopersmith@oracle.com>
Date:   Sun Mar 23 11:25:50 2025 -0700

    Report unknown argument that caused error before printing usage message

    Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
    Part-of: <https://gitlab.freedesktop.org/xorg/app/xauth/-/merge_requests/26>

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../xorg-app/{xauth_1.1.4.bb => xauth_1.1.5.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xauth_1.1.4.bb => xauth_1.1.5.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb b/meta/recipes-graphics/xorg-app/xauth_1.1.5.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-app/xauth_1.1.4.bb
rename to meta/recipes-graphics/xorg-app/xauth_1.1.5.bb
index 919457bca6..8660d17ff0 100644
--- a/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-app/xauth_1.1.5.bb
@@ -9,7 +9,7 @@ DEPENDS += "libxau libxext libxmu"
 PE = "1"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "e9318141464ad7b4dc0f8564a580f0d20f977c85a388cc40d5a766206151c690"
+SRC_URI[sha256sum] = "a4000e2f441facebf569026bedecc23ba262cc6927be52070abe0002625cfbe0"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.34.1


