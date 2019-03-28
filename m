Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 28821 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 29 Mar 2019 04:29:03 UTC
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr720085.outbound.protection.outlook.com [40.107.72.85])
	by mail.openembedded.org (Postfix) with ESMTP id B423B6BF38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 04:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bTcpRLqMHiUrpw+eETlfU85uY5sAb8ZFGg0iK9kKnYc=;
	b=FU1t6nX747avxv4fY8/GddWd8W09pBcXEPZKDTX7lL43D53E4yIpxbe0YAPq+AWAPgLlg+sJXTWe6HtgfJV3npAhHyNrXRPALIdzlOAH/A6EvDszD0PaFRnPh1hqAAXaNh/JBvuSHQxbMl1zlkP5SA382P/KBJz722IECepkNcE=
Received: from BYAPR02CA0043.namprd02.prod.outlook.com (2603:10b6:a03:54::20)
	by SN6PR02MB5248.namprd02.prod.outlook.com (2603:10b6:805:70::29)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1750.17;
	Thu, 28 Mar 2019 18:55:36 +0000
Received: from SN1NAM02FT046.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::209) by BYAPR02CA0043.outlook.office365.com
	(2603:10b6:a03:54::20) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1730.15 via
	Frontend Transport; Thu, 28 Mar 2019 18:55:35 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT046.mail.protection.outlook.com (10.152.72.191) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1750.16
	via Frontend Transport; Thu, 28 Mar 2019 18:55:35 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1h9aBb-0004Fn-1a
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2019 11:55:35 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1h9aBV-0007Ob-Ud
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2019 11:55:29 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x2SItSV1013515; Thu, 28 Mar 2019 11:55:28 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1h9aBU-0007OK-My; Thu, 28 Mar 2019 11:55:28 -0700
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Mar 2019 11:55:21 -0700
Message-ID: <1553799321-17585-4-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553799321-17585-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1553799321-17585-1-git-send-email-chandana.kalluri@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(376002)(396003)(136003)(39860400002)(2980300002)(199004)(189003)(8676002)(6666004)(356004)(36756003)(478600001)(7696005)(51416003)(2906002)(5660300002)(336012)(426003)(77096007)(47776003)(2351001)(4326008)(14444005)(76176011)(305945005)(106466001)(106002)(186003)(54906003)(63266004)(8936002)(11346002)(9786002)(107886003)(16586007)(36386004)(486006)(316002)(446003)(2616005)(476003)(126002)(50466002)(48376002)(81156014)(6916009)(81166006)(26005)(50226002)(2004002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB5248; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3eaeb8a-e0ef-4659-cf55-08d6b3aef635
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4709054)(2017052603328)(7153060);
	SRVR:SN6PR02MB5248; 
X-MS-TrafficTypeDiagnostic: SN6PR02MB5248:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB52488E5724CA690D26D34CD9B0590@SN6PR02MB5248.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0990C54589
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: RnxEtrS8l5k8nDAwSmi46lpmhPqkjJkD9/bdnXg2FcK5pTmNSbuvLsoWyuRz7Abusbd8TVhQ/960BJ3BbBtOIFPZo7JUbWBCfwcyP+/yJvsD+aimB2hBOUOq/XKdudJkH3SEo7tDK7fzTszZ7nsyeEHPyGO3gHQqTV6cgnUUo50eQF4lJUhqB+I/C1E1yqlms+gq21TPu3uUIGRSdP+IG29fOvNLl3yRglrW0vj4OVPJe0RIYaE+wfRQtZk0fUPxBhNzXQBYSCcHBLXnbIKD4PLX0dC/KR8Cj1GosJWX2Q4bEnn3uvxWUiu+4Vip/qKf3XkdkGvqmceV3vUOBndTb069oGiMmAyEynXWTKdyWb+Fw0y90iP6BMpfN4nf3kBV17sIU6o1f4yRjcLAtD6BP0RDssB67XK3Dwv6lG5pT0U=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2019 18:55:35.4275 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3eaeb8a-e0ef-4659-cf55-08d6b3aef635
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5248
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [master][PATCH v3 3/3] devtool: provide support for devtool menuconfig command
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
X-List-Received-Date: Fri, 29 Mar 2019 04:29:04 -0000
Content-Type: text/plain

All packages that support the menuconfig task will be able to run
devtool menuconfig command. This would allow the user to modify the
current configure options and create a config fragment which can be
added to a recipe using devtool finish.

1. The patch checks if devtool menuconfig command is called for a valid
package.
2. It checks for oe-local-files dir within source and creates one if
needed, this directory is needed to store the final generated config
fragment so that devtool finish can update the recipe.
3. Menuconfig command is called for users to make necessary changes.
After saving the changes, diffconfig command is run to generate the
fragment.

Syntax:
	devtool menuconfig <package name>
	 Ex: devtool menuconfig linux-yocto

The config fragment is saved as devtool-fragment.cfg within
oe-local-files dir.

	Ex: <workspace_path>/sources/linux-yocto/oe-local-files/devtool-fragment.cfg

Run devtool finish to update the recipe by appending the config fragment
to SRC_URI and place a copy of the fragment within the layer where the
recipe resides.
	Ex: devtool finish linux-yocto meta

[YOCTO #10416]

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 scripts/lib/devtool/menuconfig.py | 80 +++++++++++++++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py   |  5 +++
 2 files changed, 85 insertions(+)
 create mode 100644 scripts/lib/devtool/menuconfig.py

diff --git a/scripts/lib/devtool/menuconfig.py b/scripts/lib/devtool/menuconfig.py
new file mode 100644
index 0000000..f8a24aa
--- /dev/null
+++ b/scripts/lib/devtool/menuconfig.py
@@ -0,0 +1,80 @@
+# OpenEmbedded Development tool - menuconfig command plugin
+#
+# Copyright (C) 2018 Xilinx
+# Written by: Chandana Kalluri <ckalluri@xilinx.com>
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
+"""Devtool menuconfig plugin"""
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
+def menuconfig(args, config, basepath, workspace):
+    """Entry point for the devtool 'menuconfig' subcommand"""
+
+    rd = "" 
+    kconfigpath = ""
+    pn_src = ""
+    localfilesdir = ""
+    workspace_dir = ""
+    tinfoil = setup_tinfoil(basepath=basepath)
+    try:
+      rd = parse_recipe(config, tinfoil, args.component, appends=True, filter_workspace=False)
+      if not rd:
+         return 1
+
+      pn =  rd.getVar('PN', True)
+      if pn not in workspace:
+         raise DevtoolError("Run devtool modify before calling menuconfig for %s" %pn)
+
+      if not rd.getVarFlag('do_menuconfig','task'):
+         raise DevtoolError("This package does not support menuconfig option")
+
+      workspace_dir = os.path.join(basepath,'workspace/sources')
+      kconfigpath = rd.getVar('B')
+      pn_src = os.path.join(workspace_dir,pn)
+
+      #add check to see if oe_local_files exists or not
+      localfilesdir = os.path.join(pn_src,'oe-local-files') 
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
+    logger.info('Launching menuconfig')
+    exec_build_env_command(config.init_path, basepath, 'bitbake -c menuconfig %s' % pn, watch=True) 
+    fragment = os.path.join(localfilesdir, 'devtool-fragment.cfg')
+    res = standard._create_kconfig_diff(pn_src,rd,fragment)
+
+    return 0
+
+def register_commands(subparsers, context):
+    """register devtool subcommands from this plugin"""
+    parser_menuconfig = subparsers.add_parser('menuconfig',help='Alter build-time configuration for a recipe', description='Launches the make menuconfig command(for recipes where do_menuconfig is available), allowing users to make changes to the build-time configuration. Creates a config fragment corresponding to changes made.', group='advanced') 
+    parser_menuconfig.add_argument('component', help='component to alter config')
+    parser_menuconfig.set_defaults(func=menuconfig,fixed_setup=context.fixed_setup)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index dc15c89..7da8cd8 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -961,6 +961,11 @@ def modify(args, config, basepath, workspace):
                         '    cp ${B}/.config ${S}/.config.baseline\n'
                         '    ln -sfT ${B}/.config ${S}/.config.new\n'
                         '}\n')
+            if rd.getVarFlag('do_menuconfig','task'):
+                    f.write('\ndo_configure_append() {\n'
+                    '    cp ${B}/.config ${S}/.config.baseline\n'
+                    '    ln -sfT ${B}/.config ${S}/.config.new\n'
+                    '}\n')
             if initial_rev:
                 f.write('\n# initial_rev: %s\n' % initial_rev)
                 for commit in commits:
-- 
2.7.4


