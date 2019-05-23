Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id CF2F27E43F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 13:29:04 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 66so5423432otq.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 06:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uSPo2XnxOHfH6C02OUQyrhnesrZ2O00v2b0nuyq2iVI=;
	b=hmUe7vtL1U/QTukUsSYBhVP0YPt1mGvpVI8BK3NKZxAjR7apVX1DyC5bULDvOoV0AT
	uYE7KY49vvFQjjAf6pW3mhy2QRIm1FyQrX1cQCp+zpFCiC0RjmQI7BjLmWJbx3SJXLGo
	1oa9WAv4MucTTyurybckh1ll5im1RXLKXKRGkTJw/OMqziEK8ALABMHrq5+q8HSbenRB
	ysv8BrATzhfbzrQ9XtIUQCSY5RQ4teD1MpZVp/IJg8NWUoLiiMf0MLCOY6wPSkPyDM3l
	jvwxMbic1kn5bHuGID9yI/xtUNAhOFHCXgzu088rCpRCZMRqkbC4i6XmlA+ol+0FgaFt
	AuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uSPo2XnxOHfH6C02OUQyrhnesrZ2O00v2b0nuyq2iVI=;
	b=q3eQ4rmbPNnsHOYyNYiJHPldJpXluGofRbHcxcBghkYBvZstUzThQFEdaDdmNyf28Q
	qSjCuNece1mabS+EYgF5k0okdWJCaM5fHZtCEIKLpEqsLhd9mUB+sEtc07Rfw6v00ky7
	/XRPRSVx5tzAj5erRNpALrzQUx0OOzvYUVnlkKo+TR5/3rQ1TLr5pwHoy4CovUlGPhFg
	qvVAQ0J0Ykf46dsz683E8zGgcdQr2wGGeLkL3iNYyOR8vGJpiPJwq8ACzp/Yiz2+JmBn
	muw2OcaVHHYe8B3hhIoUDkq4yCws/1TJNvz3SnP4L7l6/VXiqlnXmJRSei7gIkcA2R9n
	i3ng==
X-Gm-Message-State: APjAAAXLWc1KfnN3jKuFzuw8M9ogcosRwrgdz5YJjob2f9BWLKpPy1/H
	87WQiRRkK11tE9T2qoiIFjc1OJEdCyAiUJjyQIokzsQ9
X-Google-Smtp-Source: APXvYqy2Zhi7cN2H0FMOw05oiKO/xtay+qfxDBq04YKmn2FKX8XJ2JtvApRyjufth5Cao1cTfqI8pVEnmIBikESGJY4=
X-Received: by 2002:a9d:6a15:: with SMTP id g21mr19124otn.28.1558618145910;
	Thu, 23 May 2019 06:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190522110239.52521-1-alex.kanavin@gmail.com>
	<CAMKF1spxNCycTSZhxCLZFWEfNN5h5-oTCmCwpmTKGjiCN4O+4w@mail.gmail.com>
	<CANNYZj_5r3K6ZVveF30JURGem-6RvXjn-Va9Tt=t+3y4J=jcCw@mail.gmail.com>
	<CAJTo0LZZvWX7gp9K+9XMZxVmmzr4oOGyH5DKcMohiS=ojtU04w@mail.gmail.com>
In-Reply-To: <CAJTo0LZZvWX7gp9K+9XMZxVmmzr4oOGyH5DKcMohiS=ojtU04w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 May 2019 15:28:54 +0200
Message-ID: <CANNYZj-tF7HRQgS5ihDAfM+78VjTwNWnB2rPZedt=NK=9g_foQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Thu, 23 May 2019 13:29:06 -0000
Content-Type: text/plain; charset="UTF-8"

Devtool does not create commits; it's up to the developer and/or AUH.
I wouldn't necessarily want AUH to try to auto-explain the changes, as
it's worse than no explanation imo :)

Alex

On Thu, 23 May 2019 at 14:23, Burton, Ross <ross.burton@intel.com> wrote:
>
> Can you file a bug to get devtool to state that in the commit message?
>
> Ross
>
> On Thu, 23 May 2019 at 10:27, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > Yes. If devtool drops them, then they are already in the code.
> >
> > Alex
> >
> > On Thu, 23 May 2019 at 03:30, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Wed, May 22, 2019 at 4:02 AM Alexander Kanavin
> > > <alex.kanavin@gmail.com> wrote:
> > > >
> > > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > ---
> > > >  ...UPWARD-only-if-its-defined-in-fenv.h.patch | 75 -------------------
> > > >  .../piglit/piglit/format-fix.patch            | 69 -----------------
> > >
> > > are these patches upstreamed ?
> > >
> > > >  meta/recipes-graphics/piglit/piglit_git.bb    |  5 +-
> > > >  3 files changed, 1 insertion(+), 148 deletions(-)
> > > >  delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch
> > > >  delete mode 100644 meta/recipes-graphics/piglit/piglit/format-fix.patch
> > > >
> > > > diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch
> > > > deleted file mode 100644
> > > > index 57eda2e207b..00000000000
> > > > --- a/meta/recipes-graphics/piglit/piglit/0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch
> > > > +++ /dev/null
> > > > @@ -1,75 +0,0 @@
> > > > -Upstream-Status: Submitted [mailing list]
> > > > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > > -
> > > > -From 0e0a2a69261031d55d52b6045990e8982ea12912 Mon Sep 17 00:00:00 2001
> > > > -From: Khem Raj <raj.khem@gmail.com>
> > > > -Date: Sat, 9 Jul 2016 07:52:19 +0000
> > > > -Subject: [PATCH] tests: only run rounding tests if FE_UPWARD is present
> > > > -
> > > > -On ARM, musl does not define FE_* when the architecture does not have VFP (which
> > > > -is the right interpretation).
> > > > -
> > > > -As these tests depend on calling fesetround(), skip the test if FE_UPWARD isn't
> > > > -available.
> > > > -
> > > > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > > ----
> > > > - tests/general/roundmode-getintegerv.c | 12 ++++++++----
> > > > - tests/general/roundmode-pixelstore.c  | 12 ++++++++----
> > > > - 2 files changed, 16 insertions(+), 8 deletions(-)
> > > > -
> > > > -diff --git a/tests/general/roundmode-getintegerv.c b/tests/general/roundmode-getintegerv.c
> > > > -index 28ecfaf55..aa99044a1 100644
> > > > ---- a/tests/general/roundmode-getintegerv.c
> > > > -+++ b/tests/general/roundmode-getintegerv.c
> > > > -@@ -79,13 +79,17 @@ test(float val, int expect)
> > > > - void
> > > > - piglit_init(int argc, char **argv)
> > > > - {
> > > > --      int ret;
> > > > -       bool pass = true;
> > > > --      ret = fesetround(FE_UPWARD);
> > > > --      if (ret != 0) {
> > > > --              printf("Couldn't set rounding mode\n");
> > > > -+
> > > > -+#ifdef FE_UPWARD
> > > > -+      if (fesetround(FE_UPWARD) != 0) {
> > > > -+              printf("Setting rounding mode failed\n");
> > > > -               piglit_report_result(PIGLIT_SKIP);
> > > > -       }
> > > > -+#else
> > > > -+      printf("Cannot set rounding mode\n");
> > > > -+      piglit_report_result(PIGLIT_SKIP);
> > > > -+#endif
> > > > -
> > > > -       pass = test(2.2, 2) && pass;
> > > > -       pass = test(2.8, 3) && pass;
> > > > -diff --git a/tests/general/roundmode-pixelstore.c b/tests/general/roundmode-pixelstore.c
> > > > -index 8a029b257..57ec11c09 100644
> > > > ---- a/tests/general/roundmode-pixelstore.c
> > > > -+++ b/tests/general/roundmode-pixelstore.c
> > > > -@@ -79,13 +79,17 @@ test(float val, int expect)
> > > > - void
> > > > - piglit_init(int argc, char **argv)
> > > > - {
> > > > --      int ret;
> > > > -       bool pass = true;
> > > > --      ret = fesetround(FE_UPWARD);
> > > > --      if (ret != 0) {
> > > > --              printf("Couldn't set rounding mode\n");
> > > > -+
> > > > -+#ifdef FE_UPWARD
> > > > -+      if (fesetround(FE_UPWARD) != 0) {
> > > > -+              printf("Setting rounding mode failed\n");
> > > > -               piglit_report_result(PIGLIT_SKIP);
> > > > -       }
> > > > -+#else
> > > > -+      printf("Cannot set rounding mode\n");
> > > > -+      piglit_report_result(PIGLIT_SKIP);
> > > > -+#endif
> > > > -
> > > > -       pass = test(2.2, 2) && pass;
> > > > -       pass = test(2.8, 3) && pass;
> > > > ---
> > > > -2.11.0
> > > > -
> > > > diff --git a/meta/recipes-graphics/piglit/piglit/format-fix.patch b/meta/recipes-graphics/piglit/piglit/format-fix.patch
> > > > deleted file mode 100644
> > > > index 73d539fef27..00000000000
> > > > --- a/meta/recipes-graphics/piglit/piglit/format-fix.patch
> > > > +++ /dev/null
> > > > @@ -1,69 +0,0 @@
> > > > -Upstream-Status: Submitted [mailing list]
> > > > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > > -
> > > > -From f0c6981322807e179e39ce67aeebd42cf7a54d36 Mon Sep 17 00:00:00 2001
> > > > -From: Ross Burton <ross.burton@intel.com>
> > > > -Date: Wed, 21 Nov 2018 12:44:36 +0000
> > > > -Subject: [PATCH] arb_texture_view: fix security format warnings
> > > > -
> > > > -If built with -Werror=format-security then Piglit fails to build:
> > > > -
> > > > -/tests/spec/arb_texture_view/rendering-layers-image.c:150:8:
> > > > -error: format not a string literal and no format arguments [-Werror=format-security]
> > > > -         (desc)); \
> > > > -         ^~~~~~
> > > > -
> > > > -In this case test->uniform_type is being turned into a string using snprintf()
> > > > -and then passed to piglit_report_subtest_result() which takes a format string,
> > > > -but GCC can't verify the format.
> > > > -
> > > > -As _subtest_report() takes a format string, we can just remove the snprintf()
> > > > -and let it construct the label.
> > > > -
> > > > -Also as X is used once and doesn't make the code clearer, just inline it.
> > > > -
> > > > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > > ----
> > > > - tests/spec/arb_texture_view/rendering-layers-image.c | 19 ++++++-------------
> > > > - 1 file changed, 6 insertions(+), 13 deletions(-)
> > > > -
> > > > -diff --git a/tests/spec/arb_texture_view/rendering-layers-image.c b/tests/spec/arb_texture_view/rendering-layers-image.c
> > > > -index 415b01657..86148075b 100644
> > > > ---- a/tests/spec/arb_texture_view/rendering-layers-image.c
> > > > -+++ b/tests/spec/arb_texture_view/rendering-layers-image.c
> > > > -@@ -142,26 +142,19 @@ test_render_layers(const struct test_info *test)
> > > > -       return pass;
> > > > - }
> > > > -
> > > > --#define X(f, desc) \
> > > > --      do { \
> > > > --              const bool subtest_pass = (f); \
> > > > --              piglit_report_subtest_result(subtest_pass \
> > > > --                                               ? PIGLIT_PASS : PIGLIT_FAIL, \
> > > > --                                               (desc)); \
> > > > --              pass = pass && subtest_pass; \
> > > > --      } while (0)
> > > > --
> > > > - enum piglit_result
> > > > - piglit_display(void)
> > > > - {
> > > > -       bool pass = true;
> > > > -       for (int test_idx = 0; test_idx < ARRAY_SIZE(tests); test_idx++) {
> > > > -               const struct test_info *test = &tests[test_idx];
> > > > --              char test_name[128];
> > > > --              snprintf(test_name, sizeof(test_name), "layers rendering of %s", test->uniform_type);
> > > > --              X(test_render_layers(test), test_name);
> > > > -+
> > > > -+              const bool subtest_pass = test_render_layers(test);
> > > > -+
> > > > -+              piglit_report_subtest_result(subtest_pass ? PIGLIT_PASS : PIGLIT_FAIL,
> > > > -+                                           "layers rendering of %s", test->uniform_type);
> > > > -+              pass = pass && subtest_pass;
> > > > -       }
> > > > --#undef X
> > > > -       pass = piglit_check_gl_error(GL_NO_ERROR) && pass;
> > > > -       return pass ? PIGLIT_PASS : PIGLIT_FAIL;
> > > > - }
> > > > ---
> > > > -2.11.0
> > > > -
> > > > diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
> > > > index b6542a191cf..97ebd96619e 100644
> > > > --- a/meta/recipes-graphics/piglit/piglit_git.bb
> > > > +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> > > > @@ -4,14 +4,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
> > > >
> > > >  SRC_URI = "git://anongit.freedesktop.org/piglit \
> > > >             file://0001-cmake-install-bash-completions-in-the-right-place.patch \
> > > > -           file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch \
> > > >             file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
> > > > -           file://format-fix.patch \
> > > >             "
> > > >  UPSTREAM_CHECK_COMMITS = "1"
> > > >
> > > > -# From 2018-10-26
> > > > -SRCREV = "b9066c7717af1d169a616c9e61706b99ff8515b5"
> > > > +SRCREV = "ac955893c92591c4542439665cae2c3fb79de9dd"
> > > >  # (when PV goes above 1.0 remove the trailing r)
> > > >  PV = "1.0+gitr${SRCPV}"
> > > >
> > > > --
> > > > 2.17.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

