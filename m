Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3C82F7171C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 09:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s929uV5d030679 for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Oct 2014 10:56:31 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id R_Kf9e8zr4V3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 10:56:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s929uQCK030676
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Oct 2014 10:56:27 +0100
Message-ID: <1412243819.17658.32.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 02 Oct 2014 10:56:59 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] oeqa/dmesg: Whitelist usbhid failures
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
X-List-Received-Date: Thu, 02 Oct 2014 09:57:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We fixed these in parselog but not here. This test really can just be
deleted now really.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/runtime/dmesg.py b/meta/lib/oeqa/runtime/dmesg.py
index 43e16c3..5831471 100644
--- a/meta/lib/oeqa/runtime/dmesg.py
+++ b/meta/lib/oeqa/runtime/dmesg.py
@@ -8,5 +8,5 @@ class DmesgTest(oeRuntimeTest):
     @testcase(215)
     @skipUnlessPassed('test_ssh')
     def test_dmesg(self):
-        (status, output) = self.target.run('dmesg | grep -v mmci-pl18x | grep -v "error changing net interface name" | grep -iv "dma timeout" | grep -i error')
+        (status, output) = self.target.run('dmesg | grep -v mmci-pl18x | grep -v "error changing net interface name" | grep -iv "dma timeout" | grep -v usbhid | grep -i error')
         self.assertEqual(status, 1, msg = "Error messages in dmesg log: %s" % output)



