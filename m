Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B7E1C78E31
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 09:48:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w739m5cj029772
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Aug 2018 02:48:05 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 3 Aug 2018 02:48:04 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Aug 2018 02:48:02 -0700
Message-ID: <20180803094802.1896-3-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180803094802.1896-1-hongzhi.song@windriver.com>
References: <20180803094802.1896-1-hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v3 2/2] runtime selftest: remove the case of hw breakpoint
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
X-List-Received-Date: Fri, 03 Aug 2018 09:48:04 -0000
Content-Type: text/plain

Hw breakpoint is based on hardware.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta/lib/oeqa/runtime/cases/ksample.py | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ksample.py b/meta/lib/oeqa/runtime/cases/ksample.py
index 26fbe9d8cb..5e8699a2e2 100644
--- a/meta/lib/oeqa/runtime/cases/ksample.py
+++ b/meta/lib/oeqa/runtime/cases/ksample.py
@@ -161,22 +161,6 @@ class KSampleTest(KSample):
         # rmmod
         self.cmd_and_check("rmmod trace-printk")
 
-    # hw breakpoint
-    @OETestDepends(['ssh.SSHTest.test_ssh'])
-    def test_hw_breakpoint_example(self):
-        # check config
-        self.check_config("CONFIG_KALLSYMS_ALL")
-        # make sure if module exists
-        self.check_module_exist("hw_breakpoint/", "data_breakpoint.ko")
-        # modprobe
-        self.cmd_and_check("modprobe data_breakpoint")
-        # lsmod
-        self.cmd_and_check("lsmod | grep data_breakpoint | cut -d\' \' -f1", "data_breakpoint")
-        # check result
-        self.cmd_and_check("cat /var/log/messages | grep sample_hbp_handler", "sample_hbp_handler")
-        # rmmod
-        self.cmd_and_check("rmmod data_breakpoint")
-
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_configfs_sample(self):
         # check config
-- 
2.11.0


