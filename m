Return-Path: <mazliana.mohamad@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 2B99878A9A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 12:11:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Dec 2018 04:11:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,322,1539673200"; d="scan'208";a="107784229"
Received: from kmsmsx156.gar.corp.intel.com ([172.21.138.133])
	by orsmga003.jf.intel.com with ESMTP; 06 Dec 2018 04:11:07 -0800
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.31]) by
	KMSMSX156.gar.corp.intel.com ([169.254.1.244]) with mapi id
	14.03.0415.000; Thu, 6 Dec 2018 20:08:13 +0800
From: "Mohamad, Mazliana" <mazliana.mohamad@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] scripts/test-case-mgmt: add
	"manualexecution"	as a tool
Thread-Index: AQHUjVUTr/u5hOsBCUihwAqiNgHeO6VxnfEg
Date: Thu, 6 Dec 2018 12:08:12 +0000
Message-ID: <A974252CAD7AF945AB1D34185A204505028C8DDA@PGSMSX105.gar.corp.intel.com>
References: <1544093967-5387-1-git-send-email-mazliana.mohamad@intel.com>
In-Reply-To: <1544093967-5387-1-git-send-email-mazliana.mohamad@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZWNiZjU3ZWQtYWMyZS00YTM0LWI5N2QtNjZhZmNjNjY4NzA1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZUFMUE5odXZzTEQwczExTU45N2xrWEdScFowYVdqRmk4UVZURkhoZVp5YllwaEl5ZkFxVEh3VDNIY0Z4Z1wvaWUifQ==
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: FW: [PATCH 1/2] scripts/test-case-mgmt: add "manualexecution"	as a tool
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
X-List-Received-Date: Thu, 06 Dec 2018 12:11:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of mazliana.mohamad@intel.c=
om
Sent: Thursday, December 6, 2018 6:59 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 1/2] scripts/test-case-mgmt: add "manualexecution=
" as a tool

From: Mazliana <mazliana.mohamad@intel.com>

Integrated the test-case-mgmt "store", "report" with "manual execution".Man=
ual test execution is one of an alternative test case management tool of Te=
stopia. This script has only a bare-minimum function.
Bare-minimum function refer to function where the user can only execute all=
 of the test cases that component have.

To use these scripts, first source oe environment, then run the entry point=
 script to look for help.
        $ test-case-mgmt

To execute manual test cases, execute the below
        $ test-case-mgmt manualexecution <manualjsonfile>

By default testresults.json store in poky/<build_dir>/tmp/log/manual

[YOCTO #12651]

Signed-off-by: Mazliana <mazliana.mohamad@intel.com>
---
 scripts/test-case-mgmt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/test-case-mgmt b/scripts/test-case-mgmt index b832ee2.=
.ef69db4 100755
--- a/scripts/test-case-mgmt
+++ b/scripts/test-case-mgmt
@@ -17,6 +17,11 @@
 # To store test result & log, execute the below
 #    $ test-case-mgmt store <source_dir> <git_branch>
 #
+# To execute manual test cases, execute the below
+#    $ test-case-mgmt manualexecution <manualjsonfile>
+#
+# By default testresults.json for manualexecution in=20
+poky/<build>/tmp/log/manual/ #
 # Copyright (c) 2018, Intel Corporation.
 #
 # This program is free software; you can redistribute it and/or modify it =
@@ -40,6 +45,7 @@ import argparse_oe  import scriptutils  import testcasemg=
mt.store  import testcasemgmt.report
+import testcasemgmt.manualexecution
 logger =3D scriptutils.logger_create('test-case-mgmt')
=20
 def _validate_user_input_arguments(args):
@@ -74,6 +80,8 @@ def main():
     testcasemgmt.store.register_commands(subparsers)
     subparsers.add_subparser_group('report', 'Reporting for test result & =
log', 200)
     testcasemgmt.report.register_commands(subparsers)
+    subparsers.add_subparser_group('manualexecution', 'Execute manual test=
 cases', 100)
+    testcasemgmt.manualexecution.register_commands(subparsers)
     args =3D parser.parse_args()
     if args.debug:
         logger.setLevel(logging.DEBUG)
--
2.7.4

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

