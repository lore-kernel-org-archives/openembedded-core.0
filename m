Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98FAC433EF
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 12:59:32 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.18681.1636203570655536401
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Nov 2021 05:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=Vyc3VftE;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 725CC83305;
	Sat,  6 Nov 2021 13:59:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1636203568;
	bh=BRtM6WfNvwvAMk0MWxlBuIzq/lm+2OgNdKrQ08sbIJ0=;
	h=From:To:Cc:Subject:Date:From;
	b=Vyc3VftElr9Dfhe/msVHZVin8lvmj3MwSYiYtvhNzOcb80uQfiAmj/bdMPqMAVflL
	 rI9hUl3sS4xCI8tWEDlkT6eQWt4CPCG9U5z3Ad90Zw1tqg5RJz/pE6fMnnlGHtZ5UJ
	 VyH9GteGwq4j0AAFV7969s/Dl2uMiOyQ2hCPb/jaHhlQb3h/jxESQeQdRvnlUoy3Fc
	 rhbz6SoB9tO7vqz9aotU2GQkGWA3CLrwzDR0Ao9XH7oNO9JpM6mc0wP386H1IIk3ON
	 3HXs25a0nqWKoJWyLM0zjMBU240GUGXO7fHhYE1BpPmf1m+iW0/aAbVL4g5SAMBXMf
	 Ao4XdGYd1QOnQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Steve Sakoman <steve@sakoman.com>
Subject: [dunfell][PATCH] piglit: upgrade to latest revision
Date: Sat,  6 Nov 2021 13:59:15 +0100
Message-Id: <20211106125915.13227-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Nov 2021 12:59:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157938

Update piglit to latest git revision and update the branch name,
since the original one is no longer updated. Make sure the VK
tests are only enabled if VK is also enabled in PACKAGECONFIG,
and that this is opt-in, otherwise older systems fail to build.

Cherry picked from squashed commits:
  eb3a8d4c7b ("piglit: upgrade to latest revision")
  a27b06f73a ("piglit: upgrade to latest revision")
  bb091bc0be ("piglit: upgrade to latest revision")
  394746d1cb ("piglit: upgrade to latest revision")
  5aec8cff94 ("piglit: upgrade to latest revision")
  fc4c82773d ("piglit: fix reproducibility")
  6fbec0f12a ("piglit: update to latest revision")
  8d23a0d498 ("piglit: upgrade to latest revision")
  5144d515fe ("piglit: upgrade to latest revision")
  dd085bd577 ("piglit: upgrade to latest revision")
  9ba6df1b2c ("piglit: upgrade to latest revision")
  1ccd71eb3e ("piglit: upgrade to latest revision")

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <steve@sakoman.com>
---
NOTE: Why backport this -- because graphics testing on oe-core dunfell
      Why squash the patches -- because it is the same thing all over
        (except for the reproducibility fix, which is hard to rebase
	 to the end)
---
 ...ssing-include-for-htobe32-definition.patch | 27 ++++++++++++
 ...file.py-make-test-lists-reproducible.patch | 31 +++++++++++++
 ...gen_tcs-tes_input_tests.py-do-not-ha.patch | 44 +++++++++++++++++++
 ...lizer.py-make-.gz-files-reproducible.patch | 30 +++++++++++++
 ...sort-the-file-list-before-working-on.patch | 28 ++++++++++++
 ...t-shader.c-do-not-hardcode-build-pat.patch | 30 +++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    | 12 ++++-
 7 files changed, 200 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-Add-a-missin=
g-include-for-htobe32-definition.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-framework-pr=
ofile.py-make-test-lists-reproducible.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-generated_te=
sts-gen_tcs-tes_input_tests.py-do-not-ha.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-serializer.p=
y-make-.gz-files-reproducible.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-shader=
.py-sort-the-file-list-before-working-on.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0002-tests-util-p=
iglit-shader.c-do-not-hardcode-build-pat.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-inclu=
de-for-htobe32-definition.patch b/meta/recipes-graphics/piglit/piglit/000=
1-Add-a-missing-include-for-htobe32-definition.patch
new file mode 100644
index 0000000000..caa48e088d
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-=
htobe32-definition.patch
@@ -0,0 +1,27 @@
+From d623e9797b7ee9b3739a8a4afe1a01f7e03754aa Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Sun, 1 Nov 2020 20:08:49 +0000
+Subject: [PATCH] Add a missing include for htobe32 definition
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c =
b/tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c
+index 5f45e0c23..c755ee29a 100644
+--- a/tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c
++++ b/tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c
+@@ -34,6 +34,8 @@
+=20
+ #include "piglit-util-gl.h"
+=20
++#include <endian.h>
++
+ #define IMAGE_WIDTH 60
+ #define IMAGE_HEIGHT 60
+=20
+--=20
+2.17.1
+
diff --git a/meta/recipes-graphics/piglit/piglit/0001-framework-profile.p=
y-make-test-lists-reproducible.patch b/meta/recipes-graphics/piglit/pigli=
t/0001-framework-profile.py-make-test-lists-reproducible.patch
new file mode 100644
index 0000000000..cc9482c047
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-=
test-lists-reproducible.patch
@@ -0,0 +1,31 @@
+From 9086d42df1f3134bafcfe33ff16db7bbb9d9a0fd Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 30 Nov 2020 23:08:22 +0000
+Subject: [PATCH] framework/profile.py: make test lists reproducible
+
+These are created with os.walk, which yields different
+order depending on where it's run.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ framework/profile.py | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/framework/profile.py b/framework/profile.py
+index c210e535e..9b5d51d68 100644
+--- a/framework/profile.py
++++ b/framework/profile.py
+@@ -528,7 +528,11 @@ class TestProfile(object):
+                 else:
+                     opts[n] =3D self.test_list[n]
+         else:
+-            opts =3D self.test_list  # pylint: disable=3Dredefined-vari=
able-type
++            opts =3D collections.OrderedDict()
++            test_keys =3D list(self.test_list.keys())
++            test_keys.sort()
++            for k in test_keys:
++                opts[k] =3D self.test_list[k]
+=20
+         for k, v in self.filters.run(opts.items()):
+             yield k, v
diff --git a/meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen=
_tcs-tes_input_tests.py-do-not-ha.patch b/meta/recipes-graphics/piglit/pi=
glit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch
new file mode 100644
index 0000000000..8704f98500
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-te=
s_input_tests.py-do-not-ha.patch
@@ -0,0 +1,44 @@
+From 1b23539aece156f6fe0789cb988f22e5915228f6 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 10 Nov 2020 17:12:32 +0000
+Subject: [PATCH 1/2] generated_tests/gen_tcs/tes_input_tests.py: do not
+ hardcode the full binary path
+
+This helps reproducibility.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ generated_tests/gen_tcs_input_tests.py | 2 +-
+ generated_tests/gen_tes_input_tests.py | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/generated_tests/gen_tcs_input_tests.py b/generated_tests/ge=
n_tcs_input_tests.py
+index face4f19a..e36671af4 100644
+--- a/generated_tests/gen_tcs_input_tests.py
++++ b/generated_tests/gen_tcs_input_tests.py
+@@ -272,7 +272,7 @@ class Test(object):
+             relative probe rgb (0.75, 0.75) (0.0, 1.0, 0.0)
+             """)
+=20
+-        test =3D test.format(self=3Dself, generator_command=3D" ".join(=
sys.argv))
++        test =3D test.format(self=3Dself, generator_command=3D"generate=
d_tests/gen_tcs_input_tests.py")
+=20
+         filename =3D self.filename()
+         dirname =3D os.path.dirname(filename)
+diff --git a/generated_tests/gen_tes_input_tests.py b/generated_tests/ge=
n_tes_input_tests.py
+index 3d847b5cc..954840b20 100644
+--- a/generated_tests/gen_tes_input_tests.py
++++ b/generated_tests/gen_tes_input_tests.py
+@@ -301,7 +301,7 @@ class Test(object):
+             relative probe rgb (0.75, 0.75) (0.0, 1.0, 0.0)
+             """)
+=20
+-        test =3D test.format(self=3Dself, generator_command=3D" ".join(=
sys.argv))
++        test =3D test.format(self=3Dself, generator_command=3D"generate=
d_tests/gen_tes_input_tests.py")
+=20
+         filename =3D self.filename()
+         dirname =3D os.path.dirname(filename)
+--=20
+2.17.1
+
diff --git a/meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-=
.gz-files-reproducible.patch b/meta/recipes-graphics/piglit/piglit/0001-s=
erializer.py-make-.gz-files-reproducible.patch
new file mode 100644
index 0000000000..2efba6f866
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-fil=
es-reproducible.patch
@@ -0,0 +1,30 @@
+From 1919bb7f4072d73dcbb64d0e06eff5b04529c3db Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 16 Nov 2020 18:01:02 +0000
+Subject: [PATCH] serializer.py: make .gz files reproducible
+
+.gz format contains mtime of the compressed data, and
+SOURCE_DATE_EPOCH is the standard way to make it reproducuble.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/serializer.py | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tests/serializer.py b/tests/serializer.py
+index bd14bc3db..bc5b45d7f 100644
+--- a/tests/serializer.py
++++ b/tests/serializer.py
+@@ -138,7 +138,10 @@ def serializer(name, profile, outfile):
+                 et.SubElement(env, 'env', name=3Dk, value=3Dv)
+=20
+     tree =3D et.ElementTree(root)
+-    with gzip.open(outfile, 'wb') as f:
++    reproducible_mtime =3D None
++    if 'SOURCE_DATE_EPOCH' in os.environ:
++        reproducible_mtime=3Dos.environ['SOURCE_DATE_EPOCH']
++    with gzip.GzipFile(outfile, 'wb', mtime=3Dreproducible_mtime) as f:
+         tree.write(f, encoding=3D'utf-8', xml_declaration=3DTrue)
+=20
+=20
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sor=
t-the-file-list-before-working-on.patch b/meta/recipes-graphics/piglit/pi=
glit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch
new file mode 100644
index 0000000000..8321be8490
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-f=
ile-list-before-working-on.patch
@@ -0,0 +1,28 @@
+From 5bf89c6a314952313b2b762fff0d5501fe57ac53 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 2 Dec 2020 21:21:52 +0000
+Subject: [PATCH] tests/shader.py: sort the file list before working on i=
t
+
+This allows later xml output to be reproducible.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/shader.py | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tests/shader.py b/tests/shader.py
+index 849273660..e6e65d1ba 100644
+--- a/tests/shader.py
++++ b/tests/shader.py
+@@ -52,7 +52,9 @@ for basedir in [TESTS_DIR, GENERATED_TESTS_DIR]:
+ for group, files in shader_tests.items():
+     assert group not in profile.test_list, 'duplicate group: {}'.format=
(group)
+=20
+-    # We'll end up with a list of tuples, split that into two lists
++    # This makes the xml output reproducible, as os.walk() order is ran=
dom
++    files.sort()
++    # We'll end up with a list of tuples, split that into two list
+     files, installedfiles =3D list(zip(*files))
+     files =3D list(files)
+     installedfiles =3D list(installedfiles)
diff --git a/meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-s=
hader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/pi=
glit/0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
new file mode 100644
index 0000000000..16c7c5c803
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-shader.c=
-do-not-hardcode-build-pat.patch
@@ -0,0 +1,30 @@
+From 1c67250308a92d4991ed05d9d240090ab84accae Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 10 Nov 2020 17:13:50 +0000
+Subject: [PATCH 2/2] tests/util/piglit-shader.c: do not hardcode build p=
ath
+ into target binary
+
+This helps reproducibilty.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/util/piglit-shader.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/util/piglit-shader.c b/tests/util/piglit-shader.c
+index 4fd68d21e..c9ea8295e 100644
+--- a/tests/util/piglit-shader.c
++++ b/tests/util/piglit-shader.c
+@@ -73,7 +73,7 @@ piglit_compile_shader(GLenum target, const char *filen=
ame)
+=20
+ 	source_dir =3D getenv("PIGLIT_SOURCE_DIR");
+ 	if (source_dir =3D=3D NULL) {
+-		source_dir =3D SOURCE_DIR;
++		source_dir =3D ".";
+ 	}
+=20
+ 	snprintf(filename_with_path, FILENAME_MAX - 1,
+--=20
+2.17.1
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-gr=
aphics/piglit/piglit_git.bb
index 4229412554..9897ef1575 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -6,13 +6,19 @@ BUGTRACKER =3D "https://gitlab.freedesktop.org/mesa/pig=
lit/-/issues"
 LICENSE =3D "MIT & LGPLv2+ & GPLv3 & GPLv2+ & BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db2beded7103a3d8a442a2a0391d60=
7b0"
=20
-SRC_URI =3D "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=3Dhtt=
ps \
+SRC_URI =3D "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=3Dhtt=
ps;branch=3Dmain \
            file://0001-cmake-install-bash-completions-in-the-right-place=
.patch \
            file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.pa=
tch \
+           file://0001-Add-a-missing-include-for-htobe32-definition.patc=
h \
+           file://0001-generated_tests-gen_tcs-tes_input_tests.py-do-not=
-ha.patch \
+           file://0002-tests-util-piglit-shader.c-do-not-hardcode-build-=
pat.patch \
+           file://0001-serializer.py-make-.gz-files-reproducible.patch \
+           file://0001-framework-profile.py-make-test-lists-reproducible=
.patch \
+           file://0001-tests-shader.py-sort-the-file-list-before-working=
-on.patch \
            "
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-SRCREV =3D "6126c2d4e476c7770d216ffa1932c10e2a5a7813"
+SRCREV =3D "83bc56abf2686e2cd9024a152e121ca4aa524985"
 # (when PV goes above 1.0 remove the trailing r)
 PV =3D "1.0+gitr${SRCPV}"
=20
@@ -37,7 +43,9 @@ do_compile[dirs] =3D+ "${B}/temp/"
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[freeglut] =3D "-DPIGLIT_USE_GLUT=3D1,-DPIGLIT_USE_GLUT=3D0=
,freeglut,"
 PACKAGECONFIG[x11] =3D "-DPIGLIT_BUILD_GL_TESTS=3DON,-DPIGLIT_BUILD_GL_T=
ESTS=3DOFF,${X11_DEPS}, ${X11_RDEPS}"
+PACKAGECONFIG[vulkan] =3D "-DPIGLIT_BUILD_VK_TESTS=3DON,-DPIGLIT_BUILD_V=
K_TESTS=3DOFF,vulkan-loader"
=20
+export PIGLIT_BUILD_DIR =3D "../../../../git"
=20
 do_configure_prepend() {
    if [ "${@bb.utils.contains('PACKAGECONFIG', 'freeglut', 'yes', 'no', =
d)}" =3D "no" ]; then
--=20
2.33.0


