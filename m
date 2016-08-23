Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CC4DD6E65F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 17:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7NH0WKc029753 for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 18:00:32 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8DZgkxEAlJsP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 18:00:32 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7NH0QvA029750
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 18:00:27 +0100
Message-ID: <1471971626.16712.115.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Aug 2016 18:00:26 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] oeqa/buildiptables: Switch from netfilter.org to yoctoproject.org mirror
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
X-List-Received-Date: Tue, 23 Aug 2016 17:00:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We've had some upstream mirror instability so use our own mirror for the
iptables sources to ensure this doesn't affect the test results.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/runtime/buildiptables.py b/meta/lib/oeqa/runtime/buildiptables.py
index 09e252d..bc75d0a 100644
--- a/meta/lib/oeqa/runtime/buildiptables.py
+++ b/meta/lib/oeqa/runtime/buildiptables.py
@@ -11,7 +11,7 @@ class BuildIptablesTest(oeRuntimeTest):
     @classmethod
     def setUpClass(self):
         self.project = TargetBuildProject(oeRuntimeTest.tc.target, oeRuntimeTest.tc.d,
-                        "http://netfilter.org/projects/iptables/files/iptables-1.4.13.tar.bz2")
+                        "http://downloads.yoctoproject.org/mirror/sources/iptables-1.4.13.tar.bz2")
         self.project.download_archive()
 
     @testcase(206)
diff --git a/meta/lib/oeqa/sdk/buildiptables.py b/meta/lib/oeqa/sdk/buildiptables.py
index 062e531..f0cb8a4 100644
--- a/meta/lib/oeqa/sdk/buildiptables.py
+++ b/meta/lib/oeqa/sdk/buildiptables.py
@@ -8,7 +8,7 @@ class BuildIptablesTest(oeSDKTest):
     @classmethod
     def setUpClass(self):
         self.project = SDKBuildProject(oeSDKTest.tc.sdktestdir + "/iptables/", oeSDKTest.tc.sdkenv, oeSDKTest.tc.d,
-                        "http://netfilter.org/projects/iptables/files/iptables-1.4.13.tar.bz2")
+                        "http://downloads.yoctoproject.org/mirror/sources/iptables-1.4.13.tar.bz2")
         self.project.download_archive()
 
     def test_iptables(self):



