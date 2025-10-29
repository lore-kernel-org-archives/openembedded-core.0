Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD07CCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 03:28:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.391.1761708519478760738
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 20:28:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aoz/qsBn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3397ba8ff2=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T2OUas1112271
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 20:28:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=rLIm1ua8W5o5/NPttoFp
	mACAUwjaArf6aIMuE1uHLkc=; b=aoz/qsBnIXYpGPXd+v4kV8v1uDCbDZXdFS8h
	6oFF1FR4Vwtw1kaT6VpESwuCVsYVmTdi3Th0RTzcfHo9unykXcVzy0MKGY6H58w/
	WwUAlCRzg2AWs0kn8fH7DuZhuIA6InaORYCotmmYwDE6IdJoat8+yeyfHndxn8Ee
	Ni9oUQF+8jcsW5YmQ+ZLIA5eEtGl3zmY/4y7pyG4Af6Nsp8btBxAhL6zrVcziiHf
	ovaiS/X8SZ4iWyG6x9a4oOOL7SEvweofGM3E3HgleuQILN0v3kzn/ZfquW0xXGgL
	MqYzs3EPn+nz7WtwSzT7YLKOB5yI4npsuy8HKUHH2aD15pvXlg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a34890d7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 20:28:39 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 28 Oct 2025 20:28:38 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 28 Oct 2025 20:28:37 -0700
From: <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] bind: upgrade 9.18.33 -> 9.18.41
Date: Wed, 29 Oct 2025 08:58:32 +0530
Message-ID: <20251029032832.1558928-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: SOSJcCdyyR-h9lRKMpGNcYOcU40SgDoL
X-Proofpoint-ORIG-GUID: SOSJcCdyyR-h9lRKMpGNcYOcU40SgDoL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAyNSBTYWx0ZWRfX6FOoqHUe1r1s
 7J9rZbd2ObsDUL/1DYdQUVXGb73M3qY17IrfV9ZBYNQ44GjFvXXXMaAdHejxbpCW9CUFdmAhsmL
 GjkFk75KWdDVHAHZV9kTB6gO02N4Bf7Sq5Dzt3wcFcUbHn+wNBkEaj+71C0+syHkcoE9bw0gMQx
 u0oYpXphCZ9Q7cTrdYajtnudwYNp2VdAkGuXBYvma359plvYfh/yLxcYaZMhOLgIiTfNpocUJdF
 pJPUs84WZvu+s18e38X4vrNwmKvfsI2ejVvyaAmiJIrGKuSgqcg1EgovZKtQp4vJJKdLH6HK5iY
 cM4MmxzDCOveh81LdwaRpqPUwyevFuT2xkCGfcWyTJaMYAWN7RLRMx03iIu7zwTlj5bc8kXD1tf
 6+iL8YAOnIlM3rjqcTSDjK3OYdccaQ==
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=690189e7 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=SCo1hh1FAAAA:8 a=t7CeM3EgAAAA:8
 a=xv1HU-Km8W5SAnzCjQAA:9 a=VoyrXqxu6hIA:10 a=jjiDOD437DYA:10
 a=nwb-CePKZZm3gL-ai9HY:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 03:28:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225428

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
index ceea149699..0e557163d5 100644
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


