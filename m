Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3BDF47FCFD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:51:14 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id s8so5605829pji.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=LVsFUk+TONlu0+A/6tmhQFy6Y96fVg01nccqIQ5vV+o=;
	b=p/B97u+3d+gIES00BQXKwfQf9EG6OVqoqbw69yiy5TFf+5CwoW2mcQOFZZ90SjMr0v
	jWXFaHTSiYjGR+g5v0zY/EFm3yFZEDDok+c8IeU6ZO0gy126Mehue1qjyJ2vZdJPbqhY
	p9dFORumi4fDWBZuZ1miSLRquGhRo0EgPU9LYdAgJQ+CiRG3kyD4DrKNqfkPS3sx5ynm
	cudw3NpewmVBFLnuoKWKhDRsWUFWvGdlXkUCLeBWm8DPEcEe0di5GGu8IYhIJ0uXPO9z
	E2GdIwc2qS0t4lu3xjuV6S/VxUFH8TX88hki8KonfXD7VTKWISMK4ecGgfoxEUaxM0OB
	q03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=LVsFUk+TONlu0+A/6tmhQFy6Y96fVg01nccqIQ5vV+o=;
	b=qplQ3G0BZHLcFY0tMQObGsypPMsqpm/1CX4Vpx8+2kIlJSzJZE2/8BYqCb/dsCdKCo
	tMFL/DudZcBuLyiO4jCz1P5UcAE7er839kBYtXEKb4j4nSGbPBdK8B/wSp+whnIpPPVg
	5FjOhVKHJcPOZV4VycrglqZvhi41CmUHoa2T4hQJukNn9JGMCmWErdK6pHpQLt+Vp1ME
	0aEiwgS6RVkFkAbQCYKNF32C2gmwZRqBl165jGvrVX97LYGGW1VLqVzBhntiNTQSy8pu
	rh+SpgpTkT4jYmh3ylUWFRoOrpLZdQihOZbV82r0uPnqLAX2cVmZn6PLq6U0wTNFS1eW
	FpfQ==
X-Gm-Message-State: APjAAAWSelewgl7+XIFHp7zJprzYgGHcrmnWm3LWCzzRbyLZ8LFhKXsj
	lUhfhHi3/tI5gkovfolt4/VYH9/H
X-Google-Smtp-Source: APXvYqx4vv+jEg7yMbiYzcpjRpFep1+dXLmQqOIbq/6dU9XzsMzkI0ritGhRQVmXei6Ls1dxF44M1Q==
X-Received: by 2002:a17:90a:ca04:: with SMTP id
	x4mr35401407pjt.103.1574639475253; 
	Sun, 24 Nov 2019 15:51:15 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.51.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:51:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:39 -0800
Message-Id: <ced6d464e5399fdab0408a3dbe8de1b11d2dfc5c.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 34/35] selftest: check that 'devtool upgrade' correctly drops backported patches
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
X-List-Received-Date: Sun, 24 Nov 2019 23:51:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

There was a regression in this functionality that went unnoticed
due to lack of tests.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../devtool-upgrade-test1-1.5.3/backported.patch   | 37 ++++++++++++++++++++++
 .../devtool/devtool-upgrade-test1_1.5.3.bb         |  4 ++-
 .../devtool-upgrade-test1_1.5.3.bb.upgraded        |  4 ++-
 meta/lib/oeqa/selftest/cases/devtool.py            | 25 +++++++++++++--
 4 files changed, 65 insertions(+), 5 deletions(-)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch

diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch
new file mode 100644
index 0000000..c4f3f12
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch
@@ -0,0 +1,37 @@
+commit ced2ec32b657a7f52604b2e16e5d5881041c517a
+Author: OpenEmbedded <oe.patch@oe>
+Date:   Mon Nov 18 18:43:15 2019 +0100
+
+    Backport of the NEWS file from version 1.6.0
+
+diff --git a/doc/NEWS b/doc/NEWS
+index 69793fc..fd49b1c 100644
+--- a/doc/NEWS
++++ b/doc/NEWS
+@@ -1,3 +1,26 @@
++1.6.0 - 15 March 2015
++  - fix lstat64 support when unavailable - separate patches supplied by
++    Ganael Laplanche and Peter Korsgaard
++  - (#1506) new option "-D" / "--delay-start" to only show bar after N
++    seconds (Damon Harper)
++  - new option "--fineta" / "-I" to show ETA as time of day rather than time
++    remaining - patch supplied by Erkki Seppälä (r147)
++  - (#1509) change ETA (--eta / -e) so that days are given if the hours
++    remaining are 24 or more (Jacek Wielemborek)
++  - (#1499) repeat read and write attempts on partial buffer fill/empty to
++    work around post-signal transfer rate drop reported by Ralf Ramsauer
++  - (#1507) do not try to calculate total size in line mode, due to bug
++    reported by Jacek Wielemborek and Michiel Van Herwegen
++  - cleanup: removed defunct RATS comments and unnecessary copyright notices
++  - clean up displayed lines when using --watchfd PID, when PID exits
++  - output errors on a new line to avoid overwriting transfer bar
++
++1.5.7 - 26 August 2014
++  - show KiB instead of incorrect kiB (Debian bug #706175)
++  - (#1284) do not gzip man page, for non-Linux OSes (Bob Friesenhahn)
++  - work around "awk" bug in tests/016-numeric-timer in decimal "," locales
++  - fix "make rpm" and "make srpm", extend "make release" to sign releases
++
+ 1.5.3 - 4 May 2014
+   - remove SPLICE_F_NONBLOCK to fix problem with slow splice() (Jan Seda)
+ 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
index 333ecac..fee5bee 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
@@ -3,7 +3,9 @@ LICENSE = "Artistic-2.0"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
 
 SRC_URI = "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz \
-           file://0001-Add-a-note-line-to-the-quick-reference.patch"
+           file://0001-Add-a-note-line-to-the-quick-reference.patch \
+           file://backported.patch \
+          "
 UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded
index 9d94f67..66e45c7 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded
@@ -3,7 +3,9 @@ LICENSE = "Artistic-2.0"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
 
 SRC_URI = "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz \
-           file://0001-Add-a-note-line-to-the-quick-reference.patch"
+           file://0001-Add-a-note-line-to-the-quick-reference.patch \
+           file://backported.patch \
+          "
 UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 3a25da2..21e6002 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1496,11 +1496,13 @@ class DevtoolUpgradeTests(DevtoolBase):
         recipedir = os.path.dirname(oldrecipefile)
         olddir = os.path.join(recipedir, recipe + '-' + oldversion)
         patchfn = '0001-Add-a-note-line-to-the-quick-reference.patch'
+        backportedpatchfn = 'backported.patch'
         self.assertExists(os.path.join(olddir, patchfn), 'Original patch file does not exist')
-        return recipe, oldrecipefile, recipedir, olddir, newversion, patchfn
+        self.assertExists(os.path.join(olddir, backportedpatchfn), 'Backported patch file does not exist')
+        return recipe, oldrecipefile, recipedir, olddir, newversion, patchfn, backportedpatchfn
 
     def test_devtool_finish_upgrade_origlayer(self):
-        recipe, oldrecipefile, recipedir, olddir, newversion, patchfn = self._setup_test_devtool_finish_upgrade()
+        recipe, oldrecipefile, recipedir, olddir, newversion, patchfn, backportedpatchfn = self._setup_test_devtool_finish_upgrade()
         # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
         self.assertIn('/meta-selftest/', recipedir)
         # Try finish to the original layer
@@ -1511,14 +1513,23 @@ class DevtoolUpgradeTests(DevtoolBase):
         self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after finish')
         self.assertNotExists(oldrecipefile, 'Old recipe file should have been deleted but wasn\'t')
         self.assertNotExists(os.path.join(olddir, patchfn), 'Old patch file should have been deleted but wasn\'t')
+        self.assertNotExists(os.path.join(olddir, backportedpatchfn), 'Old backported patch file should have been deleted but wasn\'t')
         newrecipefile = os.path.join(recipedir, '%s_%s.bb' % (recipe, newversion))
         newdir = os.path.join(recipedir, recipe + '-' + newversion)
         self.assertExists(newrecipefile, 'New recipe file should have been copied into existing layer but wasn\'t')
         self.assertExists(os.path.join(newdir, patchfn), 'Patch file should have been copied into new directory but wasn\'t')
+        self.assertNotExists(os.path.join(newdir, backportedpatchfn), 'Backported patch file should not have been copied into new directory but was')
         self.assertExists(os.path.join(newdir, '0002-Add-a-comment-to-the-code.patch'), 'New patch file should have been created but wasn\'t')
+        with open(newrecipefile, 'r') as f:
+            newcontent = f.read()
+        self.assertNotIn(backportedpatchfn, newcontent, "Backported patch should have been removed from the recipe but wasn't")
+        self.assertIn(patchfn, newcontent, "Old patch should have not been removed from the recipe but was")
+        self.assertIn("0002-Add-a-comment-to-the-code.patch", newcontent, "New patch should have been added to the recipe but wasn't")
+        self.assertIn("http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz", newcontent, "New recipe no longer has upstream source in SRC_URI")
+
 
     def test_devtool_finish_upgrade_otherlayer(self):
-        recipe, oldrecipefile, recipedir, olddir, newversion, patchfn = self._setup_test_devtool_finish_upgrade()
+        recipe, oldrecipefile, recipedir, olddir, newversion, patchfn, backportedpatchfn = self._setup_test_devtool_finish_upgrade()
         # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
         self.assertIn('/meta-selftest/', recipedir)
         # Try finish to a different layer - should create a bbappend
@@ -1534,10 +1545,18 @@ class DevtoolUpgradeTests(DevtoolBase):
         self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after finish')
         self.assertExists(oldrecipefile, 'Old recipe file should not have been deleted')
         self.assertExists(os.path.join(olddir, patchfn), 'Old patch file should not have been deleted')
+        self.assertExists(os.path.join(olddir, backportedpatchfn), 'Old backported patch file should not have been deleted')
         newdir = os.path.join(newrecipedir, recipe + '-' + newversion)
         self.assertExists(newrecipefile, 'New recipe file should have been copied into existing layer but wasn\'t')
         self.assertExists(os.path.join(newdir, patchfn), 'Patch file should have been copied into new directory but wasn\'t')
+        self.assertNotExists(os.path.join(newdir, backportedpatchfn), 'Backported patch file should not have been copied into new directory but was')
         self.assertExists(os.path.join(newdir, '0002-Add-a-comment-to-the-code.patch'), 'New patch file should have been created but wasn\'t')
+        with open(newrecipefile, 'r') as f:
+            newcontent = f.read()
+        self.assertNotIn(backportedpatchfn, newcontent, "Backported patch should have been removed from the recipe but wasn't")
+        self.assertIn(patchfn, newcontent, "Old patch should have not been removed from the recipe but was")
+        self.assertIn("0002-Add-a-comment-to-the-code.patch", newcontent, "New patch should have been added to the recipe but wasn't")
+        self.assertIn("http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz", newcontent, "New recipe no longer has upstream source in SRC_URI")
 
     def _setup_test_devtool_finish_modify(self):
         # Check preconditions
-- 
2.7.4


