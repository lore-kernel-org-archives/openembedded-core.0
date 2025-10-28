Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D95CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 05:37:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5138.1761629848962989634
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 22:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JdlUx3JU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2396287873=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S5O8TB3792318
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 05:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=5FrAqOU6Jd20hjwcif2/
	4XaEVmKf4Qk/ZeDeKsO11+4=; b=JdlUx3JUSZEI41KbWBVytBMq48AzdixNqGLd
	k7v7j5kIAj0V1GlCsIoTfqXGhHz62Zta5e/19p5cBkdYeLtuNQHiCr7u9DV9Nta/
	WqP5z7EV3U2894Q+wv/ugCrOAC8rF1vKG54osxYKPLb5BreZoURZshZ2509IZr3T
	XpBTB92fJOkQ2OiOBo5bU1TevtEf3gwDItBCxh7MKiNGL1QzujNzH4GN3nhGkR8i
	DuhdLlSK0T1GbL7NeAeJyzow6dGgPZuq/+B5p6HwjYfMZKaFRbixKS6TC0dwGkt8
	IWWYaVdhk0qDVb6TvE6oL2gDok66BfcHuokdOOtdKeZGOD4RmQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0nh5tsfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 05:37:27 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 27 Oct 2025 22:37:26 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 27 Oct 2025 22:37:25 -0700
From: <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][PATCH 1/1] bind: upgrade 9.20.13 -> 9.20.15
Date: Tue, 28 Oct 2025 11:07:20 +0530
Message-ID: <20251028053720.1942094-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9B8CA3pBL6QwKO7jOdANZCVhuiEHZ56_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA0NyBTYWx0ZWRfXx98+CDM02zbM
 lnkpgMT/xj5LIcwwUxEL9sl8e4j1c3SNauQCKuA5qepooRJwo61jaSyYXRXPbiypKGWfNw03KDB
 Ez8hr4PD3hcrOSVpMIY/KsQufmBNwrwJQnYHt77D3mJ7bM586nmHPwXWUfAklRBHriJTdQmzZid
 Gsxq8f2eJYSOKKSKBTxsJ4chyhIZQ2qd3Ztmo8bnA95ZZIqoEbltlRAWpk6bHXWwbpDZSMDbT6i
 28C9psK+Y9DmhK7S+8V7iPRBJ/uf3pWh/DmiEN8IKAjma2vqi2RYQTZQaq4fqk3unQXrmEB0ra9
 tRGth1vo7qioTTA2/qVGo4t3NvxyBa185Jb0pCmsSlCFtMbWZf7ckSQ/+cat6dpz1pQYUZV5LZh
 dP84wnyahl3BA9JeJUenHVM3bNiWzA==
X-Authority-Analysis: v=2.4 cv=FOoWBuos c=1 sm=1 tr=0 ts=69005697 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=SCo1hh1FAAAA:8 a=t7CeM3EgAAAA:8
 a=4-cfhGQ3Sisdgk4Y4jQA:9 a=i8htoZFzETQA:10 a=jjiDOD437DYA:10
 a=nwb-CePKZZm3gL-ai9HY:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 9B8CA3pBL6QwKO7jOdANZCVhuiEHZ56_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 05:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225377

From: Praveen Kumar <praveen.kumar@windriver.com>

This upgrade fixes
CVE-2025-8677,CVE-2025-40778 and CVE-2025-40780.

Changelog
==========
https://downloads.isc.org/isc/bind9/9.20.15/doc/arm/html/changelog.html

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../bind/{bind_9.20.13.bb => bind_9.20.15.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.13.bb => bind_9.20.15.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.13.bb b/meta/recipes-connectivity/bind/bind_9.20.15.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.13.bb
rename to meta/recipes-connectivity/bind/bind_9.20.15.bb
index de39924c3d..1195b5bdc3 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.13.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.15.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "151f9376ead317e646a5d0c9f01c060386d891118d7437a7f829bb9727c7b34c"
+SRC_URI[sha256sum] = "d62b38fae48ba83fca6181112d0c71018d8b0f2ce285dc79dc6a0367722ccabb"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.40.0


