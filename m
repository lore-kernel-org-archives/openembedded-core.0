Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 18084 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 29 Mar 2019 15:26:31 UTC
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr710051.outbound.protection.outlook.com [40.107.71.51])
	by mail.openembedded.org (Postfix) with ESMTP id D4F037D035
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 15:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=T1xATLM5TOEvqCFRq+jVS56D36Y6J38/3L0+YQYaze0=;
	b=XRIuZ7cgW/IszVVAIkuLf8WXE4JSse5VzusJgKAJdT4Q6N7qa1vgscw3JutIFbPJau5FIl5k1t4HMnovLwsOZHJan8QAl/qKpgYVtHlQmcajTsEWCH0w62a0plwRtaJtZKBF9mPCNy/IH3X+FU0e3/OmZitXAMApo2je5kfGGBQ=
Received: from MWHPR02CA0028.namprd02.prod.outlook.com (2603:10b6:301:60::17)
	by MWHPR0201MB3404.namprd02.prod.outlook.com (2603:10b6:301:76::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1750.15;
	Thu, 28 Mar 2019 18:55:35 +0000
Received: from CY1NAM02FT019.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::208) by MWHPR02CA0028.outlook.office365.com
	(2603:10b6:301:60::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1750.15 via
	Frontend Transport; Thu, 28 Mar 2019 18:55:35 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT019.mail.protection.outlook.com (10.152.75.177) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1750.16
	via Frontend Transport; Thu, 28 Mar 2019 18:55:35 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:41904
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1h9aBa-0004TE-N1
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2019 11:55:34 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1h9aBV-0007Ob-Jd
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2019 11:55:29 -0700
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may
	be forged))
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x2SItSFE030846; Thu, 28 Mar 2019 11:55:28 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1h9aBU-0007OK-JO; Thu, 28 Mar 2019 11:55:28 -0700
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Mar 2019 11:55:19 -0700
Message-ID: <1553799321-17585-2-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553799321-17585-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1553799321-17585-1-git-send-email-chandana.kalluri@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(136003)(346002)(396003)(39850400004)(2980300002)(199004)(189003)(6666004)(356004)(2906002)(36756003)(15650500001)(50226002)(478600001)(8936002)(36386004)(2351001)(6916009)(107886003)(5660300002)(476003)(106466001)(50466002)(4326008)(63266004)(7696005)(2616005)(486006)(16586007)(11346002)(81156014)(8676002)(305945005)(186003)(54906003)(51416003)(48376002)(316002)(77096007)(446003)(14444005)(126002)(9786002)(426003)(26005)(106002)(76176011)(336012)(81166006)(47776003)(42866002)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0201MB3404;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; A:1; MX:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60488334-dfd7-46de-6f66-08d6b3aef607
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4709054)(2017052603328)(7153060);
	SRVR:MWHPR0201MB3404; 
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3404:|MWHPR0201MB3404:|MWHPR0201MB3404:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <MWHPR0201MB34040F33CED1193B7ABB5930B0590@MWHPR0201MB3404.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0990C54589
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: iKxOc3aq+awO9lA7A/otAx5iqZ2/zhsB8plaQAI7r4FzpzG2mXWPA3a0rNDOv95PzgQpUe4LrBO5tVd5nJdGMbbPHQKujWBLlWKoxLzDDsnBcGQC4eDziEUGo9U0LqpSysQzbqukOCIi5rWrp1TDZm01oQroyd0o9A99tiNcoW+njPTx8z9ws3qz7C5n3I1WQZOk16V7V/z9fJ3NURSgWQnLwOxYb8ZQagmiEghf+HJ7sm7lkPQuCalQfjYjmK4dGIPCu2803HWelYI5ItAzbqTJ0qwuZmivJqH1RTEfOsI/xGtX/j95Y3UEy02Uon7av3HF4Tq7i8/ilHxqFMoe/HhGTEWZO/hl189P6vFWpVZp84TWaMOQtAAfc1Pw9mMAnfAfDNw/djlmrYtCTJoSee1y9tOiTJIukBquiRAQklw=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2019 18:55:35.1096 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60488334-dfd7-46de-6f66-08d6b3aef607
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3404
X-OriginatorOrg: xilinx.com
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [master][PATCH v3 1/3] devtool/standard.py: Update devtool modify to copy source from work-shared if its already downloaded
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
X-List-Received-Date: Fri, 29 Mar 2019 15:26:33 -0000
Content-Type: text/plain

In the regular devtool modify flow, the kernel source is fetched by
running do_fetch task. This is an overhead in time and space.

This patch updates modify command to check if the kernel source is
already downloaded. If so, then instead of calling do_fetch, copy the
source from work-shared to devtool workspace by creating hard links
else run the usual devtool modify flow and call do_fetch task.

[YOCTO #10416]

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 scripts/lib/devtool/standard.py | 94 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index ea09bbf..2338135 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -717,11 +717,31 @@ def _check_preserve(config, recipename):
                     tf.write(line)
     os.rename(newfile, origfile)
 
+def get_staging_kver(srcdir):
+     #Kernel version from work-shared
+     kerver = []
+     staging_kerVer=""
+     if os.path.exists(srcdir) and os.listdir(srcdir):
+            with open(os.path.join(srcdir,"Makefile")) as f:
+                 version = [next(f) for x in range(5)][1:4]
+                 for word in version:
+                       kerver.append(word.split('= ')[1].split('\n')[0])
+                 staging_kerVer = ".".join(kerver)
+     return staging_kerVer
+
+def get_staging_kbranch(srcdir):
+      staging_kbranch = ""
+      if os.path.exists(srcdir) and os.listdir(srcdir):
+          (branch, _) = bb.process.run('git branch | grep \* | cut -d \' \' -f2', cwd=srcdir)
+          staging_kbranch = "".join(branch.split('\n')[0])
+      return staging_kbranch
+
 def modify(args, config, basepath, workspace):
     """Entry point for the devtool 'modify' subcommand"""
     import bb
     import oe.recipeutils
     import oe.patch
+    import oe.path
 
     if args.recipename in workspace:
         raise DevtoolError("recipe %s is already in your workspace" %
@@ -763,6 +783,80 @@ def modify(args, config, basepath, workspace):
         initial_rev = None
         commits = []
         check_commits = False
+
+        if bb.data.inherits_class('kernel-yocto', rd):
+               #Current set kernel version
+               kernelVersion = rd.getVar('LINUX_VERSION')
+               srcdir = rd.getVar('STAGING_KERNEL_DIR')
+               kbranch = rd.getVar('KBRANCH')
+
+               staging_kerVer = get_staging_kver(srcdir)
+               staging_kbranch = get_staging_kbranch(srcdir)
+               if (os.path.exists(srcdir) and os.listdir(srcdir)) and (kernelVersion in staging_kerVer and staging_kbranch == kbranch):
+                  oe.path.copyhardlinktree(srcdir,srctree)
+                  workdir = rd.getVar('WORKDIR')
+                  srcsubdir = rd.getVar('S')
+                  localfilesdir = os.path.join(srctree,'oe-local-files') 
+                  # Move local source files into separate subdir
+                  recipe_patches = [os.path.basename(patch) for patch in oe.recipeutils.get_recipe_patches(rd)]
+                  local_files = oe.recipeutils.get_recipe_local_files(rd)
+
+                  for key in local_files.copy():
+                        if key.endswith('scc'):
+                              sccfile = open(local_files[key], 'r')
+                              for l in sccfile:
+                                  line = l.split()
+                                  if line and line[0] in ('kconf', 'patch'):
+                                        cfg = os.path.join(os.path.dirname(local_files[key]), line[-1])
+                                        if not cfg in local_files.values():
+                                            local_files[line[-1]] = cfg
+                                            shutil.copy2(cfg, workdir)
+                              sccfile.close()
+
+                  # Ignore local files with subdir={BP}
+                  srcabspath = os.path.abspath(srcsubdir)
+                  local_files = [fname for fname in local_files if os.path.exists(os.path.join(workdir, fname)) and  (srcabspath == workdir or not  os.path.join(workdir, fname).startswith(srcabspath + os.sep))]
+                  if local_files:
+                       for fname in local_files:
+                              _move_file(os.path.join(workdir, fname), os.path.join(srctree, 'oe-local-files', fname))
+                       with open(os.path.join(srctree, 'oe-local-files', '.gitignore'), 'w') as f:
+                              f.write('# Ignore local files, by default. Remove this file ''if you want to commit the directory to Git\n*\n')
+
+                  if os.path.abspath(rd.getVar('S')) == os.path.abspath(rd.getVar('WORKDIR')):
+                  # If recipe extracts to ${WORKDIR}, symlink the files into the srctree
+                  # (otherwise the recipe won't build as expected)
+                        local_files_dir = os.path.join(srctree, 'oe-local-files')
+                        addfiles = []
+                        for root, _, files in os.walk(local_files_dir):
+                            relpth = os.path.relpath(root, local_files_dir)
+                            if relpth != '.':
+                                  bb.utils.mkdirhier(os.path.join(srctree, relpth))
+                            for fn in files:
+                                if fn == '.gitignore':
+                                    continue
+                                destpth = os.path.join(srctree, relpth, fn)
+                                if os.path.exists(destpth):
+                                    os.unlink(destpth)
+                                os.symlink('oe-local-files/%s' % fn, destpth)
+                                addfiles.append(os.path.join(relpth, fn))
+                        if addfiles:
+                           bb.process.run('git add %s' % ' '.join(addfiles), cwd=srctree)
+                        useroptions = []
+                        oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=d)
+                        bb.process.run('git %s commit -a -m "Committing local file symlinks\n\n%s"' % (' '.join(useroptions), oe.patch.GitApplyTree.ignore_commit_prefix), cwd=srctree)
+
+                  task = 'do_configure'
+                  res = tinfoil.build_targets(pn, task, handle_events=True)
+
+                  # Copy .config to workspace 
+                  kconfpath=rd.getVar('B')
+                  logger.info('Copying kernel config to workspace')
+                  shutil.copy2(os.path.join(kconfpath, '.config'),srctree)
+
+                  # Set this to true, we still need to get initial_rev
+                  # by parsing the git repo
+                  args.no_extract = True
+
         if not args.no_extract:
             initial_rev, _ = _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
             if not initial_rev:
-- 
2.7.4


