Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4AA986010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 12:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1BCBKNQ025310 for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 12:11:20 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CRFuooHvGCgS
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 12:11:20 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1BCBGBO025302
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 12:11:18 GMT
Message-ID: <1455192676.16142.255.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Feb 2016 12:11:16 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] oeqa/prservice: Fix whitespace problem
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
X-List-Received-Date: Thu, 11 Feb 2016 12:11:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Recent bitbake changes mean the whitespace formatting around the way functions are
defined, changed which broke the rather ugly construct this test uses to append to
a python function. This really needs to be rewritten and improved but fix the
whitespace so at least the tests work again and other regressions don't creep in.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/selftest/prservice.py b/meta/lib/oeqa/selftest/prservice.py
index 4187fbf..f22288e 100644
--- a/meta/lib/oeqa/selftest/prservice.py
+++ b/meta/lib/oeqa/selftest/prservice.py
@@ -34,7 +34,7 @@ class BitbakePrTests(oeSelfTest):
         return str(stamps[0])
 
     def increment_package_pr(self, package_name):
-        inc_data = "do_package_append() {\nbb.build.exec_func('do_test_prserv', d)\n}\ndo_test_prserv() {\necho \"The current date is: %s\"\n}" % datetime.datetime.now()
+        inc_data = "do_package_append() {\n    bb.build.exec_func('do_test_prserv', d)\n}\ndo_test_prserv() {\necho \"The current date is: %s\"\n}" % datetime.datetime.now()
         self.write_recipeinc(package_name, inc_data)
         bitbake("-ccleansstate %s" % package_name)
         res = bitbake(package_name, ignore_status=True)



