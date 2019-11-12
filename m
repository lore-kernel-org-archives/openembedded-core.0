Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7C96C7F93B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 04:33:44 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d13so12443914pfq.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 20:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IwASJ41c2+J918bZssmM2Q8G6WUBdXdkPGXismEf2sY=;
	b=BjDd4ud3hsb0vfB+G3jliUwW5uHZTMvBc6IL4CaAxRVJlv0KFhBfuTdxvl6ocYQVCB
	LPWTGXoj9WO/ma/n7tA3jQpVe2jJgVUxmgM2Ba6mwxfObeqtlXSbvIXmTfiMkZYNBhAV
	dmMwxdjTfiI7jHSV84IhKBwMbomn+6X7iMn0ySo+HeG84eJ8EcAmifH8R0ubVcu0jIS6
	j6xpPwoK/vuhG4iE9uvkP/sMcCO85ga+guGN+90MlMTx9Z+7f3tt/ANGipidlkgUMhqN
	mnFtwj31ccvCIP6z1gaTZ5T5wqjZ9X4wfwbkYOHDOnb52V6ZxczJ8CO6U1WEmziZRKxg
	9ocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=IwASJ41c2+J918bZssmM2Q8G6WUBdXdkPGXismEf2sY=;
	b=WBpX85cTivJnuQpRYf1iptVPPx6jIge7WJ1cnO6/WzNGpquXsTVRCQdDbvDmAyq9Rg
	RJWKzg6j0jBs/k2PKqke2dvopsuL6cnRkUCdaH3w3mNZDpAxGi8+OF66xCVhbUygAUz7
	mmPDbzyKp5kWIa/3/3S6n9bFA4WzxZXdlga6sqnTut10+niwacum2rq+Ywdy0o3029eb
	kQ3MGT3N9D2JM7iX/XtV1six9iNSWazxIvNFub4s2tF/7jISl4eBv0mWB8pW+7MogNF6
	/eK5ZqNyGNbuRcP2kKYVY3kw9cCQzpBcJyXNmvkg/Mdif9OTtaoK7pLeIRD+ADabT6lv
	RidA==
X-Gm-Message-State: APjAAAU9xQ82wWbdPAPHi4Ltgq4jZYYKf26R4L1vai/+MzfsCPLHSKey
	uQtLOfXhb24SlizErrvm7SVqZz0K
X-Google-Smtp-Source: APXvYqz/X7MBQO+l+4NsieAybeWTge0zgw/s6tuSUFmB8T0S6ROIubqL2uFoDdsB3jrmIfoRb4Bt8Q==
X-Received: by 2002:a63:7015:: with SMTP id l21mr30380003pgc.200.1573533225419;
	Mon, 11 Nov 2019 20:33:45 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	q12sm5212109pgl.23.2019.11.11.20.33.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 20:33:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 20:33:22 -0800
Message-Id: <eb15718f4975218f5c8bd5c3c2f475d24728cfc9.1573532188.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573532188.git.akuster808@gmail.com>
References: <cover.1573532188.git.akuster808@gmail.com>
Subject: [PATCH 03/20] OEQA: Centrilize the base LTP routines
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
X-List-Received-Date: Tue, 12 Nov 2019 04:33:44 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/utils/ltp.py | 133 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 meta/lib/oeqa/utils/ltp.py

diff --git a/meta/lib/oeqa/utils/ltp.py b/meta/lib/oeqa/utils/ltp.py
new file mode 100644
index 0000000..5e07f4d
--- /dev/null
+++ b/meta/lib/oeqa/utils/ltp.py
@@ -0,0 +1,133 @@
+# LTP base 
+#
+# Copyright (c) 2019 MontaVista Software, LLC
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import time
+import datetime
+import pprint
+
+from oeqa.runtime.case import OERuntimeTestCase
+
+class LtpBase(OERuntimeTestCase):
+    '''
+    Base routines for LTP based testing
+    '''
+
+    @classmethod
+    def setUpClass(cls):
+        cls.ltp_startup()
+
+    @classmethod
+    def tearDownClass(cls):
+        cls.ltp_finishup()
+
+    @classmethod
+    def ltp_startup(cls):
+        cls.sections = {}
+        cls.failmsg = ""
+        cls.cmd = ""
+        test_log_dir = os.path.join(cls.td.get('WORKDIR', ''), 'testimage')
+        timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
+
+        cls.ltptest_log_dir_link = os.path.join(test_log_dir, 'ltp_log')
+        cls.ltptest_log_dir = '%s.%s' % (cls.ltptest_log_dir_link, timestamp)
+        os.makedirs(cls.ltptest_log_dir)
+
+        cls.tc.target.run("mkdir -p /opt/ltp/results")
+
+        if not hasattr(cls.tc, "extraresults"):
+            cls.tc.extraresults = {}
+        cls.extras = cls.tc.extraresults
+        cls.extras['ltpresult.rawlogs'] = {'log': ""}
+
+    @classmethod
+    def runltp(cls, ltp_group):
+        starttime = time.time()
+        (status, output) = cls.tc.target.run(cls.cmd)
+        endtime = time.time()
+
+        with open(os.path.join(cls.ltptest_log_dir, "%s-raw.log" % ltp_group), 'w') as f:
+            f.write(output)
+
+        cls.extras['ltpresult.rawlogs']['log'] = cls.extras['ltpresult.rawlogs']['log'] + output
+
+        # copy nice log from DUT
+        dst = os.path.join(cls.ltptest_log_dir, "%s" %  ltp_group )
+        remote_src = "/opt/ltp/results/%s" % ltp_group 
+        (status, output) = cls.tc.target.copyFrom(remote_src, dst)
+        msg = 'File could not be copied. Output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        parser = LtpParser()
+        results, sections  = parser.parse(dst)
+
+        runtime = int(endtime-starttime)
+        sections['duration'] = runtime
+        cls.sections[ltp_group] =  sections
+
+        failed_tests = {}
+        for test in results:
+            result = results[test]
+            testname = (logname + "." + ltp_group + "." + test)
+            cls.extras[testname] = {'status': result}
+            if result == 'FAILED':
+                failed_tests[ltp_group] = test 
+
+        if failed_tests:
+            cls.failmsg = cls.failmsg + "Failed ptests:\n%s" % pprint.pformat(failed_tests)
+
+class LtpTestBase(LtpBase):
+    '''
+    Ltp normal section definition
+    '''
+    @classmethod
+    def ltp_finishup(cls):
+        cls.extras['ltpresult.sections'] =  cls.sections
+
+        # update symlink to ltp_log
+        if os.path.exists(cls.ltptest_log_dir_link):
+            os.remove(cls.ltptest_log_dir_link)
+        os.symlink(os.path.basename(cls.ltptest_log_dir), cls.ltptest_log_dir_link)
+
+        if cls.failmsg:
+            cls.fail(cls.failmsg)
+
+class LtpPosixBase(LtpBase):
+    '''
+    Ltp Posix section definition
+    '''
+
+    @classmethod
+    def ltp_finishup(cls):
+        cls.extras['ltpposixresult.sections'] =  cls.sections
+
+        # update symlink to ltp_log
+        if os.path.exists(cls.ltptest_log_dir_link):
+            os.remove(cls.ltptest_log_dir_link)
+
+        os.symlink(os.path.basename(cls.ltptest_log_dir), cls.ltptest_log_dir_link)
+
+        if cls.failmsg:
+            cls.fail(cls.failmsg)
+
+
+class LtpStressBase(LtpBase):
+    '''
+    Ltp Stress test section definition
+    '''
+
+    @classmethod
+    def ltp_finishup(cls):
+        cls.extras['ltpstressresult.sections'] =  cls.sections
+
+        # update symlink to ltp_log
+        if os.path.exists(cls.ltptest_log_dir_link):
+            os.remove(cls.ltptest_log_dir_link)
+
+        os.symlink(os.path.basename(cls.ltptest_log_dir), cls.ltptest_log_dir_link)
+
+        if cls.failmsg:
+            cls.fail(cls.failmsg)
-- 
2.7.4


