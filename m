Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0AE237D946
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:36 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q1so2937633wrp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=rA/J6hR2j1YK98AduIlbHS2GkB7hKwvDF1CjrLksUvo=;
	b=uOk+HVLAnlcaavh1u2ANDlJhv6Az6nbkRPvZ34hX0toyS2LyYDCsKrvZu4vQaB7Td1
	4+0iW58o4rG8z7zbVWgfDZebrNrxcjY5xO1BX8jKQdtrKblGeQ3fsV5j5FbjXjlvstMa
	vG2H0g5UgqqtzLF9reqNSUsg/EYRpzyccN6nnZy/dZtt9uwEHJxUCqd+XsdYFkYpo7W1
	wGimIBAtFWsfGQFKsj7x/KKTBbHptwHKORUi4r2zwsFeDGgE1/6rtPSzD4PfjvOb8Mzs
	k+ClnO3RitAQSNdWMS0YgjX7GRTymFStibaX21Hn2z/moQw9C8AD3K6A8x6g4xbqABgf
	h0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rA/J6hR2j1YK98AduIlbHS2GkB7hKwvDF1CjrLksUvo=;
	b=EpKbOsp293Vrv0UDyA1lvoG6SrMzxGnYmwozq+rA+37xWsesYo7iUWN2IUts5Ad+oh
	gzAoJDJExclDgJs9nCz16cxDly/wAcJVNWCXpLTn/JCtVVxpojS+J51/R5KcDgKP1FbZ
	+f5mFMS1U0hKt64+uKY45Jvijl4sYO+OvwkoVdXzacthQg8ril693BxRiHeMJuh9yR4Z
	COaEz83jk8enfoPYuOP4hVr5U28zUS3qc2eh3nZAShZql2JSP7/e3ZL12eXhs3MAJoiK
	nRlmcvSk5t7mXTqUw5mlfgH/4KZvt3hzE+V3UgLH8iwk4yxkr05WaUvU+t+VitQTROjc
	ud2w==
X-Gm-Message-State: APjAAAUAvmbCB9FCAf6fgr4vzhZ4MEP0o0eZRrkBoLFM8wx7Hfrc0/Jl
	qvJPXQNB9Q5TDwJwRVUS7gLTH7JeD+E=
X-Google-Smtp-Source: APXvYqxLjth6XNwxoJwoP9YQtxfOFVPiThTq76Adqijoa4bm7j3mg7Qol+dC3OFC+o1BKExRs8aswQ==
X-Received: by 2002:a5d:6947:: with SMTP id r7mr7360524wrw.167.1554901956363; 
	Wed, 10 Apr 2019 06:12:36 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:49 +0530
Message-Id: <cc771aa4b74f222f1bea38b0b50196b2fbc97ab4.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 30/33] logging: use warning instead warn
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:36 -0000

From: Chen Qi <Qi.Chen@windriver.com>

The warn method is deprecated. We should use the documented warning instead.

Quoting from the python's official doc:
"""
Note: There is an obsolete method warn which is functionally identical to warning.
      As warn is deprecated, please do not use it - use warning instead.
"""

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oe/terminal.py               |  6 +++---
 meta/lib/oeqa/selftest/context.py     |  2 +-
 meta/lib/oeqa/utils/qemurunner.py     |  4 ++--
 scripts/combo-layer                   |  2 +-
 scripts/contrib/verify-homepage.py    |  2 +-
 scripts/lib/devtool/export.py         |  2 +-
 scripts/lib/devtool/import.py         |  8 ++++----
 scripts/lib/devtool/standard.py       | 16 ++++++++--------
 scripts/lib/devtool/upgrade.py        |  6 +++---
 scripts/lib/recipetool/append.py      | 14 +++++++-------
 scripts/lib/recipetool/create.py      |  4 ++--
 scripts/lib/recipetool/create_kmod.py |  2 +-
 scripts/lib/recipetool/create_npm.py  |  6 +++---
 scripts/lib/recipetool/newappend.py   |  4 ++--
 scripts/lib/wic/engine.py             |  2 +-
 scripts/runqemu                       | 16 ++++++++--------
 16 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 94afe39..caeb5e3 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -112,7 +112,7 @@ class Screen(Terminal):
             bb.event.fire(bb.event.LogExecTTY(msg, "screen -r %s" % s_id,
                                               0.5, 10), d)
         else:
-            logger.warn(msg)
+            logger.warning(msg)
 
 class TmuxRunning(Terminal):
     """Open a new pane in the current running tmux window"""
@@ -168,7 +168,7 @@ class Tmux(Terminal):
         if d:
             bb.event.fire(bb.event.LogExecTTY(msg, attach_cmd, 0.5, 10), d)
         else:
-            logger.warn(msg)
+            logger.warning(msg)
 
 class Custom(Terminal):
     command = 'false' # This is a placeholder
@@ -180,7 +180,7 @@ class Custom(Terminal):
             if not '{command}' in self.command:
                 self.command += ' {command}'
             Terminal.__init__(self, sh_cmd, title, env, d)
-            logger.warn('Custom terminal was started.')
+            logger.warning('Custom terminal was started.')
         else:
             logger.debug(1, 'No custom terminal (OE_TERMINAL_CUSTOMCMD) set')
             raise UnsupportedTerminal('OE_TERMINAL_CUSTOMCMD not set')
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index da7f26b..cac9869 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -159,7 +159,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
                 os.chdir(builddir)
 
             if not "meta-selftest" in self.tc.td["BBLAYERS"]:
-                self.tc.logger.warn("meta-selftest layer not found in BBLAYERS, adding it")
+                self.tc.logger.warning("meta-selftest layer not found in BBLAYERS, adding it")
                 meta_selftestdir = os.path.join(
                     self.tc.td["BBLAYERS_FETCH_DIR"], 'meta-selftest')
                 if os.path.isdir(meta_selftestdir):
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 27c4901..4864df8 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -393,7 +393,7 @@ class QemuRunner:
                 # qemu-system behaves well and a SIGTERM is enough
                 os.kill(self.qemupid, signal.SIGTERM)
             except ProcessLookupError as e:
-                self.logger.warn('qemu-system ended unexpectedly')
+                self.logger.warning('qemu-system ended unexpectedly')
 
     def stop_thread(self):
         if self.thread and self.thread.is_alive():
@@ -470,7 +470,7 @@ class QemuRunner:
 
     def _dump_host(self):
         self.host_dumper.create_dir("qemu")
-        self.logger.warn("Qemu ended unexpectedly, dump data from host"
+        self.logger.warning("Qemu ended unexpectedly, dump data from host"
                 " is in %s" % self.host_dumper.dump_dir)
         self.host_dumper.dump_host()
 
diff --git a/scripts/combo-layer b/scripts/combo-layer
index d04d88b..dc40e72 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -246,7 +246,7 @@ def action_init(conf, args):
                         # traditional behavior from "git archive" (preserved
                         # here) it to choose the first one. This might not be
                         # intended, so at least warn about it.
-                        logger.warn("%s: initial revision '%s' not unique, picking result of rev-parse = %s" %
+                        logger.warning("%s: initial revision '%s' not unique, picking result of rev-parse = %s" %
                                     (name, initialrev, refs[0]))
                         initialrev = rev
                 except:
diff --git a/scripts/contrib/verify-homepage.py b/scripts/contrib/verify-homepage.py
index 76f1749..cc6e797 100755
--- a/scripts/contrib/verify-homepage.py
+++ b/scripts/contrib/verify-homepage.py
@@ -27,7 +27,7 @@ logger = scriptutils.logger_create('verify_homepage')
 def wgetHomepage(pn, homepage):
     result = subprocess.call('wget ' + '-q -T 5 -t 1 --spider ' + homepage, shell = True)
     if result:
-        logger.warn("%s: failed to verify HOMEPAGE: %s " % (pn, homepage))
+        logger.warning("%s: failed to verify HOMEPAGE: %s " % (pn, homepage))
         return 1
     else:
         return 0
diff --git a/scripts/lib/devtool/export.py b/scripts/lib/devtool/export.py
index 13ee258..35349e2 100644
--- a/scripts/lib/devtool/export.py
+++ b/scripts/lib/devtool/export.py
@@ -84,7 +84,7 @@ def export(args, config, basepath, workspace):
 
     # if all workspace is excluded, quit
     if not len(set(workspace.keys()).difference(set(args.exclude))):
-        logger.warn('All recipes in workspace excluded, nothing to export')
+        logger.warning('All recipes in workspace excluded, nothing to export')
         return 0
 
     exported = []
diff --git a/scripts/lib/devtool/import.py b/scripts/lib/devtool/import.py
index c13a180..4264b7d 100644
--- a/scripts/lib/devtool/import.py
+++ b/scripts/lib/devtool/import.py
@@ -81,7 +81,7 @@ def devimport(args, config, basepath, workspace):
                     break
             else:
                 non_importables.append(fn)
-                logger.warn('No recipe to append %s.bbapppend, skipping' % fn)
+                logger.warning('No recipe to append %s.bbapppend, skipping' % fn)
 
         # Extract
         imported = []
@@ -104,9 +104,9 @@ def devimport(args, config, basepath, workspace):
                         try:
                             tar.extract(member, path=config.workspace_path)
                         except PermissionError as pe:
-                            logger.warn(pe)
+                            logger.warning(pe)
                     else:
-                        logger.warn('File already present. Use --overwrite/-o to overwrite it: %s' % member.name)
+                        logger.warning('File already present. Use --overwrite/-o to overwrite it: %s' % member.name)
                         continue
                 else:
                     tar.extract(member, path=config.workspace_path)
@@ -129,7 +129,7 @@ def devimport(args, config, basepath, workspace):
     if imported:
         logger.info('Imported recipes into workspace %s: %s' % (config.workspace_path, ', '.join(imported)))
     else:
-        logger.warn('No recipes imported into the workspace')
+        logger.warning('No recipes imported into the workspace')
 
     return 0
 
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index a1e8e1d..d14b7a6 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -66,7 +66,7 @@ def add(args, config, basepath, workspace):
             args.srctree = args.recipename
             args.recipename = None
         elif os.path.isdir(args.recipename):
-            logger.warn('Ambiguous argument "%s" - assuming you mean it to be the recipe name' % args.recipename)
+            logger.warning('Ambiguous argument "%s" - assuming you mean it to be the recipe name' % args.recipename)
 
     if not args.fetchuri:
         if args.srcrev:
@@ -82,7 +82,7 @@ def add(args, config, basepath, workspace):
         if args.fetchuri:
             raise DevtoolError('URI specified as positional argument as well as -f/--fetch')
         else:
-            logger.warn('-f/--fetch option is deprecated - you can now simply specify the URL to fetch as a positional argument instead')
+            logger.warning('-f/--fetch option is deprecated - you can now simply specify the URL to fetch as a positional argument instead')
             args.fetchuri = args.fetch
 
     if args.recipename:
@@ -217,7 +217,7 @@ def add(args, config, basepath, workspace):
             raise DevtoolError('Command \'%s\' did not create any recipe file:\n%s' % (e.command, e.stdout))
         attic_recipe = os.path.join(config.workspace_path, 'attic', recipename, os.path.basename(recipefile))
         if os.path.exists(attic_recipe):
-            logger.warn('A modified recipe from a previous invocation exists in %s - you may wish to move this over the top of the new recipe if you had changes in it that you want to continue with' % attic_recipe)
+            logger.warning('A modified recipe from a previous invocation exists in %s - you may wish to move this over the top of the new recipe if you had changes in it that you want to continue with' % attic_recipe)
     finally:
         if tmpsrcdir and os.path.exists(tmpsrcdir):
             shutil.rmtree(tmpsrcdir)
@@ -295,7 +295,7 @@ def add(args, config, basepath, workspace):
                     with open(layerconf_file, 'a') as f:
                         f.write('%s = "%s"\n' % (preferred_provider, recipe_name))
                 else:
-                    logger.warn('Set \'%s\' in order to use the recipe' % preferred_provider)
+                    logger.warning('Set \'%s\' in order to use the recipe' % preferred_provider)
                 break
 
         _add_md5(config, recipename, appendfile)
@@ -704,7 +704,7 @@ def _check_preserve(config, recipename):
                     if splitline[2] != md5:
                         bb.utils.mkdirhier(preservepath)
                         preservefile = os.path.basename(removefile)
-                        logger.warn('File %s modified since it was written, preserving in %s' % (preservefile, preservepath))
+                        logger.warning('File %s modified since it was written, preserving in %s' % (preservefile, preservepath))
                         shutil.move(removefile, os.path.join(preservepath, preservefile))
                     else:
                         os.remove(removefile)
@@ -795,7 +795,7 @@ def modify(args, config, basepath, workspace):
                 if branchname.startswith(override_branch_prefix):
                     branches.append(branchname)
             if branches:
-                logger.warn('SRC_URI is conditionally overridden in this recipe, thus several %s* branches have been created, one for each override that makes changes to SRC_URI. It is recommended that you make changes to the %s branch first, then checkout and rebase each %s* branch and update any unique patches there (duplicates on those branches will be ignored by devtool finish/update-recipe)' % (override_branch_prefix, args.branch, override_branch_prefix))
+                logger.warning('SRC_URI is conditionally overridden in this recipe, thus several %s* branches have been created, one for each override that makes changes to SRC_URI. It is recommended that you make changes to the %s branch first, then checkout and rebase each %s* branch and update any unique patches there (duplicates on those branches will be ignored by devtool finish/update-recipe)' % (override_branch_prefix, args.branch, override_branch_prefix))
             branches.insert(0, args.branch)
             seen_patches = []
             for branch in branches:
@@ -1720,7 +1720,7 @@ def update_recipe(args, config, basepath, workspace):
         if updated:
             rf = rd.getVar('FILE')
             if rf.startswith(config.workspace_path):
-                logger.warn('Recipe file %s has been updated but is inside the workspace - you will need to move it (and any associated files next to it) out to the desired layer before using "devtool reset" in order to keep any changes' % rf)
+                logger.warning('Recipe file %s has been updated but is inside the workspace - you will need to move it (and any associated files next to it) out to the desired layer before using "devtool reset" in order to keep any changes' % rf)
     finally:
         tinfoil.shutdown()
 
@@ -1803,7 +1803,7 @@ def _reset(recipes, no_clean, config, basepath, workspace):
             if os.path.exists(origdir):
                 for root, dirs, files in os.walk(origdir):
                     for fn in files:
-                        logger.warn('Preserving %s in %s' % (fn, preservepath))
+                        logger.warning('Preserving %s in %s' % (fn, preservepath))
                         _move_file(os.path.join(origdir, fn),
                                    os.path.join(preservepath, fn))
                     for dn in dirs:
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index c3fd866..d652f33 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -264,7 +264,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
     if no_patch:
         patches = oe.recipeutils.get_recipe_patches(crd)
         if patches:
-            logger.warn('By user choice, the following patches will NOT be applied to the new source tree:\n  %s' % '\n  '.join([os.path.basename(patch) for patch in patches]))
+            logger.warning('By user choice, the following patches will NOT be applied to the new source tree:\n  %s' % '\n  '.join([os.path.basename(patch) for patch in patches]))
     else:
         __run('git checkout devtool-patched -b %s' % branch)
         skiptag = False
@@ -273,9 +273,9 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
         except bb.process.ExecutionError as e:
             skiptag = True
             if 'conflict' in e.stdout:
-                logger.warn('Command \'%s\' failed:\n%s\n\nYou will need to resolve conflicts in order to complete the upgrade.' % (e.command, e.stdout.rstrip()))
+                logger.warning('Command \'%s\' failed:\n%s\n\nYou will need to resolve conflicts in order to complete the upgrade.' % (e.command, e.stdout.rstrip()))
             else:
-                logger.warn('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
+                logger.warning('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
         if not skiptag:
             if uri.startswith('git://'):
                 suffix = 'new'
diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 69c8bb7..3f2c134 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -238,7 +238,7 @@ def appendfile(args):
     if stdout:
         logger.debug('file command output: %s' % stdout.rstrip())
         if ('executable' in stdout and not 'shell script' in stdout) or 'shared object' in stdout:
-            logger.warn('This file looks like it is a binary or otherwise the output of compilation. If it is, you should consider building it properly instead of substituting a binary file directly.')
+            logger.warning('This file looks like it is a binary or otherwise the output of compilation. If it is, you should consider building it properly instead of substituting a binary file directly.')
 
     if args.recipe:
         recipes = {args.targetpath: [args.recipe],}
@@ -275,7 +275,7 @@ def appendfile(args):
     if selectpn:
         logger.debug('Selecting recipe %s for file %s' % (selectpn, args.targetpath))
         if postinst_pns:
-            logger.warn('%s be modified by postinstall scripts for the following recipes:\n  %s\nThis may or may not be an issue depending on what modifications these postinstall scripts make.' % (args.targetpath, '\n  '.join(postinst_pns)))
+            logger.warning('%s be modified by postinstall scripts for the following recipes:\n  %s\nThis may or may not be an issue depending on what modifications these postinstall scripts make.' % (args.targetpath, '\n  '.join(postinst_pns)))
         rd = _parse_recipe(selectpn, tinfoil)
         if not rd:
             # Error message already shown
@@ -286,12 +286,12 @@ def appendfile(args):
             sourcetype, sourcepath = sourcefile.split('://', 1)
             logger.debug('Original source file is %s (%s)' % (sourcepath, sourcetype))
             if sourcetype == 'patch':
-                logger.warn('File %s is added by the patch %s - you may need to remove or replace this patch in order to replace the file.' % (args.targetpath, sourcepath))
+                logger.warning('File %s is added by the patch %s - you may need to remove or replace this patch in order to replace the file.' % (args.targetpath, sourcepath))
                 sourcepath = None
         else:
             logger.debug('Unable to determine source file, proceeding anyway')
         if modpatches:
-            logger.warn('File %s is modified by the following patches:\n  %s' % (args.targetpath, '\n  '.join(modpatches)))
+            logger.warning('File %s is modified by the following patches:\n  %s' % (args.targetpath, '\n  '.join(modpatches)))
 
         if instelements and sourcepath:
             install = None
@@ -343,7 +343,7 @@ def appendsrc(args, files, rd, extralines=None):
             if rd.getVar('S') == rd.getVar('STAGING_KERNEL_DIR'):
                 srcdir = os.path.join(workdir, 'git')
                 if not bb.data.inherits_class('kernel-yocto', rd):
-                    logger.warn('S == STAGING_KERNEL_DIR and non-kernel-yocto, unable to determine path to srcdir, defaulting to ${WORKDIR}/git')
+                    logger.warning('S == STAGING_KERNEL_DIR and non-kernel-yocto, unable to determine path to srcdir, defaulting to ${WORKDIR}/git')
             src_destdir = os.path.join(os.path.relpath(srcdir, workdir), src_destdir)
         src_destdir = os.path.normpath(src_destdir)
 
@@ -357,9 +357,9 @@ def appendsrc(args, files, rd, extralines=None):
         if simple_str in simplified:
             existing = simplified[simple_str]
             if source_uri != existing:
-                logger.warn('{0!r} is already in SRC_URI, with different parameters: {1!r}, not adding'.format(source_uri, existing))
+                logger.warning('{0!r} is already in SRC_URI, with different parameters: {1!r}, not adding'.format(source_uri, existing))
             else:
-                logger.warn('{0!r} is already in SRC_URI, not adding'.format(source_uri))
+                logger.warning('{0!r} is already in SRC_URI, not adding'.format(source_uri))
         else:
             extralines.append('SRC_URI += {0}'.format(source_uri))
         copyfiles[newfile] = srcfile
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index a371028..1810c70 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -98,7 +98,7 @@ class RecipeHandler(object):
                             break
             except IOError as ioe:
                 if ioe.errno == 2:
-                    logger.warn('unable to find a pkgdata file for package %s' % pkg)
+                    logger.warning('unable to find a pkgdata file for package %s' % pkg)
                 else:
                     raise
 
@@ -437,7 +437,7 @@ def create_recipe(args):
     if scriptutils.is_src_url(source):
         # Warn about github archive URLs
         if re.match('https?://github.com/[^/]+/[^/]+/archive/.+(\.tar\..*|\.zip)$', source):
-            logger.warn('github archive files are not guaranteed to be stable and may be re-generated over time. If the latter occurs, the checksums will likely change and the recipe will fail at do_fetch. It is recommended that you point to an actual commit or tag in the repository instead (using the repository URL in conjunction with the -S/--srcrev option).')
+            logger.warning('github archive files are not guaranteed to be stable and may be re-generated over time. If the latter occurs, the checksums will likely change and the recipe will fail at do_fetch. It is recommended that you point to an actual commit or tag in the repository instead (using the repository URL in conjunction with the -S/--srcrev option).')
         # Fetch a URL
         fetchuri = reformat_git_uri(urldefrag(source)[0])
         if args.binary:
diff --git a/scripts/lib/recipetool/create_kmod.py b/scripts/lib/recipetool/create_kmod.py
index 4569b53..3982537 100644
--- a/scripts/lib/recipetool/create_kmod.py
+++ b/scripts/lib/recipetool/create_kmod.py
@@ -141,7 +141,7 @@ class KernelModuleRecipeHandler(RecipeHandler):
                 warnmsg = 'Unable to find means of passing kernel path into install makefile - if kernel path is hardcoded you will need to patch the makefile'
             if warnmsg:
                 warnmsg += '. Note that the variable KERNEL_SRC will be passed in as the kernel source path.'
-                logger.warn(warnmsg)
+                logger.warning(warnmsg)
                 lines_after.append('# %s' % warnmsg)
 
             return True
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index bb42a5c..0366788 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -90,7 +90,7 @@ class NpmRecipeHandler(RecipeHandler):
             runenv = dict(os.environ, PATH=d.getVar('PATH'))
             bb.process.run('npm shrinkwrap', cwd=srctree, stderr=subprocess.STDOUT, env=runenv, shell=True)
         except bb.process.ExecutionError as e:
-            logger.warn('npm shrinkwrap failed:\n%s' % e.stdout)
+            logger.warning('npm shrinkwrap failed:\n%s' % e.stdout)
             return
 
         tmpfile = os.path.join(localfilesdir, 'npm-shrinkwrap.json')
@@ -107,12 +107,12 @@ class NpmRecipeHandler(RecipeHandler):
                            cwd=srctree, stderr=subprocess.STDOUT, env=runenv, shell=True)
         relockbin = os.path.join(NpmRecipeHandler.lockdownpath, 'node_modules', 'lockdown', 'relock.js')
         if not os.path.exists(relockbin):
-            logger.warn('Could not find relock.js within lockdown directory; skipping lockdown')
+            logger.warning('Could not find relock.js within lockdown directory; skipping lockdown')
             return
         try:
             bb.process.run('node %s' % relockbin, cwd=srctree, stderr=subprocess.STDOUT, env=runenv, shell=True)
         except bb.process.ExecutionError as e:
-            logger.warn('lockdown-relock failed:\n%s' % e.stdout)
+            logger.warning('lockdown-relock failed:\n%s' % e.stdout)
             return
 
         tmpfile = os.path.join(localfilesdir, 'lockdown.json')
diff --git a/scripts/lib/recipetool/newappend.py b/scripts/lib/recipetool/newappend.py
index decce83..76707b4 100644
--- a/scripts/lib/recipetool/newappend.py
+++ b/scripts/lib/recipetool/newappend.py
@@ -58,11 +58,11 @@ def newappend(args):
         return 1
 
     if not path_ok:
-        logger.warn('Unable to determine correct subdirectory path for bbappend file - check that what %s adds to BBFILES also matches .bbappend files. Using %s for now, but until you fix this the bbappend will not be applied.', os.path.join(args.destlayer, 'conf', 'layer.conf'), os.path.dirname(append_path))
+        logger.warning('Unable to determine correct subdirectory path for bbappend file - check that what %s adds to BBFILES also matches .bbappend files. Using %s for now, but until you fix this the bbappend will not be applied.', os.path.join(args.destlayer, 'conf', 'layer.conf'), os.path.dirname(append_path))
 
     layerdirs = [os.path.abspath(layerdir) for layerdir in rd.getVar('BBLAYERS').split()]
     if not os.path.abspath(args.destlayer) in layerdirs:
-        logger.warn('Specified layer is not currently enabled in bblayers.conf, you will need to add it before this bbappend will be active')
+        logger.warning('Specified layer is not currently enabled in bblayers.conf, you will need to add it before this bbappend will be active')
 
     if not os.path.exists(append_path):
         bb.utils.mkdirhier(os.path.dirname(append_path))
diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 7e6519e..acaf958 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -506,7 +506,7 @@ class Disk:
                     sparse_copy(partfname, target, seek=part['start'] * self._lsector_size)
                     os.unlink(partfname)
                 elif part['type'] != 'f':
-                    logger.warn("skipping partition {}: unsupported fstype {}".format(pnum, fstype))
+                    logger.warning("skipping partition {}: unsupported fstype {}".format(pnum, fstype))
 
 def wic_ls(args, native_sysroot):
     """List contents of partitioned image or vfat partition."""
diff --git a/scripts/runqemu b/scripts/runqemu
index 1316aa4..b231ae6 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -290,7 +290,7 @@ class BaseConfig(object):
     def check_arg_fstype(self, fst):
         """Check and set FSTYPE"""
         if fst not in self.fstypes + self.vmtypes:
-            logger.warn("Maybe unsupported FSTYPE: %s" % fst)
+            logger.warning("Maybe unsupported FSTYPE: %s" % fst)
         if not self.fstype or self.fstype == fst:
             if fst == 'ramfs':
                 fst = 'cpio.gz'
@@ -352,7 +352,7 @@ class BaseConfig(object):
                     self.qemuboot = qb
                     self.qbconfload = True
                 else:
-                    logger.warn("%s doesn't exist" % qb)
+                    logger.warning("%s doesn't exist" % qb)
             else:
                 raise RunQemuError("Can't find FSTYPE from: %s" % p)
 
@@ -692,7 +692,7 @@ class BaseConfig(object):
             if not self.get('QB_AUDIO_DRV'):
                 raise RunQemuError("QB_AUDIO_DRV is NULL, this board doesn't support audio")
             if not self.get('QB_AUDIO_OPT'):
-                logger.warn('QB_AUDIO_OPT is NULL, you may need define it to make audio work')
+                logger.warning('QB_AUDIO_OPT is NULL, you may need define it to make audio work')
             else:
                 self.qemu_opt_script += ' %s' % self.get('QB_AUDIO_OPT')
             os.putenv('QEMU_AUDIO_DRV', self.get('QB_AUDIO_DRV'))
@@ -714,7 +714,7 @@ class BaseConfig(object):
             if self.get('DEPLOY_DIR_IMAGE'):
                 deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
             else:
-                logger.warn("Can't find qemuboot conf file, DEPLOY_DIR_IMAGE is NULL!")
+                logger.warning("Can't find qemuboot conf file, DEPLOY_DIR_IMAGE is NULL!")
                 return
 
             if self.rootfs and not os.path.exists(self.rootfs):
@@ -1058,9 +1058,9 @@ class BaseConfig(object):
                         # virtio might have been selected explicitly (just use it), or
                         # is used as fallback (then warn about that).
                         if not drive_type.startswith("/dev/vd"):
-                            logger.warn("Unknown QB_DRIVE_TYPE: %s" % drive_type)
-                            logger.warn("Failed to figure out drive type, consider define or fix QB_DRIVE_TYPE")
-                            logger.warn('Trying to use virtio block drive')
+                            logger.warning("Unknown QB_DRIVE_TYPE: %s" % drive_type)
+                            logger.warning("Failed to figure out drive type, consider define or fix QB_DRIVE_TYPE")
+                            logger.warning('Trying to use virtio block drive')
                         vm_drive = '-drive if=virtio,file=%s,format=%s' % (self.rootfs, rootfs_format)
 
                 # All branches above set vm_drive.
@@ -1275,7 +1275,7 @@ class BaseConfig(object):
             self.bitbake_e = subprocess.check_output(cmd, shell=True).decode('utf-8')
         except subprocess.CalledProcessError as err:
             self.bitbake_e = ''
-            logger.warn("Couldn't run 'bitbake -e' to gather environment information:\n%s" % err.output.decode('utf-8'))
+            logger.warning("Couldn't run 'bitbake -e' to gather environment information:\n%s" % err.output.decode('utf-8'))
 
     def validate_combos(self):
         if (self.fstype in self.vmtypes) and self.kernel:
-- 
2.7.4


