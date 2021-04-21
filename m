Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web08.3302.1619039311494756845
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 14:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NyMalR2h;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: devendra.tewari@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id i12so12767522qke.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Apr 2021 14:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references;
        bh=HYVekaBbYMvOAf88wymYpxKUuxrJZvEnPxuEiPnK2h0=;
        b=NyMalR2hLatnkRap0DdscgWA+Q1zicDojWLX1aCmP1+XSdOHdoUo6i9TWcxgCYiFT2
         birEXgvukmiPoDYmiPqpsjDnW96tuM1Kd2iN9X/Sg+tHZDEAdRmsm4h8thdL8Q8cQJm5
         7sGZvbj1+zzItDtgz0gI5/b/MIHbLLTAH6aKNB4+XLW1j/vbGD+agAqPOGZrH5x60AMz
         k8LXePDo90CSXIi7UDVxC2z2DrvDXSGpJhGkFg6PAIwMSke64gh5zWtU9jY0tNvFNNI3
         Dbop59KLqrKTnPmmTEh1zgTF6Wr/HeDU/P5vX5kTEZfxJvRzv95pTmOvMnXbIrWI9/Ew
         ZwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references;
        bh=HYVekaBbYMvOAf88wymYpxKUuxrJZvEnPxuEiPnK2h0=;
        b=eEfuqsCAGItDXlkDddmeSvLwFZF2pnsBdUxxXZc0jhdZuZf9sfJQsk+VBpYtFxEzHB
         4TTvOf8EcbEKh9VjMTXP2WbnyL3hluQCOovD2Vq2dsvJeKweAOTZi0bEAtKaNZdB7uhm
         rj3cFAoHOUw95yxan9caKEZeo/sKtaUBWNgNpn0KqMbJj+YXAhsMKvc1VsyJS4qnWnEZ
         OCAIBeYvsqTem+BNEzqKNmKeWNtWHWU3btrkjY4tp7U4lhBGor/ZolpuUm5EMe9g71H6
         lwDJTCY2leKAEUM9Vt4L3gSleo1igUV6DvIsQK+onJW/cIByHopUzLCocFFacd/Jjs7c
         5OSg==
X-Gm-Message-State: AOAM533TGb06MkCgBEHfg/KkKOGNHSj3MG8Jo/g4rwyaNEn4sY4q2k8h
	cdSRnqmKbTeYafInTPnDjo0=
X-Google-Smtp-Source: ABdhPJysxEHaFm5mQ3tYAE2dqZT4VmjYtK0DUll16jJuzHqgwQDcjCHGvPhLvjV7sg8fheL9WzAZYQ==
X-Received: by 2002:a37:34d:: with SMTP id 74mr133804qkd.141.1619039310594;
        Wed, 21 Apr 2021 14:08:30 -0700 (PDT)
Return-Path: <devendra.tewari@gmail.com>
Received: from [192.168.0.2] ([177.183.205.78])
        by smtp.gmail.com with ESMTPSA id c14sm617828qtc.5.2021.04.21.14.08.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Apr 2021 14:08:29 -0700 (PDT)
From: "Devendra Tewari" <devendra.tewari@gmail.com>
Message-Id: <4538E61E-9CE7-4346-877F-FA6CEAEB5074@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
Date: Wed, 21 Apr 2021 18:08:25 -0300
In-Reply-To: <aebbbcf8d29afec37b4a9c459eca8ab24112137f.camel@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>,
 Andre McCurdy <armccurdy@gmail.com>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <d59ab2e71f0115018fb1c957276ce71e3292cd95.camel@linuxfoundation.org>
 <F32A7470-A864-41C0-BA9C-FB611421DC0F@gmail.com>
 <aebbbcf8d29afec37b4a9c459eca8ab24112137f.camel@linuxfoundation.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Groupsio-MsgNum: 150756
Content-Type: multipart/mixed;
	boundary="Apple-Mail=_4096B068-C892-4A7D-B0A7-4EDC11A8A882"

--Apple-Mail=_4096B068-C892-4A7D-B0A7-4EDC11A8A882
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

Separate patches for bitbake and oe-core, as requested



I've assumed each will be applied to the master-next branch on top of the previous patch.

Thanks,
Devendra

> On 21 Apr 2021, at 16:21, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> 
> On Wed, 2021-04-21 at 16:15 -0300, Devendra Tewari wrote:
>> That's a neat idea - if the exception handler catches OSError with error number 
>> 18 (Invalid cross-device link) in os.rename, it should attempt shutil.move, 
>> otherwise it should re-throw the exception with raise. A wrapper function 
>> will make it easier to handle other situations as they arise. I'll update the patch.
> 
> Sounds good. Could you also please split the patch into two, one for bitbake
> and one for OE-Core since they are two different repositories.
> 
> Cheers,
> 
> Richard
> 


--Apple-Mail=_4096B068-C892-4A7D-B0A7-4EDC11A8A882
Content-Disposition: attachment;
	filename=0001-use-bb.utils.rename-to-rename-file-or-directory.patch
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="0001-use-bb.utils.rename-to-rename-file-or-directory.patch"
Content-Transfer-Encoding: quoted-printable

From ec0d5beef8a121b1afeb6e8ae72484ba690ab9e6 Mon Sep 17 00:00:00 2001
From: Devendra Tewari <devendra.tewari@gmail.com>
Date: Wed, 21 Apr 2021 17:57:48 -0300
Subject: [PATCH] use bb.utils.rename to rename file or directory

bb.utils.rename handles cross-device link error with os.rename and
retries with shutil.move.

[YOCTO #14301]

Signed-off-by: Devendra Tewari <devendra.tewari@gmail.com>
---
 lib/bb/siggen.py      |  6 +-----
 lib/bb/tests/fetch.py | 13 ++-----------
 lib/bb/utils.py       | 28 +++++++++++++++-------------
 3 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/lib/bb/siggen.py b/lib/bb/siggen.py
index cf89e214..574beb30 100644
--- a/lib/bb/siggen.py
+++ b/lib/bb/siggen.py
@@ -341,7 +341,6 @@ class SignatureGeneratorBasic(SignatureGenerator):
         self.unihash_cache.save(self.unitaskhashes)
=20
     def dump_sigtask(self, fn, task, stampbase, runtime):
-        import shutil
=20
         tid =3D fn + ":" + task
         referencestamp =3D stampbase
@@ -403,10 +402,7 @@ class SignatureGeneratorBasic(SignatureGenerator):
                 p =3D pickle.dump(data, stream, -1)
                 stream.flush()
             os.chmod(tmpfile, 0o664)
-            try:
-                os.rename(tmpfile, sigfile)
-            except OSError:
-                shutil.move(tmpfile, sigfile)
+            bb.utils.rename(tmpfile, sigfile)
         except (OSError, IOError) as err:
             try:
                 os.unlink(tmpfile)
diff --git a/lib/bb/tests/fetch.py b/lib/bb/tests/fetch.py
index 89207559..9291ce4a 100644
--- a/lib/bb/tests/fetch.py
+++ b/lib/bb/tests/fetch.py
@@ -1772,7 +1772,6 @@ class GitShallowTest(FetcherTest):
         self.assertRevCount(1, cwd=3Dos.path.join(self.gitdir, 'gitsubmodu=
le'))
=20
     def test_shallow_submodule_mirrors(self):
-        import shutil
         self.add_empty_file('a')
         self.add_empty_file('b')
=20
@@ -1799,10 +1798,7 @@ class GitShallowTest(FetcherTest):
=20
         # Set up the mirror
         mirrordir =3D os.path.join(self.tempdir, 'mirror')
-        try:
-            os.rename(self.dldir, mirrordir)
-        except OSError:
-            shutil.move(self.dldir, mirrordir)
+        bb.utils.rename(self.dldir, mirrordir)
         self.d.setVar('PREMIRRORS', 'gitsm://.*/.* file://%s/\n' % mirrord=
ir)
=20
         # Fetch from the mirror
@@ -1907,7 +1903,6 @@ class GitShallowTest(FetcherTest):
         assert not os.path.exists(os.path.join(self.gitdir, '.git', 'shall=
ow'))
=20
     def test_shallow_mirrors(self):
-        import shutil
         self.add_empty_file('a')
         self.add_empty_file('b')
=20
@@ -1921,11 +1916,7 @@ class GitShallowTest(FetcherTest):
         bb.utils.mkdirhier(mirrordir)
         self.d.setVar('PREMIRRORS', 'git://.*/.* file://%s/\n' % mirrordir=
)
=20
-        try:
-            os.rename(os.path.join(self.dldir, mirrortarball),
-                  os.path.join(mirrordir, mirrortarball))
-        except OSError:
-            shutil.move(os.path.join(self.dldir, mirrortarball),
+        bb.utils.rename(os.path.join(self.dldir, mirrortarball),
                   os.path.join(mirrordir, mirrortarball))
=20
         # Fetch from the mirror
diff --git a/lib/bb/utils.py b/lib/bb/utils.py
index f289f566..0f68b0ae 100644
--- a/lib/bb/utils.py
+++ b/lib/bb/utils.py
@@ -736,7 +736,6 @@ def movefile(src, dest, newmtime =3D None, sstat =3D No=
ne):
     filesystems.  Returns true on success and false on failure. Move is
     atomic.
     """
-    import shutil
=20
     #print "movefile(" + src + "," + dest + "," + str(newmtime) + "," + st=
r(sstat) + ")"
     try:
@@ -783,10 +782,7 @@ def movefile(src, dest, newmtime =3D None, sstat =3D N=
one):
=20
     if sstat[stat.ST_DEV] =3D=3D dstat[stat.ST_DEV]:
         try:
-            try:
-                os.rename(src, destpath)
-            except OSError:
-                shutil.move(src, destpath)
+            bb.utils.rename(src, destpath)
             renamefailed =3D 0
         except Exception as e:
             if e.errno !=3D errno.EXDEV:
@@ -800,10 +796,7 @@ def movefile(src, dest, newmtime =3D None, sstat =3D N=
one):
         if stat.S_ISREG(sstat[stat.ST_MODE]):
             try: # For safety copy then move it over.
                 shutil.copyfile(src, destpath + "#new")
-                try:
-                    os.rename(destpath + "#new", destpath)
-                except OSError:
-                    shutil.move(destpath + "#new", destpath)
+                bb.utils.rename(destpath + "#new", destpath)
                 didcopy =3D 1
             except Exception as e:
                 print('movefile: copy', src, '->', dest, 'failed.', e)
@@ -881,10 +874,7 @@ def copyfile(src, dest, newmtime =3D None, sstat =3D N=
one):
=20
             # For safety copy then move it over.
             shutil.copyfile(src, dest + "#new")
-            try:
-                os.rename(dest + "#new", dest)
-            except OSError:
-                shutil.move(dest + "#new", dest)
+            bb.utils.rename(dest + "#new", dest)
         except Exception as e:
             logger.warning("copyfile: copy %s to %s failed (%s)" % (src, d=
est, e))
             return False
@@ -1679,3 +1669,15 @@ def is_semver(version):
         return False
=20
     return True
+
+def rename(src, dst):
+    import os
+    import shutil
+    try:
+        os.rename(src, dst)
+    except OSError as err:
+        if err.errno =3D=3D 18:
+            # Invalid cross-device link error
+            shutil.move(src, dst)
+        else:
+            raise err
--=20
2.29.2


--Apple-Mail=_4096B068-C892-4A7D-B0A7-4EDC11A8A882
Content-Disposition: attachment;
	filename=0001-use-bb.utils.rename-to-rename-file-or-directory.patch
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="0001-use-bb.utils.rename-to-rename-file-or-directory.patch"
Content-Transfer-Encoding: quoted-printable

From e5af200e902edfbec9e2017ff6b008dbb40b6379 Mon Sep 17 00:00:00 2001
From: Devendra Tewari <devendra.tewari@gmail.com>
Date: Wed, 21 Apr 2021 17:49:48 -0300
Subject: [PATCH] use bb.utils.rename to rename file or directory

bb.utils.rename handles cross-device link error with os.rename and
retries with shutil.move.

[YOCTO #14301]

Signed-off-by: Devendra Tewari <devendra.tewari@gmail.com>
---
 meta/classes/buildhistory.bbclass           |  6 +-----
 meta/classes/package.bbclass                | 12 ++---------
 meta/classes/populate_sdk_ext.bbclass       | 10 ++--------
 meta/classes/reproducible_build.bbclass     |  6 +-----
 meta/classes/sstate.bbclass                 | 22 ++++-----------------
 meta/classes/update-alternatives.bbclass    | 11 ++---------
 meta/lib/oe/package_manager/deb/__init__.py | 18 +++--------------
 meta/lib/oe/package_manager/ipk/__init__.py |  5 +----
 meta/lib/oe/rootfs.py                       | 15 +++-----------
 meta/lib/oeqa/selftest/cases/wic.py         | 16 +++------------
 scripts/combo-layer                         |  5 +----
 scripts/lib/devtool/standard.py             | 21 ++++----------------
 scripts/lib/devtool/upgrade.py              |  8 ++------
 scripts/lib/wic/plugins/imager/direct.py    |  5 +----
 14 files changed, 30 insertions(+), 130 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass
index 554c8810ac..059de36a5d 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -875,11 +875,7 @@ python buildhistory_eventhandler() {
                 entries =3D [ x for x in os.listdir(rootdir) if not x.star=
tswith('.') ]
                 bb.utils.mkdirhier(olddir)
                 for entry in entries:
-                    try:
-                        os.rename(os.path.join(rootdir, entry),
-                              os.path.join(olddir, entry))
-                    except OSError:
-                        shutil.move(os.path.join(rootdir, entry),
+                    bb.utils.rename(os.path.join(rootdir, entry),
                               os.path.join(olddir, entry))
         elif isinstance(e, bb.event.BuildCompleted):
             if reset:
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 6707c2e9db..cf30f33f3d 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -835,7 +835,6 @@ perform_packagecopy[dirs] =3D "${PKGD}"
 # the fs-perms.txt files
 python fixup_perms () {
     import pwd, grp
-    import shutil
=20
     # init using a string with the same format as a line as documented in
     # the fs-perms.txt file
@@ -1050,10 +1049,7 @@ python fixup_perms () {
         # Create path to move directory to, move it, and then setup the sy=
mlink
         bb.utils.mkdirhier(os.path.dirname(target))
         #bb.note("Fixup Perms: Rename %s -> %s" % (dir, ptarget))
-        try:
-            os.rename(origin, target)
-        except OSError:
-            shutil.move(origin, target)
+        bb.utils.rename(origin, target)
         #bb.note("Fixup Perms: Link %s -> %s" % (dir, link))
         os.symlink(link, origin)
=20
@@ -1780,7 +1776,6 @@ python package_do_shlibs() {
     import itertools
     import re, pipes
     import subprocess
-    import shutil
=20
     exclude_shlibs =3D d.getVar('EXCLUDE_FROM_SHLIBS', False)
     if exclude_shlibs:
@@ -1972,10 +1967,7 @@ python package_do_shlibs() {
=20
         for (old, new) in renames:
             bb.note("Renaming %s to %s" % (old, new))
-            try:
-                os.rename(old, new)
-            except OSError:
-                shutil.move(old, new)
+            bb.utils.rename(old, new)
             pkgfiles[pkg].remove(old)
=20
         shlibs_file =3D os.path.join(shlibswork_dir, pkg + ".list")
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_=
sdk_ext.bbclass
index 12e758c2ad..fe840d9cfb 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -165,10 +165,7 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistf=
ile, conf_initpath):
             shutil.rmtree(temp_sdkbasepath)
         except FileNotFoundError:
             pass
-        try:
-            os.rename(sdkbasepath, temp_sdkbasepath)
-        except OSError:
-            shutil.move(sdkbasepath, temp_sdkbasepath)
+        bb.utils.rename(sdkbasepath, temp_sdkbasepath)
         cmdprefix =3D '. %s .; ' % conf_initpath
         logfile =3D d.getVar('WORKDIR') + '/tasklist_bb_log.txt'
         try:
@@ -178,10 +175,7 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistf=
ile, conf_initpath):
             if 'attempted to execute unexpectedly and should have been set=
scened' in e.stdout:
                 msg +=3D '\n----------\n\nNOTE: "attempted to execute unex=
pectedly and should have been setscened" errors indicate this may be caused=
 by missing sstate artifacts that were likely produced in earlier builds, b=
ut have been subsequently deleted for some reason.\n'
             bb.fatal(msg)
-        try:
-            os.rename(temp_sdkbasepath, sdkbasepath)
-        except OSError:
-            shutil.move(temp_sdkbasepath, sdkbasepath)
+        bb.utils.rename(temp_sdkbasepath, sdkbasepath)
         # Clean out residue of running bitbake, which check_sstate_task_li=
st()
         # will effectively do
         clean_esdk_builddir(d, sdkbasepath)
diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reprodu=
cible_build.bbclass
index 480d58f86d..f2d9324440 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -57,17 +57,13 @@ do_deploy_source_date_epoch () {
 }
=20
 python do_deploy_source_date_epoch_setscene () {
-    import shutil
     sstate_setscene(d)
     bb.utils.mkdirhier(d.getVar('SDE_DIR'))
     sde_file =3D os.path.join(d.getVar('SDE_DEPLOYDIR'), '__source_date_ep=
och.txt')
     if os.path.exists(sde_file):
         target =3D d.getVar('SDE_FILE')
         bb.debug(1, "Moving setscene SDE file %s -> %s" % (sde_file, targe=
t))
-        try:
-            os.rename(sde_file, target)
-        except OSError:
-            shutil.move(sde_file, target)
+        bb.utils.rename(sde_file, target)
     else:
         bb.debug(1, "%s not found!" % sde_file)
 }
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 60f7a94285..b1c608dcb1 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -384,7 +384,6 @@ def sstate_installpkg(ss, d):
 def sstate_installpkgdir(ss, d):
     import oe.path
     import subprocess
-    import shutil
=20
     sstateinst =3D d.getVar("SSTATE_INSTDIR")
     d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
@@ -402,10 +401,7 @@ def sstate_installpkgdir(ss, d):
=20
     for state in ss['dirs']:
         prepdir(state[1])
-        try:
-            os.rename(sstateinst + state[0], state[1])
-        except OSError:
-            shutil.move(sstateinst + state[0], state[1])
+        bb.utils.rename(sstateinst + state[0], state[1])
     sstate_install(ss, d)
=20
     for plain in ss['plaindirs']:
@@ -417,10 +413,7 @@ def sstate_installpkgdir(ss, d):
         dest =3D plain
         bb.utils.mkdirhier(src)
         prepdir(dest)
-        try:
-            os.rename(src, dest)
-        except OSError:
-            shutil.move(src, dest)
+        bb.utils.rename(src, dest)
=20
     return True
=20
@@ -645,7 +638,6 @@ python sstate_hardcode_path () {
=20
 def sstate_package(ss, d):
     import oe.path
-    import shutil
=20
     tmpdir =3D d.getVar('TMPDIR')
=20
@@ -672,10 +664,7 @@ def sstate_package(ss, d):
                     continue
                 bb.error("sstate found an absolute path symlink %s pointin=
g at %s. Please replace this with a relative link." % (srcpath, link))
         bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1], s=
statebuild + state[0]))
-        try:
-            os.rename(state[1], sstatebuild + state[0])
-        except OSError:
-            shutil.move(state[1], sstatebuild + state[0])
+        bb.utils.rename(state[1], sstatebuild + state[0])
=20
     workdir =3D d.getVar('WORKDIR')
     sharedworkdir =3D os.path.join(d.getVar('TMPDIR'), "work-shared")
@@ -685,10 +674,7 @@ def sstate_package(ss, d):
             pdir =3D plain.replace(sharedworkdir, sstatebuild)
         bb.utils.mkdirhier(plain)
         bb.utils.mkdirhier(pdir)
-        try:
-            os.rename(plain, pdir)
-        except OSError:
-            shutil.move(plain, pdir)
+        bb.utils.rename(plain, pdir)
=20
     d.setVar('SSTATE_BUILDDIR', sstatebuild)
     d.setVar('SSTATE_INSTDIR', sstatebuild)
diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update=
-alternatives.bbclass
index 7e213472e3..000e4d5664 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -139,7 +139,6 @@ python apply_update_alternative_renames () {
        return
=20
     import re
-    import shutil
=20
     def update_files(alt_target, alt_target_rename, pkg, d):
         f =3D d.getVar('FILES_' + pkg)
@@ -185,10 +184,7 @@ python apply_update_alternative_renames () {
                         link_rename.append((alt_target, alt_target_rename)=
)
                     else:
                         bb.note('%s: Rename %s -> %s' % (pn, alt_target, a=
lt_target_rename))
-                        try:
-                            os.rename(src, dest)
-                        except OSError:
-                            shutil.move(src, dest)
+                        bb.utils.rename(src, dest)
                         update_files(alt_target, alt_target_rename, pkg, d=
)
                 else:
                     bb.warn("%s: alternative target (%s or %s) does not ex=
ist, skipping..." % (pn, alt_target, alt_target_rename))
@@ -205,10 +201,7 @@ python apply_update_alternative_renames () {
             if os.path.lexists(link_target):
                 # Ok, the link_target exists, we can rename
                 bb.note('%s: Rename (link) %s -> %s' % (pn, alt_target, al=
t_target_rename))
-                try:
-                    os.rename(src, dest)
-                except OSError:
-                    shutil.move(src, dest)
+                bb.utils.rename(src, dest)
             else:
                 # Try to resolve the broken link to link.${BPN}
                 link_maybe =3D '%s.%s' % (os.readlink(src), pn)
diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/pack=
age_manager/deb/__init__.py
index 8edc653dff..a4b6b6f647 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -5,7 +5,6 @@
 import re
 import subprocess
 from oe.package_manager import *
-import shutil
=20
 class DpkgIndexer(Indexer):
     def _create_configs(self):
@@ -215,10 +214,7 @@ class DpkgPM(OpkgDpkgPM):
=20
                     tmp_sf.write(status)
=20
-        try:
-            os.rename(status_file + ".tmp", status_file)
-        except OSError:
-            shutil.move(status_file + ".tmp", status_file)
+        bb.utils.rename(status_file + ".tmp", status_file)
=20
     def run_pre_post_installs(self, package_name=3DNone):
         """
@@ -303,21 +299,13 @@ class DpkgPM(OpkgDpkgPM):
             for dir in dirs:
                 new_dir =3D re.sub(r"\.dpkg-new", "", dir)
                 if dir !=3D new_dir:
-                    try:
-                        os.rename(os.path.join(root, dir),
-                              os.path.join(root, new_dir))
-                    except OSError:
-                        shutil.move(os.path.join(root, dir),
+                    bb.utils.rename(os.path.join(root, dir),
                               os.path.join(root, new_dir))
=20
             for file in files:
                 new_file =3D re.sub(r"\.dpkg-new", "", file)
                 if file !=3D new_file:
-                    try:
-                        os.rename(os.path.join(root, file),
-                              os.path.join(root, new_file))
-                    except OSError:
-                        shutil.move(os.path.join(root, file),
+                    bb.utils.rename(os.path.join(root, file),
                               os.path.join(root, new_file))
=20
=20
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/pack=
age_manager/ipk/__init__.py
index 2aa21949f3..4cd3963111 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -213,10 +213,7 @@ class OpkgPM(OpkgDpkgPM):
=20
                     tmp_sf.write(status)
=20
-        try:
-            os.rename(status_file + ".tmp", status_file)
-        except OSError:
-            shutil.move(status_file + ".tmp", status_file)
+        bb.utils.rename(status_file + ".tmp", status_file)
=20
     def _create_custom_config(self):
         bb.note("Building from feeds activated!")
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index ef00010047..a7cc4e084a 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -114,10 +114,7 @@ class Rootfs(object, metaclass=3DABCMeta):
             shutil.rmtree(self.image_rootfs + '-orig')
         except:
             pass
-        try:
-            os.rename(self.image_rootfs, self.image_rootfs + '-orig')
-        except OSError:
-            shutil.move(self.image_rootfs, self.image_rootfs + '-orig')
+        bb.utils.rename(self.image_rootfs, self.image_rootfs + '-orig')
=20
         bb.note("  Creating debug rootfs...")
         bb.utils.mkdirhier(self.image_rootfs)
@@ -168,16 +165,10 @@ class Rootfs(object, metaclass=3DABCMeta):
             shutil.rmtree(self.image_rootfs + '-dbg')
         except:
             pass
-        try:
-            os.rename(self.image_rootfs, self.image_rootfs + '-dbg')
-        except OSError:
-            shutil.move(self.image_rootfs, self.image_rootfs + '-dbg')
+        bb.utils.rename(self.image_rootfs, self.image_rootfs + '-dbg')
=20
         bb.note("  Restoreing original rootfs...")
-        try:
-            os.rename(self.image_rootfs + '-orig', self.image_rootfs)
-        except OSError:
-            shutil.move(self.image_rootfs + '-orig', self.image_rootfs)
+        bb.utils.rename(self.image_rootfs + '-orig', self.image_rootfs)
=20
     def _exec_shell_cmd(self, cmd):
         fakerootcmd =3D self.d.getVar('FAKEROOT')
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/c=
ases/wic.py
index fa93973087..a11e2d0781 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1269,7 +1269,6 @@ class Wic2(WicTestCase):
=20
     def test_expand_mbr_image(self):
         """Test wic write --expand command for mbr image"""
-        import shutil
         # build an image
         config =3D 'IMAGE_FSTYPES =3D "wic"\nWKS_FILE =3D "directdisk.wks"=
\n'
         self.append_config(config)
@@ -1307,14 +1306,8 @@ class Wic2(WicTestCase):
             result =3D runCmd("%s/usr/sbin/sfdisk -F %s" % (sysroot, new_i=
mage_path))
             self.assertTrue("0 B, 0 bytes, 0 sectors" in result.output)
=20
-            try:
-                os.rename(image_path, image_path + '.bak')
-            except OSError:
-                shutil.move(image_path, image_path + '.bak')
-            try:
-                os.rename(new_image_path, image_path)
-            except OSError:
-                shutil.move(new_image_path, image_path)
+            bb.utils.rename(image_path, image_path + '.bak')
+            bb.utils.rename(new_image_path, image_path)
=20
             # Check if it boots in qemu
             with runqemu('core-image-minimal', ssh=3DFalse) as qemu:
@@ -1325,10 +1318,7 @@ class Wic2(WicTestCase):
             if os.path.exists(new_image_path):
                 os.unlink(new_image_path)
             if os.path.exists(image_path + '.bak'):
-                try:
-                    os.rename(image_path + '.bak', image_path)
-                except OSError:
-                    shutil.move(image_path + '.bak', image_path)
+                bb.utils.rename(image_path + '.bak', image_path)
=20
     def test_wic_ls_ext(self):
         """Test listing content of the ext partition using 'wic ls'"""
diff --git a/scripts/combo-layer b/scripts/combo-layer
index 1b88340b6e..045de65642 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -508,10 +508,7 @@ def check_patch(patchfile):
     f.close()
     if of:
         of.close()
-        try:
-            os.rename(patchfile + '.tmp', patchfile)
-        except OSError:
-            shutil.move(patchfile + '.tmp', patchfile)
+        bb.utils.rename(patchfile + '.tmp', patchfile)
=20
 def drop_to_shell(workdir=3DNone):
     if not sys.stdin.isatty():
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index 3854dfb3e8..5eba2191d9 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -746,10 +746,7 @@ def _check_preserve(config, recipename):
                         os.remove(removefile)
                 else:
                     tf.write(line)
-    try:
-        os.rename(newfile, origfile)
-    except OSError:
-        shutil.move(newfile, origfile)
+    bb.utils.rename(newfile, origfile)
=20
 def get_staging_kver(srcdir):
     # Kernel version from work-shared
@@ -1097,16 +1094,10 @@ def rename(args, config, basepath, workspace):
=20
     # Rename bbappend
     logger.info('Renaming %s to %s' % (append, newappend))
-    try:
-        os.rename(append, newappend)
-    except OSError:
-        shutil.move(append, newappend)
+    bb.utils.rename(append, newappend)
     # Rename recipe file
     logger.info('Renaming %s to %s' % (recipefile, newfile))
-    try:
-        os.rename(recipefile, newfile)
-    except OSError:
-        shutil.move(recipefile, newfile)
+    bb.utils.rename(recipefile, newfile)
=20
     # Rename source tree if it's the default path
     appendmd5 =3D None
@@ -1342,11 +1333,7 @@ def _export_patches(srctree, rd, start_rev, destdir,=
 changed_revs=3DNone):
         if match_name:
             # Rename patch files
             if new_patch !=3D match_name:
-                try:
-                    os.rename(os.path.join(destdir, new_patch),
-                          os.path.join(destdir, match_name))
-                except OSError:
-                    shutil.move(os.path.join(destdir, new_patch),
+                bb.utils.rename(os.path.join(destdir, new_patch),
                           os.path.join(destdir, match_name))
             # Need to pop it off the list now before checking changed_revs
             oldpath =3D existing_patches.pop(old_patch)
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index 2bff69f5a2..24e3700ece 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -71,12 +71,8 @@ def _rename_recipe_dirs(oldpv, newpv, path):
                 if oldfile.find(oldpv) !=3D -1:
                     newfile =3D oldfile.replace(oldpv, newpv)
                     if oldfile !=3D newfile:
-                        try:
-                            os.rename(os.path.join(path, oldfile),
-                                  os.path.join(path, newfile))
-                        except OSError:
-                            shutil.move(os.path.join(path, oldfile),
-                                  os.path.join(path, newfile))
+                        bb.utils.rename(os.path.join(path, oldfile),
+                              os.path.join(path, newfile))
=20
 def _rename_recipe_file(oldrecipe, bpn, oldpv, newpv, path):
     oldrecipe =3D os.path.basename(oldrecipe)
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plu=
gins/imager/direct.py
index fb5e52b2a6..96168aadb4 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -616,8 +616,5 @@ class PartitionedImage():
                              part.start + part.size_sec - 1, part.size_sec=
)
=20
                 partimage =3D self.path + '.p%d' % part.num
-                try:
-                    os.rename(source, partimage)
-                except OSError:
-                    shutil.move(source, partimage)
+                bb.utils.rename(source, partimage)
                 self.partimages.append(partimage)
--=20
2.29.2


--Apple-Mail=_4096B068-C892-4A7D-B0A7-4EDC11A8A882--
