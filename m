Return-Path: <michael.g.wood@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id AADAE71A2D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 12:24:45 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id t79so21362572wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 04:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VhbEUqCMfqjvPHkD39M5UaLI+D2ivxQDoliVFe+OAjY=;
	b=ft1Hm7HbY1o4gr1duf0ZaKtQYw07ccVy7WX/xfZ+uOSr2PU09u7SC4Ao4XuuJvNuFl
	1+3ehprmLjLtlJ4/9GfxZDmTuaQ3025XiRW3JuIa9rsBCv7QOPJiNRgqeupQ1yZGnrWd
	pSZN15c3qrX8Ojtr3iZKfhFX2Ej3qBlGqVLPerd6ORROAdaGsziYYY/5hM/KRvMY9Znw
	mcmHLy1LxHVEE8ZPdSpFkbAgD1sk2JtGIQMz8cwRam5AijuDuQL4w8V2gurnrpcCTk0P
	Zv9tHvORYrHHW+a147sKUgt6SKW4T6a/Pq8TYbdUZ6+U892K9UVGn73fS1hvj33cuQRQ
	WTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VhbEUqCMfqjvPHkD39M5UaLI+D2ivxQDoliVFe+OAjY=;
	b=OCvFVQpHVMZTf3HTBHJTo0gWgdA3eqDmN1KeyegTuM7nytdKXLHb1JPGsrLpgpQUbV
	Xodr2U5LT2U2ZiDrLK4FhaAlRBLCFC6Yrn66pmkFd8M3wbfowI5qy8bM2kkL3o/n+Mtm
	850oBfFWTt8PAXUkAQyyzPCksabIspBK0rvU3mSef3K5yjKxQdE7b8kbGb4xOQ91nupL
	tQUPbsK23btcV+GHSld23gZqKIl6XChs06sua+rJ2AB7rQdPHY80SON9+DLY9Fx3QoNr
	fIXIgnW6xf/GOv60Aq1IfD/IvbkJMt99b7tMEfqS2S4DIj0L+cxjzTV+SZ4SYA7QV3LH
	1J6A==
X-Gm-Message-State: AKaTC038txTwpOOHyPVOH0l2sFRNlYjJUyoNbEW+sLgYgmJiGKFrpWA4BSdpr3X6RySy1NTn
X-Received: by 10.28.69.217 with SMTP id l86mr6829686wmi.129.1479903886411;
	Wed, 23 Nov 2016 04:24:46 -0800 (PST)
Received: from orion.home (host31-54-69-88.range31-54.btcentralplus.com.
	[31.54.69.88]) by smtp.gmail.com with ESMTPSA id
	cl10sm36194076wjb.4.2016.11.23.04.24.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Nov 2016 04:24:45 -0800 (PST)
From: Michael Wood <michael.g.wood@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Nov 2016 12:24:36 +0000
Message-Id: <1479903876-7268-2-git-send-email-michael.g.wood@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479903876-7268-1-git-send-email-michael.g.wood@intel.com>
References: <1479903876-7268-1-git-send-email-michael.g.wood@intel.com>
Cc: toaster@yoctoproject.org
Subject: [PATCH 2/2] oe-selftest: toaster Remove redundant Toaster test
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
X-List-Received-Date: Wed, 23 Nov 2016 12:24:46 -0000

This test has been ported to be run as part of Toaster's own tests.

Signed-off-by: Michael Wood <michael.g.wood@intel.com>
---
 meta/lib/oeqa/selftest/_toaster.py | 320 -------------------------------------
 1 file changed, 320 deletions(-)
 delete mode 100644 meta/lib/oeqa/selftest/_toaster.py

diff --git a/meta/lib/oeqa/selftest/_toaster.py b/meta/lib/oeqa/selftest/_toaster.py
deleted file mode 100644
index 15ea9df..0000000
--- a/meta/lib/oeqa/selftest/_toaster.py
+++ /dev/null
@@ -1,320 +0,0 @@
-import unittest
-import os
-import sys
-import shlex, subprocess
-import urllib.request, urllib.parse, urllib.error, subprocess, time, getpass, re, json, shlex
-
-import oeqa.utils.ftools as ftools
-from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import runCmd
-
-sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../../../../', 'bitbake/lib/toaster')))
-os.environ.setdefault("DJANGO_SETTINGS_MODULE", "toastermain.settings")
-
-import toastermain.settings
-from django.db.models import Q
-from orm.models import *
-from oeqa.utils.decorators import testcase
-
-class ToasterSetup(oeSelfTest):
-
-    def recipe_parse(self, file_path, var):
-        for line in open(file_path,'r'):
-            if line.find(var) > -1:
-                val = line.split(" = ")[1].replace("\"", "").strip()
-                return val
-
-    def fix_file_path(self, file_path):
-        if ":" in file_path:
-            file_path=file_path.split(":")[2]
-        return file_path
-
-class Toaster_DB_Tests(ToasterSetup):
-
-    # Check if build name is unique - tc_id=795
-    @testcase(795)
-    def test_Build_Unique_Name(self):
-        all_builds = Build.objects.all().count()
-        distinct_builds = Build.objects.values('id').distinct().count()
-        self.assertEqual(distinct_builds, all_builds, msg = 'Build name is not unique')
-
-    # Check if build coocker log path is unique - tc_id=819
-    @testcase(819)
-    def test_Build_Unique_Cooker_Log_Path(self):
-        distinct_path = Build.objects.values('cooker_log_path').distinct().count()
-        total_builds = Build.objects.values('id').count()
-        self.assertEqual(distinct_path, total_builds, msg = 'Build coocker log path is not unique')
-
-    # Check if task order is unique for one build - tc=824
-    @testcase(824)
-    def test_Task_Unique_Order(self):
-        builds = Build.objects.values('id')
-        cnt_err = []
-        for build in builds:
-            total_task_order = Task.objects.filter(build = build['id']).values('order').count()
-            distinct_task_order = Task.objects.filter(build = build['id']).values('order').distinct().count()
-            if (total_task_order != distinct_task_order):
-                cnt_err.append(build['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for build id: %s' % cnt_err)
-
-    # Check task order sequence for one build - tc=825
-    @testcase(825)
-    def test_Task_Order_Sequence(self):
-        builds = builds = Build.objects.values('id')
-        cnt_err = []
-        for build in builds:
-            tasks = Task.objects.filter(Q(build = build['id']), ~Q(order = None), ~Q(task_name__contains = '_setscene')).values('id', 'order').order_by("order")
-            cnt_tasks = 0
-            for task in tasks:
-                cnt_tasks += 1
-                if (task['order'] != cnt_tasks):
-                    cnt_err.append(task['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for task id: %s' % cnt_err)
-
-    # Check if disk_io matches the difference between EndTimeIO and StartTimeIO in build stats - tc=828
-    ### this needs to be updated ###
-    #def test_Task_Disk_IO_TC828(self):
-
-    # Check if outcome = 2 (SSTATE) then sstate_result must be 3 (RESTORED) - tc=832
-    @testcase(832)
-    def test_Task_If_Outcome_2_Sstate_Result_Must_Be_3(self):
-        tasks = Task.objects.filter(outcome = 2).values('id', 'sstate_result')
-        cnt_err = []
-        for task in tasks:
-            if (row['sstate_result'] != 3):
-                cnt_err.append(task['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for task id: %s' % cnt_err)
-
-    # Check if outcome = 1 (COVERED) or 3 (EXISTING) then sstate_result must be 0 (SSTATE_NA) - tc=833
-    @testcase(833)
-    def test_Task_If_Outcome_1_3_Sstate_Result_Must_Be_0(self):
-        tasks = Task.objects.filter(outcome__in = (1, 3)).values('id', 'sstate_result')
-        cnt_err = []
-        for task in tasks:
-            if (task['sstate_result'] != 0):
-                cnt_err.append(task['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for task id: %s' % cnt_err)
-
-    # Check if outcome is 0 (SUCCESS) or 4 (FAILED) then sstate_result must be 0 (NA), 1 (MISS) or 2 (FAILED) - tc=834
-    @testcase(834)
-    def test_Task_If_Outcome_0_4_Sstate_Result_Must_Be_0_1_2(self):
-        tasks = Task.objects.filter(outcome__in = (0, 4)).values('id', 'sstate_result')
-        cnt_err = []
-        for task in tasks:
-            if (task['sstate_result'] not in [0, 1, 2]):
-                cnt_err.append(task['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for task id: %s' % cnt_err)
-
-    # Check if task_executed = TRUE (1), script_type must be 0 (CODING_NA), 2 (CODING_PYTHON), 3 (CODING_SHELL) - tc=891
-    @testcase(891)
-    def test_Task_If_Task_Executed_True_Script_Type_0_2_3(self):
-        tasks = Task.objects.filter(task_executed = 1).values('id', 'script_type')
-        cnt_err = []
-        for task in tasks:
-            if (task['script_type'] not in [0, 2, 3]):
-                cnt_err.append(task['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for task id: %s' % cnt_err)
-
-    # Check if task_executed = TRUE (1), outcome must be 0 (SUCCESS) or 4 (FAILED) - tc=836
-    @testcase(836)
-    def test_Task_If_Task_Executed_True_Outcome_0_4(self):
-        tasks = Task.objects.filter(task_executed = 1).values('id', 'outcome')
-        cnt_err = []
-        for task in tasks:
-            if (task['outcome'] not in [0, 4]):
-                cnt_err.append(task['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for task id: %s' % cnt_err)
-
-    # Check if task_executed = FALSE (0), script_type must be 0 - tc=890
-    @testcase(890)
-    def test_Task_If_Task_Executed_False_Script_Type_0(self):
-        tasks = Task.objects.filter(task_executed = 0).values('id', 'script_type')
-        cnt_err = []
-        for task in tasks:
-            if (task['script_type'] != 0):
-                cnt_err.append(task['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for task id: %s' % cnt_err)
-
-    # Check if task_executed = FALSE (0) and build outcome = SUCCEEDED (0), task outcome must be 1 (COVERED), 2 (CACHED), 3 (PREBUILT), 5 (EMPTY) - tc=837
-    @testcase(837)
-    def test_Task_If_Task_Executed_False_Outcome_1_2_3_5(self):
-        builds = Build.objects.filter(outcome = 0).values('id')
-        cnt_err = []
-        for build in builds:
-            tasks = Task.objects.filter(build = build['id'], task_executed = 0).values('id', 'outcome')
-            for task in tasks:
-                if (task['outcome'] not in [1, 2, 3, 5]):
-                    cnt_err.append(task['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for task id: %s' % cnt_err)
-
-    # Key verification - tc=888
-    @testcase(888)
-    def test_Target_Installed_Package(self):
-        rows = Target_Installed_Package.objects.values('id', 'target_id', 'package_id')
-        cnt_err = []
-        for row in rows:
-            target = Target.objects.filter(id = row['target_id']).values('id')
-            package = Package.objects.filter(id = row['package_id']).values('id')
-            if (not target or not package):
-                cnt_err.append(row['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for target installed package id: %s' % cnt_err)
-
-    # Key verification - tc=889
-    @testcase(889)
-    def test_Task_Dependency(self):
-        rows = Task_Dependency.objects.values('id', 'task_id', 'depends_on_id')
-        cnt_err = []
-        for row in rows:
-            task_id = Task.objects.filter(id = row['task_id']).values('id')
-            depends_on_id = Task.objects.filter(id = row['depends_on_id']).values('id')
-            if (not task_id or not depends_on_id):
-                cnt_err.append(row['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for task dependency id: %s' % cnt_err)
-
-    # Check if build target file_name is populated only if is_image=true AND orm_build.outcome=0 then if the file exists and its size matches the file_size value
-    ### Need to add the tc in the test run
-    @testcase(1037)
-    def test_Target_File_Name_Populated(self):
-        builds = Build.objects.filter(outcome = 0).values('id')
-        for build in builds:
-            targets = Target.objects.filter(build_id = build['id'], is_image = 1).values('id')
-            for target in targets:
-                target_files = Target_Image_File.objects.filter(target_id = target['id']).values('id', 'file_name', 'file_size')
-                cnt_err = []
-                for file_info in target_files:
-                    target_id = file_info['id']
-                    target_file_name = file_info['file_name']
-                    target_file_size = file_info['file_size']
-                    if (not target_file_name or not target_file_size):
-                        cnt_err.append(target_id)
-                    else:
-                        if (not os.path.exists(target_file_name)):
-                            cnt_err.append(target_id)
-                        else:
-                            if (os.path.getsize(target_file_name) != target_file_size):
-                                cnt_err.append(target_id)
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for target image file id: %s' % cnt_err)
-
-    # Key verification - tc=884
-    @testcase(884)
-    def test_Package_Dependency(self):
-        cnt_err = []
-        deps = Package_Dependency.objects.values('id', 'package_id', 'depends_on_id')
-        for dep in deps:
-            if (dep['package_id'] == dep['depends_on_id']):
-                cnt_err.append(dep['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for package dependency id: %s' % cnt_err)
-
-    # Recipe key verification, recipe name does not depends on a recipe having the same name - tc=883
-    @testcase(883)
-    def test_Recipe_Dependency(self):
-        deps = Recipe_Dependency.objects.values('id', 'recipe_id', 'depends_on_id')
-        cnt_err = []
-        for dep in deps:
-            if (not dep['recipe_id'] or not dep['depends_on_id']):
-                cnt_err.append(dep['id'])
-            else:
-                name = Recipe.objects.filter(id = dep['recipe_id']).values('name')
-                dep_name = Recipe.objects.filter(id = dep['depends_on_id']).values('name')
-                if (name == dep_name):
-                    cnt_err.append(dep['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for recipe dependency id: %s' % cnt_err)
-
-    # Check if package name does not start with a number (0-9) - tc=846
-    @testcase(846)
-    def test_Package_Name_For_Number(self):
-        packages = Package.objects.filter(~Q(size = -1)).values('id', 'name')
-        cnt_err = []
-        for package in packages:
-            if (package['name'][0].isdigit() is True):
-                cnt_err.append(package['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for package id: %s' % cnt_err)
-
-    # Check if package version starts with a number (0-9) - tc=847
-    @testcase(847)
-    def test_Package_Version_Starts_With_Number(self):
-        packages = Package.objects.filter(~Q(size = -1)).values('id', 'version')
-        cnt_err = []
-        for package in packages:
-            if (package['version'][0].isdigit() is False):
-                cnt_err.append(package['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for package id: %s' % cnt_err)
-
-    # Check if package revision starts with 'r' - tc=848
-    @testcase(848)
-    def test_Package_Revision_Starts_With_r(self):
-        packages = Package.objects.filter(~Q(size = -1)).values('id', 'revision')
-        cnt_err = []
-        for package in packages:
-            if (package['revision'][0].startswith("r") is False):
-                cnt_err.append(package['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for package id: %s' % cnt_err)
-
-    # Check the validity of the package build_id
-    ### TC must be added in test run
-    @testcase(1038)
-    def test_Package_Build_Id(self):
-        packages = Package.objects.filter(~Q(size = -1)).values('id', 'build_id')
-        cnt_err = []
-        for package in packages:
-            build_id = Build.objects.filter(id = package['build_id']).values('id')
-            if (not build_id):
-                cnt_err.append(package['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for package id: %s' % cnt_err)
-
-    # Check the validity of package recipe_id
-    ### TC must be added in test run
-    @testcase(1039)
-    def test_Package_Recipe_Id(self):
-        packages = Package.objects.filter(~Q(size = -1)).values('id', 'recipe_id')
-        cnt_err = []
-        for package in packages:
-            recipe_id = Recipe.objects.filter(id = package['recipe_id']).values('id')
-            if (not recipe_id):
-                cnt_err.append(package['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for package id: %s' % cnt_err)
-
-    # Check if package installed_size field is not null
-    ### TC must be aded in test run
-    @testcase(1040)
-    def test_Package_Installed_Size_Not_NULL(self):
-        packages = Package.objects.filter(installed_size__isnull = True).values('id')
-        cnt_err = []
-        for package in packages:
-            cnt_err.append(package['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for package id: %s' % cnt_err)
-
-    # Check if all layers requests return exit code is 200 - tc=843
-    @testcase(843)
-    def test_Layers_Requests_Exit_Code(self):
-        layers = Layer.objects.values('id', 'layer_index_url')
-        cnt_err = []
-        for layer in layers:
-            resp = urllib.request.urlopen(layer['layer_index_url'])
-            if (resp.getcode() != 200):
-                cnt_err.append(layer['id'])
-        self.assertEqual(len(cnt_err), 0, msg = 'Errors for layer id: %s' % cnt_err)
-
-    # Check if django server starts regardless of the timezone set on the machine - tc=905
-    @testcase(905)
-    def test_Start_Django_Timezone(self):
-        current_path = os.getcwd()
-        zonefilelist = []
-        ZONEINFOPATH = '/usr/share/zoneinfo/'
-        os.chdir("../bitbake/lib/toaster/")
-        cnt_err = 0
-        for filename in os.listdir(ZONEINFOPATH):
-            if os.path.isfile(os.path.join(ZONEINFOPATH, filename)):
-                zonefilelist.append(filename)
-        for k in range(len(zonefilelist)):
-            if k <= 5:
-                files = zonefilelist[k]
-                os.system("export TZ="+str(files)+"; python manage.py runserver > /dev/null 2>&1 &")
-                time.sleep(3)
-                pid = subprocess.check_output("ps aux | grep '[/u]sr/bin/python manage.py runserver' | awk '{print $2}'", shell = True)
-                if pid:
-                    os.system("kill -9 "+str(pid))
-                else:
-                    cnt_err.append(zonefilelist[k])
-        self.assertEqual(cnt_err, 0, msg = 'Errors django server does not start with timezone: %s' % cnt_err)
-        os.chdir(current_path)
-- 
2.7.4


