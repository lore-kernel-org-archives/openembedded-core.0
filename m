Return-Path: <JAEWON@xilinx.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-eopbgr750045.outbound.protection.outlook.com [40.107.75.45])
	by mail.openembedded.org (Postfix) with ESMTP id EB8FD7C4F9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 23:52:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=eAeDenJ6SH27dlwMxt0H9CPMEpxqZyNhGCbRZ74/z7drOIn7T1+CRUbX6S5Sq0JsgXCFZDywXmaSGnOhDcEFtQyc0GV9VC7iuyxyfVPJ7hiWMWvlc2hDkqzJigoS2Bh1aHp7V41Z45/I/zxlJ2fdsLhSl5ewzjd2Kl2W3enurUOBkFOQZhWOyQWnSBP7+VFDwM5Hy/NZbu8oqu9Hfxc2+XkQyX/9mDrHttabpsaGWaDei2xjTb9FbWz5IQYrwfd1i05e3N+fLx+OPfWl22zzb37U31nhTESfzfbg3rwE2EqxPuwbjcXBpJBaCxcoNou6rKBV5ZP/NvwjQRL+kSenvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gUFA2W2zwHbsdAUXtIAqKBz8fUU7VETUVCQQIRooRvw=;
	b=HibZay4ITcPNC90VCZi1VGabXNc4oQ4uIMu83jgGFFBlAXaOSugCleffFCq/0Doe8HbIWZm3Kji69AxIslfSKlDpjh//vmFfBGM66iGSI/5gM+8EItqjmk8B5YmD3ioAr5N+K9eo/ArefontFlovbLoFGE2DFdyJfLEkufDDtKXVwe8misQmatsoSF5GBtCfZOCne4HXPWPmh8XgaVeZgrNiYgbLBYe6HrV/JGeri4g90CkK4F4KCOA0sGqVQGOfm+Q//8RGJbfbN1BksvGJ/1m4YTT1ecb/JFOIY9uCe6wRPxbuH+eFD968gc6mC6zCX7zcrLudiBf0qKlYjQW2Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	149.199.60.83) smtp.rcpttodomain=linux.intel.com
	smtp.mailfrom=xilinx.com; 
	dmarc=bestguesspass action=none header.from=xilinx.com;
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gUFA2W2zwHbsdAUXtIAqKBz8fUU7VETUVCQQIRooRvw=;
	b=Hlsjf9+GEMXkYg3iHoW2IL/xBtpJBJG346Xp1l//eLEuIKPDk15d8C9Bse3y+FKSdzPvzaXm4m8K4TYUPPXnwoVqaOQG7kskc+A1MQEKYwbZcxBCn27fEcV1cRp2rb95hhJIhXuMpbO0GZOoTi0JHnpB4WflPSZzfMkor6qETeM=
Received: from BN6PR02CA0041.namprd02.prod.outlook.com (2603:10b6:404:5f::27)
	by MW2PR02MB3852.namprd02.prod.outlook.com (2603:10b6:907:4::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.17;
	Wed, 2 Oct 2019 23:52:21 +0000
Received: from BL2NAM02FT054.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::201) by BN6PR02CA0041.outlook.office365.com
	(2603:10b6:404:5f::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.15 via
	Frontend Transport; Wed, 2 Oct 2019 23:52:21 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; linux.intel.com;
	dkim=none (message not signed)
	header.d=none;linux.intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT054.mail.protection.outlook.com (10.152.77.107) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2305.20
	via Frontend Transport; Wed, 2 Oct 2019 23:52:20 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1iFoPs-0007Zf-9G; Wed, 02 Oct 2019 16:52:20 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1iFoPn-0006Eb-6C; Wed, 02 Oct 2019 16:52:15 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x92Nq5mK003128; Wed, 2 Oct 2019 16:52:05 -0700
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1iFoPc-0006Dq-VU; Wed, 02 Oct 2019 16:52:05 -0700
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: openembedded-core@lists.openembedded.org, nathan@nathanrossi.com,
	paul.eggleton@linux.intel.com
Date: Wed,  2 Oct 2019 16:52:04 -0700
Message-Id: <1570060324-16826-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(199004)(189003)(50466002)(48376002)(26005)(186003)(2906002)(7696005)(51416003)(486006)(126002)(476003)(2616005)(44832011)(426003)(305945005)(356004)(336012)(106002)(5660300002)(478600001)(316002)(16586007)(70586007)(70206006)(50226002)(8936002)(81156014)(81166006)(8676002)(36756003)(4326008)(36386004)(107886003)(14444005)(47776003)(9786002)(131093003)(2004002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR02MB3852; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df70c7a4-ca8b-4d13-6412-08d7479390cc
X-MS-TrafficTypeDiagnostic: MW2PR02MB3852:
X-Microsoft-Antispam-PRVS: <MW2PR02MB38525444234A1DA592A480EDAF9C0@MW2PR02MB3852.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:287;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z0WA8tyNcINUYIWXXlMT5NEmnH2SIG3EIxyd5mM4OCNYI2W4PtyvDo6PuMhJnd9p4uHI1xNRRWCsI1x41owrLiCmEwPp1Y7qADLj8m1kAVPpv5+EwQe7VoruLPIjMWmC1WGpiZ15sS6qFsyaQa9bpgi08D3V5vT337WmNwmOlhawJ8IeNahD+IxpUytIe9WB+oXmxxIOnz1+t9XkZU7n4DoulvjR9d94EmlWkJwFoGi/Ql6qUjKkCljLMMwRcN0ay386mRARKllrPBuAYTOow3gNtTyxX2CUfr1h+U3M3Sr9ExVfN6n8aqYMDqaBCT9iEQHXDiIJ6DymmmWM+Eb0J4NXOO152gmJjXV6Vp7sQbB10Af4THvpIS6LBSfcgXOg/2otSVmmDai/1IH//1Y7bfDb0ctW7jcDz0uzX261EE8=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 23:52:20.8460 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df70c7a4-ca8b-4d13-6412-08d7479390cc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3852
Subject: [master][PATCH] devtool: ccmake: Pulling in available ccmake functionality to devtool
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
X-List-Received-Date: Wed, 02 Oct 2019 23:52:25 -0000
Content-Type: text/plain

Pulling in available ccmake functionality to devtool.  Running devtool
ccmake ${PN} will call bitbake -c ccmake which will pull up an ncurses
menu where the user can modify config options. After the menu is exited
it will use the same logic available in ccmake.bbclass to generate
configuration.inc and site-file.cmake file and place into
oe-local-files.

The changes can be tested, then committed using:

    devtool finish ${PN} /pathtolayer -f

The '-f' is needed as ${B}/CMakeCache.txt is soft linked to
${S}/CMakeCache.txt.new as devtool is not able to access ${B} because
it ignores the bbappends in build/workspace and this is the only way to
reflect the changes from bitbake -c ccmake.

Multiple devtool ccmake calls will create the diff between the
original CMakeCache.txt file (when calling devtool modify) and final
configuration.

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
---
 scripts/lib/devtool/ccmake.py   | 73 +++++++++++++++++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py | 68 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 141 insertions(+)
 create mode 100644 scripts/lib/devtool/ccmake.py

diff --git a/scripts/lib/devtool/ccmake.py b/scripts/lib/devtool/ccmake.py
new file mode 100644
index 0000000..c9597c3
--- /dev/null
+++ b/scripts/lib/devtool/ccmake.py
@@ -0,0 +1,73 @@
+# OpenEmbedded Development tool - ccmake command plugin
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+"""Devtool ccmake plugin"""
+
+import os
+import bb
+import logging
+import argparse
+import re
+import glob
+from devtool import setup_tinfoil, parse_recipe, DevtoolError, standard, exec_build_env_command
+
+logger = logging.getLogger('devtool')
+
+def ccmake(args, config, basepath, workspace):
+    """Entry point for the devtool 'ccmake' subcommand"""
+
+    rd = ""
+    localfilesdir = ""
+
+    tinfoil = setup_tinfoil(basepath=basepath)
+    try:
+      rd = parse_recipe(config, tinfoil, args.component, appends=True, filter_workspace=False)
+      if not rd:
+         return 1
+
+      pn =  rd.getVar('PN', True)
+      if pn not in workspace:
+         raise DevtoolError("Run devtool modify before calling ccmake for %s" %pn)
+
+      if not rd.getVarFlag('do_ccmake','task'):
+         raise DevtoolError("This package does not support ccmake option")
+
+      srctree=rd.getVar('S',True)
+
+      #add check to see if oe_local_files exists or not
+      localfilesdir = os.path.join(srctree,'oe-local-files')
+      if not os.path.exists(localfilesdir):
+          bb.utils.mkdirhier(localfilesdir)
+          #Add gitignore to ensure source tree is clean
+          gitignorefile = os.path.join(localfilesdir,'.gitignore')
+          with open(gitignorefile, 'w') as f:
+                  f.write('# Ignore local files, by default. Remove this file if you want to commit the directory to Git\n')
+                  f.write('*\n')
+
+    finally:
+      tinfoil.shutdown()
+
+    logger.info('Launching ccmake')
+    exec_build_env_command(config.init_path, basepath, 'bitbake -c ccmake %s' % pn, watch=True)
+
+    standard._create_cmake_diff(srctree,rd)
+
+    return 0
+
+def register_commands(subparsers, context):
+    """register devtool subcommands from this plugin"""
+    parser_ccmake = subparsers.add_parser('ccmake',help='HELP', description='Launches the make ccmake command(for recipes where do_ccmake is available), allowing users to make changes to the build-time configuration. Creates a config fragment corresponding to changes made.', group='advanced')
+    parser_ccmake.add_argument('component', help='component to alter config')
+    parser_ccmake.set_defaults(func=ccmake,fixed_setup=context.fixed_setup)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 60c9a04..c942798 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -943,6 +943,11 @@ def modify(args, config, basepath, workspace):
                 '    cp ${B}/.config ${S}/.config.baseline\n'
                 '    ln -sfT ${B}/.config ${S}/.config.new\n'
                 '}\n')
+            if rd.getVarFlag('do_ccmake','task'):
+                    f.write('\ndo_configure_append() {\n'
+                    '    cp ${B}/CMakeCache.txt ${S}/CMakeCache.txt.orig\n'
+                    '    ln -sfT ${B}/CMakeCache.txt ${S}/CMakeCache.txt.new\n'
+                    '}\n')
             if initial_rev:
                 f.write('\n# initial_rev: %s\n' % initial_rev)
                 for commit in commits:
@@ -1332,6 +1337,69 @@ def _export_patches(srctree, rd, start_rev, destdir, changed_revs=None):
             added[new_patch] = None
     return (updated, added, existing_patches)
 
+def cmake_parse_config_cache(path):
+    with open(path, "r") as f:
+        for i in f:
+            i = i.rstrip("\n")
+            if len(i) == 0 or i.startswith("//") or i.startswith("#"):
+                continue # empty or comment
+            key, value = i.split("=", 1)
+            key, keytype = key.split(":")
+            if keytype in ["INTERNAL", "STATIC"]:
+                continue # skip internal and static config options
+            yield key, keytype, value
+
+def cmake_diff_config_vars(a, b):
+    removed, added = [], []
+
+    for ak, akt, av in a:
+        found = False
+        for bk, bkt, bv in b:
+            if bk == ak:
+                found = True
+                if bkt != akt or bv != av: # changed
+                    removed.append((ak, akt, av))
+                    added.append((bk, bkt, bv))
+                break
+        # remove any missing from b
+        if not found:
+            removed.append((ak, akt, av))
+
+    # add any missing from a
+    for bk, bkt, bv in b:
+        if not any(bk == ak for ak, akt, av in a):
+            added.append((bk, bkt, bv))
+
+    return removed, added
+
+def _create_cmake_diff(srctree, rd):
+    import shutil
+    orig_config = os.path.join(srctree, 'CMakeCache.txt.orig')
+    new_config = os.path.join(srctree, 'CMakeCache.txt.new')
+    if os.path.exists(orig_config) and os.path.exists(new_config):
+        if bb.utils.md5_file(orig_config) != bb.utils.md5_file(new_config):
+            # scan the changed options
+            old = list(cmake_parse_config_cache(orig_config))
+            new = list(cmake_parse_config_cache(new_config))
+            _, added = cmake_diff_config_vars(old, new)
+
+            if len(added) != 0:
+                with open(os.path.join(srctree, "oe-local-files", "configuration.inc"), "w") as f:
+                    f.write("EXTRA_OECMAKE += \" \\\n")
+                    for k, kt, v in added:
+                        escaped = v if " " not in v else "\"{0}\"".format(v)
+                        f.write("    -D{0}:{1}={2} \\\n".format(k, kt, escaped))
+                    f.write("    \"\n")
+                bb.plain("Configuration recipe fragment written to: {0}".format(os.path.join(srctree, "oe-local-files", "configuration.inc")))
+
+                with open(os.path.join(srctree, "oe-local-files", "site-file.cmake"), "w") as f:
+                    for k, kt, v in added:
+                        f.write("SET({0} \"{1}\" CACHE {2} \"\")\n".format(k, v, kt))
+                bb.plain("Configuration cmake fragment written to: {0}".format(os.path.join(srctree, "oe-local-files", "site-file.cmake")))
+        else:
+            bb.plain("No configuration differences, skipping configuration fragment generation.")
+        return True
+    return False
 
 def _create_kconfig_diff(srctree, rd, outfile):
     """Create a kconfig fragment"""
-- 
2.7.4


