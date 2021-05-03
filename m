Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.30908.1620031894319020081
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 01:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HE5+nw0T;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id u21so6683292ejo.13
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 01:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rtijkASVrNRyo/D6rq0yA08FFlgh7vF929NydeS3mkA=;
        b=HE5+nw0TK+9gmc8pblpaFo6eIsoMMTRICcPeNfco3Zr8PCXevyxQtNaL6hTTU/lU8M
         lgqhHuQo4Euf4n9uZr9surTQsyuiF47HIv6zQZjJp9L4SsD9qd5wk76zNsivd9w/RFTg
         K/CALnv69ZdnBabs1ZBVnJzWDnqMwzry3SC4m2VOu41ZJF+pnPu5T4otrILuxNNkrts5
         NqbTTcyxxxXKUbXaKHv0IRtWUXCM0U+Fjct7KEzCV7GxDUwhsx8OjYFeZRVHPUNH/b59
         s4V4H1/Kfw3hH6KBBhbslSfvJEEy4P49BcNEZVBnuMjuMS2k/1AUzD2/vegL36eCHl15
         fc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rtijkASVrNRyo/D6rq0yA08FFlgh7vF929NydeS3mkA=;
        b=TdRNuRNNbVbwwER1unC6vVbFol47JY8qihxQrmyqQ8GDa7yOuSy1LIHFuNRs5ZupIq
         4EyY4O7mW7VQ/L8oLVfF9+DukfGZ8YOv/7bcVUALh6jRbjisUm+7UOU+aNmq90QVW5iu
         sAw6ZBVxOewCuk+m0n9eUmrWrWe2o3DO0NgupZ1uxD8vWV7F65Ime7PEEIYn4C91YMa6
         pZ+1ZrajQxvCPBFVhvTqp5BDrmyEq9d7o4oPNXmaxj7HJtofYqWVQqlgnyvf8RUWamWV
         PI1oqB3pDvInuYAkAx/OZAM7sGAOxWzEKTsZ9klNV9nQl3yDVw+5EeAYGK8qXfq6coVD
         R5jQ==
X-Gm-Message-State: AOAM531+aolCluy92JsWLxoR1WfH0UDvRDC34uChs0YYyCQo403FPYTh
	N1NHrOpRG/cbAv8wCnM68oQiEn3/l4+JnOxGiaI=
X-Google-Smtp-Source: ABdhPJy8N/qNRKyDzYiiOSeyD4rWjlzyzv4IJh7S7YOgsXlHmbOxJyImNNtJwCTi4TbMVfWBfJXwgOqAUCoTl5pEzy4=
X-Received: by 2002:a17:906:e4b:: with SMTP id q11mr4695785eji.12.1620031892550;
 Mon, 03 May 2021 01:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210502175441.368688-1-quaresma.jose@gmail.com> <167B517A343BA3A6.25516@lists.openembedded.org>
In-Reply-To: <167B517A343BA3A6.25516@lists.openembedded.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Mon, 3 May 2021 09:52:49 +0100
Message-ID: <CANPvuRnX=tSwOzFn3Vkx6JRg5rigu-Gy86SFpsXY5COLDpDvgQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] gstreamer1.0: update ptest patch
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have a question regarding the patches submission, what is the most
appropriate option to submit them ?

1 - send all patches as it is submitted upstream
2 - squash all patches it in single one

Jose

Jose Quaresma via lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu no dia
domingo, 2/05/2021 =C3=A0(s) 18:54:
>
> - rework the ptest patch with a new one that are sent upstream [1].
> - it uses the same approach as the existing patch in OE-Core but
>   is based on the glib meson installed-tests [2] logic.
>
> * qemux86-64 ptest-runner result
>   SUMMARY: total=3D105; passed=3D105; skipped=3D0; failed=3D0; user=3D20=
.4s; system=3D4.7s; maxrss=3D9928
>
> [1] - https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_request=
s/789
> [2] - https://gitlab.gnome.org/GNOME/glib/-/commit/1bba3276bb3b7a878860a=
c01483574599b23853c
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  .../gstreamer/gstreamer1.0-ptest.inc          |  23 --
>  ...meson-Add-option-for-installed-tests.patch | 257 ------------------
>  ...spect-the-idententaion-used-in-meson.patch |  36 +++
>  ...ts-add-support-for-install-the-tests.patch | 110 ++++++++
>  ...s-use-a-dictionaries-for-environment.patch |  48 ++++
>  ...-the-environment-for-installed_tests.patch |  58 ++++
>  .../gstreamer/gstreamer1.0/run-ptest          |   2 +
>  .../gstreamer/gstreamer1.0_1.18.4.bb          |  10 +-
>  8 files changed, 261 insertions(+), 283 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest=
.inc
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-=
meson-Add-option-for-installed-tests.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-=
tests-respect-the-idententaion-used-in-meson.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-=
tests-add-support-for-install-the-tests.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-=
tests-use-a-dictionaries-for-environment.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-=
tests-install-the-environment-for-installed_tests.patch
>  create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0/run-p=
test
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc b/=
meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
> deleted file mode 100644
> index b698067041..0000000000
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -inherit ptest-gnome
> -
> -TEST_FILES_PATH =3D "${datadir}/installed-tests/gstreamer-1.0/test-file=
s"
> -RUN_PTEST_FILE =3D "${D}${PTEST_PATH}/run-ptest"
> -
> -EXTRA_OEMESON +=3D "-Dtest-files-path=3D${TEST_FILES_PATH}"
> -
> -GST_TEST_SUITE_NAME ?=3D "gstreamer-1.0"
> -
> -# Using do_install_ptest_base instead of do_install_ptest, since
> -# the default do_install_ptest_base is hardcoded to expect Makefiles.
> -do_install_ptest_base() {
> -    # Generate run-ptest file
> -    echo "#!/usr/bin/env sh" > "${RUN_PTEST_FILE}"
> -    echo "gnome-desktop-testing-runner ${GST_TEST_SUITE_NAME}" >> "${RU=
N_PTEST_FILE}"
> -    chmod 0755 "${RUN_PTEST_FILE}"
> -
> -    # Install additional files required by tests
> -    if [ -d "${S}/tests/files" ] ; then
> -        install -d "${D}/${TEST_FILES_PATH}"
> -        install -m 0644 "${S}/tests/files"/* "${D}/${TEST_FILES_PATH}"
> -    fi
> -}
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-A=
dd-option-for-installed-tests.patch b/meta/recipes-multimedia/gstreamer/gst=
reamer1.0/0004-meson-Add-option-for-installed-tests.patch
> deleted file mode 100644
> index bf5e57249c..0000000000
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Add-opti=
on-for-installed-tests.patch
> +++ /dev/null
> @@ -1,257 +0,0 @@
> -From cf8077a7e3ab0ae236ebde79b7fc0b02eac658de Mon Sep 17 00:00:00 2001
> -From: Carlos Rafael Giani <crg7475@mailbox.org>
> -Date: Fri, 25 Oct 2019 00:06:26 +0200
> -Subject: [PATCH 3/3] meson: Add option for installed tests
> -
> -This adds an option for producing installed versions of the unit tests.
> -These versions don't need meson to run (only a small shell script). Thi=
s
> -makes it easier to run cross compiled tests on a target machine.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> ----
> - build-aux/gen-installed-test-desc.py     | 18 ++++++
> - build-aux/gen-installed-test-shscript.py | 25 ++++++++
> - meson_options.txt                        |  2 +
> - tests/check/meson.build                  | 46 +++++++++++++-
> - tests/files/testfile                     | 80 ++++++++++++++++++++++++
> - 5 files changed, 170 insertions(+), 1 deletion(-)
> - create mode 100644 build-aux/gen-installed-test-desc.py
> - create mode 100644 build-aux/gen-installed-test-shscript.py
> - create mode 100644 tests/files/testfile
> -
> -diff --git a/build-aux/gen-installed-test-desc.py b/build-aux/gen-insta=
lled-test-desc.py
> -new file mode 100644
> -index 000000000..69e8a0faf
> ---- /dev/null
> -+++ b/build-aux/gen-installed-test-desc.py
> -@@ -0,0 +1,18 @@
> -+import sys
> -+import os
> -+import argparse
> -+
> -+def write_template(filename, data):
> -+    with open(filename, 'w') as f:
> -+        f.write(data)
> -+
> -+def build_template(testdir, testname):
> -+    return "[Test]\nType=3Dsession\nExec=3D{}\n".format(os.path.join(t=
estdir, testname))
> -+
> -+argparser =3D argparse.ArgumentParser(description=3D'Generate installe=
d-test data.')
> -+argparser.add_argument('--test-execdir', metavar=3D'dir', required=3DT=
rue, help=3D'Installed test directory')
> -+argparser.add_argument('--testname', metavar=3D'name', required=3DTrue=
, help=3D'Installed test name')
> -+argparser.add_argument('--output', metavar=3D'file', required=3DTrue, =
help=3D'Output file')
> -+args =3D argparser.parse_args()
> -+
> -+write_template(args.output, build_template(args.test_execdir, args.tes=
tname))
> -diff --git a/build-aux/gen-installed-test-shscript.py b/build-aux/gen-i=
nstalled-test-shscript.py
> -new file mode 100644
> -index 000000000..5da86fb37
> ---- /dev/null
> -+++ b/build-aux/gen-installed-test-shscript.py
> -@@ -0,0 +1,25 @@
> -+import sys
> -+import os
> -+import argparse
> -+
> -+def write_template(filename, data):
> -+    with open(filename, 'w') as f:
> -+        f.write(data)
> -+
> -+def build_template(testdir, testname):
> -+    return ''.join([
> -+        "#!/usr/bin/env sh\n",
> -+        "export GST_STATE_IGNORE_ELEMENTS=3D''\n",
> -+        "export CK_DEFAULT_TIMEOUT=3D20\n",
> -+        "export GST_PLUGIN_LOADING_WHITELIST=3D'gstreamer'\n",
> -+        "{}\n".format(os.path.join(testdir, testname)),
> -+    ])
> -+
> -+argparser =3D argparse.ArgumentParser(description=3D'Generate installe=
d-test data.')
> -+argparser.add_argument('--test-execdir', metavar=3D'dir', required=3DT=
rue, help=3D'Installed test directory')
> -+argparser.add_argument('--testname', metavar=3D'name', required=3DTrue=
, help=3D'Installed test name')
> -+argparser.add_argument('--output', metavar=3D'file', required=3DTrue, =
help=3D'Output file')
> -+args =3D argparser.parse_args()
> -+
> -+write_template(args.output, build_template(args.test_execdir, args.tes=
tname))
> -+os.chmod(args.output, 0o755)
> -diff --git a/meson_options.txt b/meson_options.txt
> -index 72c3997e2..346c423d4 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> -@@ -15,6 +15,8 @@ option('poisoning', type : 'boolean', value : false, =
description : 'Enable poiso
> - option('memory-alignment', type: 'combo',
> -        choices : ['1', '2', '4', '8', '16', '32', '64', '128', '256', =
'512', '1024', '2048', '4096', '8192', 'malloc', 'pagesize'],
> -        value: 'malloc')
> -+option('installed-tests', type : 'boolean', value : false, description=
 : 'enable installed tests')
> -+option('test-files-path', type : 'string', description : 'Path where t=
o find test files')
> -
> - # Feature options
> - option('check', type : 'feature', value : 'auto', description : 'Build=
 unit test libraries')
> -diff --git a/tests/check/meson.build b/tests/check/meson.build
> -index a617cf159..e629131c5 100644
> ---- a/tests/check/meson.build
> -+++ b/tests/check/meson.build
> -@@ -120,11 +120,17 @@ if add_languages('cpp', native: false, required: =
false)
> -   ]
> - endif
> -
> -+test_files_path =3D get_option('test-files-path')
> -+if test_files_path =3D=3D ''
> -+  test_files_path =3D meson.current_source_dir() + '/../files'
> -+endif
> -+message('Using path "@0@" as the path to read test files from'.format(=
test_files_path))
> -+
> - test_defines =3D [
> -   '-UG_DISABLE_ASSERT',
> -   '-UG_DISABLE_CAST_CHECKS',
> -   '-DGST_CHECK_TEST_ENVIRONMENT_BEACON=3D"GST_STATE_IGNORE_ELEMENTS"',
> --  '-DTESTFILE=3D"' + meson.current_source_dir() + '/meson.build"',
> -+  '-DTESTFILE=3D"@0@"'.format(test_files_path + '/testfile'),
> -   '-DGST_DISABLE_DEPRECATED',
> - ]
> -
> -@@ -138,6 +144,14 @@ endif
> - glib_deps =3D [gio_dep, gobject_dep, gmodule_dep, glib_dep]
> - gst_deps =3D [gst_dep, gst_base_dep, gst_check_dep, gst_net_dep, gst_c=
ontroller_dep]
> -
> -+installed_tests_datadir =3D join_paths(prefix, get_option('datadir'), =
'installed-tests', 'gstreamer-1.0')
> -+installed_tests_execdir =3D join_paths(prefix, libexecdir, 'installed-=
tests', 'gstreamer-1.0')
> -+installed_tests_enabled =3D get_option('installed-tests')
> -+
> -+python =3D import('python').find_installation()
> -+gen_installed_test_desc =3D files('../../build-aux/gen-installed-test-=
desc.py')
> -+gen_installed_test_shscript =3D files('../../build-aux/gen-installed-t=
est-shscript.py')
> -+
> - foreach t : core_tests
> -   fname =3D t[0]
> -   test_name =3D fname.split('.')[0].underscorify()
> -@@ -151,8 +165,38 @@ foreach t : core_tests
> -         include_directories : [configinc],
> -         link_with : link_with_libs,
> -         dependencies : test_deps + glib_deps + gst_deps,
> -+        install_dir: installed_tests_execdir,
> -+        install: installed_tests_enabled
> -     )
> -
> -+    if installed_tests_enabled
> -+      installed_test_shscript =3D test_name + '.sh'
> -+      shscript =3D custom_target (test_name + '_shscript',
> -+                                output: installed_test_shscript,
> -+                                command: [
> -+                                  python,
> -+                                  gen_installed_test_shscript,
> -+                                  '--test-execdir=3D@0@'.format(instal=
led_tests_execdir),
> -+                                  '--testname=3D@0@'.format(test_name)=
,
> -+                                  '--output=3D@0@'.format(join_paths('=
@OUTDIR@', installed_test_shscript)),
> -+                                ],
> -+                                install: true,
> -+                                install_dir: installed_tests_execdir)
> -+
> -+      installed_test_desc =3D test_name + '.test'
> -+      data =3D custom_target(test_name + '_desc',
> -+                           output: installed_test_desc,
> -+                           command: [
> -+                             python,
> -+                             gen_installed_test_desc,
> -+                             '--test-execdir=3D@0@'.format(installed_t=
ests_execdir),
> -+                             '--testname=3D@0@'.format(installed_test_=
shscript),
> -+                             '--output=3D@0@'.format(join_paths('@OUTD=
IR@', installed_test_desc)),
> -+                           ],
> -+                           install: true,
> -+                           install_dir: installed_tests_datadir)
> -+    endif
> -+
> -     env =3D environment()
> -     env.set('GST_PLUGIN_PATH_1_0', meson.build_root())
> -     env.set('GST_PLUGIN_SYSTEM_PATH_1_0', '')
> -diff --git a/tests/files/testfile b/tests/files/testfile
> -new file mode 100644
> -index 000000000..89954e0e2
> ---- /dev/null
> -+++ b/tests/files/testfile
> -@@ -0,0 +1,80 @@
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> -+......................................................................=
..........
> ---
> -2.29.2
> -
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-r=
espect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstre=
amer/gstreamer1.0/0004-tests-respect-the-idententaion-used-in-meson.patch
> new file mode 100644
> index 0000000000..6f571a12d8
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-respect-=
the-idententaion-used-in-meson.patch
> @@ -0,0 +1,36 @@
> +From 122e5ac3dd16a461b6ae595605490c8f5d1c3a9d Mon Sep 17 00:00:00 2001
> +From: Jose Quaresma <quaresma.jose@gmail.com>
> +Date: Sun, 11 Apr 2021 19:48:13 +0100
> +Subject: [PATCH 1/4] tests: respect the idententaion used in meson
> +
> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gs=
treamer/-/merge_requests/789]
> +
> +Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> +---
> + tests/check/meson.build | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/tests/check/meson.build b/tests/check/meson.build
> +index a617cf159..b2636714b 100644
> +--- a/tests/check/meson.build
> ++++ b/tests/check/meson.build
> +@@ -146,11 +146,11 @@ foreach t : core_tests
> +
> +   if not skip_test
> +     exe =3D executable(test_name, fname,
> +-        c_args : gst_c_args + test_defines,
> +-        cpp_args : gst_c_args + test_defines,
> +-        include_directories : [configinc],
> +-        link_with : link_with_libs,
> +-        dependencies : test_deps + glib_deps + gst_deps,
> ++      c_args : gst_c_args + test_defines,
> ++      cpp_args : gst_c_args + test_defines,
> ++      include_directories : [configinc],
> ++      link_with : link_with_libs,
> ++      dependencies : test_deps + glib_deps + gst_deps,
> +     )
> +
> +     env =3D environment()
> +--
> +2.31.1
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-a=
dd-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/=
gstreamer1.0/0005-tests-add-support-for-install-the-tests.patch
> new file mode 100644
> index 0000000000..b77fb5797f
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-supp=
ort-for-install-the-tests.patch
> @@ -0,0 +1,110 @@
> +From c9e93c7a3e4d2773abef4f5e1464af24f36700b3 Mon Sep 17 00:00:00 2001
> +From: Jose Quaresma <quaresma.jose@gmail.com>
> +Date: Sun, 11 Apr 2021 19:48:13 +0100
> +Subject: [PATCH 2/4] tests: add support for install the tests
> +
> +This will provide to run the tests using the gnome-desktop-testing [1]
> +
> +[1] https://wiki.gnome.org/Initiatives/GnomeGoals/InstalledTests
> +
> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gs=
treamer/-/merge_requests/789]
> +
> +Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> +---
> + meson.build             |  5 +++++
> + meson_options.txt       |  1 +
> + template.test.in        |  3 +++
> + tests/check/meson.build | 22 +++++++++++++++++++++-
> + 4 files changed, 30 insertions(+), 1 deletion(-)
> + create mode 100644 template.test.in
> +
> +diff --git a/meson.build b/meson.build
> +index c4e8774f5..1abf4eb26 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -562,6 +562,11 @@ if bashcomp_dep.found()
> +   endif
> + endif
> +
> ++installed_tests_metadir =3D join_paths(datadir, 'installed-tests', mes=
on.project_name())
> ++installed_tests_execdir =3D join_paths(libexecdir, 'installed-tests', =
meson.project_name())
> ++installed_tests_enabled =3D get_option('installed-tests')
> ++installed_tests_template =3D files('template.test.in')
> ++
> + plugins_install_dir =3D join_paths(get_option('libdir'), 'gstreamer-1.=
0')
> +
> + pkgconfig =3D import('pkgconfig')
> +diff --git a/meson_options.txt b/meson_options.txt
> +index c8cee3762..b5da40eaa 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -15,6 +15,7 @@ option('poisoning', type : 'boolean', value : false, =
description : 'Enable poiso
> + option('memory-alignment', type: 'combo',
> +        choices : ['1', '2', '4', '8', '16', '32', '64', '128', '256', =
'512', '1024', '2048', '4096', '8192', 'malloc', 'pagesize'],
> +        value: 'malloc')
> ++option('installed-tests', type : 'boolean', value : false, description=
 : 'Enable installed tests')
> +
> + # Feature options
> + option('check', type : 'feature', value : 'auto', description : 'Build=
 unit test libraries')
> +diff --git a/template.test.in b/template.test.in
> +new file mode 100644
> +index 000000000..f701627f8
> +--- /dev/null
> ++++ b/template.test.in
> +@@ -0,0 +1,3 @@
> ++[Test]
> ++Type=3Dsession
> ++Exec=3D@installed_tests_dir@/@program@
> +diff --git a/tests/check/meson.build b/tests/check/meson.build
> +index b2636714b..a697a7b06 100644
> +--- a/tests/check/meson.build
> ++++ b/tests/check/meson.build
> +@@ -124,10 +124,16 @@ test_defines =3D [
> +   '-UG_DISABLE_ASSERT',
> +   '-UG_DISABLE_CAST_CHECKS',
> +   '-DGST_CHECK_TEST_ENVIRONMENT_BEACON=3D"GST_STATE_IGNORE_ELEMENTS"',
> +-  '-DTESTFILE=3D"' + meson.current_source_dir() + '/meson.build"',
> +   '-DGST_DISABLE_DEPRECATED',
> + ]
> +
> ++testfile =3D meson.current_source_dir() + '/meson.build'
> ++if installed_tests_enabled
> ++  install_data(testfile, install_dir : installed_tests_metadir, rename=
 : 'testfile')
> ++  testfile =3D installed_tests_metadir + '/testfile'
> ++endif
> ++test_defines +=3D '-DTESTFILE=3D"@0@"'.format(testfile)
> ++
> + # sanity checking
> + if get_option('check').disabled()
> +   if get_option('tests').enabled()
> +@@ -151,6 +157,8 @@ foreach t : core_tests
> +       include_directories : [configinc],
> +       link_with : link_with_libs,
> +       dependencies : test_deps + glib_deps + gst_deps,
> ++      install_dir: installed_tests_execdir,
> ++      install: installed_tests_enabled,
> +     )
> +
> +     env =3D environment()
> +@@ -162,6 +170,18 @@ foreach t : core_tests
> +     env.set('GST_PLUGIN_SCANNER_1_0', gst_scanner_dir + '/gst-plugin-s=
canner')
> +     env.set('GST_PLUGIN_LOADING_WHITELIST', 'gstreamer')
> +
> ++    if installed_tests_enabled
> ++      test_conf =3D configuration_data()
> ++      test_conf.set('installed_tests_dir', join_paths(prefix, installe=
d_tests_execdir))
> ++      test_conf.set('program', test_name)
> ++      configure_file(
> ++        input: installed_tests_template,
> ++        output: test_name + '.test',
> ++        install_dir: installed_tests_metadir,
> ++        configuration: test_conf
> ++      )
> ++    endif
> ++
> +     test(test_name, exe, env: env, timeout : 3 * 60)
> +   endif
> + endforeach
> +--
> +2.31.1
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-u=
se-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer=
/gstreamer1.0/0006-tests-use-a-dictionaries-for-environment.patch
> new file mode 100644
> index 0000000000..46813cec3d
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-a-di=
ctionaries-for-environment.patch
> @@ -0,0 +1,48 @@
> +From e82dedec1803922656e92285fc1bb75b2cdc0aad Mon Sep 17 00:00:00 2001
> +From: Jose Quaresma <quaresma.jose@gmail.com>
> +Date: Sat, 24 Apr 2021 10:34:47 +0100
> +Subject: [PATCH 3/4] tests: use a dictionaries for environment
> +
> +meson environment() can't be passed to configure_file and it is needed =
for installed_tests,
> +use a dictionary as this is simplest solution to install the environmen=
t.
> +
> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gs=
treamer/-/merge_requests/789]
> +
> +Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> +---
> + tests/check/meson.build | 19 +++++++++++--------
> + 1 file changed, 11 insertions(+), 8 deletions(-)
> +
> +diff --git a/tests/check/meson.build b/tests/check/meson.build
> +index a697a7b06..f64524904 100644
> +--- a/tests/check/meson.build
> ++++ b/tests/check/meson.build
> +@@ -161,14 +161,17 @@ foreach t : core_tests
> +       install: installed_tests_enabled,
> +     )
> +
> +-    env =3D environment()
> +-    env.set('GST_PLUGIN_PATH_1_0', meson.build_root())
> +-    env.set('GST_PLUGIN_SYSTEM_PATH_1_0', '')
> +-    env.set('GST_STATE_IGNORE_ELEMENTS', '')
> +-    env.set('CK_DEFAULT_TIMEOUT', '20')
> +-    env.set('GST_REGISTRY', '@0@/@1@.registry'.format(meson.current_bu=
ild_dir(), test_name))
> +-    env.set('GST_PLUGIN_SCANNER_1_0', gst_scanner_dir + '/gst-plugin-s=
canner')
> +-    env.set('GST_PLUGIN_LOADING_WHITELIST', 'gstreamer')
> ++    # environment() can't be passed to configure_file and it is needed=
 for installed_tests
> ++    # use a dictionary as this is simplest solution to install the env=
ironment
> ++    env =3D {
> ++      'GST_PLUGIN_PATH_1_0': meson.build_root(),
> ++      'GST_PLUGIN_SYSTEM_PATH_1_0': '',
> ++      'GST_STATE_IGNORE_ELEMENTS': '',
> ++      'CK_DEFAULT_TIMEOUT': '20',
> ++      'GST_REGISTRY': '@0@/@1@.registry'.format(meson.current_build_di=
r(), test_name),
> ++      'GST_PLUGIN_SCANNER_1_0': gst_scanner_dir + '/gst-plugin-scanner=
',
> ++      'GST_PLUGIN_LOADING_WHITELIST': 'gstreamer',
> ++    }
> +
> +     if installed_tests_enabled
> +       test_conf =3D configuration_data()
> +--
> +2.31.1
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-i=
nstall-the-environment-for-installed_tests.patch b/meta/recipes-multimedia/=
gstreamer/gstreamer1.0/0007-tests-install-the-environment-for-installed_tes=
ts.patch
> new file mode 100644
> index 0000000000..eabe7bcbe1
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install-=
the-environment-for-installed_tests.patch
> @@ -0,0 +1,58 @@
> +From 57d2965e979f886e03eecd7e351bf01812053971 Mon Sep 17 00:00:00 2001
> +From: Jose Quaresma <quaresma.jose@gmail.com>
> +Date: Sun, 2 May 2021 01:58:01 +0100
> +Subject: [PATCH 4/4] tests: install the environment for installed_tests
> +
> +- adapt the test environment for installed_tests
> +- install the test environment for installed_tests
> +- run the tests using the installed environment
> +
> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gs=
treamer/-/merge_requests/789]
> +
> +Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> +---
> + template.test.in        |  2 +-
> + tests/check/meson.build | 18 ++++++++++++++++++
> + 2 files changed, 19 insertions(+), 1 deletion(-)
> +
> +diff --git a/template.test.in b/template.test.in
> +index f701627f8..9a3fbdd09 100644
> +--- a/template.test.in
> ++++ b/template.test.in
> +@@ -1,3 +1,3 @@
> + [Test]
> + Type=3Dsession
> +-Exec=3D@installed_tests_dir@/@program@
> ++Exec=3Dsh -c 'set -aex && source @installed_tests_dir@/@program@.env &=
& exec @installed_tests_dir@/@program@'
> +diff --git a/tests/check/meson.build b/tests/check/meson.build
> +index f64524904..a67e0f8dd 100644
> +--- a/tests/check/meson.build
> ++++ b/tests/check/meson.build
> +@@ -183,6 +183,24 @@ foreach t : core_tests
> +         install_dir: installed_tests_metadir,
> +         configuration: test_conf
> +       )
> ++
> ++      env +=3D {'GST_REGISTRY': '~/.cache/gstreamer-1.0/@0@.registry'.=
format(test_name)}
> ++      configure_file(
> ++        output: test_name + '.env',
> ++        install_dir: installed_tests_execdir,
> ++        configuration : env,
> ++      )
> ++      # helper to convert a meson environment dictionay object exporte=
d with configure_file
> ++      # this also remove not needed variables for the installed tests
> ++      meson.add_postconf_script('sed', '-i',
> ++        '-e', '/^#define/!d',
> ++        '-e', 's/^#define //g',
> ++        '-e', '/^GST_PLUGIN_PATH_1_0/d',
> ++        '-e', '/^GST_PLUGIN_SYSTEM_PATH_1_0/d',
> ++        '-e', '/^GST_PLUGIN_SCANNER_1_0/d',
> ++        '-e', 's/ /=3D/',
> ++        join_paths(meson.current_build_dir(), test_name + '.env')
> ++      )
> +     endif
> +
> +     test(test_name, exe, env: env, timeout : 3 * 60)
> +--
> +2.31.1
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest b/=
meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
> new file mode 100755
> index 0000000000..0cfa955f03
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
> @@ -0,0 +1,2 @@
> +#!/usr/bin/env sh
> +gnome-desktop-testing-runner gstreamer
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb b/=
meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
> index b275a3430b..8f135b3839 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
> @@ -8,7 +8,7 @@ LICENSE =3D "LGPLv2+"
>
>  DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 bison-native flex-native"
>
> -inherit meson pkgconfig gettext upstream-version-is-even gobject-intros=
pection
> +inherit meson pkgconfig gettext upstream-version-is-even gobject-intros=
pection ptest-gnome
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6762ed442b3822387a51c92d928e=
ad0d \
>                      file://gst/gst.h;beginline=3D1;endline=3D21;md5=3De=
059138481205ee2c6fc1c079c016d0d"
> @@ -16,10 +16,14 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6762ed442=
b3822387a51c92d928ead0d \
>  S =3D "${WORKDIR}/gstreamer-${PV}"
>
>  SRC_URI =3D "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-=
${PV}.tar.xz \
> +           file://run-ptest \
>             file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not=
-fal.patch \
>             file://0002-Remove-unused-valgrind-detection.patch \
>             file://0003-tests-seek-Don-t-use-too-strict-timeout-for-vali=
dati.patch \
> -           file://0004-meson-Add-option-for-installed-tests.patch \
> +           file://0004-tests-respect-the-idententaion-used-in-meson.pat=
ch \
> +           file://0005-tests-add-support-for-install-the-tests.patch \
> +           file://0006-tests-use-a-dictionaries-for-environment.patch \
> +           file://0007-tests-install-the-environment-for-installed_test=
s.patch \
>             "
>  SRC_URI[sha256sum] =3D "9aeec99b38e310817012aa2d1d76573b787af47f8a725a6=
5b833880a094dfbc5"
>
> @@ -68,4 +72,4 @@ FILES_${PN}-dbg +=3D "${datadir}/gdb ${datadir}/gstrea=
mer-1.0/gdb"
>
>  CVE_PRODUCT =3D "gstreamer"
>
> -require gstreamer1.0-ptest.inc
> +PTEST_BUILD_HOST_FILES =3D ""
> --
> 2.31.1
>
>
>=20
>


--=20
Best regards,

Jos=C3=A9 Quaresma
