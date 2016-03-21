Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2161D6212F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 09:57:13 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id p65so144498187wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 02:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8ubzB3r0AH/jElM5F5nspHn6XNnpMWJEpWBZHjlOuWI=;
	b=kayJYGHSEBACXl3fv1ZIyB37U83ziKxxnX799a84wZu+R/X+BeHREv+ob3GoUvzBN1
	nwVpfA2c1qe22AXXxeJU3QqTbsasw6O7AGSjf4y+oYQ9gCmLEej36Pvyj0+NOWh1BHfK
	3OiZibipewYVJhOj28LV0b2XDwBwC2gUAvnkVFwLgSDyDUU1BztsYyb3QV1c4OUHsdsz
	8jk8MWuztmgmYjyDARGxikIL6AFGfFAjEjPY5iYSZSlem9MIXgTyDeSgTKVUbBDY7Cqh
	1duP/Stx1vTvuKgeVUZfHUr3rHXYoCreKPI65VQBc+nry67tGTQgWgA9RUSD9Zas8Wt6
	iewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8ubzB3r0AH/jElM5F5nspHn6XNnpMWJEpWBZHjlOuWI=;
	b=m5Z3L3kXSMkSd13NwEpD4KlmO6ykbOB+kWEjaucQ78nD6jBtbshxcwDn7Rx4lFcz0g
	Qs8gwH0B6fvvCYS09nuXy9gsfg3ix4CsE9PtQJfbDobnJ3dQJKRi0LSp1s9/tSEgqc1O
	d4Py93tljrkudDAi3dSqJ/2cSdGZfHpnlEVHxbuwdbKHs24Z1LIvHoWP1aHFjBRBiYzC
	sUC7T3lA9vdRvmeff72hL7oGttxy8ThFFzfVNh9C8b+owIhV55RM5FKAd08NLdwAcIPk
	wPzhD6Ij7pEodpK7N+uh8KFaFIVJXZ8J8UEc3Ngh/SKpzAINPwex3urjli9aDAtgk6Ye
	9qqQ==
X-Gm-Message-State: AD7BkJLSJh8o1bh3Lf/a2YztJ9yYJfiyv29bI4CaaLaha7X6fDZUfs3GRMezthc1NEeorQ==
X-Received: by 10.28.6.71 with SMTP id 68mr13280152wmg.41.1458554234083;
	Mon, 21 Mar 2016 02:57:14 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bg1sm24555768wjc.27.2016.03.21.02.57.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Mar 2016 02:57:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 11:01:28 +0100
Message-Id: <1458554488-14291-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.3
Subject: [PATCH] python(3): Disable tkinter
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
X-List-Received-Date: Mon, 21 Mar 2016 09:57:14 -0000

* restore changes from:
  http://git.openembedded.org/openembedded-core/commit/?id=53ae544cfdac22c82af452b8c7ebe6664296bd9b
* which were shamelessly removed in upgrade to 2.7.9:
  http://git.openembedded.org/openembedded-core/commit/?id=d4ad95f0d5f08891637c644e85b09da9c4585059
  and then spread to python3 as well
* fixes following issues reported by test-dependencies
  WARN: python3: python3-tkinter rdepends on glibc, but it isn't a build dependency?
  WARN: python3: python3-tkinter rdepends on libpython3, but it isn't a build dependency?
  WARN: python3: python3-tkinter rdepends on tcl-lib, but it isn't a build dependency?

  WARN: python: python-tkinter rdepends on glibc, but it isn't a build dependency?
  WARN: python: python-tkinter rdepends on libpython2, but it isn't a build dependency?
  WARN: python: python-tkinter rdepends on tcl-lib, but it isn't a build dependency?

  and following QA warnings in normal builds:
  python-2.7.11: python-tkinter rdepends on tcl-lib, but it isn't a build dependency, missing tcl in DEPENDS or PACKAGECONFIG? [build-deps]
  python-2.7.11: /usr/lib/python2.7/lib-dynload/_tkinter.so contained in package python-tkinter requires libtk8.6.so, but no providers found in RDEPENDS_python-tkinter? [file-rdeps]
  python3-3.5.1: python3-tkinter rdepends on tcl-lib, but it isn't a build dependency, missing tcl in DEPENDS or PACKAGECONFIG? [build-deps]
  python3-3.5.1: /usr/lib/python3.5/lib-dynload/_tkinter.cpython-35m-arm-linux-gnueabi.so contained in package python3-tkinter requires libtk8.6.so, but no providers found in RDEPENDS_python3-tkinter? [file-rdeps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../python/python/avoid_warning_about_tkinter.patch        | 14 ++++++++++++++
 .../python/python3/avoid_warning_about_tkinter.patch       | 14 ++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch b/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch
index 208c57c..3347321 100644
--- a/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch
+++ b/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch
@@ -4,6 +4,7 @@ Avoid a warning by not adding this module to missing variable.
 
 Upstream-Status: Inappropriate [distribution]
 
+Also simply disable the tk module since its not in DEPENDS.
 Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
 
 Index: Python-2.7.2/setup.py
@@ -23,3 +24,16 @@ Index: Python-2.7.2/setup.py
  
          return missing
  
+diff --git Python-3.5.1.orig/setup.py Python-3.5.1/setup.py
+index b4633b9..d7588c0 100644
+--- Python-3.5.1.orig/setup.py
++++ Python-3.5.1/setup.py
+@@ -1536,7 +1536,7 @@ class PyBuildExt(build_ext):
+         self.extensions.extend(exts)
+ 
+         # Call the method for detecting whether _tkinter can be compiled
+-        self.detect_tkinter(inc_dirs, lib_dirs)
++        # self.detect_tkinter(inc_dirs, lib_dirs)
+ 
+         # tkinter module will not be avalaible as yocto
+         # doesn't have tk integrated (yet)
diff --git a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
index 208c57c..3347321 100644
--- a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
+++ b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
@@ -4,6 +4,7 @@ Avoid a warning by not adding this module to missing variable.
 
 Upstream-Status: Inappropriate [distribution]
 
+Also simply disable the tk module since its not in DEPENDS.
 Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
 
 Index: Python-2.7.2/setup.py
@@ -23,3 +24,16 @@ Index: Python-2.7.2/setup.py
  
          return missing
  
+diff --git Python-3.5.1.orig/setup.py Python-3.5.1/setup.py
+index b4633b9..d7588c0 100644
+--- Python-3.5.1.orig/setup.py
++++ Python-3.5.1/setup.py
+@@ -1536,7 +1536,7 @@ class PyBuildExt(build_ext):
+         self.extensions.extend(exts)
+ 
+         # Call the method for detecting whether _tkinter can be compiled
+-        self.detect_tkinter(inc_dirs, lib_dirs)
++        # self.detect_tkinter(inc_dirs, lib_dirs)
+ 
+         # tkinter module will not be avalaible as yocto
+         # doesn't have tk integrated (yet)
-- 
2.7.3


