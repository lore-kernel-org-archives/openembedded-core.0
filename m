Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A94BFC83F1A
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 09:28:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8463.1753349301887620757
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 02:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9300d03ff4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56O8UMSn561675
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 09:28:21 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 483hbq01q0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 09:28:20 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 24 Jul 2025 02:28:19 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 24 Jul 2025 02:28:18 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3 4/4] lttng-tools: Remove the scope resolution operator
Date: Thu, 24 Jul 2025 17:28:14 +0800
Message-ID: <20250724092814.4183226-4-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250724092814.4183226-1-mingli.yu@eng.windriver.com>
References: <20250724092814.4183226-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Y9f4sgeN c=1 sm=1 tr=0 ts=6881fcb4 cx=c_pps
 a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17
 a=Wb1JkmetP80A:10 a=a5LkSv8FAAAA:8 a=t7CeM3EgAAAA:8 a=6zuJ2OBVxoR8M5G13BoA:9
 a=E2cWBXyb0kjxxB1PlMdk:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 939CZY8DBAj6LXKEPu74KO4zqFuanC-e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA3MCBTYWx0ZWRfXyntvpT/0osPH
 Rk2TwctNC4AQwbBiubAP7hn9MORlRzzIPKX4MjxD9QS2jn6j4IjcAPsIZGPx7Xtx/DOzSgGdmgn
 ltJw6bpMF8ETMVEmBhRCEob7TiC9zKLNoaoI808ZxZP0A57q8eDYnt/Dnlsimf/EqnbfhVBX0Ru
 bUIYQl8eq2IWp4YQTOY3TMI1iuSDVBycqwxksOxf7MUZckPeSgItvoKXYrD2GUu/alay1+LdsoV
 irfikF/bbfJdJjE4Ute9HMFm5Unw5WO2wJVj2VCrcg5Z6AyY7RAoaMzJxPkTKE4ydiix5MTGhcJ
 1mJ2xcYkogR4RIu87aZB/9NERtV9wPpQAaOyFGurL990izUaVkimAJczBEjQaUWDtcO4Baym/Cg
 h2VoIGF0
X-Proofpoint-ORIG-GUID: 939CZY8DBAj6LXKEPu74KO4zqFuanC-e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507210000 definitions=main-2507240061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 09:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220829

From: Mingli Yu <mingli.yu@windriver.com>

Remove the scope resolution operator :: to fix the below build failure.
 | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:18:31: error: expected id-expression before numeric constant
 |    18 |                 int flags = ::EFD_CLOEXEC;
 |       |                               ^~~~~~~~~~~
 | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:21:36: error: expected id-expression before numeric constant
 |    21 |                         flags |= ::EFD_SEMAPHORE;
 |       |

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...Remove-the-scope-resolution-operator.patch | 41 +++++++++++++++++++
 .../lttng/lttng-tools_2.14.0.bb               |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch
new file mode 100644
index 0000000000..02bd1d1db0
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch
@@ -0,0 +1,41 @@
+From da83d31a8dd555c28eb27bd7a7d3c53b51d5f276 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Sun, 20 Jul 2025 16:37:57 +0800
+Subject: [PATCH] eventfd.cpp: Remove the scope resolution operator
+
+Remove the scope resolution operator :: to fix the below build failure
+with musl.
+ | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:18:31: error: expected id-expression before numeric constant
+ |    18 |                 int flags = ::EFD_CLOEXEC;
+ |       |                               ^~~~~~~~~~~
+ | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:21:36: error: expected id-expression before numeric constant
+ |    21 |                         flags |= ::EFD_SEMAPHORE;
+ |       |                                    ^~~~~~~~~~~~~
+
+Upstream-Status: Pending [The message to lttng-dev awaits moderator approval]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/common/eventfd.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/common/eventfd.cpp b/src/common/eventfd.cpp
+index fe5b549..3379b0b 100644
+--- a/src/common/eventfd.cpp
++++ b/src/common/eventfd.cpp
+@@ -15,10 +15,10 @@
+ 
+ lttng::eventfd::eventfd(bool use_semaphore_semantics, std::uint64_t initial_value) :
+ 	file_descriptor([use_semaphore_semantics, initial_value]() {
+-		int flags = ::EFD_CLOEXEC;
++		int flags = EFD_CLOEXEC;
+ 
+ 		if (use_semaphore_semantics) {
+-			flags |= ::EFD_SEMAPHORE;
++			flags |= EFD_SEMAPHORE;
+ 		}
+ 
+ 		const auto raw_fd = ::eventfd(initial_value, flags);
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
index da3bdd4052..6dc9e4e7b3 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
@@ -46,6 +46,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://lttng-sessiond.service \
            file://disable-tests.patch \
            file://0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch \
+           file://0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch \
            "
 
 SRC_URI[sha256sum] = "d8c39c26cec13b7bd82551cd52a22efc358b888e36ebcf9c1b60ef1c3a3c2fd3"
-- 
2.34.1


