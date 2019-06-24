Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id C87CF7E600
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 03:54:35 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id r7so6712996pfl.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 20:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KMaHgMvs4sdK3RlmvaLH68YNR8ZbLPHVk61OTgwyxdo=;
	b=GJDhAhivICvxFmFxs48PAu6+jsj0qeoN1KZ+U9mI+GYD2mI2zgpE9kJq1U+GyWjrYZ
	6s/rFMSnrog12i7NG5rcIt6lYaXC94Pc7xW5/oGhSgxzEBQaPv6UlO/CaJgEY1swouxG
	YxhvM501FoZLPslNyGyBCf/rHRs3IAphSz4aM7JPSRtA5MD21dz8iR5WiM7tsxLtdnAl
	hSDGKNmGatyKPvn8gPKpo7hHnEs/Zy32DaF8PcBOhtIFE/u0NS9MwJ29kFRWUvLohunP
	Csj8mZpRhHRy+1/1bm+U3Decid+HXcwvXEG1qxLVjv+55v5ps3qOuC+lQ25jfFxe9Qp5
	mY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KMaHgMvs4sdK3RlmvaLH68YNR8ZbLPHVk61OTgwyxdo=;
	b=JHLVmDlWcbH36C5YNEibAyc0q6n1kw1dAM8ETvKdJiElhAeq8C5DUTUwA3UOBsFq4N
	GPK6DGBHTxKmgvgzI9aDobOAI0K0tf5edj1F9lknZ4LCTjW6LzMpBQaXNROG3gkrKjyb
	25yqBm2MH/foVXvrDDS3cW9W3EYMOz71prETQnVOcXEbo0nC0DDQPFAbS40vf+AZk5pN
	0LmwG47LWaQkqgnknqqXy6b0kIPnpr19168//2PC/vKRWv5EakI8hsc9/gX2D8uwKQFt
	uSpdIYbVazL2E2Hyb9eTPa0R8wTmuHM71cA1g+4yWApemfHcjwl31d04yQHqQ+cSisYt
	wAzQ==
X-Gm-Message-State: APjAAAUjj6Quu3wG0YiJagbZ59xSX+MPQTbIeBmBPydhTTTXB9XK5hGd
	eSseJtaBHf8bernUKN0u8Q9wJES9xyE=
X-Google-Smtp-Source: APXvYqwuyjtATPbFCYbzAcFnkIdcMrHWqUDuCPBqB4lo2dIJ8BK3aeoAjuUPeglm3ySPaiDGWrxLFg==
X-Received: by 2002:a63:292:: with SMTP id 140mr29936099pgc.88.1561348476580; 
	Sun, 23 Jun 2019 20:54:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:202:4180:c33:4917:1686:82c6:892f])
	by smtp.gmail.com with ESMTPSA id
	w132sm9837202pfd.78.2019.06.23.20.54.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jun 2019 20:54:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2019 20:54:14 -0700
Message-Id: <b8d16e9d74688e91d6dee5e643b42fd5c4f887b4.1561348290.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561348290.git.akuster808@gmail.com>
References: <cover.1561348290.git.akuster808@gmail.com>
Subject: [Warrior][ 15/19] texinfo-dummy-native: A little clean up of template.py
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
X-List-Received-Date: Mon, 24 Jun 2019 03:54:36 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This is mainly whitespace clean up, plus using the with statement when
writing files.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../texinfo-dummy-native/texinfo-dummy/template.py | 63 +++++++++++-----------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
index e369f74..fcc2854 100644
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
2.7.4


