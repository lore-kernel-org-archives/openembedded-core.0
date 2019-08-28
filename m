Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 84C8F7F26A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 18:22:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7SIMl12008056
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 11:22:47 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 28 Aug 2019 11:22:46 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Aug 2019 14:22:46 -0400
Message-ID: <20190828182246.146276-1-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.16.0.rc2
MIME-Version: 1.0
Subject: [PATCH] yocto-check-layer: Allow any case for README file detection
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
X-List-Received-Date: Wed, 28 Aug 2019 18:22:47 -0000
Content-Type: text/plain

It's become more commone for files to be named "readme" or "Readme" on github servers
in recent time.  So adjust the scanning to allow any mix of case.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 scripts/lib/checklayer/cases/common.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
index 8ffe028..b82304e 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -12,7 +12,7 @@ from checklayer.case import OECheckLayerTestCase
 class CommonCheckLayer(OECheckLayerTestCase):
     def test_readme(self):
         # The top-level README file may have a suffix (like README.rst or README.txt).
-        readme_files = glob.glob(os.path.join(self.tc.layer['path'], 'README*'))
+        readme_files = glob.glob(os.path.join(self.tc.layer['path'], '[Rr][Ee][Aa][Dd][Mm][Ee]*'))
         self.assertTrue(len(readme_files) > 0,
                         msg="Layer doesn't contains README file.")
 
-- 
1.8.3.1


