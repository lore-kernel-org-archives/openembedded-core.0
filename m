Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E758C433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 04:09:20 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.6277.1636603759433166561
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=JXVRmYqM;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id n23so4049737pgh.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 20:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NUo6XLjvBOBew5EzJC2dTgLdLSe4rOzDgq237er7JEM=;
        b=JXVRmYqMMZxKIo5ZsDZ/kdidHGKb9HfGw2QcHh0EbZLjxl/jcjB6KkWXx5h/8KFjo7
         69ePrlrtiWlMKAQ7MG6eE4jlLFlhPGYb3h1porLY+SFYiNcWGRO63GlvEA2lkIPyJXj7
         a4bZYuI/s9xvi4wlUcQ25vzFXfNpCD4Is73+ynd8ea8AMM16fxGaSuaOCmNN4TOpIv9L
         6nQha5qOBweW1icRZY/HXozZ2hLFdIW0W5KSPGEJlITkiG2st3yoQ+rqqNbKN0L2dGPI
         d9D7995XkZrfqhj2z6z7Juk7wEE8BhQRT3IbFbZukxCC1TjemcLKfGjYcps03Ehd4JPA
         NyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NUo6XLjvBOBew5EzJC2dTgLdLSe4rOzDgq237er7JEM=;
        b=H+/dzqrxpCGochsGXcueDBM4xBBuIZhvy1Cqb5rMusjFBWhnszMlpGFXky/XWmbAIe
         ymI/zisBIqQNuqy6ipo5wfHrEPzeH9BSNCyCj5eYUif1TwiuJWr4JWyapjoP0JDVYSaR
         H3zSwScUVe+mgJZwJkHboHy4md/+ly2/1U3vLoCqP7JGAos5hee56vECW/Fzr8MFFwwT
         CM9s+K4HSWycocs4wsOvZHsPZnD3efz6bB8m/XH/wwIqkwOQLYPQXJivewPysB843oa4
         zg17CaD2dNdd5Plaobf74jbcNKw6wr58LeJMQYSbKiT7UIuAtIz3hmodugPDsnRkudMz
         VP2w==
X-Gm-Message-State: AOAM530LpxcQrTguNsaeImPdaF/FvNBmEUHID8SL0VXj0HmJNT1rXt2y
	Wo013rwl+Dor++96YbeLNKPOeAcKK/zcROrli5M=
X-Google-Smtp-Source: 
 ABdhPJyfHbdYynyDMSqE47glZW8tbUHZ36yHTnLylv4NQ0/7IVV5yCKmkmXEcQ21+DzXr1o/deyiFQ==
X-Received: by 2002:a63:8048:: with SMTP id j69mr2727188pgd.111.1636603758302;
        Wed, 10 Nov 2021 20:09:18 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i2sm1207686pfg.90.2021.11.10.20.09.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 20:09:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/14] piglit: upgrade to latest revision
Date: Wed, 10 Nov 2021 18:08:33 -1000
Message-Id: 
 <65aa83e25059b29563a45eacdad8178bc7a07fe4.1636591208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636591208.git.steve@sakoman.com>
References: <cover.1636591208.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 04:09:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158140

From: Marek Vasut <marex@denx.de>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ssing-include-for-htobe32-definition.patch | 27 ++++++++++++
 ...file.py-make-test-lists-reproducible.patch | 31 +++++++++++++
 ...gen_tcs-tes_input_tests.py-do-not-ha.patch | 44 +++++++++++++++++++
 ...lizer.py-make-.gz-files-reproducible.patch | 30 +++++++++++++
 ...sort-the-file-list-before-working-on.patch | 28 ++++++++++++
 ...t-shader.c-do-not-hardcode-build-pat.patch | 30 +++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    | 12 ++++-
 7 files changed, 200 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch b/meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch
new file mode 100644
index 0000000000..caa48e088d
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch
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
+diff --git a/tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c b/tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c
+index 5f45e0c23..c755ee29a 100644
+--- a/tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c
++++ b/tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c
+@@ -34,6 +34,8 @@
+ 
+ #include "piglit-util-gl.h"
+ 
++#include <endian.h>
++
+ #define IMAGE_WIDTH 60
+ #define IMAGE_HEIGHT 60
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch b/meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch
new file mode 100644
index 0000000000..cc9482c047
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch
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
+                     opts[n] = self.test_list[n]
+         else:
+-            opts = self.test_list  # pylint: disable=redefined-variable-type
++            opts = collections.OrderedDict()
++            test_keys = list(self.test_list.keys())
++            test_keys.sort()
++            for k in test_keys:
++                opts[k] = self.test_list[k]
+ 
+         for k, v in self.filters.run(opts.items()):
+             yield k, v
diff --git a/meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch b/meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch
new file mode 100644
index 0000000000..8704f98500
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch
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
+diff --git a/generated_tests/gen_tcs_input_tests.py b/generated_tests/gen_tcs_input_tests.py
+index face4f19a..e36671af4 100644
+--- a/generated_tests/gen_tcs_input_tests.py
++++ b/generated_tests/gen_tcs_input_tests.py
+@@ -272,7 +272,7 @@ class Test(object):
+             relative probe rgb (0.75, 0.75) (0.0, 1.0, 0.0)
+             """)
+ 
+-        test = test.format(self=self, generator_command=" ".join(sys.argv))
++        test = test.format(self=self, generator_command="generated_tests/gen_tcs_input_tests.py")
+ 
+         filename = self.filename()
+         dirname = os.path.dirname(filename)
+diff --git a/generated_tests/gen_tes_input_tests.py b/generated_tests/gen_tes_input_tests.py
+index 3d847b5cc..954840b20 100644
+--- a/generated_tests/gen_tes_input_tests.py
++++ b/generated_tests/gen_tes_input_tests.py
+@@ -301,7 +301,7 @@ class Test(object):
+             relative probe rgb (0.75, 0.75) (0.0, 1.0, 0.0)
+             """)
+ 
+-        test = test.format(self=self, generator_command=" ".join(sys.argv))
++        test = test.format(self=self, generator_command="generated_tests/gen_tes_input_tests.py")
+ 
+         filename = self.filename()
+         dirname = os.path.dirname(filename)
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch b/meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch
new file mode 100644
index 0000000000..2efba6f866
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch
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
+                 et.SubElement(env, 'env', name=k, value=v)
+ 
+     tree = et.ElementTree(root)
+-    with gzip.open(outfile, 'wb') as f:
++    reproducible_mtime = None
++    if 'SOURCE_DATE_EPOCH' in os.environ:
++        reproducible_mtime=os.environ['SOURCE_DATE_EPOCH']
++    with gzip.GzipFile(outfile, 'wb', mtime=reproducible_mtime) as f:
+         tree.write(f, encoding='utf-8', xml_declaration=True)
+ 
+ 
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch
new file mode 100644
index 0000000000..8321be8490
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch
@@ -0,0 +1,28 @@
+From 5bf89c6a314952313b2b762fff0d5501fe57ac53 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 2 Dec 2020 21:21:52 +0000
+Subject: [PATCH] tests/shader.py: sort the file list before working on it
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
+     assert group not in profile.test_list, 'duplicate group: {}'.format(group)
+ 
+-    # We'll end up with a list of tuples, split that into two lists
++    # This makes the xml output reproducible, as os.walk() order is random
++    files.sort()
++    # We'll end up with a list of tuples, split that into two list
+     files, installedfiles = list(zip(*files))
+     files = list(files)
+     installedfiles = list(installedfiles)
diff --git a/meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
new file mode 100644
index 0000000000..16c7c5c803
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -0,0 +1,30 @@
+From 1c67250308a92d4991ed05d9d240090ab84accae Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 10 Nov 2020 17:13:50 +0000
+Subject: [PATCH 2/2] tests/util/piglit-shader.c: do not hardcode build path
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
+@@ -73,7 +73,7 @@ piglit_compile_shader(GLenum target, const char *filename)
+ 
+ 	source_dir = getenv("PIGLIT_SOURCE_DIR");
+ 	if (source_dir == NULL) {
+-		source_dir = SOURCE_DIR;
++		source_dir = ".";
+ 	}
+ 
+ 	snprintf(filename_with_path, FILENAME_MAX - 1,
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index b84d53f87c..9897ef1575 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -6,13 +6,19 @@ BUGTRACKER = "https://gitlab.freedesktop.org/mesa/piglit/-/issues"
 LICENSE = "MIT & LGPLv2+ & GPLv3 & GPLv2+ & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 
-SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=master \
+SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=main \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
+           file://0001-Add-a-missing-include-for-htobe32-definition.patch \
+           file://0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch \
+           file://0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
+           file://0001-serializer.py-make-.gz-files-reproducible.patch \
+           file://0001-framework-profile.py-make-test-lists-reproducible.patch \
+           file://0001-tests-shader.py-sort-the-file-list-before-working-on.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "6126c2d4e476c7770d216ffa1932c10e2a5a7813"
+SRCREV = "83bc56abf2686e2cd9024a152e121ca4aa524985"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
@@ -37,7 +43,9 @@ do_compile[dirs] =+ "${B}/temp/"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
 PACKAGECONFIG[x11] = "-DPIGLIT_BUILD_GL_TESTS=ON,-DPIGLIT_BUILD_GL_TESTS=OFF,${X11_DEPS}, ${X11_RDEPS}"
+PACKAGECONFIG[vulkan] = "-DPIGLIT_BUILD_VK_TESTS=ON,-DPIGLIT_BUILD_VK_TESTS=OFF,vulkan-loader"
 
+export PIGLIT_BUILD_DIR = "../../../../git"
 
 do_configure_prepend() {
    if [ "${@bb.utils.contains('PACKAGECONFIG', 'freeglut', 'yes', 'no', d)}" = "no" ]; then
-- 
2.25.1


