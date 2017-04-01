Return-Path: <openembedded@mindchasers.com>
Received: from smtp.webfaction.com (mail6.webfaction.com [74.55.86.74])
	by mail.openembedded.org (Postfix) with ESMTP id 6CBC077CCC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Apr 2017 02:38:23 +0000 (UTC)
Received: from localhost.localdomain (c-73-10-189-235.hsd1.nj.comcast.net
	[73.10.189.235])
	by smtp.webfaction.com (Postfix) with ESMTP id A83E759D007C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Apr 2017 02:38:24 +0000 (UTC)
From: Bob Cochran <openembedded@mindchasers.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Mar 2017 22:38:13 -0400
Message-Id: <1491014293-7747-1-git-send-email-openembedded@mindchasers.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python: remove stale link to "Python for Embedded Systems Site"
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
X-List-Received-Date: Sat, 01 Apr 2017 02:38:25 -0000

Reference url is a stale, non existent site that returns a 404, so get rid of it

Change impacts both the manifest files and the scripts that generate the manifests

Run the following from within recipes-devtools/python

../../../scripts/contrib/python/generate-manifest-2.7.py > python-2.7-manifest.inc
../../../scripts/contrib/python/generate-manifest-2.7.py -n > python-native-2.7-manifest.inc

../../../scripts/contrib/python/generate-manifest-3.5.py > python-3.5-manifest.inc
../../../scripts/contrib/python/generate-manifest-3.5.py -n > python-native-3.5-manifest.inc

Signed-off-by: Bob Cochran <openembedded@mindchasers.com>
---
 meta/recipes-devtools/python/python-2.7-manifest.inc        | 1 -
 meta/recipes-devtools/python/python-3.5-manifest.inc        | 1 -
 meta/recipes-devtools/python/python-native-2.7-manifest.inc | 1 -
 meta/recipes-devtools/python/python-native-3.5-manifest.inc | 1 -
 scripts/contrib/python/generate-manifest-2.7.py             | 1 -
 scripts/contrib/python/generate-manifest-3.5.py             | 1 -
 6 files changed, 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 621024f..413405a 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -1,7 +1,6 @@
 
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
 # Generator: '../../../scripts/contrib/python/generate-manifest-2.7.py' Version 20110222.2 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
-# Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
 
  
 
diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index a53a8d5..55bcc4b 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -1,7 +1,6 @@
 
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
 # Generator: '../../../scripts/contrib/python/generate-manifest-3.5.py' Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
-# Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
 
  
 
diff --git a/meta/recipes-devtools/python/python-native-2.7-manifest.inc b/meta/recipes-devtools/python/python-native-2.7-manifest.inc
index f45147b..581a37a 100644
--- a/meta/recipes-devtools/python/python-native-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-native-2.7-manifest.inc
@@ -1,7 +1,6 @@
 
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
 # Generator: '../../../scripts/contrib/python/generate-manifest-2.7.py --native' Version 20110222.2 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
-# Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
 
  
 
diff --git a/meta/recipes-devtools/python/python-native-3.5-manifest.inc b/meta/recipes-devtools/python/python-native-3.5-manifest.inc
index aa4c4f5..10be3e9 100644
--- a/meta/recipes-devtools/python/python-native-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-native-3.5-manifest.inc
@@ -1,7 +1,6 @@
 
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
 # Generator: '../../../scripts/contrib/python/generate-manifest-3.5.py --native' Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
-# Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
 
  
 
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index b5941a0..5504b62 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -34,7 +34,6 @@ class MakefileMaker:
         self.out( """
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
 # Generator: '%s%s' Version %s (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
-# Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
 """ % ( sys.argv[0], ' --native' if isNative else '', __version__ ) )
 
     #
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index a7fc8ba..386bdfc 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -37,7 +37,6 @@ class MakefileMaker:
         self.out( """
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
 # Generator: '%s%s' Version %s (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
-# Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
 """ % ( sys.argv[0], ' --native' if isNative else '', __version__ ) )
 
     #
-- 
2.7.4


