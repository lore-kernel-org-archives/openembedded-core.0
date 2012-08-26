Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T5Wo3-0007L8-8x
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Aug 2012 08:58:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7Q6kaDx025979
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 23:46:36 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Sat, 25 Aug 2012 23:46:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Aug 2012 14:51:57 +0800
Message-ID: <7b2605217d7769d9b66184c2144e0a9bc552e040.1345963712.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1345963712.git.liezhi.yang@windriver.com>
References: <cover.1345963712.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/6] archiver.bbclass: fix the coding style
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Aug 2012 06:58:47 -0000
Content-Type: text/plain

* Make the comment line under 80 characters.
* Use the triple double quotes for the docstring.
* Add a whitespace behind the comma (,).
* Other minor fixes.

[YOCTO #2619]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/archive-configured-source.bbclass |   9 +-
 meta/classes/archive-original-source.bbclass   |   9 +-
 meta/classes/archive-patched-source.bbclass    |   9 +-
 meta/classes/archiver.bbclass                  | 288 +++++++++++++++----------
 4 files changed, 190 insertions(+), 125 deletions(-)

diff --git a/meta/classes/archive-configured-source.bbclass b/meta/classes/archive-configured-source.bbclass
index 1a609b3..1eaaf4c 100644
--- a/meta/classes/archive-configured-source.bbclass
+++ b/meta/classes/archive-configured-source.bbclass
@@ -1,6 +1,9 @@
-# This file is for getting archiving packages with configured sources(archive 's' after configure stage),logs(archive 'temp' after package_write_rpm),dump data 
-# and creating diff file(get all environment variables and functions in building and mapping all content in 's' including patches to  xxx.diff.gz.
-# All archived packages will be deployed in ${DEPLOY_DIR}/sources
+# This file is for getting archiving packages with configured
+# sources(archive ${S} after configure stage), logs(archive 'temp' after
+# package_write_rpm), dump data and creating diff file(get all
+# environment variables and functions in building and mapping all
+# content in ${S} including patches to xxx.diff.gz. All archived
+# packages will be deployed in ${DEPLOY_DIR}/sources
 
 inherit archiver
 
diff --git a/meta/classes/archive-original-source.bbclass b/meta/classes/archive-original-source.bbclass
index b085533..1b3f8d0 100644
--- a/meta/classes/archive-original-source.bbclass
+++ b/meta/classes/archive-original-source.bbclass
@@ -1,6 +1,9 @@
-# This file is for getting archiving packages with original sources(archive 's' after unpack stage),patches,logs(archive 'temp' after package_write_rpm),dump data and 
-# creating diff file(get all environment variables and functions in building and mapping all content in 's' including patches to  xxx.diff.gz.
-# All archived packages will be deployed in ${DEPLOY_DIR}/sources
+# This file is for getting archiving packages with original
+# sources(archive ${S} after unpack stage), patches, logs(archive 'temp'
+# after package_write_rpm), dump data and creating diff file(get all
+# environment variables and functions in building and mapping all
+# content in ${S} including patches to xxx.diff.gz. All archived packages
+# will be deployed in ${DEPLOY_DIR}/sources
 
 inherit archiver
 
diff --git a/meta/classes/archive-patched-source.bbclass b/meta/classes/archive-patched-source.bbclass
index a6d368f..40b2dcb 100644
--- a/meta/classes/archive-patched-source.bbclass
+++ b/meta/classes/archive-patched-source.bbclass
@@ -1,6 +1,9 @@
-# This file is for getting archiving packages with patched sources(archive 's' before do_patch stage),logs(archive 'temp' after package_write_rpm),dump data and 
-# creating diff file(get all environment variables and functions in building and mapping all content in 's' including patches to  xxx.diff.gz.
-# All archived packages will be deployed in ${DEPLOY_DIR}/sources
+# This file is for getting archiving packages with patched
+# sources(archive ${S} before do_patch stage), logs(archive 'temp' after
+# package_write_rpm), dump data and creating diff file(get all
+# environment variables and functions in building and mapping all
+# content in ${S} including patches to xxx.diff.gz. All archived
+# packages will be deployed in ${DEPLOY_DIR}/sources
 
 inherit archiver
 
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 117ad02..b01b078 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -1,9 +1,9 @@
 # ex:ts=4:sw=4:sts=4:et
 # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
-# This file is used for archiving sources ,patches,and logs to tarball.
-# It also output building environment to xxx.dump.data and create xxx.diff.gz to record
-# all content in ${S} to a diff file.
+# This file is used for archiving sources, patches, and logs to a
+# tarball.  It also output building environment to xxx.dump.data and
+# create xxx.diff.gz to record all content in ${S} to a diff file.
 #
 
 ARCHIVE_EXCLUDE_FROM ?= ".pc autom4te.cache"
@@ -11,11 +11,11 @@ ARCHIVE_TYPE ?= "TAR SRPM"
 DISTRO ?= "poky"
 PATCHES_ARCHIVE_WITH_SERIES = 'TRUE'
 SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?= '${@d.getVarFlag('ARCHIVER_MODE', 'log_type') \
-                                    if d.getVarFlag('ARCHIVER_MODE', 'log_type') != 'none' else 'logs_with_scripts'}'
-SOURCE_ARCHIVE_PACKAGE_TYPE ?= '${@d.getVarFlag('ARCHIVER_MODE','type') \
-                                 if d.getVarFlag('ARCHIVER_MODE', 'log_type')!= 'none' else 'tar'}'
-FILTER ?= '${@d.getVarFlag('ARCHIVER_MODE','filter') \
-           if d.getVarFlag('ARCHIVER_MODE', 'filter')!= 'none' else 'no'}'
+    if d.getVarFlag('ARCHIVER_MODE', 'log_type') != 'none' else 'logs_with_scripts'}'
+SOURCE_ARCHIVE_PACKAGE_TYPE ?= '${@d.getVarFlag('ARCHIVER_MODE', 'type') \
+    if d.getVarFlag('ARCHIVER_MODE', 'log_type') != 'none' else 'tar'}'
+FILTER ?= '${@d.getVarFlag('ARCHIVER_MODE', 'filter') \
+    if d.getVarFlag('ARCHIVER_MODE', 'filter')!= 'none' else 'no'}'
 
 
 COPYLEFT_LICENSE_INCLUDE ?= 'GPL* LGPL*'
@@ -44,7 +44,9 @@ def copyleft_recipe_type(d):
     return 'target'
 
 def copyleft_should_include(d):
-    """Determine if this recipe's sources should be deployed for compliance"""
+    """
+    Determine if this recipe's sources should be deployed for compliance
+    """
     import ast
     import oe.license
     from fnmatch import fnmatchcase as fnmatch
@@ -67,7 +69,11 @@ def copyleft_should_include(d):
             return False, 'recipe has excluded licenses: %s' % ', '.join(reason)
 
 def tar_filter(d):
-    """Only tarball the packages belonging to COPYLEFT_LICENSE_INCLUDE and miss packages in COPYLEFT_LICENSE_EXCLUDE. Don't tarball any packages when \"FILTER\" is \"no\""""
+    """
+    Only archive the package belongs to COPYLEFT_LICENSE_INCLUDE
+    and ignore the one in COPYLEFT_LICENSE_EXCLUDE. Don't exclude any
+    packages when \"FILTER\" is \"no\"
+    """
     if d.getVar('FILTER', True).upper() == "YES":
         included, reason = copyleft_should_include(d)
         if not included:
@@ -78,7 +84,9 @@ def tar_filter(d):
         return False
 
 def get_bb_inc(d):
-    '''create a directory "script-logs" including .bb and .inc file in ${WORKDIR}'''
+    """
+    create a directory "script-logs" including .bb and .inc file in ${WORKDIR}
+    """
     import re
     import shutil
 
@@ -87,26 +95,26 @@ def get_bb_inc(d):
     work_dir = d.getVar('WORKDIR', True)
     bbfile = d.getVar('FILE', True)
     bbdir = os.path.dirname(bbfile)
-    script_logs = os.path.join(work_dir,'script-logs')
-    bb_inc = os.path.join(script_logs,'bb_inc')
+    script_logs = os.path.join(work_dir, 'script-logs')
+    bb_inc = os.path.join(script_logs, 'bb_inc')
     bb.mkdirhier(script_logs)
     bb.mkdirhier(bb_inc)
 
-    def find_file(dir,file):
+    def find_file(dir, file):
         for root, dirs, files in os.walk(dir):
             if file in files:
-                return os.path.join(root,file)
+                return os.path.join(root, file)
 
     def get_inc (file):
-        f = open(file,'r')
+        f = open(file, 'r')
         for line in f.readlines():
             if 'require' not  in line:
                 bbinc.append(file)
             else:
                 try:
                     incfile = pat.match(line).group(1)
-                    incfile = bb.data.expand(os.path.basename(incfile),d)
-                    abs_incfile = find_file(bbdir,incfile)
+                    incfile = bb.data.expand(os.path.basename(incfile), d)
+                    abs_incfile = find_file(bbdir, incfile)
                     if abs_incfile:
                         bbinc.append(abs_incfile)
                         get_inc(abs_incfile)
@@ -115,23 +123,26 @@ def get_bb_inc(d):
     get_inc(bbfile)
     bbinc = list(set(bbinc))
     for bbincfile in bbinc:
-        shutil.copy(bbincfile,bb_inc)
+        shutil.copy(bbincfile, bb_inc)
 
     try:
-        bb.mkdirhier(os.path.join(script_logs,'temp'))
-        oe.path.copytree(os.path.join(work_dir,'temp'), os.path.join(script_logs,'temp'))
-    except (IOError,AttributeError):
+        bb.mkdirhier(os.path.join(script_logs, 'temp'))
+        oe.path.copytree(os.path.join(work_dir, 'temp'), os.path.join(script_logs, 'temp'))
+    except (IOError, AttributeError):
         pass
     return script_logs
 
 def get_series(d):
-    '''copy patches and series file to a pointed directory which will be archived to tarball in ${WORKDIR}'''
+    """
+    copy patches and series file to a pointed directory which will be
+    archived to tarball in ${WORKDIR}
+    """
     import shutil
 
     src_patches=[]
     pf = d.getVar('PF', True)
     work_dir = d.getVar('WORKDIR', True)
-    s = d.getVar('S',True)
+    s = d.getVar('S', True)
     dest = os.path.join(work_dir, pf + '-series')
     shutil.rmtree(dest, ignore_errors=True)
     bb.mkdirhier(dest)
@@ -141,22 +152,25 @@ def get_series(d):
     locals = (fetch.localpath(url) for url in fetch.urls)
     for local in locals:
         src_patches.append(local)
-    if not cmp(work_dir,s):
+    if not cmp(work_dir, s):
         tmp_list = src_patches
     else:
         tmp_list = src_patches[1:]
 
     for patch in tmp_list:
         try:
-            shutil.copy(patch,dest)
+            shutil.copy(patch, dest)
         except IOError:
             if os.path.isdir(patch):
-                bb.mkdirhier(os.path.join(dest,patch))
-                oe.path.copytree(patch, os.path.join(dest,patch))
+                bb.mkdirhier(os.path.join(dest, patch))
+                oe.path.copytree(patch, os.path.join(dest, patch))
     return dest
 
 def get_applying_patches(d):
-    """only copy applying patches to a pointed directory which will be archived to tarball"""
+    """
+    only copy applying patches to a pointed directory which will be
+    archived to tarball
+    """
     import shutil
 
     pf = d.getVar('PF', True)
@@ -169,35 +183,40 @@ def get_applying_patches(d):
     for patch in patches:
         _, _, local, _, _, parm = bb.decodeurl(patch)
         if local:
-             shutil.copy(local,dest)
+             shutil.copy(local, dest)
     return dest
 
 def not_tarball(d):
-    '''packages including key words 'work-shared','native', 'task-' will be passed'''
-
-    workdir = d.getVar('WORKDIR',True)
-    s = d.getVar('S',True)
+    """
+    packages including key words 'work-shared', 'native', 'task-' will be passed
+    """
+    workdir = d.getVar('WORKDIR', True)
+    s = d.getVar('S', True)
     if 'work-shared' in s or 'task-' in workdir or 'native' in workdir:
         return True
     else:
         return False
 
-def get_source_from_downloads(d,stage_name):
-    '''copy tarball of $P to $WORKDIR when this tarball exists in $DL_DIR'''
+def get_source_from_downloads(d, stage_name):
+    """
+    copy tarball of $P to $WORKDIR when this tarball exists in $DL_DIR
+    """
     if stage_name in 'patched' 'configured':
         return
     pf = d.getVar('PF', True)
-    dl_dir = d.getVar('DL_DIR',True)
+    dl_dir = d.getVar('DL_DIR', True)
     try:
-        source = os.path.join(dl_dir,os.path.basename(d.getVar('SRC_URI', True).split()[0]))
+        source = os.path.join(dl_dir, os.path.basename(d.getVar('SRC_URI', True).split()[0]))
         if os.path.exists(source) and not os.path.isdir(source):
             return source
     except (IndexError, OSError):
         pass
     return ''
 
-def do_tarball(workdir,srcdir,tarname):
-    '''tar "srcdir" under "workdir" to "tarname"'''
+def do_tarball(workdir, srcdir, tarname):
+    """
+    tar "srcdir" under "workdir" to "tarname"
+    """
     import tarfile
 
     sav_dir = os.getcwd()
@@ -211,54 +230,66 @@ def do_tarball(workdir,srcdir,tarname):
     os.chdir(sav_dir)
     return tarname
 
-def archive_sources_from_directory(d,stage_name):
-    '''archive sources codes tree to tarball when tarball of $P doesn't exist in $DL_DIR'''
+def archive_sources_from_directory(d, stage_name):
+    """
+    archive sources codes tree to tarball when tarball of $P doesn't
+    exist in $DL_DIR
+    """
     import shutil
 
-    s = d.getVar('S',True)
+    s = d.getVar('S', True)
     work_dir=d.getVar('WORKDIR', True)
-    PF = d.getVar('PF',True)
+    PF = d.getVar('PF', True)
     tarname = PF + '-' + stage_name + ".tar.gz"
 
     if os.path.exists(s) and work_dir in s:
         try:
-            source_dir = os.path.join(work_dir,[ i for i in s.replace(work_dir,'').split('/') if i][0])
+            source_dir = os.path.join(work_dir, [ i for i in s.replace(work_dir, '').split('/') if i][0])
         except IndexError:
-            if not cmp(s,work_dir):
+            if not cmp(s, work_dir):
                 return ''
     else:
         return ''
     source = os.path.basename(source_dir)
-    return do_tarball(work_dir,source,tarname)
+    return do_tarball(work_dir, source, tarname)
 
-def archive_sources(d,stage_name):
-    '''copy tarball from $DL_DIR to $WORKDIR if have tarball, archive source codes tree in $WORKDIR if $P is directory instead of tarball'''
+def archive_sources(d, stage_name):
+    """
+    copy tarball from $DL_DIR to $WORKDIR if have tarball, archive
+    source codes tree in $WORKDIR if $P is directory instead of tarball
+    """
     import shutil
-    work_dir = d.getVar('WORKDIR',True)
-    file = get_source_from_downloads(d,stage_name)
+
+    work_dir = d.getVar('WORKDIR', True)
+    file = get_source_from_downloads(d, stage_name)
     if file:
-        shutil.copy(file,work_dir)
+        shutil.copy(file, work_dir)
         file = os.path.basename(file)
     else:
-        file = archive_sources_from_directory(d,stage_name)
+        file = archive_sources_from_directory(d, stage_name)
     return file
 
-def archive_patches(d,patchdir,series):
-    '''archive patches to tarball and also include series files if 'series' is True'''
+def archive_patches(d, patchdir, series):
+    """
+    archive patches to tarball and also include series files if 'series' is True
+    """
     import shutil
 
-    s = d.getVar('S',True)
+    s = d.getVar('S', True)
     work_dir = d.getVar('WORKDIR', True)
     patch_dir = os.path.basename(patchdir)
     tarname = patch_dir + ".tar.gz"
-    if series  == 'all' and os.path.exists(os.path.join(s,'patches/series')):
-        shutil.copy(os.path.join(s,'patches/series'),patchdir)
-    tarname = do_tarball(work_dir,patch_dir,tarname)
+    if series  == 'all' and os.path.exists(os.path.join(s, 'patches/series')):
+        shutil.copy(os.path.join(s, 'patches/series'), patchdir)
+    tarname = do_tarball(work_dir, patch_dir, tarname)
     shutil.rmtree(patchdir, ignore_errors=True)
     return tarname
 
-def select_archive_patches(d,option):
-    '''select to archive all patches including non-applying and series or applying patches '''
+def select_archive_patches(d, option):
+    """
+    select to archive all patches including non-applying and series or
+    applying patches
+    """
     if option == "all":
         patchdir = get_series(d)
     elif option == "applying":
@@ -266,25 +297,27 @@ def select_archive_patches(d,option):
     try:
         os.rmdir(patchdir)
     except OSError:
-            tarpatch = archive_patches(d,patchdir,option)
+            tarpatch = archive_patches(d, patchdir, option)
             return tarpatch
     return
 
-def archive_logs(d,logdir,bbinc=False):
-    '''archive logs in temp to tarball and .bb and .inc files if bbinc is True '''
+def archive_logs(d, logdir, bbinc=False):
+    """
+    archive logs in temp to tarball and .bb and .inc files if bbinc is True
+    """
     import shutil
 
-    pf = d.getVar('PF',True)
-    work_dir = d.getVar('WORKDIR',True)
+    pf = d.getVar('PF', True)
+    work_dir = d.getVar('WORKDIR', True)
     log_dir =  os.path.basename(logdir)
     tarname = pf + '-' + log_dir + ".tar.gz"
-    tarname = do_tarball(work_dir,log_dir,tarname)
+    tarname = do_tarball(work_dir, log_dir, tarname)
     if bbinc:
         shutil.rmtree(logdir, ignore_errors=True)
     return tarname
 
 def get_licenses(d):
-    '''get licenses for running .bb file'''
+    """get licenses for running .bb file"""
     import oe.license
 
     licenses_type = d.getVar('LICENSE', True) or ""
@@ -299,8 +332,8 @@ def get_licenses(d):
     return lice
 
 
-def move_tarball_deploy(d,tarball_list):
-    '''move tarball in location to ${DEPLOY_DIR}/sources'''
+def move_tarball_deploy(d, tarball_list):
+    """move tarball in location to ${DEPLOY_DIR}/sources"""
     import shutil
 
     if tarball_list is []:
@@ -308,100 +341,114 @@ def move_tarball_deploy(d,tarball_list):
     target_sys = d.getVar('TARGET_SYS', True)
     pf = d.getVar('PF', True)
     licenses = get_licenses(d)
-    work_dir = d.getVar('WORKDIR',True)
+    work_dir = d.getVar('WORKDIR', True)
     tar_sources = d.getVar('DEPLOY_DIR', True) + '/sources/' + target_sys + '/' + licenses + '/' + pf
     if not os.path.exists(tar_sources):
         bb.mkdirhier(tar_sources)
     for source in tarball_list:
         if source:
             if os.path.exists(os.path.join(tar_sources, source)):
-                os.remove(os.path.join(tar_sources,source))
-            shutil.move(os.path.join(work_dir,source),tar_sources)
+                os.remove(os.path.join(tar_sources, source))
+            shutil.move(os.path.join(work_dir, source), tar_sources)
 
 def check_archiving_type(d):
-    '''check the type for archiving package('tar' or 'srpm')'''
+    """check the type for archiving package('tar' or 'srpm')"""
     try:
         if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in d.getVar('ARCHIVE_TYPE', True).split():
             raise AttributeError
     except AttributeError:
         bb.fatal("\"SOURCE_ARCHIVE_PACKAGE_TYPE\" is \'tar\' or \'srpm\', no other types")
 
-def store_package(d,package_name):
-    '''store tarbablls name to file "tar-package"'''
+def store_package(d, package_name):
+    """
+    store tarbablls name to file "tar-package"
+    """
     try:
-        f = open(os.path.join(d.getVar('WORKDIR',True),'tar-package'),'a')
+        f = open(os.path.join(d.getVar('WORKDIR', True), 'tar-package'), 'a')
         f.write(package_name + ' ')
         f.close()
     except IOError:
         pass
 
 def get_package(d):
-    '''get tarballs name from "tar-package"'''
+    """
+    get tarballs name from "tar-package"
+    """
     work_dir = (d.getVar('WORKDIR', True))
-    tarpackage = os.path.join(work_dir,'tar-package')
+    tarpackage = os.path.join(work_dir, 'tar-package')
     try:
-        f = open(tarpackage,'r')
-        line = list(set(f.readline().replace('\n','').split()))
-    except UnboundLocalError,IOError:
+        f = open(tarpackage, 'r')
+        line = list(set(f.readline().replace('\n', '').split()))
+    except UnboundLocalError, IOError:
         pass
     f.close()
     return line
 
 
-def archive_sources_patches(d,stage_name):
-    '''archive sources and patches to tarball. stage_name will append strings ${stage_name} to ${PR} as middle name. for example, zlib-1.4.6-prepatch(stage_name).tar.gz '''
+def archive_sources_patches(d, stage_name):
+    """
+    archive sources and patches to tarball. stage_name will append
+    strings ${stage_name} to ${PR} as middle name. for example,
+    zlib-1.4.6-prepatch(stage_name).tar.gz
+    """
     import shutil
 
     check_archiving_type(d)
     if not_tarball(d) or tar_filter(d):
         return
 
-    source_tar_name = archive_sources(d,stage_name)
+    source_tar_name = archive_sources(d, stage_name)
     if stage_name == "prepatch":
-        if d.getVar('PATCHES_ARCHIVE_WITH_SERIES',True).upper() == 'TRUE':
-            patch_tar_name = select_archive_patches(d,"all")
-        elif d.getVar('PATCHES_ARCHIVE_WITH_SERIES',True).upper() == 'FALSE':
-            patch_tar_name = select_archive_patches(d,"applying")
+        if d.getVar('PATCHES_ARCHIVE_WITH_SERIES', True).upper() == 'TRUE':
+            patch_tar_name = select_archive_patches(d, "all")
+        elif d.getVar('PATCHES_ARCHIVE_WITH_SERIES', True).upper() == 'FALSE':
+            patch_tar_name = select_archive_patches(d, "applying")
         else:
             bb.fatal("Please define 'PATCHES_ARCHIVE_WITH_SERIES' is strings 'True' or 'False' ")
     else:
         patch_tar_name = ''
 
     if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in 'SRPM':
-        move_tarball_deploy(d,[source_tar_name,patch_tar_name])
+        move_tarball_deploy(d, [source_tar_name, patch_tar_name])
     else:
-        tarpackage = os.path.join(d.getVar('WORKDIR', True),'tar-package')
+        tarpackage = os.path.join(d.getVar('WORKDIR', True), 'tar-package')
         if os.path.exists(tarpackage):
             os.remove(tarpackage)
         for package in os.path.basename(source_tar_name), patch_tar_name:
             if package:
-                store_package(d,str(package) + ' ')
+                store_package(d, str(package) + ' ')
 
 def archive_scripts_logs(d):
-    '''archive scripts and logs. scripts include .bb and .inc files and logs include stuff in "temp".'''
+    """
+    archive scripts and logs. scripts include .bb and .inc files and
+    logs include stuff in "temp".
+    """
 
     if tar_filter(d):
         return
     work_dir = d.getVar('WORKDIR', True)
-    temp_dir = os.path.join(work_dir,'temp')
+    temp_dir = os.path.join(work_dir, 'temp')
     source_archive_log_with_scripts = d.getVar('SOURCE_ARCHIVE_LOG_WITH_SCRIPTS', True)
     if source_archive_log_with_scripts == 'logs_with_scripts':
         logdir = get_bb_inc(d)
-        tarlog = archive_logs(d,logdir,True)
+        tarlog = archive_logs(d, logdir, True)
     elif source_archive_log_with_scripts == 'logs':
         if os.path.exists(temp_dir):
-            tarlog = archive_logs(d,temp_dir,False)
+            tarlog = archive_logs(d, temp_dir, False)
     else:
         return
 
     if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in 'SRPM':
-        move_tarball_deploy(d,[tarlog])
+        move_tarball_deploy(d, [tarlog])
 
     else:
-        store_package(d,tarlog)
+        store_package(d, tarlog)
 
 def dumpdata(d):
-    '''dump environment to "${P}-${PR}.showdata.dump" including all kinds of variables and functions when running a task'''
+    """
+    dump environment to "${P}-${PR}.showdata.dump" including all
+    kinds of variables and functions when running a task
+    """
 
     if tar_filter(d):
         return
@@ -415,20 +462,23 @@ def dumpdata(d):
     if not os.path.exists(dumpdir):
         bb.mkdirhier(dumpdir)
 
-    dumpfile = os.path.join(dumpdir, bb.data.expand("${P}-${PR}.showdata.dump",d))
+    dumpfile = os.path.join(dumpdir, bb.data.expand("${P}-${PR}.showdata.dump", d))
 
     bb.note("Dumping metadata into '%s'" % dumpfile)
     f = open(dumpfile, "w")
     # emit variables and shell functions
     bb.data.emit_env(f, d, True)
-    # emit the metadata which isnt valid shell
+    # emit the metadata which isn't valid shell
     for e in d.keys():
         if bb.data.getVarFlag(e, 'python', d):
             f.write("\npython %s () {\n%s}\n" % (e, bb.data.getVar(e, d, 1)))
     f.close()
 
 def create_diff_gz(d):
-    '''creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${PR}.diff.g gz for mapping all content in 's' including patches to  xxx.diff.gz'''
+    """
+    creating .diff.gz in ${DEPLOY_DIR_SRC}/${P}-${PR}.diff.g gz for
+    mapping all content in 's' including patches to  xxx.diff.gz
+    """
     import shutil
     import subprocess
 
@@ -467,41 +517,47 @@ def create_diff_gz(d):
     bb.build.exec_func('DIFF', d)
     shutil.rmtree(s + '.org', ignore_errors=True)
 
-# This function will run when user want to get tarball for sources and patches after do_unpack
+# This function will run when user want to get tarball for sources and
+# patches after do_unpack
 python do_archive_original_sources_patches(){
-    archive_sources_patches(d,'prepatch')
+    archive_sources_patches(d, 'prepatch')
 }
 
-# This function will run when user want to get tarball for patched sources after do_patch
+# This function will run when user want to get tarball for patched
+# sources after do_patch
 python do_archive_patched_sources(){
-    archive_sources_patches(d,'patched')
+    archive_sources_patches(d, 'patched')
 }
 
-# This function will run when user want to get tarball for configured sources after do_configure
+# This function will run when user want to get tarball for configured
+# sources after do_configure
 python do_archive_configured_sources(){
-    archive_sources_patches(d,'configured')
+    archive_sources_patches(d, 'configured')
 }
 
-# This function will run when user want to get tarball for logs or both logs and scripts(.bb and .inc files)
+# This function will run when user want to get tarball for logs or both
+# logs and scripts(.bb and .inc files)
 python do_archive_scripts_logs(){
     archive_scripts_logs(d)
 }
 
-# This function will run when user want to know what variable and functions in a running task are and also can get a diff file including
+# This function will run when user want to know what variable and
+# functions in a running task are and also can get a diff file including
 # all content a package should include.
 python do_dumpdata_create_diff_gz(){
     dumpdata(d)
     create_diff_gz(d)
 }
 
-# This functions prepare for archiving "linux-yocto" because this package create directory 's' before do_patch instead of after do_unpack.
-# This is special control for archiving linux-yocto only.
+# This functions prepare for archiving "linux-yocto" because this
+# package create directory 's' before do_patch instead of after
+# do_unpack.  This is special control for archiving linux-yocto only.
 python do_archive_linux_yocto(){
     s = d.getVar('S', True)
     if 'linux-yocto' in s:
-        source_tar_name = archive_sources(d,'')
+        source_tar_name = archive_sources(d, '')
     if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True).upper() not in 'SRPM':
-        move_tarball_deploy(d,[source_tar_name,''])
+        move_tarball_deploy(d, [source_tar_name, ''])
 }
 do_kernel_checkout[postfuncs] += "do_archive_linux_yocto "
 
@@ -513,8 +569,8 @@ python do_remove_tarball(){
             for file in os.listdir(os.getcwd()):
                 if file in get_package(d):
                     os.remove(file)
-            os.remove(os.path.join(work_dir,'tar-package'))
-        except (TypeError,OSError):
+            os.remove(os.path.join(work_dir, 'tar-package'))
+        except (TypeError, OSError):
             pass
 }
 do_remove_taball[deptask] = "do_archive_scripts_logs"
-- 
1.7.11.2



