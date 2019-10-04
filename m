Return-Path: <ckalluri@xilinx.com>
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr680059.outbound.protection.outlook.com [40.107.68.59])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6737C9C5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2019 22:52:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Z1dGRf6bVuvP36nFFYQs0qarLmEeNdtz76x4CShAm8cx4HJXw5AigRoXOvbCaNtsW1YDbCkAwTa4iMjbBpXUr7W32+uP1YKwSvy+3CwqdMzTMb1pHWWgf8rRQtffeZhw7njxeon3ov09cznZq8Jpr4UUiORDynjD8Mu3B/HqjL6wyB1tbw3kN8tIH0R3DLzL02k6gB5HHYcMxW4id3TLWvJayMW8L0ET0GBfUaX7+pHV7RWuBKktus+6mdO6vJy6yCBiKFclrkAuaejzjk/OFOfSin67A2eRNdoaV5yqhp88/HeJjI/xBknB9qt1h8ixxe1ADGh6gXA2TJHAX4Tskg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5/EVy2y/cKl5BwF5LVNd8IRbGW7QCh5PMpj+3xj+qWU=;
	b=gm61C5owFdq9jVcj3IbjCXlrd1TNxLVdbOnvSQdvJg+V/5EbcV5+RKClatcgzYqetnLOY++bin8caU6zblA5wDkL3PkMLAUL4emVnu2F7m+ejZ0M1aXcZcbKPJjF+BLuCjE+khbS7+sWdizlu1P4Ney3rtjLJCDxNysnODi/c+kgrqKwXNC8vkVhFyBUJaAKpy2kz8MixWHBxHpctiIITqnY/wJkt4grFniQBYEKbqMKcjlmFkgSjdOQei0X6/KmRt1IrchuROd6MRI8rSwQBPgL6WjejHWJlcE5SLBZu6Dn1pa7MocpQfbnv08ojnJnklQ6siLwxFcYy1Q19RIowQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	149.199.60.83) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
	header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5/EVy2y/cKl5BwF5LVNd8IRbGW7QCh5PMpj+3xj+qWU=;
	b=oH+7IjbwGBDLvfokImwEzzIvs5DPhdqWJ3w42KIVG+eFWnfgLbfOtQi2dCQ072qTXv2jVwA+Ze6Baip7AYU6AlfovaaW1Fy0s465g72fKXx1Y+am7uZ0AwQ5y/+RkIq5sLeDQBgHk9umi/b9yO5sPdGfyuoy9HZG6jbeYEYb+Pg=
Received: from CH2PR02CA0025.namprd02.prod.outlook.com (2603:10b6:610:4e::35)
	by DM6PR02MB4410.namprd02.prod.outlook.com (2603:10b6:5:29::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.23;
	Fri, 4 Oct 2019 22:52:42 +0000
Received: from BL2NAM02FT041.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::206) by CH2PR02CA0025.outlook.office365.com
	(2603:10b6:610:4e::35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.20 via
	Frontend Transport; Fri, 4 Oct 2019 22:52:42 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT041.mail.protection.outlook.com (10.152.77.122) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2327.21
	via Frontend Transport; Fri, 4 Oct 2019 22:52:42 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1iGWRF-0003xk-R4
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Oct 2019 15:52:41 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1iGWRA-0004e3-NN
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Oct 2019 15:52:36 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x94MqVgB019670; Fri, 4 Oct 2019 15:52:31 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1iGWR5-0004dD-1K; Fri, 04 Oct 2019 15:52:31 -0700
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Oct 2019 15:52:29 -0700
Message-Id: <1570229549-6684-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(39860400002)(199004)(189003)(4326008)(2351001)(50466002)(336012)(7696005)(48376002)(26005)(2361001)(426003)(9786002)(51416003)(107886003)(14444005)(186003)(36756003)(126002)(486006)(476003)(2616005)(316002)(36386004)(305945005)(2906002)(8676002)(6916009)(356004)(81156014)(106002)(47776003)(478600001)(16586007)(5660300002)(70586007)(70206006)(50226002)(81166006)(8936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB4410; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 551b047c-2d0a-4039-9288-08d7491d90b5
X-MS-TrafficTypeDiagnostic: DM6PR02MB4410:
X-Microsoft-Antispam-PRVS: <DM6PR02MB4410B72C57C00084DC32F83EB09E0@DM6PR02MB4410.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 018093A9B5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o/fuENvhaak/Q8UHoBVErYCty6HOP78RsBdVlxcREDeF+KpSIofQFN86CBv+5G8XUnlMayC2WdZQDf1tHbFpy6KZ0bATP8F+LVj38zs0P6VuNYlnoMZ4dwn3CbfY8ambzZHEb8q10DyGaVxN29y9/QOULv/zkGbKxdE/72ZnOXDoRczttTSlB8p1n9UwJ2ccZdCpyZn/zaF36Fu6uOgkhc+XNEtjpbeJBB36umI6CAl+LgzCXNn9sN1PwX57mO2pCPeDIt9eYBOsYyl0A+H5EjSitlctQyev0pUlaNp/ktF2F9ut5in/8P3nfFWGLsVvhlVgv8OfT6tHKj51bZQD+0auuGUTzhy8KXklJug+UkPLzFdjhzrmlV+m7SEyYSEiVr6hMPujXxDANzD6BIq25avq2uGkafHr0773Gulo2gs=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2019 22:52:42.4500 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 551b047c-2d0a-4039-9288-08d7491d90b5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4410
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [master][PATCH] devtool: Add --remove-work option for devtool reset command
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
X-List-Received-Date: Fri, 04 Oct 2019 22:52:43 -0000
Content-Type: text/plain

Enable --remove-work option for devtool reset command that allows user
to clean up source directory within workspace.

Currently devtool reset command only removes recipes and user is forced
to manually remove the sources directory within the workspace before
running devtool modify again.

Using devtool reset -r or devtool reset --remove-work option, user can
cleanup the sources directory along with the recipe instead of manually
cleaning it.

syntax: devtool reset -r <recipename>
    Ex: devtool reset -r zip

	devtool finish -r <recipename> <layer-name>
    Ex: devtool finish -r zip meta-yocto-bsp

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
 scripts/lib/devtool/standard.py | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 60c9a04..1c0cd8a 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1852,7 +1852,7 @@ def status(args, config, basepath, workspace):
     return 0
 
 
-def _reset(recipes, no_clean, config, basepath, workspace):
+def _reset(recipes, no_clean, remove_work, config, basepath, workspace):
     """Reset one or more recipes"""
     import oe.path
 
@@ -1930,10 +1930,15 @@ def _reset(recipes, no_clean, config, basepath, workspace):
         srctreebase = workspace[pn]['srctreebase']
         if os.path.isdir(srctreebase):
             if os.listdir(srctreebase):
-                # We don't want to risk wiping out any work in progress
-                logger.info('Leaving source tree %s as-is; if you no '
-                            'longer need it then please delete it manually'
-                            % srctreebase)
+                    if remove_work:
+                        logger.info('-r argument used on %s, removing source tree.'
+                                    ' You will lose any unsaved work' %pn)
+                        shutil.rmtree(srctreebase)
+                    else:
+                        # We don't want to risk wiping out any work in progress
+                        logger.info('Leaving source tree %s as-is; if you no '
+                                    'longer need it then please delete it manually'
+                                    % srctreebase)
             else:
                 # This is unlikely, but if it's empty we can just remove it
                 os.rmdir(srctreebase)
@@ -1943,6 +1948,10 @@ def _reset(recipes, no_clean, config, basepath, workspace):
 def reset(args, config, basepath, workspace):
     """Entry point for the devtool 'reset' subcommand"""
     import bb
+    import shutil
+
+    recipes = ""
+
     if args.recipename:
         if args.all:
             raise DevtoolError("Recipe cannot be specified if -a/--all is used")
@@ -1957,7 +1966,7 @@ def reset(args, config, basepath, workspace):
     else:
         recipes = args.recipename
 
-    _reset(recipes, args.no_clean, config, basepath, workspace)
+    _reset(recipes, args.no_clean, args.remove_work, config, basepath, workspace)
 
     return 0
 
@@ -2009,6 +2018,7 @@ def finish(args, config, basepath, workspace):
             raise DevtoolError('Source tree is not clean:\n\n%s\nEnsure you have committed your changes or use -f/--force if you are sure there\'s nothing that needs to be committed' % dirty)
 
     no_clean = args.no_clean
+    remove_work=args.remove_work
     tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
     try:
         rd = parse_recipe(config, tinfoil, args.recipename, True)
@@ -2160,7 +2170,7 @@ def finish(args, config, basepath, workspace):
     if args.dry_run:
         logger.info('Resetting recipe (dry-run)')
     else:
-        _reset([args.recipename], no_clean=no_clean, config=config, basepath=basepath, workspace=workspace)
+        _reset([args.recipename], no_clean=no_clean, remove_work=remove_work, config=config, basepath=basepath, workspace=workspace)
 
     return 0
 
@@ -2272,6 +2282,7 @@ def register_commands(subparsers, context):
     parser_reset.add_argument('recipename', nargs='*', help='Recipe to reset')
     parser_reset.add_argument('--all', '-a', action="store_true", help='Reset all recipes (clear workspace)')
     parser_reset.add_argument('--no-clean', '-n', action="store_true", help='Don\'t clean the sysroot to remove recipe output')
+    parser_reset.add_argument('--remove-work', '-r', action="store_true", help='Clean the sources directory along with append')
     parser_reset.set_defaults(func=reset)
 
     parser_finish = subparsers.add_parser('finish', help='Finish working on a recipe in your workspace',
@@ -2282,6 +2293,7 @@ def register_commands(subparsers, context):
     parser_finish.add_argument('--mode', '-m', choices=['patch', 'srcrev', 'auto'], default='auto', help='Update mode (where %(metavar)s is %(choices)s; default is %(default)s)', metavar='MODE')
     parser_finish.add_argument('--initial-rev', help='Override starting revision for patches')
     parser_finish.add_argument('--force', '-f', action="store_true", help='Force continuing even if there are uncommitted changes in the source tree repository')
+    parser_finish.add_argument('--remove-work', '-r', action="store_true", help='Clean the sources directory under workspace')
     parser_finish.add_argument('--no-clean', '-n', action="store_true", help='Don\'t clean the sysroot to remove recipe output')
     parser_finish.add_argument('--no-overrides', '-O', action="store_true", help='Do not handle other override branches (if they exist)')
     parser_finish.add_argument('--dry-run', '-N', action="store_true", help='Dry-run (just report changes instead of writing them)')
-- 
2.7.4


