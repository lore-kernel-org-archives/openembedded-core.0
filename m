Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id E0B9B7E555
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:26 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id n2so3645934pgp.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DkFOCk8SckDO/gxVL47hw+88V2oBSnnYCGxNkKb1vpE=;
	b=YwBLqgd8fHEz1k7Aaq7vWqoROdfu4Kvabn2VetAbcZOFjGEKfZlREzI1+YOFexAvy7
	Ci5ISzn8wt1rh9mGGge7hcFNAgoiruGqZwdx/izKN8dlrj1EQlC2MmzO4S8PACUEIBi5
	BHwW1Aw18/BUpY7BOeBiBIysXtiUkW1e0Bafqmyr9LM1lKl64r2ot0NFBdYiGvyc8FLt
	iM6ObmaaZBtjwWeqm6hxwsfvdsVt+rmcQ/tvjsUXqP+3f4PU8V5ypZkNH1LJiy2x2SFc
	ivs76o0Gd8Gd6Y+UyFISs/eRxsmUSrsRjz5CQ+KlFq8N+ZxOMdvQ7XyniFIpA76725PB
	8rYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DkFOCk8SckDO/gxVL47hw+88V2oBSnnYCGxNkKb1vpE=;
	b=GuE26/AwPlzjD6O6420e69yZwJH3c9G6o7hHY6xB0800LN+ghePBFB1TULrQmUsdWs
	ZwG1QEw444irTpfLR0g5Om/8dNEZRHXLxdxogkpAr9V2uoTZSoRbwVB4FHVa+JwAkrPW
	5bQWzU0Aen14axzYp3wUUnuX/soVfLwNO57bzUu+OF6NC/P7ZFWQtwzIRUAO1hdFxu0/
	YcNQFZLohryITWCpLyTKl3BXsIf+x+ap97Fh/g6KPXqCQwPmxyWVEP1/d3k/MDH8dZq4
	WWr8ltvA9JY+jA7ZjXRbjenBTf8KAEt+d9qbdTJo5psHI03b22P5MqJ0Fo9W/lz7Kv1f
	59OQ==
X-Gm-Message-State: APjAAAUEEtYMw4Dq1tf+heFoo6BK9jf9iupsv5WupTmbdyjmWCfYxrOk
	kF+UiWbknFmu/TCJ0ugxexkQl3Yq
X-Google-Smtp-Source: APXvYqzt1fZzAtOHZB3rvntdFaHYw2jFn//t2kUwWEk7Vx8ai8LiIBl6G6OBZLNSLIghf3WExxN7Jw==
X-Received: by 2002:a17:90a:8982:: with SMTP id
	v2mr16307274pjn.136.1560092068067; 
	Sun, 09 Jun 2019 07:54:28 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:54:00 -0700
Message-Id: <c2d2dfa4db6a2a5a20680fc3bd09008a974fdbec.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
Subject: [Warrior-next 25/27] logparser: Add decoding ltp logs
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:28 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/utils/logparser.py | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index 18285fb..abff8c7 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -89,3 +89,28 @@ class PtestParser(object):
                     status = self.results[section][test_name]
                     f.write(status + ": " + test_name + "\n")
 
+
+# ltp log parsing
+class LtpParser(object):
+    def __init__(self):
+        self.results = {}
+        self.section = {'duration': "", 'log': ""}
+
+    def parse(self, logfile):
+        test_regex = {}
+        test_regex['PASSED'] = re.compile(r"PASS")
+        test_regex['FAILED'] = re.compile(r"FAIL")
+        test_regex['SKIPPED'] = re.compile(r"SKIP")
+
+        with open(logfile, errors='replace') as f:
+            for line in f:
+                for t in test_regex:
+                    result = test_regex[t].search(line)
+                    if result:
+                        self.results[line.split()[0].strip()] = t
+
+        for test in self.results:
+            result = self.results[test]
+            self.section['log'] = self.section['log'] + ("%s: %s\n" % (result.strip()[:-2], test.strip()))
+
+        return self.results, self.section
-- 
2.7.4


