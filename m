Return-Path: <roylee17@currantlabs.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8DF6475E2D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Nov 2015 05:10:27 +0000 (UTC)
Received: by pasz6 with SMTP id z6so146958694pas.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 21:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=currantlabs_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9L8J6RszcHOKYu5TBUoJwAEARQfBtLVMMZPSJoKD9ew=;
	b=LtB36AYNpNSshYWOSidfVEqrK1R3u/7D6ot3gYyBltpL3qLGxWLa8PTVeqsxJYjThA
	8WlXfwow08Cj6xQYdcK7BTno3q/q5A2ZbgSZpClRiur94sUwqN1uibLJLS4nIhrN1B5h
	oveXrBFHMr7i7BonAlwfyc3Z7j4gPLSGcWyYvRPsmykgIwJ40oGcnrJLUYocyyYcd62O
	JDwP8/XRDGSSqpY+1OLeBfx8nK3YfNajqSToOI11rRV5/yWHgrreJpSX+DN5eDiWIu27
	id8tE2vpR8iGUf4n93I8FDGEHzwNkMkaPjx1nu1dP/rkIVYdRXTfhBtyiiD/tW9TcYwc
	wL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9L8J6RszcHOKYu5TBUoJwAEARQfBtLVMMZPSJoKD9ew=;
	b=Qm2QRDVu88ZNcXtLJ+nnxK7AmLT3aHARgOx8I8kLTP6jsar2wD/TnjSKU0HcpOrjZu
	Ys2b8OJM+QmXdqyrKLuc3eCiU7+uBPQCrcuEJmfB3/9q03FjZRLSyWa+2uYJp/M7JWGy
	jpG4sXo1E8OAmAZC9WarMG65tzZzf78Nu9XgfBxg2pMVT/6VBSb7Jxgiaq/9B5XsLhVR
	CW2D7n702vxDV8jRymjXl2IIm03tkyvb1/G8mVGF3JwgvGPorsay1E6zj0P5fb7ElA0Z
	a69TY8GgVvev1q5A0wOamUyG742zk2/hxh2VmWOKvr+YaXO1R9XjOsr20AUVHxUYa2Xd
	KILg==
X-Gm-Message-State: ALoCoQl9uZqdOIDOj60c1o7ost9tbQW3haKb4tDFuYa4ngON1nWD4bQcHxUEcOr9JKQ9jTszT/dq
X-Received: by 10.68.94.225 with SMTP id df1mr14508600pbb.80.1446873027660;
	Fri, 06 Nov 2015 21:10:27 -0800 (PST)
Received: from Tzu-Jungs-iMac.local.net (c-67-169-68-81.hsd1.ca.comcast.net.
	[67.169.68.81]) by smtp.gmail.com with ESMTPSA id
	ck9sm3095081pad.28.2015.11.06.21.10.26
	(version=TLSv1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Nov 2015 21:10:26 -0800 (PST)
From: Tzu-Jung Lee <roylee17@currantlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 21:10:10 -0800
Message-Id: <1446873010-15801-1-git-send-email-roylee17@currantlabs.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <CAHZ5O5wc-mLh9akYz=tnbDiw9ngH7PJNRr_0WsTJbiB6ae8L0w@mail.gmail.com>
References: <CAHZ5O5wc-mLh9akYz=tnbDiw9ngH7PJNRr_0WsTJbiB6ae8L0w@mail.gmail.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v2] devtool: add sync command
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
X-List-Received-Date: Sat, 07 Nov 2015 05:10:29 -0000

The sync command is similar to the extract command, except it
fetches the sync'ed and patched branch to an existing git repository.

This enables users to keep track the upstream development while
maintaining their own local git repository at the same time.

Signed-off-by: Tzu-Jung Lee <roylee17@currantlabs.com>

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index c5c647b..8efd262 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -238,7 +238,29 @@ def extract(args, config, basepath, workspace):
         return 1
 
     srctree = os.path.abspath(args.srctree)
-    initial_rev = _extract_source(srctree, args.keep_temp, args.branch, rd)
+    initial_rev = _extract_source(srctree, args.keep_temp, args.branch, False, rd)
+    logger.info('Source tree extracted to %s' % srctree)
+
+    if initial_rev:
+        return 0
+    else:
+        return 1
+
+def sync(args, config, basepath, workspace):
+    """Entry point for the devtool 'sync' subcommand"""
+    import bb
+
+    tinfoil = _prep_extract_operation(config, basepath, args.recipename)
+    if not tinfoil:
+        # Error already shown
+        return 1
+
+    rd = parse_recipe(config, tinfoil, args.recipename, True)
+    if not rd:
+        return 1
+
+    srctree = os.path.abspath(args.srctree)
+    initial_rev = _extract_source(srctree, args.keep_temp, args.branch, True, rd)
     logger.info('Source tree extracted to %s' % srctree)
 
     if initial_rev:
@@ -293,7 +315,7 @@ def _prep_extract_operation(config, basepath, recipename):
     return tinfoil
 
 
-def _extract_source(srctree, keep_temp, devbranch, d):
+def _extract_source(srctree, keep_temp, devbranch, sync, d):
     """Extract sources of a recipe"""
     import bb.event
     import oe.recipeutils
@@ -312,21 +334,26 @@ def _extract_source(srctree, keep_temp, devbranch, d):
 
     _check_compatible_recipe(pn, d)
 
-    if os.path.exists(srctree):
-        if not os.path.isdir(srctree):
-            raise DevtoolError("output path %s exists and is not a directory" %
-                               srctree)
-        elif os.listdir(srctree):
-            raise DevtoolError("output path %s already exists and is "
-                               "non-empty" % srctree)
+    if sync:
+        if not os.path.exists(srctree):
+                raise DevtoolError("output path %s does not exist" % srctree)
+    else:
+        if os.path.exists(srctree):
+            if not os.path.isdir(srctree):
+                raise DevtoolError("output path %s exists and is not a directory" %
+                                   srctree)
+            elif os.listdir(srctree):
+                raise DevtoolError("output path %s already exists and is "
+                                   "non-empty" % srctree)
 
-    if 'noexec' in (d.getVarFlags('do_unpack', False) or []):
-        raise DevtoolError("The %s recipe has do_unpack disabled, unable to "
-                           "extract source" % pn)
+        if 'noexec' in (d.getVarFlags('do_unpack', False) or []):
+            raise DevtoolError("The %s recipe has do_unpack disabled, unable to "
+                               "extract source" % pn)
 
-    # Prepare for shutil.move later on
-    bb.utils.mkdirhier(srctree)
-    os.rmdir(srctree)
+    if not sync:
+        # Prepare for shutil.move later on
+        bb.utils.mkdirhier(srctree)
+        os.rmdir(srctree)
 
     # We don't want notes to be printed, they are too verbose
     origlevel = bb.logger.getEffectiveLevel()
@@ -430,13 +457,35 @@ def _extract_source(srctree, keep_temp, devbranch, d):
             if haspatches:
                 bb.process.run('git checkout patches', cwd=srcsubdir)
 
-        # Move oe-local-files directory to srctree
-        if os.path.exists(os.path.join(tempdir, 'oe-local-files')):
-            logger.info('Adding local source files to srctree...')
-            shutil.move(os.path.join(tempdir, 'oe-local-files'), srcsubdir)
+        tempdir_localdir = os.path.join(tempdir, 'oe-local-files')
+        srctree_localdir = os.path.join(srctree, 'oe-local-files')
 
+        if sync:
+            bb.process.run('git fetch file://' + srcsubdir + ' ' + devbranch + ':' + devbranch, cwd=srctree)
+
+            # Move oe-local-files directory to srctree
+            # As the oe-local-files is not part of the constructed git tree,
+            # remove them directly during the synchrounizating might surprise
+            # the users.  Instead, we move it to oe-local-files.bak and remind
+            # user in the log message.
+            if os.path.exists(srctree_localdir + '.bak'):
+                shutil.rmtree(srctree_localdir, srctree_localdir + '.bak')
+
+            if os.path.exists(srctree_localdir):
+                logger.info('Backing up current local file directory %s' % srctree_localdir)
+                shutil.move(srctree_localdir, srctree_localdir + '.bak')
+
+            if os.path.exists(tempdir_localdir):
+                logger.info('Syncing local source files to srctree...')
+                shutil.copytree(tempdir_localdir, srctree_localdir)
+        else:
+            # Move oe-local-files directory to srctree
+            if os.path.exists(tempdir_localdir):
+                logger.info('Adding local source files to srctree...')
+                shutil.move(tempdir_localdir, srcsubdir)
+
+            shutil.move(srcsubdir, srctree)
 
-        shutil.move(srcsubdir, srctree)
     finally:
         bb.logger.setLevel(origlevel)
 
@@ -544,7 +593,7 @@ def modify(args, config, basepath, workspace):
     commits = []
     srctree = os.path.abspath(args.srctree)
     if args.extract:
-        initial_rev = _extract_source(args.srctree, False, args.branch, rd)
+        initial_rev = _extract_source(args.srctree, False, args.branch, False, rd)
         if not initial_rev:
             return 1
         logger.info('Source tree extracted to %s' % srctree)
@@ -1119,6 +1168,15 @@ def register_commands(subparsers, context):
     parser_extract.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
     parser_extract.set_defaults(func=extract)
 
+    parser_sync = subparsers.add_parser('sync', help='Synchronize the source for an existing recipe',
+                                       description='Synchronize the source for an existing recipe',
+                                       formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+    parser_sync.add_argument('recipename', help='Name for recipe to sync the source for')
+    parser_sync.add_argument('srctree', help='Path to where to sync the source tree')
+    parser_sync.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout')
+    parser_sync.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
+    parser_sync.set_defaults(func=sync)
+
     parser_update_recipe = subparsers.add_parser('update-recipe', help='Apply changes from external source tree to recipe',
                                        description='Applies changes from external source tree to a recipe (updating/adding/removing patches as necessary, or by updating SRCREV)')
     parser_update_recipe.add_argument('recipename', help='Name of recipe to update')
-- 
2.6.3


