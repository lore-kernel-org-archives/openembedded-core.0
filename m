Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E94AC433EF
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 16:01:59 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web09.20642.1636214517790063967
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Nov 2021 09:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Aowb40a4;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id o12so31006957ybk.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Nov 2021 09:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZqAVPp3hVLQhIqChnKIDbJbwrlBOOyi7QqSrMk+9IuE=;
        b=Aowb40a4fCkTVwsv8DFkKLJZoXvY7taLiDPOh3kLNODf9tc9VHYmQApF0vsMgHA4c6
         MqbubQWh8S5RYalknjwvcRFT9AhccYK1SdSR96SemfD5PQWcLS0wSOrSi1zxL2+HZsoq
         wwitMeLLAGW2jSseVDcKqQusP9WB79Ho3crNVAOPM7Qm7O7Avl/0lVRNdISU9LZnD6I7
         Gvpxe7fWrND0Yr4MR3l1hY06w/4P9gZuT9nf2uxCITUGCPuSEk2OecBy5sfk7u3yzn4y
         pAChGl6MJnlNIHBdcU1OFHhIsVk8iivU29tWQQ48biaOHGKrBDJfB5USd3IJ6etZWrOq
         RNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZqAVPp3hVLQhIqChnKIDbJbwrlBOOyi7QqSrMk+9IuE=;
        b=Fq5pg8tKpDTgC56h+t8M4XwUhKqHZ6o04bDI9prU2p0lxddjmEJa3YskT74vSqDD3I
         2j2dCT8aT62y3p9jDJKfmb3jfhWLALeQN941YvqHwFjqlXguO2PIHyXs1bUDXH6HFGKz
         HX4xJEWhbhCCBa9P6ci8DZFlgiVVTuAYpUv0VeYthO70RRzgGzD088elvdAnGri7Ajg0
         qxa/xuoTVfrdat4/MSd9YLXd6S1Q2qKTRIjS10G//j+zvKi/0K8qhS4BmVEo3BNety+P
         JoMtANDiRWpCYdtrpKkQpYwMOUd21y2sliCQDYHQ+d+B6WXWEmodhiojQOXONo7XZm6c
         HARQ==
X-Gm-Message-State: AOAM533iyar7iDeoubi3yXPF08JkPekTkJ7inlxgrQ3s5/eiheooPjV6
	noDuya+e8fkMoAow2jlb29WZl16YFfd8X2lIIxw=
X-Google-Smtp-Source: 
 ABdhPJxldjtkecjO3vi/dvmlATDqoOgoDKAEV5jBPeUQwhiMsPE1WFpDuULEmm/vyk1JylOTMclDnPOrjDY0lBXfuaQ=
X-Received: by 2002:a25:2703:: with SMTP id n3mr69965370ybn.276.1636214516911;
 Sat, 06 Nov 2021 09:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211106125915.13227-1-marex@denx.de>
In-Reply-To: <20211106125915.13227-1-marex@denx.de>
From: Steve Sakoman <steve@sakoman.com>
Date: Sat, 6 Nov 2021 06:01:45 -1000
Message-ID: 
 <CAGDS+n=4kaGR8_3QmAEopN+paMnBPPXfFTTuK2nujrXM_tqEFg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] piglit: upgrade to latest revision
To: Marek Vasut <marex@denx.de>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Anuj Mittal <anuj.mittal@intel.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Nov 2021 16:01:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157941

On Sat, Nov 6, 2021 at 2:59 AM Marek Vasut <marex@denx.de> wrote:
>
> Update piglit to latest git revision and update the branch name,
> since the original one is no longer updated. Make sure the VK
> tests are only enabled if VK is also enabled in PACKAGECONFIG,
> and that this is opt-in, otherwise older systems fail to build.
>
> Cherry picked from squashed commits:
>   eb3a8d4c7b ("piglit: upgrade to latest revision")
>   a27b06f73a ("piglit: upgrade to latest revision")
>   bb091bc0be ("piglit: upgrade to latest revision")
>   394746d1cb ("piglit: upgrade to latest revision")
>   5aec8cff94 ("piglit: upgrade to latest revision")
>   fc4c82773d ("piglit: fix reproducibility")
>   6fbec0f12a ("piglit: update to latest revision")
>   8d23a0d498 ("piglit: upgrade to latest revision")
>   5144d515fe ("piglit: upgrade to latest revision")
>   dd085bd577 ("piglit: upgrade to latest revision")
>   9ba6df1b2c ("piglit: upgrade to latest revision")
>   1ccd71eb3e ("piglit: upgrade to latest revision")
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Anuj Mittal <anuj.mittal@intel.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Steve Sakoman <steve@sakoman.com>
> ---
> NOTE: Why backport this -- because graphics testing on oe-core dunfell

I am having trouble parsing the reason.  Could you explain?

Steve


>       Why squash the patches -- because it is the same thing all over
>         (except for the reproducibility fix, which is hard to rebase
>          to the end)
> ---
>  ...ssing-include-for-htobe32-definition.patch | 27 ++++++++++++
>  ...file.py-make-test-lists-reproducible.patch | 31 +++++++++++++
>  ...gen_tcs-tes_input_tests.py-do-not-ha.patch | 44 +++++++++++++++++++
>  ...lizer.py-make-.gz-files-reproducible.patch | 30 +++++++++++++
>  ...sort-the-file-list-before-working-on.patch | 28 ++++++++++++
>  ...t-shader.c-do-not-hardcode-build-pat.patch | 30 +++++++++++++
>  meta/recipes-graphics/piglit/piglit_git.bb    | 12 ++++-
>  7 files changed, 200 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch
>  create mode 100644 meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch
>  create mode 100644 meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch
>  create mode 100644 meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch
>  create mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch
>  create mode 100644 meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
>
> diff --git a/meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch b/meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch
> new file mode 100644
> index 0000000000..caa48e088d
> --- /dev/null
> +++ b/meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch
> @@ -0,0 +1,27 @@
> +From d623e9797b7ee9b3739a8a4afe1a01f7e03754aa Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Sun, 1 Nov 2020 20:08:49 +0000
> +Subject: [PATCH] Add a missing include for htobe32 definition
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c b/tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c
> +index 5f45e0c23..c755ee29a 100644
> +--- a/tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c
> ++++ b/tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c
> +@@ -34,6 +34,8 @@
> +
> + #include "piglit-util-gl.h"
> +
> ++#include <endian.h>
> ++
> + #define IMAGE_WIDTH 60
> + #define IMAGE_HEIGHT 60
> +
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch b/meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch
> new file mode 100644
> index 0000000000..cc9482c047
> --- /dev/null
> +++ b/meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch
> @@ -0,0 +1,31 @@
> +From 9086d42df1f3134bafcfe33ff16db7bbb9d9a0fd Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Mon, 30 Nov 2020 23:08:22 +0000
> +Subject: [PATCH] framework/profile.py: make test lists reproducible
> +
> +These are created with os.walk, which yields different
> +order depending on where it's run.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + framework/profile.py | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/framework/profile.py b/framework/profile.py
> +index c210e535e..9b5d51d68 100644
> +--- a/framework/profile.py
> ++++ b/framework/profile.py
> +@@ -528,7 +528,11 @@ class TestProfile(object):
> +                 else:
> +                     opts[n] = self.test_list[n]
> +         else:
> +-            opts = self.test_list  # pylint: disable=redefined-variable-type
> ++            opts = collections.OrderedDict()
> ++            test_keys = list(self.test_list.keys())
> ++            test_keys.sort()
> ++            for k in test_keys:
> ++                opts[k] = self.test_list[k]
> +
> +         for k, v in self.filters.run(opts.items()):
> +             yield k, v
> diff --git a/meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch b/meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch
> new file mode 100644
> index 0000000000..8704f98500
> --- /dev/null
> +++ b/meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch
> @@ -0,0 +1,44 @@
> +From 1b23539aece156f6fe0789cb988f22e5915228f6 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Tue, 10 Nov 2020 17:12:32 +0000
> +Subject: [PATCH 1/2] generated_tests/gen_tcs/tes_input_tests.py: do not
> + hardcode the full binary path
> +
> +This helps reproducibility.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + generated_tests/gen_tcs_input_tests.py | 2 +-
> + generated_tests/gen_tes_input_tests.py | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/generated_tests/gen_tcs_input_tests.py b/generated_tests/gen_tcs_input_tests.py
> +index face4f19a..e36671af4 100644
> +--- a/generated_tests/gen_tcs_input_tests.py
> ++++ b/generated_tests/gen_tcs_input_tests.py
> +@@ -272,7 +272,7 @@ class Test(object):
> +             relative probe rgb (0.75, 0.75) (0.0, 1.0, 0.0)
> +             """)
> +
> +-        test = test.format(self=self, generator_command=" ".join(sys.argv))
> ++        test = test.format(self=self, generator_command="generated_tests/gen_tcs_input_tests.py")
> +
> +         filename = self.filename()
> +         dirname = os.path.dirname(filename)
> +diff --git a/generated_tests/gen_tes_input_tests.py b/generated_tests/gen_tes_input_tests.py
> +index 3d847b5cc..954840b20 100644
> +--- a/generated_tests/gen_tes_input_tests.py
> ++++ b/generated_tests/gen_tes_input_tests.py
> +@@ -301,7 +301,7 @@ class Test(object):
> +             relative probe rgb (0.75, 0.75) (0.0, 1.0, 0.0)
> +             """)
> +
> +-        test = test.format(self=self, generator_command=" ".join(sys.argv))
> ++        test = test.format(self=self, generator_command="generated_tests/gen_tes_input_tests.py")
> +
> +         filename = self.filename()
> +         dirname = os.path.dirname(filename)
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch b/meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch
> new file mode 100644
> index 0000000000..2efba6f866
> --- /dev/null
> +++ b/meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch
> @@ -0,0 +1,30 @@
> +From 1919bb7f4072d73dcbb64d0e06eff5b04529c3db Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Mon, 16 Nov 2020 18:01:02 +0000
> +Subject: [PATCH] serializer.py: make .gz files reproducible
> +
> +.gz format contains mtime of the compressed data, and
> +SOURCE_DATE_EPOCH is the standard way to make it reproducuble.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + tests/serializer.py | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/tests/serializer.py b/tests/serializer.py
> +index bd14bc3db..bc5b45d7f 100644
> +--- a/tests/serializer.py
> ++++ b/tests/serializer.py
> +@@ -138,7 +138,10 @@ def serializer(name, profile, outfile):
> +                 et.SubElement(env, 'env', name=k, value=v)
> +
> +     tree = et.ElementTree(root)
> +-    with gzip.open(outfile, 'wb') as f:
> ++    reproducible_mtime = None
> ++    if 'SOURCE_DATE_EPOCH' in os.environ:
> ++        reproducible_mtime=os.environ['SOURCE_DATE_EPOCH']
> ++    with gzip.GzipFile(outfile, 'wb', mtime=reproducible_mtime) as f:
> +         tree.write(f, encoding='utf-8', xml_declaration=True)
> +
> +
> diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch
> new file mode 100644
> index 0000000000..8321be8490
> --- /dev/null
> +++ b/meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch
> @@ -0,0 +1,28 @@
> +From 5bf89c6a314952313b2b762fff0d5501fe57ac53 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Wed, 2 Dec 2020 21:21:52 +0000
> +Subject: [PATCH] tests/shader.py: sort the file list before working on it
> +
> +This allows later xml output to be reproducible.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + tests/shader.py | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/tests/shader.py b/tests/shader.py
> +index 849273660..e6e65d1ba 100644
> +--- a/tests/shader.py
> ++++ b/tests/shader.py
> +@@ -52,7 +52,9 @@ for basedir in [TESTS_DIR, GENERATED_TESTS_DIR]:
> + for group, files in shader_tests.items():
> +     assert group not in profile.test_list, 'duplicate group: {}'.format(group)
> +
> +-    # We'll end up with a list of tuples, split that into two lists
> ++    # This makes the xml output reproducible, as os.walk() order is random
> ++    files.sort()
> ++    # We'll end up with a list of tuples, split that into two list
> +     files, installedfiles = list(zip(*files))
> +     files = list(files)
> +     installedfiles = list(installedfiles)
> diff --git a/meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
> new file mode 100644
> index 0000000000..16c7c5c803
> --- /dev/null
> +++ b/meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
> @@ -0,0 +1,30 @@
> +From 1c67250308a92d4991ed05d9d240090ab84accae Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Tue, 10 Nov 2020 17:13:50 +0000
> +Subject: [PATCH 2/2] tests/util/piglit-shader.c: do not hardcode build path
> + into target binary
> +
> +This helps reproducibilty.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + tests/util/piglit-shader.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tests/util/piglit-shader.c b/tests/util/piglit-shader.c
> +index 4fd68d21e..c9ea8295e 100644
> +--- a/tests/util/piglit-shader.c
> ++++ b/tests/util/piglit-shader.c
> +@@ -73,7 +73,7 @@ piglit_compile_shader(GLenum target, const char *filename)
> +
> +       source_dir = getenv("PIGLIT_SOURCE_DIR");
> +       if (source_dir == NULL) {
> +-              source_dir = SOURCE_DIR;
> ++              source_dir = ".";
> +       }
> +
> +       snprintf(filename_with_path, FILENAME_MAX - 1,
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
> index 4229412554..9897ef1575 100644
> --- a/meta/recipes-graphics/piglit/piglit_git.bb
> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> @@ -6,13 +6,19 @@ BUGTRACKER = "https://gitlab.freedesktop.org/mesa/piglit/-/issues"
>  LICENSE = "MIT & LGPLv2+ & GPLv3 & GPLv2+ & BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
>
> -SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
> +SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=main \
>             file://0001-cmake-install-bash-completions-in-the-right-place.patch \
>             file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
> +           file://0001-Add-a-missing-include-for-htobe32-definition.patch \
> +           file://0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch \
> +           file://0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
> +           file://0001-serializer.py-make-.gz-files-reproducible.patch \
> +           file://0001-framework-profile.py-make-test-lists-reproducible.patch \
> +           file://0001-tests-shader.py-sort-the-file-list-before-working-on.patch \
>             "
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -SRCREV = "6126c2d4e476c7770d216ffa1932c10e2a5a7813"
> +SRCREV = "83bc56abf2686e2cd9024a152e121ca4aa524985"
>  # (when PV goes above 1.0 remove the trailing r)
>  PV = "1.0+gitr${SRCPV}"
>
> @@ -37,7 +43,9 @@ do_compile[dirs] =+ "${B}/temp/"
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>  PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
>  PACKAGECONFIG[x11] = "-DPIGLIT_BUILD_GL_TESTS=ON,-DPIGLIT_BUILD_GL_TESTS=OFF,${X11_DEPS}, ${X11_RDEPS}"
> +PACKAGECONFIG[vulkan] = "-DPIGLIT_BUILD_VK_TESTS=ON,-DPIGLIT_BUILD_VK_TESTS=OFF,vulkan-loader"
>
> +export PIGLIT_BUILD_DIR = "../../../../git"
>
>  do_configure_prepend() {
>     if [ "${@bb.utils.contains('PACKAGECONFIG', 'freeglut', 'yes', 'no', d)}" = "no" ]; then
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157938): https://lists.openembedded.org/g/openembedded-core/message/157938
> Mute This Topic: https://lists.openembedded.org/mt/86862445/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

