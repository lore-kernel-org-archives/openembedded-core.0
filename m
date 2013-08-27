Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 00ABC6BC58
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 17:16:29 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id uo5so5075535pbc.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 10:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=pK/XzneIGWFVvraB/vt1CtyWfi/IJQELO3QQN0/Ydcw=;
	b=nc1skRrSx048jLJg2PaORA3NbizctTjOUKcvkoujy4phmDsCoapFQ9rDlxhhhZqotA
	cYmS9rYAIp8nVKoebblRvyCrMmnLZyIr3hbPaQyVcJCtmash2AMbo1IktpR3q2i2wAh8
	sGWb68nxXi6waxZkyxuRidVCix1Hb8bo/fMqOiw75oOSOldVZhdUlQeLvc3KUrSv6+4f
	Tkw8OI0fn6iMbRrD+TCeTzSkMqvLk8MJx8LZhg75PmNFr0aW4F1xRJDZD9q4X5AgIelZ
	nJYdYCTfm4hYUJJBwsMAAA4KBlASuKZQY0fhqscJ8sOEdUgHX7CGRjl4vKf9FJpRa08D
	M/wQ==
X-Received: by 10.68.232.166 with SMTP id tp6mr10317184pbc.153.1377623791014; 
	Tue, 27 Aug 2013 10:16:31 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id t9sm25769021pba.46.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 10:16:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 10:15:18 -0700
Message-Id: <ab8d820b0a4b6b76d89be9ee74e6ba4b0d854327.1377623208.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
References: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
In-Reply-To: <cover.1377623208.git.raj.khem@gmail.com>
References: <cover.1377623208.git.raj.khem@gmail.com>
Subject: [PATCH 19/20] python: Add Patch description and status information
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
X-List-Received-Date: Tue, 27 Aug 2013 17:16:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3/000-cross-compile.patch       | 7 +++++++
 .../python/python3/020-dont-compile-python-files.patch             | 6 ++++++
 meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch  | 6 ++++++
 .../python/python3/070-dont-clean-ipkg-install.patch               | 6 ++++++
 .../python/python3/080-distutils-dont_adjust_files.patch           | 6 ++++++
 meta/recipes-devtools/python/python3/110-enable-zlib.patch         | 6 ++++++
 meta/recipes-devtools/python/python3/130-readline-setup.patch      | 6 ++++++
 meta/recipes-devtools/python/python3/150-fix-setupterm.patch       | 6 ++++++
 meta/recipes-devtools/python/python3/python-3.3-multilib.patch     | 6 ++++++
 .../python/python3/shutil-follow-symlink-fix.patch                 | 6 ++++++
 10 files changed, 61 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/000-cross-compile.patch b/meta/recipes-devtools/python/python3/000-cross-compile.patch
index 23c1755..2506a59 100644
--- a/meta/recipes-devtools/python/python3/000-cross-compile.patch
+++ b/meta/recipes-devtools/python/python3/000-cross-compile.patch
@@ -1,3 +1,10 @@
+We cross compile python. This patch uses tools from host/native
+python instead of in-tree tools
+
+-Khem
+
+Upstream-Status: Inappropriate[Configuration Specific]
+
 ---
  Makefile.pre.in |   25 +++++++++++++------------
  1 file changed, 13 insertions(+), 12 deletions(-)
diff --git a/meta/recipes-devtools/python/python3/020-dont-compile-python-files.patch b/meta/recipes-devtools/python/python3/020-dont-compile-python-files.patch
index 07a906e..03ef286 100644
--- a/meta/recipes-devtools/python/python3/020-dont-compile-python-files.patch
+++ b/meta/recipes-devtools/python/python3/020-dont-compile-python-files.patch
@@ -1,3 +1,9 @@
+Dont cross compile site packages
+
+-Khem
+
+Upstream-Status: Inappropriate[Embedded-Specific]
+
 ---
  Makefile.pre.in |   16 ----------------
  1 file changed, 16 deletions(-)
diff --git a/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch b/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
index 3e009c1..6beac7b 100644
--- a/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
+++ b/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
@@ -1,3 +1,9 @@
+Do not hardcode /usr into include paths when cross compiling
+
+-Khem
+
+Upstream-Status: Pending
+ 
 ---
  setup.py |   15 ++-------------
  1 file changed, 2 insertions(+), 13 deletions(-)
diff --git a/meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch b/meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch
index 2ac85d9..789929b 100644
--- a/meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch
+++ b/meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch
@@ -1,3 +1,9 @@
+consider opkg directories when cleaning up
+
+-Khem
+
+Upstream-Status: Inappropriate [OE specific]
+
 ---
  Makefile.pre.in |    6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
diff --git a/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch b/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
index ac5450b..b96419a 100644
--- a/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
+++ b/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
@@ -1,3 +1,9 @@
+do not "adjust" python files before copying
+
+-Khem
+
+Upstream-Status: Inappropriate [Embedded-Specific]
+
 ---
  Lib/distutils/command/build_scripts.py |   43 +++------------------------------
  1 file changed, 4 insertions(+), 39 deletions(-)
diff --git a/meta/recipes-devtools/python/python3/110-enable-zlib.patch b/meta/recipes-devtools/python/python3/110-enable-zlib.patch
index 90c364e..fb92a19 100644
--- a/meta/recipes-devtools/python/python3/110-enable-zlib.patch
+++ b/meta/recipes-devtools/python/python3/110-enable-zlib.patch
@@ -1,3 +1,9 @@
+Enable zlib in python
+
+-Khem
+
+Upstream-Status: Inappropriate [OE-Specific]
+
 ---
  Modules/Setup.dist |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/python/python3/130-readline-setup.patch b/meta/recipes-devtools/python/python3/130-readline-setup.patch
index 3d28a19..c805652 100644
--- a/meta/recipes-devtools/python/python3/130-readline-setup.patch
+++ b/meta/recipes-devtools/python/python3/130-readline-setup.patch
@@ -1,3 +1,9 @@
+package python-readline
+
+-Khem
+
+Upstream-Status: Inappropriate [Embedded Specific]
+
 --- a/setup.py
 +++ b/setup.py
 @@ -666,45 +666,7 @@ class PyBuildExt(build_ext):
diff --git a/meta/recipes-devtools/python/python3/150-fix-setupterm.patch b/meta/recipes-devtools/python/python3/150-fix-setupterm.patch
index db53482..78d7c78 100644
--- a/meta/recipes-devtools/python/python3/150-fix-setupterm.patch
+++ b/meta/recipes-devtools/python/python3/150-fix-setupterm.patch
@@ -1,3 +1,9 @@
+Fix warning with newer compiler
+
+-Khem
+
+Upstream-Status: Pending
+
 --- a/Modules/_cursesmodule.c
 +++ b/Modules/_cursesmodule.c
 @@ -116,7 +116,7 @@ char *PyCursesVersion = "2.2";
diff --git a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
index 679f49f..7d66a0e 100644
--- a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
+++ b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
@@ -1,3 +1,9 @@
+get the sys.lib from python itself and do not use hardcoded value of 'lib'
+
+-Khem
+
+Upstream-Status: Pending
+
 Index: Python-3.3.2/Include/pythonrun.h
 ===================================================================
 --- Python-3.3.2.orig/Include/pythonrun.h	2013-05-15 09:32:54.000000000 -0700
diff --git a/meta/recipes-devtools/python/python3/shutil-follow-symlink-fix.patch b/meta/recipes-devtools/python/python3/shutil-follow-symlink-fix.patch
index 0e4680e..802b1c7 100644
--- a/meta/recipes-devtools/python/python3/shutil-follow-symlink-fix.patch
+++ b/meta/recipes-devtools/python/python3/shutil-follow-symlink-fix.patch
@@ -1,3 +1,9 @@
+shutils should consider symlinks
+
+-Khem
+
+Upstream-Status: Pending
+
 --- a/Lib/shutil.py	2013-01-29 12:31:06.926555779 -0800
 +++ b/Lib/shutil.py	2013-01-29 16:31:39.097554182 -0800
 @@ -132,7 +132,7 @@ def copymode(src, dst, *, follow_symlink
-- 
1.8.3.4


