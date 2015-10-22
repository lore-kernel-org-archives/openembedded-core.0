Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 8D50677141
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id DFE89600F5A
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:22:01 +0100
Message-Id: <b845330133de6d47b63a03208aa083cf08801634.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 40/52] oeqa/selftest/wic: corrected testcase decorator for test18_iso_image
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:27 -0000

From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>

Changed testcase decorator for TC test18_iso_image from 1264 to 1346.

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 7625505..f4c22f7 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -190,7 +190,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + \
                                      "%(wks)s-*.direct" % vars)))
 
-    @testcase(1264)
+    @testcase(1346)
     def test18_iso_image(self):
         """Test creation of hybrid iso image with legacy and EFI boot"""
         self.assertEqual(0, runCmd("wic create mkhybridiso "
-- 
2.1.4


