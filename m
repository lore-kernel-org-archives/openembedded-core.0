Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4A7F57D7A2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:41 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id y13so4415190pfm.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=K+uX0DWB0ClzVZCFY0hsZm8Sr00NgJLsmiJTi0vWHc8=;
	b=PeA/ajlKYtkAP3YuYwLkMe+ADwur8K+rQlipup9Ymls4Cclj+zN1XvumPQls6ZCZCh
	Roqbgt2L/ali02zkjgFqNHwVnw4p3QyVZwPYnC1NTLuuUxW5D5KcDaFT4+rZlnMZ8QQo
	2wHFuMnbhEYu89mRWhfoVYHQXzdFKWOhLYWE1+qkPbbh38sQaIbo8K5sbC7TT/TnPvy/
	c4IOfhPgybO/pJ9K8QaJ/UUUCPHKcyBHRVv+/G7ZyOpsLPOjbbDAWVr8WXu8PADCFBJs
	7+AwnJGogSFvUdmCaWzTd/o/fhyia9Lmc0P+ovH0pZdDOrpuTrJHY22+rNDhwXsHDN6s
	IQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=K+uX0DWB0ClzVZCFY0hsZm8Sr00NgJLsmiJTi0vWHc8=;
	b=OcZhE4VevOYp2Qh3A+qgCkl9ObbP63c9xwG3dut70ocvWi3ioy159tQU+Bl4Ae5UZZ
	IZwp02IE7azDqf0RkWCYHUvobrabfWT7BA96KHyfBkD+2wEwFu+ekxjY7ky1V6rwkSLq
	4i6kmzSjgGS/oHKMaGIT5fCOZipYqAnRUCUll4ZiWK7t6hADv4rhzQQ12TARb8Ezz0w3
	wWqquisAETw5OFwdjlw+f/Zzg5hgbng9UnFX5UQriSEOnzPQuaxPNgHbr9VQR1+3tHD4
	zd7cq99hWTZbfaTa4gLccY1lRE37hTHSpc8D/hihTmS0dvwuGbOZCO3sxDBChdSppg88
	+jcg==
X-Gm-Message-State: APjAAAVoxhGszNuLm55GKYy0+kfL8lNQOnmSvgpGQh84VQl1vKL+4SHL
	cvhlWBIbZe4oyqJPVhQqElYW2Wju
X-Google-Smtp-Source: APXvYqytAqfedSc5G5boclvhkwMrSSzfGp/3uJ1Kjnbzh+hPC5quef071aQR5nae9fQXR3OKGsHg/Q==
X-Received: by 2002:a63:cd50:: with SMTP id a16mr18781907pgj.394.1556983662169;
	Sat, 04 May 2019 08:27:42 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:26:52 -0700
Message-Id: <2f6a02b0d0909b94e753ff00faae540fd0f85ba4.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 16/43] resulttool: Add log subcommand
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
X-List-Received-Date: Sat, 04 May 2019 15:27:41 -0000

From: Joshua Watt <jpewhacker@gmail.com>

Adds a subcommand for dumping various logs from test results

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/resulttool/log.py        | 56 ++++++++++++++++++++++++++++++++++++
 scripts/lib/resulttool/regression.py |  2 +-
 scripts/resulttool                   |  2 ++
 3 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 scripts/lib/resulttool/log.py

diff --git a/scripts/lib/resulttool/log.py b/scripts/lib/resulttool/log.py
new file mode 100644
index 0000000..5584f2d
--- /dev/null
+++ b/scripts/lib/resulttool/log.py
@@ -0,0 +1,56 @@
+# resulttool - Show logs
+#
+# Copyright (c) 2019 Garmin International
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms and conditions of the GNU General Public License,
+# version 2, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+# more details.
+#
+import resulttool.resultutils as resultutils
+
+def show_ptest(result, ptest, logger):
+    if 'ptestresult.sections' in result:
+        if ptest in result['ptestresult.sections'] and 'log' in result['ptestresult.sections'][ptest]:
+            print(result['ptestresult.sections'][ptest]['log'])
+            return 0
+
+    print("ptest '%s' not found" % ptest)
+    return 1
+
+def log(args, logger):
+    results = resultutils.load_resultsdata(args.source)
+    for path in results:
+        for res in results[path]:
+            if 'result' not in results[path][res]:
+                continue
+            r = results[path][res]['result']
+
+            if args.raw:
+                if 'ptestresult.rawlogs' in r:
+                    print(r['ptestresult.rawlogs']['log'])
+                else:
+                    print('Raw logs not found')
+                    return 1
+
+            for ptest in args.ptest:
+                if not show_ptest(r, ptest, logger):
+                    return 1
+
+def register_commands(subparsers):
+    """Register subcommands from this plugin"""
+    parser = subparsers.add_parser('log', help='show logs',
+                                         description='show the logs from test results',
+                                         group='analysis')
+    parser.set_defaults(func=log)
+    parser.add_argument('source',
+            help='the results file/directory/URL to import')
+    parser.add_argument('--ptest', action='append', default=[],
+            help='show logs for a ptest')
+    parser.add_argument('--raw', action='store_true',
+            help='show raw logs')
+
diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index aecb9da..fa90ab1 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -64,7 +64,7 @@ def regression_common(args, logger, base_results, target_results):
         if a in target_results:
             base = list(base_results[a].keys())
             target = list(target_results[a].keys())
-            # We may have multiple base/targets which are for different configurations. Start by 
+            # We may have multiple base/targets which are for different configurations. Start by
             # removing any pairs which match
             for c in base.copy():
                 for b in target.copy():
diff --git a/scripts/resulttool b/scripts/resulttool
index 18ac101..9477667 100755
--- a/scripts/resulttool
+++ b/scripts/resulttool
@@ -49,6 +49,7 @@ import resulttool.store
 import resulttool.regression
 import resulttool.report
 import resulttool.manualexecution
+import resulttool.log
 logger = scriptutils.logger_create('resulttool')
 
 def main():
@@ -66,6 +67,7 @@ def main():
     subparsers.add_subparser_group('analysis', 'analysis', 100)
     resulttool.regression.register_commands(subparsers)
     resulttool.report.register_commands(subparsers)
+    resulttool.log.register_commands(subparsers)
 
     args = parser.parse_args()
     if args.debug:
-- 
2.7.4


