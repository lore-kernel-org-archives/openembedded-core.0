Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BE6FE78ED1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 08:50:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Aug 2018 01:50:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,218,1531810800"; d="scan'208";a="65070351"
Received: from kmsmsx156.gar.corp.intel.com ([172.21.138.133])
	by orsmga006.jf.intel.com with ESMTP; 10 Aug 2018 01:50:14 -0700
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.29]) by
	KMSMSX156.gar.corp.intel.com ([169.254.1.252]) with mapi id
	14.03.0319.002; Fri, 10 Aug 2018 16:50:11 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] test-result-log: testcase management tool to store
	test result
Thread-Index: AQHUMIWJxmD8diyk8kqjk8PTwDWGE6S4qhCQgAAC/zA=
Date: Fri, 10 Aug 2018 08:50:10 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D04335E98F6A@PGSMSX109.gar.corp.intel.com>
References: <1533889380-76000-1-git-send-email-ee.peng.yeoh@intel.com>
	<E0805CCB83E6104E80E61FD34E5788AE553CAF48@PGSMSX111.gar.corp.intel.com>
In-Reply-To: <E0805CCB83E6104E80E61FD34E5788AE553CAF48@PGSMSX111.gar.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiM2RiMDhjOTMtNzI3YS00NzgwLTkyZjUtNmMxZDg2NzcwYTQ4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidDFKY0dMN2hlejNicm10TzM1aHNPSE1oVnNtdzM0V1dCUTlLSlpvNHJua2c5cit6NFRXc2JaQXI4aEF5YmpPTCJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: Re: [PATCH] test-result-log: testcase management tool to store test result
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
X-List-Received-Date: Fri, 10 Aug 2018 08:50:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Same codes were available in github with better viewing and reviewing.=20
https://github.com/epyeoh/openembedded-core/tree/test-result-log/scripts/li=
b/testresultlog


-----Original Message-----
From: Yeoh, Ee Peng=20
Sent: Friday, August 10, 2018 4:42 PM
To: openembedded-core@lists.openembedded.org
Cc: Eggleton, Paul <paul.eggleton@intel.com>; Burton, Ross <ross.burton@int=
el.com>; Mittal, Anuj <anuj.mittal@intel.com>; Sangal, Apoorv <apoorv.sanga=
l@intel.com>; richard.purdie@linuxfoundation.org
Subject: RE: [PATCH] test-result-log: testcase management tool to store tes=
t result

Hi Richard, Ross, Paul, Anuj,

As per our conversation in the past, there was a need to provide alternativ=
e testcase management tool to Testopia in order to achieve our goals of:
1) To unblocked Bugzilla upgrade to a newer version in order to receive the=
 improvement in WebServices, performance, and GUI. =20
2) To improve overall QA testing efficiency where it reduce maintenance cos=
t when Testopia need to manually synchronize the test case content between =
Testopia and the available automated test cases inside OEQA, also it minimi=
ze test execution rerun where someone need to retrieve test failure log inf=
ormation from previous QA cycle (Testopia does not store test log due to it=
s limitation on Testopia API for automation).

To provide alternative testcase management tool to Testopia, here was the f=
irst batch of patch target to enable storing test result for OEQA automated=
 testcase execution and view test summary report. There are another patch p=
lanned to enable manual test execution and store/view test result. =20

With inputs from Paul and Anuj, I had refined this patches.
Please review this and give me your inputs.=20

Thank you very much for your attention and feedback!

Best regards,
Yeoh Ee Peng=20

-----Original Message-----
From: Yeoh, Ee Peng
Sent: Friday, August 10, 2018 4:23 PM
To: openembedded-core@lists.openembedded.org
Cc: Yeoh, Ee Peng <ee.peng.yeoh@intel.com>
Subject: [PATCH] test-result-log: testcase management tool to store test re=
sult

These scripts were developed as an alternative testcase management tool to =
Testopia. Using these scripts, user can store test result from OEQA automat=
ed testcase execution.

These scripts will store test result & log in GIT repository. To use these =
scripts, first source oe environment, then run the entry point script to lo=
ok for help information.
    $ test-result-log

To store test result for OEQA automated testcase, execute the below
    $ test-result-log store-auto <folder-to-store> <git-branch> /
      <oeqa-log-file-location> <type-of-oeqa-testcase-executed>

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/testresultlog/gitstore.py         | 250 ++++++++++++++++++++++=
++++
 scripts/lib/testresultlog/oeqalogparser.py    |  97 ++++++++++
 scripts/lib/testresultlog/oeqatestdiscover.py |  51 ++++++
 scripts/lib/testresultlog/storeauto.py        | 125 +++++++++++++
 scripts/test-result-log                       | 106 +++++++++++
 5 files changed, 629 insertions(+)
 create mode 100644 scripts/lib/testresultlog/gitstore.py
 create mode 100644 scripts/lib/testresultlog/oeqalogparser.py
 create mode 100644 scripts/lib/testresultlog/oeqatestdiscover.py
 create mode 100644 scripts/lib/testresultlog/storeauto.py
 create mode 100755 scripts/test-result-log

diff --git a/scripts/lib/testresultlog/gitstore.py b/scripts/lib/testresult=
log/gitstore.py
new file mode 100644
index 0000000..866d7d6
--- /dev/null
+++ b/scripts/lib/testresultlog/gitstore.py
@@ -0,0 +1,250 @@
+# test case management tool - store test result to git repository # #=20
+Copyright (c) 2018, Intel Corporation.
+#
+# This program is free software; you can redistribute it and/or modify=20
+it # under the terms and conditions of the GNU General Public License,=20
+# version 2, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but=20
+WITHOUT # ANY WARRANTY; without even the implied warranty of=20
+MERCHANTABILITY or # FITNESS FOR A PARTICULAR PURPOSE.  See the GNU=20
+General Public License for # more details.
+#
+import tempfile
+import os
+import pathlib
+import json
+import subprocess
+import shutil
+import scriptpath
+scriptpath.add_bitbake_lib_path()
+scriptpath.add_oe_lib_path()
+from oeqa.utils.git import GitRepo, GitError
+
+class GitStore(object):
+
+    def __init__(self):
+        self.script_path =3D os.path.dirname(os.path.realpath(__file__))
+        self.base_path =3D self.script_path + '/../../..'
+
+    def _get_project_environment_directory_path(self, project_dir, test_en=
vironment_list):
+        project_env_dir =3D project_dir
+        for env in test_environment_list:
+            project_env_dir =3D os.path.join(project_env_dir, env)
+        return project_env_dir
+
+    def _get_testmodule_list(self, testmodule_testsuite_dict):
+        return sorted(list(testmodule_testsuite_dict.keys()))
+
+    def _get_testcase_list(self, testsuite_list, testsuite_testcase_dict):
+        testcase_list =3D []
+        for testsuite in sorted(testsuite_list):
+            if testsuite in testsuite_testcase_dict:
+                for testcase in testsuite_testcase_dict[testsuite]:
+                    testcase_list.append(testcase)
+        return testcase_list
+
+    def _get_testcase_status(self, testcase, testcase_status_dict):
+        if testcase in testcase_status_dict:
+            return testcase_status_dict[testcase]
+        return ""
+
+    def _create_testcase_dict(self, testcase_list, testcase_status_dict):
+        testcase_dict =3D {}
+        for testcase in sorted(testcase_list):
+            testcase_status =3D self._get_testcase_status(testcase, testca=
se_status_dict)
+            testcase_dict[testcase] =3D {"testresult": testcase_status,"bu=
gs": ""}
+        return testcase_dict
+
+    def _create_testsuite_testcase_teststatus_json_object(self, testsuite_=
list, testsuite_testcase_dict, testcase_status_dict):
+        json_object =3D {'testsuite':{}}
+        testsuite_dict =3D json_object['testsuite']
+        for testsuite in sorted(testsuite_list):
+            testsuite_dict[testsuite] =3D {'testcase': {}}
+            testsuite_dict[testsuite]['testcase'] =3D self._create_testcas=
e_dict(testsuite_testcase_dict[testsuite], testcase_status_dict)
+        return json_object
+
+    def _create_testsuite_json_formatted_string(self, testsuite_list, test=
suite_testcase_dict, testcase_status_dict):
+        testsuite_testcase_list =3D self._create_testsuite_testcase_testst=
atus_json_object(testsuite_list, testsuite_testcase_dict, testcase_status_d=
ict)
+        return json.dumps(testsuite_testcase_list, sort_keys=3DTrue,
+ indent=3D4)
+
+    def _write_testsuite_testcase_json_formatted_string_to_file(self, file=
_path, file_content):
+        with open(file_path, 'w') as the_file:
+            the_file.write(file_content)
+
+    def _write_log_file(self, file_path, logs):
+        with open(file_path, 'w') as the_file:
+            for line in logs:
+                the_file.write(line + '\n')
+
+    def _write_test_log_files_for_list_of_testcase(self, file_dir, testcas=
e_list, testcase_logs_dict):
+        for testcase in testcase_list:
+            if testcase in testcase_logs_dict:
+                file_path =3D os.path.join(file_dir, '%s.log' % testcase)
+                self._write_log_file(file_path,
+ testcase_logs_dict[testcase])
+
+    def _copy_files_from_source_to_destination_dir(self, source_dir, desti=
nation_dir):
+        if os.path.exists(source_dir) and os.path.exists(destination_dir):
+            for item in os.listdir(source_dir):
+                s =3D os.path.join(source_dir, item)
+                d =3D os.path.join(destination_dir, item)
+                shutil.copy2(s, d)
+
+    def _load_test_module_file_with_json_into_dictionary(self, file, logge=
r):
+        if os.path.exists(file):
+            with open(file, "r") as f:
+                return json.load(f)
+        else:
+            logger.error('Cannot find file (%s)' % file)
+            return None
+
+    def _get_testcase_log_need_removal_list(self, testcase, cur_testcase_s=
tatus, next_testcase_status, testcase_log_remove_list):
+        if cur_testcase_status =3D=3D 'FAILED' or cur_testcase_status =3D=
=3D 'ERROR':
+            if next_testcase_status =3D=3D 'PASSED' or next_testcase_statu=
s =3D=3D 'SKIPPED':
+                testcase_log_remove_list.append(testcase)
+
+    def _update_target_testresult_dictionary_with_status(self, target_test=
result_dict, testsuite_list, testsuite_testcase_dict,
+                                                         testcase_status_d=
ict, testcase_log_remove_list):
+        for testsuite in testsuite_list:
+            testcase_list =3D testsuite_testcase_dict[testsuite]
+            for testcase in testcase_list:
+                if testcase in testcase_status_dict:
+                    cur_testcase_status =3D target_testresult_dict['testsu=
ite'][testsuite]['testcase'][testcase]['testresult']
+                    next_testcase_status =3D testcase_status_dict[testcase=
]
+                    self._get_testcase_log_need_removal_list(testcase,=20
+ cur_testcase_status, next_testcase_status, testcase_log_remove_list)
+                   =20
+ target_testresult_dict['testsuite'][testsuite]['testcase'][testcase]['
+ testresult'] =3D next_testcase_status
+
+    def _remove_test_log_files(self, file_dir, testcase_log_remove_list):
+        for testcase_log_remove in testcase_log_remove_list:
+            file_remove_path =3D os.path.join(file_dir, '%s.log' % testcas=
e_log_remove)
+            if os.path.exists(file_remove_path):
+                os.remove(file_remove_path)
+
+    def _check_if_dir_contain_project_and_environment_directory(self, dir,=
 project, environment_list):
+        project_env_dir =3D self._get_project_environment_directory(dir, p=
roject, environment_list)
+        if os.path.exists(project_env_dir):
+            return True
+        else:
+            return False
+
+    def _git_init(self, git_repo):
+        try:
+            repo =3D GitRepo(git_repo, is_topdir=3DTrue)
+        except GitError:
+            print("Non-empty directory that is not a Git repository "
+                   "at {}\nPlease specify an existing Git repository, "
+                   "an empty directory or a non-existing directory "
+                   "path.".format(git_repo))
+        return repo
+
+    def _run_git_cmd(self, repo, cmd):
+        try:
+            output =3D repo.run_cmd(cmd)
+            return True, output
+        except GitError:
+            return False, None
+
+    def _check_if_git_repo_and_git_branch_exist(self, git_repo, git_branch=
):
+        git_dir =3D '%s/.git' % git_repo
+        if not os.path.exists(git_dir):
+            return False
+        repo =3D self._git_init(git_repo)
+        status, output =3D self._git_checkout_git_repo(repo, git_branch)
+        return status
+
+    def _git_checkout_git_repo(self, repo, git_branch):
+        cmd =3D 'checkout %s' % git_branch
+        return self._run_git_cmd(repo, cmd)
+
+    def _create_temporary_workspace_dir(self):
+        return tempfile.mkdtemp(prefix=3D'testresultlog.')
+
+    def _remove_temporary_workspace_dir(self, workspace_dir):
+        return subprocess.run(["rm", "-rf",  workspace_dir])
+
+    def _get_project_environment_directory(self, top_dir, project, environ=
ment_list):
+        project_dir =3D os.path.join(top_dir, project)
+        project_env_dir =3D self._get_project_environment_directory_path(p=
roject_dir, environment_list)
+        return project_env_dir
+
+    def _create_project_environment_directory_structure(self, top_dir, pro=
ject, environment_list):
+        project_env_dir =3D self._get_project_environment_directory(top_di=
r, project, environment_list)
+        pathlib.Path(project_env_dir).mkdir(parents=3DTrue, exist_ok=3DTru=
e)
+        return project_env_dir
+
+    def _create_testmodule_and_test_log_files_to_directory(self, directory=
, testmodule_testsuite_dict, testsuite_testcase_dict,
+                                                           testcase_status=
_dict, testcase_logs_dict):
+        for testmodule in self._get_testmodule_list(testmodule_testsuite_d=
ict):
+            testsuite_list =3D testmodule_testsuite_dict[testmodule]
+            testsuite_json_structure =3D self._create_testsuite_json_forma=
tted_string(testsuite_list, testsuite_testcase_dict, testcase_status_dict)
+            file_name =3D '%s.json' % testmodule
+            file_path =3D os.path.join(directory, file_name)
+            self._write_testsuite_testcase_json_formatted_string_to_file(f=
ile_path, testsuite_json_structure)
+            testcase_list =3D self._get_testcase_list(testsuite_list, test=
suite_testcase_dict)
+            self._write_test_log_files_for_list_of_testcase(directory,
+ testcase_list, testcase_logs_dict)
+
+    def _push_testsuite_testcase_json_file_to_git_repo(self, file_dir, git=
_repo, git_branch):
+        return subprocess.run(["oe-git-archive", file_dir, "-g",=20
+ git_repo, "-b", git_branch])
+
+    def _create_automated_test_result_from_empty_git(self, git_repo, git_b=
ranch, project, environment_list, testmodule_testsuite_dict,
+                                                     testsuite_testcase_di=
ct, testcase_status_dict, testcase_logs_dict):
+        workspace_dir =3D self._create_temporary_workspace_dir()
+        project_env_dir =3D self._create_project_environment_directory_str=
ucture(workspace_dir, project, environment_list)
+        self._create_testmodule_and_test_log_files_to_directory(project_en=
v_dir, testmodule_testsuite_dict, testsuite_testcase_dict,
+                                                                testcase_s=
tatus_dict, testcase_logs_dict)
+        self._push_testsuite_testcase_json_file_to_git_repo(workspace_dir,=
 git_repo, git_branch)
+        self._remove_temporary_workspace_dir(workspace_dir)
+
+    def _create_automated_test_result_from_existing_git(self, git_repo, gi=
t_branch, project, environment_list, testmodule_testsuite_dict,
+                                                        testsuite_testcase=
_dict, testcase_status_dict, testcase_logs_dict):
+        project_env_dir =3D self._create_project_environment_directory_str=
ucture(git_repo, project, environment_list)
+        self._create_testmodule_and_test_log_files_to_directory(project_en=
v_dir, testmodule_testsuite_dict, testsuite_testcase_dict,
+                                                                testcase_s=
tatus_dict, testcase_logs_dict)
+        self._push_testsuite_testcase_json_file_to_git_repo(git_repo,
+ git_repo, git_branch)
+
+    def _load_testmodule_file_and_update_test_result(self, project_env_dir=
, testmodule_testsuite_dict, testsuite_testcase_dict,
+                                                     testcase_status_dict,=
 testcase_logs_dict, testcase_log_remove_list, logger):
+        for testmodule in self._get_testmodule_list(testmodule_testsuite_d=
ict):
+            testmodule_file =3D os.path.join(project_env_dir, '%s.json' % =
testmodule)
+            target_testresult_dict =3D self._load_test_module_file_with_js=
on_into_dictionary(testmodule_file, logger)
+            testsuite_list =3D testmodule_testsuite_dict[testmodule]
+            self._update_target_testresult_dictionary_with_status(target_t=
estresult_dict, testsuite_list, testsuite_testcase_dict,
+                                                                  testcase=
_status_dict, testcase_log_remove_list)
+            self._write_testsuite_testcase_json_formatted_string_to_file(t=
estmodule_file, json.dumps(target_testresult_dict, sort_keys=3DTrue, indent=
=3D4))
+            testcase_list =3D self._get_testcase_list(testsuite_list,=20
+ testsuite_testcase_dict)
+           =20
+ self._write_test_log_files_for_list_of_testcase(project_env_dir,
+ testcase_list, testcase_logs_dict)
+
+    def _update_automated_test_result(self, git_repo, git_branch, project,=
 environment_list, testmodule_testsuite_dict,
+                                      testsuite_testcase_dict, testcase_st=
atus_dict, testcase_logs_dict, logger):
+        repo =3D self._git_init(git_repo)
+        self._git_checkout_git_repo(repo, git_branch)
+        project_env_dir =3D self._get_project_environment_directory(git_re=
po, project, environment_list)
+        testcase_log_remove_list =3D []
+        self._load_testmodule_file_and_update_test_result(project_env_dir,=
 testmodule_testsuite_dict, testsuite_testcase_dict,
+                                                          testcase_status_=
dict, testcase_logs_dict, testcase_log_remove_list, logger)
+        self._remove_test_log_files(project_env_dir, testcase_log_remove_l=
ist)
+        self._push_testsuite_testcase_json_file_to_git_repo(git_repo,
+ git_repo, git_branch)
+
+    def smart_create_update_automated_test_result(self, git_repo, git_bran=
ch, project, environment_list, testmodule_testsuite_dict,
+                                                  testsuite_testcase_dict,=
 testcase_status_dict, testcase_logs_dict, logger):
+        logger.debug('Creating/Updating test result for environment list: =
%s' % environment_list)
+        if self._check_if_git_repo_and_git_branch_exist(git_repo, git_bran=
ch):
+            repo =3D self._git_init(git_repo)
+            self._git_checkout_git_repo(repo, git_branch)
+            logger.debug('Found existing git repository and git branch: %s=
 %s' % (git_repo, git_branch))
+            if self._check_if_dir_contain_project_and_environment_director=
y(git_repo, project, environment_list):
+                logger.debug('Found existing project and environment direc=
tory inside: %s' % git_repo)
+                logger.debug('Updating test result and log files')
+                self._update_automated_test_result(git_repo, git_branch, p=
roject, environment_list, testmodule_testsuite_dict,
+                                                   testsuite_testcase_dict=
, testcase_status_dict, testcase_logs_dict, logger)
+            else:
+                logger.debug('Could not find project and environment direc=
tory inside: %s' % git_repo)
+                logger.debug('Creating project & environment directory and=
 test result & log files inside: %s' % git_repo)
+                self._create_automated_test_result_from_existing_git(git_r=
epo, git_branch, project, environment_list, testmodule_testsuite_dict,
+                                                                     tests=
uite_testcase_dict, testcase_status_dict, testcase_logs_dict)
+        else:
+            logger.debug('Could not find git repository and git branch: %s=
 %s' % (git_repo, git_branch))
+            logger.debug('Creating git repository, git branch, project & e=
nvironment directory and test result & log files inside: %s' % git_repo)
+            self._create_automated_test_result_from_empty_git(git_repo,=20
+ git_branch, project, environment_list, testmodule_testsuite_dict,
+                                                             =20
+ testsuite_testcase_dict, testcase_status_dict, testcase_logs_dict)
diff --git a/scripts/lib/testresultlog/oeqalogparser.py b/scripts/lib/testr=
esultlog/oeqalogparser.py
new file mode 100644
index 0000000..0d7bdc6
--- /dev/null
+++ b/scripts/lib/testresultlog/oeqalogparser.py
@@ -0,0 +1,97 @@
+# test case management tool - parse test result for OEQA automated=20
+tests # # Copyright (c) 2018, Intel Corporation.
+#
+# This program is free software; you can redistribute it and/or modify=20
+it # under the terms and conditions of the GNU General Public License,=20
+# version 2, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but=20
+WITHOUT # ANY WARRANTY; without even the implied warranty of=20
+MERCHANTABILITY or # FITNESS FOR A PARTICULAR PURPOSE.  See the GNU=20
+General Public License for # more details.
+#
+import re
+
+class OeqaLogParser(object):
+
+    def get_test_status(self, log_file):
+        regex =3D ".*RESULTS - (?P<case_name>.*) - Testcase .*: (?P<status=
>PASSED|FAILED|SKIPPED|ERROR|UNKNOWN).*$"
+        regex_comp =3D re.compile(regex)
+        results =3D {}
+        with open(log_file, "r") as f:
+            for line in f:
+                line =3D line.strip()
+                m =3D regex_comp.search(line)
+                if m:
+                    results[m.group('case_name')] =3D m.group('status')
+        return results
+
+    def get_runtime_test_image_environment(self, log_file):
+        regex =3D "core-image.*().*Ran.*tests in .*s"
+        regex_comp =3D re.compile(regex)
+        image_env =3D ''
+        with open(log_file, "r") as f:
+            for line in f:
+                line =3D line.strip()
+                m =3D regex_comp.search(line)
+                if m:
+                    image_env =3D line[:line.find("(")-1]
+                    image_env =3D image_env.strip()
+                    break
+        return image_env
+
+    def get_runtime_test_qemu_environment(self, log_file):
+        regex =3D "DEBUG: launchcmd=3Drunqemu*"
+        regex_comp =3D re.compile(regex)
+        qemu_env =3D ''
+        with open(log_file, "r") as f:
+            for line in f:
+                line =3D line.strip()
+                m =3D regex_comp.search(line)
+                if m:
+                    qemu_list =3D ['qemuarm', 'qemuarm64', 'qemumips', 'qe=
mumips64', 'qemuppc', 'qemux86', 'qemux86-64']
+                    for qemu in qemu_list:
+                        if qemu in line:
+                            qemu_env =3D qemu
+                            break
+        return qemu_env
+
+    def _search_log_to_capture(self, logs, line, state, regex_comp_start, =
regex_comp_end_fail_or, regex_comp_end_error_or, regex_comp_end):
+        if state =3D=3D 'Searching':
+            m =3D regex_comp_start.search(line)
+            if m:
+                logs.append(line)
+                return 'Found'
+            else:
+                return 'Searching'
+        elif state =3D=3D 'Found':
+            m_fail =3D regex_comp_end_fail_or.search(line)
+            m_error =3D regex_comp_end_error_or.search(line)
+            m_end =3D regex_comp_end.search(line)
+            if m_fail or m_error or m_end:
+                return 'End'
+            else:
+                logs.append(line)
+                return 'Found'
+
+    def get_test_log(self, log_file, test_status, testcase_name, testsuite=
_name):
+        if test_status =3D=3D 'FAILED':
+            test_status =3D 'FAIL'
+        regex_search_start =3D ".*%s: %s \(%s\).*" % (test_status, testcas=
e_name, testsuite_name)
+        regex_search_end_fail_or =3D ".*FAIL: test.*"
+        regex_search_end_error_or =3D ".*ERROR: test.*"
+        regex_search_end =3D ".*Ran.*tests in .*s"
+        regex_comp_start =3D re.compile(regex_search_start)
+        regex_comp_end_fail_or =3D re.compile(regex_search_end_fail_or)
+        regex_comp_end_error_or =3D re.compile(regex_search_end_error_or)
+        regex_comp_end =3D re.compile(regex_search_end)
+        state =3D 'Searching'
+        logs =3D []
+        with open(log_file, "r") as f:
+            for line in f:
+                line =3D line.strip()
+                if state =3D=3D 'End':
+                    return logs
+                else:
+                    state =3D self._search_log_to_capture(logs, line,=20
+ state, regex_comp_start, regex_comp_end_fail_or,=20
+ regex_comp_end_error_or, regex_comp_end)
diff --git a/scripts/lib/testresultlog/oeqatestdiscover.py b/scripts/lib/te=
stresultlog/oeqatestdiscover.py
new file mode 100644
index 0000000..8800a4f
--- /dev/null
+++ b/scripts/lib/testresultlog/oeqatestdiscover.py
@@ -0,0 +1,51 @@
+# test case management tool - discover automated test case # #=20
+Copyright (c) 2018, Intel Corporation.
+#
+# This program is free software; you can redistribute it and/or modify=20
+it # under the terms and conditions of the GNU General Public License,=20
+# version 2, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but=20
+WITHOUT # ANY WARRANTY; without even the implied warranty of=20
+MERCHANTABILITY or # FITNESS FOR A PARTICULAR PURPOSE.  See the GNU=20
+General Public License for # more details.
+#
+import unittest
+
+class OeqaTestDiscover(object):
+
+    def _discover_unittest_testsuite_testcase(self, test_dir):
+        loader =3D unittest.TestLoader()
+        testsuite_testcase =3D loader.discover(start_dir=3Dtest_dir, patte=
rn=3D'*.py')
+        return testsuite_testcase
+
+    def _generate_flat_list_of_unittest_testcase(self, testsuite):
+        for test in testsuite:
+            if unittest.suite._isnotsuite(test):
+                yield test
+            else:
+                for subtest in self._generate_flat_list_of_unittest_testca=
se(test):
+                    yield subtest
+
+    def _get_testsuite_from_unittest_testcase(self, unittest_testcase):
+        testsuite =3D unittest_testcase[unittest_testcase.find("(")+1:unit=
test_testcase.find(")")]
+        return testsuite
+
+    def _get_testcase_from_unittest_testcase(self, unittest_testcase):
+        testcase =3D unittest_testcase[0:unittest_testcase.find("(")-1]
+        testsuite =3D self._get_testsuite_from_unittest_testcase(unittest_=
testcase)
+        testcase =3D '%s.%s' % (testsuite, testcase)
+        return testcase
+
+    def _get_testcase_list(self, unittest_testcase_list):
+        testcase_list =3D []
+        for unittest_testcase in unittest_testcase_list:
+            testcase_list.append(self._get_testcase_from_unittest_testcase=
(str(unittest_testcase)))
+        return testcase_list
+
+    def get_oeqa_testcase_list(self, testcase_dir):
+        unittest_testsuite_testcase =3D self._discover_unittest_testsuite_=
testcase(testcase_dir)
+        unittest_testcase_list =3D self._generate_flat_list_of_unittest_te=
stcase(unittest_testsuite_testcase)
+        testcase_list =3D self._get_testcase_list(unittest_testcase_list)
+        return testcase_list
diff --git a/scripts/lib/testresultlog/storeauto.py b/scripts/lib/testresul=
tlog/storeauto.py
new file mode 100644
index 0000000..5c05915
--- /dev/null
+++ b/scripts/lib/testresultlog/storeauto.py
@@ -0,0 +1,125 @@
+# test case management tool - store automated test result # # Copyright
+(c) 2018, Intel Corporation.
+#
+# This program is free software; you can redistribute it and/or modify=20
+it # under the terms and conditions of the GNU General Public License,=20
+# version 2, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but=20
+WITHOUT # ANY WARRANTY; without even the implied warranty of=20
+MERCHANTABILITY or # FITNESS FOR A PARTICULAR PURPOSE.  See the GNU=20
+General Public License for # more details.
+#
+from testresultlog.gitstore import GitStore from=20
+testresultlog.oeqatestdiscover import OeqaTestDiscover from=20
+testresultlog.oeqalogparser import OeqaLogParser
+
+class StoreAuto(object):
+
+    def _get_testsuite_from_testcase(self, testcase):
+        testsuite =3D testcase[0:testcase.rfind(".")]
+        return testsuite
+
+    def _get_testmodule_from_testsuite(self, testsuite):
+        testmodule =3D testsuite[0:testsuite.find(".")]
+        return testmodule
+
+    def _remove_testsuite_from_testcase(self, testcase, testsuite):
+        testsuite =3D testsuite + '.'
+        testcase_remove_testsuite =3D testcase.replace(testsuite, '')
+        return testcase_remove_testsuite
+
+    def _add_new_environment_to_environment_list(self, environment_list, n=
ew_environment):
+        if len(new_environment) > 0 and new_environment not in environment=
_list:
+            if len(environment_list) =3D=3D 0:
+                environment_list =3D new_environment
+            else:
+                environment_list =3D '%s,%s' % (environment_list, new_envi=
ronment)
+        return environment_list
+
+    def get_environment_list_for_test_log(self, log_file, log_file_source,=
 environment_list, oeqa_logparser):
+        if log_file_source =3D=3D 'runtime':
+            runtime_image_env =3D oeqa_logparser.get_runtime_test_image_en=
vironment(log_file)
+            runtime_qemu_env =3D oeqa_logparser.get_runtime_test_qemu_envi=
ronment(log_file)
+            environment_list =3D self._add_new_environment_to_environment_=
list(environment_list, runtime_image_env)
+            environment_list =3D self._add_new_environment_to_environment_=
list(environment_list, runtime_qemu_env)
+        return environment_list.split(",")
+
+    def get_testsuite_testcase_dictionary(self, testcase_dir):
+        oeqatestdiscover =3D OeqaTestDiscover()
+        testcase_list =3D oeqatestdiscover.get_oeqa_testcase_list(testcase=
_dir)
+        testsuite_testcase_dict =3D {}
+        for testcase in testcase_list:
+            testsuite =3D self._get_testsuite_from_testcase(testcase)
+            if testsuite in testsuite_testcase_dict:
+                testsuite_testcase_dict[testsuite].append(testcase)
+            else:
+                testsuite_testcase_dict[testsuite] =3D [testcase]
+        return testsuite_testcase_dict
+
+    def get_testmodule_testsuite_dictionary(self, testsuite_testcase_dict)=
:
+        testsuite_list =3D testsuite_testcase_dict.keys()
+        testmodule_testsuite_dict =3D {}
+        for testsuite in testsuite_list:
+            testmodule =3D self._get_testmodule_from_testsuite(testsuite)
+            if testmodule in testmodule_testsuite_dict:
+                testmodule_testsuite_dict[testmodule].append(testsuite)
+            else:
+                testmodule_testsuite_dict[testmodule] =3D [testsuite]
+        return testmodule_testsuite_dict
+
+    def get_testcase_failed_or_error_logs_dictionary(self, log_file, testc=
ase_status_dict):
+        oeqalogparser =3D OeqaLogParser()
+        testcase_list =3D testcase_status_dict.keys()
+        testcase_failed_or_error_logs_dict =3D {}
+        for testcase in testcase_list:
+            test_status =3D testcase_status_dict[testcase]
+            if test_status =3D=3D 'FAILED' or test_status =3D=3D 'ERROR':
+                testsuite =3D self._get_testsuite_from_testcase(testcase)
+                testfunction =3D self._remove_testsuite_from_testcase(test=
case, testsuite)
+                logs =3D oeqalogparser.get_test_log(log_file, test_status,=
 testfunction, testsuite)
+                testcase_failed_or_error_logs_dict[testcase] =3D logs
+        return testcase_failed_or_error_logs_dict
+
+def main(args, logger):
+    logger.info('Gathering test result and log data')
+    oeqa_logparser =3D OeqaLogParser()
+    testcase_status_dict =3D oeqa_logparser.get_test_status(args.log_file)
+    logger.debug('Received testcase status dictionary %s' %
+testcase_status_dict)
+
+    store_auto =3D StoreAuto()
+    logger.debug('Getting test environment and breaking down test result &=
 log data')
+    environment_list =3D store_auto.get_environment_list_for_test_log(args=
.log_file, args.source, args.environment_list, oeqa_logparser)
+    logger.debug('Received environment list %s' % environment_list)
+    testsuite_testcase_dict =3D store_auto.get_testsuite_testcase_dictiona=
ry(args.case_dir)
+    logger.debug('Received testsuite testcase dictionary %s' % testsuite_t=
estcase_dict)
+    testmodule_testsuite_dict =3D store_auto.get_testmodule_testsuite_dict=
ionary(testsuite_testcase_dict)
+    logger.debug('Received testmodule testsuite dictionary %s' % testmodul=
e_testsuite_dict)
+    test_logs_dict =3D store_auto.get_testcase_failed_or_error_logs_dictio=
nary(args.log_file, testcase_status_dict)
+    logger.debug('Received test logs dictionary %s' % test_logs_dict)
+
+    gitstore =3D GitStore()
+    logger.info('Storing test result and log data')
+    gitstore.smart_create_update_automated_test_result(args.git_repo, args=
.git_branch, args.component, environment_list, testmodule_testsuite_dict,
+                                                       testsuite_testcase_=
dict, testcase_status_dict, test_logs_dict, logger)
+    return 0
+
+def register_commands(subparsers):
+    """Register subcommands from this plugin"""
+    parser_build =3D subparsers.add_parser('store-auto', help=3D'Store OEQ=
A automated test status & log into git repository',
+                                         description=3D'Store OEQA automat=
ed test status & log into git repository',
+                                         group=3D'store')
+    parser_build.set_defaults(func=3Dmain)
+    parser_build.add_argument('component', help=3D'Component folder (as th=
e top folder) to store the test status & log')
+    parser_build.add_argument('git_branch', help=3D'Git branch to store th=
e test status & log')
+    parser_build.add_argument('log_file', help=3D'Full path to the OEQA au=
tomated test log file to be used for test result storing')
+    SOURCE =3D ('runtime', 'selftest', 'sdk', 'sdkext')
+    parser_build.add_argument('source', choices=3DSOURCE,
+    help=3D'Selected testcase sources to be used for OEQA testcase discove=
ry and testcases discovered will be used as the base testcases for storing =
test status & log. '
+         '"runtime" will search testcase available in meta/lib/oeqa/runtim=
e/cases. '
+         '"selftest" will search testcase available in meta/lib/oeqa/selft=
est/cases. '
+         '"sdk" will search testcase available in meta/lib/oeqa/sdk/cases.=
 '
+         '"sdkext" will search testcase available in meta/lib/oeqa/sdkext/=
cases. ')
+    parser_build.add_argument('-g', '--git_repo', default=3D'default', hel=
p=3D'(Optional) Full path to the git repository used for storage, default w=
ill be <top_dir>/test-result-log.git')
+    parser_build.add_argument('-e', '--environment_list',=20
+default=3D'default', help=3D'(Optional) List of environment seperated by=20
+comma (",") used to label the test environments for the stored test=20
+status & log')
diff --git a/scripts/test-result-log b/scripts/test-result-log new file mod=
e 100755 index 0000000..5a27341
--- /dev/null
+++ b/scripts/test-result-log
@@ -0,0 +1,106 @@
+#!/usr/bin/env python3
+#
+# test case management tool - store test result and log # # As part of=20
+the initiative to provide LITE version Test Case Management System #=20
+with command-line and plain-text files (eg. manual test case file, test=20
+plan # file to specify list of test case to be executed, test result=20
+and log file) # to replace Testopia.
+# Test-result-log script was designed as part of the helper script for bel=
ow purpose:
+# 1. To store test result & log file inside git repository # 2.=20
+(Future) To view text-based test summary report # 3. (Future) To enable=20
+planning of test cases for execution and track its completion # # To=20
+look for help information.
+#    $ test-result-log
+#
+# To store test result for OEQA automated testcase, execute the below
+#    $ test-result-log store-auto <folder-to-store> <git-branch> /
+#      <oeqa-log-file-location> <type-of-oeqa-testcase-executed>
+#
+# Copyright (c) 2018, Intel Corporation.
+#
+# This program is free software; you can redistribute it and/or modify=20
+it # under the terms and conditions of the GNU General Public License,=20
+# version 2, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but=20
+WITHOUT # ANY WARRANTY; without even the implied warranty of=20
+MERCHANTABILITY or # FITNESS FOR A PARTICULAR PURPOSE.  See the GNU=20
+General Public License for # more details.
+#
+
+import os
+import sys
+import argparse
+import logging
+script_path =3D os.path.dirname(os.path.realpath(__file__))
+lib_path =3D script_path + '/lib'
+sys.path =3D sys.path + [lib_path]
+import argparse_oe
+import scriptutils
+import testresultlog.storeauto
+logger =3D scriptutils.logger_create('test-result-log')
+
+def _get_git_dir(git_dir):
+    base_path =3D script_path + '/..'
+    if git_dir =3D=3D 'default':
+        git_dir =3D os.path.join(base_path, 'test-result-log.git')
+    logger.debug('Set git_dir argument: %s' % git_dir)
+    return git_dir
+
+def _get_oeqa_case_dir(oe_dir, source):
+    if source =3D=3D 'runtime':
+        case_dir =3D os.path.join(oe_dir, 'meta/lib/oeqa/runtime/cases')
+    elif source =3D=3D 'selftest':
+        case_dir =3D os.path.join(oe_dir, 'meta/lib/oeqa/selftest/cases')
+    elif source =3D=3D 'sdk':
+        case_dir =3D os.path.join(oe_dir, 'meta/lib/oeqa/sdk/cases')
+    else:
+        case_dir =3D os.path.join(oe_dir, 'meta/lib/oeqa/sdkext/cases')
+    logger.debug('Set case_dir argument: %s' % case_dir)
+    return case_dir
+
+def _get_default_attribute_value(attribute_value):
+    if attribute_value =3D=3D 'default':
+        attribute_value =3D ''
+    return attribute_value
+
+def _set_args_attribute_default_value(args):
+    if getattr(args, "environment_list", False):
+        logger.debug('Setting environment_list argument to default')
+        args.environment_list =3D
+_get_default_attribute_value(args.environment_list)
+
+def main():
+    parser =3D argparse_oe.ArgumentParser(description=3D"OpenEmbedded test=
case management tool, to store test result then to view test summary report=
.",
+                                        add_help=3DFalse,
+                                        epilog=3D"Use %(prog)s <subcommand=
> --help to get help on a specific command")
+    parser.add_argument('-h', '--help', action=3D'help', default=3Dargpars=
e.SUPPRESS,
+                        help=3D'show this help message and exit')
+    parser.add_argument('-d', '--debug', help=3D'Enable debug output', act=
ion=3D'store_true')
+    parser.add_argument('-q', '--quiet', help=3D'Print only errors', actio=
n=3D'store_true')
+    subparsers =3D parser.add_subparsers(dest=3D"subparser_name", title=3D=
'subcommands', metavar=3D'<subcommand>')
+    subparsers.required =3D True
+    subparsers.add_subparser_group('store', 'Store test result', 100)
+    testresultlog.storeauto.register_commands(subparsers)
+    args =3D parser.parse_args()
+    if args.debug:
+        logger.setLevel(logging.DEBUG)
+    elif args.quiet:
+        logger.setLevel(logging.ERROR)
+
+    if getattr(args, "git_repo", False):
+        args.git_repo =3D _get_git_dir(args.git_repo)
+    if getattr(args, "source", False):
+        oe_dir =3D script_path + '/..'
+        args.case_dir =3D _get_oeqa_case_dir(oe_dir, args.source)
+    _set_args_attribute_default_value(args)
+
+    try:
+        ret =3D args.func(args, logger)
+    except argparse_oe.ArgumentUsageError as ae:
+        parser.error_subcommand(ae.message, ae.subcommand)
+    return ret
+
+if __name__ =3D=3D "__main__":
+    sys.exit(main())
--
2.7.4


