Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5AC6CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 04:25:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.47643.1697775939297387934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 21:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ofu3kSRn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8657c1067b=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39K3x5AD003431
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 04:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=agX/W
	KwI6idoaWvMOnWJ8kQmEdNF6lAVhXJtYtcbUxM=; b=Ofu3kSRnfBy36gWxCtYH6
	SE2dP8ZQaw0St94K4fJyAArFx6w8ggzDqEIyrG9U+45WlpSohKm+avk4k9uILobW
	wl5WrzhwzoOKxN+O2XQ0TktfW1FwsUAQkBWFfLR0RAFfVxUh9jma70Z3WXcfUZ+u
	zJEu0VbUrPy8Suh8ZBoljPEgO61rxtzHAjA4hL3WWyxAjtBBnIF9+KRSq5rfKaVA
	phd3GVU4fEpTHaqQo/43Y6P2fyaHUIfkCZRPIywTOxjmvo973Ms5unahtBA2hLWB
	yRjHkUYreNyKDIFq03mpMAzlESRkXTZD6aCuRc309tz6GNsv5g6APe0wXbFpjjPh
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tuf3a84j4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 04:25:38 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 21:25:35 -0700
From: Meenali Gupta <meenali.gupta@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.G.Pillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] linux-firmware: upgrade 20230625 -> 20230804
Date: Fri, 20 Oct 2023 04:25:17 +0000
Message-ID: <20231020042517.1165317-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: bO_S9qjdcpm8mgK--7p6ybUslZTxjvgq
X-Proofpoint-ORIG-GUID: bO_S9qjdcpm8mgK--7p6ybUslZTxjvgq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_02,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1011 spamscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 adultscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310170000 definitions=main-2310200036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 04:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189492

License-Update: additional firmwares

upgrade include fix for CVE-2023-20569 CVE-2022-40982 CVE-2023-20593

Changelog:
      https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/

References:
      https://nvd.nist.gov/vuln/detail/CVE-2023-20569
      https://nvd.nist.gov/vuln/detail/CVE-2022-40982
      https://nvd.nist.gov/vuln/detail/CVE-2023-20593

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
---
 ...{linux-firmware_20230625.bb => linux-firmware_20230804.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230625.bb => linux-firmware_20230804.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
index 6765226b9d..4defab434d 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
@@ -134,7 +134,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "57bf874056926f12aec2405d3fc390d9"
+WHENCE_CHKSUM  = "41f9a48bf27971b126a36f9344594dcd"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,7 +212,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "87597111c0d4b71b31e53cb85a92c386921b84c825a402db8c82e0e86015500d"
+SRC_URI[sha256sum] = "88d46c543847ee3b03404d4941d91c92974690ee1f6fdcbee9cef3e5f97db688"
 
 inherit allarch
 
-- 
2.40.0


