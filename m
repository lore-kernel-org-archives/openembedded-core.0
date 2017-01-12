Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1EB0071B04
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 01:51:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0C1pZIu014936
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 17:51:35 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 11 Jan 2017 17:51:34 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jan 2017 09:51:42 +0800
Message-ID: <b784d95f7ce2152ee0ca0879558237faeaac7325.1484185744.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1484185744.git.Qi.Chen@windriver.com>
References: <cover.1484185744.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] scripts/oe-selftest: fix typo
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
X-List-Received-Date: Thu, 12 Jan 2017 01:51:36 -0000
Content-Type: text/plain

Change 'agains' to 'against'.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/oe-selftest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index adfa92f..120a6c2 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -87,7 +87,7 @@ def logger_create():
 log = logger_create()
 
 def get_args_parser():
-    description = "Script that runs unit tests agains bitbake and other Yocto related tools. The goal is to validate tools functionality and metadata integrity. Refer to https://wiki.yoctoproject.org/wiki/Oe-selftest for more information."
+    description = "Script that runs unit tests against bitbake and other Yocto related tools. The goal is to validate tools functionality and metadata integrity. Refer to https://wiki.yoctoproject.org/wiki/Oe-selftest for more information."
     parser = argparse_oe.ArgumentParser(description=description)
     group = parser.add_mutually_exclusive_group(required=True)
     group.add_argument('-r', '--run-tests', required=False, action='store', nargs='*', dest="run_tests", default=None, help='Select what tests to run (modules, classes or test methods). Format should be: <module>.<class>.<test_method>')
-- 
1.9.1


