Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4B07E470
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 18:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 5DC58185C7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 20:42:58 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id TKyHPbaWVtcY
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 20:42:57 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 5115B18343
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 20:42:57 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 26F581E087
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 20:42:57 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B5C71E086
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 20:42:57 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 20:42:57 +0200 (CEST)
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by thoth.se.axis.com (Postfix) with ESMTP id 0F25D1E43
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 20:42:57 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.15.2/8.15.2) with ESMTPS id x4NIguax015041
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 20:42:56 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.15.2/8.15.2/Submit) id x4NIgufJ015040
	for openembedded-core@lists.openembedded.org;
	Thu, 23 May 2019 20:42:56 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2019 20:42:53 +0200
Message-Id: <20190523184254.14995-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH 1/2] texinfo-dummy-native: A little clean up of template.py
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
X-List-Received-Date: Thu, 23 May 2019 18:42:58 -0000
Content-Transfer-Encoding: 8bit

This is mainly whitespace clean up, plus using the with statement when
writing files.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../texinfo-dummy/template.py                 | 63 +++++++++----------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
index e369f74455..fcc28548af 100644
--- a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
+++ b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
@@ -33,21 +33,20 @@ import sys, os
 olong = "--output="
 Elong = "--macro-expand="
 
-
-this_binary = sys.argv[0].split ("/")[-1]
+this_binary = sys.argv[0].split("/")[-1]
 
 # To be outputted if functionality that hasn't been stubbed yet is invoked.
 stub_msg = """
-This stand-in version of %s is not yet fully capable of emulating the real
-version from the GNU texinfo suite. If you see this message, file a bug report
-with details on the recipe that failed.
+This stand-in version of %s is not yet fully capable of emulating
+the real version from the GNU texinfo suite. If you see this message, file a
+bug report with details on the recipe that failed.
 """ % this_binary
 
 # Autotools setups query the version, so this is actually necessary. Some of
 # them (lookin' at you, glibc) actually look for the substring "GNU texinfo,"
 # so we put that substring in there without actually telling a lie.
-version_str = """ %s (fake texinfo, emulating GNU texinfo) 5.2
- 
+version_str = """%s (fake texinfo, emulating GNU texinfo) 5.2
+
 Super amazing version which is totally not fake in any way whatsoever.
 Copyright (C) 2014 Intel Corp. Distributed under the terms of the MIT
 license.
@@ -55,62 +54,61 @@ license.
 
 simple_binaries = "pod2texi texi2dvi pdftexi2dvi texindex texi2pdf \
                    txixml2texi install-info ginstall-info \
-                   update-info-dir".split ()
+                   update-info-dir".split()
 
 # These utilities use a slightly different set of options and flags.
-complex_binaries = "makeinfo texi2any".split ()
+complex_binaries = "makeinfo texi2any".split()
 
 valid_binaries = simple_binaries + complex_binaries
 
 # For generating blank output files.
-def touch_file (path):
-    f = open (path, "w")
-    f.close ()
+def touch_file(path):
+    with open(path, "w"):
+        pass
 
 assert this_binary in valid_binaries, \
-       this_binary + " is not one of " + ', '.join (valid_binaries)
+       this_binary + " is not one of " + ', '.join(valid_binaries)
 
 if "--version" in sys.argv:
     print(version_str)
-    sys.exit (0)
+    sys.exit(0)
 
 # For debugging
 log_interceptions = False
 if log_interceptions:
-    f = open ("/tmp/intercepted_" + this_binary, "a")
-    f.write (' '.join ([this_binary] + sys.argv[1:]) + '\n')
-    f.close ()
+    with open("/tmp/intercepted_" + this_binary, "a") as f:
+        f.write(' '.join([this_binary] + sys.argv[1:]) + '\n')
 
 # Look through the options and flags, and if necessary, touch any output
 # files.
 arg_idx = 1
-while arg_idx < len (sys.argv):
+while arg_idx < len(sys.argv):
     arg = sys.argv [arg_idx]
-    
+
     if arg == "--":
         break
-    
+
     # Something like -I . can result in a need for this (specifically the .)
-    elif len (arg) < 2:
+    elif len(arg) < 2:
         pass
-    
+
     # Check if -o or --output is specified. These can be used at most once.
-    elif arg[0] == '-' and arg[1] != '-' and arg[len (arg) - 1] == 'o':
-        touch_file (sys.argv[arg_idx + 1])
-        sys.exit (0)
-    elif arg.startswith (olong):
-        touch_file (arg.split ("=")[1])
-        sys.exit (0)
-    
+    elif arg[0] == '-' and arg[1] != '-' and arg[len(arg) - 1] == 'o':
+        touch_file(sys.argv[arg_idx + 1])
+        sys.exit(0)
+    elif arg.startswith(olong):
+        touch_file(arg.split("=")[1])
+        sys.exit(0)
+
     # Check for functionality that isn't implemented yet.
     else:
         assert arg[0] != '-' or arg[1] == '-' or 'E' not in arg or \
                this_binary in simple_binaries, \
                "-E option not yet supported" + stub_msg
-        
-        assert not arg.startswith (Elong), \
+
+        assert not arg.startswith(Elong), \
                Elong[:-1] + " option not yet supported" + stub_msg
-    
+
     arg_idx += 1
 
 # The -o/--output option overrides the default. For makeinfo and texi2any,
@@ -119,4 +117,3 @@ while arg_idx < len (sys.argv):
 assert this_binary in simple_binaries, \
        "Don't know how to get default output file name from input file!" + \
        stub_msg
-
-- 
2.21.0


