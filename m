Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E88C43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 03:59:25 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.80802.1656993557694790451
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 20:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.146.13,
 mailfrom: skokkond@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2653x7ih011310
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 4 Jul 2022 20:59:11 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 4 Jul 2022 20:59:07 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 4 Jul 2022 20:59:07 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 22326)
	id A2A9B9009C4; Mon,  4 Jul 2022 20:59:07 -0700 (PDT)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: <openembedded-core@lists.openembedded.org>
CC: <rwmacleod@gmail.com>, <umesh.kalappa0@gmail.com>, <pgowda.cve@gmail.com>,
        <shivams@gmail.com>
Subject: [kirkstone] Binutils : Binutils-2.38 Stable release updated with
 latest commits
Date: Mon, 4 Jul 2022 20:59:05 -0700
Message-ID: <20220705035905.163902-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 03:59:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167634

Below commits on Binutils-2.38 development branch are updated.

binutils:
eed56ee299b Automatic date update in version.in
8e001ed8f2c Automatic date update in version.in
6b2a26c63ba Automatic date update in version.in
f0b5a0b5687 Automatic date update in version.in
5cc2bdc75bf Automatic date update in version.in
a06ed65fce8 Automatic date update in version.in
164daf3d644 Automatic date update in version.in
8b1dda80a5d Automatic date update in version.in
a4577d4f18f Automatic date update in version.in
614000f9d7b Automatic date update in version.in
ebd859d2cc4 Automatic date update in version.in
d2823f8c27c Automatic date update in version.in
949c11728ca Automatic date update in version.in
fe36d34f258 Automatic date update in version.in
0dae8bed68e Automatic date update in version.in
884e81eeb2c Automatic date update in version.in
d61f79dc474 Automatic date update in version.in
c86fbb1d885 Automatic date update in version.in
724f6468fb1 Automatic date update in version.in
aef4bdb2ed5 Automatic date update in version.in
db802012a3e Automatic date update in version.in
b28a1fd5055 Automatic date update in version.in
e1ea1dafff6 x86: Properly handle IFUNC function pointer reference
e35ea91a86c Automatic date update in version.in
1d81266d92e Automatic date update in version.in
b0530a6f3dc Automatic date update in version.in
81d275cb83f Automatic date update in version.in
794474ead0b Automatic date update in version.in
220b941f1e0 Automatic date update in version.in
912f2e4449d Automatic date update in version.in
93054037f1e Automatic date update in version.in
bc8ba34fc24 Automatic date update in version.in
af58abfd800 Automatic date update in version.in
d200cde62c8 Automatic date update in version.in
31fd6cd3d76 Automatic date update in version.in
475549dc3ac Automatic date update in version.in
ffc7aa903b9 AArch64: Enable FP16 by default for Armv9-A.
f20245c35f2 Automatic date update in version.in
39c6088537b Automatic date update in version.in
6a8f2255438 Automatic date update in version.in

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.38.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index dc0a2a4054..c2502e0901 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_38-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "134f17ef688ba4c72a6c4e57af7382882cc1a705"
+SRCREV ?= "eed56ee299b9ef8754bb4e53f2e9cf2a7c28c04d"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.35.1


