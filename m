Return-Path: <Sakib.Sajal@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40CCF71BEE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2019 19:29:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x54JTnH7009965
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Jun 2019 12:29:49 -0700 (PDT)
Received: from ssajal-HP-EliteBook-850-G3.wrs.com (128.224.140.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 4 Jun 2019 12:29:43 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Jun 2019 15:29:38 -0400
Message-ID: <20190604192939.29929-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] ptest-runner: update SRCREV to latest HEAD on ptest-runner2 repo
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Jun 2019 19:29:49 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

   63d097c Add SPDX-License-Identifier: GPL-2.0-or-later in source files (HEAD)
   fb93c99 utils.c: close all file descriptors after completing a ptest

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Randy Macleod <randy.macleod@windriver.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
index e2eb258d0b..0450e18e4e 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "05b112bda7ac2adba8e9b0f088d6e5843b148a38"
+SRCREV = "63d097cc46142157931682fed076b5407757a0bd"
 PV = "2.3.1+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
-- 
2.20.1


