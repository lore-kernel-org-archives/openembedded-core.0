Return-Path: <ckalluri@xilinx.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr780040.outbound.protection.outlook.com [40.107.78.40])
	by mail.openembedded.org (Postfix) with ESMTP id E247E7E66A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 18:35:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=nMfiXSxBL063p6A7Ux8B7hMqfh5oWHhtwRU3WHItRpWlhp15p+v5kr0KvUKaqUNT0R6p7B9VyuE9skcFuAIS3C4FZQ3EvJvzpvkxOQHwy3y3ZNbF8sVKtfi6+rdnVRpnvCROSqS8BeiFGlWKd1TZUnsMZreoUQFpEqmY8sZYj+cz/kCGYt16f/FtWLXZcbcbo5AQe4qnyCi1IbjUoFhmw3Y9LMosiQO0DCTQhcY72Jn2DPmCSGlS6gTpZ2EtnqnhBZFix0T/34bMRxDeyg6lxxqYiNTalNQCB/jYHaUhlUjumc6Gy1nzsjteZE6aGGMY7Z6OsEQFRqOHMjT2OQUxaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5/EVy2y/cKl5BwF5LVNd8IRbGW7QCh5PMpj+3xj+qWU=;
	b=aVKmrR4Bm6GYXPjUuRGK52qAcMdBD05VEN+1OcODctYkjmyEE//wP7fDSuCQaX7sswq/8o8TMBGdo3dn+BYnFeM3NOQUgV4hOB5U40+sEk52/TSf7r7IOnpA6ZtM4SsFLu6sp2zF7+ZoKx4CFtSZRLWlDWHCtLtLO2l5JIaesZefktGzO/DlYX0isDWeMr7quir+cyxDJ+6zc0s7p78PdOZfYxoAxS7quDJnALZGgpbwnzIa317sXWEVCbinSez6v5FuZWraavj+L/C4w6cjuv+XqLqUA54ZzCqX0MUPHQ2HGFItb0MvLLp3Pt1HzQMXVppe1BH0k6CjQUHdI01JDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	149.199.60.83) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
	header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5/EVy2y/cKl5BwF5LVNd8IRbGW7QCh5PMpj+3xj+qWU=;
	b=hp45H2viEbr3ci0GpZGk5X2SmTuqZQdDHCETxk7er1E0q2qhI1sGEhbenx+nfQpdeSc2Qn6AFe50nRlv6aqrpVPgTAsUPWd2tIJmHfNeJqe0SjflZ3sZyIDNRqSNbOSi09boi5BcliiERwXN2z3xpwXC/jrSpMYOysby9DN5tZI=
Received: from DM6PR02CA0078.namprd02.prod.outlook.com (2603:10b6:5:1f4::19)
	by DM6PR02MB5324.namprd02.prod.outlook.com (2603:10b6:5:47::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.23;
	Mon, 7 Oct 2019 18:35:58 +0000
Received: from SN1NAM02FT052.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::209) by DM6PR02CA0078.outlook.office365.com
	(2603:10b6:5:1f4::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.19 via
	Frontend Transport; Mon, 7 Oct 2019 18:35:58 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT052.mail.protection.outlook.com (10.152.72.146) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2327.21
	via Frontend Transport; Mon, 7 Oct 2019 18:35:58 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1iHXrR-0003PG-Uo
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Oct 2019 11:35:57 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1iHXrM-00069K-RO
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Oct 2019 11:35:52 -0700
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may
	be forged))
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x97IZpXM015416; Mon, 7 Oct 2019 11:35:51 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1iHXrL-00069F-8p; Mon, 07 Oct 2019 11:35:51 -0700
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 11:35:50 -0700
Message-Id: <1570473350-6427-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(136003)(346002)(396003)(39860400002)(376002)(189003)(199004)(2906002)(70586007)(70206006)(26005)(186003)(51416003)(48376002)(426003)(2361001)(106002)(2351001)(9786002)(5660300002)(8936002)(107886003)(7696005)(50226002)(316002)(356004)(81166006)(81156014)(8676002)(4326008)(2616005)(486006)(16586007)(50466002)(476003)(126002)(47776003)(14444005)(336012)(6916009)(305945005)(478600001)(36386004)(36756003)(42866002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB5324; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f7b200a-1df4-4df8-2040-08d74b553251
X-MS-TrafficTypeDiagnostic: DM6PR02MB5324:
X-Microsoft-Antispam-PRVS: <DM6PR02MB53248C05E5810186859ACE9DB09B0@DM6PR02MB5324.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 01834E39B7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MGGaikdmaZrdfIfxiI0itPE72KfbgRh9h+PkCGr5QwTLsnSYXpO9FNhC6XS8SLzCwep+VzOnuQaZUDZEHtLe3Iu1VB8zUfLXsz6dHQP/EX6k/IshK4+mAEbJq0SgbaqR4CNtA+/CA+/JeePONq9ZvO4L3InCoG6V4wC3BLmHXRny1SOSrATJj85a/3fVZx4Th8JbwP3l8HBJsgNr4ME6E+lJhi7Uplv8ovrjhn8/XcPPmaLzJKJRqoqpb1pXvmZ5tGfCyu+WMXxrgXMLzw84GiLFopZxfwJYchlbEXGfssxcHpkKa4dd+S6DxVHZ0Ix40ckdaBaLlwtmJnUnFpA7Mgvcvbp7W2c2qfAa6xvgacgOuMRPwRwpLuwutdOjiDsKuu+e8EqzpXfb10RIAvlE5H3LYHTG5VthP1SoEHHtZyU=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2019 18:35:58.3204 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7b200a-1df4-4df8-2040-08d74b553251
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5324
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
X-List-Received-Date: Mon, 07 Oct 2019 18:35:59 -0000
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


