Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 61BF2782DC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 11:55:53 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vA9Btqnb007428
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 9 Nov 2017 11:55:53 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eClR2-00030o-IA; Thu, 09 Nov 2017 11:55:52 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 11:55:49 +0000
Message-Id: <1510228551-11516-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510228551-11516-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1510228551-11516-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 5/7] testimage: Pass the logger into OERuntimeTestContextExecutor.getTarget()
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
X-List-Received-Date: Thu, 09 Nov 2017 11:55:55 -0000

I have no idea why we didn't do this but it means the code has nowhere
to log to unless we do this. This means we can then use the logger
to log data to the task logs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 6a43560..b955fc1 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -248,7 +248,7 @@ def testimage_main(d):
 
     # the robot dance
     target = OERuntimeTestContextExecutor.getTarget(
-        d.getVar("TEST_TARGET"), None, d.getVar("TEST_TARGET_IP"),
+        d.getVar("TEST_TARGET"), logger, d.getVar("TEST_TARGET_IP"),
         d.getVar("TEST_SERVER_IP"), **target_kwargs)
 
     # test context
-- 
2.7.4


