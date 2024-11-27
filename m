Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE40D6D24E
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 23:36:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.84798.1732750566970692173
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 15:36:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1061310084=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ARNVK0Z014252
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 15:36:06 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43671c8cyk-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 15:36:05 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 27 Nov 2024 15:36:01 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 27 Nov 2024 15:36:01 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/4] scocat: upgrade 1.8.0.0 -> 1.8.0.1
Date: Wed, 27 Nov 2024 15:36:00 -0800
Message-ID: <20241127233600.4124020-4-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241127233600.4124020-1-hongxu.jia@windriver.com>
References: <20241127233600.4124020-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: WxX0nzA-_OY-CMzlJuUUF_H949YZAjnD
X-Proofpoint-ORIG-GUID: WxX0nzA-_OY-CMzlJuUUF_H949YZAjnD
X-Authority-Analysis: v=2.4 cv=QYicvtbv c=1 sm=1 tr=0 ts=6747ace5 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=-AnQz9JOAAAA:8 a=rFFRleaeAAAA:8 a=t7CeM3EgAAAA:8 a=0tM9zMZimARFnrHklU0A:9 a=3bnadFWGKyIZm4bBUiDd:22
 a=YLtI_f64H5IAZ6mI3Lwl:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-27_10,2024-11-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2411270185
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 23:36:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207971

Rebase 0001-fix-compile-procan.c-failed.patch to 1.8.0.1

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-fix-compile-procan.c-failed.patch    | 30 +++++++++----------
 .../{socat_1.8.0.0.bb => socat_1.8.0.1.bb}    |  2 +-
 2 files changed, 16 insertions(+), 16 deletions(-)
 rename meta/recipes-connectivity/socat/{socat_1.8.0.0.bb => socat_1.8.0.1.bb} (95%)

diff --git a/meta/recipes-connectivity/socat/files/0001-fix-compile-procan.c-failed.patch b/meta/recipes-connectivity/socat/files/0001-fix-compile-procan.c-failed.patch
index 9051ae1abe..ea00dfa0a9 100644
--- a/meta/recipes-connectivity/socat/files/0001-fix-compile-procan.c-failed.patch
+++ b/meta/recipes-connectivity/socat/files/0001-fix-compile-procan.c-failed.patch
@@ -1,7 +1,7 @@
-From 4f887cc665c9a48b83e20ef4abe57afa7e365e0e Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@eng.windriver.com>
-Date: Tue, 5 Dec 2023 23:02:22 -0800
-Subject: [PATCH v2] fix compile procan.c failed
+From c4c3d5f2d4dfe8167205e8d20b4cb7a197706c16 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 27 Nov 2024 04:09:59 -0800
+Subject: [PATCH] fix compile procan.c failed
 
 1. Compile socat failed if out of tree build (build dir != source dir)
 ...
@@ -24,23 +24,23 @@ C source compile. Use first word of $(CC) to defeine marco CC
 [1] https://repo.or.cz/socat.git/commit/cd5673dbd0786c94e0b3ace7e35fab14c01e3185
 
 Upstream-Status: Submitted [socat@dest-unreach.org]
-Signed-off-by: Hongxu Jia <hongxu.jia@eng.windriver.com>
+
+Rebase to 1.8.0.1
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- Makefile.in | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
+ Makefile.in | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index c01b1a4..48dad69 100644
+index 631d31d..103d4d1 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -109,8 +109,8 @@ depend: $(CFILES) $(HFILES)
- socat: socat.o libxio.a
+@@ -110,7 +110,7 @@ socat: socat.o libxio.a
  	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ socat.o libxio.a $(CLIBS)
  
--procan.o: procan.c
--	$(CC) $(CFLAGS) -c -D CC=\"$(CC)\" -o $@ procan.c
-+procan.o: $(srcdir)/procan.c
-+	$(CC) $(CFLAGS) -c -D CC=\"$(firstword $(CC))\" -o $@ $(srcdir)/procan.c
+ procan.o: $(srcdir)/procan.c
+-	$(CC) $(CFLAGS) -c -D CC="\"$(CC)\"" -o $@ $(srcdir)/procan.c
++	$(CC) $(CFLAGS) -c -D CC="\"$(firstword $(CC))\"" -o $@ $(srcdir)/procan.c
  
  PROCAN_OBJS=procan_main.o procan.o procan-cdefs.o hostan.o error.o sycls.o sysutils.o utils.o vsnprintf_r.o snprinterr.o
  procan: $(PROCAN_OBJS)
@@ -58,5 +58,5 @@ index c01b1a4..48dad69 100644
  	$(INSTALL) -m 755 filan $(DESTDIR)$(BINDEST)
  	mkdir -p $(DESTDIR)$(MANDEST)/man1
 -- 
-2.42.0
+2.25.1
 
diff --git a/meta/recipes-connectivity/socat/socat_1.8.0.0.bb b/meta/recipes-connectivity/socat/socat_1.8.0.1.bb
similarity index 95%
rename from meta/recipes-connectivity/socat/socat_1.8.0.0.bb
rename to meta/recipes-connectivity/socat/socat_1.8.0.1.bb
index 912605c95c..95b4017040 100644
--- a/meta/recipes-connectivity/socat/socat_1.8.0.0.bb
+++ b/meta/recipes-connectivity/socat/socat_1.8.0.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://0001-fix-compile-procan.c-failed.patch \
 "
 
-SRC_URI[sha256sum] = "e1de683dd22ee0e3a6c6bbff269abe18ab0c9d7eb650204f125155b9005faca7"
+SRC_URI[sha256sum] = "6a283565db7cf86292c6f70504c58abb03e29888adeed5a6c5f3457e803c1b81"
 
 inherit autotools
 
-- 
2.25.1


