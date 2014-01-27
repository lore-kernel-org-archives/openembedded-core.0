Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 01BEF6C76F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 11:22:10 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jan 2014 03:22:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,728,1384329600"; d="scan'208";a="406364680"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 27 Jan 2014 03:22:10 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id 8EBC86A4007;
	Mon, 27 Jan 2014 03:22:04 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jan 2014 13:23:17 +0200
Message-Id: <1390821797-12265-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] oeqa/runtime: syslog: update --help test
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
X-List-Received-Date: Mon, 27 Jan 2014 11:22:12 -0000

busybox 1.22 now returns exitcode 0 instead of 1 for
--help options, so this test needs to be updated when
busybox gets upgraded to 1.22.

https://bugs.busybox.net/show_bug.cgi?id=5612
http://git.busybox.net/busybox/commit/?id=efd0698f74caab0a0c8a51228b923ee142e8e278

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/syslog.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/syslog.py b/meta/lib/oeqa/runtime/syslog.py
index 91d7963..b95b361 100644
--- a/meta/lib/oeqa/runtime/syslog.py
+++ b/meta/lib/oeqa/runtime/syslog.py
@@ -11,7 +11,7 @@ class SyslogTest(oeRuntimeTest):
     @skipUnlessPassed("test_ssh")
     def test_syslog_help(self):
         (status,output) = self.target.run('/sbin/syslogd --help')
-        self.assertEqual(status, 1, msg="status and output: %s and %s" % (status,output))
+        self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
 
     @skipUnlessPassed("test_syslog_help")
     def test_syslog_running(self):
-- 
1.8.5.3


