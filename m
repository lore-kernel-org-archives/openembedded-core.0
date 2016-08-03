Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CCA736E64A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 09:26:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u739QQ57003675
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2016 02:26:26 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 3 Aug 2016 02:26:25 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Aug 2016 17:22:57 +0800
Message-ID: <1470216177-7146-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] lzo: update ptest output format
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
X-List-Received-Date: Wed, 03 Aug 2016 09:26:29 -0000
Content-Type: text/plain

The output format was updated to match yocto ptest rules:
<result>: <testname>
where the result can be PASS, FAIL, or SKIP, and the testname
can be any identifying string.

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-support/lzo/lzo/run-ptest | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/recipes-support/lzo/lzo/run-ptest b/meta/recipes-support/lzo/lzo/run-ptest
index 2ea7745..6acb89f 100644
--- a/meta/recipes-support/lzo/lzo/run-ptest
+++ b/meta/recipes-support/lzo/lzo/run-ptest
@@ -1,8 +1,33 @@
 #!/bin/sh
 
 ./lzotest -mavail -n10 -q /etc/services
+if [ $? -eq 0 ]; then
+  echo 'PASS: lzotest'
+else
+  echo 'FAIL: lzotest'
+fi
 LZOTEST=./lzotest /bin/sh -e "./check.sh" "/etc"
 ./align
+if [ $? -eq 0 ]; then
+  echo 'PASS: align'
+else
+  echo 'FAIL: align'
+fi
 ./chksum
+if [ $? -eq 0 ]; then
+  echo 'PASS: chksum'
+else
+  echo 'FAIL: chksum'
+fi
 ./simple
+if [ $? -eq 0 ]; then
+  echo 'PASS: simple'
+else
+  echo 'FAIL: simple'
+fi
 ./testmini
+if [ $? -eq 0 ]; then
+  echo 'PASS: testmini'
+else
+  echo 'FAIL: testmini'
+fi
-- 
2.8.1


