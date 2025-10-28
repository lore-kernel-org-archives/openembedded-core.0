Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B826FCCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 05:38:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2095.1761629928582827498
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 22:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LKb8CnUT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2396287873=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RKU4aV3839143
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 05:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=bjJvAdf8xJlZx1y+94UE
	uJZ0VN0Wcmm+rPfMq7n9QaU=; b=LKb8CnUTMd1EX22tuu1saUMsm06YBjV/cj/a
	V5XyCZMLafeIsnqitfHjOll65kCRmm8iF2TRvgWM2gQu6gcAHndVpl3PoLfR4awT
	bsjSmYvId4TRwgKJxKQ/2R4bdffsJ0f1ZPB5vXht5/LexYASicVEt+q1IioJN5PR
	y5nnuIcIPmfAgRKT8rRdNRgm0gd9MecYv5EtQjNmgX69iNFGxJBOgiayYkjxCob/
	D5YFdUaD29stzV4WJ8VD29OiDqYRtkKapuqmb9opIQHRW/0Pjw8vgJVbZmmlpOpy
	agqpbIcOnq3jcrstzNlrvBc9HTR/N9cd8LsnvqBI+OM+hVjiRg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0ks02udm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 05:38:46 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 27 Oct 2025 22:38:45 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 27 Oct 2025 22:38:44 -0700
From: <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 1/1] bind: upgrade 9.18.33 -> 9.18.41
Date: Tue, 28 Oct 2025 11:08:40 +0530
Message-ID: <20251028053840.1943419-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: w5BHeGaxVOottD-yIwTfE5r4nNrPel5l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA0OCBTYWx0ZWRfXyKK8ptRAubnn
 0A3K0oUtbUmDTKYjrQXPBXG7SS49opX5ATzOnH/2SE92NVSJwN4p51LGs9yCuYPSQUUZFEZp8gP
 9NX+3TbjfLbSCDui4x7FGp0+BQTaNItih93a8OMEgCywC+GECNU+q0AEkhqEsoGG0ISmr3ENmii
 pX52vTRg6/g5Cu/63CIF9zSH1eRuzAo7n3xJd6rjeoReakSkHOnHL5QkzrCEO6i3X1DVsCxlw9S
 0ZzvEmJQ2D7xL4v2bPEp4Y337YE8uDGQgRd8nzkaRMM35iHx+ZBThzjQ2eTGTu2JvFB7iH9A7zV
 QLvsAzoIlg9jT+ugJJ30jDLjDJlOdkz3Siu/Qw+9CGOnMbiYui2jxTh9LZQL+1dRoukdWFo/foR
 HxPaaH7770G4ZsNVYBDo9wp2J9TW0A==
X-Authority-Analysis: v=2.4 cv=CIknnBrD c=1 sm=1 tr=0 ts=690056e7 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=SCo1hh1FAAAA:8 a=t7CeM3EgAAAA:8
 a=xv1HU-Km8W5SAnzCjQAA:9 a=VoyrXqxu6hIA:10 a=jjiDOD437DYA:10
 a=nwb-CePKZZm3gL-ai9HY:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: w5BHeGaxVOottD-yIwTfE5r4nNrPel5l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 05:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225378

From: Praveen Kumar <praveen.kumar@windriver.com>

This upgrade fixes
CVE-2025-8677,CVE-2025-40778 and CVE-2025-40780.

Changelog
==========
https://downloads.isc.org/isc/bind9/9.18.41/doc/arm/html/changelog.html

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../bind/{bind_9.18.33.bb => bind_9.18.41.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.33.bb => bind_9.18.41.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.33.bb b/meta/recipes-connectivity/bind/bind_9.18.41.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.33.bb
rename to meta/recipes-connectivity/bind/bind_9.18.41.bb
index 2554a7bb5f..a83ec29bb4 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.33.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.41.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "fb373fac5ebbc41c645160afd5a9fb451918f6c0e69ab1d9474154e2b515de40"
+SRC_URI[sha256sum] = "6ddc1d981511c4da0b203b0513af131e5d15e5f1c261145736fe1f35dd1fe79d"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.40.0


