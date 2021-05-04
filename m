Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.10049.1620152615377349256
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 May 2021 11:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mQhO17dR;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id g14so11562210edy.6
        for <openembedded-core@lists.openembedded.org>; Tue, 04 May 2021 11:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PFmpMuSD5+O6CLkpCaEWn0VY2bB7hHr/7yPBlyOh6RM=;
        b=mQhO17dReAimEcHcA2m/PZYBIOWfa5gjRjHcvLV3s+zkCu9leiFTEGlye3gxBOFKdR
         BNrnd5Gi3Waa7cjDHP5ieGipKvX8cfbxWWBjUABWtgg4XdjNfzDrD3nH3VEwpArdCBc/
         jJPmxBRU/pFWNjdjkvDutkdkSiJgF6U+6SYCKHPhl5pecd7DAZdYeyZ18Z5rl9gXKhCa
         OFqFzPCxXjIw3pbtfkyHTOCCS3CXNw733bDaeoSXl/+qfbaAabINthbMp8/2x1AZlcLR
         Ia9RThgFV2QO/moHEtXz78K94/b0Y9Co8bCBgh82+gi4lQ3BGBz8hYYbFvgWjHIbn5CQ
         UEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PFmpMuSD5+O6CLkpCaEWn0VY2bB7hHr/7yPBlyOh6RM=;
        b=e8RZ6x44QrG34yBaj7EBuCwI1sq1SLiaobScQxWvi5kY2Mj7AA1zmRGOQ5BZFRCUpV
         OUJc993EI2aHeRRrRNACz6JoVdIsRaPFzPkYuX5mpQvYxhCkXvHQIjGCWaqmlE7asyUh
         F8HXOHD2ZLHDdleiG+kxwjM6cbujhJZCM5NHeL29ctX4+4t7JReD6csnA/ClW4dx6DL6
         vBC4zZYnwLas7z/N4szdTVD4flYZvuO/w4dn/sre0tWwvmvKiaDEOjhldSHqjiTA/etU
         8RqRKkItZvzvKgaeYxkPldJ+Ka8UWPhy2HrzpVDxudawZ7lopiIurkQ1J5anvTrXAJ33
         4DJg==
X-Gm-Message-State: AOAM530Fra0fhsNrTivCoGQorPkt1Qt25hS8AM103Af60Zi33eRH6uDt
	uJJrwZ5Vz1a+hU+QPxUkGXMZjK4iAwkTvR7k6q0=
X-Google-Smtp-Source: ABdhPJzLKgVqoTroNAxsToeYLlYeTCOl+7kc0K8RNCuR9YEHLaoesGY5rznEw2dyaQ7Y0WDbtTWOiM1trNJNA0KT6y0=
X-Received: by 2002:a05:6402:b91:: with SMTP id cf17mr28134817edb.19.1620152613724;
 Tue, 04 May 2021 11:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210503171042.123645-1-quaresma.jose@gmail.com>
 <20210503171042.123645-3-quaresma.jose@gmail.com> <CAMKF1spBK8Hdbt8k5KJ7QjgZK5KJu2tvQj1Lss+BrFhuL4t=Wg@mail.gmail.com>
In-Reply-To: <CAMKF1spBK8Hdbt8k5KJ7QjgZK5KJu2tvQj1Lss+BrFhuL4t=Wg@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Tue, 4 May 2021 19:24:52 +0100
Message-ID: <CANPvuR=UA=qdFp8W68AcWVAwzKuhc4PRa+1+EtjVJF+VC6bvdg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/3] gstreamer1.0: update ptest patch
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Khem Raj <raj.khem@gmail.com> escreveu no dia ter=C3=A7a, 4/05/2021 =C3=A0(=
s) 17:00:
>
> On Mon, May 3, 2021 at 10:09 AM Jose Quaresma <quaresma.jose@gmail.com> =
wrote:
> >
> > - rework the ptest patch with a new one that are sent upstream [1].
> > - it uses the same approach as the existing patch in OE-Core but
> >   is based on the glib meson installed-tests [2] logic.
> >
> > * qemux86-64 ptest-runner result
> >   SUMMARY: total=3D105; passed=3D105; skipped=3D0; failed=3D0; user=3D=
20.4s; system=3D4.7s; maxrss=3D9928
> >
> > [1] - https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_reque=
sts/789
> > [2] - https://gitlab.gnome.org/GNOME/glib/-/commit/1bba3276bb3b7a87886=
0ac01483574599b23853c
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  .../gstreamer/gstreamer1.0-ptest.inc          |  23 --
>
> there are gstreamer recipes in other layers ( meta-freescale in my
> case ) which depends on this file
> how do you propose to fix those recipes ?

meta-freescale has a fork of gstreamer os-core with all the patches [1]
and one of them is the installed tests [2] that is removed as well.
Thes installed tests patch on meta-freescale requires the gstreamer1.0-pte=
st.inc

I think the best solution is add the oe-core gstreamer1.0-ptest.inc on
meta-freescale.
I can submit it if this patch is accepted and merged on oe-core master.

[1] - https://git.yoctoproject.org/cgit/cgit.cgi/meta-freescale/tree/recip=
es-multimedia/gstreamer/gstreamer1.0*
[2] - https://git.yoctoproject.org/cgit/cgit.cgi/meta-freescale/tree/recip=
es-multimedia/gstreamer/gstreamer1.0/0004-meson-Add-option-for-installed-te=
sts.patch

>
> >  ...meson-Add-option-for-installed-tests.patch | 257 -----------------=
-
> >  ...spect-the-idententaion-used-in-meson.patch |  36 +++
> >  ...ts-add-support-for-install-the-tests.patch | 110 ++++++++
> >  ...s-use-a-dictionaries-for-environment.patch |  48 ++++
> >  ...-the-environment-for-installed_tests.patch |  58 ++++
> >  .../gstreamer/gstreamer1.0/run-ptest          |   2 +
> >  .../gstreamer/gstreamer1.0_1.18.4.bb          |  10 +-
> >  8 files changed, 261 insertions(+), 283 deletions(-)
> >  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-pte=
st.inc
> >  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/000=
4-meson-Add-option-for-installed-tests.patch
> >  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/000=
4-tests-respect-the-idententaion-used-in-meson.patch
> >  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/000=
5-tests-add-support-for-install-the-tests.patch
> >  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/000=
6-tests-use-a-dictionaries-for-environment.patch
> >  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/000=
7-tests-install-the-environment-for-installed_tests.patch
> >  create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0/run=
-ptest
> >
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
> > deleted file mode 100644
> > index b698067041..0000000000
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
> > +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -inherit ptest-gnome
> > -
> > -TEST_FILES_PATH =3D "${datadir}/installed-tests/gstreamer-1.0/test-fi=
les"
> > -RUN_PTEST_FILE =3D "${D}${PTEST_PATH}/run-ptest"
> > -
> > -EXTRA_OEMESON +=3D "-Dtest-files-path=3D${TEST_FILES_PATH}"
> > -
> > -GST_TEST_SUITE_NAME ?=3D "gstreamer-1.0"
> > -
> > -# Using do_install_ptest_base instead of do_install_ptest, since
> > -# the default do_install_ptest_base is hardcoded to expect Makefiles.
> > -do_install_ptest_base() {
> > -    # Generate run-ptest file
> > -    echo "#!/usr/bin/env sh" > "${RUN_PTEST_FILE}"
> > -    echo "gnome-desktop-testing-runner ${GST_TEST_SUITE_NAME}" >> "${=
RUN_PTEST_FILE}"
> > -    chmod 0755 "${RUN_PTEST_FILE}"
> > -
> > -    # Install additional files required by tests
> > -    if [ -d "${S}/tests/files" ] ; then
> > -        install -d "${D}/${TEST_FILES_PATH}"
> > -        install -m 0644 "${S}/tests/files"/* "${D}/${TEST_FILES_PATH}=
"
> > -    fi
> > -}
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson=
-Add-option-for-installed-tests.patch b/meta/recipes-multimedia/gstreamer/g=
streamer1.0/0004-meson-Add-option-for-installed-tests.patch
> > deleted file mode 100644
> > index bf5e57249c..0000000000
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Add-op=
tion-for-installed-tests.patch
> > +++ /dev/null
> > @@ -1,257 +0,0 @@
> > -From cf8077a7e3ab0ae236ebde79b7fc0b02eac658de Mon Sep 17 00:00:00 200=
1
> > -From: Carlos Rafael Giani <crg7475@mailbox.org>
> > -Date: Fri, 25 Oct 2019 00:06:26 +0200
> > -Subject: [PATCH 3/3] meson: Add option for installed tests
> > -
> > -This adds an option for producing installed versions of the unit test=
s.
> > -These versions don't need meson to run (only a small shell script). T=
his
> > -makes it easier to run cross compiled tests on a target machine.
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> > ----
> > - build-aux/gen-installed-test-desc.py     | 18 ++++++
> > - build-aux/gen-installed-test-shscript.py | 25 ++++++++
> > - meson_options.txt                        |  2 +
> > - tests/check/meson.build                  | 46 +++++++++++++-
> > - tests/files/testfile                     | 80 ++++++++++++++++++++++=
++
> > - 5 files changed, 170 insertions(+), 1 deletion(-)
> > - create mode 100644 build-aux/gen-installed-test-desc.py
> > - create mode 100644 build-aux/gen-installed-test-shscript.py
> > - create mode 100644 tests/files/testfile
> > -
> > -diff --git a/build-aux/gen-installed-test-desc.py b/build-aux/gen-ins=
talled-test-desc.py
> > -new file mode 100644
> > -index 000000000..69e8a0faf
> > ---- /dev/null
> > -+++ b/build-aux/gen-installed-test-desc.py
> > -@@ -0,0 +1,18 @@
> > -+import sys
> > -+import os
> > -+import argparse
> > -+
> > -+def write_template(filename, data):
> > -+    with open(filename, 'w') as f:
> > -+        f.write(data)
> > -+
> > -+def build_template(testdir, testname):
> > -+    return "[Test]\nType=3Dsession\nExec=3D{}\n".format(os.path.join=
(testdir, testname))
> > -+
> > -+argparser =3D argparse.ArgumentParser(description=3D'Generate instal=
led-test data.')
> > -+argparser.add_argument('--test-execdir', metavar=3D'dir', required=
=3DTrue, help=3D'Installed test directory')
> > -+argparser.add_argument('--testname', metavar=3D'name', required=3DTr=
ue, help=3D'Installed test name')
> > -+argparser.add_argument('--output', metavar=3D'file', required=3DTrue=
, help=3D'Output file')
> > -+args =3D argparser.parse_args()
> > -+
> > -+write_template(args.output, build_template(args.test_execdir, args.t=
estname))
> > -diff --git a/build-aux/gen-installed-test-shscript.py b/build-aux/gen=
-installed-test-shscript.py
> > -new file mode 100644
> > -index 000000000..5da86fb37
> > ---- /dev/null
> > -+++ b/build-aux/gen-installed-test-shscript.py
> > -@@ -0,0 +1,25 @@
> > -+import sys
> > -+import os
> > -+import argparse
> > -+
> > -+def write_template(filename, data):
> > -+    with open(filename, 'w') as f:
> > -+        f.write(data)
> > -+
> > -+def build_template(testdir, testname):
> > -+    return ''.join([
> > -+        "#!/usr/bin/env sh\n",
> > -+        "export GST_STATE_IGNORE_ELEMENTS=3D''\n",
> > -+        "export CK_DEFAULT_TIMEOUT=3D20\n",
> > -+        "export GST_PLUGIN_LOADING_WHITELIST=3D'gstreamer'\n",
> > -+        "{}\n".format(os.path.join(testdir, testname)),
> > -+    ])
> > -+
> > -+argparser =3D argparse.ArgumentParser(description=3D'Generate instal=
led-test data.')
> > -+argparser.add_argument('--test-execdir', metavar=3D'dir', required=
=3DTrue, help=3D'Installed test directory')
> > -+argparser.add_argument('--testname', metavar=3D'name', required=3DTr=
ue, help=3D'Installed test name')
> > -+argparser.add_argument('--output', metavar=3D'file', required=3DTrue=
, help=3D'Output file')
> > -+args =3D argparser.parse_args()
> > -+
> > -+write_template(args.output, build_template(args.test_execdir, args.t=
estname))
> > -+os.chmod(args.output, 0o755)
> > -diff --git a/meson_options.txt b/meson_options.txt
> > -index 72c3997e2..346c423d4 100644
> > ---- a/meson_options.txt
> > -+++ b/meson_options.txt
> > -@@ -15,6 +15,8 @@ option('poisoning', type : 'boolean', value : false=
, description : 'Enable poiso
> > - option('memory-alignment', type: 'combo',
> > -        choices : ['1', '2', '4', '8', '16', '32', '64', '128', '256'=
, '512', '1024', '2048', '4096', '8192', 'malloc', 'pagesize'],
> > -        value: 'malloc')
> > -+option('installed-tests', type : 'boolean', value : false, descripti=
on : 'enable installed tests')
> > -+option('test-files-path', type : 'string', description : 'Path where=
 to find test files')
> > -
> > - # Feature options
> > - option('check', type : 'feature', value : 'auto', description : 'Bui=
ld unit test libraries')
> > -diff --git a/tests/check/meson.build b/tests/check/meson.build
> > -index a617cf159..e629131c5 100644
> > ---- a/tests/check/meson.build
> > -+++ b/tests/check/meson.build
> > -@@ -120,11 +120,17 @@ if add_languages('cpp', native: false, required=
: false)
> > -   ]
> > - endif
> > -
> > -+test_files_path =3D get_option('test-files-path')
> > -+if test_files_path =3D=3D ''
> > -+  test_files_path =3D meson.current_source_dir() + '/../files'
> > -+endif
> > -+message('Using path "@0@" as the path to read test files from'.forma=
t(test_files_path))
> > -+
> > - test_defines =3D [
> > -   '-UG_DISABLE_ASSERT',
> > -   '-UG_DISABLE_CAST_CHECKS',
> > -   '-DGST_CHECK_TEST_ENVIRONMENT_BEACON=3D"GST_STATE_IGNORE_ELEMENTS"=
',
> > --  '-DTESTFILE=3D"' + meson.current_source_dir() + '/meson.build"',
> > -+  '-DTESTFILE=3D"@0@"'.format(test_files_path + '/testfile'),
> > -   '-DGST_DISABLE_DEPRECATED',
> > - ]
> > -
> > -@@ -138,6 +144,14 @@ endif
> > - glib_deps =3D [gio_dep, gobject_dep, gmodule_dep, glib_dep]
> > - gst_deps =3D [gst_dep, gst_base_dep, gst_check_dep, gst_net_dep, gst=
_controller_dep]
> > -
> > -+installed_tests_datadir =3D join_paths(prefix, get_option('datadir')=
, 'installed-tests', 'gstreamer-1.0')
> > -+installed_tests_execdir =3D join_paths(prefix, libexecdir, 'installe=
d-tests', 'gstreamer-1.0')
> > -+installed_tests_enabled =3D get_option('installed-tests')
> > -+
> > -+python =3D import('python').find_installation()
> > -+gen_installed_test_desc =3D files('../../build-aux/gen-installed-tes=
t-desc.py')
> > -+gen_installed_test_shscript =3D files('../../build-aux/gen-installed=
-test-shscript.py')
> > -+
> > - foreach t : core_tests
> > -   fname =3D t[0]
> > -   test_name =3D fname.split('.')[0].underscorify()
> > -@@ -151,8 +165,38 @@ foreach t : core_tests
> > -         include_directories : [configinc],
> > -         link_with : link_with_libs,
> > -         dependencies : test_deps + glib_deps + gst_deps,
> > -+        install_dir: installed_tests_execdir,
> > -+        install: installed_tests_enabled
> > -     )
> > -
> > -+    if installed_tests_enabled
> > -+      installed_test_shscript =3D test_name + '.sh'
> > -+      shscript =3D custom_target (test_name + '_shscript',
> > -+                                output: installed_test_shscript,
> > -+                                command: [
> > -+                                  python,
> > -+                                  gen_installed_test_shscript,
> > -+                                  '--test-execdir=3D@0@'.format(inst=
alled_tests_execdir),
> > -+                                  '--testname=3D@0@'.format(test_nam=
e),
> > -+                                  '--output=3D@0@'.format(join_paths=
('@OUTDIR@', installed_test_shscript)),
> > -+                                ],
> > -+                                install: true,
> > -+                                install_dir: installed_tests_execdir=
)
> > -+
> > -+      installed_test_desc =3D test_name + '.test'
> > -+      data =3D custom_target(test_name + '_desc',
> > -+                           output: installed_test_desc,
> > -+                           command: [
> > -+                             python,
> > -+                             gen_installed_test_desc,
> > -+                             '--test-execdir=3D@0@'.format(installed=
_tests_execdir),
> > -+                             '--testname=3D@0@'.format(installed_tes=
t_shscript),
> > -+                             '--output=3D@0@'.format(join_paths('@OU=
TDIR@', installed_test_desc)),
> > -+                           ],
> > -+                           install: true,
> > -+                           install_dir: installed_tests_datadir)
> > -+    endif
> > -+
> > -     env =3D environment()
> > -     env.set('GST_PLUGIN_PATH_1_0', meson.build_root())
> > -     env.set('GST_PLUGIN_SYSTEM_PATH_1_0', '')
> > -diff --git a/tests/files/testfile b/tests/files/testfile
> > -new file mode 100644
> > -index 000000000..89954e0e2
> > ---- /dev/null
> > -+++ b/tests/files/testfile
> > -@@ -0,0 +1,80 @@
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > -+....................................................................=
............
> > ---
> > -2.29.2
> > -
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests=
-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gst=
reamer/gstreamer1.0/0004-tests-respect-the-idententaion-used-in-meson.patch
> > new file mode 100644
> > index 0000000000..6f571a12d8
> > --- /dev/null
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-respec=
t-the-idententaion-used-in-meson.patch
> > @@ -0,0 +1,36 @@
> > +From 122e5ac3dd16a461b6ae595605490c8f5d1c3a9d Mon Sep 17 00:00:00 200=
1
> > +From: Jose Quaresma <quaresma.jose@gmail.com>
> > +Date: Sun, 11 Apr 2021 19:48:13 +0100
> > +Subject: [PATCH 1/4] tests: respect the idententaion used in meson
> > +
> > +Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/=
gstreamer/-/merge_requests/789]
> > +
> > +Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > +---
> > + tests/check/meson.build | 10 +++++-----
> > + 1 file changed, 5 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/tests/check/meson.build b/tests/check/meson.build
> > +index a617cf159..b2636714b 100644
> > +--- a/tests/check/meson.build
> > ++++ b/tests/check/meson.build
> > +@@ -146,11 +146,11 @@ foreach t : core_tests
> > +
> > +   if not skip_test
> > +     exe =3D executable(test_name, fname,
> > +-        c_args : gst_c_args + test_defines,
> > +-        cpp_args : gst_c_args + test_defines,
> > +-        include_directories : [configinc],
> > +-        link_with : link_with_libs,
> > +-        dependencies : test_deps + glib_deps + gst_deps,
> > ++      c_args : gst_c_args + test_defines,
> > ++      cpp_args : gst_c_args + test_defines,
> > ++      include_directories : [configinc],
> > ++      link_with : link_with_libs,
> > ++      dependencies : test_deps + glib_deps + gst_deps,
> > +     )
> > +
> > +     env =3D environment()
> > +--
> > +2.31.1
> > +
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests=
-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreame=
r/gstreamer1.0/0005-tests-add-support-for-install-the-tests.patch
> > new file mode 100644
> > index 0000000000..b77fb5797f
> > --- /dev/null
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-su=
pport-for-install-the-tests.patch
> > @@ -0,0 +1,110 @@
> > +From c9e93c7a3e4d2773abef4f5e1464af24f36700b3 Mon Sep 17 00:00:00 200=
1
> > +From: Jose Quaresma <quaresma.jose@gmail.com>
> > +Date: Sun, 11 Apr 2021 19:48:13 +0100
> > +Subject: [PATCH 2/4] tests: add support for install the tests
> > +
> > +This will provide to run the tests using the gnome-desktop-testing [1=
]
> > +
> > +[1] https://wiki.gnome.org/Initiatives/GnomeGoals/InstalledTests
> > +
> > +Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/=
gstreamer/-/merge_requests/789]
> > +
> > +Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > +---
> > + meson.build             |  5 +++++
> > + meson_options.txt       |  1 +
> > + template.test.in        |  3 +++
> > + tests/check/meson.build | 22 +++++++++++++++++++++-
> > + 4 files changed, 30 insertions(+), 1 deletion(-)
> > + create mode 100644 template.test.in
> > +
> > +diff --git a/meson.build b/meson.build
> > +index c4e8774f5..1abf4eb26 100644
> > +--- a/meson.build
> > ++++ b/meson.build
> > +@@ -562,6 +562,11 @@ if bashcomp_dep.found()
> > +   endif
> > + endif
> > +
> > ++installed_tests_metadir =3D join_paths(datadir, 'installed-tests', m=
eson.project_name())
> > ++installed_tests_execdir =3D join_paths(libexecdir, 'installed-tests'=
, meson.project_name())
> > ++installed_tests_enabled =3D get_option('installed-tests')
> > ++installed_tests_template =3D files('template.test.in')
> > ++
> > + plugins_install_dir =3D join_paths(get_option('libdir'), 'gstreamer-=
1.0')
> > +
> > + pkgconfig =3D import('pkgconfig')
> > +diff --git a/meson_options.txt b/meson_options.txt
> > +index c8cee3762..b5da40eaa 100644
> > +--- a/meson_options.txt
> > ++++ b/meson_options.txt
> > +@@ -15,6 +15,7 @@ option('poisoning', type : 'boolean', value : false=
, description : 'Enable poiso
> > + option('memory-alignment', type: 'combo',
> > +        choices : ['1', '2', '4', '8', '16', '32', '64', '128', '256'=
, '512', '1024', '2048', '4096', '8192', 'malloc', 'pagesize'],
> > +        value: 'malloc')
> > ++option('installed-tests', type : 'boolean', value : false, descripti=
on : 'Enable installed tests')
> > +
> > + # Feature options
> > + option('check', type : 'feature', value : 'auto', description : 'Bui=
ld unit test libraries')
> > +diff --git a/template.test.in b/template.test.in
> > +new file mode 100644
> > +index 000000000..f701627f8
> > +--- /dev/null
> > ++++ b/template.test.in
> > +@@ -0,0 +1,3 @@
> > ++[Test]
> > ++Type=3Dsession
> > ++Exec=3D@installed_tests_dir@/@program@
> > +diff --git a/tests/check/meson.build b/tests/check/meson.build
> > +index b2636714b..a697a7b06 100644
> > +--- a/tests/check/meson.build
> > ++++ b/tests/check/meson.build
> > +@@ -124,10 +124,16 @@ test_defines =3D [
> > +   '-UG_DISABLE_ASSERT',
> > +   '-UG_DISABLE_CAST_CHECKS',
> > +   '-DGST_CHECK_TEST_ENVIRONMENT_BEACON=3D"GST_STATE_IGNORE_ELEMENTS"=
',
> > +-  '-DTESTFILE=3D"' + meson.current_source_dir() + '/meson.build"',
> > +   '-DGST_DISABLE_DEPRECATED',
> > + ]
> > +
> > ++testfile =3D meson.current_source_dir() + '/meson.build'
> > ++if installed_tests_enabled
> > ++  install_data(testfile, install_dir : installed_tests_metadir, rena=
me : 'testfile')
> > ++  testfile =3D installed_tests_metadir + '/testfile'
> > ++endif
> > ++test_defines +=3D '-DTESTFILE=3D"@0@"'.format(testfile)
> > ++
> > + # sanity checking
> > + if get_option('check').disabled()
> > +   if get_option('tests').enabled()
> > +@@ -151,6 +157,8 @@ foreach t : core_tests
> > +       include_directories : [configinc],
> > +       link_with : link_with_libs,
> > +       dependencies : test_deps + glib_deps + gst_deps,
> > ++      install_dir: installed_tests_execdir,
> > ++      install: installed_tests_enabled,
> > +     )
> > +
> > +     env =3D environment()
> > +@@ -162,6 +170,18 @@ foreach t : core_tests
> > +     env.set('GST_PLUGIN_SCANNER_1_0', gst_scanner_dir + '/gst-plugin=
-scanner')
> > +     env.set('GST_PLUGIN_LOADING_WHITELIST', 'gstreamer')
> > +
> > ++    if installed_tests_enabled
> > ++      test_conf =3D configuration_data()
> > ++      test_conf.set('installed_tests_dir', join_paths(prefix, instal=
led_tests_execdir))
> > ++      test_conf.set('program', test_name)
> > ++      configure_file(
> > ++        input: installed_tests_template,
> > ++        output: test_name + '.test',
> > ++        install_dir: installed_tests_metadir,
> > ++        configuration: test_conf
> > ++      )
> > ++    endif
> > ++
> > +     test(test_name, exe, env: env, timeout : 3 * 60)
> > +   endif
> > + endforeach
> > +--
> > +2.31.1
> > +
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests=
-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstream=
er/gstreamer1.0/0006-tests-use-a-dictionaries-for-environment.patch
> > new file mode 100644
> > index 0000000000..46813cec3d
> > --- /dev/null
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-a-=
dictionaries-for-environment.patch
> > @@ -0,0 +1,48 @@
> > +From e82dedec1803922656e92285fc1bb75b2cdc0aad Mon Sep 17 00:00:00 200=
1
> > +From: Jose Quaresma <quaresma.jose@gmail.com>
> > +Date: Sat, 24 Apr 2021 10:34:47 +0100
> > +Subject: [PATCH 3/4] tests: use a dictionaries for environment
> > +
> > +meson environment() can't be passed to configure_file and it is neede=
d for installed_tests,
> > +use a dictionary as this is simplest solution to install the environm=
ent.
> > +
> > +Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/=
gstreamer/-/merge_requests/789]
> > +
> > +Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > +---
> > + tests/check/meson.build | 19 +++++++++++--------
> > + 1 file changed, 11 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/tests/check/meson.build b/tests/check/meson.build
> > +index a697a7b06..f64524904 100644
> > +--- a/tests/check/meson.build
> > ++++ b/tests/check/meson.build
> > +@@ -161,14 +161,17 @@ foreach t : core_tests
> > +       install: installed_tests_enabled,
> > +     )
> > +
> > +-    env =3D environment()
> > +-    env.set('GST_PLUGIN_PATH_1_0', meson.build_root())
> > +-    env.set('GST_PLUGIN_SYSTEM_PATH_1_0', '')
> > +-    env.set('GST_STATE_IGNORE_ELEMENTS', '')
> > +-    env.set('CK_DEFAULT_TIMEOUT', '20')
> > +-    env.set('GST_REGISTRY', '@0@/@1@.registry'.format(meson.current_=
build_dir(), test_name))
> > +-    env.set('GST_PLUGIN_SCANNER_1_0', gst_scanner_dir + '/gst-plugin=
-scanner')
> > +-    env.set('GST_PLUGIN_LOADING_WHITELIST', 'gstreamer')
> > ++    # environment() can't be passed to configure_file and it is need=
ed for installed_tests
> > ++    # use a dictionary as this is simplest solution to install the e=
nvironment
> > ++    env =3D {
> > ++      'GST_PLUGIN_PATH_1_0': meson.build_root(),
> > ++      'GST_PLUGIN_SYSTEM_PATH_1_0': '',
> > ++      'GST_STATE_IGNORE_ELEMENTS': '',
> > ++      'CK_DEFAULT_TIMEOUT': '20',
> > ++      'GST_REGISTRY': '@0@/@1@.registry'.format(meson.current_build_=
dir(), test_name),
> > ++      'GST_PLUGIN_SCANNER_1_0': gst_scanner_dir + '/gst-plugin-scann=
er',
> > ++      'GST_PLUGIN_LOADING_WHITELIST': 'gstreamer',
> > ++    }
> > +
> > +     if installed_tests_enabled
> > +       test_conf =3D configuration_data()
> > +--
> > +2.31.1
> > +
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests=
-install-the-environment-for-installed_tests.patch b/meta/recipes-multimedi=
a/gstreamer/gstreamer1.0/0007-tests-install-the-environment-for-installed_t=
ests.patch
> > new file mode 100644
> > index 0000000000..eabe7bcbe1
> > --- /dev/null
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-instal=
l-the-environment-for-installed_tests.patch
> > @@ -0,0 +1,58 @@
> > +From 57d2965e979f886e03eecd7e351bf01812053971 Mon Sep 17 00:00:00 200=
1
> > +From: Jose Quaresma <quaresma.jose@gmail.com>
> > +Date: Sun, 2 May 2021 01:58:01 +0100
> > +Subject: [PATCH 4/4] tests: install the environment for installed_tes=
ts
> > +
> > +- adapt the test environment for installed_tests
> > +- install the test environment for installed_tests
> > +- run the tests using the installed environment
> > +
> > +Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/=
gstreamer/-/merge_requests/789]
> > +
> > +Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > +---
> > + template.test.in        |  2 +-
> > + tests/check/meson.build | 18 ++++++++++++++++++
> > + 2 files changed, 19 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/template.test.in b/template.test.in
> > +index f701627f8..9a3fbdd09 100644
> > +--- a/template.test.in
> > ++++ b/template.test.in
> > +@@ -1,3 +1,3 @@
> > + [Test]
> > + Type=3Dsession
> > +-Exec=3D@installed_tests_dir@/@program@
> > ++Exec=3Dsh -c 'set -aex && source @installed_tests_dir@/@program@.env=
 && exec @installed_tests_dir@/@program@'
> > +diff --git a/tests/check/meson.build b/tests/check/meson.build
> > +index f64524904..a67e0f8dd 100644
> > +--- a/tests/check/meson.build
> > ++++ b/tests/check/meson.build
> > +@@ -183,6 +183,24 @@ foreach t : core_tests
> > +         install_dir: installed_tests_metadir,
> > +         configuration: test_conf
> > +       )
> > ++
> > ++      env +=3D {'GST_REGISTRY': '~/.cache/gstreamer-1.0/@0@.registry=
'.format(test_name)}
> > ++      configure_file(
> > ++        output: test_name + '.env',
> > ++        install_dir: installed_tests_execdir,
> > ++        configuration : env,
> > ++      )
> > ++      # helper to convert a meson environment dictionay object expor=
ted with configure_file
> > ++      # this also remove not needed variables for the installed test=
s
> > ++      meson.add_postconf_script('sed', '-i',
> > ++        '-e', '/^#define/!d',
> > ++        '-e', 's/^#define //g',
> > ++        '-e', '/^GST_PLUGIN_PATH_1_0/d',
> > ++        '-e', '/^GST_PLUGIN_SYSTEM_PATH_1_0/d',
> > ++        '-e', '/^GST_PLUGIN_SCANNER_1_0/d',
> > ++        '-e', 's/ /=3D/',
> > ++        join_paths(meson.current_build_dir(), test_name + '.env')
> > ++      )
> > +     endif
> > +
> > +     test(test_name, exe, env: env, timeout : 3 * 60)
> > +--
> > +2.31.1
> > +
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
> > new file mode 100755
> > index 0000000000..0cfa955f03
> > --- /dev/null
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
> > @@ -0,0 +1,2 @@
> > +#!/usr/bin/env sh
> > +gnome-desktop-testing-runner gstreamer
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
> > index b275a3430b..8f135b3839 100644
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
> > @@ -8,7 +8,7 @@ LICENSE =3D "LGPLv2+"
> >
> >  DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 bison-native flex-nativ=
e"
> >
> > -inherit meson pkgconfig gettext upstream-version-is-even gobject-intr=
ospection
> > +inherit meson pkgconfig gettext upstream-version-is-even gobject-intr=
ospection ptest-gnome
> >
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6762ed442b3822387a51c92d92=
8ead0d \
> >                      file://gst/gst.h;beginline=3D1;endline=3D21;md5=
=3De059138481205ee2c6fc1c079c016d0d"
> > @@ -16,10 +16,14 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6762ed4=
42b3822387a51c92d928ead0d \
> >  S =3D "${WORKDIR}/gstreamer-${PV}"
> >
> >  SRC_URI =3D "https://gstreamer.freedesktop.org/src/gstreamer/gstreame=
r-${PV}.tar.xz \
> > +           file://run-ptest \
> >             file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-n=
ot-fal.patch \
> >             file://0002-Remove-unused-valgrind-detection.patch \
> >             file://0003-tests-seek-Don-t-use-too-strict-timeout-for-va=
lidati.patch \
> > -           file://0004-meson-Add-option-for-installed-tests.patch \
> > +           file://0004-tests-respect-the-idententaion-used-in-meson.p=
atch \
> > +           file://0005-tests-add-support-for-install-the-tests.patch =
\
> > +           file://0006-tests-use-a-dictionaries-for-environment.patch=
 \
> > +           file://0007-tests-install-the-environment-for-installed_te=
sts.patch \
> >             "
> >  SRC_URI[sha256sum] =3D "9aeec99b38e310817012aa2d1d76573b787af47f8a725=
a65b833880a094dfbc5"
> >
> > @@ -68,4 +72,4 @@ FILES_${PN}-dbg +=3D "${datadir}/gdb ${datadir}/gstr=
eamer-1.0/gdb"
> >
> >  CVE_PRODUCT =3D "gstreamer"
> >
> > -require gstreamer1.0-ptest.inc
> > +PTEST_BUILD_HOST_FILES =3D ""
> > --
> > 2.31.1
> >
> >
> >=20
> >



--=20
Best regards,

Jos=C3=A9 Quaresma
