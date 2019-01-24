Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DCDD360557
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 05:50:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2019 21:50:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,514,1539673200"; d="scan'208";a="313015185"
Received: from pgsmsx113.gar.corp.intel.com ([10.108.55.202])
	by fmsmga006.fm.intel.com with ESMTP; 23 Jan 2019 21:50:27 -0800
Received: from pgsmsx110.gar.corp.intel.com (10.221.44.111) by
	pgsmsx113.gar.corp.intel.com (10.108.55.202) with Microsoft SMTP Server
	(TLS) id 14.3.408.0; Thu, 24 Jan 2019 13:50:26 +0800
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.250]) by
	PGSMSX110.gar.corp.intel.com ([169.254.13.7]) with mapi id
	14.03.0415.000; Thu, 24 Jan 2019 13:50:26 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, 'Richard Purdie'
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [PATCH 1/2 v5] resultstool: enable merge, store, report and
	regression analysis
Thread-Index: AQHUsjsn4S+2LfwRzkidomM9HkG1DKW96enA
Date: Thu, 24 Jan 2019 05:50:25 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D0434816FCE5@PGSMSX109.gar.corp.intel.com>
References: <1548150131-65036-1-git-send-email-ee.peng.yeoh@intel.com>
	<1548150131-65036-2-git-send-email-ee.peng.yeoh@intel.com>
In-Reply-To: <1548150131-65036-2-git-send-email-ee.peng.yeoh@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjQxYjA3N2YtY2M5Mi00ODQzLTgzM2ItZmQ5YTE4MDA5MjZiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiS1o1Z0JJcEQ1UW10d1ZTOGVxeFMxNmNsVkh5REI0eE50b21EaHR0NVlUR1BDSlwvRTdYTmpvSXArOTZDempqczYifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2 v5] resultstool: enable merge, store, report and regression analysis
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
X-List-Received-Date: Thu, 24 Jan 2019 05:50:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

RP,

The current patch allow files based regression, meaning if you have file#1 =
and file#2, the regression will select result instances for regression base=
d on the configuration data available.=20

There are 2 more regression use cases that I have in mind:
Use case#1: directory based regression - Assumed that there are 2 directori=
es storing list of result files. User shall provide these 2 directories for=
 regression, regression scripts will first parse through all the available =
files inside each directories, then perform regression based on available c=
onfiguration data to determine the regression pair (eg. select result_set_1=
 from directory#1 and result_set_x from directory#2 if they both have match=
ing configurations).=20

Use case#2: git branch based regression - Assumed that result files are sto=
red inside git repository with specific git branch storing result files for=
 single commit. User shall provide the 2 specific git branches for regressi=
on, regression scripts will first parse through all the available files ins=
ide each git branch, then perform regression based on available configurati=
on data to determine the regression pair (eg. select result_set_1 from git_=
branch_1 and result_set_x from git_branch_2 if they both have matching conf=
igurations).

Any idea which regression use cases above was needed? We shall develop the =
next regression functionalities based on your inputs.=20

Best regards,
Yeoh Ee Peng=20

-----Original Message-----
From: Yeoh, Ee Peng=20
Sent: Tuesday, January 22, 2019 5:42 PM
To: openembedded-core@lists.openembedded.org
Cc: Yeoh, Ee Peng <ee.peng.yeoh@intel.com>
Subject: [PATCH 1/2 v5] resultstool: enable merge, store, report and regres=
sion analysis

OEQA outputs test results into json files and these files were archived by =
Autobuilder during QA releases. Example: each oe-selftest run by Autobuilde=
r for different host distro generate a testresults.json file.

These scripts were developed as a test result tools to manage these testres=
ults.json file.

Using the "store" operation, user can store multiple testresults.json files=
 as well as the pre-configured directories used to hold those files.

Using the "merge" operation, user can merge multiple testresults.json files=
 to a target file.

Using the "report" operation, user can view the test result summary for all=
 available testresults.json files inside a ordinary directory or a git repo=
sitory.

Using the "regression" operation, user can perform regression analysis on t=
estresults.json files specified.

These resultstool operations expect the testresults.json file to use the js=
on format below.
{
    "<testresult_1>": {
        "configuration": {
            "<config_name_1>": "<config_value_1>",
            "<config_name_2>": "<config_value_2>",
            ...
            "<config_name_n>": "<config_value_n>",
        },
        "result": {
            "<testcase_namespace_1>": {
                "status": "<PASSED or FAILED or ERROR or SKIPPED>",
                "log": "<failure or error logging>"
            },
            "<testcase_namespace_2>": {
                "status": "<PASSED or FAILED or ERROR or SKIPPED>",
                "log": "<failure or error logging>"
            },
            ...
            "<testcase_namespace_n>": {
                "status": "<PASSED or FAILED or ERROR or SKIPPED>",
                "log": "<failure or error logging>"
            },
        }
    },
    ...
    "<testresult_n>": {
        "configuration": {
            "<config_name_1>": "<config_value_1>",
            "<config_name_2>": "<config_value_2>",
            ...
            "<config_name_n>": "<config_value_n>",
        },
        "result": {
            "<testcase_namespace_1>": {
                "status": "<PASSED or FAILED or ERROR or SKIPPED>",
                "log": "<failure or error logging>"
            },
            "<testcase_namespace_2>": {
                "status": "<PASSED or FAILED or ERROR or SKIPPED>",
                "log": "<failure or error logging>"
            },
            ...
            "<testcase_namespace_n>": {
                "status": "<PASSED or FAILED or ERROR or SKIPPED>",
                "log": "<failure or error logging>"
            },
        }
    },
}

To use these scripts, first source oe environment, then run the entry point=
 script to look for help.
    $ resultstool

To store test result from oeqa automated tests, execute the below
    $ resultstool store <source_dir> <git_branch>

To merge multiple testresults.json files, execute the below
    $ resultstool merge <base_result_file> <target_result_file>

To report test report, execute the below
    $ resultstool report <source_dir>

To perform regression analysis, execute the below
    $ resultstool regression <base_result_file> <target_result_file>

[YOCTO# 13012]
[YOCTO# 12654]

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/files/testresults/testresults.json   |  40 ++++++
 meta/lib/oeqa/selftest/cases/resultstooltests.py   | 104 ++++++++++++++++
 scripts/lib/resultstool/__init__.py                |   0
 scripts/lib/resultstool/merge.py                   |  71 +++++++++++
 scripts/lib/resultstool/regression.py              | 134 +++++++++++++++++=
++++
 scripts/lib/resultstool/report.py                  | 122 +++++++++++++++++=
++
 scripts/lib/resultstool/resultsutils.py            |  47 ++++++++
 scripts/lib/resultstool/store.py                   | 110 +++++++++++++++++
 .../resultstool/template/test_report_full_text.txt |  35 ++++++
 scripts/resultstool                                |  84 +++++++++++++
 10 files changed, 747 insertions(+)
 create mode 100644 meta/lib/oeqa/files/testresults/testresults.json
 create mode 100644 meta/lib/oeqa/selftest/cases/resultstooltests.py
 create mode 100644 scripts/lib/resultstool/__init__.py
 create mode 100644 scripts/lib/resultstool/merge.py  create mode 100644 sc=
ripts/lib/resultstool/regression.py
 create mode 100644 scripts/lib/resultstool/report.py  create mode 100644 s=
cripts/lib/resultstool/resultsutils.py
 create mode 100644 scripts/lib/resultstool/store.py  create mode 100644 sc=
ripts/lib/resultstool/template/test_report_full_text.txt
 create mode 100755 scripts/resultstool

diff --git a/meta/lib/oeqa/files/testresults/testresults.json b/meta/lib/oe=
qa/files/testresults/testresults.json
new file mode 100644
index 0000000..1a62155
--- /dev/null
+++ b/meta/lib/oeqa/files/testresults/testresults.json
@@ -0,0 +1,40 @@
+{
+    "runtime_core-image-minimal_qemuarm_20181225195701": {
+        "configuration": {
+            "DISTRO": "poky",
+            "HOST_DISTRO": "ubuntu-16.04",
+            "IMAGE_BASENAME": "core-image-minimal",
+            "IMAGE_PKGTYPE": "rpm",
+            "LAYERS": {
+                "meta": {
+                    "branch": "master",
+                    "commit": "801745d918e83f976c706f29669779f5b292ade3",
+                    "commit_count": 52782
+                },
+                "meta-poky": {
+                    "branch": "master",
+                    "commit": "801745d918e83f976c706f29669779f5b292ade3",
+                    "commit_count": 52782
+                },
+                "meta-yocto-bsp": {
+                    "branch": "master",
+                    "commit": "801745d918e83f976c706f29669779f5b292ade3",
+                    "commit_count": 52782
+                }
+            },
+            "MACHINE": "qemuarm",
+            "STARTTIME": "20181225195701",
+            "TEST_TYPE": "runtime"
+        },
+        "result": {
+            "apt.AptRepoTest.test_apt_install_from_repo": {
+                "log": "Test requires apt to be installed",
+                "status": "PASSED"
+            },
+            "buildcpio.BuildCpioTest.test_cpio": {
+                "log": "Test requires autoconf to be installed",
+                "status": "ERROR"
+            }           =20
+        }
+    }
+}
\ No newline at end of file
diff --git a/meta/lib/oeqa/selftest/cases/resultstooltests.py b/meta/lib/oe=
qa/selftest/cases/resultstooltests.py
new file mode 100644
index 0000000..28bfa94
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/resultstooltests.py
@@ -0,0 +1,104 @@
+import os
+import sys
+basepath =3D os.path.abspath(os.path.dirname(__file__) +=20
+'/../../../../../') lib_path =3D basepath + '/scripts/lib'
+sys.path =3D sys.path + [lib_path]
+from resultstool.report import ResultsTextReport from=20
+resultstool.regression import ResultsRegressionSelector,=20
+ResultsRegression from resultstool.merge import ResultsMerge from=20
+resultstool.store import ResultsGitStore from resultstool.resultsutils=20
+import checkout_git_dir from oeqa.selftest.case import=20
+OESelftestTestCase
+
+class ResultsToolTests(OESelftestTestCase):
+
+    def test_report_can_aggregate_test_result(self):
+        result_data =3D {'result': {'test1': {'status':'PASSED'},
+                                  'test2': {'status': 'PASSED'},
+                                  'test3': {'status': 'FAILED'},
+                                  'test4': {'status': 'ERROR'},
+                                  'test5': {'status': 'SKIPPED'}}}
+        report =3D ResultsTextReport()
+        result_report =3D report.get_aggregated_test_result(None, result_d=
ata)
+        self.assertTrue(result_report['passed'] =3D=3D 2, msg=3D"Passed co=
unt not correct:%s" % result_report['passed'])
+        self.assertTrue(result_report['failed'] =3D=3D 2, msg=3D"Failed co=
unt not correct:%s" % result_report['failed'])
+        self.assertTrue(result_report['skipped'] =3D=3D 1, msg=3D"Skipped=
=20
+ count not correct:%s" % result_report['skipped'])
+
+    def test_regression_can_get_regression_base_target_pair(self):
+        base_results_data =3D {'base_result1': {'configuration': {"TEST_TY=
PE": "oeselftest",
+                                                                "HOST": "c=
entos-7"}},
+                             'base_result2': {'configuration': {"TEST_TYPE=
": "oeselftest",
+                                                                "HOST": "c=
entos-7",
+                                                                "MACHINE":=
 "qemux86-64"}}}
+        target_results_data =3D {'target_result1': {'configuration': {"TES=
T_TYPE": "oeselftest",
+                                                                    "HOST"=
: "centos-7"}},
+                               'target_result2': {'configuration': {"TEST_=
TYPE": "oeselftest",
+                                                                    "HOST"=
: "centos-7",
+                                                                    "MACHI=
NE": "qemux86"}},
+                               'target_result3': {'configuration': {"TEST_=
TYPE": "oeselftest",
+                                                                    "HOST"=
: "centos-7",
+                                                                    "MACHI=
NE": "qemux86-64"}}}
+        regression =3D ResultsRegressionSelector()
+        pair =3D regression.get_regression_base_target_pair(self.logger, b=
ase_results_data, target_results_data)
+        self.assertTrue(pair['base_result1'] =3D=3D 'target_result1', msg=
=3D"Pair not correct:%s" % pair['base_result1'])
+        self.assertTrue(pair['base_result2'] =3D=3D 'target_result3',=20
+ msg=3D"Pair not correct:%s" % pair['base_result2'])
+
+    def test_regrresion_can_get_regression_result(self):
+        base_result_data =3D {'result': {'test1': {'status': 'PASSED'},
+                                       'test2': {'status': 'PASSED'},
+                                       'test3': {'status': 'FAILED'},
+                                       'test4': {'status': 'ERROR'},
+                                       'test5': {'status': 'SKIPPED'}}}
+        target_result_data =3D {'result': {'test1': {'status': 'PASSED'},
+                                         'test2': {'status': 'FAILED'},
+                                         'test3': {'status': 'PASSED'},
+                                         'test4': {'status': 'ERROR'},
+                                         'test5': {'status': 'SKIPPED'}}}
+        regression =3D ResultsRegression()
+        result =3D regression.get_regression_result(self.logger, base_resu=
lt_data, target_result_data)
+        self.assertTrue(result['test2']['base'] =3D=3D 'PASSED',
+                        msg=3D"regression not correct:%s" % result['test2'=
]['base'])
+        self.assertTrue(result['test2']['target'] =3D=3D 'FAILED',
+                        msg=3D"regression not correct:%s" % result['test2'=
]['target'])
+        self.assertTrue(result['test3']['base'] =3D=3D 'FAILED',
+                        msg=3D"regression not correct:%s" % result['test3'=
]['base'])
+        self.assertTrue(result['test3']['target'] =3D=3D 'PASSED',
+                        msg=3D"regression not correct:%s" %=20
+ result['test3']['target'])
+
+    def test_merge_can_merged_results(self):
+        base_results_data =3D {'base_result1': {},
+                             'base_result2': {}}
+        target_results_data =3D {'target_result1': {},
+                               'target_result2': {},
+                               'target_result3': {}}
+
+        merge =3D ResultsMerge()
+        results =3D merge.merge_results(base_results_data, target_results_=
data)
+        self.assertTrue(len(results.keys()) =3D=3D 5, msg=3D"merge not=20
+ correct:%s" % len(results.keys()))
+
+    def test_store_can_store_to_new_git_repository(self):
+        basepath =3D os.path.abspath(os.path.dirname(__file__) + '/../../'=
)
+        source_dir =3D basepath + '/files/testresults'
+        git_branch =3D 'qa-cycle-2.7'
+        store =3D ResultsGitStore()
+        output_dir =3D store.store_to_new(self.logger, source_dir, git_bra=
nch)
+        self.assertTrue(checkout_git_dir(output_dir, git_branch), msg=3D"s=
tore to new git repository failed:%s" %
+                                                                      outp=
ut_dir)
+        store._remove_temporary_workspace_dir(output_dir)
+
+    def test_store_can_store_to_existing(self):
+        basepath =3D os.path.abspath(os.path.dirname(__file__) + '/../../'=
)
+        source_dir =3D basepath + '/files/testresults'
+        git_branch =3D 'qa-cycle-2.6'
+        store =3D ResultsGitStore()
+        output_dir =3D store.store_to_new(self.logger, source_dir, git_bra=
nch)
+        self.assertTrue(checkout_git_dir(output_dir, git_branch), msg=3D"s=
tore to new git repository failed:%s" %
+                                                                      outp=
ut_dir)
+        git_branch =3D 'qa-cycle-2.7'
+        output_dir =3D store.store_to_existing_with_new_branch(self.logger=
, source_dir, output_dir, git_branch)
+        self.assertTrue(checkout_git_dir(output_dir, git_branch), msg=3D"s=
tore to existing git repository failed:%s" %
+                                                                      outp=
ut_dir)
+        output_dir =3D store.store_to_existing(self.logger, source_dir, ou=
tput_dir, git_branch)
+        self.assertTrue(checkout_git_dir(output_dir, git_branch), msg=3D"s=
tore to existing git repository failed:%s" %
+                                                                      outp=
ut_dir)
+        store._remove_temporary_workspace_dir(output_dir)
diff --git a/scripts/lib/resultstool/__init__.py b/scripts/lib/resultstool/=
__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/scripts/lib/resultstool/merge.py b/scripts/lib/resultstool/mer=
ge.py
new file mode 100644
index 0000000..0b7c7dc
--- /dev/null
+++ b/scripts/lib/resultstool/merge.py
@@ -0,0 +1,71 @@
+# test results tool - merge multiple testresults.json files # #=20
+Copyright (c) 2019, Intel Corporation.
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
+from resultstool.resultsutils import load_json_file, get_dict_value,=20
+dump_json_data import os import json
+
+class ResultsMerge(object):
+
+    def get_test_results(self, logger, file, result_id):
+        results =3D load_json_file(file)
+        if result_id:
+            result =3D get_dict_value(logger, results, result_id)
+            if result:
+                return {result_id: result}
+            return result
+        return results
+
+    def merge_results(self, base_results, target_results):
+        for k in target_results:
+            base_results[k] =3D target_results[k]
+        return base_results
+
+    def _get_write_dir(self):
+        basepath =3D os.environ['BUILDDIR']
+        return basepath + '/tmp/'
+
+    def dump_merged_results(self, results, output_dir):
+        file_output_dir =3D output_dir if output_dir else self._get_write_=
dir()
+        dump_json_data(file_output_dir, 'testresults.json', results)
+        print('Successfully merged results to: %s' %=20
+ os.path.join(file_output_dir, 'testresults.json'))
+
+    def run(self, logger, base_result_file, target_result_file, target_res=
ult_id, output_dir):
+        base_results =3D self.get_test_results(logger, base_result_file, '=
')
+        target_results =3D self.get_test_results(logger, target_result_fil=
e, target_result_id)
+        if base_results and target_results:
+            merged_results =3D self.merge_results(base_results, target_res=
ults)
+            self.dump_merged_results(merged_results, output_dir)
+
+def merge(args, logger):
+    merge =3D ResultsMerge()
+    merge.run(logger, args.base_result_file, args.target_result_file, args=
.target_result_id, args.output_dir)
+    return 0
+
+def register_commands(subparsers):
+    """Register subcommands from this plugin"""
+    parser_build =3D subparsers.add_parser('merge', help=3D'merge test res=
ults',
+                                         description=3D'merge results from=
 multiple files',
+                                         group=3D'setup')
+    parser_build.set_defaults(func=3Dmerge)
+    parser_build.add_argument('base_result_file',
+                              help=3D'base result file provide the base re=
sult set')
+    parser_build.add_argument('target_result_file',
+                              help=3D'target result file provide the targe=
t result set for merging into the '
+                                   'base result set')
+    parser_build.add_argument('-t', '--target-result-id', default=3D'',
+                              help=3D'(optional) default merge all result =
sets available from target to base '
+                                   'unless specific target result id was p=
rovided')
+    parser_build.add_argument('-o', '--output-dir', default=3D'',
+                              help=3D'(optional) default write merged resu=
lts to <poky>/build/tmp/ unless specific  '
+                                   'output directory was provided')
diff --git a/scripts/lib/resultstool/regression.py b/scripts/lib/resultstoo=
l/regression.py
new file mode 100644
index 0000000..a1cd144
--- /dev/null
+++ b/scripts/lib/resultstool/regression.py
@@ -0,0 +1,134 @@
+# test results tool - regression analysis # # Copyright (c) 2019, Intel=20
+Corporation.
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
+from resultstool.resultsutils import load_json_file, get_dict_value=20
+import json
+
+class ResultsRegressionSelector(object):
+
+    def get_results_unique_configurations(self, logger, results):
+        unique_configurations_map =3D {"oeselftest": ['TEST_TYPE', 'HOST_D=
ISTRO', 'MACHINE'],
+                                     "runtime": ['TEST_TYPE', 'IMAGE_BASEN=
AME', 'MACHINE'],
+                                     "sdk": ['TEST_TYPE', 'IMAGE_BASENAME'=
, 'MACHINE', 'SDKMACHINE'],
+                                     "sdkext": ['TEST_TYPE', 'IMAGE_BASENA=
ME', 'MACHINE', 'SDKMACHINE']}
+        results_unique_configs =3D {}
+        for k in results:
+            result =3D results[k]
+            result_configs =3D get_dict_value(logger, result, 'configurati=
on')
+            result_test_type =3D get_dict_value(logger, result_configs, 'T=
EST_TYPE')
+            unique_configuration_keys =3D get_dict_value(logger, unique_co=
nfigurations_map, result_test_type)
+            result_unique_config =3D {}
+            for ck in unique_configuration_keys:
+                config_value =3D get_dict_value(logger, result_configs, ck=
)
+                if config_value:
+                    result_unique_config[ck] =3D config_value
+            results_unique_configs[k] =3D result_unique_config
+        return results_unique_configs
+
+    def get_regression_base_target_pair(self, logger, base_results, target=
_results):
+        base_configs =3D self.get_results_unique_configurations(logger, ba=
se_results)
+        logger.debug('Retrieved base configuration: config=3D%s' % base_co=
nfigs)
+        target_configs =3D self.get_results_unique_configurations(logger, =
target_results)
+        logger.debug('Retrieved target configuration: config=3D%s' % targe=
t_configs)
+        regression_pair =3D {}
+        for bk in base_configs:
+            base_config =3D base_configs[bk]
+            for tk in target_configs:
+                target_config =3D target_configs[tk]
+                if base_config =3D=3D target_config:
+                    regression_pair[bk] =3D tk
+        return regression_pair
+
+    def run_regression_with_regression_pairing(self, logger, regression_pa=
ir, base_results, target_results):
+        regression =3D ResultsRegression()
+        for base in regression_pair:
+            print('Getting regression for base=3D%s target=3D%s' % (base, =
regression_pair[base]))
+            regression.run(logger, base_results[base],=20
+ target_results[regression_pair[base]])
+
+    def run(self, logger, base_result_file, target_result_file, base_resul=
t_id, target_result_id):
+        base_results =3D load_json_file(base_result_file)
+        print('Successfully loaded base test results from: %s' % base_resu=
lt_file)
+        target_results =3D load_json_file(target_result_file)
+        print('Successfully loaded target test results from: %s' % target_=
result_file)
+        if base_result_id and target_result_id:
+            base_result =3D get_dict_value(logger, base_results, base_resu=
lt_id)
+            print('Getting base test result with result_id=3D%s' % base_re=
sult_id)
+            target_result =3D get_dict_value(logger, target_results, targe=
t_result_id)
+            print('Getting target test result with result_id=3D%s' % targe=
t_result_id)
+            regression =3D ResultsRegression()
+            regression.run(logger, base_result, target_result)
+        else:
+            regression_pair =3D self.get_regression_base_target_pair(logge=
r, base_results, target_results)
+            logger.debug('Retrieved regression pair=3D%s' % regression_pai=
r)
+            self.run_regression_with_regression_pairing(logger,=20
+ regression_pair, base_results, target_results)
+
+class ResultsRegression(object):
+
+    def print_regression_result(self, result):
+        print('=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3DStart Regression=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D')
+        print('Only print regression if base status not equal target')
+        print('<test case> : <base status> -> <target status>')
+        print('=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D')
+        for k in result:
+            print(k, ':', result[k]['base'], '->', result[k]['target'])
+        print('=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DEnd=20
+ Regression=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D')
+
+    def get_regression_result(self, logger, base_result, target_result):
+        base_result =3D get_dict_value(logger, base_result, 'result')
+        target_result =3D get_dict_value(logger, target_result, 'result')
+        result =3D {}
+        if base_result and target_result:
+            logger.debug('Getting regression result')
+            for k in base_result:
+                base_testcase =3D base_result[k]
+                base_status =3D get_dict_value(logger, base_testcase, 'sta=
tus')
+                if base_status:
+                    target_testcase =3D get_dict_value(logger, target_resu=
lt, k)
+                    target_status =3D get_dict_value(logger, target_testca=
se, 'status')
+                    if base_status !=3D target_status:
+                        result[k] =3D {'base': base_status, 'target': targ=
et_status}
+                else:
+                    logger.error('Failed to retrieved base test case statu=
s')
+        return result
+
+    def run(self, logger, base_result, target_result):
+        if base_result and target_result:
+            result =3D self.get_regression_result(logger, base_result, tar=
get_result)
+            logger.debug('Retrieved regression result =3D%s' % result)
+            self.print_regression_result(result)
+        else:
+            logger.error('Input data objects must not be empty (base_resul=
t=3D%s, target_result=3D%s)' %
+                         (base_result, target_result))
+
+def regression(args, logger):
+    regression =3D ResultsRegressionSelector()
+    regression.run(logger, args.base_result_file, args.target_result_file,=
 args.base_result_id, args.target_result_id)
+    return 0
+
+def register_commands(subparsers):
+    """Register subcommands from this plugin"""
+    parser_build =3D subparsers.add_parser('regression', help=3D'regressio=
n analysis',
+                                         description=3D'regression analysi=
s comparing base result set to target '
+                                                     'result set',
+                                         group=3D'analysis')
+    parser_build.set_defaults(func=3Dregression)
+    parser_build.add_argument('base_result_file',
+                              help=3D'base result file provide the base re=
sult set')
+    parser_build.add_argument('target_result_file',
+                              help=3D'target result file provide the targe=
t result set for comparison with base result')
+    parser_build.add_argument('-b', '--base-result-id', default=3D'',
+                              help=3D'(optional) default select regression=
 based on configurations unless base result '
+                                   'id was provided')
+    parser_build.add_argument('-t', '--target-result-id', default=3D'',
+                              help=3D'(optional) default select regression=
 based on configurations unless target result '
+                                   'id was provided')
diff --git a/scripts/lib/resultstool/report.py b/scripts/lib/resultstool/re=
port.py
new file mode 100644
index 0000000..c1c4f83
--- /dev/null
+++ b/scripts/lib/resultstool/report.py
@@ -0,0 +1,122 @@
+# test results tool - report text based test results # # Copyright (c)=20
+2019, Intel Corporation.
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
+import os
+import glob
+import json
+from resultstool.resultsutils import checkout_git_dir, load_json_file,=20
+get_dict_value
+
+class ResultsTextReport(object):
+
+    def get_test_result_files(self, source_dir, excludes, test_result_file=
):
+        testresults =3D []
+        for root, dirs, files in os.walk(source_dir, topdown=3DTrue):
+            [dirs.remove(d) for d in list(dirs) if d in excludes]
+            for name in files:
+                if name =3D=3D test_result_file:
+                    testresults.append(os.path.join(root, name))
+        return testresults
+
+    def get_aggregated_test_result(self, logger, testresult):
+        test_count_report =3D {'passed': 0, 'failed': 0, 'skipped': 0, 'fa=
iled_testcases': []}
+        result_types =3D {'passed': ['PASSED', 'passed'],
+                        'failed': ['FAILED', 'failed', 'ERROR', 'error', '=
UNKNOWN'],
+                        'skipped': ['SKIPPED', 'skipped']}
+        result =3D testresult["result"]
+        for k in result:
+            test_status =3D get_dict_value(logger, result[k], 'status')
+            for tk in result_types:
+                if test_status in result_types[tk]:
+                    test_count_report[tk] +=3D 1
+            if test_status in result_types['failed']:
+                test_count_report['failed_testcases'].append(k)
+        return test_count_report
+
+    def get_test_result_percentage(self, test_result_count):
+        total_tested =3D test_result_count['passed'] + test_result_count['=
failed'] + test_result_count['skipped']
+        test_percent_report =3D {'passed': 0, 'failed': 0, 'skipped': 0}
+        for k in test_percent_report:
+            test_percent_report[k] =3D format(test_result_count[k] / total=
_tested * 100, '.2f')
+        return test_percent_report
+
+    def add_test_configurations(self, test_report, source_dir, file, resul=
t_id):
+        test_report['file_dir'] =3D self._get_short_file_dir(source_dir, f=
ile)
+        test_report['result_id'] =3D result_id
+        test_report['test_file_dir_result_id'] =3D '%s_%s' %=20
+ (test_report['file_dir'], test_report['result_id'])
+
+    def _get_short_file_dir(self, source_dir, file):
+        file_dir =3D os.path.dirname(file)
+        source_dir =3D source_dir[:-1] if source_dir[-1] =3D=3D '/' else s=
ource_dir
+        if file_dir =3D=3D source_dir:
+            return 'None'
+        return file_dir.replace(source_dir, '')
+
+    def get_max_string_len(self, test_result_list, key, default_max_len):
+        max_len =3D default_max_len
+        for test_result in test_result_list:
+            value_len =3D len(test_result[key])
+            if value_len > max_len:
+                max_len =3D value_len
+        return max_len
+
+    def print_test_report(self, template_file_name, test_count_reports, te=
st_percent_reports,
+                          max_len_dir, max_len_result_id):
+        from jinja2 import Environment, FileSystemLoader
+        script_path =3D os.path.dirname(os.path.realpath(__file__))
+        file_loader =3D FileSystemLoader(script_path + '/template')
+        env =3D Environment(loader=3Dfile_loader, trim_blocks=3DTrue)
+        template =3D env.get_template(template_file_name)
+        output =3D template.render(test_count_reports=3Dtest_count_reports=
,
+                                 test_percent_reports=3Dtest_percent_repor=
ts,
+                                 max_len_dir=3Dmax_len_dir,
+                                 max_len_result_id=3Dmax_len_result_id)
+        print('Printing text-based test report:')
+        print(output)
+
+    def view_test_report(self, logger, source_dir, git_branch):
+        if git_branch:
+            checkout_git_dir(source_dir, git_branch)
+        test_count_reports =3D []
+        test_percent_reports =3D []
+        for file in self.get_test_result_files(source_dir, ['.git'], 'test=
results.json'):
+            logger.debug('Computing result for test result file: %s' % fil=
e)
+            testresults =3D load_json_file(file)
+            for k in testresults:
+                test_count_report =3D self.get_aggregated_test_result(logg=
er, testresults[k])
+                test_percent_report =3D self.get_test_result_percentage(te=
st_count_report)
+                self.add_test_configurations(test_count_report, source_dir=
, file, k)
+                self.add_test_configurations(test_percent_report, source_d=
ir, file, k)
+                test_count_reports.append(test_count_report)
+                test_percent_reports.append(test_percent_report)
+        max_len_dir =3D self.get_max_string_len(test_count_reports, 'file_=
dir', len('file_dir'))
+        max_len_result_id =3D self.get_max_string_len(test_count_reports, =
'result_id', len('result_id'))
+        self.print_test_report('test_report_full_text.txt', test_count_rep=
orts, test_percent_reports,
+                               max_len_dir, max_len_result_id)
+
+def report(args, logger):
+    report =3D ResultsTextReport()
+    report.view_test_report(logger, args.source_dir, args.git_branch)
+    return 0
+
+def register_commands(subparsers):
+    """Register subcommands from this plugin"""
+    parser_build =3D subparsers.add_parser('report', help=3D'report test r=
esult summary',
+                                         description=3D'report text-based =
test result summary from the source directory',
+                                         group=3D'analysis')
+    parser_build.set_defaults(func=3Dreport)
+    parser_build.add_argument('source_dir',
+                              help=3D'source directory that contain the te=
st result files for reporting')
+    parser_build.add_argument('-b', '--git-branch', default=3D'',
+                              help=3D'(optional) default assume source dir=
ectory contains all available files for '
+                                   'reporting unless a git branch was prov=
ided where it will try to checkout '
+                                   'the provided git branch assuming=20
+source directory was a git repository')
diff --git a/scripts/lib/resultstool/resultsutils.py b/scripts/lib/resultst=
ool/resultsutils.py
new file mode 100644
index 0000000..a85327c
--- /dev/null
+++ b/scripts/lib/resultstool/resultsutils.py
@@ -0,0 +1,47 @@
+# test results tool - utilities
+#
+# Copyright (c) 2019, Intel Corporation.
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
+import json
+import scriptpath
+scriptpath.add_oe_lib_path()
+from oeqa.utils.git import GitRepo, GitError
+
+def load_json_file(file):
+    with open(file, "r") as f:
+        return json.load(f)
+
+def dump_json_data(write_dir, file_name, json_data):
+    file_content =3D json.dumps(json_data, sort_keys=3DTrue, indent=3D4)
+    file_path =3D os.path.join(write_dir, file_name)
+    with open(file_path, 'w') as the_file:
+        the_file.write(file_content)
+
+def get_dict_value(logger, dict, key):
+    try:
+        return dict[key]
+    except KeyError:
+        if logger:
+            logger.debug('Faced KeyError exception: dict=3D%s: key=3D%s' %=
 (dict, key))
+        return None
+    except TypeError:
+        if logger:
+            logger.debug('Faced TypeError exception: dict=3D%s: key=3D%s' =
% (dict, key))
+        return None
+
+def checkout_git_dir(git_dir, git_branch):
+    try:
+        repo =3D GitRepo(git_dir, is_topdir=3DTrue)
+        repo.run_cmd('checkout %s' % git_branch)
+        return True
+    except GitError:
+        return False
\ No newline at end of file
diff --git a/scripts/lib/resultstool/store.py b/scripts/lib/resultstool/sto=
re.py
new file mode 100644
index 0000000..e28159f
--- /dev/null
+++ b/scripts/lib/resultstool/store.py
@@ -0,0 +1,110 @@
+# test results tool - store test results # # Copyright (c) 2019, Intel=20
+Corporation.
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
+import datetime
+import tempfile
+import os
+import subprocess
+import scriptpath
+scriptpath.add_bitbake_lib_path()
+scriptpath.add_oe_lib_path()
+from resultstool.resultsutils import checkout_git_dir
+try:
+    import bb
+except ImportError:
+    pass
+
+class ResultsGitStore(object):
+
+    def _get_output_dir(self):
+        basepath =3D os.environ['BUILDDIR']
+        return basepath + '/testresults_%s/' %=20
+ datetime.datetime.now().strftime("%Y%m%d%H%M%S")
+
+    def _create_temporary_workspace_dir(self):
+        return tempfile.mkdtemp(prefix=3D'testresults.')
+
+    def _remove_temporary_workspace_dir(self, workspace_dir):
+        return subprocess.run(["rm", "-rf",  workspace_dir])
+
+    def _oe_copy_files(self, source_dir, destination_dir):
+        from oe.path import copytree
+        copytree(source_dir, destination_dir)
+
+    def _copy_files(self, source_dir, destination_dir, copy_ignore=3DNone)=
:
+        from shutil import copytree
+        copytree(source_dir, destination_dir, ignore=3Dcopy_ignore)
+
+    def _store_files_to_git(self, logger, file_dir, git_dir, git_branch, c=
ommit_msg_subject, commit_msg_body):
+        logger.debug('Storing test result into git repository (%s) and bra=
nch (%s)'
+                     % (git_dir, git_branch))
+        return subprocess.run(["oe-git-archive",
+                               file_dir,
+                               "-g", git_dir,
+                               "-b", git_branch,
+                               "--commit-msg-subject", commit_msg_subject,
+                               "--commit-msg-body", commit_msg_body])
+
+    def store_to_existing(self, logger, source_dir, git_dir, git_branch):
+        logger.debug('Storing files to existing git repository and branch'=
)
+        from shutil import ignore_patterns
+        dest_dir =3D self._create_temporary_workspace_dir()
+        dest_top_dir =3D os.path.join(dest_dir, 'top_dir')
+        self._copy_files(git_dir, dest_top_dir, copy_ignore=3Dignore_patte=
rns('.git'))
+        self._oe_copy_files(source_dir, dest_top_dir)
+        self._store_files_to_git(logger, dest_top_dir, git_dir, git_branch=
,
+                                 'Store as existing git and branch', 'Stor=
e as existing git repository and branch')
+        self._remove_temporary_workspace_dir(dest_dir)
+        return git_dir
+
+    def store_to_existing_with_new_branch(self, logger, source_dir, git_di=
r, git_branch):
+        logger.debug('Storing files to existing git repository with new br=
anch')
+        self._store_files_to_git(logger, source_dir, git_dir, git_branch,
+                                 'Store as existing git with new branch',
+                                 'Store as existing git repository with ne=
w branch')
+        return git_dir
+
+    def store_to_new(self, logger, source_dir, git_branch):
+        logger.debug('Storing files to new git repository')
+        output_dir =3D self._get_output_dir()
+        self._store_files_to_git(logger, source_dir, output_dir, git_branc=
h,
+                                 'Store as new', 'Store as new git reposit=
ory')
+        return output_dir
+
+    def store(self, logger, source_dir, git_dir, git_branch):
+        if git_dir:
+            if checkout_git_dir(git_dir, git_branch):
+                self.store_to_existing(logger, source_dir, git_dir, git_br=
anch)
+            else:
+                self.store_to_existing_with_new_branch(logger, source_dir,=
 git_dir, git_branch)
+        else:
+            self.store_to_new(logger, source_dir, git_branch)
+
+def store(args, logger):
+    gitstore =3D ResultsGitStore()
+    gitstore.store(logger, args.source_dir, args.git_dir, args.git_branch)
+    return 0
+
+def register_commands(subparsers):
+    """Register subcommands from this plugin"""
+    parser_build =3D subparsers.add_parser('store', help=3D'store test res=
ult files and directories into git repository',
+                                         description=3D'store the testresu=
lts.json files and related directories '
+                                                     'from the source dire=
ctory into the destination git repository '
+                                                     'with the given git b=
ranch',
+                                         group=3D'setup')
+    parser_build.set_defaults(func=3Dstore)
+    parser_build.add_argument('source_dir',
+                              help=3D'source directory that contain the te=
st result files and directories to be stored')
+    parser_build.add_argument('git_branch', help=3D'git branch used for st=
ore')
+    parser_build.add_argument('-d', '--git-dir', default=3D'',
+                              help=3D'(optional) default store to new <top=
_dir>/<build>/<testresults_datetime> '
+                                   'directory unless provided with=20
+existing git repository as destination')
diff --git a/scripts/lib/resultstool/template/test_report_full_text.txt b/s=
cripts/lib/resultstool/template/test_report_full_text.txt
new file mode 100644
index 0000000..2e80d59
--- /dev/null
+++ b/scripts/lib/resultstool/template/test_report_full_text.txt
@@ -0,0 +1,35 @@
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Test Report (Count of passed, failed, skipped group by file_dir,=20
+result_id)=20
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+-----------------------------------------------------------------------
+---------------------------------------
+{{ 'file_dir'.ljust(max_len_dir) }} | {{=20
+'result_id'.ljust(max_len_result_id) }} | {{ 'passed'.ljust(10) }} | {{=20
+'failed'.ljust(10) }} | {{ 'skipped'.ljust(10) }}
+-----------------------------------------------------------------------
+---------------------------------------
+{% for report in test_count_reports=20
+|sort(attribute=3D'test_file_dir_result_id') %} {{=20
+report.file_dir.ljust(max_len_dir) }} | {{=20
+report.result_id.ljust(max_len_result_id) }} | {{=20
+(report.passed|string).ljust(10) }} | {{=20
+(report.failed|string).ljust(10) }} | {{=20
+(report.skipped|string).ljust(10) }} {% endfor %}
+-----------------------------------------------------------------------
+---------------------------------------
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Test Report (Percent of passed, failed, skipped group by file_dir,=20
+result_id)=20
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+-----------------------------------------------------------------------
+---------------------------------------
+{{ 'file_dir'.ljust(max_len_dir) }} | {{=20
+'result_id'.ljust(max_len_result_id) }} | {{ 'passed_%'.ljust(10) }} |=20
+{{ 'failed_%'.ljust(10) }} | {{ 'skipped_%'.ljust(10) }}
+-----------------------------------------------------------------------
+---------------------------------------
+{% for report in test_percent_reports=20
+|sort(attribute=3D'test_file_dir_result_id') %} {{=20
+report.file_dir.ljust(max_len_dir) }} | {{=20
+report.result_id.ljust(max_len_result_id) }} | {{=20
+(report.passed|string).ljust(10) }} | {{=20
+(report.failed|string).ljust(10) }} | {{=20
+(report.skipped|string).ljust(10) }} {% endfor %}
+-----------------------------------------------------------------------
+---------------------------------------
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Test Report (Failed test cases group by file_dir, result_id)=20
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+-----------------------------------------------------------------------
+---------------------------------------
+{% for report in test_count_reports=20
+|sort(attribute=3D'test_file_dir_result_id') %} {% if=20
+report.failed_testcases %} file_dir | result_id : {{ report.file_dir }}=20
+| {{ report.result_id }} {% for testcase in report.failed_testcases %}
+    {{ testcase }}
+{% endfor %}
+{% endif %}
+{% endfor %}
+-----------------------------------------------------------------------
+---------------------------------------
\ No newline at end of file
diff --git a/scripts/resultstool b/scripts/resultstool new file mode 100755=
 index 0000000..35cf080
--- /dev/null
+++ b/scripts/resultstool
@@ -0,0 +1,84 @@
+#!/usr/bin/env python3
+#
+# test results tool - tool for testresults.json (merge test results,=20
+regression analysis) # # To look for help information.
+#    $ resultstool
+#
+# To store test result from oeqa automated tests, execute the below
+#     $ resultstool store <source_dir> <git_branch>
+#
+# To merge test results, execute the below
+#    $ resultstool merge <base_result_file> <target_result_file>
+#
+# To report test report, execute the below
+#     $ resultstool report <source_dir>
+#
+# To perform regression analysis, execute the below
+#     $ resultstool regression <base_result_file> <target_result_file>
+#
+# Copyright (c) 2019, Intel Corporation.
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
+import resultstool.merge
+import resultstool.store
+import resultstool.regression
+import resultstool.report
+logger =3D scriptutils.logger_create('resultstool')
+
+def _validate_user_input_arguments(args):
+    if hasattr(args, "source_dir"):
+        if not os.path.isdir(args.source_dir):
+            logger.error('source_dir argument need to be a directory : %s'=
 % args.source_dir)
+            return False
+    return True
+
+def main():
+    parser =3D argparse_oe.ArgumentParser(description=3D"OpenEmbedded test=
 results tool.",
+                                        epilog=3D"Use %(prog)s <subcommand=
> --help to get help on a specific command")
+    parser.add_argument('-d', '--debug', help=3D'enable debug output', act=
ion=3D'store_true')
+    parser.add_argument('-q', '--quiet', help=3D'print only errors', actio=
n=3D'store_true')
+    subparsers =3D parser.add_subparsers(dest=3D"subparser_name", title=3D=
'subcommands', metavar=3D'<subcommand>')
+    subparsers.required =3D True
+    subparsers.add_subparser_group('setup', 'setup', 200)
+    resultstool.merge.register_commands(subparsers)
+    resultstool.store.register_commands(subparsers)
+    subparsers.add_subparser_group('analysis', 'analysis', 100)
+    resultstool.regression.register_commands(subparsers)
+    resultstool.report.register_commands(subparsers)
+
+    args =3D parser.parse_args()
+    if args.debug:
+        logger.setLevel(logging.DEBUG)
+    elif args.quiet:
+        logger.setLevel(logging.ERROR)
+
+    if not _validate_user_input_arguments(args):
+        return -1
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


