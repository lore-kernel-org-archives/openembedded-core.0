Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0B6C4708D
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 13:12:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.203405.1672319515510159406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 05:11:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RJTG9rDG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0362fa9fb2=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BTCxYsG000733
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 13:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=GI3Vz7Gg3SwUmCNt09IFyH8S88TmWcqtOkuKdJdCsh4=;
 b=RJTG9rDGPMZC/6/rxbix7J3uxbPq+EKUXoPHuVgx8sZ2rmYRGokgnVMRyW3CaUA6Qdt2
 /xmlmc/b4GFWbYLALpdLD/HLSuTjlzZS4imW5/QG7WwJfyi85V6/b6MWLRyGv0OQUVUb
 HI/9jBMGiT/Ye7Q2TA2pQdmj4dmyXBgK09Rz6jclVRmX5MptZ+NaoLQInANXuCUitkGK
 xjJZzNxNy6Gmf2mzFBx/AS3yWq8bDY8ftIoMfH0h1FI9Z4tBbtle7kwPBCaP6spBjCpi
 w/G0244FVezX4C2YpU7MzeTUpCCGvIgZ84FHtokVUX++in4mFh8yBCvZWKL3+UdPCROx kw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnrda2ye2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 13:11:54 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 29 Dec 2022 05:11:51 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 29 Dec 2022 05:11:50 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/4] libsm: 1.2.3 > 1.2.4
Date: Thu, 29 Dec 2022 21:11:47 +0800
Message-ID: <20221229131147.26534-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221229131147.26534-1-kai.kang@windriver.com>
References: <20221229131147.26534-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: BrL7gHK0levUhUHa2xQu6zYqzehgDQ8H
X-Proofpoint-GUID: BrL7gHK0levUhUHa2xQu6zYqzehgDQ8H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-29_06,2022-12-29_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=905 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212290109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 13:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175100

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xorg-lib/{libsm_1.2.3.bb => libsm_1.2.4.bb}                | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libsm_1.2.3.bb => libsm_1.2.4.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb b/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb
rename to meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb
index 90917ef437..ab030723c6 100644
--- a/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb
@@ -22,8 +22,7 @@ PE = "1"
 
 XORG_PN = "libSM"
 
-SRC_URI[md5sum] = "87c7fad1c1813517979184c8ccd76628"
-SRC_URI[sha256sum] = "2d264499dcb05f56438dee12a1b4b71d76736ce7ba7aa6efbf15ebb113769cbb"
+SRC_URI[sha256sum] = "fdcbe51e4d1276b1183da77a8a4e74a137ca203e0bcfb20972dd5f3347e97b84"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.17.1


