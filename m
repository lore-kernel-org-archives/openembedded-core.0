Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D3E6CF319B
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 11:05:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4107.1763550306014213801
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 03:05:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ghUkD0X6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3418d146ba=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7rvKp1456063
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 03:05:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=VpzIzZf0AW1r9y2JemHe
	UdoafOdHck4fi++g57D6Pwg=; b=ghUkD0X6Rm5GdqO5rMYzLMHNSs3N2BS1e3c/
	3LfG/zzg2QsRRDVOPKSTY1b9kbdUgxsiVV+D7fLmgvec2qiG09p9Zg9BA70iVSsi
	bOOjPNgJjiMBnL76tYl83OXN3MNOnhrlFU1ZuvNxEhbQU56+C1hmqrTRjp1J06wl
	ZuI2SPoUdXrWQV80Eel5nn/SpgEE4xZwITC4g68/1lyMPVlsGGbjUfmvrnsTaLvp
	FIOulZM0S4NfCHwYWEZ8sfvBBxEcpTqmPR9BDtkq8+yWaa8uQ3W4sGLwFQBIQeTe
	Pc+YOcEqAvVvkJAqx5oPd/gYMDMJrtVL0tMgbgpM4lC+lTH//g==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswjcq90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 03:05:05 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 19 Nov 2025 03:05:03 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/5] xserver-xorg: remove redundant patch
Date: Wed, 19 Nov 2025 16:34:37 +0530
Message-ID: <20251119110441.817793-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=691da461 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7CQSdrXTAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=zrRrFjApgB7uFp7oHwQA:9 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: t_o1nPP4r_Yk3IIeO2hH_Ws7ntPHHgp2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA4NyBTYWx0ZWRfX6x//9R0LRI46
 9J3/t1YiHMvy3Hgz2jw7To8YUyHbRkmozZebalw1rdniZuWO9rW83RvKF9DyBbBY1og1bgYgg1v
 dNyrA7LIkJcluAj514WjZDO7Hx7419SVXrdROGE14YmDq51npADLtYILQOAif9qbnoN56IqPHrW
 hjYV2Bmo95EapD1GKM0p/L7ZmoPN34tpUAxdYOX8tr9YR8SPUxpaONndq8TbkByIbWgJlfl69os
 AR+C0Xld2/dU2DVZF17y+LOUJ/O9LDldpOvhRBkyNo3ofDJqHfhs4JRII3fbaksMri+72dJ66YH
 hpXtKYjHe7ufNOMgq4z7EWZ4q6p5XnHEcmqC8pZ3WNvpsik1R7543VIDXyyAqh0tA+etfIQYaYk
 B1f+uXR3CEr4WKNv+hkSsmhWRgRdmQ==
X-Proofpoint-ORIG-GUID: t_o1nPP4r_Yk3IIeO2hH_Ws7ntPHHgp2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 11:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226546

From: Ross Burton <ross.burton@arm.com>

The underlying issue with -fno-common was resolved upstream in xserver
21.1.0 onwards[1].

[1] xserver 0148a15da ("compiler.h: don't define inb/outb and friends on mips")

(From OE-Core rev: 74b77ee90efd50a703af76769fac66a0f7c394ca)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...-duplicate-definitions-of-IOPortBase.patch | 28 -------------------
 .../xorg-xserver/xserver-xorg_21.1.18.bb      |  4 +--
 2 files changed, 1 insertion(+), 31 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
deleted file mode 100644
index e9cbc9b4da..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From cedc797e1a0850039a25b7e387b342e54fffcc97 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 17 Aug 2020 10:50:51 -0700
-Subject: [PATCH] Avoid duplicate definitions of IOPortBase
-
-This fixed build with gcc10/-fno-common
-
-Fixes
-compiler.h:528: multiple definition of `IOPortBase';
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- hw/xfree86/os-support/linux/lnx_video.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/hw/xfree86/os-support/linux/lnx_video.c b/hw/xfree86/os-support/linux/lnx_video.c
-index fd83022..1d0d96e 100644
---- a/hw/xfree86/os-support/linux/lnx_video.c
-+++ b/hw/xfree86/os-support/linux/lnx_video.c
-@@ -78,6 +78,7 @@ xf86OSInitVidMem(VidMemInfoPtr pVidMem)
- /***************************************************************************/
- /* I/O Permissions section                                                 */
- /***************************************************************************/
-+_X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area */
- 
- #if defined(__powerpc__)
- volatile unsigned char *ioBase = NULL;
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
index 14c45be432..1e341553f9 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
@@ -1,8 +1,6 @@
 require xserver-xorg.inc
 
-SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
-           file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
-           "
+SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch"
 SRC_URI[sha256sum] = "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
 
 # These extensions are now integrated into the server, so declare the migration
-- 
2.40.0


