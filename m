Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 5563 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 10 Jul 2019 20:00:33 UTC
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr680048.outbound.protection.outlook.com [40.107.68.48])
	by mail.openembedded.org (Postfix) with ESMTP id EDAAB7EFEF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 20:00:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Cpa+hMxmgf1InvtoGrs8i4bugrdbc/dFonic0LBu3jxaxOZVNDTZOd7LFk8+1PQuVULQWIlvryirQ/OrUBXyHmrPaoAyGfWEIgPs/fWMQQFaCNVYyU7t4mrSG8fDNcfyY6Z+omce/HCDPop2v/i+MVrD4i8rP02TOspo8i7eu4JwTT46lUd0ki8YONwSL2I4s7Wcmxc6xkT2Ka81KEtYlXcaTC7FfAvnoQl1lqI3XK+t+hqdy7FyjhE5wcvxzJIRimkHpylTo7ZBTAypQJGTQ6xbS31FsdESGISr992JxjrFZGJS+Dh1+zzPcZkDzyFwV0SzDO0YvrEges7lKwM7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=r4D6Yf8VGOoCxS5ilbwAFv6zYAxgVqE0E3/hGYdlcEI=;
	b=PQFPmkPJ8gyU0sHZOxdaGF5N8hBHjoj1QMCeu1SFUvT0PTiZgqaUd2gU0el5diMZ5fkqMVA4+Pil90ivRLR1KN6dDFxM+kO5P8GZd2eW7rtigmlXfpN2exNFCa4VaobHO/om7bQt88czbDoSl/gpfNN9HlIOCgYM1+ONeyUgFOIIhqlPnX4Cx6ysLeiNkXNSNCEO7WZvadeQ5DlUQMJSRM+TYSp9DbTr3QSDJ6HKqAOX8jNiFxWBPy+m8lfxOBqfDjxG3GRFLW42KLstrRxHqXoi87dstL1FzHMqoPMCCqRdfhFos6PTELYt+ruVC3kVIxTs8MKDRcEsTohEnKqaHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass (sender ip is
	149.199.60.100) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=xilinx.com;dmarc=bestguesspass action=none
	header.from=xilinx.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=r4D6Yf8VGOoCxS5ilbwAFv6zYAxgVqE0E3/hGYdlcEI=;
	b=XHgpLInnqrIYoifRatG/0YJm3URX17B3HMRNFtprbnLNOVu4f48iNu8VX9OBh7NbZLoI2e01AwY/YR1uoNi5VOPWrsGCbbyuoPMcEEI+CYKS/RIq8tEigKZR8E8hoEJAaezj0kC7cuY40se+RZeNzB74TwKmAddr2F5ZVjcGDgs=
Received: from SN4PR0201CA0050.namprd02.prod.outlook.com
	(2603:10b6:803:20::12) by DM5PR02MB3720.namprd02.prod.outlook.com
	(2603:10b6:4:af::33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10;
	Wed, 10 Jul 2019 18:27:49 +0000
Received: from CY1NAM02FT042.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::202) by SN4PR0201CA0050.outlook.office365.com
	(2603:10b6:803:20::12) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via
	Frontend Transport; Wed, 10 Jul 2019 18:27:49 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT042.mail.protection.outlook.com (10.152.75.136) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2032.15
	via Frontend Transport; Wed, 10 Jul 2019 18:27:49 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:50494
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1hlHJk-0004WX-N2
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Jul 2019 11:27:48 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1hlHJf-00053w-JM
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Jul 2019 11:27:43 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x6AIRZoB005426; Wed, 10 Jul 2019 11:27:35 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1hlHJX-00053K-C6; Wed, 10 Jul 2019 11:27:35 -0700
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2019 11:27:34 -0700
Message-Id: <1562783254-14818-4-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562783254-14818-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1562783254-14818-1-git-send-email-chandana.kalluri@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(2980300002)(189003)(199004)(76176011)(70586007)(26005)(8676002)(4326008)(36756003)(14444005)(2616005)(126002)(476003)(70206006)(7696005)(51416003)(107886003)(47776003)(2906002)(356004)(81166006)(2361001)(106002)(9786002)(478600001)(2351001)(5660300002)(54906003)(36386004)(16586007)(316002)(486006)(426003)(446003)(11346002)(63266004)(336012)(186003)(48376002)(6916009)(50466002)(305945005)(8936002)(50226002)(81156014)(2004002)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB3720; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6abd5686-77c9-49e6-8311-08d705645000
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);
	SRVR:DM5PR02MB3720; 
X-MS-TrafficTypeDiagnostic: DM5PR02MB3720:
X-Microsoft-Antispam-PRVS: <DM5PR02MB372008289B8DA7D8AE52BDC2B0F00@DM5PR02MB3720.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 0094E3478A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: qgke6LzJ5l6ttJ8JIyuyATQm21lpFspnksr1oUvT37+Skv+U2ni1U5xwpmxPrYGRi4hCNRtvsebrxX7+nxUk75h9TC3oGF9VdsRI31FYc8ZUcyiBJXtXrZm2SHPcMj/FB9DhYOHgp/OUsBpZomtH6KSk2uZnTDO17NeRDMkXVAGFMknqzFYE6TcdT/LViawsjTZkoLP1/LSvc2838aPRwab1tqqEeTY6uf6MluJ3XW7OdQam/DoFJaiWtxgEAFbT8vaUGIBywa94yPS/QqRX0Ap831qW28lUBf+FsezqSPjb0sCR+LlJ27BV7nUFynmBz03ng0CUwShuel5hqBH3wtRf79BLqJ2lFTNZrv/Y0exWiGefxkKa2mUoOGas5tzMuLAtODl4vbKWfM3DeUxu7hrP/VKk7mnmiVTsBKyz9aI=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2019 18:27:49.1562 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6abd5686-77c9-49e6-8311-08d705645000
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3720
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [master][PATCH 3/3] devtool: provide support for devtool menuconfig command
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
X-List-Received-Date: Wed, 10 Jul 2019 20:00:34 -0000
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
 scripts/lib/devtool/menuconfig.py | 79 +++++++++++++++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py   |  5 +++
 2 files changed, 84 insertions(+)
 create mode 100644 scripts/lib/devtool/menuconfig.py

diff --git a/scripts/lib/devtool/menuconfig.py b/scripts/lib/devtool/menuconfig.py
new file mode 100644
index 0000000..20d919b
--- /dev/null
+++ b/scripts/lib/devtool/menuconfig.py
@@ -0,0 +1,79 @@
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
+      workspace_dir = os.path.join(config.workspace_path,'sources')
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
index 0759211..0b98c93 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -938,6 +938,11 @@ def modify(args, config, basepath, workspace):
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


