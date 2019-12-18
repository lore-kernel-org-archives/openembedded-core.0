Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E8057FE6B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 07:55:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xBI7tlWj020576
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 23:55:48 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Tue, 17 Dec 2019 23:55:34 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Dec 2019 15:55:33 +0800
Message-ID: <1576655733-216101-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] run-ptest: fix ptest output
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
X-List-Received-Date: Wed, 18 Dec 2019 07:55:47 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

output of qemu test changed, fix the sed cmd to
make it output as expect style

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/qemu/qemu/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu/run-ptest b/meta/recipes-devtools/qemu/qemu/run-ptest
index 2206b31..b25a792 100644
--- a/meta/recipes-devtools/qemu/qemu/run-ptest
+++ b/meta/recipes-devtools/qemu/qemu/run-ptest
@@ -7,4 +7,4 @@ ptestdir=$(dirname "$(readlink -f "$0")")
 export SRC_PATH=$ptestdir
 
 cd $ptestdir/tests
-make -f Makefile.include -k runtest-TESTS | sed '/: OK/ s/^/PASS: /g'
+make -f Makefile.include -k runtest-TESTS | sed '/^ok /s/ok /PASS: /g'
-- 
2.7.4


