Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6A83F74813
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 21:56:56 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id j5so3887111ioj.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 14:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qIM6yKYNRp0e5e29HWwEwdRU7anfT47HhVX5+DJk9lc=;
	b=M8dlY5SB4ChvBFgYIeMoOgQp0eWapPfqhVxNWXsAE4/Bz+TTuY04RWw+J7Htx5gdeY
	4uhh8TChI5wSNCPyWatxhKyPGJoO85chy0BSpmDdDaPizL/9+g1Pth4FWRneSJ8nLUDp
	yOx4271oXf1hjkliOHiAU+5v91ry2j9gLIhbfkeZVL7Fzd4bnyHPIdv6Oa6eUwRoK4S5
	Xd9zdNmZrgXbUYcV48B7zuuag/GwDtviNf5FKEsmyhatGoTujZyVE84jU8ylZCH7HTm4
	ZwhXsC125FmE+BxLccEW7j8kJRkYaX9DzPqcV6mVzxTTgbvaCxZmePGruWZDJtubC552
	6quA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qIM6yKYNRp0e5e29HWwEwdRU7anfT47HhVX5+DJk9lc=;
	b=l6DlkKsXse1e1nGcQwiadPbR2lUIvjLcrguy4Ekeai6dhMGDo7huKLnk2SojVRvkoY
	ggkoCDHJJPhpGr4nPbhR3y+LCF5wgQCHIU7i6dJLJLCdTaqh4mu3SFT0krVMasew47oY
	24wTisX6PqmpsiAM0+7RSYQ+EUxCbXwt3AccCYvS8LcEAVyj6iYJ2bIy2Utd+EzfMdph
	fsW4Voqg9hRImvxsu6EFzFBhyPwEVPs6jg2bNqytqF5rNTcDJ0Bh/dw8tJoZP4t+3vcU
	z68OPpfiGbcEnbCy4QNAkxuivasLsg1BN6hQHrypScCpjJS1fjjQaCnNDLOtwlU9u0Nj
	OKPw==
X-Gm-Message-State: APjAAAX34j6EvdlIQ8hCDdaPLoadA7ys75XwNEKySFq2GzBTR/pvu8bP
	do/y2Hslv2smNVnxQsZhfdpNIQAL5wtEY1cmq/udOcXm
X-Google-Smtp-Source: APXvYqw+4KK1RyTCZUeCL+Vuk/OBBjYAsqtNkwWdF3XpmwW1qw8T/bW7u9/y82Lx1PTVDs7ivKJXXT3YegvI9oDD4TY=
X-Received: by 2002:a5e:a708:: with SMTP id b8mr405900iod.25.1562795817539;
	Wed, 10 Jul 2019 14:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190710123401.16646-1-ross.burton@intel.com>
	<866a7e8b0d4684ed176b6b349f87a40a609436c7.camel@linuxfoundation.org>
In-Reply-To: <866a7e8b0d4684ed176b6b349f87a40a609436c7.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Jul 2019 22:56:43 +0100
Message-ID: <CAJTo0LZZAfNEMiOjJ=ur+YATKPp7tmFgfc6EmwPJSoCgYYyVHA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/recipetool: change the CMake test to use taglib
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
X-List-Received-Date: Wed, 10 Jul 2019 21:56:57 -0000
Content-Type: text/plain; charset="UTF-8"

Helpful when I commit all of the changes isn't it...

On Wed, 10 Jul 2019 at 22:22, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-07-10 at 13:34 +0100, Ross Burton wrote:
> > The current test builds Navit, which uses GTK+ 2.  As GTK+ 2 is being removed
> > from oe-core, change the test to build taglib instead.
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/lib/oeqa/selftest/cases/recipetool.py | 19 ++++++++-----------
> >  1 file changed, 8 insertions(+), 11 deletions(-)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
> > index e3f5c71666f..1c701a40bf0 100644
> > --- a/meta/lib/oeqa/selftest/cases/recipetool.py
> > +++ b/meta/lib/oeqa/selftest/cases/recipetool.py
> > @@ -406,22 +406,19 @@ class RecipetoolTests(RecipetoolBase):
> >          self._test_recipe_contents(os.path.join(temprecipe, dirlist[0]), checkvars, inherits)
> >
> >      def test_recipetool_create_cmake(self):
> > -        bitbake('-c packagedata gtk+')
> > -
> > -        # Try adding a recipe
> >          temprecipe = os.path.join(self.tempdir, 'recipe')
> >          os.makedirs(temprecipe)
> > -        recipefile = os.path.join(temprecipe, 'navit_0.5.0.bb')
> > -        srcuri = 'http://downloads.yoctoproject.org/mirror/sources/navit-0.5.0.tar.gz'
> > +        recipefile = os.path.join(temprecipe, 'taglib_1.11.1.bb')
> > +        srcuri = 'http://taglib.github.io/releases/taglib-1.11.1.tar.gz'
> >          result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
> >          self.assertTrue(os.path.isfile(recipefile))
> >          checkvars = {}
> > -        checkvars['LICENSE'] = set(['Unknown', 'GPLv2', 'LGPLv2'])
> > -        checkvars['SRC_URI'] = 'http://downloads.yoctoproject.org/mirror/sources/navit-${PV}.tar.gz'
> > -        checkvars['SRC_URI[md5sum]'] = '242f398e979a6b8c0f3c802b63435b68'
> > -        checkvars['SRC_URI[sha256sum]'] = '13353481d7fc01a4f64e385dda460b51496366bba0fd2cc85a89a0747910e94d'
> > -        checkvars['DEPENDS'] = set(['freetype', 'zlib', 'openssl', 'glib-2.0', 'virtual/libgl', 'virtual/egl', 'gtk+', 'libpng', 'libsdl', 'freeglut', 'dbus-glib', 'fribidi'])
> > -        inherits = ['cmake', 'python-dir', 'gettext', 'pkgconfig']
> > +        checkvars['LICENSE'] = set(['LGPLv2.1', 'MPL-1.1'])
> > +        checkvars['SRC_URI'] = 'http://taglib.github.io/releases/taglib-${PV}.tar.gz'
> > +        checkvars['SRC_URI[md5sum]'] = 'cee7be0ccfc892fa433d6c837df9522a'
> > +        checkvars['SRC_URI[sha256sum]'] = 'b6d1a5a610aae6ff39d93de5efd0fdc787aa9e9dc1e7026fa4c961b26563526b'
> > +        checkvars['DEPENDS'] = set(['boost', 'zlib'])
> > +        inherits = ['cmake']
> >          self._test_recipe_contents(recipefile, checkvars, inherits)
> >
> >      def test_recipetool_create_github(self):
> >
>
>
> 2019-07-10 19:33:07,067 - oe-selftest - INFO - ======================================================================
> 2019-07-10 19:33:07,067 - oe-selftest - INFO - FAIL: recipetool.RecipetoolTests.test_recipetool_create_cmake (subunit.RemotedTestCase)
> 2019-07-10 19:33:07,068 - oe-selftest - INFO - ----------------------------------------------------------------------
> 2019-07-10 19:33:07,068 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/recipetool.py", line 422, in test_recipetool_create_cmake
>     self._test_recipe_contents(recipefile, checkvars, inherits)
>   File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/devtool.py", line 172, in _test_recipe_contents
>     self.assertEqual(value, needvalue, 'values for %s do not match' % var)
>   File "/usr/lib/python3.5/unittest/case.py", line 821, in assertEqual
>     assertion_func(first, second, msg=msg)
>   File "/usr/lib/python3.5/unittest/case.py", line 1073, in assertSetEqual
>     self.fail(self._formatMessage(msg, standardMsg))
>   File "/usr/lib/python3.5/unittest/case.py", line 666, in fail
>     raise self.failureException(msg)
> AssertionError: Items in the first set but not the second:
> 'Unknown'
> Items in the second set but not the first:
> 'MPL-1.1' : values for LICENSE do not match
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/283
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/284
>
> etc.
>
> Cheers,
>
> Richard
>

