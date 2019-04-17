Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 10826 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 18 Apr 2019 13:15:46 UTC
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr700085.outbound.protection.outlook.com [40.107.70.85])
	by mail.openembedded.org (Postfix) with ESMTP id 843D86A441
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 13:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=K/X40uz17A/QF/GWIWoJSqtJ3yqLMYSjZZKrywy+7U8=;
	b=2TMvz74W5F8keZAcXIgu9NBWpgmWC1xTZN6FFfdG3LbYoslE6o9WzM/UGB6X/NOc6SNd4b3Fy5W2qbZ4UQHr+MaRS9hR5d4qpCmYM568dhequYEygzA+JHkaMeF6nHmpKgRtrKFOwsBBpqqadHc0g9YX1tz1pJLUgV9rrfuXR3E=
Received: from BN7PR02CA0002.namprd02.prod.outlook.com (2603:10b6:408:20::15)
	by MW2PR02MB3835.namprd02.prod.outlook.com (2603:10b6:907:4::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1792.19;
	Wed, 17 Apr 2019 22:43:11 +0000
Received: from SN1NAM02FT051.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::200) by BN7PR02CA0002.outlook.office365.com
	(2603:10b6:408:20::15) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1813.11 via
	Frontend Transport; Wed, 17 Apr 2019 22:43:10 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT051.mail.protection.outlook.com (10.152.73.103) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1771.16
	via Frontend Transport; Wed, 17 Apr 2019 22:43:10 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:46881
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1hGtGo-0008Gr-0G
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2019 15:43:10 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1hGtGi-0003j6-T4
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2019 15:43:04 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1hGtGe-0003h6-Jq; Wed, 17 Apr 2019 15:43:00 -0700
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Apr 2019 15:42:59 -0700
Message-ID: <1555540979-27879-4-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555540979-27879-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1555540979-27879-1-git-send-email-chandana.kalluri@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(346002)(396003)(376002)(2980300002)(199004)(189003)(81166006)(6916009)(107886003)(9786002)(2616005)(36386004)(14444005)(81156014)(336012)(11346002)(51416003)(2906002)(8936002)(356004)(7696005)(126002)(8676002)(426003)(446003)(486006)(48376002)(50466002)(2351001)(63266004)(106002)(5660300002)(478600001)(316002)(305945005)(476003)(54906003)(16586007)(50226002)(36756003)(47776003)(76176011)(186003)(26005)(77096007)(4326008)(2004002)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR02MB3835; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83a44152-2994-42d4-eab8-08d6c3861171
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4709054)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
	SRVR:MW2PR02MB3835; 
X-MS-TrafficTypeDiagnostic: MW2PR02MB3835:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <MW2PR02MB383534282220E57F54B184F4B0250@MW2PR02MB3835.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0010D93EFE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: bhe4JUjNsyLLrJq5HOnVaLhLc5MajMUTCm07IBDu1qOgyN4JV8vFcSBuClcmmzQyHiizYYB/tCOy+kkNuueLeu7rKaN2hd2Ee5VgvpaJuKuLT+E8SDMCIjeEXprMDUmrrw9lY9AMUPfpTA/IHxaaeakE/+cA1wWMJnR4EaoGdQaweKyZfyT0tBVAqSSofcU9FPShBpmdfo2OwyvGiU0Docd/GRP3cyU3qzBt6IHxHhoKFpXjZ31EgkWSAUMMM9DhjBwYmUPqwNoulWAHYrIs70oPE1RqnY8QOBprLSVyJ5VRent6uiRk5L55v9DujtFWjUSZ44VPLEELjxZIsmJXaORonsS/b/bdqTaNQ7qcD4bj9IiDYzbDjdCRQnhnWx+e/+z8dtYLKWJuU6eFP/ZfPx92NweOA1a15M5RgxYqvcw=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2019 22:43:10.3735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a44152-2994-42d4-eab8-08d6c3861171
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3835
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [master][PATCH v4 3/3] devtool: provide support for devtool menuconfig command
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
X-List-Received-Date: Thu, 18 Apr 2019 13:15:46 -0000
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

	Ex:
<workspace_path>/sources/linux-yocto/oe-local-files/devtool-fragment.cfg

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
index 0000000..0ebcf74
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
+from devtool import check_workspace_recipe
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
+      check_workspace_recipe(workspace, args.component)
+      pn =  rd.getVar('PN', True)
+
+      if not rd.getVarFlag('do_menuconfig','task'):
+         raise DevtoolError("This recipe does not support menuconfig option")
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
+    parser_menuconfig = subparsers.add_parser('menuconfig',help='Alter build-time configuration for a recipe', description='Launches the make menuconfig command (for recipes where do_menuconfig is available), allowing users to make changes to the build-time configuration. Creates a config fragment corresponding to changes made.', group='advanced') 
+    parser_menuconfig.add_argument('component', help='compenent to alter config')
+    parser_menuconfig.set_defaults(func=menuconfig,fixed_setup=context.fixed_setup)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 9267d6e..6ef7255 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -942,6 +942,11 @@ def modify(args, config, basepath, workspace):
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


