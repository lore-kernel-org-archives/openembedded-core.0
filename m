Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 35853 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Jul 2019 04:58:34 UTC
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr730044.outbound.protection.outlook.com [40.107.73.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4A9CA7F091
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 04:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=k2W8s9i+a2VgznH/ld/N2u4AknxZLuHYfysyumJp4a8=;
	b=0T+qahjYRqQfYKzmTuXIvBd+oAOCkG/zv3pImtgv2P9uaQMebX0ApiafDAEw+uxlUthKm4FC6dXoOWyBKJbridn5FSbwmuMjnCPAEpfYrgAk+nqwFESrY1/VzFhX/Bq1gl8nL8yvL1hNOKRFLtnb2oaT5nfxFznQ2I5MJejjI+Y=
Received: from CY4PR02CA0026.namprd02.prod.outlook.com (2603:10b6:903:117::12)
	by CY4PR02MB2375.namprd02.prod.outlook.com (2603:10b6:903:c::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.18;
	Wed, 10 Jul 2019 18:27:50 +0000
Received: from SN1NAM02FT012.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::200) by CY4PR02CA0026.outlook.office365.com
	(2603:10b6:903:117::12) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.19 via
	Frontend Transport; Wed, 10 Jul 2019 18:27:49 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT012.mail.protection.outlook.com (10.152.72.95) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2032.15
	via Frontend Transport; Wed, 10 Jul 2019 18:27:49 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:50515
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1hlHJl-0004Wa-1b
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Jul 2019 11:27:49 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1hlHJf-00053w-Tt
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Jul 2019 11:27:43 -0700
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x6AIRZjG005422; Wed, 10 Jul 2019 11:27:35 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1hlHJX-00053K-8d; Wed, 10 Jul 2019 11:27:35 -0700
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2019 11:27:32 -0700
Message-Id: <1562783254-14818-2-git-send-email-chandana.kalluri@xilinx.com>
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
	SFS:(10009020)(4636009)(39860400002)(396003)(346002)(376002)(136003)(2980300002)(189003)(199004)(486006)(476003)(14444005)(2616005)(15650500001)(106002)(16586007)(51416003)(7696005)(2361001)(6916009)(54906003)(76176011)(126002)(8676002)(186003)(316002)(47776003)(81166006)(26005)(8936002)(81156014)(426003)(305945005)(36756003)(446003)(2351001)(5660300002)(2906002)(11346002)(107886003)(478600001)(9786002)(48376002)(70586007)(356004)(6666004)(50226002)(50466002)(4326008)(336012)(36386004)(70206006)(63266004)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB2375; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e312b80f-3419-4c37-8631-08d70564502d
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);
	SRVR:CY4PR02MB2375; 
X-MS-TrafficTypeDiagnostic: CY4PR02MB2375:
X-Microsoft-Antispam-PRVS: <CY4PR02MB23750B887EE55089F726619EB0F00@CY4PR02MB2375.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:136;
X-Forefront-PRVS: 0094E3478A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: TbAIfCDdgVyP3idFmALG+/E3nB+9wfm0W49R9StgfZYJJMAownB+/adE9z67lc3rrg1KNY5qQoMQbJy/iLLJCDBgqH4ifhE0+hmoYcl/F83FZ60TU78jvR85QDVzKkhlQIBRylGF1c7/R8mpKx3RujTgcoGJUbKAff0pwU3Vxy/0i9sQrySS2qUhlIlq2nXUzoLM3T3D6tCwjGeDfvNu/UvJWf8r8BZRXMQwFIbnHAXDzenyDRPEBPXNxsww7Rm+/ImOMDgkXmXwBFXstWkPpZb3WKZWlUG2y2b2AfDlnrCsudCgIT6Q++x8RIecR0Lfc6QNl2ePKXOCJkCrVkhCrgPVlT2o1hPCCZVZUz2/WUYtdBa0lQPRNkcj/5W7x9L+QRFi9Xio4uDu0iSFojKIJz2E4oJmj6x4uGmVJsZ8xjI=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2019 18:27:49.4382 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e312b80f-3419-4c37-8631-08d70564502d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2375
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [master][PATCH 1/3] devtool/standard.py: Update devtool modify to copy source from work-shared if its already downloaded
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
X-List-Received-Date: Thu, 11 Jul 2019 04:58:34 -0000
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
 scripts/lib/devtool/standard.py | 122 ++++++++++++++++++++++++++++++++--------
 1 file changed, 99 insertions(+), 23 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 47ed531..2ac14b8 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -461,6 +461,31 @@ def sync(args, config, basepath, workspace):
     finally:
         tinfoil.shutdown()
 
+def symlink_oelocal_files_srctree(rd,srctree):
+   import oe.patch
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
+         oe.patch.GitApplyTree.gitCommandUserOptions(useroptions, d=rd)
+         bb.process.run('git %s commit -a -m "Committing local file symlinks\n\n%s"' % (' '.join(useroptions), oe.patch.GitApplyTree.ignore_commit_prefix), cwd=srctree)
+
 
 def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, workspace, fixed_setup, d, tinfoil, no_overrides=False):
     """Extract sources of a recipe"""
@@ -617,29 +642,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
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
+            symlink_oelocal_files_srctree(d,srctree)
 
         if is_kernel_yocto:
             logger.info('Copying kernel config to srctree')
@@ -707,11 +710,31 @@ def _check_preserve(config, recipename):
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
@@ -753,6 +776,59 @@ def modify(args, config, basepath, workspace):
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
+                  symlink_oelocal_files_srctree(rd,srctree)
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


