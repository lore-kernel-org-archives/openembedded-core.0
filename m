Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2EF8C7D29F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 02:57:41 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id p23so3468802iol.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 19:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HXWahPl8+ihSzjtv39QS51h6vnuFCvIUAyosKiMb8DE=;
	b=MFMyVu1WYni1+rFCM7T61t5unRyyMrUuENHZUBKrz2G2KUad28jZTFAjaQJCU63GSz
	Tv2Er/17bJQf5g83BjgPRB7CWsKZv8iex5uJ/BKCcKNf66x+vhPCkqlEdVBgggSqjtHT
	F2DUw99tXOSLr1e073SG0gbC7Rip06UZTDmKedsIm2Bb70FAZ+kVoFeVP3B+jYPZUrpt
	+iRMFIQBSrEnnBn9G7YBz94eEUTeGHxPbHKdJLQpTJQ3HoBym1x9RBSbuiq038SrfOhj
	/wnJO7HnDg746b3cBgaLzUx4yhP6WbY+6bCdB1QO/8/+gr3sA6LmIB/4VALnwCrJlCVK
	AsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HXWahPl8+ihSzjtv39QS51h6vnuFCvIUAyosKiMb8DE=;
	b=scLLZoGg5oJr4k4fN/Xw0N+2cf7cJokJfuNLOGgqipR7TfeUJWdUKrwDYPPf9tbIa8
	P0BmINqkS0MgPH22VlSMoBHCPI4yQcIJdnh79pUC02cTRLg+Fw4LvHurcBPJwx1tjy6u
	NMZBINX5bTBQEzAMxDRE/PEaRctWa50vm/e5JfXgmgPiSBMv68pZXYtoT4FE+W6mm+qQ
	Pj4XtEbLmO3D+3yRj4Dxc3tEw0h8Iq5e3ce8q9mvc6/XsHhVqSggCYUcVr1hOoWIh54F
	icuLiY8RzA82+jTbHwC/2syH4GQW0yUf6m2BamRG/J4cqeX/Mznm8+xq//OhpEHpFv9p
	an7g==
X-Gm-Message-State: APjAAAUCMxYx7qnBYGrigFmsD27XTgVnryu14m2A7doyZadWOs4eUvSQ
	+HqE2Cp0SqvuH8OtU/6aGmE29umFURc=
X-Google-Smtp-Source: APXvYqyP4dQnp4L58+6wwpsMcRSyYv97plAMlES0SeKu7dI4KSqOw/SRthdqICMLMvH3tqtMaQoOWw==
X-Received: by 2002:a5e:c019:: with SMTP id u25mr1265433iol.104.1555642661980; 
	Thu, 18 Apr 2019 19:57:41 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	137sm1796885ita.22.2019.04.18.19.57.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Apr 2019 19:57:41 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2019 21:57:18 -0500
Message-Id: <20190419025718.15348-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190419025718.15348-1-JPEWhacker@gmail.com>
References: <20190419025718.15348-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] resulttool: Add log subcommand
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
X-List-Received-Date: Fri, 19 Apr 2019 02:57:41 -0000
Content-Transfer-Encoding: 8bit

Adds a subcommand for dumping various logs from test results

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 scripts/lib/resulttool/log.py        | 56 ++++++++++++++++++++++++++++
 scripts/lib/resulttool/regression.py |  2 +-
 scripts/resulttool                   |  2 +
 3 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 scripts/lib/resulttool/log.py

diff --git a/scripts/lib/resulttool/log.py b/scripts/lib/resulttool/log.py
new file mode 100644
index 00000000000..5584f2d0a99
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
index aecb9da9ce5..fa90ab1e522 100644
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
index 18ac1019236..9477667a870 100755
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
2.20.1


