Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F767D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 13:22:42 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7545.1765286553559248391
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 05:22:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=cfFLT5EV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=24386082c6=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B94eTvc1105462
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Dec 2025 13:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=zxRVQe+O6MJNRo/vOqQpTE+QYBfu81RF/dfbwzUeIfI=; b=
	cfFLT5EVjst/P/b/ORcR1DAk8kQzVTFEl/UaqRkfY2fwT/qHw2hMJJlg4QmOnVLv
	MbHE73M8PmzsmxWqTAdsKE8Y7ad9pOJVmj6qxqKJv+5cIis3bD1RVwe75TsZlMJa
	7Lyz87GTEwK6hTDMnudZjfFMkwXwask+zgHKiTy9Mq00RiHPDEfv3msX1VGsl//I
	M8WbMbFBU+t45KiLUkZpfwKlI35L3KNkATHmu+btU6tlbuwLRxN8EATbrR+K5BP9
	U9ouMqKfdGgaDy76F91++zYoQj15wXKEPEkpZNR1GMiSjz0kRcW5v+sqSDmOwMVp
	C3wY+1jvuiFTpSEU/QjAaQ==
Received: from tut-ex02-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4ax6s4a9k9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 13:22:32 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX02-PV.KSTG.corp
 (10.0.10.191) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 9 Dec
 2025 14:22:31 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 14:22:31 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH 2/3] weston-init: Add HOMEPAGE variable
Date: Tue, 9 Dec 2025 14:22:07 +0100
Message-ID: <20251209132208.402718-3-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251209132208.402718-1-pascal.weisser.ext@karlstorz.com>
References: <20251209132208.402718-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA5NyBTYWx0ZWRfX4FxkrFy4229G
 leudRklwQiFcs/TYlMBKY85SRnd+44nv5BLENI0DH/012wthLJaR6QlULOOM4NWI03M8Bpw5CWk
 oWglEnt/WWyETFieoXpCDRKF2uPlqsG1leDpTnWuRXIu9Utd/cCn/w2fXvnFHyDJydpuICNIzRP
 P2rNck0n+2veSRbeMITU7RlRqvgZAqYIiMb+Dn1WjqP0j8wPb3+5Kt0iClKQEovkKIElclxidFi
 5qKcixvPUTMIM52yDZ1JWx/ufEqMobfuz0C1GVOcx+f8bIrSs5vrqyPW1X9ExbNdARxWf4rsc8g
 WpsjipEdg4ytMm1lQKqVW/7+qOlwt3b1a/VZt/biqotAq73kNkea9grhPYRgCyY+NPBvBm2PbHG
 p85FTmUeuExfTBBAjXWOEMuWztb74g==
X-Proofpoint-ORIG-GUID: 5TVLyYuFCfQMFTfxtTnlvGZYKOroqoDd
X-Proofpoint-GUID: 5TVLyYuFCfQMFTfxtTnlvGZYKOroqoDd
X-Authority-Analysis: v=2.4 cv=N/ck1m9B c=1 sm=1 tr=0 ts=69382298 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=n9SCklZpAAAA:8
 a=e2mEn3olZKEtDfV7IA8A:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 13:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227438

Add HOMEPAGE variable to weston-init recipe.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index e236bdb253..29cfba0833 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Startup script and systemd unit file for the Weston Wayland compositor"
+HOMEPAGE = "https://www.yoctoproject.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-- 
2.50.1


