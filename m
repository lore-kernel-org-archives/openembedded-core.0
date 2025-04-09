Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE8EC36010
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 01:55:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12528.1744163728047903061
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 18:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6194cc9264=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5391dLIG010927
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Apr 2025 01:55:27 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tsr1mw37-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 01:55:26 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 8 Apr 2025 18:55:26 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 8 Apr 2025 18:55:25 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] xserver-xorg: remove sub-package ${PN}-xwayland
Date: Wed, 9 Apr 2025 09:55:23 +0800
Message-ID: <20250409015523.540683-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Td6WtQQh c=1 sm=1 tr=0 ts=67f5d38f cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=aR16PxjQAAAA:8 a=NK1ONv00Zy8YdcKRGlwA:9 a=Vxmtnl_E_bksehYqCbjh:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=zbFvvTOBjyH4ze5LlUjX:22
X-Proofpoint-ORIG-GUID: _2eMvZl3JWTylIQz4t7l098UM69q5om0
X-Proofpoint-GUID: _2eMvZl3JWTylIQz4t7l098UM69q5om0
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 mlxlogscore=781 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504090002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 01:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214569

From: Kai Kang <kai.kang@windriver.com>

xwayland has been split to a standalone package via commit

* 4ee66f574 Drop XWayland DDX

https://gitlab.freedesktop.org/xorg/xserver/-/commit/4ee66f574

and there is a recipe for xwayland in oe-core too. So remove sub-package
${PN}-xwayland from xserver-xorg accordingly.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 94d55072fe..fbe860c6ea 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -59,7 +59,6 @@ PACKAGES =+ "${PN}-sdl \
              ${PN}-xvfb \
              ${PN}-utils \
              ${PN}-xephyr \
-             ${PN}-xwayland \
              ${PN}-multimedia-modules \
              ${PN}-extension-dri \
              ${PN}-extension-dri2 \
@@ -82,7 +81,6 @@ SUMMARY:xf86-video-modesetting = "X.Org X server -- modesetting display driver"
 
 XSERVER_RDEPENDS = "xkeyboard-config rgb xserver-xf86-config xkbcomp xf86-input-libinput"
 RDEPENDS:${PN} += "${XSERVER_RDEPENDS}"
-RDEPENDS:${PN}-xwayland += "${XSERVER_RDEPENDS}"
 RDEPENDS:${PN}-xvfb += "xkeyboard-config"
 RDEPENDS:${PN}-module-exa = "${PN} (= ${EXTENDPKGV})"
 
@@ -94,7 +92,6 @@ FILES:${PN}-fbdev = "${bindir}/Xfbdev"
 FILES:${PN}-xvfb = "${bindir}/Xvfb"
 FILES:${PN}-utils = "${bindir}/scanpci ${bindir}/pcitweak ${bindir}/ioport ${bindir}/in[bwl] ${bindir}/out[bwl] ${bindir}/mmap[rw] ${bindir}/gtf ${bindir}/getconfig ${bindir}/getconfig.pl"
 FILES:${PN}-xephyr = "${bindir}/Xephyr"
-FILES:${PN}-xwayland = "${bindir}/Xwayland"
 FILES:${PN}-multimedia-modules = "${libdir}/xorg/modules/multimedia/*drv*"
 FILES:${PN}-extension-dri = "${libdir}/xorg/modules/extensions/libdri.so"
 FILES:${PN}-extension-dri2 = "${libdir}/xorg/modules/extensions/libdri2.so"
-- 
2.34.1


