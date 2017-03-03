Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B13B877697
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 11:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v23BG8LO003820; Fri, 3 Mar 2017 11:16:08 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id W9bBhTy4tRko; Fri,  3 Mar 2017 11:16:08 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v23BG4Hs003812
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 3 Mar 2017 11:16:05 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cjlBs-0005bM-IY; Fri, 03 Mar 2017 11:16:04 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Mar 2017 11:16:00 +0000
Message-Id: <1488539763-21490-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/4] oeqa/sdkext/devtool: Ensure dependencies for test_extend_autotools_recipe_creation are present
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
X-List-Received-Date: Fri, 03 Mar 2017 11:16:09 -0000

test_extend_autotools_recipe_creation needs libxml2 so ensure this is
installed/present as it may not be in the minimal eSDK case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdkext/cases/devtool.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index 1072fb6..a01bc0b 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -68,6 +68,7 @@ class DevtoolTest(OESDKExtTestCase):
     def test_extend_autotools_recipe_creation(self):
         req = 'https://github.com/rdfa/librdfa'
         recipe = "librdfa"
+        self._run('devtool sdk-install libxml2')
         self._run('devtool add %s %s' % (recipe, req) )
         try:
             self._run('devtool build %s' % recipe)
-- 
2.7.4


