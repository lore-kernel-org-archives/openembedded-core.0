Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CDFE57F35A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 09:14:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7N9DIql016329
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 02:13:54 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Fri, 23 Aug 2019 02:13:24 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Aug 2019 17:13:23 +0800
Message-ID: <20190823091323.36949-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] bbtests.py: remove recipe-depends.dot
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
X-List-Received-Date: Fri, 23 Aug 2019 09:14:03 -0000
Content-Type: text/plain

This file is giving misleading information. There's a patch
for bitbake to remove the generation of this file. Remove
it from OEQA as well.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 0693ba8cf8..8e59bafae3 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -119,7 +119,7 @@ class BitbakeTests(OESelftestTestCase):
 
     def test_bitbake_g(self):
         result = bitbake('-g core-image-minimal')
-        for f in ['pn-buildlist', 'recipe-depends.dot', 'task-depends.dot']:
+        for f in ['pn-buildlist', 'task-depends.dot']:
             self.addCleanup(os.remove, f)
         self.assertTrue('Task dependencies saved to \'task-depends.dot\'' in result.output, msg = "No task dependency \"task-depends.dot\" file was generated for the given task target. bitbake output: %s" % result.output)
         self.assertTrue('busybox' in ftools.read_file(os.path.join(self.builddir, 'task-depends.dot')), msg = "No \"busybox\" dependency found in task-depends.dot file.")
-- 
2.17.1


