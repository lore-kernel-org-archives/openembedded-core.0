Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id E9FA360D40
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 18:18:39 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id x18so196116vsq.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 10:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VS/P3TDRZ7ynh0S3zYgW6+zB6tch/sDSmfxr8EIxiv0=;
	b=B+NEYSoFBMFS253okfoRcxs5hreApzsXnyDzjZ02FTl7LTBrGtNPUxmH99eB679dwn
	4txI1N8wwgzZh1eMKvIc4CcvDYZJhEmNjivfaL+lQz23/jfiBG2aX4dAbKeV1BjndlG8
	t25YF3qqHYNA5XmMTyCvECVuXwv5pGFYv+mRGRylhZBogtmCQ9Tn29/GMOrkPHlv4gYL
	HU2taTlvP3Nh6Q7i1V71QMqBSmdfdbDIEXM1uMEw9yOBj7zLOwAI9yaGS0Ba2Y+0zKXc
	kJ0AMRtEKsUBo+s0kAoOsuq6WLTcJx4L1ibrnuqLb+rbHs3o8tXe5vHoAbtb3nGmVHtl
	dvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VS/P3TDRZ7ynh0S3zYgW6+zB6tch/sDSmfxr8EIxiv0=;
	b=F3LR+FeQs8e8aPdXSBg/XpdUxa3el79UBDFQtTVy+q4YLRPqC/b2uwOA4a1FAYFlxd
	aZc3bcXnTapa8+zv1qxlSx60paLYNoG+Xcb9SpktEVnEnAHGYufFeaNKSGHm8viET3Mt
	UlgWkbQkkMZY7ecO+pBzLBQzGhuwA4A4mnyZfR/6oYIco5V/j6PBjlnguf1zlPqOnNfp
	pDavUn5pFjpD9rtsx2Ur/JkS9FRlUtcjJtkg2I27YPVlh55x+jwbQ/xUeW+hGk8EU5hN
	vs2jzQC4pYtje+3B7CVlfQ0H4fJ+RxFX5eOL+0thdm3+sB650iFAKyqM6mTJEpnsBXSs
	Y32A==
X-Gm-Message-State: APjAAAVtndfJaAEc5JkLx0QDEs1NEmy5j6lkBOdg24JBILzM4YVw8L5d
	w9bV0LrCQIoUkvxC6V0evfhIu3kVdstp7sVfIW8=
X-Google-Smtp-Source: APXvYqxaVAqVicCvc8uioh1gD7N1Y8AcYzDAqBlKvD9+Eb4iSzO4OGCDWYZmD7YDWIo7erGQ4+oN2nMtvAnegkiOY3s=
X-Received: by 2002:a67:ee4e:: with SMTP id g14mr271273vsp.223.1581099520667; 
	Fri, 07 Feb 2020 10:18:40 -0800 (PST)
MIME-Version: 1.0
References: <20200205054120.1461132-1-raj.khem@gmail.com>
	<20200205054120.1461132-2-raj.khem@gmail.com>
	<396189a7541b8b73d5bfff4949d9873ab5079fd2.camel@linuxfoundation.org>
In-Reply-To: <396189a7541b8b73d5bfff4949d9873ab5079fd2.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 7 Feb 2020 10:18:29 -0800
Message-ID: <CAJ86T=U-i3H09en6j0k5jfs+_cFakRyKPMsTpr-ieHNAgOmPzg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] oeqa: autoreconf cpio before building
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
X-List-Received-Date: Fri, 07 Feb 2020 18:18:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 7, 2020 at 10:09 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2020-02-04 at 21:41 -0800, Khem Raj wrote:
> > since the versions of autotools might differ in OE especially
> > so recreate config.h.in, aclocal.m4, configure, and Makefile.in
> >
> > [YOCTO #13779]
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/lib/oeqa/runtime/cases/buildcpio.py | 2 +-
> >  meta/lib/oeqa/sdk/cases/buildcpio.py     | 1 +
> >  meta/lib/oeqa/selftest/cases/meta_ide.py | 2 +-
> >  3 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py
> > b/meta/lib/oeqa/runtime/cases/buildcpio.py
> > index 4bd72dd37e..9cc261c314 100644
> > --- a/meta/lib/oeqa/runtime/cases/buildcpio.py
> > +++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
> > @@ -27,6 +27,6 @@ class BuildCpioTest(OERuntimeTestCase):
> >      @OEHasPackage(['autoconf'])
> >      def test_cpio(self):
> >          self.project.download_archive()
> > -        self.project.run_configure()
> > +        self.project.run_configure('','autoreconf --force;')
> >          self.project.run_make()
> >          self.project.run_install()
> > diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py
> > b/meta/lib/oeqa/sdk/cases/buildcpio.py
> > index b0beafb38f..ec10149d34 100644
> > --- a/meta/lib/oeqa/sdk/cases/buildcpio.py
> > +++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
> > @@ -28,6 +28,7 @@ class BuildCpioTest(OESDKTestCase):
> >              self.assertTrue(os.path.isdir(dirs["source"]))
> >              os.makedirs(dirs["build"])
> >
> > +            self._run("cd {source} && autoreconf --force")
> >              self._run("cd {build} && {source}/configure
> > $CONFIGURE_FLAGS".format(**dirs))
> >              self._run("cd {build} && make -j".format(**dirs))
> >              self._run("cd {build} && make install
> > DESTDIR={install}".format(**dirs))
> > diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py
> > b/meta/lib/oeqa/selftest/cases/meta_ide.py
> > index 809142559a..46398c7e2d 100644
> > --- a/meta/lib/oeqa/selftest/cases/meta_ide.py
> > +++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
> > @@ -43,7 +43,7 @@ class MetaIDE(OESelftestTestCase):
> >                          "
> > https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.gz",
> >                          self.tmpdir_metaideQA, self.td['DATETIME'],
> > dl_dir=dl_dir)
> >          self.project.download_archive()
> > -        self.assertEqual(self.project.run_configure(), 0,
> > +        self.assertEqual(self.project.run_configure('','autoreconf
> > --force;'), 0,
> >                          msg="Running configure failed")
> >          self.assertEqual(self.project.run_make(), 0,
> >                          msg="Running make failed")
> > --
> > 2.25.0
>
> This breaks the SDK everywhere:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/1552/steps/8/logs/step2c
>
> (and many more)

Configuring with --disable-maintainer-mode might be a better fix for
the original problem?

  https://www.gnu.org/software/automake/manual/html_node/maintainer_002dmode.html

