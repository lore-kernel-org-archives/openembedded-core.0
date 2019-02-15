Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id C7DF47C776
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 16:04:11 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id j125so10133905wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 08:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=4EjNUYa8FEBIiXk6I+wNHcp6ezgNXgCdnpkWhPKLk64=;
	b=ILNfbIdCVuW9AkKvVzweVtzV26IDBvbL9oLqWcg+LsLCmCrxApbHQHNbi7g5PVhqnP
	m4ccUffDWxZ/0aFlDBgGbKdZDUEn6x+vGdXResGlnbKa3fleJnvOLllmHDosuDLYbWD3
	lq0KPiJ5bVw6fONuRzK1k0AD+XrAqQ1nCqpGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4EjNUYa8FEBIiXk6I+wNHcp6ezgNXgCdnpkWhPKLk64=;
	b=hONdqo0sZL3PW+olznDz83t8kTOjf566G7x9CnTytmKdYu6DQh0pCgFI4Lxia5sg3g
	BTYHgCvx1Suf2e0e9kYolBJqFJo958UeIEhK6yz4ugiPzmd9arzgqtzCURxEo691m4DL
	XdIfjDVKdKefmrUTAkVi0bAR+vkA2qiksBHLxVHi95pIzMdfSWqSisPf/OyXKAILSV4s
	BEbt3haygI28JvhAFxgBSEI+tCW3CehlloBYqCakJk85dOs+M/gNkA2Vf9GYzF3ouAEA
	uMND625mIc74nNgIoEtgvIwRjRZG9hIK1Sb8J9ZU4NU1VM7nUZBUOp1Vu450mwtYIlXX
	x2ig==
X-Gm-Message-State: AHQUAuYoa3/b3P/JiDItvEqT1M1q0/4F9tRV5Bcgozs2RszmpEweVhrr
	U+n/8dBlZmPKnAj6Gwk3lfFEDdqRhVQ=
X-Google-Smtp-Source: AHgI3Ib1StCtKrfH3CAvFE0hr0oNlbg2phAn+GIpwlnyJajNOIbvAGTB4R9N9Uk0eSK/QtmAlA441Q==
X-Received: by 2002:a1c:f312:: with SMTP id q18mr7004865wmq.106.1550246651830; 
	Fri, 15 Feb 2019 08:04:11 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e17sm3810424wrs.79.2019.02.15.08.04.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Feb 2019 08:04:11 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Feb 2019 16:03:56 +0000
Message-Id: <20190215160356.9764-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190215160356.9764-1-richard.purdie@linuxfoundation.org>
References: <20190215160356.9764-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 5/5] lib/oe, oeqa/selftest: Fix DeprecationWarning: invalid escape sequence
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
X-List-Received-Date: Fri, 15 Feb 2019 16:04:12 -0000
Content-Transfer-Encoding: 8bit

Fix another load of regex escape sequence warnings for newer
python versions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/recipeutils.py                  |  8 ++++----
 meta/lib/oeqa/selftest/cases/bbtests.py     |  6 +++---
 meta/lib/oeqa/selftest/cases/devtool.py     |  2 +-
 meta/lib/oeqa/selftest/cases/prservice.py   |  4 ++--
 meta/lib/oeqa/selftest/cases/sstatetests.py | 18 +++++++++---------
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 92c0f65257f..8f70d2eb212 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -24,7 +24,7 @@ from bb.utils import vercmp_string
 # Help us to find places to insert values
 recipe_progression = ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER', 'SECTION', 'LICENSE', 'LICENSE_FLAGS', 'LIC_FILES_CHKSUM', 'PROVIDES', 'DEPENDS', 'PR', 'PV', 'SRCREV', 'SRCPV', 'SRC_URI', 'S', 'do_fetch()', 'do_unpack()', 'do_patch()', 'EXTRA_OECONF', 'EXTRA_OECMAKE', 'EXTRA_OESCONS', 'do_configure()', 'EXTRA_OEMAKE', 'do_compile()', 'do_install()', 'do_populate_sysroot()', 'INITSCRIPT', 'USERADD', 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW_EMPTY', 'populate_packages()', 'do_package()', 'do_deploy()']
 # Variables that sometimes are a bit long but shouldn't be wrapped
-nowrap_vars = ['SUMMARY', 'HOMEPAGE', 'BUGTRACKER', 'SRC_URI\[(.+\.)?md5sum\]', 'SRC_URI\[(.+\.)?sha256sum\]']
+nowrap_vars = ['SUMMARY', 'HOMEPAGE', 'BUGTRACKER', r'SRC_URI\[(.+\.)?md5sum\]', r'SRC_URI\[(.+\.)?sha256sum\]']
 list_vars = ['SRC_URI', 'LIC_FILES_CHKSUM']
 meta_vars = ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER', 'SECTION']
 
@@ -161,7 +161,7 @@ def patch_recipe_lines(fromlines, values, trailing_newline=True):
             key = item[:-2]
         else:
             key = item
-        restr = '%s(_[a-zA-Z0-9-_$(){}]+|\[[^\]]*\])?' % key
+        restr = r'%s(_[a-zA-Z0-9-_$(){}]+|\[[^\]]*\])?' % key
         if item.endswith('()'):
             recipe_progression_restrs.append(restr + '()')
         else:
@@ -925,7 +925,7 @@ def get_recipe_pv_without_srcpv(pv, uri_type):
     sfx = ''
 
     if uri_type == 'git':
-        git_regex = re.compile("(?P<pfx>v?)(?P<ver>[^\+]*)((?P<sfx>\+(git)?r?(AUTOINC\+))(?P<rev>.*))?")
+        git_regex = re.compile(r"(?P<pfx>v?)(?P<ver>[^\+]*)((?P<sfx>\+(git)?r?(AUTOINC\+))(?P<rev>.*))?")
         m = git_regex.match(pv)
 
         if m:
@@ -933,7 +933,7 @@ def get_recipe_pv_without_srcpv(pv, uri_type):
             pfx = m.group('pfx')
             sfx = m.group('sfx')
     else:
-        regex = re.compile("(?P<pfx>(v|r)?)(?P<ver>.*)")
+        regex = re.compile(r"(?P<pfx>(v|r)?)(?P<ver>.*)")
         m = regex.match(pv)
         if m:
             pv = m.group('ver')
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 005fdd09640..c503e4eedda 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -40,8 +40,8 @@ class BitbakeTests(OESelftestTestCase):
     def test_event_handler(self):
         self.write_config("INHERIT += \"test_events\"")
         result = bitbake('m4-native')
-        find_build_started = re.search("NOTE: Test for bb\.event\.BuildStarted(\n.*)*NOTE: Executing RunQueue Tasks", result.output)
-        find_build_completed = re.search("Tasks Summary:.*(\n.*)*NOTE: Test for bb\.event\.BuildCompleted", result.output)
+        find_build_started = re.search(r"NOTE: Test for bb\.event\.BuildStarted(\n.*)*NOTE: Executing RunQueue Tasks", result.output)
+        find_build_completed = re.search(r"Tasks Summary:.*(\n.*)*NOTE: Test for bb\.event\.BuildCompleted", result.output)
         self.assertTrue(find_build_started, msg = "Match failed in:\n%s"  % result.output)
         self.assertTrue(find_build_completed, msg = "Match failed in:\n%s" % result.output)
         self.assertFalse('Test for bb.event.InvalidEvent' in result.output, msg = "\"Test for bb.event.InvalidEvent\" message found during bitbake process. bitbake output: %s" % result.output)
@@ -196,7 +196,7 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
     @OETestID(1031)
     def test_version(self):
         result = runCmd('bitbake -s | grep wget')
-        find = re.search("wget *:([0-9a-zA-Z\.\-]+)", result.output)
+        find = re.search(r"wget *:([0-9a-zA-Z\.\-]+)", result.output)
         self.assertTrue(find, "No version returned for searched recipe. bitbake output: %s" % result.output)
 
     @OETestID(1032)
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 9eb9badf84f..58f3e58461a 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1291,7 +1291,7 @@ class DevtoolExtractTests(DevtoolBase):
             installdir = bb_vars['D']
             fakerootenv = bb_vars['FAKEROOTENV']
             fakerootcmd = bb_vars['FAKEROOTCMD']
-            result = runCmd('%s %s find . -type f -exec ls -l {} \;' % (fakerootenv, fakerootcmd), cwd=installdir)
+            result = runCmd('%s %s find . -type f -exec ls -l {} \\;' % (fakerootenv, fakerootcmd), cwd=installdir)
             filelist1 = self._process_ls_output(result.output)
 
             # Now look on the target
diff --git a/meta/lib/oeqa/selftest/cases/prservice.py b/meta/lib/oeqa/selftest/cases/prservice.py
index 479e5206184..796ad4f5feb 100644
--- a/meta/lib/oeqa/selftest/cases/prservice.py
+++ b/meta/lib/oeqa/selftest/cases/prservice.py
@@ -19,7 +19,7 @@ class BitbakePrTests(OESelftestTestCase):
     def get_pr_version(self, package_name):
         package_data_file = os.path.join(self.pkgdata_dir, 'runtime', package_name)
         package_data = ftools.read_file(package_data_file)
-        find_pr = re.search("PKGR: r[0-9]+\.([0-9]+)", package_data)
+        find_pr = re.search(r"PKGR: r[0-9]+\.([0-9]+)", package_data)
         self.assertTrue(find_pr, "No PKG revision found in %s" % package_data_file)
         return int(find_pr.group(1))
 
@@ -29,7 +29,7 @@ class BitbakePrTests(OESelftestTestCase):
         package_stamps_path = "/".join(stampdata[:-1])
         stamps = []
         for stamp in os.listdir(package_stamps_path):
-            find_stamp = re.match("%s\.%s\.([a-z0-9]{32})" % (re.escape(prefix), recipe_task), stamp)
+            find_stamp = re.match(r"%s\.%s\.([a-z0-9]{32})" % (re.escape(prefix), recipe_task), stamp)
             if find_stamp:
                 stamps.append(find_stamp.group(1))
         self.assertFalse(len(stamps) == 0, msg="Cound not find stamp for task %s for recipe %s" % (recipe_task, package_name))
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 077d6e53746..938e654e9a3 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -96,14 +96,14 @@ class SStateTests(SStateBase):
         bitbake(['-ccleansstate'] + targets)
 
         bitbake(targets)
-        tgz_created = self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific, distro_nonspecific)
+        tgz_created = self.search_sstate('|'.join(map(str, [s + r'.*?\.tgz$' for s in targets])), distro_specific, distro_nonspecific)
         self.assertTrue(tgz_created, msg="Could not find sstate .tgz files for: %s (%s)" % (', '.join(map(str, targets)), str(tgz_created)))
 
-        siginfo_created = self.search_sstate('|'.join(map(str, [s + '.*?\.siginfo$' for s in targets])), distro_specific, distro_nonspecific)
+        siginfo_created = self.search_sstate('|'.join(map(str, [s + r'.*?\.siginfo$' for s in targets])), distro_specific, distro_nonspecific)
         self.assertTrue(siginfo_created, msg="Could not find sstate .siginfo files for: %s (%s)" % (', '.join(map(str, targets)), str(siginfo_created)))
 
         bitbake(['-ccleansstate'] + targets)
-        tgz_removed = self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific, distro_nonspecific)
+        tgz_removed = self.search_sstate('|'.join(map(str, [s + r'.*?\.tgz$' for s in targets])), distro_specific, distro_nonspecific)
         self.assertTrue(not tgz_removed, msg="do_cleansstate didn't remove .tgz sstate files for: %s (%s)" % (', '.join(map(str, targets)), str(tgz_removed)))
 
     @OETestID(977)
@@ -130,14 +130,14 @@ class SStateTests(SStateBase):
         bitbake(['-ccleansstate'] + targets)
 
         bitbake(targets)
-        results = self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific=False, distro_nonspecific=True)
+        results = self.search_sstate('|'.join(map(str, [s + r'.*?\.tgz$' for s in targets])), distro_specific=False, distro_nonspecific=True)
         filtered_results = []
         for r in results:
             if r.endswith(("_populate_lic.tgz", "_populate_lic.tgz.siginfo")):
                 continue
             filtered_results.append(r)
         self.assertTrue(filtered_results == [], msg="Found distro non-specific sstate for: %s (%s)" % (', '.join(map(str, targets)), str(filtered_results)))
-        file_tracker_1 = self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific=True, distro_nonspecific=False)
+        file_tracker_1 = self.search_sstate('|'.join(map(str, [s + r'.*?\.tgz$' for s in targets])), distro_specific=True, distro_nonspecific=False)
         self.assertTrue(len(file_tracker_1) >= len(targets), msg = "Not all sstate files ware created for: %s" % ', '.join(map(str, targets)))
 
         self.track_for_cleanup(self.distro_specific_sstate + "_old")
@@ -146,7 +146,7 @@ class SStateTests(SStateBase):
 
         bitbake(['-cclean'] + targets)
         bitbake(targets)
-        file_tracker_2 = self.search_sstate('|'.join(map(str, [s + '.*?\.tgz$' for s in targets])), distro_specific=True, distro_nonspecific=False)
+        file_tracker_2 = self.search_sstate('|'.join(map(str, [s + r'.*?\.tgz$' for s in targets])), distro_specific=True, distro_nonspecific=False)
         self.assertTrue(len(file_tracker_2) >= len(targets), msg = "Not all sstate files ware created for: %s" % ', '.join(map(str, targets)))
 
         not_recreated = [x for x in file_tracker_1 if x not in file_tracker_2]
@@ -192,18 +192,18 @@ class SStateTests(SStateBase):
             if not sstate_arch in sstate_archs_list:
                 sstate_archs_list.append(sstate_arch)
             if target_config[idx] == target_config[-1]:
-                target_sstate_before_build = self.search_sstate(target + '.*?\.tgz$')
+                target_sstate_before_build = self.search_sstate(target + r'.*?\.tgz$')
             bitbake("-cclean %s" % target)
             result = bitbake(target, ignore_status=True)
             if target_config[idx] == target_config[-1]:
-                target_sstate_after_build = self.search_sstate(target + '.*?\.tgz$')
+                target_sstate_after_build = self.search_sstate(target + r'.*?\.tgz$')
                 expected_remaining_sstate += [x for x in target_sstate_after_build if x not in target_sstate_before_build if not any(pattern in x for pattern in ignore_patterns)]
             self.remove_config(global_config[idx])
             self.remove_recipeinc(target, target_config[idx])
             self.assertEqual(result.status, 0, msg = "build of %s failed with %s" % (target, result.output))
 
         runCmd("sstate-cache-management.sh -y --cache-dir=%s --remove-duplicated --extra-archs=%s" % (self.sstate_path, ','.join(map(str, sstate_archs_list))))
-        actual_remaining_sstate = [x for x in self.search_sstate(target + '.*?\.tgz$') if not any(pattern in x for pattern in ignore_patterns)]
+        actual_remaining_sstate = [x for x in self.search_sstate(target + r'.*?\.tgz$') if not any(pattern in x for pattern in ignore_patterns)]
 
         actual_not_expected = [x for x in actual_remaining_sstate if x not in expected_remaining_sstate]
         self.assertFalse(actual_not_expected, msg="Files should have been removed but ware not: %s" % ', '.join(map(str, actual_not_expected)))
-- 
2.20.1


