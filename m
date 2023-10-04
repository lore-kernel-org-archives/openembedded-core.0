Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF98E7B5EE
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 11:01:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15617.1696417312393699779
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 04:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ea/0ddEW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8641142f6c=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 394AtHKd002585
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Oct 2023 04:01:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=0l71q
	l66jW32EdeXBwtHX8K4PJ5XtrlOzXm6h/Iw6Ek=; b=ea/0ddEWHwlnJfs8FA37e
	2J5kW7CGSTIp48sl58U0xA5aQUdH1hQ4hh4j6tJRKnZoxMpQBVtM8Zy+tLW2jrzS
	3NNHDqqyHUuB+umqnmujshVmdibVVw4QQ/1HRBWImYNu1f+y7Fw0/kw8HmgHt8+w
	l5GvSmYz9jcGBKrbVgNfhVYtfUPURSkSEV5ynAhNG9bIPGeN2xTm5C553eMgFPER
	WzC9uC3yBG6lvrxEnFtyzFwskqaXWgHl+96LX4GLRX354/3bdK8myg0C1dQgyYmN
	EGjAe4jpSs5VsRev5tOr7LnVqEKy9w5DKuhhKAI2rnZKbiDM17F6+qWNrE+kJXBz
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3teey0kpa2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 04:01:51 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 04:01:49 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH v2 1/1] glibc: Update to latest on stable 2.35 branch
Date: Wed, 4 Oct 2023 11:01:22 +0000
Message-ID: <20231004110122.795523-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: FHmP8ga7-MrfnLo8n5r3FUV_qm0oKJHf
X-Proofpoint-ORIG-GUID: FHmP8ga7-MrfnLo8n5r3FUV_qm0oKJHf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_02,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 phishscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310040080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 11:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188672

From: Soumya Sambu <soumya.sambu@windriver.com>

Adresses CVE-2023-4813, CVE-2023-4806, CVE-2023-5156. Added these to CVE_CHECK_IGNORE
to avoid in cve-check reports since the recipe version did not change.

These are the complete list of changes this brings

* 73d4ce728a Document CVE-2023-4806 and CVE-2023-5156 in NEWS
* 17092c0311 Fix leak in getaddrinfo introduced by the fix for CVE-2023-4806 [BZ #30843]*
* 762a747fae io: Fix record locking contants for powerpc64 with __USE_FILE_OFFSET64
* e3ccb230a9 getaddrinfo: Fix use after free in getcanonname (CVE-2023-4806)
* 1b9087dcec gethosts: Return EAI_MEMORY on allocation failure
* f5f88f142a gaih_inet: Split result generation into its own function
* a6da106892 gaih_inet: split loopback lookup into its own function
* 8b70d97b08 gaih_inet: make gethosts into a function
* 9098deb96a gaih_inet: separate nss lookup loop into its own function
* ce64e72b7d gaih_inet: Split nscd lookup code into its own function.
* 4897bf7968 gaih_inet: Split simple gethostbyname into its own function
* 571c531b3b gaih_inet: make numeric lookup a separate routine
* 9aad91abe6 gaih_inet: Simplify service resolution
* d02808dee9 getaddrinfo: Fix leak with AI_ALL [BZ #28852]
* f366eaa608 gaih_inet: Simplify canon name resolution
* b126325fc7 nss: Sort tests and tests-container and put one test per line
* 6e867146ee Simplify allocations and fix merge and continue actions [BZ #28931]
* 59ee83b0c2 elf: Move l_init_called_next to old place of l_text_end in link map
* 34b07bdbdd elf: Remove unused l_text_end field from struct link_map
* 02a67e102f elf: Always call destructors in reverse constructor order (bug 30785)
* aeea91fd15 elf: Do not run constructors for proxy objects
* 1d828d5855 elf: Introduce to _dl_call_fini

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.35.bb     | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index f23ceb5a25..c23a43576c 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "561e9dadc02f46a7ba2190c0a04259583479f6c9"
+SRCREV_glibc ?= "73d4ce728a59deb2fd18969e559769b3f590fac9"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index df847e76bf..b4bad5b7ac 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -16,6 +16,9 @@ CVE_CHECK_IGNORE += "CVE-2019-1010022 CVE-2019-1010023 CVE-2019-1010024"
 # Potential patch at https://sourceware.org/bugzilla/show_bug.cgi?id=22853
 CVE_CHECK_IGNORE += "CVE-2019-1010025"
 
+# To avoid these in cve-check reports since the recipe version did not change
+CVE_CHECK_IGNORE += "CVE-2023-4813 CVE-2023-4806 CVE-2023-5156"
+
 DEPENDS += "gperf-native bison-native"
 
 NATIVESDKFIXES ?= ""
-- 
2.40.0


