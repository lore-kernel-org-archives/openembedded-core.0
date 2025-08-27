Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE74ACA0EFF
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 05:18:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8229.1756271936324595862
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 22:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eJ5I57gf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0334c62af5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57R4vTMK3449704
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 05:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=fT/4szGpVsCiJ7hy6GsQ
	lqVyuu5gjXNl/rAjtFe2Yyg=; b=eJ5I57gf1fItXV5ESDK5xaT2J0qVxAlrcy3b
	cPHYghMDMJvWnpzYwNXuDKO/VM+rFhZ+jFphcB4xBOo2bS0DDab3z+D8YgC4jyqL
	gQ4GdIMSYeQ+yEe3eMMsIiHVnJfnOnz/SveKm/r5UTD9ymRdXmA6O/6aTMb/DwB9
	+WfFpvT8CcL6yRvlgoPFg2QWvtdW6A43l4NvTo/Zk308StvQSknCQq3kG5GcxJYO
	WO9sHD4PctOftyI1qNhy8GTs69pn8dZn9gcu/ofs74ICuBFSPjg9CfNlzLStEs3b
	ACCOP9wg7LlmkU3qJao8qYEwRZJNEPRN8cGWUA119PpLrUWZtQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q2v1c6w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 05:18:55 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 26 Aug 2025 22:18:53 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 26 Aug 2025 22:18:53 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] rpcbind: 1.2.7 -> 1.2.8
Date: Wed, 27 Aug 2025 13:18:50 +0800
Message-ID: <20250827051852.3900650-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: tD52l7qgvOIX4bddejrBUTYlu2M_ys-s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDA0MSBTYWx0ZWRfX5L1zzDEKkcs/
 hP1432sD1Xn3vYudTDaQn4KeoE555EcGEQK8pjO4/XepqpnpYM8e5VHdxrrKNj1YVlNHwCgF2MT
 cvbcpdopBBsT7pMLrrsRwnWTaPBgzkQWzcFRjwtBRqgEJxglHxTd1mKb5d2KAD5fq24hjAM/jsP
 Qs7le7hmPyVNCUKGC09hBrVuTx843vCQhCkVq6b1IyfgjqH/H2nEB/fRJxhPkoDV+LuzLmQp4yd
 qKNhjYuXasMKlmMbYh9qx9oO5FIju/EFKsViOqEopEgv0gZ04SG46wHVrht9HmnOtlQAUil1xYR
 55ETmhJdn1LgTRkLTyGgVlaia6WN3hfl6GfcSOQW4B7E272F2OhiXVbWE8ZA5I=
X-Authority-Analysis: v=2.4 cv=T5GMT+KQ c=1 sm=1 tr=0 ts=68ae953f cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=FP58Ms26AAAA:8 a=t7CeM3EgAAAA:8 a=m8ToADvmAAAA:8
 a=IW1oNcqgKBk8tCxNpRgA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-GUID: tD52l7qgvOIX4bddejrBUTYlu2M_ys-s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 05:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222492

Refresh patches
- rpcbind_add_option_to_fix_port_number.patch
- 0001-systemd-use-EnvironmentFile.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-systemd-use-EnvironmentFile.patch    | 22 ++++++++-----
 ...pcbind_add_option_to_fix_port_number.patch | 31 ++++++++++---------
 .../{rpcbind_1.2.7.bb => rpcbind_1.2.8.bb}    |  2 +-
 3 files changed, 31 insertions(+), 24 deletions(-)
 rename meta/recipes-extended/rpcbind/{rpcbind_1.2.7.bb => rpcbind_1.2.8.bb} (96%)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
index 1d7ba7d5081..28d83e74f51 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
@@ -1,19 +1,20 @@
-From da528d5d60137f13202102b53cf178aba45849a5 Mon Sep 17 00:00:00 2001
+From 87a9931e4aa97d7b6eb3b25f26444e30e45e3e41 Mon Sep 17 00:00:00 2001
 From: Stefan Agner <stefan.agner@toradex.com>
-Date: Sun, 6 Oct 2019 00:05:54 +0200
+Date: Wed, 27 Aug 2025 11:30:48 +0800
 Subject: [PATCH] systemd: use EnvironmentFile
 
 Use OE specific environment file.
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  configure.ac               | 2 ++
- systemd/rpcbind.service.in | 1 +
- 2 files changed, 3 insertions(+)
+ systemd/rpcbind.service.in | 6 +++---
+ 2 files changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 8f4cef3..4705413 100644
+index 6ede0af..d1ae5e4 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -86,5 +86,7 @@ AC_CHECK_HEADERS([nss.h])
@@ -25,14 +26,19 @@ index 8f4cef3..4705413 100644
  
  AC_OUTPUT([Makefile systemd/rpcbind.service systemd/rpcbind.socket])
 diff --git a/systemd/rpcbind.service.in b/systemd/rpcbind.service.in
-index c892ca8..e0511bd 100644
+index 771b944..5992098 100644
 --- a/systemd/rpcbind.service.in
 +++ b/systemd/rpcbind.service.in
-@@ -12,6 +12,7 @@ Wants=rpcbind.target
- [Service]
+@@ -23,9 +23,9 @@ ProtectControlGroups=true
+ RestrictRealtime=true
  Type=notify
  # distro can provide a drop-in adding EnvironmentFile=-/??? if needed.
+-EnvironmentFile=-/etc/rpcbind.conf
+-EnvironmentFile=-/etc/default/rpcbind
+-EnvironmentFile=-/etc/sysconfig/rpcbind
 +EnvironmentFile=-@_sysconfdir@/rpcbind.conf
++EnvironmentFile=-@_sysconfdir@/default/rpcbind
++EnvironmentFile=-@_sysconfdir@/sysconfig/rpcbind
  ExecStart=@_sbindir@/rpcbind $RPCBIND_OPTIONS @warmstarts_opt@ -f
  
  [Install]
diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch b/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
index 535f9ce20dd..3205ff30861 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind_add_option_to_fix_port_number.patch
@@ -1,6 +1,6 @@
-From 76f8598fd20727908e760cbb497dd6a17eda4af5 Mon Sep 17 00:00:00 2001
+From 285c193dc94b53763ac8d6f91229eaab37d45fc6 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
-Date: Wed, 17 Sep 2014 13:22:14 +0800
+Date: Wed, 27 Aug 2025 11:24:53 +0800
 Subject: [PATCH] add option to make users able to use fixed port number
 
 Upstream-Status: Submitted [https://sourceforge.net/p/rpcbind/discussion/716839/thread/32af721d/]
@@ -8,6 +8,7 @@ Upstream-Status: Submitted [https://sourceforge.net/p/rpcbind/discussion/716839/
 Signed-off-by: Li Wang <li.wang@windriver.com>
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  man/rpcbind.8      |  4 +++-
  src/rpcb_svc_com.c | 17 +++++++++++++++++
@@ -15,15 +16,15 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  3 files changed, 26 insertions(+), 3 deletions(-)
 
 diff --git a/man/rpcbind.8 b/man/rpcbind.8
-index fbf0ace..66f7c08 100644
+index 15b70f9..4a6ffbc 100644
 --- a/man/rpcbind.8
 +++ b/man/rpcbind.8
 @@ -11,7 +11,7 @@
  .Nd universal addresses to RPC program number mapper
  .Sh SYNOPSIS
  .Nm
--.Op Fl adhiLls
-+.Op Fl adhpiLls
+-.Op Fl adfhilsvw
++.Op Fl adfhpilsvw
  .Sh DESCRIPTION
  The
  .Nm
@@ -86,10 +87,10 @@ index 1743dad..07a1c75 100644
  	if (xprt == NULL) {
  		if (debugging)
 diff --git a/src/rpcbind.c b/src/rpcbind.c
-index 25d8a90..36a95b9 100644
+index bf7b499..7268907 100644
 --- a/src/rpcbind.c
 +++ b/src/rpcbind.c
-@@ -111,6 +111,7 @@ int runasdaemon = 0;
+@@ -112,6 +112,7 @@ int runasdaemon = 0;
  int insecure = 0;
  int oldstyle_local = 0;
  int verboselog = 0;
@@ -97,16 +98,16 @@ index 25d8a90..36a95b9 100644
  
  char **hosts = NULL;
  int nhosts = 0;
-@@ -884,7 +885,7 @@ parseargs(int argc, char *argv[])
+@@ -959,7 +960,7 @@ parseargs(int argc, char *argv[])
  {
  	int c;
  	oldstyle_local = 1;
--	while ((c = getopt(argc, argv, "adh:ilswf")) != -1) {
-+	while ((c = getopt(argc, argv, "adh:p:ilswf")) != -1) {
+-	while ((c = getopt(argc, argv, "adfh:ilsvw")) != -1) {
++	while ((c = getopt(argc, argv, "adfh:p:ilsvw")) != -1) {
  		switch (c) {
  		case 'a':
  			doabort = 1;	/* when debugging, do an abort on */
-@@ -902,6 +903,9 @@ parseargs(int argc, char *argv[])
+@@ -977,6 +978,9 @@ parseargs(int argc, char *argv[])
  			if (hosts[nhosts - 1] == NULL)
  				errx(1, "Out of memory");
  			break;
@@ -116,15 +117,15 @@ index 25d8a90..36a95b9 100644
  		case 'i':
  			insecure = 1;
  			break;
-@@ -920,7 +924,7 @@ parseargs(int argc, char *argv[])
+@@ -999,7 +1003,7 @@ parseargs(int argc, char *argv[])
  			break;
  #endif
  		default:	/* error */
--			fprintf(stderr,	"usage: rpcbind [-adhilswf]\n");
-+			fprintf(stderr, "usage: rpcbind [-adhpilswf]\n");
+-			fprintf(stderr,	"usage: rpcbind [-adfhilsvw]\n");
++			fprintf(stderr,	"usage: rpcbind [-adfhpilsvw]\n");
  			exit (1);
  		}
  	}
 -- 
-2.25.1
+2.34.1
 
diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
similarity index 96%
rename from meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb
rename to meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
index e186bc35e10..b669a53ae99 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.7.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
@@ -18,7 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://rpcbind_add_option_to_fix_port_number.patch \
            file://0001-systemd-use-EnvironmentFile.patch \
           "
-SRC_URI[sha256sum] = "f6edf8cdf562aedd5d53b8bf93962d61623292bfc4d47eedd3f427d84d06f37e"
+SRC_URI[sha256sum] = "964132c389918e8964d7334936b6dd10ef025b300c6b29e693ba0f29550e3de5"
 
 inherit autotools update-rc.d systemd pkgconfig update-alternatives sourceforge-releases
 
-- 
2.34.1


