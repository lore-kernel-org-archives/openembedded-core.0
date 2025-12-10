Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF6FD3B9A9
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 08:02:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10656.1765353733163062786
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 00:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Efo8NX51;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4439c05937=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6Ug88161844
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 08:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=jzH4bsih+ws3CXdAbhXk
	S66gX3YG/F7v3HDHtqEgWQU=; b=Efo8NX512LBQQKK1SeZ7XG8/KHjWlEbwk9Cv
	RWRFvONdibRPfwWnjkNNgQPrYqpZlwOMdhsritj6rlla9SqZmXH2+8GWIFk9yRp6
	1xVL1P8q4XaUwsvJgMh19zYND8njIYdVIoif+dUqGtTehZNhWAPFdikIYu5bW4qc
	na3+Io9wL3UCtsAAt87poVyOJtsMKeZQUTrBplOCHwjqfFwiAVgie/gyQ1tSuQ0Y
	LnD20buXzkvXIe3jyD/53DZggFEPaux9exdsKduedQeHnBfFEWSmpyfAQ6xCSgKG
	clS3RFTYiw+RR/F2b62HKnd8uVTXMYychgGqz3Lgxe2dlHQ0mQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay07hr8td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 08:02:11 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 10 Dec 2025 00:02:10 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 10 Dec 2025 00:02:10 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] gstreamer1.0: add mulitlib scripts Gst-1.0.gir
Date: Wed, 10 Dec 2025 16:02:09 +0800
Message-ID: <20251210080209.2158502-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA2OSBTYWx0ZWRfX/QCHt/qhdTSR
 pJkseif1epElroXGWNBlGOux9OnJwm6fFJ80nzmejCp6U/Yl68ERqEe9t3dWyTwTKsd7LdHNQkI
 RL6gJJ0Iz7g6JBrX1xFIwTZ3cZdrIslJM2bKbPMuCfYRf9KSg6QXWAScFrWDMbXKmhLkMb18hZI
 0AVGQUZ7VxORZ0hZVFWuA1YmIalTga2w2aYREDuYlq1KBWMIkUkMV5z3YpItqPdcBJ8z07QYR6U
 4uEypxvUqhFJcYv4C/QOj7ecx4J8IRk3I6PdpZaNGNLMB1QLdRUyk1mk+w2XYyNvyO3rvFdv48S
 eOQJ69EWFdjYU4iSemLc4QgluoD7dzUXZQA/1NhE5tIPCymasWYDTnwWg3vkabR3q6stUBTLEim
 RyVuj/EBgFXw1rNQp2gNOCcXbT7KYw==
X-Proofpoint-ORIG-GUID: 7r1wAZgYPGBtBzySTS2K2hloly5fNKeI
X-Proofpoint-GUID: 7r1wAZgYPGBtBzySTS2K2hloly5fNKeI
X-Authority-Analysis: v=2.4 cv=dbyNHHXe c=1 sm=1 tr=0 ts=69392903 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8
 a=kTb8mqb-v8cIbPLx4asA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 08:02:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227458

Due to upstream commit [1], the padding differs between 32 bit arch and 64 bit arch
...
|typedef struct {
|  /* < private > */
|  gpointer pointer;
|#if GLIB_SIZEOF_VOID_P == 8
|  guint8 padding[8];
|#elif GLIB_SIZEOF_VOID_P == 4
|  guint8 padding[12];
|#else
|  #error "Only 32 bit and 64 bit pointers supported currently"
|#endif
|} GstIdStr;
...

It made the generated Gst-1.0.gir be changed for multilib packages,
and caused conflicts in rootfs while installing gstreamer1.0-dev and
lib32-gstreamer1.0-dev:

|Error: Transaction test error:
|  file /usr/share/gir-1.0/Gst-1.0.gir conflicts between attempted installs of
gstreamer1.0-dev-1.26.7-r0.wr2500.corei7_64 and lib32-gstreamer1.0-dev-1.26.7-r0.wr2500.corei7_32

Add mulitlib scripts Gst-1.0.gir to fix the confliction

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/0ee18781f9b210129da23a85236266bf84bafa83#f9880c83c8bdc4d61ac7d51a4a212f602cad5d86_0_39

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
index 444165a869..ee3d3075d8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 
 DEPENDS = "glib-2.0 glib-2.0-native libxml2 bison-native flex-native"
 
-inherit meson pkgconfig gettext upstream-version-is-even gobject-introspection ptest-gnome
+inherit meson pkgconfig gettext upstream-version-is-even gobject-introspection ptest-gnome multilib_script
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
@@ -61,6 +61,8 @@ GIR_MESON_DISABLE_FLAG = "disabled"
 
 PACKAGES += "${PN}-bash-completion"
 
+MULTILIB_SCRIPTS = "${PN}-dev:${datadir}/gir-1.0/Gst-1.0.gir"
+
 # Add the core element plugins to the main package
 FILES:${PN} += "${libdir}/gstreamer-1.0/*.so"
 FILES:${PN}-dev += "${libdir}/gstreamer-1.0/*.a ${libdir}/gstreamer-1.0/include"
-- 
2.34.1


