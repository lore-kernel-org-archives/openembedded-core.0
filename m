Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA9DD6D247
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 23:36:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.84797.1732750564124733040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 15:36:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1061310084=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ARNVK0U014252
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 15:36:03 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43671c8cyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 15:36:01 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 27 Nov 2024 15:36:00 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 27 Nov 2024 15:36:00 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/4] man-db: upgrade 2.12.1 -> 2.13.0
Date: Wed, 27 Nov 2024 15:35:57 -0800
Message-ID: <20241127233600.4124020-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: MxHkwgB7yFv96yD7uekhKuVsRgURGGjO
X-Proofpoint-ORIG-GUID: MxHkwgB7yFv96yD7uekhKuVsRgURGGjO
X-Authority-Analysis: v=2.4 cv=QYicvtbv c=1 sm=1 tr=0 ts=6747ace1 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=crZMmNxFx5g1mS9ZmPQA:9 a=FdTzh2GWekK77mhwV6Dw:22
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207968

Due to meta-clang has upgraded clang to 19.1.2 release [1]
which contains clang fix [2], drop 0001-man-Move-local-variable-declaration-to-function-scop.patch

[1] https://github.com/kraj/meta-clang/commit/d3180c5e597f587c822192caba3ceced2452b861
[2] https://github.com/llvm/llvm-project/commit/8bd06d5b6584

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ariable-declaration-to-function-scop.patch | 38 -------------------
 .../{man-db_2.12.1.bb => man-db_2.13.0.bb}    |  3 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 meta/recipes-extended/man-db/files/0001-man-Move-local-variable-declaration-to-function-scop.patch
 rename meta/recipes-extended/man-db/{man-db_2.12.1.bb => man-db_2.13.0.bb} (94%)

diff --git a/meta/recipes-extended/man-db/files/0001-man-Move-local-variable-declaration-to-function-scop.patch b/meta/recipes-extended/man-db/files/0001-man-Move-local-variable-declaration-to-function-scop.patch
deleted file mode 100644
index 57ecd48b1f..0000000000
--- a/meta/recipes-extended/man-db/files/0001-man-Move-local-variable-declaration-to-function-scop.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From e4125223631f0d555fc327da6d8705bcc8ee5ba5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Feb 2022 17:30:16 -0800
-Subject: [PATCH] man: Move local variable declaration to function scope
-
-There is a clang bug [1] unearthed here, so help clang by re-arranging
-code without changing the logic, until its fixed in clang
-
-[1] https://github.com/llvm/llvm-project/issues/53692
-
-Upstream-Status: Inappropriate [Inappropriate: Clang bug]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/man.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/man.c b/src/man.c
-index 195d35d..6870989 100644
---- a/src/man.c
-+++ b/src/man.c
-@@ -379,7 +379,7 @@ static void init_html_pager (void)
- static error_t parse_opt (int key, char *arg, struct argp_state *state)
- {
- 	static bool apropos, whatis; /* retain values between calls */
--
-+	char *s;
- 	/* Please keep these keys in the same order as in options above. */
- 	switch (key) {
- 		case 'C':
-@@ -411,7 +411,7 @@ static error_t parse_opt (int key, char *arg, struct argp_state *state)
- 		case OPT_WARNINGS:
- #ifdef NROFF_WARNINGS
- 			{
--				char *s = xstrdup
-+				s = xstrdup
- 					(arg ? arg : default_roff_warnings);
- 				const char *warning;
- 
diff --git a/meta/recipes-extended/man-db/man-db_2.12.1.bb b/meta/recipes-extended/man-db/man-db_2.13.0.bb
similarity index 94%
rename from meta/recipes-extended/man-db/man-db_2.12.1.bb
rename to meta/recipes-extended/man-db/man-db_2.13.0.bb
index 5c6797c8f1..2fa18a8f24 100644
--- a/meta/recipes-extended/man-db/man-db_2.12.1.bb
+++ b/meta/recipes-extended/man-db/man-db_2.13.0.bb
@@ -9,9 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://99_mandb \
-           file://0001-man-Move-local-variable-declaration-to-function-scop.patch \
           "
-SRC_URI[sha256sum] = "ddee249daeb78cf92bab794ccd069cc8b575992265ea20e239e887156e880265"
+SRC_URI[sha256sum] = "82f0739f4f61aab5eb937d234de3b014e777b5538a28cbd31433c45ae09aefb9"
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS:${PN} += "base-passwd"
-- 
2.25.1


