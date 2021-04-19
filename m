Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web08.2958.1618857797564688047
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 11:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KNdhFDQ7;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: devendra.tewari@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id q136so15890462qka.7
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 11:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references;
        bh=sYdrnjvLGVQJqCo6nuP8Nn/Ct4P41kU9qIXa6FA2UIQ=;
        b=KNdhFDQ7xIYpcp/dnIV0gg8hSB93e6GJj6ZofxW2J2xWbq5y2HovFnBaCnHk/YV0tp
         UETQe+tRbWyIp3EfMWCE6jSEplnfhx0rBb6ThUNzHm7Xb07nwei2ff8y6M3MTlN+HJ4j
         wiRH2AqN2m0e3sxI/dWFXxuYPOTYDPfBBOpa40OQxLIDn+SLzU4fr7o0iU+nw1xZRtUa
         8KeNfuJ7MzQiCCsD+XxBW0gag7FuUKibu4sDmnZmhGSo4Mx0bfIifHtF2k08cBRB6/4R
         Zzk0+N2DJu0I64C97tmp+vfZlTeQFBbk6vez7zWPbUE2/N8XtfjrFHkNMpPrOZUIDEVw
         PQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references;
        bh=sYdrnjvLGVQJqCo6nuP8Nn/Ct4P41kU9qIXa6FA2UIQ=;
        b=Z07hGAn45rgK+i2a78vpCy/zF6vdEiHr5dSsYOK38kg6BFiNPeEcsnnWbivJiZdvJo
         1/yg7Gn7Zbpknt6yR5r/JtZXHQ3biYp3yJSHf7qhTDNitYEQBsyrg6di8U/Kh/U+kGLy
         TAqu66MqHzRBxuWulcVOZtCXfTQsQrTgTnSA4e1+w3LimAHdGlwE1kw5rZ5RP1VsiE9q
         K1QMc2Oj+97awAQHDcr8uU7SL7h+G+EPcl/0ia8fyIfjF/Jr9/VmF1OcsF0wCoFs9iwr
         u4+J8PZejK06V66F7ADczJBiIofmpP3I8Dauu652jyeqXrb3nG+TfkVXXn+5NXXiPpNU
         4nLA==
X-Gm-Message-State: AOAM5327fr/rgyKPNYSsbYBIUxdgIYjRvYHYutQ+tKv34LReSHd+GBA8
	haFdPEHEOP2IYjknob4zyDY=
X-Google-Smtp-Source: ABdhPJzFK0d/eBcc1kp2SKTJDxOPItCl3DIwtnC7TNUfUP97VZlH288yPcdYDCBIGqAWeiimK6Kmiw==
X-Received: by 2002:a05:620a:2947:: with SMTP id n7mr13354932qkp.450.1618857796675;
        Mon, 19 Apr 2021 11:43:16 -0700 (PDT)
Return-Path: <devendra.tewari@gmail.com>
Received: from ?IPv6:2804:14d:5487:a7d6:84f:a3ad:df09:324a? ([2804:14d:5487:a7d6:84f:a3ad:df09:324a])
        by smtp.gmail.com with ESMTPSA id q28sm10313743qkm.15.2021.04.19.11.43.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 11:43:16 -0700 (PDT)
From: "Devendra Tewari" <devendra.tewari@gmail.com>
Message-Id: <11AB69BD-5B82-4674-A447-598985EE074C@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
Date: Mon, 19 Apr 2021 15:43:11 -0300
In-Reply-To: <0121485F-194F-4521-82BA-E878B7DC3521@gmail.com>
Cc: Andre McCurdy <armccurdy@gmail.com>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20210329151442.86306-1-devendra.tewari@gmail.com>
 <9e81b71466b771c55d8859e7d156b662e1c3d4f7.camel@linuxfoundation.org>
 <CBEFAFBB-3A73-41E2-A177-BBE047E615D1@gmail.com>
 <CAJ86T=Xn9tLHWrqqr1ZV9rAwZD7sG6x0QsyVRkUSKLwiGQKL8g@mail.gmail.com>
 <5d0a0ca838cba8fd43d3e2b5a3288f03f6ff8c96.camel@linuxfoundation.org>
 <0121485F-194F-4521-82BA-E878B7DC3521@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Groupsio-MsgNum: 150682
Content-Type: multipart/mixed;
	boundary="Apple-Mail=_8B2DCEB9-70EE-4AEF-B7D6-46821BBEDD2B"

--Apple-Mail=_8B2DCEB9-70EE-4AEF-B7D6-46821BBEDD2B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 30 Mar 2021, at 08:55, Devendra Tewari <devendra.tewari@gmail.com> wr=
ote:
>=20
> I understand that parallel tasks can result in such issues, but would ex=
pect some kind of dependency graph that would prevent them from happening. =
I wish I had more time to understand the issue fully.
>=20
> Here=E2=80=99s the last version of my patch that still uses os.rename, a=
nd on error uses shutil.move, with the reasoning explained in the commit me=
ssage. There are tons of os.rename in code elsewhere, and I=E2=80=99ve enco=
untered similar issues when doing incremental builds, but I=E2=80=99ll leav=
e fixing them to those with more time at hand. Cheers.

Here=E2=80=99s a patch that catches error with all os.rename in the code, =
and retries with shutil.move when that happens.


>=20
> From aeba1f9728f69cdf2ce4ba285be86761d8024f9d Mon Sep 17 00:00:00 2001
> From: Devendra Tewari <devendra.tewari@gmail.com>
> Date: Tue, 30 Mar 2021 08:27:40 -0300
> Subject: [PATCH] Use shutil.move when os.rename fails
>=20
> Incremental build in Docker fails with
>=20
> OSError: [Errno 18] Invalid cross-device link
>=20
> When source and destination are on different overlay filesystems.
>=20
> This change handles error with os.rename and retries with shutil.move.
> The reason os.rename is still used is because shutil.move is too slow
> for speed sensitive sections of code.
> ---
> meta/classes/sstate.bbclass | 22 ++++++++++++++++++----
> 1 file changed, 18 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index f579168162..301dfc27db 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -384,6 +384,7 @@ def sstate_installpkg(ss, d):
> def sstate_installpkgdir(ss, d):
>     import oe.path
>     import subprocess
> +    import shutil
>=20
>     sstateinst =3D d.getVar("SSTATE_INSTDIR")
>     d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
> @@ -401,7 +402,10 @@ def sstate_installpkgdir(ss, d):
>=20
>     for state in ss['dirs']:
>         prepdir(state[1])
> -        os.rename(sstateinst + state[0], state[1])
> +        try:
> +            os.rename(sstateinst + state[0], state[1])
> +        except OSError:
> +            shutil.move(sstateinst + state[0], state[1])
>     sstate_install(ss, d)
>=20
>     for plain in ss['plaindirs']:
> @@ -413,7 +417,10 @@ def sstate_installpkgdir(ss, d):
>         dest =3D plain
>         bb.utils.mkdirhier(src)
>         prepdir(dest)
> -        os.rename(src, dest)
> +        try:
> +            os.rename(src, dest)
> +        except OSError:
> +            shutil.move(src, dest)
>=20
>     return True
>=20
> @@ -638,6 +645,7 @@ python sstate_hardcode_path () {
>=20
> def sstate_package(ss, d):
>     import oe.path
> +    import shutil
>=20
>     tmpdir =3D d.getVar('TMPDIR')
>=20
> @@ -664,7 +672,10 @@ def sstate_package(ss, d):
>                     continue
>                 bb.error("sstate found an absolute path symlink %s point=
ing at %s. Please replace this with a relative link." % (srcpath, link))
>         bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1],=
 sstatebuild + state[0]))
> -        os.rename(state[1], sstatebuild + state[0])
> +        try:
> +            os.rename(state[1], sstatebuild + state[0])
> +        except OSError:
> +            shutil.move(state[1], sstatebuild + state[0])
>=20
>     workdir =3D d.getVar('WORKDIR')
>     sharedworkdir =3D os.path.join(d.getVar('TMPDIR'), "work-shared")
> @@ -674,7 +685,10 @@ def sstate_package(ss, d):
>             pdir =3D plain.replace(sharedworkdir, sstatebuild)
>         bb.utils.mkdirhier(plain)
>         bb.utils.mkdirhier(pdir)
> -        os.rename(plain, pdir)
> +        try:
> +            os.rename(plain, pdir)
> +        except OSError:
> +            shutil.move(plain, pdir)
>=20
>     d.setVar('SSTATE_BUILDDIR', sstatebuild)
>     d.setVar('SSTATE_INSTDIR', sstatebuild)
> --=20
> 2.29.2
>=20
>=20
>> On 30 Mar 2021, at 08:10, Richard Purdie <richard.purdie@linuxfoundatio=
n.org> wrote:
>>=20
>> On Mon, 2021-03-29 at 16:00 -0700, Andre McCurdy wrote:
>>> On Mon, Mar 29, 2021 at 3:45 PM Devendra Tewari
>>> <devendra.tewari@gmail.com> wrote:
>>>>=20
>>>> Thanks! My bad. The example I looked up in Python docs had a break an=
d I just realized it was a looping example.
>>>>=20
>>>> Here=E2=80=99s the updated patch (or should I submit it again via git=
 send-email?)
>>>=20
>>> It would be better to use shutil.move unconditionally in all cases,
>>> rather than have a separate shutil.move code path which only gets
>>> tested by people doing incremental builds in docker.
>>=20
>> This is a speed sensitive section of code and shutil has traditionally =
proved=20
>> to be slow so I disagree with that, rename is very much preferred here =
where
>> we can.
>>=20
>> Cheers,
>>=20
>> Richard
>>=20
>>=20
>=20


--Apple-Mail=_8B2DCEB9-70EE-4AEF-B7D6-46821BBEDD2B
Content-Disposition: attachment;
	filename=0001-use-shutil.move-when-os.rename-fails.patch
Content-Type: application/octet-stream;
	x-unix-mode=0600;
	name="0001-use-shutil.move-when-os.rename-fails.patch"
Content-Transfer-Encoding: quoted-printable

From d3472288e80f036dd2f8a8fc72bdeaecd9f386d8 Mon Sep 17 00:00:00 2001
From: Devendra Tewari <devendra.tewari@gmail.com>
Date: Mon, 19 Apr 2021 11:23:58 -0300
Subject: [PATCH] Use shutil.move when os.rename fails

Incremental build in Docker fails with

OSError: [Errno 18] Invalid cross-device link

When source and destination are on different overlay filesystems.

This change handles error with os.rename and retries with shutil.move.
The reason os.rename is still used is because shutil.move is too slow
for speed sensitive sections of code.

[Yocto #14301]
---
 bitbake/lib/bb/siggen.py                    |  6 +++++-
 bitbake/lib/bb/tests/fetch.py               | 13 ++++++++++--
 bitbake/lib/bb/utils.py                     | 16 ++++++++++++---
 meta/classes/buildhistory.bbclass           |  6 +++++-
 meta/classes/package.bbclass                | 12 +++++++++--
 meta/classes/populate_sdk_ext.bbclass       | 10 ++++++++--
 meta/classes/reproducible_build.bbclass     |  6 +++++-
 meta/classes/sstate.bbclass                 | 22 +++++++++++++++++----
 meta/classes/update-alternatives.bbclass    | 11 +++++++++--
 meta/lib/oe/package_manager/deb/__init__.py | 18 ++++++++++++++---
 meta/lib/oe/package_manager/ipk/__init__.py |  5 ++++-
 meta/lib/oe/rootfs.py                       | 15 +++++++++++---
 meta/lib/oeqa/selftest/cases/wic.py         | 16 ++++++++++++---
 scripts/combo-layer                         |  5 ++++-
 scripts/lib/devtool/standard.py             | 21 ++++++++++++++++----
 scripts/lib/devtool/upgrade.py              |  7 ++++++-
 scripts/lib/wic/plugins/imager/direct.py    |  5 ++++-
 17 files changed, 159 insertions(+), 35 deletions(-)

diff --git a/bitbake/lib/bb/siggen.py b/bitbake/lib/bb/siggen.py
index 0d88c6ec68..cf89e21439 100644
--- a/bitbake/lib/bb/siggen.py
+++ b/bitbake/lib/bb/siggen.py
@@ -341,6 +341,7 @@ class SignatureGeneratorBasic(SignatureGenerator):
         self.unihash_cache.save(self.unitaskhashes)
=20
     def dump_sigtask(self, fn, task, stampbase, runtime):
+        import shutil
=20
         tid =3D fn + ":" + task
         referencestamp =3D stampbase
@@ -402,7 +403,10 @@ class SignatureGeneratorBasic(SignatureGenerator):
                 p =3D pickle.dump(data, stream, -1)
                 stream.flush()
             os.chmod(tmpfile, 0o664)
-            os.rename(tmpfile, sigfile)
+            try:
+                os.rename(tmpfile, sigfile)
+            except OSError:
+                shutil.move(tmpfile, sigfile)
         except (OSError, IOError) as err:
             try:
                 os.unlink(tmpfile)
diff --git a/bitbake/lib/bb/tests/fetch.py b/bitbake/lib/bb/tests/fetch.py
index ddf6e97439..8cf2eb0ac3 100644
--- a/bitbake/lib/bb/tests/fetch.py
+++ b/bitbake/lib/bb/tests/fetch.py
@@ -1770,6 +1770,7 @@ class GitShallowTest(FetcherTest):
         self.assertRevCount(1, cwd=3Dos.path.join(self.gitdir, 'gitsubmodu=
le'))
=20
     def test_shallow_submodule_mirrors(self):
+        import shutil
         self.add_empty_file('a')
         self.add_empty_file('b')
=20
@@ -1794,7 +1795,10 @@ class GitShallowTest(FetcherTest):
=20
         # Set up the mirror
         mirrordir =3D os.path.join(self.tempdir, 'mirror')
-        os.rename(self.dldir, mirrordir)
+        try:
+            os.rename(self.dldir, mirrordir)
+        except OSError:
+            shutil.move(self.dldir, mirrordir)
         self.d.setVar('PREMIRRORS', 'gitsm://.*/.* file://%s/\n' % mirrord=
ir)
=20
         # Fetch from the mirror
@@ -1899,6 +1903,7 @@ class GitShallowTest(FetcherTest):
         assert not os.path.exists(os.path.join(self.gitdir, '.git', 'shall=
ow'))
=20
     def test_shallow_mirrors(self):
+        import shutil
         self.add_empty_file('a')
         self.add_empty_file('b')
=20
@@ -1912,7 +1917,11 @@ class GitShallowTest(FetcherTest):
         bb.utils.mkdirhier(mirrordir)
         self.d.setVar('PREMIRRORS', 'git://.*/.* file://%s/\n' % mirrordir=
)
=20
-        os.rename(os.path.join(self.dldir, mirrortarball),
+        try:
+            os.rename(os.path.join(self.dldir, mirrortarball),
+                  os.path.join(mirrordir, mirrortarball))
+        except OSError:
+            shutil.move(os.path.join(self.dldir, mirrortarball),
                   os.path.join(mirrordir, mirrortarball))
=20
         # Fetch from the mirror
diff --git a/bitbake/lib/bb/utils.py b/bitbake/lib/bb/utils.py
index b282d09abf..f289f5664e 100644
--- a/bitbake/lib/bb/utils.py
+++ b/bitbake/lib/bb/utils.py
@@ -736,6 +736,7 @@ def movefile(src, dest, newmtime =3D None, sstat =3D No=
ne):
     filesystems.  Returns true on success and false on failure. Move is
     atomic.
     """
+    import shutil
=20
     #print "movefile(" + src + "," + dest + "," + str(newmtime) + "," + st=
r(sstat) + ")"
     try:
@@ -782,7 +783,10 @@ def movefile(src, dest, newmtime =3D None, sstat =3D N=
one):
=20
     if sstat[stat.ST_DEV] =3D=3D dstat[stat.ST_DEV]:
         try:
-            os.rename(src, destpath)
+            try:
+                os.rename(src, destpath)
+            except OSError:
+                shutil.move(src, destpath)
             renamefailed =3D 0
         except Exception as e:
             if e.errno !=3D errno.EXDEV:
@@ -796,7 +800,10 @@ def movefile(src, dest, newmtime =3D None, sstat =3D N=
one):
         if stat.S_ISREG(sstat[stat.ST_MODE]):
             try: # For safety copy then move it over.
                 shutil.copyfile(src, destpath + "#new")
-                os.rename(destpath + "#new", destpath)
+                try:
+                    os.rename(destpath + "#new", destpath)
+                except OSError:
+                    shutil.move(destpath + "#new", destpath)
                 didcopy =3D 1
             except Exception as e:
                 print('movefile: copy', src, '->', dest, 'failed.', e)
@@ -874,7 +881,10 @@ def copyfile(src, dest, newmtime =3D None, sstat =3D N=
one):
=20
             # For safety copy then move it over.
             shutil.copyfile(src, dest + "#new")
-            os.rename(dest + "#new", dest)
+            try:
+                os.rename(dest + "#new", dest)
+            except OSError:
+                shutil.move(dest + "#new", dest)
         except Exception as e:
             logger.warning("copyfile: copy %s to %s failed (%s)" % (src, d=
est, e))
             return False
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass
index 117a44eaf3..50279891a3 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -872,7 +872,11 @@ python buildhistory_eventhandler() {
                 entries =3D [ x for x in os.listdir(rootdir) if not x.star=
tswith('.') ]
                 bb.utils.mkdirhier(olddir)
                 for entry in entries:
-                    os.rename(os.path.join(rootdir, entry),
+                    try:
+                        os.rename(os.path.join(rootdir, entry),
+                              os.path.join(olddir, entry))
+                    except OSError:
+                        shutil.move(os.path.join(rootdir, entry),
                               os.path.join(olddir, entry))
         elif isinstance(e, bb.event.BuildCompleted):
             if reset:
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index e3f0a7060b..6707c2e9db 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -835,6 +835,7 @@ perform_packagecopy[dirs] =3D "${PKGD}"
 # the fs-perms.txt files
 python fixup_perms () {
     import pwd, grp
+    import shutil
=20
     # init using a string with the same format as a line as documented in
     # the fs-perms.txt file
@@ -1049,7 +1050,10 @@ python fixup_perms () {
         # Create path to move directory to, move it, and then setup the sy=
mlink
         bb.utils.mkdirhier(os.path.dirname(target))
         #bb.note("Fixup Perms: Rename %s -> %s" % (dir, ptarget))
-        os.rename(origin, target)
+        try:
+            os.rename(origin, target)
+        except OSError:
+            shutil.move(origin, target)
         #bb.note("Fixup Perms: Link %s -> %s" % (dir, link))
         os.symlink(link, origin)
=20
@@ -1776,6 +1780,7 @@ python package_do_shlibs() {
     import itertools
     import re, pipes
     import subprocess
+    import shutil
=20
     exclude_shlibs =3D d.getVar('EXCLUDE_FROM_SHLIBS', False)
     if exclude_shlibs:
@@ -1967,7 +1972,10 @@ python package_do_shlibs() {
=20
         for (old, new) in renames:
             bb.note("Renaming %s to %s" % (old, new))
-            os.rename(old, new)
+            try:
+                os.rename(old, new)
+            except OSError:
+                shutil.move(old, new)
             pkgfiles[pkg].remove(old)
=20
         shlibs_file =3D os.path.join(shlibswork_dir, pkg + ".list")
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_=
sdk_ext.bbclass
index 9112ab6c5e..d2a81e7bf3 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -165,7 +165,10 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistf=
ile, conf_initpath):
             shutil.rmtree(temp_sdkbasepath)
         except FileNotFoundError:
             pass
-        os.rename(sdkbasepath, temp_sdkbasepath)
+        try:
+            os.rename(sdkbasepath, temp_sdkbasepath)
+        except OSError:
+            shutil.move(sdkbasepath, temp_sdkbasepath)
         cmdprefix =3D '. %s .; ' % conf_initpath
         logfile =3D d.getVar('WORKDIR') + '/tasklist_bb_log.txt'
         try:
@@ -175,7 +178,10 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistf=
ile, conf_initpath):
             if 'attempted to execute unexpectedly and should have been set=
scened' in e.stdout:
                 msg +=3D '\n----------\n\nNOTE: "attempted to execute unex=
pectedly and should have been setscened" errors indicate this may be caused=
 by missing sstate artifacts that were likely produced in earlier builds, b=
ut have been subsequently deleted for some reason.\n'
             bb.fatal(msg)
-        os.rename(temp_sdkbasepath, sdkbasepath)
+        try:
+            os.rename(temp_sdkbasepath, sdkbasepath)
+        except OSError:
+            shutil.move(temp_sdkbasepath, sdkbasepath)
         # Clean out residue of running bitbake, which check_sstate_task_li=
st()
         # will effectively do
         clean_esdk_builddir(d, sdkbasepath)
diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reprodu=
cible_build.bbclass
index f06e00d70d..480d58f86d 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -57,13 +57,17 @@ do_deploy_source_date_epoch () {
 }
=20
 python do_deploy_source_date_epoch_setscene () {
+    import shutil
     sstate_setscene(d)
     bb.utils.mkdirhier(d.getVar('SDE_DIR'))
     sde_file =3D os.path.join(d.getVar('SDE_DEPLOYDIR'), '__source_date_ep=
och.txt')
     if os.path.exists(sde_file):
         target =3D d.getVar('SDE_FILE')
         bb.debug(1, "Moving setscene SDE file %s -> %s" % (sde_file, targe=
t))
-        os.rename(sde_file, target)
+        try:
+            os.rename(sde_file, target)
+        except OSError:
+            shutil.move(sde_file, target)
     else:
         bb.debug(1, "%s not found!" % sde_file)
 }
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 8e8efd18d5..60f7a94285 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -384,6 +384,7 @@ def sstate_installpkg(ss, d):
 def sstate_installpkgdir(ss, d):
     import oe.path
     import subprocess
+    import shutil
=20
     sstateinst =3D d.getVar("SSTATE_INSTDIR")
     d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
@@ -401,7 +402,10 @@ def sstate_installpkgdir(ss, d):
=20
     for state in ss['dirs']:
         prepdir(state[1])
-        os.rename(sstateinst + state[0], state[1])
+        try:
+            os.rename(sstateinst + state[0], state[1])
+        except OSError:
+            shutil.move(sstateinst + state[0], state[1])
     sstate_install(ss, d)
=20
     for plain in ss['plaindirs']:
@@ -413,7 +417,10 @@ def sstate_installpkgdir(ss, d):
         dest =3D plain
         bb.utils.mkdirhier(src)
         prepdir(dest)
-        os.rename(src, dest)
+        try:
+            os.rename(src, dest)
+        except OSError:
+            shutil.move(src, dest)
=20
     return True
=20
@@ -638,6 +645,7 @@ python sstate_hardcode_path () {
=20
 def sstate_package(ss, d):
     import oe.path
+    import shutil
=20
     tmpdir =3D d.getVar('TMPDIR')
=20
@@ -664,7 +672,10 @@ def sstate_package(ss, d):
                     continue
                 bb.error("sstate found an absolute path symlink %s pointin=
g at %s. Please replace this with a relative link." % (srcpath, link))
         bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1], s=
statebuild + state[0]))
-        os.rename(state[1], sstatebuild + state[0])
+        try:
+            os.rename(state[1], sstatebuild + state[0])
+        except OSError:
+            shutil.move(state[1], sstatebuild + state[0])
=20
     workdir =3D d.getVar('WORKDIR')
     sharedworkdir =3D os.path.join(d.getVar('TMPDIR'), "work-shared")
@@ -674,7 +685,10 @@ def sstate_package(ss, d):
             pdir =3D plain.replace(sharedworkdir, sstatebuild)
         bb.utils.mkdirhier(plain)
         bb.utils.mkdirhier(pdir)
-        os.rename(plain, pdir)
+        try:
+            os.rename(plain, pdir)
+        except OSError:
+            shutil.move(plain, pdir)
=20
     d.setVar('SSTATE_BUILDDIR', sstatebuild)
     d.setVar('SSTATE_INSTDIR', sstatebuild)
diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update=
-alternatives.bbclass
index 8c2b66e7f1..7e213472e3 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -139,6 +139,7 @@ python apply_update_alternative_renames () {
        return
=20
     import re
+    import shutil
=20
     def update_files(alt_target, alt_target_rename, pkg, d):
         f =3D d.getVar('FILES_' + pkg)
@@ -184,7 +185,10 @@ python apply_update_alternative_renames () {
                         link_rename.append((alt_target, alt_target_rename)=
)
                     else:
                         bb.note('%s: Rename %s -> %s' % (pn, alt_target, a=
lt_target_rename))
-                        os.rename(src, dest)
+                        try:
+                            os.rename(src, dest)
+                        except OSError:
+                            shutil.move(src, dest)
                         update_files(alt_target, alt_target_rename, pkg, d=
)
                 else:
                     bb.warn("%s: alternative target (%s or %s) does not ex=
ist, skipping..." % (pn, alt_target, alt_target_rename))
@@ -201,7 +205,10 @@ python apply_update_alternative_renames () {
             if os.path.lexists(link_target):
                 # Ok, the link_target exists, we can rename
                 bb.note('%s: Rename (link) %s -> %s' % (pn, alt_target, al=
t_target_rename))
-                os.rename(src, dest)
+                try:
+                    os.rename(src, dest)
+                except OSError:
+                    shutil.move(src, dest)
             else:
                 # Try to resolve the broken link to link.${BPN}
                 link_maybe =3D '%s.%s' % (os.readlink(src), pn)
diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/pack=
age_manager/deb/__init__.py
index 2ee68fefb1..8edc653dff 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -5,6 +5,7 @@
 import re
 import subprocess
 from oe.package_manager import *
+import shutil
=20
 class DpkgIndexer(Indexer):
     def _create_configs(self):
@@ -214,7 +215,10 @@ class DpkgPM(OpkgDpkgPM):
=20
                     tmp_sf.write(status)
=20
-        os.rename(status_file + ".tmp", status_file)
+        try:
+            os.rename(status_file + ".tmp", status_file)
+        except OSError:
+            shutil.move(status_file + ".tmp", status_file)
=20
     def run_pre_post_installs(self, package_name=3DNone):
         """
@@ -299,13 +303,21 @@ class DpkgPM(OpkgDpkgPM):
             for dir in dirs:
                 new_dir =3D re.sub(r"\.dpkg-new", "", dir)
                 if dir !=3D new_dir:
-                    os.rename(os.path.join(root, dir),
+                    try:
+                        os.rename(os.path.join(root, dir),
+                              os.path.join(root, new_dir))
+                    except OSError:
+                        shutil.move(os.path.join(root, dir),
                               os.path.join(root, new_dir))
=20
             for file in files:
                 new_file =3D re.sub(r"\.dpkg-new", "", file)
                 if file !=3D new_file:
-                    os.rename(os.path.join(root, file),
+                    try:
+                        os.rename(os.path.join(root, file),
+                              os.path.join(root, new_file))
+                    except OSError:
+                        shutil.move(os.path.join(root, file),
                               os.path.join(root, new_file))
=20
=20
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/pack=
age_manager/ipk/__init__.py
index da488c1c7f..2aa21949f3 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -213,7 +213,10 @@ class OpkgPM(OpkgDpkgPM):
=20
                     tmp_sf.write(status)
=20
-        os.rename(status_file + ".tmp", status_file)
+        try:
+            os.rename(status_file + ".tmp", status_file)
+        except OSError:
+            shutil.move(status_file + ".tmp", status_file)
=20
     def _create_custom_config(self):
         bb.note("Building from feeds activated!")
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 249c685dcf..8070fbbf9f 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -114,7 +114,10 @@ class Rootfs(object, metaclass=3DABCMeta):
             shutil.rmtree(self.image_rootfs + '-orig')
         except:
             pass
-        os.rename(self.image_rootfs, self.image_rootfs + '-orig')
+        try:
+            os.rename(self.image_rootfs, self.image_rootfs + '-orig')
+        except OSError:
+            shutil.move(self.image_rootfs, self.image_rootfs + '-orig')
=20
         bb.note("  Creating debug rootfs...")
         bb.utils.mkdirhier(self.image_rootfs)
@@ -165,10 +168,16 @@ class Rootfs(object, metaclass=3DABCMeta):
             shutil.rmtree(self.image_rootfs + '-dbg')
         except:
             pass
-        os.rename(self.image_rootfs, self.image_rootfs + '-dbg')
+        try:
+            os.rename(self.image_rootfs, self.image_rootfs + '-dbg')
+        except OSError:
+            shutil.move(self.image_rootfs, self.image_rootfs + '-dbg')
=20
         bb.note("  Restoreing original rootfs...")
-        os.rename(self.image_rootfs + '-orig', self.image_rootfs)
+        try:
+            os.rename(self.image_rootfs + '-orig', self.image_rootfs)
+        except OSError:
+            shutil.move(self.image_rootfs + '-orig', self.image_rootfs)
=20
     def _exec_shell_cmd(self, cmd):
         fakerootcmd =3D self.d.getVar('FAKEROOT')
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/c=
ases/wic.py
index fa81584a8c..fa93973087 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1269,6 +1269,7 @@ class Wic2(WicTestCase):
=20
     def test_expand_mbr_image(self):
         """Test wic write --expand command for mbr image"""
+        import shutil
         # build an image
         config =3D 'IMAGE_FSTYPES =3D "wic"\nWKS_FILE =3D "directdisk.wks"=
\n'
         self.append_config(config)
@@ -1306,8 +1307,14 @@ class Wic2(WicTestCase):
             result =3D runCmd("%s/usr/sbin/sfdisk -F %s" % (sysroot, new_i=
mage_path))
             self.assertTrue("0 B, 0 bytes, 0 sectors" in result.output)
=20
-            os.rename(image_path, image_path + '.bak')
-            os.rename(new_image_path, image_path)
+            try:
+                os.rename(image_path, image_path + '.bak')
+            except OSError:
+                shutil.move(image_path, image_path + '.bak')
+            try:
+                os.rename(new_image_path, image_path)
+            except OSError:
+                shutil.move(new_image_path, image_path)
=20
             # Check if it boots in qemu
             with runqemu('core-image-minimal', ssh=3DFalse) as qemu:
@@ -1318,7 +1325,10 @@ class Wic2(WicTestCase):
             if os.path.exists(new_image_path):
                 os.unlink(new_image_path)
             if os.path.exists(image_path + '.bak'):
-                os.rename(image_path + '.bak', image_path)
+                try:
+                    os.rename(image_path + '.bak', image_path)
+                except OSError:
+                    shutil.move(image_path + '.bak', image_path)
=20
     def test_wic_ls_ext(self):
         """Test listing content of the ext partition using 'wic ls'"""
diff --git a/scripts/combo-layer b/scripts/combo-layer
index a634dd69d2..1b88340b6e 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -508,7 +508,10 @@ def check_patch(patchfile):
     f.close()
     if of:
         of.close()
-        os.rename(patchfile + '.tmp', patchfile)
+        try:
+            os.rename(patchfile + '.tmp', patchfile)
+        except OSError:
+            shutil.move(patchfile + '.tmp', patchfile)
=20
 def drop_to_shell(workdir=3DNone):
     if not sys.stdin.isatty():
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index f364a45283..3854dfb3e8 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -746,7 +746,10 @@ def _check_preserve(config, recipename):
                         os.remove(removefile)
                 else:
                     tf.write(line)
-    os.rename(newfile, origfile)
+    try:
+        os.rename(newfile, origfile)
+    except OSError:
+        shutil.move(newfile, origfile)
=20
 def get_staging_kver(srcdir):
     # Kernel version from work-shared
@@ -1094,10 +1097,16 @@ def rename(args, config, basepath, workspace):
=20
     # Rename bbappend
     logger.info('Renaming %s to %s' % (append, newappend))
-    os.rename(append, newappend)
+    try:
+        os.rename(append, newappend)
+    except OSError:
+        shutil.move(append, newappend)
     # Rename recipe file
     logger.info('Renaming %s to %s' % (recipefile, newfile))
-    os.rename(recipefile, newfile)
+    try:
+        os.rename(recipefile, newfile)
+    except OSError:
+        shutil.move(recipefile, newfile)
=20
     # Rename source tree if it's the default path
     appendmd5 =3D None
@@ -1333,7 +1342,11 @@ def _export_patches(srctree, rd, start_rev, destdir,=
 changed_revs=3DNone):
         if match_name:
             # Rename patch files
             if new_patch !=3D match_name:
-                os.rename(os.path.join(destdir, new_patch),
+                try:
+                    os.rename(os.path.join(destdir, new_patch),
+                          os.path.join(destdir, match_name))
+                except OSError:
+                    shutil.move(os.path.join(destdir, new_patch),
                           os.path.join(destdir, match_name))
             # Need to pop it off the list now before checking changed_revs
             oldpath =3D existing_patches.pop(old_patch)
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index 5a057e95f5..2bff69f5a2 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -71,7 +71,12 @@ def _rename_recipe_dirs(oldpv, newpv, path):
                 if oldfile.find(oldpv) !=3D -1:
                     newfile =3D oldfile.replace(oldpv, newpv)
                     if oldfile !=3D newfile:
-                        os.rename(os.path.join(path, oldfile), os.path.joi=
n(path, newfile))
+                        try:
+                            os.rename(os.path.join(path, oldfile),
+                                  os.path.join(path, newfile))
+                        except OSError:
+                            shutil.move(os.path.join(path, oldfile),
+                                  os.path.join(path, newfile))
=20
 def _rename_recipe_file(oldrecipe, bpn, oldpv, newpv, path):
     oldrecipe =3D os.path.basename(oldrecipe)
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plu=
gins/imager/direct.py
index ea709e8c54..fb5e52b2a6 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -616,5 +616,8 @@ class PartitionedImage():
                              part.start + part.size_sec - 1, part.size_sec=
)
=20
                 partimage =3D self.path + '.p%d' % part.num
-                os.rename(source, partimage)
+                try:
+                    os.rename(source, partimage)
+                except OSError:
+                    shutil.move(source, partimage)
                 self.partimages.append(partimage)
--=20
2.29.2


--Apple-Mail=_8B2DCEB9-70EE-4AEF-B7D6-46821BBEDD2B--
