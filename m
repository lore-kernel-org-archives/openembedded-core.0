Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 774D37D7A0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:40 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id z26so4423620pfg.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=l/lhsiF+xPZki3adQE9Sd5n4t4JWe5Zz+sW6XiogbMI=;
	b=oYG0fwdJaz1nPV6MPek8qB4MNO0iSt2O6e7uBHOVqG5BEppwmYtpI8lFYkWIvqHr2H
	WDVmXe6+GiDvI1FOSqDk5wiXfQdbDB+d74zxq5UNMxZP2mM01wj5lSFdbXvX47r9RNE8
	QbjThpFjdv3tnynxRjI99Gr/MdOD7V16nem39ABksycHs+SbyaZ5RalfUx4Qu1phLb2R
	aipgoYy1OiiTseACrrlsEQBEP8LB6B9VhrWuYmlYeTdYjf1Duch7CqtQDYq9oJaPPlpV
	hghoTNRnS8flfheJd8RElPrW/+MLRXmVVcDgG+sJSxDFJlCtTef4L+dMc/QhvLeTYFrs
	zpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=l/lhsiF+xPZki3adQE9Sd5n4t4JWe5Zz+sW6XiogbMI=;
	b=a5r1pcdQNNYuM2b00AQxYLkN5wXwJ8PpjVBjlEyr+pNbKC1vPLsGacNMqAAGltMzJa
	VhZHwPi9jHhUrWNctrEiAriEcRAAgn4i8xuH49k1aaRviodvlRYG28W0VXR/T+Y/rKjf
	soNZPzSvdZ0Ak5ofJfQPnS/BjFBy0u/GGPKJ2dnvi2acERignLQGGSrHIZ8kNNA8wdIA
	rGkpHwhWb10m8wOowMQ2vLhGYNhkJaUgs+UPTrCo0iUBIyWROu+ABcXKuwQ5sPWVrQXj
	szw65WN/0sQZ5RE1hsRka+YyGLB2gYM4gx48omG1lLagxS/yzybawBuziy6H+D243yrN
	LLMw==
X-Gm-Message-State: APjAAAWuiZWMXlHmaN9s8CsXLBQWIjiJFeb28Eyv4YGYvnUMbHZ5broW
	qBkdot/OnHcXMJvZEGOcNmqoShyC
X-Google-Smtp-Source: APXvYqyPUtesbcHBGV2VDeZ1W6SkFg9mULxWjiIOqoLvyQQwwZhhY5/gDBo4ud8dEwP3tTDwVgqdGQ==
X-Received: by 2002:a63:9dc8:: with SMTP id i191mr18738175pgd.91.1556983661320;
	Sat, 04 May 2019 08:27:41 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:40 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:26:51 -0700
Message-Id: <8e2f0257e1e438b88e4298438d5bae5f7c3c0a7a.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 15/43] resulttool: Load results from URL
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
X-List-Received-Date: Sat, 04 May 2019 15:27:40 -0000

From: Joshua Watt <jpewhacker@gmail.com>

Adds support for resulttool to load JSON files directly from a http://
or https:// URL

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/resulttool/merge.py       |  8 ++++----
 scripts/lib/resulttool/regression.py  |  4 ++--
 scripts/lib/resulttool/report.py      |  2 +-
 scripts/lib/resulttool/resultutils.py | 23 +++++++++++++++++++----
 scripts/lib/resulttool/store.py       |  4 ++--
 5 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/resulttool/merge.py b/scripts/lib/resulttool/merge.py
index 3e4b7a3..7159463 100644
--- a/scripts/lib/resulttool/merge.py
+++ b/scripts/lib/resulttool/merge.py
@@ -17,7 +17,7 @@ import json
 import resulttool.resultutils as resultutils
 
 def merge(args, logger):
-    if os.path.isdir(args.target_results):
+    if resultutils.is_url(args.target_results) or os.path.isdir(args.target_results):
         results = resultutils.load_resultsdata(args.target_results, configmap=resultutils.store_map)
         resultutils.append_resultsdata(results, args.base_results, configmap=resultutils.store_map)
         resultutils.save_resultsdata(results, args.target_results)
@@ -31,12 +31,12 @@ def merge(args, logger):
 
 def register_commands(subparsers):
     """Register subcommands from this plugin"""
-    parser_build = subparsers.add_parser('merge', help='merge test result files/directories',
-                                         description='merge the results from multiple files/directories into the target file or directory',
+    parser_build = subparsers.add_parser('merge', help='merge test result files/directories/URLs',
+                                         description='merge the results from multiple files/directories/URLs into the target file or directory',
                                          group='setup')
     parser_build.set_defaults(func=merge)
     parser_build.add_argument('base_results',
-                              help='the results file/directory to import')
+                              help='the results file/directory/URL to import')
     parser_build.add_argument('target_results',
                               help='the target file or directory to merge the base_results with')
 
diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index bdf531d..aecb9da 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -161,9 +161,9 @@ def register_commands(subparsers):
                                          group='analysis')
     parser_build.set_defaults(func=regression)
     parser_build.add_argument('base_result',
-                              help='base result file/directory for the comparison')
+                              help='base result file/directory/URL for the comparison')
     parser_build.add_argument('target_result',
-                              help='target result file/directory to compare with')
+                              help='target result file/directory/URL to compare with')
     parser_build.add_argument('-b', '--base-result-id', default='',
                               help='(optional) filter the base results to this result ID')
     parser_build.add_argument('-t', '--target-result-id', default='',
diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index 9008620..8ae4272 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -143,7 +143,7 @@ def register_commands(subparsers):
                                          group='analysis')
     parser_build.set_defaults(func=report)
     parser_build.add_argument('source_dir',
-                              help='source file/directory that contain the test result files to summarise')
+                              help='source file/directory/URL that contain the test result files to summarise')
     parser_build.add_argument('--branch', '-B', default='master', help="Branch to find commit in")
     parser_build.add_argument('--commit', help="Revision to report")
     parser_build.add_argument('-t', '--tag', default='',
diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index ad40ac8..aab312d 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -16,6 +16,8 @@ import os
 import json
 import scriptpath
 import copy
+import urllib
+import posixpath
 scriptpath.add_oe_lib_path()
 
 flatten_map = {
@@ -40,20 +42,33 @@ store_map = {
     "manual": ['TEST_TYPE', 'TEST_MODULE', 'MACHINE', 'IMAGE_BASENAME']
 }
 
+def is_url(p):
+    """
+    Helper for determining if the given path is a URL
+    """
+    return p.startswith('http://') or p.startswith('https://')
+
 #
 # Load the json file and append the results data into the provided results dict
 #
 def append_resultsdata(results, f, configmap=store_map):
     if type(f) is str:
-        with open(f, "r") as filedata:
-            data = json.load(filedata)
+        if is_url(f):
+            with urllib.request.urlopen(f) as response:
+                data = json.loads(response.read().decode('utf-8'))
+            url = urllib.parse.urlparse(f)
+            testseries = posixpath.basename(posixpath.dirname(url.path))
+        else:
+            with open(f, "r") as filedata:
+                data = json.load(filedata)
+            testseries = os.path.basename(os.path.dirname(f))
     else:
         data = f
     for res in data:
         if "configuration" not in data[res] or "result" not in data[res]:
             raise ValueError("Test results data without configuration or result section?")
         if "TESTSERIES" not in data[res]["configuration"]:
-            data[res]["configuration"]["TESTSERIES"] = os.path.basename(os.path.dirname(f))
+            data[res]["configuration"]["TESTSERIES"] = testseries
         testtype = data[res]["configuration"].get("TEST_TYPE")
         if testtype not in configmap:
             raise ValueError("Unknown test type %s" % testtype)
@@ -69,7 +84,7 @@ def append_resultsdata(results, f, configmap=store_map):
 #
 def load_resultsdata(source, configmap=store_map):
     results = {}
-    if os.path.isfile(source):
+    if is_url(source) or os.path.isfile(source):
         append_resultsdata(results, source, configmap)
         return results
     for root, dirs, files in os.walk(source):
diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index e4a0807..acdfbd9 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -29,7 +29,7 @@ def store(args, logger):
     try:
         results = {}
         logger.info('Reading files from %s' % args.source)
-        if os.path.isfile(args.source):
+        if resultutils.is_url(args.source) or os.path.isfile(args.source):
             resultutils.append_resultsdata(results, args.source)
         else:
             for root, dirs,  files in os.walk(args.source):
@@ -92,7 +92,7 @@ def register_commands(subparsers):
                                          group='setup')
     parser_build.set_defaults(func=store)
     parser_build.add_argument('source',
-                              help='source file or directory that contain the test result files to be stored')
+                              help='source file/directory/URL that contain the test result files to be stored')
     parser_build.add_argument('git_dir',
                               help='the location of the git repository to store the results in')
     parser_build.add_argument('-a', '--all', action='store_true',
-- 
2.7.4


