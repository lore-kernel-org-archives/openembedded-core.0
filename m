Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 46915 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 19 Apr 2019 01:17:46 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr790058.outbound.protection.outlook.com [40.107.79.58])
	by mail.openembedded.org (Postfix) with ESMTP id 19873600B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 01:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bPJ3g5T/EJRlCUlXtI3ZoQGVaLLHdGf+SAGoO0yPyic=;
	b=QvcU39tphfIoXulJ1WsPGuaWsymj7iBvy/w4nS5O6XN/krJoONblZNDX8FiVNp3NP1g7u/egX1oelZYJ+HaJk0haPDeBxFSUtE21vMQYXT6tKnrYMkuiNn93MSAGh4N1WjsNz1EgjWTbjfA8Yous4Scqn3kUAASpU6KxZEJVosA=
Received: from SN4PR0201CA0061.namprd02.prod.outlook.com
	(2603:10b6:803:20::23) by MW2PR02MB3834.namprd02.prod.outlook.com
	(2603:10b6:907:4::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1792.19;
	Wed, 17 Apr 2019 22:43:11 +0000
Received: from BL2NAM02FT016.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::205) by SN4PR0201CA0061.outlook.office365.com
	(2603:10b6:803:20::23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1813.12 via
	Frontend Transport; Wed, 17 Apr 2019 22:43:10 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT016.mail.protection.outlook.com (10.152.77.171) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1771.16
	via Frontend Transport; Wed, 17 Apr 2019 22:43:10 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1hGtGn-0003hC-Ut
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2019 15:43:09 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1hGtGi-0003j6-Rb
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2019 15:43:04 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1hGtGe-0003h6-G7; Wed, 17 Apr 2019 15:43:00 -0700
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Apr 2019 15:42:57 -0700
Message-ID: <1555540979-27879-2-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555540979-27879-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1555540979-27879-1-git-send-email-chandana.kalluri@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(136003)(396003)(376002)(346002)(2980300002)(199004)(189003)(107886003)(47776003)(5660300002)(186003)(478600001)(6666004)(356004)(6916009)(48376002)(77096007)(316002)(476003)(2351001)(50226002)(15650500001)(305945005)(76176011)(126002)(8936002)(81156014)(81166006)(106002)(8676002)(16586007)(50466002)(9786002)(486006)(2906002)(426003)(11346002)(446003)(36756003)(26005)(336012)(51416003)(2616005)(4326008)(7696005)(63266004)(54906003)(36386004)(14444005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR02MB3834; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddb8c74b-e3df-4d37-b8e4-08d6c386119a
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4709054)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
	SRVR:MW2PR02MB3834; 
X-MS-TrafficTypeDiagnostic: MW2PR02MB3834:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <MW2PR02MB383413D6C6CDD4D57AC74056B0250@MW2PR02MB3834.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0010D93EFE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: gHygc9baYO99NeevbszUOs9Rkco6c2zvg4zjuFHxU/esY9VQJG7jnQ5KgZG98erOyAG2l78SRhlXolJJ3KkAfYnidz7dlKIcUOdztp94xQB3EZow+8oe3Y7791oeUpLFaBVRdokokxxEq2LHuqf27T3EE4+ZpSKkmGRPDRwS6w6U4i88fkGnPtsgkSGcW6Ovcv9f7H9/Z7Uym5H9j0DAdKm2f8t+aCHP8lpBEABtoSVpg2QVU4VYKNRgkR+YmXPZYtWfYZfDcigdjjrTlxfTtiCH8k3kAR6QdMpr0PXk5tl4cuSFQb0kvMd1vJsyyKeBNFFVE8oa0Cpw86j4OAvs7/gWE+8Vv715k6gRrxU5PmDYXaKKfwxtzVOBbUSyXZ6IoZffjmra9z50QZ53Q3cVHKbmf3iaSbq4x6wl4JTxTic=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2019 22:43:10.4797 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddb8c74b-e3df-4d37-b8e4-08d6c386119a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3834
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [master][PATCH v4 1/3] devtool/standard.py: Update devtool modify to copy source from work-shared if its already downloaded
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
X-List-Received-Date: Fri, 19 Apr 2019 01:17:47 -0000
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
 scripts/lib/devtool/standard.py | 121 ++++++++++++++++++++++++++++++++--------
 1 file changed, 98 insertions(+), 23 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 0a1e329..33193f8 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -471,6 +471,30 @@ def sync(args, config, basepath, workspace):
     finally:
         tinfoil.shutdown()
 
+def symblink_oelocal_files_srctree(rd,srctree):
+   if os.path.abspath(rd.getVar('S')) == os.path.abspath(rd.getVar('WORKDIR')):
+   # If recipe extracts to ${WORKDIR}, symlink the files into the srctree
+   # (otherwise the recipe won't build as expected)
+         local_files_dir = os.path.join(srctree, 'oe-local-files')
+         addfiles = []
+         for root, _, files in os.walk(local_files_dir):
+             relpth = os.path.relpath(root, local_files_dir)
+             if relpth != '.':
+                   bb.utils.mkdirhier(os.path.join(srctree, relpth))
+             for fn in files:
+                 if fn == '.gitignore':
+                     continue
+                 destpth = os.path.join(srctree, relpth, fn)
+                 if os.path.exists(destpth):
+                     os.unlink(destpth)
+                 os.symlink('oe-local-files/%s' % fn, destpth)
+                 addfiles.append(os.path.join(relpth, fn))
+         if addfiles:
+            bb.process.run('git add %s' % ' '.join(addfiles), cwd=srctree)
+         useroptions = []
+         oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=d)
+         bb.process.run('git %s commit -a -m "Committing local file symlinks\n\n%s"' % (' '.join(useroptions), oe.patch.GitApplyTree.ignore_commit_prefix), cwd=srctree)
+
 
 def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, workspace, fixed_setup, d, tinfoil, no_overrides=False):
     """Extract sources of a recipe"""
@@ -627,29 +651,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
                 shutil.move(tempdir_localdir, srcsubdir)
 
             shutil.move(srcsubdir, srctree)
-
-            if os.path.abspath(d.getVar('S')) == os.path.abspath(d.getVar('WORKDIR')):
-                # If recipe extracts to ${WORKDIR}, symlink the files into the srctree
-                # (otherwise the recipe won't build as expected)
-                local_files_dir = os.path.join(srctree, 'oe-local-files')
-                addfiles = []
-                for root, _, files in os.walk(local_files_dir):
-                    relpth = os.path.relpath(root, local_files_dir)
-                    if relpth != '.':
-                        bb.utils.mkdirhier(os.path.join(srctree, relpth))
-                    for fn in files:
-                        if fn == '.gitignore':
-                            continue
-                        destpth = os.path.join(srctree, relpth, fn)
-                        if os.path.exists(destpth):
-                            os.unlink(destpth)
-                        os.symlink('oe-local-files/%s' % fn, destpth)
-                        addfiles.append(os.path.join(relpth, fn))
-                if addfiles:
-                    bb.process.run('git add %s' % ' '.join(addfiles), cwd=srctree)
-                useroptions = []
-                oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=d)
-                bb.process.run('git %s commit -a -m "Committing local file symlinks\n\n%s"' % (' '.join(useroptions), oe.patch.GitApplyTree.ignore_commit_prefix), cwd=srctree)
+            symblink_oelocal_files_srctree(d,srctree)
 
         if is_kernel_yocto:
             logger.info('Copying kernel config to srctree')
@@ -717,11 +719,31 @@ def _check_preserve(config, recipename):
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
@@ -763,6 +785,59 @@ def modify(args, config, basepath, workspace):
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
+                  symblink_oelocal_files_srctree(rd,srctree)
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


