Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 359BF7E210
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 01:30:00 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id b9so75779qkg.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 18:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tYWgmGTZKsP0rU3R+hkzKZRZpOXPltLk37wcH1n6qGE=;
	b=ZluG23mmLmfpLnccMUd6t4Ak4934rMMeUB3dv2Q4EKuGc5CurNNIndfPwACrgYu59F
	0LCFijtj4FdgCaeG1kf/GW3tr0wESzLcQF612+fBUqXMiDoiph7ZlUTQ8FH4RiZHpZdO
	qsX9mq8M4ZsPoAVaE/8aEgafh2PW41sU7rP9y6FJENUa+rKO9ylby5Qs77bRs/3ToBez
	p26F5ICQr/V991cs7jq49fzcXmcFe5RGQ/yU1U7J0blgdlpMgH7rKVyrHWEnH8+CCXN/
	8f8doZjfUBvVNIrsP3cqCThb1upCz8/4A4YGzDRERccUYNfrfYblgMH+tqdSxgMXmdLZ
	q9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tYWgmGTZKsP0rU3R+hkzKZRZpOXPltLk37wcH1n6qGE=;
	b=NSbNL/lkp4pTrWRQYdEOrK50w3yjuj6zkd0ov1Or3RAY/bbE+W/Uq02sywVjRmJ/3T
	kTO/FTiowjEJQttIiUM3/2KVoNkRsmtoELUalCAZ/AxQT7XlnthczDjoelBjjSwRDbmq
	+gjpDCD7ME+e/sBM5GslLdcUZqyqHoZ7PaNivtWW/gEyWO54i+nF/ovalb1G/7oXRDlq
	pTv39QaofqvE1zqKmIglgbMQ1bli30oa/aKpfE8DLNA4MjCfuuNB0+24U/wQSrpgzZ/7
	LSy2pBV/cdiawVqYsq/2hrkCs+eyTrtBP3/J8Wpt+/zsbUAiyfK9his4up3W8k8Nzg7g
	Z/OA==
X-Gm-Message-State: APjAAAUVLm9Vk6+NgKb3tgMj1ZvQ+pzHbKs1RVfk9OB9ZwLEF9HIBdNV
	qCnKf8ZqQtEq/Lh7dzj7cbHPhwGIzDZkioUqOf0=
X-Google-Smtp-Source: APXvYqxFFOWhdXkodRr4dFi/jz+LI+UpJGDQMtOZUJtxrbZgPex8WIt0F6lvVTNWaj45XF6ouAB9c0ywBx9gcUDekmc=
X-Received: by 2002:a37:8102:: with SMTP id c2mr410770qkd.208.1558574999750;
	Wed, 22 May 2019 18:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190522110239.52521-1-alex.kanavin@gmail.com>
In-Reply-To: <20190522110239.52521-1-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 May 2019 18:29:33 -0700
Message-ID: <CAMKF1spxNCycTSZhxCLZFWEfNN5h5-oTCmCwpmTKGjiCN4O+4w@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] piglit: upgrade to latest revision
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
X-List-Received-Date: Thu, 23 May 2019 01:30:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 22, 2019 at 4:02 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...UPWARD-only-if-its-defined-in-fenv.h.patch | 75 -------------------
>  .../piglit/piglit/format-fix.patch            | 69 -----------------

are these patches upstreamed ?

>  meta/recipes-graphics/piglit/piglit_git.bb    |  5 +-
>  3 files changed, 1 insertion(+), 148 deletions(-)
>  delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch
>  delete mode 100644 meta/recipes-graphics/piglit/piglit/format-fix.patch
>
> diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch
> deleted file mode 100644
> index 57eda2e207b..00000000000
> --- a/meta/recipes-graphics/piglit/piglit/0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -Upstream-Status: Submitted [mailing list]
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From 0e0a2a69261031d55d52b6045990e8982ea12912 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 9 Jul 2016 07:52:19 +0000
> -Subject: [PATCH] tests: only run rounding tests if FE_UPWARD is present
> -
> -On ARM, musl does not define FE_* when the architecture does not have VFP (which
> -is the right interpretation).
> -
> -As these tests depend on calling fesetround(), skip the test if FE_UPWARD isn't
> -available.
> -
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> ----
> - tests/general/roundmode-getintegerv.c | 12 ++++++++----
> - tests/general/roundmode-pixelstore.c  | 12 ++++++++----
> - 2 files changed, 16 insertions(+), 8 deletions(-)
> -
> -diff --git a/tests/general/roundmode-getintegerv.c b/tests/general/roundmode-getintegerv.c
> -index 28ecfaf55..aa99044a1 100644
> ---- a/tests/general/roundmode-getintegerv.c
> -+++ b/tests/general/roundmode-getintegerv.c
> -@@ -79,13 +79,17 @@ test(float val, int expect)
> - void
> - piglit_init(int argc, char **argv)
> - {
> --      int ret;
> -       bool pass = true;
> --      ret = fesetround(FE_UPWARD);
> --      if (ret != 0) {
> --              printf("Couldn't set rounding mode\n");
> -+
> -+#ifdef FE_UPWARD
> -+      if (fesetround(FE_UPWARD) != 0) {
> -+              printf("Setting rounding mode failed\n");
> -               piglit_report_result(PIGLIT_SKIP);
> -       }
> -+#else
> -+      printf("Cannot set rounding mode\n");
> -+      piglit_report_result(PIGLIT_SKIP);
> -+#endif
> -
> -       pass = test(2.2, 2) && pass;
> -       pass = test(2.8, 3) && pass;
> -diff --git a/tests/general/roundmode-pixelstore.c b/tests/general/roundmode-pixelstore.c
> -index 8a029b257..57ec11c09 100644
> ---- a/tests/general/roundmode-pixelstore.c
> -+++ b/tests/general/roundmode-pixelstore.c
> -@@ -79,13 +79,17 @@ test(float val, int expect)
> - void
> - piglit_init(int argc, char **argv)
> - {
> --      int ret;
> -       bool pass = true;
> --      ret = fesetround(FE_UPWARD);
> --      if (ret != 0) {
> --              printf("Couldn't set rounding mode\n");
> -+
> -+#ifdef FE_UPWARD
> -+      if (fesetround(FE_UPWARD) != 0) {
> -+              printf("Setting rounding mode failed\n");
> -               piglit_report_result(PIGLIT_SKIP);
> -       }
> -+#else
> -+      printf("Cannot set rounding mode\n");
> -+      piglit_report_result(PIGLIT_SKIP);
> -+#endif
> -
> -       pass = test(2.2, 2) && pass;
> -       pass = test(2.8, 3) && pass;
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-graphics/piglit/piglit/format-fix.patch b/meta/recipes-graphics/piglit/piglit/format-fix.patch
> deleted file mode 100644
> index 73d539fef27..00000000000
> --- a/meta/recipes-graphics/piglit/piglit/format-fix.patch
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -Upstream-Status: Submitted [mailing list]
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From f0c6981322807e179e39ce67aeebd42cf7a54d36 Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@intel.com>
> -Date: Wed, 21 Nov 2018 12:44:36 +0000
> -Subject: [PATCH] arb_texture_view: fix security format warnings
> -
> -If built with -Werror=format-security then Piglit fails to build:
> -
> -/tests/spec/arb_texture_view/rendering-layers-image.c:150:8:
> -error: format not a string literal and no format arguments [-Werror=format-security]
> -         (desc)); \
> -         ^~~~~~
> -
> -In this case test->uniform_type is being turned into a string using snprintf()
> -and then passed to piglit_report_subtest_result() which takes a format string,
> -but GCC can't verify the format.
> -
> -As _subtest_report() takes a format string, we can just remove the snprintf()
> -and let it construct the label.
> -
> -Also as X is used once and doesn't make the code clearer, just inline it.
> -
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> ----
> - tests/spec/arb_texture_view/rendering-layers-image.c | 19 ++++++-------------
> - 1 file changed, 6 insertions(+), 13 deletions(-)
> -
> -diff --git a/tests/spec/arb_texture_view/rendering-layers-image.c b/tests/spec/arb_texture_view/rendering-layers-image.c
> -index 415b01657..86148075b 100644
> ---- a/tests/spec/arb_texture_view/rendering-layers-image.c
> -+++ b/tests/spec/arb_texture_view/rendering-layers-image.c
> -@@ -142,26 +142,19 @@ test_render_layers(const struct test_info *test)
> -       return pass;
> - }
> -
> --#define X(f, desc) \
> --      do { \
> --              const bool subtest_pass = (f); \
> --              piglit_report_subtest_result(subtest_pass \
> --                                               ? PIGLIT_PASS : PIGLIT_FAIL, \
> --                                               (desc)); \
> --              pass = pass && subtest_pass; \
> --      } while (0)
> --
> - enum piglit_result
> - piglit_display(void)
> - {
> -       bool pass = true;
> -       for (int test_idx = 0; test_idx < ARRAY_SIZE(tests); test_idx++) {
> -               const struct test_info *test = &tests[test_idx];
> --              char test_name[128];
> --              snprintf(test_name, sizeof(test_name), "layers rendering of %s", test->uniform_type);
> --              X(test_render_layers(test), test_name);
> -+
> -+              const bool subtest_pass = test_render_layers(test);
> -+
> -+              piglit_report_subtest_result(subtest_pass ? PIGLIT_PASS : PIGLIT_FAIL,
> -+                                           "layers rendering of %s", test->uniform_type);
> -+              pass = pass && subtest_pass;
> -       }
> --#undef X
> -       pass = piglit_check_gl_error(GL_NO_ERROR) && pass;
> -       return pass ? PIGLIT_PASS : PIGLIT_FAIL;
> - }
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
> index b6542a191cf..97ebd96619e 100644
> --- a/meta/recipes-graphics/piglit/piglit_git.bb
> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> @@ -4,14 +4,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
>
>  SRC_URI = "git://anongit.freedesktop.org/piglit \
>             file://0001-cmake-install-bash-completions-in-the-right-place.patch \
> -           file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch \
>             file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
> -           file://format-fix.patch \
>             "
>  UPSTREAM_CHECK_COMMITS = "1"
>
> -# From 2018-10-26
> -SRCREV = "b9066c7717af1d169a616c9e61706b99ff8515b5"
> +SRCREV = "ac955893c92591c4542439665cae2c3fb79de9dd"
>  # (when PV goes above 1.0 remove the trailing r)
>  PV = "1.0+gitr${SRCPV}"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

