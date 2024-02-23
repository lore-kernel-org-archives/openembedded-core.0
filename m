Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07AD9C5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 06:19:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5356.1708669193530836062
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 22:19:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nCYWTdN0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=278352982c=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41N6GBY3014205
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 06:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=JOfS1
	BzNTT7pysvllFfa9IQwwvpHMiQbZk1P/EFaPJ8=; b=nCYWTdN0iJ814mURQcacV
	P8UwJKBboky2qikDhd914krBB8BmpAnjvm4tEOwHHOlfMGcsQ5iurJYt7j7cOvCD
	z0Oqq5nrW70L/25JZFcJxjbptl3l6Xi3tOdf5yJN1wzNt94CYZH8M4a6OV/F3b49
	eVHhYfNv1+1x2Wa9XFxrY0V7/mMM1NDrvRIkaIRSdx/eEIJ01/GTFt+uhrj2cbLE
	J0Mq0c4Oj5rs2CWBQ37WDdKRJ88Gk1N+v0fg0t7jO8+6eqOWWAUecLOFBmSruQNG
	iaM822jjd2xCkh6yNzuipzvSwcfMKyA6n9rkySMtYvLMB2xwyKyjSBEuix08Cy+/
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wd218ju76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 06:19:52 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 22:19:49 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/1] bind: Upgrade 9.18.21 -> 9.18.24
Date: Fri, 23 Feb 2024 06:19:12 +0000
Message-ID: <20240223061912.3325521-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 6DmEzZawWqe7RGu1DzqaPiqEyYb035J4
X-Proofpoint-ORIG-GUID: 6DmEzZawWqe7RGu1DzqaPiqEyYb035J4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402230042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 06:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196048

From: Soumya Sambu <soumya.sambu@windriver.com>

Changelog:
=========
9.18.24:
	- Fix case insensitive setting for isc_ht hashtable.
	[GL #4568]

9.18.23:
	- Specific DNS answers could cause a denial-of-service
	condition due to DNS validation taking a long time.
	(CVE-2023-50387) [GL #4424]
	- Change 6315 inadvertently introduced regressions that
	could cause named to crash. [GL #4234]
	- Under some circumstances, the DoT code in client
	mode could process more than one message at a time when
	that was not expected. That has been fixed. [GL #4487]

9.18.22:
	- Limit isc_task_send() overhead for RBTDB tree pruning.
	[GL #4383]
	- Restore DNS64 state when handling a serve-stale timeout.
	(CVE-2023-5679) [GL #4334]
	- Specific queries could trigger an assertion check with
	nxdomain-redirect enabled. (CVE-2023-5517) [GL #4281]
	- Speed up parsing of DNS messages with many different
	names. (CVE-2023-4408) [GL #4234]
	- Address race conditions in dns_tsigkey_find().
	[GL #4182]
	- Conversion from NSEC3 signed to NSEC signed could
	temporarily put the zone into a state where it was
	treated as unsigned until the NSEC chain was built.
	Additionally conversion from one set of NSEC3 parameters
	to another could also temporarily put the zone into a
	state where it was treated as unsigned until the new
	NSEC3 chain was built. [GL #1794] [GL #4495]
	- Memory leak in zone.c:sign_zone. When named signed a
	zone it could leak dst_keys due to a misplaced
	'continue'. [GL #4488]
	- Log more details about the cause of "not exact" errors.
	[GL #4500]
	- The wrong time was being used to determine what RRSIGs
	where to be generated when dnssec-policy was in use.
	[GL #4494]
	- The "trust-anchor-telemetry" statement is no longer
	marked as experimental. This silences a relevant log
	message that was emitted even when the feature was
	explicitly disabled. [GL #4497]
	- Fix statistics export to use full 64 bit signed numbers
	instead of truncating values to unsigned 32 bits.
	[GL #4467]
	- NetBSD has added 'hmac' to libc which collides with our
	use of 'hmac'. [GL #4478]

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../bind/{bind_9.18.21.bb => bind_9.18.24.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.21.bb => bind_9.18.24.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.21.bb b/meta/recipes-connectivity/bind/bind_9.18.24.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.21.bb
rename to meta/recipes-connectivity/bind/bind_9.18.24.bb
index f5fb4bd1e5..2874990320 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.21.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.24.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "a556be22505d9ea4f9c6717aee9c549739c68498aff3ca69035787ecc648fec5"
+SRC_URI[sha256sum] = "709d73023c9115ddad3bab65b6c8c79a590196d0d114f5d0ca2533dbd52ddf66"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.40.0


