Return-Path: <ckalluri@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-eopbgr760044.outbound.protection.outlook.com [40.107.76.44])
	by mail.openembedded.org (Postfix) with ESMTP id E59E87E265
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 18:14:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=hqfpxIRVwvfPhmPw9BEifgY/cf3t5Q7lnmLpPLQTIy+WR/P4U0ss2x9wowQ1DQCHfT8KNwsII++ItXqPitiqQIteO342TdrahvPlD/m4Jbwf7dOS7KoaC9Ga1KpxsbeZFpc/BduoNr41Sn7u8KkSYPYWwfeRTZPqfX34gUdkfe1gK/Ree0NKLXQqOQP/hOkNkcZgAkeAUYM3T6GmpRsU8HOQJ59/7QS8+Kiantt7ds5JMXLRNl5sxxtzM3RNvqihZhv3vstIEwclo4y4IgHYoZ/1+7IlqqQzG7WmKSnFR3yExTYxHatVL09sns3x+16VtVEynFq24hTBgAFZQP6Xtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=j7jNS+vi3BZ9VjlUN2XErTWhPEAHhXOqmHFZBQvxhto=;
	b=i/GOKELLACYgAcFjxIECJqNyLNmytMuHputSUXDoNk9sQmHAsOwW5+whuCulKh+vBbfPnvtSDbkgf2NBosc4djVV9s9XsjJ84Gt1QpIiGfLy/pH7andlb3FS+KRnzrohYfVsWjK6gQpnCUS9V6A9HUnaxuioAxp6IL9V/zb5y9wU+x6nmM983iSkNppLKcALy/6k7smv+sXUwEzIE0HbLKVJY4oaxn/JbJan/x53X3swXa5zXBhDwQGotkT2sIVKZIBIWFb0/t438sPfe/Y0uBxJW8Julup23K3aP2w4F2I32Em+m1uyEp8F/paHxBf16xjImSjr81pBSvOEGUV75A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	149.199.60.83) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
	header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=j7jNS+vi3BZ9VjlUN2XErTWhPEAHhXOqmHFZBQvxhto=;
	b=cWrU0CG0UzJynSef1mAVNjCZrNjoVGe5rk8L9hKfOy9jBtXnlIB+pX2gyRfIrpmGe/wxtV7pJK1w7YnnWDCCSElTPyoS/mxecLhU3jeEK277rtj/JdEBX89lPKyoPuK/NPB1xJMvZX3gvTdZddQXWcsFysV8Z3daG6Pm+QYaK6I=
Received: from MWHPR02CA0044.namprd02.prod.outlook.com (2603:10b6:301:60::33)
	by CY4PR02MB2776.namprd02.prod.outlook.com (2603:10b6:903:126::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.25;
	Mon, 7 Oct 2019 18:14:35 +0000
Received: from SN1NAM02FT055.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::205) by MWHPR02CA0044.outlook.office365.com
	(2603:10b6:301:60::33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20 via
	Frontend Transport; Mon, 7 Oct 2019 18:14:35 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT055.mail.protection.outlook.com (10.152.72.174) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2327.21
	via Frontend Transport; Mon, 7 Oct 2019 18:14:33 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1iHXWj-0003JH-BI
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Oct 2019 11:14:33 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1iHXWe-0000Fs-7l
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Oct 2019 11:14:28 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x97IEJoW019615; Mon, 7 Oct 2019 11:14:19 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1iHXWV-0000EN-5u; Mon, 07 Oct 2019 11:14:19 -0700
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 11:14:18 -0700
Message-Id: <1570472058-30746-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(396003)(376002)(39860400002)(136003)(189003)(199004)(316002)(106002)(2351001)(4326008)(305945005)(6916009)(16586007)(50466002)(36386004)(107886003)(2361001)(70206006)(70586007)(356004)(47776003)(478600001)(48376002)(8936002)(36756003)(26005)(186003)(2906002)(50226002)(9786002)(51416003)(426003)(126002)(486006)(336012)(8676002)(2616005)(5660300002)(476003)(81166006)(81156014)(7696005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB2776; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:ErrorRetry; MX:1; A:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4855425-1f9d-44a8-6e24-08d74b5234a1
X-MS-TrafficTypeDiagnostic: CY4PR02MB2776:
X-Microsoft-Antispam-PRVS: <CY4PR02MB277661B9328753E25F1F17DBB09B0@CY4PR02MB2776.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-Forefront-PRVS: 01834E39B7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BAjw04x4vyA0D65S+QVKLTOlR58Nm8LTuWClxpqrXLmYQiu3kuNr7QXDC4jNLOeNHv1OaaonuAaxg+yaqpIMBPI/nHjfa4kA7eVu5GX8mg+0hvxcNgpDojyqcsKgSoulCcZMypETqmK9V23Mm67N/lB6/dyzLG4OZ7KdrDoJWrmB92D8KyyVwWmkAQnPttcD0dTxm/5T38ERxW4+NM/BttFxyjJGfXWzGWU8DBAKmZAqRmysssB+KwoxDX3vN+emmSQ1eFXX/k7icQtLLIsXca7YajkZirwiPBIoo1C7IHus6cIT0c6J3u/MgaTm5lePvESbwgrYh/RXuiNot3mlSljUj6wRKZl7c6sm7bxxHrXz/Jm1ACraWIHKTyfkAdDIz+G/PCJBjA6UQnc23IpMfca5MakX0TY+NPwMGRTvpf8=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2019 18:14:33.7119 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4855425-1f9d-44a8-6e24-08d74b5234a1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2776
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [master][PATCH] menuconfig: Add mechanism for user to append to same devtool fragment after user runs finish
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
X-List-Received-Date: Mon, 07 Oct 2019 18:14:37 -0000
Content-Type: text/plain

In current devtool flow, if user runs devtool modify, menuconfig and
finish, it will create a devtool-fragment.cfg and append to SRC_URI of
the recipe.

When a user runs the same flow multiple times, the devtool-fragment.cfg
created in previous iteration gets replaced with the new fragment
created in the current iteration. As a result, user can lose config
changes made previously.

Provide menuconfig with an option -a or --allow-append that lets users
to continue append to previous iteration of devtool-fragment.cfg.
	Ex. devtool menuconfig linux-xlnx -a

By default, the devtool flow will replace the config fragment unless
specified with the -a option.

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
 scripts/lib/devtool/menuconfig.py | 31 ++++++++++++++++++++-----------
 scripts/lib/devtool/standard.py   | 20 +++++++++++++++++++-
 2 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/scripts/lib/devtool/menuconfig.py b/scripts/lib/devtool/menuconfig.py
index 95384c5..d718844 100644
--- a/scripts/lib/devtool/menuconfig.py
+++ b/scripts/lib/devtool/menuconfig.py
@@ -32,10 +32,8 @@ def menuconfig(args, config, basepath, workspace):
     """Entry point for the devtool 'menuconfig' subcommand"""
 
     rd = ""
-    kconfigpath = ""
-    pn_src = ""
     localfilesdir = ""
-    workspace_dir = ""
+    fragname = "devtool-fragment.cfg"
     tinfoil = setup_tinfoil(basepath=basepath)
     try:
         rd = parse_recipe(config, tinfoil, args.component, appends=True, filter_workspace=False)
@@ -48,12 +46,10 @@ def menuconfig(args, config, basepath, workspace):
         if not rd.getVarFlag('do_menuconfig','task'):
             raise DevtoolError("This recipe does not support menuconfig option")
 
-        workspace_dir = os.path.join(config.workspace_path,'sources')
-        kconfigpath = rd.getVar('B')
-        pn_src = os.path.join(workspace_dir,pn)
+        srctree=rd.getVar('S',True)
 
         # add check to see if oe_local_files exists or not
-        localfilesdir = os.path.join(pn_src,'oe-local-files')
+        localfilesdir = os.path.join(srctree,'oe-local-files')
         if not os.path.exists(localfilesdir):
             bb.utils.mkdirhier(localfilesdir)
             # Add gitignore to ensure source tree is clean
@@ -62,18 +58,31 @@ def menuconfig(args, config, basepath, workspace):
                 f.write('# Ignore local files, by default. Remove this file if you want to commit the directory to Git\n')
                 f.write('*\n')
 
+        if args.allow_append:
+            with open(os.path.join(srctree,'.run-devtool-menuconfig'),'w') as f:
+                f.write('RUN-DEVTOOL-MENUCONFIG=1')
+
+
     finally:
-        tinfoil.shutdown()
+      tinfoil.shutdown()
+
+    if args.allow_append:
+	    if not os.path.exists(os.path.join(localfilesdir,'devtool-fragment.cfg')):
+		    fragname = "devtool-fragment.cfg"
+	    else:
+		    fragname = "devtool-fragment_tmp001.cfg"
 
     logger.info('Launching menuconfig')
     exec_build_env_command(config.init_path, basepath, 'bitbake -c menuconfig %s' % pn, watch=True)
-    fragment = os.path.join(localfilesdir, 'devtool-fragment.cfg')
-    res = standard._create_kconfig_diff(pn_src,rd,fragment)
+
+    fragment = os.path.join(localfilesdir, fragname)
+    res = standard._create_kconfig_diff(srctree,rd,fragment)
 
     return 0
 
 def register_commands(subparsers, context):
     """register devtool subcommands from this plugin"""
-    parser_menuconfig = subparsers.add_parser('menuconfig',help='Alter build-time configuration for a recipe', description='Launches the make menuconfig command (for recipes where do_menuconfig is available), allowing users to make changes to the build-time configuration. Creates a config fragment corresponding to changes made.', group='advanced')
+    parser_menuconfig = subparsers.add_parser('menuconfig',help='Alter build-time configuration for a recipe', description='Launches the make menuconfig command(for recipes where do_menuconfig is available), allowing users to make changes to the build-time configuration. Creates a config fragment corresponding to changes made.', group='advanced') 
     parser_menuconfig.add_argument('component', help='compenent to alter config')
+    parser_menuconfig.add_argument('-a','--allow-append',action="store_true",help='append devtool-fragment.cfg to previous iteration fragment')
     parser_menuconfig.set_defaults(func=menuconfig,fixed_setup=context.fixed_setup)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 1c0cd8a..a3941d9 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1382,6 +1382,24 @@ def _export_local_files(srctree, rd, destdir, srctreebase):
     removed = OrderedDict()
     local_files_dir = os.path.join(srctreebase, 'oe-local-files')
     git_files = _git_ls_tree(srctree)
+
+    tmpfragname=os.path.join(local_files_dir,'devtool-fragment_tmp001.cfg')
+
+    run_do_menuconfig = 0
+    checkmenuconfig = os.path.join(srctreebase,'.run-devtool-menuconfig')
+    if os.path.exists(checkmenuconfig):
+	    with open(checkmenuconfig,'r') as f:
+		    if 'RUN-DEVTOOL-MENUCONFIG=1' in f.read():
+			    run_do_menuconfig = 1
+	    os.remove(checkmenuconfig)
+
+    if os.path.exists(tmpfragname):
+	    with open(tmpfragname,"r") as fin:
+		    tempfragcontents=fin.read()
+	    with open(os.path.join(local_files_dir,'devtool-fragment.cfg'),"+a") as fout:
+		    fout.write(tempfragcontents)
+	    os.remove(tmpfragname)
+
     if 'oe-local-files' in git_files:
         # If tracked by Git, take the files from srctree HEAD. First get
         # the tree object of the directory
@@ -1400,7 +1418,7 @@ def _export_local_files(srctree, rd, destdir, srctreebase):
         new_set = []
 
     # Special handling for kernel config
-    if bb.data.inherits_class('kernel-yocto', rd):
+    if not run_do_menuconfig and bb.data.inherits_class('kernel-yocto', rd):
         fragment_fn = 'devtool-fragment.cfg'
         fragment_path = os.path.join(destdir, fragment_fn)
         if _create_kconfig_diff(srctree, rd, fragment_path):
-- 
2.7.4


