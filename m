Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4AA8879B47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 02:19:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9C2J43T015109
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 19:19:04 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 11 Oct 2018 19:19:03 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Oct 2018 10:24:50 +0800
Message-ID: <3a97e606d9325c4135218071e3a2acce7ec4d49e.1539310768.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1539310768.git.Qi.Chen@windriver.com>
References: <cover.1539310768.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] ksample.py: fix error message
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
X-List-Received-Date: Fri, 12 Oct 2018 02:19:03 -0000
Content-Type: text/plain

The current error message is like:

  kobject-example.kodoesn't exist

Add a space so that it looks like:

  kobject-example.ko doesn't exist

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/runtime/cases/ksample.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ksample.py b/meta/lib/oeqa/runtime/cases/ksample.py
index eb87133..354cc97 100644
--- a/meta/lib/oeqa/runtime/cases/ksample.py
+++ b/meta/lib/oeqa/runtime/cases/ksample.py
@@ -34,7 +34,7 @@ class KSample(OERuntimeTestCase):
         cmd = "ls " + "/lib/modules/" + output + "/kernel/samples/" + path + module_name
         status, output = self.target.run(cmd)
         if status != 0:
-            error_info = module_name + "doesn't exist"
+            error_info = module_name + " doesn't exist"
             self.skipTest(error_info)
 
     def kfifo_func(self, name=''):
-- 
1.9.1


